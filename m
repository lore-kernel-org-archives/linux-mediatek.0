Return-Path: <SRS0=Og7P=FG=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	URIBL_BLOCKED,USER_AGENT_SANE_2 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B01E7C64E8A
	for <linux-mediatek@archiver.kernel.org>; Wed,  2 Dec 2020 08:22:55 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 494AB20DD4
	for <linux-mediatek@archiver.kernel.org>; Wed,  2 Dec 2020 08:22:55 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 494AB20DD4
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Date:To:From:
	Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=9CirVG7z//J30+F5z9UGpiNwtrO7q6MNXUaenbmeviE=; b=zar/fHDmqwtAdnjbEwoUSLkka
	/JOv0yHwArYy2XUJv+shWxC21SY/g6l40yJp/JeGu3h0mR56O7FIEnyNaP0JlZoLFzpHQXngALFcR
	7hkZ4hhbaadmdVU0KtN0oW8Vxz6pYjNTCYqzZK+Jv2SFaJihAIdzUhiiX82CaFvg1SncEDZqiBp/f
	92t8ro9fcA7v5Rbgof50zIe+039UOHHktMf5sCJwgCTTlH23oBUJolhuOp51kZMkJzsizP5J4uOOL
	IS2s7rk0LFS8gNNTdCSCCFLPSmakI2Pbhf363O/ZItvM+OPbgzN/vMuA2rCLbelcEo1G6O5/Oh3Pc
	rPv8sCzgg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kkNPT-00072D-NE; Wed, 02 Dec 2020 08:22:47 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kkNPP-0006z8-I3; Wed, 02 Dec 2020 08:22:46 +0000
X-UUID: ae2d5bb50b664c39b44d005106234aad-20201202
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID;
 bh=eW3bJobgy0k/p95VGblYVIXoRiGa/RVCmghE8dcbJ9Y=; 
 b=WFNd0ndneFa6baOFFO3+I7ZodIBKDaikfN8gIL3/7urddhKUPaNWcVxfR7GC33X0uHgkJ698E8f7zTDan1LF8TEJkbdTj8rGgX4xXcccCyQlPTCYObf1/JX9Kajqr3cwxgvaqbr2PTflv8xgJyEfx+skHSYR7Fbdr1tFnQohXg8=;
X-UUID: ae2d5bb50b664c39b44d005106234aad-20201202
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw02.mediatek.com
 (envelope-from <stanley.chu@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1456603812; Wed, 02 Dec 2020 00:22:34 -0800
Received: from MTKMBS02N2.mediatek.inc (172.21.101.101) by
 MTKMBS62N1.mediatek.inc (172.29.193.41) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Wed, 2 Dec 2020 00:22:35 -0800
Received: from MTKCAS06.mediatek.inc (172.21.101.30) by
 mtkmbs02n2.mediatek.inc (172.21.101.101) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Wed, 2 Dec 2020 16:22:33 +0800
Received: from [172.21.77.33] (172.21.77.33) by MTKCAS06.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Wed, 2 Dec 2020 16:22:34 +0800
Message-ID: <1606897354.23925.33.camel@mtkswgap22>
Subject: Re: [PATCH v2] scsi: ufs: Remove pre-defined initial voltage values
 of device powers
From: Stanley Chu <stanley.chu@mediatek.com>
To: <nguyenb@codeaurora.org>
Date: Wed, 2 Dec 2020 16:22:34 +0800
In-Reply-To: <c855aaeb419bc7c124889c5afb0cae71@codeaurora.org>
References: <20201201065114.1001-1-stanley.chu@mediatek.com>
 <c855aaeb419bc7c124889c5afb0cae71@codeaurora.org>
X-Mailer: Evolution 3.2.3-0ubuntu6 
MIME-Version: 1.0
X-TM-SNTS-SMTP: 59F7DD2B71DFE41EF021D9395D5202A7A9640B3088C7A4077DEE432C3854098A2000:8
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201202_032243_825845_927B3CD8 
X-CRM114-Status: GOOD (  27.67  )
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
Cc: bjorn.andersson@linaro.org, matthias.bgg@gmail.com, cang@codeaurora.org,
 alim.akhtar@samsung.com, beanhuo@micron.com, bvanassche@acm.org,
 linux-scsi@vger.kernel.org, peter.wang@mediatek.com, cc.chou@mediatek.com,
 andy.teng@mediatek.com, jejb@linux.ibm.com, chun-hung.wu@mediatek.com,
 avri.altman@wdc.com, linux-mediatek@lists.infradead.org,
 jiajie.hao@mediatek.com, chaotian.jing@mediatek.com,
 linux-arm-kernel@lists.infradead.org, martin.petersen@oracle.com,
 kuohong.wang@mediatek.com, linux-kernel@vger.kernel.org,
 asutoshd@codeaurora.org, alice.chao@mediatek.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Wed, 2020-12-02 at 00:19 -0800, nguyenb@codeaurora.org wrote:
> On 2020-11-30 22:51, Stanley Chu wrote:
> > UFS specficication allows different VCC configurations for UFS devices,
> > for example,
> > 	(1). 2.70V - 3.60V (Activated by default in UFS core driver)
> > 	(2). 1.70V - 1.95V (Activated if "vcc-supply-1p8" is declared in
> >                           device tree)
> > 	(3). 2.40V - 2.70V (Supported since UFS 3.x)
> > 
> > With the introduction of UFS 3.x products, an issue is happening that
> > UFS driver will use wrong "min_uV-max_uV" values to configure the
> > voltage of VCC regulator on UFU 3.x products with the configuration (3)
> > used.
> > 
> > To solve this issue, we simply remove pre-defined initial VCC voltage
> > values in UFS core driver with below reasons,
> > 
> > 1. UFS specifications do not define how to detect the VCC configuration
> >    supported by attached device.
> > 
> > 2. Device tree already supports standard regulator properties.
> > 
> > Therefore VCC voltage shall be defined correctly in device tree, and
> > shall not changed by UFS driver. What UFS driver needs to do is simply
> > enable or disable the VCC regulator only.
> > 
> > Similar change is applied to VCCQ and VCCQ2 as well.
> > 
> > Note that we keep struct ufs_vreg unchanged. This is allow vendors to
> > configure proper min_uV and max_uV of any regulators to make
> > regulator_set_voltage() works during regulator toggling flow.
> > Without specific vendor configurations, min_uV and max_uV will be NULL
> > by default and UFS core driver will enable or disable the regulator
> > only without adjusting its voltage.
> > 
> > Reviewed-by: Bjorn Andersson <bjorn.andersson@linaro.org>
> > Signed-off-by: Stanley Chu <stanley.chu@mediatek.com>
> > ---
> >  drivers/scsi/ufs/ufshcd-pltfrm.c | 16 ----------------
> >  1 file changed, 16 deletions(-)
> > 
> > diff --git a/drivers/scsi/ufs/ufshcd-pltfrm.c 
> > b/drivers/scsi/ufs/ufshcd-pltfrm.c
> > index a6f76399b3ae..09e2f04bf4f6 100644
> > --- a/drivers/scsi/ufs/ufshcd-pltfrm.c
> > +++ b/drivers/scsi/ufs/ufshcd-pltfrm.c
> > @@ -133,22 +133,6 @@ static int ufshcd_populate_vreg(struct device
> > *dev, const char *name,
> >  		vreg->max_uA = 0;
> >  	}
> > 
> > -	if (!strcmp(name, "vcc")) {
> > -		if (of_property_read_bool(np, "vcc-supply-1p8")) {
> > -			vreg->min_uV = UFS_VREG_VCC_1P8_MIN_UV;
> > -			vreg->max_uV = UFS_VREG_VCC_1P8_MAX_UV;
> > -		} else {
> > -			vreg->min_uV = UFS_VREG_VCC_MIN_UV;
> > -			vreg->max_uV = UFS_VREG_VCC_MAX_UV;
> > -		}
> > -	} else if (!strcmp(name, "vccq")) {
> > -		vreg->min_uV = UFS_VREG_VCCQ_MIN_UV;
> > -		vreg->max_uV = UFS_VREG_VCCQ_MAX_UV;
> > -	} else if (!strcmp(name, "vccq2")) {
> > -		vreg->min_uV = UFS_VREG_VCCQ2_MIN_UV;
> > -		vreg->max_uV = UFS_VREG_VCCQ2_MAX_UV;
> > -	}
> > -
> >  	goto out;
> Do we need this "goto out;"?

Will remove it in next version.

Thanks for remind.

Stanley Chu

> 
> > 
> >  out:

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
