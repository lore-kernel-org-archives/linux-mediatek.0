Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8BE36C00144
	for <linux-mediatek@archiver.kernel.org>; Mon,  1 Aug 2022 03:23:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:
	Date:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=U0U0uVHPnyuBwhjzuaiR8xwv/pGZmqrqvsBIUZeMRLQ=; b=0SHNwc1sBx9y23
	jR7AJEHQdUiHiuGk8RLZUDVFp1KTTCdi/XYQOPvd1+7TusZIcz8THWMIBclA2C9fojksqrjS6HPIs
	nojZCIF4yoodQLs6Cdlw/roIZBan96VkypAfPM1uIacplduGTeWIf3bE+oUrkgR6LbR82H3T4kl+x
	12bvLEU6vC+hrPqWej6f+U0yWRNfq7AqCXo1xM5rN0R45Tou0YtLmz/n9fIeh3d+Wg6rR1nCbRBvs
	TtvX5D6mq/qx3tbHPGxigV0Jt+c6vS2cLQK6tFSD+bpq1PXyWluKtHEqIznBuabqnsSxLzINYIY9l
	u4/egliySA+dgkY+MGpA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oIM1h-001CLP-Aq; Mon, 01 Aug 2022 03:23:29 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oIM1c-001CDA-FZ; Mon, 01 Aug 2022 03:23:27 +0000
X-UUID: e6a055b7c0ea4dfab1eaa1647f503ba4-20220731
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.8,REQID:72ec060a-513a-42ea-936a-5d44b171a91f,OB:0,LO
	B:0,IP:0,URL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,RULE:Release_Ham,ACTI
	ON:release,TS:0
X-CID-META: VersionHash:0f94e32,CLOUDID:83c3e8cf-a6cf-4fb6-be1b-c60094821ca2,C
	OID:IGNORED,Recheck:0,SF:nil,TC:nil,Content:0,EDM:-3,IP:nil,URL:0,File:nil
	,QS:nil,BEC:nil,COL:0
X-UUID: e6a055b7c0ea4dfab1eaa1647f503ba4-20220731
Received: from mtkmbs11n1.mediatek.inc [(172.21.101.185)] by mailgw01.mediatek.com
	(envelope-from <zhiyong.tao@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1256034466; Sun, 31 Jul 2022 20:23:11 -0700
Received: from mtkmbs11n2.mediatek.inc (172.21.101.187) by
 mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.792.15; Mon, 1 Aug 2022 11:23:05 +0800
Received: from mhfsdcap04 (10.17.3.154) by mtkmbs11n2.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.2.792.15 via Frontend
 Transport; Mon, 1 Aug 2022 11:23:03 +0800
Message-ID: <9a99a1e95179f3b55dd1236c41a8cd3d9b2ccf18.camel@mediatek.com>
Subject: Re: [PATCH v2] pmic: add mt6366 regulator document
From: zhiyong.tao <zhiyong.tao@mediatek.com>
To: Mark Brown <broonie@kernel.org>
Date: Mon, 1 Aug 2022 11:23:03 +0800
In-Reply-To: <YuJt9SF9Y2UsA4Jc@sirena.org.uk>
References: <20220728062749.18701-1-zhiyong.tao@mediatek.com>
	 <20220728062749.18701-2-zhiyong.tao@mediatek.com>
	 <YuJt9SF9Y2UsA4Jc@sirena.org.uk>
Content-Type: text/plain; charset="UTF-8"
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.2 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220731_202324_597644_514684E0 
X-CRM114-Status: GOOD (  11.84  )
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
Cc: alexandre.belloni@bootlin.com, allen-kh.cheng@mediatek.com, linux-kernel@vger.kernel.org, macpaul.lin@mediatek.com, lee.jones@linaro.org, hsin-hsiung.wang@mediatek.com, linux-rtc@vger.kernel.org, wen.su@mediatek.com, Project_Global_Chrome_Upstream_Group@mediatek.com, devicetree@vger.kernel.org, sean.wang@mediatek.com, zhiyong tao <zhiyong.tao@mediatk.com>, hui.liu@mediatek.com, robh+dt@kernel.org, linux-mediatek@lists.infradead.org, matthias.bgg@gmail.com, eddie.huang@mediatek.com, linux-arm-kernel@lists.infradead.org, a.zummo@towertech.it, sen.chu@mediatek.com, lgirdwood@gmail.com
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Thu, 2022-07-28 at 12:07 +0100, Mark Brown wrote:
> On Thu, Jul 28, 2022 at 02:27:49PM +0800, Zhiyong Tao wrote:
> 
> > +        properties:
> > +          regulator-name:
> > +            pattern:
> > "^v(dram1|core|coresshub|proc11|proc12|gpu|s2|modem|s1)$"
> 
> regulator-name should be free form text for the system integrator to
> describe the use of the supply on their board, no constraints should
> be
> placed on it by the regulator.
Hi Mark,

we put regulator-name here, we describe it by mt6366 datasheet.
we think that it is the common attribute.
So we place it here.

Thanks.


