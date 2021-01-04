Return-Path: <SRS0=ylaU=GH=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B9506C433E0
	for <linux-mediatek@archiver.kernel.org>; Mon,  4 Jan 2021 18:59:27 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 61CE32068D
	for <linux-mediatek@archiver.kernel.org>; Mon,  4 Jan 2021 18:59:27 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 61CE32068D
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linaro.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=WUAEKEbYBbaHdJ7gR+zgU2sNxPyFWDA0BQkCHm9WEkg=; b=sw/kTtbNPL4TE4mKkwv0cloPm
	2ltv7lY6ZUFsfBlax+O36vam/7ISC5/jN/SGlnrDxaQ8UrpgWSdbOP4kx61iypRRsj3vX3V+Zzm6S
	Rw4/lNrjv16vCzRv/QkGbUBxWejfnBpX+P1wWDkpWTSYC1DmZTID9V4277h8R35qoGQvsm9t3fjYo
	a1rHhNFPG37ArgGeO5mQulN4NmpYs63ee0budvFMSCL63HOSMHlz6fm/OfVAFU7eFoY6S4FG/Bfx/
	E26Ojn4Gy374p7IUzZuLQ8JWYruACQRlhPetyPgPgAVsxumQ8sC4tvfgUeJjzRl48l+b/hAAQJLcV
	vTrdiG2tw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kwV4O-0005DH-QS; Mon, 04 Jan 2021 18:59:08 +0000
Received: from mail-ot1-x330.google.com ([2607:f8b0:4864:20::330])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kwV4L-0005Bp-Jc
 for linux-mediatek@lists.infradead.org; Mon, 04 Jan 2021 18:59:06 +0000
Received: by mail-ot1-x330.google.com with SMTP id w3so27004727otp.13
 for <linux-mediatek@lists.infradead.org>; Mon, 04 Jan 2021 10:59:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=uT5KCgk/jZMHf7cRAZ3Gk/Wa2EphxQ+0xFsMXQbfN0o=;
 b=bqRK3JFFGg93mU6uZPWaW5akXaVmSZlkgDvU5fw1iBZ9MPoMudZLGU9073yYQ2I/WZ
 cb16w/QoLwHW5ornVsNvPjULH3bA32uPjZoZjugiNiukbEVLt+GLEmHTE9+UE+tLhtvM
 AXMdawT4Yu4j3xMoZZQ85b6NjKCVhdBHlIAIQ9AhAm1LLKhJU7wxahlvbnL+qQMWpCC/
 vDtbv36sm8UOZdgRztkXZmrxHRpqzojCcabpjbC/ifkhOQaclbEpTO++2yRuXHFf+hWT
 p/U/K/nanu5TYDYAmuVlgx0gf+gLYTjDPYlWcwlEmgpEW0Gt80Y/rHv/ONIIdl8vIi9p
 Seiw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=uT5KCgk/jZMHf7cRAZ3Gk/Wa2EphxQ+0xFsMXQbfN0o=;
 b=rS33WkachCwYnuChPhOVBy54YEkCHMCpVPO+6rzlZQcncOM6DCPWIbrEPxueaAOM18
 ejC/d8pHihYpXOLEGOtu5AepcTJ1fSMRNebcgMV1AsNwjs4gGZZIbbsfngPOyQWv+xfQ
 rPHKaxip/kC0fBx6SH89wh2+qzgQOrwDEonY9HKov/eb02BfUx+ic4d7l2/xIF00VVTA
 FsuH8nCHDA5tZOshyajb54vWibvar5CvuAR1nEbM4utpK37H1t0kuhB+IRSmH9umg/5E
 pN6DCes3kJHqror5F3Vq/IynfxMU4Be6V4jMtsnIFLb1ztUU9cwD5mcKZU/nYVV/613O
 wB6g==
X-Gm-Message-State: AOAM5316H3IpOWxG9roTBD677iqqMnamN29rSuv/AaxX1h3jA4QdZDJc
 7xQSwUBSdyCwFbzQ5zBjKRftFQ==
X-Google-Smtp-Source: ABdhPJykDxuUHbhj9dk8p15JZDFShC0eDuWkVlmDxShYrt0cNWAckEn0sv1uwbialwYTBVLZAunxzA==
X-Received: by 2002:a05:6830:1e16:: with SMTP id
 s22mr51369315otr.110.1609786743465; 
 Mon, 04 Jan 2021 10:59:03 -0800 (PST)
Received: from builder.lan (104-57-184-186.lightspeed.austtx.sbcglobal.net.
 [104.57.184.186])
 by smtp.gmail.com with ESMTPSA id g12sm13323496oos.8.2021.01.04.10.59.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 04 Jan 2021 10:59:02 -0800 (PST)
Date: Mon, 4 Jan 2021 12:59:00 -0600
From: Bjorn Andersson <bjorn.andersson@linaro.org>
To: Can Guo <cang@codeaurora.org>
Subject: Re: [PATCH RFC v4 1/1] scsi: ufs: Fix ufs power down/on specs
 violation
Message-ID: <X/NldGPnKeY0c2uO@builder.lan>
References: <1608644981-46267-1-git-send-email-ziqichen@codeaurora.org>
 <X+ob+FylvPfl3NR/@builder.lan>
 <4c3035c418d0a0c4344be84fb1919314@codeaurora.org>
 <182321abfc98e0cfca071d1ec1255f6d@codeaurora.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <182321abfc98e0cfca071d1ec1255f6d@codeaurora.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210104_135905_663348_8A475076 
X-CRM114-Status: GOOD (  35.20  )
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
Cc: nguyenb@codeaurora.org, Alim Akhtar <alim.akhtar@samsung.com>,
 kwmad.kim@samsung.com, Bean Huo <beanhuo@micron.com>,
 Satya Tangirala <satyat@google.com>, vinholikatti@gmail.com,
 jejb@linux.vnet.ibm.com, Bart Van Assche <bvanassche@acm.org>,
 linux-scsi@vger.kernel.org, Ziqi Chen <ziqichen@codeaurora.org>,
 Andy Gross <agross@kernel.org>, kernel-team@android.com, salyzyn@google.com,
 "open list:ARM/QUALCOMM SUPPORT" <linux-arm-msm@vger.kernel.org>,
 "James E.J. Bottomley" <jejb@linux.ibm.com>, Avri Altman <avri.altman@wdc.com>,
 "moderated list:UNIVERSAL FLASH STORAGE HOST CONTROLLER DRIVER..."
 <linux-mediatek@lists.infradead.org>,
 Matthias Brugger <matthias.bgg@gmail.com>, stanley.chu@mediatek.com,
 "moderated list:ARM/Mediatek SoC support"
 <linux-arm-kernel@lists.infradead.org>, rnayak@codeaurora.org,
 saravanak@google.com, martin.petersen@oracle.com,
 Adrian Hunter <adrian.hunter@intel.com>,
 open list <linux-kernel@vger.kernel.org>, hongwus@codeaurora.org,
 asutoshd@codeaurora.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Mon 28 Dec 19:48 CST 2020, Can Guo wrote:

> On 2020-12-29 09:18, Can Guo wrote:
> > On 2020-12-29 01:55, Bjorn Andersson wrote:
> > > On Tue 22 Dec 07:49 CST 2020, Ziqi Chen wrote:
> > > 
> > > > As per specs, e.g, JESD220E chapter 7.2, while powering
> > > > off/on the ufs device, RST_N signal and REF_CLK signal
> > > > should be between VSS(Ground) and VCCQ/VCCQ2.
> > > > 
> > > > To flexibly control device reset line, refactor the function
> > > > ufschd_vops_device_reset(sturct ufs_hba *hba) to ufshcd_
> > > > vops_device_reset(sturct ufs_hba *hba, bool asserted). The
> > > > new parameter "bool asserted" is used to separate device reset
> > > > line pulling down from pulling up.
> > > > 
> > > > Cc: Kiwoong Kim <kwmad.kim@samsung.com>
> > > > Cc: Stanley Chu <stanley.chu@mediatek.com>
> > > > Signed-off-by: Ziqi Chen <ziqichen@codeaurora.org>
> > > > ---
> > > >  drivers/scsi/ufs/ufs-mediatek.c | 32
> > > > ++++++++++++++++----------------
> > > >  drivers/scsi/ufs/ufs-qcom.c     | 24 +++++++++++++++---------
> > > >  drivers/scsi/ufs/ufshcd.c       | 36
> > > > +++++++++++++++++++++++++-----------
> > > >  drivers/scsi/ufs/ufshcd.h       |  8 ++++----
> > > >  4 files changed, 60 insertions(+), 40 deletions(-)
> > > > 
> > > > diff --git a/drivers/scsi/ufs/ufs-mediatek.c
> > > > b/drivers/scsi/ufs/ufs-mediatek.c
> > > > index 80618af..072f4db 100644
> > > > --- a/drivers/scsi/ufs/ufs-mediatek.c
> > > > +++ b/drivers/scsi/ufs/ufs-mediatek.c
> > > > @@ -841,27 +841,27 @@ static int
> > > > ufs_mtk_link_startup_notify(struct ufs_hba *hba,
> > > >  	return ret;
> > > >  }
> > > > 
> > > > -static int ufs_mtk_device_reset(struct ufs_hba *hba)
> > > > +static int ufs_mtk_device_reset(struct ufs_hba *hba, bool asserted)
> > > >  {
> > > >  	struct arm_smccc_res res;
> > > > 
> > > > -	ufs_mtk_device_reset_ctrl(0, res);
> > > > +	if (asserted) {
> > > > +		ufs_mtk_device_reset_ctrl(0, res);
> > > > 
> > > > -	/*
> > > > -	 * The reset signal is active low. UFS devices shall detect
> > > > -	 * more than or equal to 1us of positive or negative RST_n
> > > > -	 * pulse width.
> > > > -	 *
> > > > -	 * To be on safe side, keep the reset low for at least 10us.
> > > > -	 */
> > > > -	usleep_range(10, 15);
> > > > -
> > > > -	ufs_mtk_device_reset_ctrl(1, res);
> > > > -
> > > > -	/* Some devices may need time to respond to rst_n */
> > > > -	usleep_range(10000, 15000);
> > > > +		/*
> > > > +		 * The reset signal is active low. UFS devices shall detect
> > > > +		 * more than or equal to 1us of positive or negative RST_n
> > > > +		 * pulse width.
> > > > +		 *
> > > > +		 * To be on safe side, keep the reset low for at least 10us.
> > > > +		 */
> > > > +		usleep_range(10, 15);
> > > 
> > > I see no point in allowing vendors to "tweak" the 1us->10us
> > > adjustment.
> > > The specification says 1us and we all agree that 10us gives us good
> > > enough slack. I.e. this is common code.
> > 
> > Hi Bjron,
> > 
> > We tried, but Samsung fellows wanted 5us. We couldn't get a agreement
> > on this delay in short term, so we chose to leave it in vops.
> > 
> > > 
> > > > +	} else {
> > > > +		ufs_mtk_device_reset_ctrl(1, res);
> > > > 
> > > > -	dev_info(hba->dev, "device reset done\n");
> > > > +		/* Some devices may need time to respond to rst_n */
> > > > +		usleep_range(10000, 15000);
> > > 
> > > The comment in both the Qualcomm and Mediatek drivers claim that
> > > this is
> > > sleep relates to the UFS device (not host), so why should it be
> > > different?
> > > 
> > > What happens if I take the device that Mediatek see a need for a 10ms
> > > delay and hook that up to a Qualcomm host? This really should go in
> > > the
> > > common code.
> > > 
> > 
> > Agree, but Qualcomm host didn't have any problems with 10us yet, so if
> > we put
> > the 10ms delay to common code, Qualcomm host would suffer longer delay
> > when
> > device reset happens - both bootup and resume(xpm_lvl = 5/6) latency
> > would
> > be increased.
> > 
> > Regards,
> > Can Guo.
> > 
> 
> Besides, currently this device reset vops is only registered by ufs-qcom.c
> and ufs-mediatek.c, meaning any delays that we put in the common code are
> not
> necessary for those who do not have this vops registered, i.e ufs-exynos.c,
> ufs-hisi.c.
> 

Surely we can detect this in the common code and only sleep if the vops
is implemented - and successfully deasserted the reset.

Regards,
Bjorn

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
