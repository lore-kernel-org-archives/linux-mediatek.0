Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E9FD7C25B75
	for <linux-mediatek@archiver.kernel.org>; Thu,  6 Jun 2024 04:16:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=URXRNILWO7LZ/MwdWR1JeNjmEaFUftirMHuX7Pvwbt0=; b=zBcVnIy0lpnBIyotE4T7Xbdi67
	TSRb2FMDREkfbM6xJcau29U+fRL+K//KO10mRKv1viJeK2/+h5ot7yKz17KK6D2xH9hnns+D9jbsH
	HGB7eOjD2Rh4hGsFJvCffNLrdc2UVPJy2rJU29VZYAKZqadKD9/qOqXWZhrN4ZhxnMC/TZ6/VqETc
	xRihid/eg8da/kbMJbdXaY71rMfi4bl1Oow3YYZLDJqkVKDAvWTZf1nFFvlz1CSv9D+PFe7PQ21nQ
	zA8umbqeweSSWgXUw9OLB0eCE8hydVemWz7eDJk9S9N15TbCMhFcHNFt3D3EGHArKrq35wIZWON5B
	8Mqv5t/g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sF4Xp-00000008JCO-1q1J;
	Thu, 06 Jun 2024 04:16:09 +0000
Received: from mail-lf1-x12c.google.com ([2a00:1450:4864:20::12c])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sF4Xl-00000008JBf-1sMV
	for linux-mediatek@lists.infradead.org;
	Thu, 06 Jun 2024 04:16:07 +0000
Received: by mail-lf1-x12c.google.com with SMTP id 2adb3069b0e04-52b9af7a01bso621186e87.0
        for <linux-mediatek@lists.infradead.org>; Wed, 05 Jun 2024 21:16:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1717647363; x=1718252163; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=URXRNILWO7LZ/MwdWR1JeNjmEaFUftirMHuX7Pvwbt0=;
        b=OYGAlhKYi5tA4AY9WblZ6Tn9oXygX32IO/+u+Y4r4fFl78srsyQviryZQBlzXarIhN
         YqXstK++iJbPixWD0LEpHAYIJ4urxs21zMZ+vElF5daSVmNzzcrJsTtZslD1v506mZix
         zNmhABeIRCsFjtNuBM53hbVAdoIsQXNRF/mbU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717647363; x=1718252163;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=URXRNILWO7LZ/MwdWR1JeNjmEaFUftirMHuX7Pvwbt0=;
        b=Joj+H91fnn4z0LWF3z1nD6qpx9N/GpLXP7e5SIi+yO4YT/922i1IPYkojnt2SD2Gpv
         U/8yg755TIDWAMSMr6x8r1/vNDJMj5LAHPbaaeZrrsWCOrZEcF3IHNiy9hc9ted26+em
         for81oAvDFotkMwo4mHCR2xY9qVeKqsjt2aQ8KI/yxo4rDyHNsCMJrqImCfOie0IfiFY
         /N/1JcCR+FFpdqj1zaH5bF4E0htcELqoKE4xzUrK8fmmvHgeac/A1y5Gbst+3POJpfeH
         OcMUtYQ9Qeyn3Lne0R4tV/JxVwAo0NweQ/PBeyJ1ae/Te75G7z0xsrZbb9vYD0d2cjob
         Dv1g==
X-Gm-Message-State: AOJu0Yyq3hO8K5PV5fixHYyv7fbTF8A+8VXOl2BZGpr4MvfXNqQzYETA
	NpQ/Y7BXOT/nlbuIdScg/gt8CCt0nVL4P0mjNi3FD818OWcqnI0tf18HDgi3W+BuE9Uy9eHL2sV
	V4GLdT4CR5DbhmIlsgLVZwZbDh4aM2Fjsxz0F
X-Google-Smtp-Source: AGHT+IGDVi0x5PPWVVdHgpTQNURWwUeBkukHjuXk6z91V1QZIIbvs1uZFVAc1YhlkbIbH5GhY2rOcvp/C0AgH6thkKk=
X-Received: by 2002:a05:6512:b88:b0:51b:4204:2f51 with SMTP id
 2adb3069b0e04-52bab4b7f8fmr3100481e87.8.1717647363043; Wed, 05 Jun 2024
 21:16:03 -0700 (PDT)
MIME-Version: 1.0
References: <e5912054-0fc9-47ff-8f38-9b9a3e9d2156@notapiano>
 <CAGXv+5HJKur9vWq4j_x7-fuL5H0SY_oQNYFWTxFCC1EBxF9yQw@mail.gmail.com> <2491f962-a8e1-44c4-8ff9-f8c3e58a2a39@notapiano>
In-Reply-To: <2491f962-a8e1-44c4-8ff9-f8c3e58a2a39@notapiano>
From: Chen-Yu Tsai <wenst@chromium.org>
Date: Thu, 6 Jun 2024 12:15:51 +0800
Message-ID: <CAGXv+5HjRmn5o6uogn89OMLONWWaxBA5MJNKCesYXoR7G_FOEA@mail.gmail.com>
Subject: Re: Probe failures on mt8183-kukui-jacuzzi-juniper-sku16
To: =?UTF-8?B?TsOtY29sYXMgRi4gUi4gQS4gUHJhZG8=?= <nfraprado@collabora.com>
Cc: linux-mediatek@lists.infradead.org, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
	Matthias Brugger <matthias.bgg@gmail.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, kernel@collabora.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240605_211605_781843_61F5F43B 
X-CRM114-Status: GOOD (  33.46  )
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

On Wed, Jun 5, 2024 at 8:33=E2=80=AFPM N=C3=ADcolas F. R. A. Prado
<nfraprado@collabora.com> wrote:
>
> On Wed, Jun 05, 2024 at 04:01:06PM +0800, Chen-Yu Tsai wrote:
> > Hi,
> >
> > On Tue, Jun 4, 2024 at 11:52=E2=80=AFPM N=C3=ADcolas F. R. A. Prado
> > <nfraprado@collabora.com> wrote:
> > >
> > > Hi,
> > >
> > > We're monitoring the status of device probe on the
> > > mt8183-kukui-jacuzzi-juniper-sku16 platform in KernelCI, and I though=
t it'd be
> > > helpful to share the results.
> > >
> > > These are the current failures:
> > >
> > > * /soc/i2c@11009000/trackpad@15
> > > * /soc/svs@1100bc00
> > > * /thermal-sensor1
> > > * /thermal-sensor2
> > >
> > > In more details:
> > >
> > > * /soc/i2c@11009000/trackpad@15: I believe this is a second source tr=
ackpad and
> > >   is thus waiting for the "platform/chrome: Introduce DT hardware pro=
ber" series
> > >   [1] to be merged before it can be handled. Although looks like ther=
e haven't
> > >   been updates to the series in a while.
> >
> > I've been working on other stuff and haven't had time to respin this se=
ries.
>
> No worries, but it's good to know that that's the latest status and I did=
n't
> miss something.
>
> >
> > Just to confirm, is the failure due to pinctrl conflicts when the track=
pad
> > variants probe asynchronously?
>
> Yes:
>
> [    2.185408] input: hid-over-i2c 06CB:CDB5 Mouse as /devices/platform/s=
oc/11009000.i2c/i2c-2/2-002c/0018:06CB:CDB5.0001/input/input2
> [    2.845044] mt8183-pinctrl 10005000.pinctrl: pin GPIO7 already request=
ed by 2-002c; cannot claim for 2-0015
> [    2.854700] mt8183-pinctrl 10005000.pinctrl: error -EINVAL: pin-7 (2-0=
015)
> [    2.869503] mt8183-pinctrl 10005000.pinctrl: error -EINVAL: could not =
request pin 7 (GPIO7) from group GPIO7  on device pinctrl_paris
> [    2.894885] elan_i2c 2-0015: Error applying setting, reverse things ba=
ck

Yup. That's the issue. We work around it either with staggered driver probe
(built-in vs module) or move the pinctrl up to the i2c bus node.

> >
> [..]
> > > * /thermal-sensor1, /thermal-sensor2: The following is reported:
> > >
> > >     [    2.813605] thermal_sys: Failed to find 'trips' node
> > >     [    2.813611] thermal_sys: Failed to find trip points for therma=
l-sensor1 id=3D0
> > >     [    2.813619] generic-adc-thermal thermal-sensor1: Thermal zone =
sensor register failed: -22
> > >     [    2.813624] generic-adc-thermal thermal-sensor1: probe with dr=
iver generic-adc-thermal failed with error -22
> > >
> > >   And the same for thermal-sensor2. So both are missing the required =
'trips'
> > >   subnode.
> >
> > IIRC either the driver or the DT had comments saying "these zones don't
> > need trip points". In that case maybe the driver should use
> > thermal_tripless_zone_device_register() for them?
>
> I believe you're thinking of the SoC thermal zones, which had trips added=
 (and
> the comment removed) in commit 978979409209 ("arm64: dts: mediatek: mt818=
3:
> Refactor thermal zones"). But these are the kukui board thermal zones.

I see. I dug through the schematics we have, and they all seem to say that
the first NTC is for the SoC. The use for the second one seems to depend
on the project, with some saying close to the LCM (display?) or LTE PA,
and on the Jacuzzi family it's for ambient temp.

Regarding trip points, for the NTC close to the SoC, I guess we could copy
the SoC thermal trip points and reduce the values by some amount, 20
degrees maybe? For the other one we could probably make the critical
trip point some value that feels hot to the touch?

ChenYu

> The thermal-zones dt-binding does describe the 'trips' node as required, =
so I
> think the only option in this case is to add trips to them, or remove the
> thermal zones altogether. I'm guessing the
> thermal_tripless_zone_device_register() helper is meant for other thermal=
 zones
> that aren't described in the DT.
>
> Thanks,
> N=C3=ADcolas

