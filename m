Return-Path: <SRS0=+qQs=FF=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1B12FC63777
	for <linux-mediatek@archiver.kernel.org>; Tue,  1 Dec 2020 02:54:07 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 6CE3720809
	for <linux-mediatek@archiver.kernel.org>; Tue,  1 Dec 2020 02:54:06 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="cKLH2z0K";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="jsaDTuyK"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 6CE3720809
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linaro.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=o/MpV5wWiilj3dH47vc9Odye/61UusVWt8kfyEwNASg=; b=cKLH2z0KvV7j/Pi37tLkYA2rD
	k/kIDi499H518BvSAcDfMx9PvyfFppRIyWZFkorbhYmUFSSixaOVINv0El34woqYBZETIcPPq+eEq
	/jrLdHQEj3Y4TsLiSAp3lRgnM41lbN5vRZgaOjp5XPKxRHYpb8Er6af7noEyXK6a+06SnNffGn9NN
	nj/GAaTjk7bbqdYMafo3erMuXcRaKAt4+3FpKuAUuj5AaB4YqcMqqqQUkUqfgL9NeVAtGZ8un/IDm
	3KpojbEj7AvKKrbanob80sRAwJzJPDYHg+xbBR4p0zCFGnjbADusF/junffWYAZ5aYPGPbe+7CMzI
	0NfhaH9gw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kjvni-0001Gm-25; Tue, 01 Dec 2020 02:53:58 +0000
Received: from mail-ot1-x342.google.com ([2607:f8b0:4864:20::342])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kjvnf-0001G6-AI
 for linux-mediatek@lists.infradead.org; Tue, 01 Dec 2020 02:53:57 +0000
Received: by mail-ot1-x342.google.com with SMTP id k3so279950otp.12
 for <linux-mediatek@lists.infradead.org>; Mon, 30 Nov 2020 18:53:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=X45Jkktu9OpTlNX/eJhP3x2IhQt9mJKmemAaV1I+Aas=;
 b=jsaDTuyKW4WfAmZdcZXfomtxfloorQ2zFL1aVBN8BqiOwPjtiCpoxA6dwzQuc85xs0
 8e3b1rH4IIq3u3grWhCHhgyNk2AwVqKtBjUt9DmGbZ4R1amR6AItIrbJFOevlbkTUk2g
 Gp7mv97DVDI1Td5T25kzfSJZuqddPHOtW6dxbYk+3e4ttdrRnGCC7AI5/InaokdWHBwO
 9j+SgmAZSuEEmmMVyNUO/eo+C4OzBk5oL3YjFLc2KVOgSG1PGGL5Xc59Lpqpnf67Eupy
 46WwecL4/0WcFnxLF8vgORg2PfeAwZz+N9pXv4I/HDwlJU9NnOKMHUCRWU14M+O9/tf6
 DaGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=X45Jkktu9OpTlNX/eJhP3x2IhQt9mJKmemAaV1I+Aas=;
 b=lbC+xK8ySPcu78/t44VP4lwyj9GuFw12+M+ErDr1OIc8P2L22a1Ha2Ey/9RCuFfbQ5
 rB+TYlB6qvOsCXoUSNphAGkkfdw32ormQYkqVeXNq52uGibwWfYDbXiznJqtGCYBwLUq
 TNpi0+IxGw4d3b3zcfuce1GPimwOVmOQznyqQ79qxdtCAL2118Bb4tmiZW33ghAYcI4X
 PJXkK6XOXwlZ8Mj6AsurvWXGt237Uy2KmgjDP14xo+rzOi9bu+FbEgrBQUYdEZcdq5R+
 Vi2pnq4zMMA4JVSWmocAeaayC3yf4o85k0rIz0CmjhBgWxvfUwtxRl3ycTked1Rr3KHa
 5zIQ==
X-Gm-Message-State: AOAM532ZgvQM1JW+Rl9L9SKjkbKN8aKfNi04poi3uld7KhLhLCxKigYM
 Pk39dXVL0O25uKmTfJkqR6I1Hw==
X-Google-Smtp-Source: ABdhPJxIWb8DvEdDoULocFRnGiXoanXS8eiSHOKS+D2bxTame5uxqYqLFWhLA33iUQlmxOQhMSBvzg==
X-Received: by 2002:a9d:6290:: with SMTP id x16mr464476otk.15.1606791232800;
 Mon, 30 Nov 2020 18:53:52 -0800 (PST)
Received: from builder.lan (104-57-184-186.lightspeed.austtx.sbcglobal.net.
 [104.57.184.186])
 by smtp.gmail.com with ESMTPSA id 8sm79990otv.26.2020.11.30.18.53.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 30 Nov 2020 18:53:52 -0800 (PST)
Date: Mon, 30 Nov 2020 20:53:50 -0600
From: Bjorn Andersson <bjorn.andersson@linaro.org>
To: "Asutosh Das (asd)" <asutoshd@codeaurora.org>
Subject: Re: [RFC PATCH v1] scsi: ufs: Remove pre-defined initial VCC voltage
 values
Message-ID: <X8WwPs1MPg64FEp8@builder.lan>
References: <20201130091610.2752-1-stanley.chu@mediatek.com>
 <568660cd-80e6-1b8f-d426-4614c9159ff4@codeaurora.org>
 <X8V83T+Tx6teNLOR@builder.lan>
 <4335d590-0506-d920-8e7f-f0f0372780f9@codeaurora.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <4335d590-0506-d920-8e7f-f0f0372780f9@codeaurora.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201130_215355_691254_EEAB9CAC 
X-CRM114-Status: GOOD (  39.08  )
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

On Mon 30 Nov 17:54 CST 2020, Asutosh Das (asd) wrote:

> On 11/30/2020 3:14 PM, Bjorn Andersson wrote:
> > On Mon 30 Nov 16:51 CST 2020, Asutosh Das (asd) wrote:
> > 
> > > On 11/30/2020 1:16 AM, Stanley Chu wrote:
> > > > UFS specficication allows different VCC configurations for UFS devices,
> > > > for example,
> > > > 	(1). 2.70V - 3.60V (By default)
> > > > 	(2). 1.70V - 1.95V (Activated if "vcc-supply-1p8" is declared in
> > > >                             device tree)
> > > > 	(3). 2.40V - 2.70V (Supported since UFS 3.x)
> > > > 
> > > > With the introduction of UFS 3.x products, an issue is happening that
> > > > UFS driver will use wrong "min_uV/max_uV" configuration to toggle VCC
> > > > regulator on UFU 3.x products with VCC configuration (3) used.
> > > > 
> > > > To solve this issue, we simply remove pre-defined initial VCC voltage
> > > > values in UFS driver with below reasons,
> > > > 
> > > > 1. UFS specifications do not define how to detect the VCC configuration
> > > >      supported by attached device.
> > > > 
> > > > 2. Device tree already supports standard regulator properties.
> > > > 
> > > > Therefore VCC voltage shall be defined correctly in device tree, and
> > > > shall not be changed by UFS driver. What UFS driver needs to do is simply
> > > > enabling or disabling the VCC regulator only.
> > > > 
> > > > This is a RFC conceptional patch. Please help review this and feel
> > > > free to feedback any ideas. Once this concept is accepted, and then
> > > > I would post a more completed patch series to fix this issue.
> > > > 
> > > > Signed-off-by: Stanley Chu <stanley.chu@mediatek.com>
> > > > ---
> > > >    drivers/scsi/ufs/ufshcd-pltfrm.c | 10 +---------
> > > >    1 file changed, 1 insertion(+), 9 deletions(-)
> > > > 
> > > > diff --git a/drivers/scsi/ufs/ufshcd-pltfrm.c b/drivers/scsi/ufs/ufshcd-pltfrm.c
> > > > index a6f76399b3ae..3965be03c136 100644
> > > > --- a/drivers/scsi/ufs/ufshcd-pltfrm.c
> > > > +++ b/drivers/scsi/ufs/ufshcd-pltfrm.c
> > > > @@ -133,15 +133,7 @@ static int ufshcd_populate_vreg(struct device *dev, const char *name,
> > > >    		vreg->max_uA = 0;
> > > >    	}
> > > > -	if (!strcmp(name, "vcc")) {
> > > > -		if (of_property_read_bool(np, "vcc-supply-1p8")) {
> > > > -			vreg->min_uV = UFS_VREG_VCC_1P8_MIN_UV;
> > > > -			vreg->max_uV = UFS_VREG_VCC_1P8_MAX_UV;
> > > > -		} else {
> > > > -			vreg->min_uV = UFS_VREG_VCC_MIN_UV;
> > > > -			vreg->max_uV = UFS_VREG_VCC_MAX_UV;
> > > > -		}
> > > > -	} else if (!strcmp(name, "vccq")) {
> > > > +	if (!strcmp(name, "vccq")) {
> > > >    		vreg->min_uV = UFS_VREG_VCCQ_MIN_UV;
> > > >    		vreg->max_uV = UFS_VREG_VCCQ_MAX_UV;
> > > >    	} else if (!strcmp(name, "vccq2")) {
> > > > 
> > > 
> > > Hi Stanley
> > > 
> > > Thanks for the patch. Bao (nguyenb) was also working towards something
> > > similar.
> > > Would it be possible for you to take into account the scenario in which the
> > > same platform supports both 2.x and 3.x UFS devices?
> > > 
> > > These've different voltage requirements, 2.4v-3.6v.
> > > I'm not sure if standard dts regulator properties can support this.
> > > 
> > 
> > What is the actual voltage requirement for these devices and how does
> > the software know what voltage to pick in this range?
> > 
> > Regards,
> > Bjorn
> > 
> > > -asd
> > > 
> > > 
> > > -- 
> > > The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
> > > Linux Foundation Collaborative Project
> 
> For platforms that support both 2.x (2.7v-3.6v) and 3.x (2.4v-2.7v), the
> voltage requirements (Vcc) are 2.4v-3.6v. The software initializes the ufs
> device at 2.95v & reads the version and if the device is 3.x, it may do the
> following:
> - Set the device power mode to SLEEP
> - Disable the Vcc
> - Enable the Vcc and set it to 2.5v
> - Set the device power mode to ACTIVE
> 
> All of the above may be done at HS-G1 & moved to max supported gear based on
> the device version, perhaps?
> 
> Am open to other ideas though.
> 

But that means that for a board where we don't know (don't want to know)
if we have a 2.x or 3.x device we need to set:

  regulator-min-microvolt = <2.4V>
  regulator-max-microvolt = <3.6V>

And the 2.5V and the two ranges should be hard coded into the ufshcd (in
particular if they come from the specification).

For devices with only 2.x or 3.x devices, regulator-{min,max}-microvolt
should be adjusted accordingly.

Note that driving the regulators outside these ranges will either damage
the hardware or cause it to misbehave, so these values should be defined
in the board.dts anyways.

Also note that regulator_set_voltage(2.4V, 3.6V) won't give you "a
voltage between 2.4V and 3.6V, it will most likely give either 2.4V or
any more specific voltage that we've specified in the board file because
the regulator happens to be shared with some other consumer and changing
it in runtime would be bad.

Regards,
Bjorn

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
