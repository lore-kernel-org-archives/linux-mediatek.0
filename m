Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 57051C00140
	for <linux-mediatek@archiver.kernel.org>; Wed,  3 Aug 2022 02:45:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:MIME-Version:Date:Message-ID:From:References:CC:To:
	Subject:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=0ZwCbeYt0KnTLhf5LZitT6V6Fiu9uyNKCZt/mrpwMCE=; b=ps8EVnZrTfqPMO9y+jbbiEjY+i
	r592aONq48wps7OJhktm87kc5+21yt9ovD2DMqftI+IacKoKTUXX5Z4VfSEbJ9jZq+JrM7tGlzOKG
	v8FF02F5eWsgJj5m0GFYaGlAJ7h7LacMnSanCumjVzhiyLr44+wwAiq51VWyYgAkhNEdUeXFfvY7z
	p2CL62yr0YrEJKDv05h/rQaxu1grMw4EZT31yrCSGHKPhePNY/+MAAuPjRftDPYXjIbXlRXvwGKa4
	mv8fwPJlNZafgxPx1eOVo04piSzu+qpV+D2eDO+qFaDcjpaTwHF93ugIvZE3lpTVB5tp11P2WWG1f
	6ENB2uAQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oJ4Nw-001kJL-Tw; Wed, 03 Aug 2022 02:45:24 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oJ4Nq-001kH2-T6
	for linux-mediatek@lists.infradead.org; Wed, 03 Aug 2022 02:45:23 +0000
X-UUID: 2cdaa44e66104bcf8bc40155fe4cadad-20220802
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.8,REQID:66276d86-8bcb-4a4d-879e-51db1e410b90,OB:0,LO
	B:0,IP:0,URL:5,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,RULE:Release_Ham,ACTI
	ON:release,TS:5
X-CID-META: VersionHash:0f94e32,CLOUDID:20ef10d1-841b-4e95-ad42-8f86e18f54fc,C
	OID:IGNORED,Recheck:0,SF:nil,TC:nil,Content:0,EDM:-3,IP:nil,URL:1,File:nil
	,QS:nil,BEC:nil,COL:0
X-UUID: 2cdaa44e66104bcf8bc40155fe4cadad-20220802
Received: from mtkmbs11n2.mediatek.inc [(172.21.101.187)] by mailgw01.mediatek.com
	(envelope-from <peter.wang@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1568479437; Tue, 02 Aug 2022 19:45:14 -0700
Received: from mtkmbs11n2.mediatek.inc (172.21.101.187) by
 mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.792.15; Wed, 3 Aug 2022 10:44:38 +0800
Received: from [172.21.84.99] (172.21.84.99) by mtkmbs11n2.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.2.792.15 via Frontend
 Transport; Wed, 3 Aug 2022 10:44:38 +0800
Subject: Re: [PATCH v3 1/2] ufs: core: introduce a choice of wb toggle during
 clock scaling
To: Bart Van Assche <bvanassche@acm.org>, <stanley.chu@mediatek.com>,
	<linux-scsi@vger.kernel.org>, <martin.petersen@oracle.com>,
	<avri.altman@wdc.com>, <alim.akhtar@samsung.com>, <jejb@linux.ibm.com>
CC: <wsd_upstream@mediatek.com>, <linux-mediatek@lists.infradead.org>,
	<chun-hung.wu@mediatek.com>, <alice.chao@mediatek.com>,
	<cc.chou@mediatek.com>, <chaotian.jing@mediatek.com>,
	<jiajie.hao@mediatek.com>, <powen.kao@mediatek.com>,
	<qilin.tan@mediatek.com>, <lin.gui@mediatek.com>
References: <20220802143223.1276-1-peter.wang@mediatek.com>
 <20220802143223.1276-2-peter.wang@mediatek.com>
 <06b8cb30-f308-63bd-b073-83c9add87cd3@acm.org>
From: Peter Wang <peter.wang@mediatek.com>
Message-ID: <c274594e-71e9-a795-0018-592c30c18a32@mediatek.com>
Date: Wed, 3 Aug 2022 10:44:38 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <06b8cb30-f308-63bd-b073-83c9add87cd3@acm.org>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220802_194519_245941_7E0A6888 
X-CRM114-Status: GOOD (  20.42  )
X-BeenThere: linux-mediatek@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-mediatek.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mediatek>,
 <mailto:linux-mediatek-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mediatek/>
List-Post: <mailto:linux-mediatek@lists.infradead.org>
List-Help: <mailto:linux-mediatek-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mediatek>,
 <mailto:linux-mediatek-request@lists.infradead.org?subject=subscribe>
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Hi Bart,

On 8/3/22 2:44 AM, Bart Van Assche wrote:
> On 8/2/22 07:32, peter.wang@mediatek.com wrote:
>> +    /* Allow WB with clk scaling */
>
> This comment is misleading. Consider changing this comment into 
> something like "Enable WB when scaling up the clock and disable WB 
> when scaling the clock down".

Will change comment next version, thanks.

>
>> + UFSHCD_CAP_WB_WITH_CLK_SCALING            = 1 << 12,
>
> Whether or not the WriteBooster is toggled when the clock is scaled is 
> not a host controller capability. It is a policy that is tied by this 
> patch to the host controller. So I think that using the "UFSHCD_CAP_" 
> prefix is misleading. Consider using e.g. the prefix UFSHCD_POLICY_.
>
The prefix UFSHCD_CAP_ is used in ufshcd_caps and not all of them is 
host capability.
Ex. UFSHCD_CAP_HIBERN8_WITH_CLK_GATING is a policy host send hiberb8 
with clk gating or not.
Ex. UFSHCD_CAP_WB_EN is a host policy to turn-on WriteBooster or not.
So, I think it is not suitable to break the naming rule in ufshcd_caps now.


> > +static inline bool ufshcd_can_wb_during_scaling(struct ufs_hba *hba)
> > +{
> > +    return hba->caps & UFSHCD_CAP_WB_WITH_CLK_SCALING;
> > +}
>
> The name of this function is misleading. Consider renaming this 
> function into e.g. ufshcd_enable_wb_if_scaling_up().
>
> Thanks,
>
> Bart.

Will change function name next version.


Thanks.
Peter




