Return-Path: <SRS0=DVVK=FE=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2CC84C64E7B
	for <linux-mediatek@archiver.kernel.org>; Mon, 30 Nov 2020 23:14:49 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8B19920725
	for <linux-mediatek@archiver.kernel.org>; Mon, 30 Nov 2020 23:14:48 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="qGb//18k";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="jLJRS2uh"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 8B19920725
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linaro.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=sIU6rgBthH/sFdT7yYxG/l6vT3rCpokH05GBEH9hvzU=; b=qGb//18kqQRQEe7PHbrTusrGu
	NqNUfntotZCL14aqI10L9dy6tEm5oyiluO8pAldzWMtwOPq8ABFRPFCp9QknYa0ABrMAY7tnvS/t0
	lL+gnfL1CpgwBb/o0YKW5xZ8mrt0hHZ3GXDC8DxZn1FEC4lHIVwTll5xwAPA1Ew1+RmciVaTunQNI
	Hz9ANB8Lsdc/dp0CbPFviUXwPEjUrbWAOUyfTID8TfPjsucVyXyZbjWBlkrkI1LQhdFqH8u8oBWNj
	kRCsxtDSbD3cnABycTT+Zws323LKdunPHCQoV1QCWDSiz87u917/gpPgCkh+AI97mu//0cGbHbIi0
	cpNxI0TVg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kjsNY-0000H7-6L; Mon, 30 Nov 2020 23:14:44 +0000
Received: from mail-ot1-x341.google.com ([2607:f8b0:4864:20::341])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kjsNW-0000GF-GM
 for linux-mediatek@lists.infradead.org; Mon, 30 Nov 2020 23:14:43 +0000
Received: by mail-ot1-x341.google.com with SMTP id f16so13015562otl.11
 for <linux-mediatek@lists.infradead.org>; Mon, 30 Nov 2020 15:14:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=SSKJSpxsVwWxMbkBOUhoAnw1WjSpJJeYO6XDL2pKUQk=;
 b=jLJRS2uheUkshieEj6RPx7EDm843FDmZasOakaCRbxDkYzb6V/dCVEYCGtVic3OD0M
 Gx47VqrX16+W+ILvyuM9BcguvqlCbJvulRJRir863SLnZk77KQaU1dI8TBoZI9AG5ukC
 KxOCNCIDLq7dPd2Cn/AfkrYD2tGPT7SCNfiNXDhdoBvAjac62TVkTBG2lNney8lz4Rdq
 5rcBDg1qxlrJsWd/3IhorfoqNxiDUANC4AIFd9hK8jMqszKy7aNBUnx87VLrm4CKHM0B
 Jf+L/M5HnewgUPvHu434S98JDKOfsf30u7qhhGnwj4DtkqkfxWNSCicaSCJamhvVUWCQ
 smrQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=SSKJSpxsVwWxMbkBOUhoAnw1WjSpJJeYO6XDL2pKUQk=;
 b=Ab3o68C4Z6SOWkYhVyWvjBXjd0336ZWlG2n56Yj63zU6EFy8pl7vVko2AL3a0cKELP
 KjBDRBvxJHs9BRbQXnLWCfefCMsC+a2nfs6AjE3QEy9cpGSt2J3A0pWDSCQTNUA0RHwH
 doNDzA+aBrWWyoQOk+9wsg3+LxeyY5pKGYdifM/r46DW/y6xxlQYnV09ffqzK+UqTUHz
 ZuVOvaNVLrSbY5Suw0rHLOLCYwd1eVU7bmXp8FF7G2K577sGLR/jieQSuHk2DH3IqoXr
 RRZwXqO+c9Rv6oojHKrEl0Anoq1kIl864EWlnOGY6GjENTZSUzeK9JdW48scogUyTFwK
 8O1w==
X-Gm-Message-State: AOAM530XqeAz9Qi8aeKVZcaMLMeoco3EgGREEvgVz5bOHgfuQQn8jKSh
 C1jyEWvcOE8DZm9MzMRsITdikQ==
X-Google-Smtp-Source: ABdhPJx8qwzmA4UFNrNr1ilDGpNjqNdr64PU6fU1EJcmd1XdNPi7emY2JwPOHcMUdjgC59CyPWzLEQ==
X-Received: by 2002:a05:6830:1e6f:: with SMTP id
 m15mr18139161otr.253.1606778080201; 
 Mon, 30 Nov 2020 15:14:40 -0800 (PST)
Received: from builder.lan (104-57-184-186.lightspeed.austtx.sbcglobal.net.
 [104.57.184.186])
 by smtp.gmail.com with ESMTPSA id e5sm9218917otl.75.2020.11.30.15.14.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 30 Nov 2020 15:14:39 -0800 (PST)
Date: Mon, 30 Nov 2020 17:14:37 -0600
From: Bjorn Andersson <bjorn.andersson@linaro.org>
To: "Asutosh Das (asd)" <asutoshd@codeaurora.org>
Subject: Re: [RFC PATCH v1] scsi: ufs: Remove pre-defined initial VCC voltage
 values
Message-ID: <X8V83T+Tx6teNLOR@builder.lan>
References: <20201130091610.2752-1-stanley.chu@mediatek.com>
 <568660cd-80e6-1b8f-d426-4614c9159ff4@codeaurora.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <568660cd-80e6-1b8f-d426-4614c9159ff4@codeaurora.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201130_181442_702439_764D06F9 
X-CRM114-Status: GOOD (  31.38  )
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
Cc: nguyenb@codeaurora.org, matthias.bgg@gmail.com, cang@codeaurora.org,
 alim.akhtar@samsung.com, beanhuo@micron.com, bvanassche@acm.org,
 linux-scsi@vger.kernel.org, peter.wang@mediatek.com, cc.chou@mediatek.com,
 andy.teng@mediatek.com, jejb@linux.ibm.com, chun-hung.wu@mediatek.com,
 avri.altman@wdc.com, linux-mediatek@lists.infradead.org,
 jiajie.hao@mediatek.com, Stanley Chu <stanley.chu@mediatek.com>,
 chaotian.jing@mediatek.com, linux-arm-kernel@lists.infradead.org,
 martin.petersen@oracle.com, kuohong.wang@mediatek.com,
 linux-kernel@vger.kernel.org, alice.chao@mediatek.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Mon 30 Nov 16:51 CST 2020, Asutosh Das (asd) wrote:

> On 11/30/2020 1:16 AM, Stanley Chu wrote:
> > UFS specficication allows different VCC configurations for UFS devices,
> > for example,
> > 	(1). 2.70V - 3.60V (By default)
> > 	(2). 1.70V - 1.95V (Activated if "vcc-supply-1p8" is declared in
> >                            device tree)
> > 	(3). 2.40V - 2.70V (Supported since UFS 3.x)
> > 
> > With the introduction of UFS 3.x products, an issue is happening that
> > UFS driver will use wrong "min_uV/max_uV" configuration to toggle VCC
> > regulator on UFU 3.x products with VCC configuration (3) used.
> > 
> > To solve this issue, we simply remove pre-defined initial VCC voltage
> > values in UFS driver with below reasons,
> > 
> > 1. UFS specifications do not define how to detect the VCC configuration
> >     supported by attached device.
> > 
> > 2. Device tree already supports standard regulator properties.
> > 
> > Therefore VCC voltage shall be defined correctly in device tree, and
> > shall not be changed by UFS driver. What UFS driver needs to do is simply
> > enabling or disabling the VCC regulator only.
> > 
> > This is a RFC conceptional patch. Please help review this and feel
> > free to feedback any ideas. Once this concept is accepted, and then
> > I would post a more completed patch series to fix this issue.
> > 
> > Signed-off-by: Stanley Chu <stanley.chu@mediatek.com>
> > ---
> >   drivers/scsi/ufs/ufshcd-pltfrm.c | 10 +---------
> >   1 file changed, 1 insertion(+), 9 deletions(-)
> > 
> > diff --git a/drivers/scsi/ufs/ufshcd-pltfrm.c b/drivers/scsi/ufs/ufshcd-pltfrm.c
> > index a6f76399b3ae..3965be03c136 100644
> > --- a/drivers/scsi/ufs/ufshcd-pltfrm.c
> > +++ b/drivers/scsi/ufs/ufshcd-pltfrm.c
> > @@ -133,15 +133,7 @@ static int ufshcd_populate_vreg(struct device *dev, const char *name,
> >   		vreg->max_uA = 0;
> >   	}
> > -	if (!strcmp(name, "vcc")) {
> > -		if (of_property_read_bool(np, "vcc-supply-1p8")) {
> > -			vreg->min_uV = UFS_VREG_VCC_1P8_MIN_UV;
> > -			vreg->max_uV = UFS_VREG_VCC_1P8_MAX_UV;
> > -		} else {
> > -			vreg->min_uV = UFS_VREG_VCC_MIN_UV;
> > -			vreg->max_uV = UFS_VREG_VCC_MAX_UV;
> > -		}
> > -	} else if (!strcmp(name, "vccq")) {
> > +	if (!strcmp(name, "vccq")) {
> >   		vreg->min_uV = UFS_VREG_VCCQ_MIN_UV;
> >   		vreg->max_uV = UFS_VREG_VCCQ_MAX_UV;
> >   	} else if (!strcmp(name, "vccq2")) {
> > 
> 
> Hi Stanley
> 
> Thanks for the patch. Bao (nguyenb) was also working towards something
> similar.
> Would it be possible for you to take into account the scenario in which the
> same platform supports both 2.x and 3.x UFS devices?
> 
> These've different voltage requirements, 2.4v-3.6v.
> I'm not sure if standard dts regulator properties can support this.
> 

What is the actual voltage requirement for these devices and how does
the software know what voltage to pick in this range?

Regards,
Bjorn

> -asd
> 
> 
> -- 
> The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
> Linux Foundation Collaborative Project

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
