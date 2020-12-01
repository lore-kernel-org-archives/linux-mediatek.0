Return-Path: <SRS0=+qQs=FF=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 43207C64E90
	for <linux-mediatek@archiver.kernel.org>; Tue,  1 Dec 2020 03:33:46 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B18AC20725
	for <linux-mediatek@archiver.kernel.org>; Tue,  1 Dec 2020 03:33:45 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="2XLrqXkT";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="CC+1DKp5"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org B18AC20725
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linaro.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=iKQ/TwcYmRk29v4/hyeEs39l2eoKILPxCeD7nBCiSF4=; b=2XLrqXkTf/3A+5tAYrCp+m5rN
	A6Q7TuuZcI9JRlqbxvTqEA9lRWjT6nE/YaXvokAxRq1WmsTL8roeNSdnKU3UKQTH8s1e9Z7+Z8mS+
	1Tfie9310xnXF3g+StaHNbbW5yIMh6UvTjr2R7PToC/wToE+WcNT6wflMiFcAjX4xU93+DkAiLydr
	rfcQawvC1Dx1T2/zljmdX/t1JlXeO/3j7I1/ofIaPV4hDkBPgwEW/X/uOCxiP6I780GwBXOj+wQaR
	3iaVViei94mHrKYQO5042rnz0H2M2BI25q9cnqVwK46G/4kWuGT7+LY/tE7Y/zEqdEO317mM/Psnd
	Wpi0E5nJg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kjwQ4-0005Pw-C3; Tue, 01 Dec 2020 03:33:36 +0000
Received: from mail-oo1-xc41.google.com ([2607:f8b0:4864:20::c41])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kjwPy-0005Om-Vf
 for linux-mediatek@lists.infradead.org; Tue, 01 Dec 2020 03:33:32 +0000
Received: by mail-oo1-xc41.google.com with SMTP id l20so90541oot.3
 for <linux-mediatek@lists.infradead.org>; Mon, 30 Nov 2020 19:33:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=zbGZDw8W0Yk78H+DHPLlM669ACPRLsB5AJaN9EhyYqE=;
 b=CC+1DKp5n085S6zVrdwoMatT6OvtGAbS5SNElzSMEQkBJJI00Z7fJU5q+WmVvTMb4f
 rEgewZg7TMjuZJFeqP8AdfPXJbhLkBs1u8aMJrrC2gUVIpriIEpRNIaS3VGb/N8E5d7r
 uvFa4F1iTbOPi43DMkNv4pOX/YS0d/3+B7pCYJAfpKhUDWRQvXPHmiL03IbnT+Q5y49m
 0ZTxtpcdXIYIzEAGQv6eLPQOqCnT4FD+H1Irb+8LczVkDXMPr80K5cJZfMEiSN9SDB9c
 GsJu+wK3IQIQJS2FNHNpv0qz79RKMDoxPt4JdNLzuuEdDzRTycx9bGy7VI7Ecy/85vuF
 UaZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=zbGZDw8W0Yk78H+DHPLlM669ACPRLsB5AJaN9EhyYqE=;
 b=BSKqvbT5bfQyQe6tFg6NazsYpm+RKEktAT+y6rGKJJ2QQt30/cvZrAooRiH1D4S/SM
 ZBjduIpZLoABfWzSHXZPLxUOOXUhH11/jQ6+TKeojDPUZzrge3SlCMI5OKswHeKDn3hc
 AdD+hsuVd7560Yyhy+rZGv3lS6SodlN8/OgMgpkoaQmHRcRC4n4m2P00GuuJxipTUpUM
 2A3QSLhfWGgR1FSU17xWwe4yg1iEIUZgOunXjK4QGZtTdMd3A/cvL6B8FJhcLIR8iSvK
 7Fxa1XFOUP+ZDNRFStBKRjqeA8yqsDrICLlPRMFr/2FqD1C7lOgDY+2skkETMaOZfLua
 9jsA==
X-Gm-Message-State: AOAM532JEhFKckvJrDUQKBrPMhzDcSIOgTgFA6GlRJALUroE0tT2UZMx
 nWAdrJZLcFrgkBmWueFgpcHtNA==
X-Google-Smtp-Source: ABdhPJxNssokUuLVtjUfT9m8TbTNvdyLwVWLyfORPuxGE9i928NM72s7PiS2rzNzQqpWeBukYw0ZbA==
X-Received: by 2002:a4a:d495:: with SMTP id o21mr683262oos.12.1606793608837;
 Mon, 30 Nov 2020 19:33:28 -0800 (PST)
Received: from builder.lan (104-57-184-186.lightspeed.austtx.sbcglobal.net.
 [104.57.184.186])
 by smtp.gmail.com with ESMTPSA id h8sm126858oom.41.2020.11.30.19.33.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 30 Nov 2020 19:33:28 -0800 (PST)
Date: Mon, 30 Nov 2020 21:33:26 -0600
From: Bjorn Andersson <bjorn.andersson@linaro.org>
To: "Asutosh Das (asd)" <asutoshd@codeaurora.org>
Subject: Re: [RFC PATCH v1] scsi: ufs: Remove pre-defined initial VCC voltage
 values
Message-ID: <X8W5hiEqBydoU1xO@builder.lan>
References: <20201130091610.2752-1-stanley.chu@mediatek.com>
 <568660cd-80e6-1b8f-d426-4614c9159ff4@codeaurora.org>
 <X8V83T+Tx6teNLOR@builder.lan>
 <4335d590-0506-d920-8e7f-f0f0372780f9@codeaurora.org>
 <X8WwPs1MPg64FEp8@builder.lan>
 <bf6e03ee-95ab-4768-7ce5-7f196ab6db60@codeaurora.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <bf6e03ee-95ab-4768-7ce5-7f196ab6db60@codeaurora.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201130_223331_386144_9A591BE4 
X-CRM114-Status: GOOD (  48.20  )
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

On Mon 30 Nov 21:19 CST 2020, Asutosh Das (asd) wrote:

> On 11/30/2020 6:53 PM, Bjorn Andersson wrote:
> > On Mon 30 Nov 17:54 CST 2020, Asutosh Das (asd) wrote:
> > 
> > > On 11/30/2020 3:14 PM, Bjorn Andersson wrote:
> > > > On Mon 30 Nov 16:51 CST 2020, Asutosh Das (asd) wrote:
> > > > 
> > > > > On 11/30/2020 1:16 AM, Stanley Chu wrote:
> > > > > > UFS specficication allows different VCC configurations for UFS devices,
> > > > > > for example,
> > > > > > 	(1). 2.70V - 3.60V (By default)
> > > > > > 	(2). 1.70V - 1.95V (Activated if "vcc-supply-1p8" is declared in
> > > > > >                              device tree)
> > > > > > 	(3). 2.40V - 2.70V (Supported since UFS 3.x)
> > > > > > 
> > > > > > With the introduction of UFS 3.x products, an issue is happening that
> > > > > > UFS driver will use wrong "min_uV/max_uV" configuration to toggle VCC
> > > > > > regulator on UFU 3.x products with VCC configuration (3) used.
> > > > > > 
> > > > > > To solve this issue, we simply remove pre-defined initial VCC voltage
> > > > > > values in UFS driver with below reasons,
> > > > > > 
> > > > > > 1. UFS specifications do not define how to detect the VCC configuration
> > > > > >       supported by attached device.
> > > > > > 
> > > > > > 2. Device tree already supports standard regulator properties.
> > > > > > 
> > > > > > Therefore VCC voltage shall be defined correctly in device tree, and
> > > > > > shall not be changed by UFS driver. What UFS driver needs to do is simply
> > > > > > enabling or disabling the VCC regulator only.
> > > > > > 
> > > > > > This is a RFC conceptional patch. Please help review this and feel
> > > > > > free to feedback any ideas. Once this concept is accepted, and then
> > > > > > I would post a more completed patch series to fix this issue.
> > > > > > 
> > > > > > Signed-off-by: Stanley Chu <stanley.chu@mediatek.com>
> > > > > > ---
> > > > > >     drivers/scsi/ufs/ufshcd-pltfrm.c | 10 +---------
> > > > > >     1 file changed, 1 insertion(+), 9 deletions(-)
> > > > > > 
> > > > > > diff --git a/drivers/scsi/ufs/ufshcd-pltfrm.c b/drivers/scsi/ufs/ufshcd-pltfrm.c
> > > > > > index a6f76399b3ae..3965be03c136 100644
> > > > > > --- a/drivers/scsi/ufs/ufshcd-pltfrm.c
> > > > > > +++ b/drivers/scsi/ufs/ufshcd-pltfrm.c
> > > > > > @@ -133,15 +133,7 @@ static int ufshcd_populate_vreg(struct device *dev, const char *name,
> > > > > >     		vreg->max_uA = 0;
> > > > > >     	}
> > > > > > -	if (!strcmp(name, "vcc")) {
> > > > > > -		if (of_property_read_bool(np, "vcc-supply-1p8")) {
> > > > > > -			vreg->min_uV = UFS_VREG_VCC_1P8_MIN_UV;
> > > > > > -			vreg->max_uV = UFS_VREG_VCC_1P8_MAX_UV;
> > > > > > -		} else {
> > > > > > -			vreg->min_uV = UFS_VREG_VCC_MIN_UV;
> > > > > > -			vreg->max_uV = UFS_VREG_VCC_MAX_UV;
> > > > > > -		}
> > > > > > -	} else if (!strcmp(name, "vccq")) {
> > > > > > +	if (!strcmp(name, "vccq")) {
> > > > > >     		vreg->min_uV = UFS_VREG_VCCQ_MIN_UV;
> > > > > >     		vreg->max_uV = UFS_VREG_VCCQ_MAX_UV;
> > > > > >     	} else if (!strcmp(name, "vccq2")) {
> > > > > > 
> > > > > 
> > > > > Hi Stanley
> > > > > 
> > > > > Thanks for the patch. Bao (nguyenb) was also working towards something
> > > > > similar.
> > > > > Would it be possible for you to take into account the scenario in which the
> > > > > same platform supports both 2.x and 3.x UFS devices?
> > > > > 
> > > > > These've different voltage requirements, 2.4v-3.6v.
> > > > > I'm not sure if standard dts regulator properties can support this.
> > > > > 
> > > > 
> > > > What is the actual voltage requirement for these devices and how does
> > > > the software know what voltage to pick in this range?
> > > > 
> > > > Regards,
> > > > Bjorn
> > > > 
> > > > > -asd
> > > > > 
> > > > > 
> > > > > -- 
> > > > > The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
> > > > > Linux Foundation Collaborative Project
> > > 
> > > For platforms that support both 2.x (2.7v-3.6v) and 3.x (2.4v-2.7v), the
> > > voltage requirements (Vcc) are 2.4v-3.6v. The software initializes the ufs
> > > device at 2.95v & reads the version and if the device is 3.x, it may do the
> > > following:
> > > - Set the device power mode to SLEEP
> > > - Disable the Vcc
> > > - Enable the Vcc and set it to 2.5v
> > > - Set the device power mode to ACTIVE
> > > 
> > > All of the above may be done at HS-G1 & moved to max supported gear based on
> > > the device version, perhaps?
> > > 
> > > Am open to other ideas though.
> > > 
> > 
> > But that means that for a board where we don't know (don't want to know)
> > if we have a 2.x or 3.x device we need to set:
> > 
> >    regulator-min-microvolt = <2.4V>
> >    regulator-max-microvolt = <3.6V>
> > 
> > And the 2.5V and the two ranges should be hard coded into the ufshcd (in
> > particular if they come from the specification).
> > 
> > For devices with only 2.x or 3.x devices, regulator-{min,max}-microvolt
> > should be adjusted accordingly.
> > 
> > Note that driving the regulators outside these ranges will either damage
> > the hardware or cause it to misbehave, so these values should be defined
> > in the board.dts anyways.
> > 
> > Also note that regulator_set_voltage(2.4V, 3.6V) won't give you "a
> > voltage between 2.4V and 3.6V, it will most likely give either 2.4V or
> > any more specific voltage that we've specified in the board file because
> > the regulator happens to be shared with some other consumer and changing
> > it in runtime would be bad.
> > 
> > Regards,
> > Bjorn
> > 
> 
> Understood.
> I also understand that assumptions on the regulator limits in the driver is
> a bad idea. I'm not sure how it's designed, but I should think the
> power-grid design should take care of regulator sharing; if it's being
> shared and the platform supports both 2.x and 3.x. Perhaps, such platforms
> be identified using a dts flag - not sure if that's such a good idea though.
> 

Presumably you can't share vcc with other peripherals, given that the
voltage levels might just change while the device is in use then. As you
say the only way to avoid this is to think these problems through when
designing the power grid.

> I like Stanley's proposal of a vops and let vendors handle it, until specs
> or someone has a better suggestion.
> 

I too think it sounds quite reasonable.

Regards,
Bjorn

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
