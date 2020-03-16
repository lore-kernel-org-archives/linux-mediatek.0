Return-Path: <SRS0=xc+O=5B=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.3 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,USER_AGENT_SANE_2 autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7D442C0044D
	for <linux-mediatek@archiver.kernel.org>; Mon, 16 Mar 2020 07:08:33 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4018A20658
	for <linux-mediatek@archiver.kernel.org>; Mon, 16 Mar 2020 07:08:33 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="s4KQTS2o";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="BpGDmAXQ"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 4018A20658
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=BClTVQFhU7172xFImTPT3/jDmhNYZ57gm3xOgAnHYnQ=; b=s4KQTS2oBGwhu7
	LYm2qoeS0vKHX4JQosa5AGbYex4orlVwv9i3dBJZWaVOVYDNZjS7RRkhuCR9tqAqqAYDFIpcuK7Cw
	jbEmEzdFdI1VItJCmFVfy2womsNYwJvRJA2v42bhKsVuyTa8XsJJQWz74ORDz12GU/iH1wU113BKM
	XDC9B7YLfGoDk+LuwZ94ZusLaIZrcWdegVpg9OrMBxJi1+aDMOK3EazCfFYHqEycygJbUTRRe4lnK
	FOqwLrAe4Jf6ssXd3bEfr5NYDwEBZvMWlLn6AMEc33P2LMyLn1PidEPmn4UDq/7xD+frPVdVwSpX5
	yKLhJotGO/ZGoiN+h8HA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jDjrK-0005FX-K7; Mon, 16 Mar 2020 07:08:22 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jDjrH-0005Ei-SM; Mon, 16 Mar 2020 07:08:21 +0000
X-UUID: f6c7d6a3a48247bba713358b62d20c56-20200315
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID;
 bh=dau95JaNBGsRunTGBlpYGDM3JLIWHp3+4y4tNiux/2U=; 
 b=BpGDmAXQShE3p/Mx8LKdOiQqUicz4QnmplojYZIxOeNrkR811wDSTmULr7hR3BaU6XsbhvpfEfDFXbgQgRBSivkElfFnZPEq1JfZMcyuSZCfrq8YplhJslOemcJOGinVkbCxZmWGi9OHWMXY7oaeda19he2Lv1JE/i9ViCW+mLU=;
X-UUID: f6c7d6a3a48247bba713358b62d20c56-20200315
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw01.mediatek.com
 (envelope-from <stanley.chu@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLS)
 with ESMTP id 1196337945; Sun, 15 Mar 2020 23:08:14 -0800
Received: from MTKMBS02N2.mediatek.inc (172.21.101.101) by
 MTKMBS62N1.mediatek.inc (172.29.193.41) with Microsoft SMTP Server (TLS) id
 15.0.1395.4; Mon, 16 Mar 2020 00:08:30 -0700
Received: from mtkcas07.mediatek.inc (172.21.101.84) by
 mtkmbs02n2.mediatek.inc (172.21.101.101) with Microsoft SMTP Server (TLS) id
 15.0.1395.4; Mon, 16 Mar 2020 15:05:15 +0800
Received: from [172.21.84.99] (172.21.84.99) by mtkcas07.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1395.4 via Frontend
 Transport; Mon, 16 Mar 2020 15:07:28 +0800
Message-ID: <1584342487.14250.11.camel@mtksdccf07>
Subject: Re: [PATCH v5 2/8] scsi: ufs: remove init_prefetch_data in struct
 ufs_hba
From: Stanley Chu <stanley.chu@mediatek.com>
To: Can Guo <cang@codeaurora.org>
Date: Mon, 16 Mar 2020 15:08:07 +0800
In-Reply-To: <51fde835f4f03fcca6e83ba6d3579f2e@codeaurora.org>
References: <20200316034218.11914-1-stanley.chu@mediatek.com>
 <20200316034218.11914-3-stanley.chu@mediatek.com>
 <51fde835f4f03fcca6e83ba6d3579f2e@codeaurora.org>
X-Mailer: Evolution 3.2.3-0ubuntu6 
MIME-Version: 1.0
X-TM-SNTS-SMTP: 91130EEECD614F04B26B8D968427210292287D7953CE94BE6ED417119E909D972000:8
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200316_000819_925214_872B06FA 
X-CRM114-Status: UNSURE (   9.08  )
X-CRM114-Notice: Please train this message.
X-BeenThere: linux-mediatek@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-mediatek.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mediatek>, 
 <mailto:linux-mediatek-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mediatek/>
List-Post: <mailto:linux-mediatek@lists.infradead.org>
List-Help: <mailto:linux-mediatek-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mediatek>, 
 <mailto:linux-mediatek-request@lists.infradead.org?subject=subscribe>
Cc: bvanassche@acm.org, linux-scsi@vger.kernel.org, andy.teng@mediatek.com,
 jejb@linux.ibm.com, chun-hung.wu@mediatek.com, kuohong.wang@mediatek.com,
 linux-kernel@vger.kernel.org, avri.altman@wdc.com, martin.peter~sen@oracle.com,
 linux-mediatek@lists.infradead.org, peter.wang@mediatek.com,
 alim.akhtar@samsung.com, matthias.bgg@gmail.com, beanhuo@micron.com,
 linux-arm-kernel@lists.infradead.org, asutoshd@codeaurora.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Hi Can,

On Mon, 2020-03-16 at 14:25 +0800, Can Guo wrote:
> On 2020-03-16 11:42, Stanley Chu wrote:
> > Struct init_prefetch_data currently is used privately in
> > ufshcd_init_icc_levels(), thus it can be removed from struct ufs_hba.
> > 
> > Signed-off-by: Stanley Chu <stanley.chu@mediatek.com>
> > Reviewed-by: Asutosh Das <asutoshd@codeaurora.org>
> > Reviewed-by: Avri Altman <avri.altman@wdc.com>
> 
> Hi Stanley,
> 
> Earlier, I have one similar patch for this, but it does more than this.
> Please check the mail I just sent.
> 
> Thanks,
> Can Guo.

OK! Thanks to remind me this. Then I can drop this cleanup patch #2 in
its series to not conflict with your proposed one.

Thanks,
Stanley Chu


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
