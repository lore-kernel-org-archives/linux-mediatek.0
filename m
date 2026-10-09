Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D7E52CA5FED
	for <linux-mediatek@archiver.kernel.org>; Fri,  9 Oct 2026 07:22:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=vGQ1K2lnEtPHoywNrrfZAa9ebz8nSIt73vgH/dzJD9c=; b=3DaLO30wL+82PxsG1FjrBKsceq
	PKQ395dHnhGrsLnj9S4QyDM++NvGDE4EjZMQePjM1lSUlElSgms7u6aRgFrsHqaag8wt87cxSBSFZ
	CWDV3iQJQrfSq0Y83XpxWvItFaozi6oEYVfLEwr1ZuScvaljnB4+eFysICwlvRHifqj2nJc9XCYWv
	fUo+QZ0VvShPn1NGyf2aMXlWWbEytBRypKUL2mmE9Pv3ClA4K6S7776CcuWXRfN69ct/Z62S0GEL1
	HaKzWXfD2Lqnjuv4Bg/DB+lMZVZkxaCDyEfLni4OuU+35YCT+jyJEFywviTMVGPGT08RRRfI6Q3nJ
	L8NtZdTw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xF4vj-00000005iLx-04jf;
	Fri, 09 Oct 2026 07:22:11 +0000
Received: from mail-pj1-x1029.google.com ([2607:f8b0:4864:20::1029])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xF4vc-00000005iIj-3KXt
	for linux-mediatek@lists.infradead.org;
	Fri, 09 Oct 2026 07:22:05 +0000
Received: by mail-pj1-x1029.google.com with SMTP id 98e67ed59e1d1-3a4b3ac8fb7so1722325a91.0
        for <linux-mediatek@lists.infradead.org>; Fri, 09 Oct 2026 00:22:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791530524; x=1792135324; darn=lists.infradead.org;
        h=content-type:content-transfer-encoding:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=vGQ1K2lnEtPHoywNrrfZAa9ebz8nSIt73vgH/dzJD9c=;
        b=CYWg36XLgUZcFwp4aDjg9D5IXRndBGP+P9SzAHCVMgSXLR1qo1LFjkgCPDNHpcgOGp
         mafrINoWDuZhEwMprMxTsiBQE1Fg6+NQjg2ajr+4plTnGbJfiUQ+sJbXg6i8859Wop23
         3YdCA6RcyjINqJ7jgY2bNhNfYcjjSm1O9DwYc+9vXWu8qKH6eHW6O2BHmkQQPe820peD
         c3D1zGf87xdFvM+SgyIPJShmrKFH+CEc7mX7/KxN/ydhkMXrQRDkuGyYqyAI09zjsAoX
         f27f4Gs6L1RdyP4cCqn4GNZ5G4BSo7hSo4JMcsf4GZj+7MsHxh9a0mfKHtLMThZQRREm
         IksA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791530524; x=1792135324;
        h=content-type:content-transfer-encoding:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=vGQ1K2lnEtPHoywNrrfZAa9ebz8nSIt73vgH/dzJD9c=;
        b=2oTIRvUJ8cPwynRyfpzR6KTgvlJvgDGNBZpieEgoJA/UNSyfK6my7hUg3MJTyVMUmb
         3ROzD9GOFZ8Kv+RbLACtAgSYPPXDNCB09VOazGf/zo2OpznDn7zmAelp5fDDSd+5jOwk
         5gEPkA8QlhTC1cbOG5ziD8Z08sKiJWqB4KcH1+KMlRrqDDZ0TC3sS/lg/EXhtIQMj609
         ix9FEvIj+0Uak++evSBZimgVseZtn9XWT8OqIwURd9kz5mHrjNS7Xl4AoGKcahHHmOHt
         9GjGzi27ijTK6I5Ilti9g32OFJrkjCNV/t+/cAV5zOGAJ3fNFWg7DirWCYppJLNkRijV
         14+A==
X-Forwarded-Encrypted: i=1; AKwUvBx/jnsvbP3XuH5yL+Z/AhAyy0gZM2Lk3nqlI8u3wKVHQ98ZLNeej91FLPS/VGKgzdbzNt3us8OPmgM31pxwKw==@lists.infradead.org
X-Gm-Message-State: AFq9FYKIRUfqwX4UC11A8lxY0Zj8/TdMdqraaCbnmXOz9/AFBs0aPxxb
	3UEMiv+WHoDRgNrH2qkJRbXzqDhg7hbAQdoveu8lqc4g+gByoY9To+ez
X-Gm-Gg: AYBFou0zBvqxCb8dcECbuYfD8Oq0Zh0B9iCBmb3brYNOzjVAtm5vP97ct4PXI7mHFtX
	DvPQ49FYLTmA1NXkdv6bMIeZnvXdy0WQkyhlQtPWDDj56OyUarpgmViA/cab5KkFkWYmNORjG1C
	SPFjCtpdbE5HSZr1GOwIHaqVMdcUudBdsDzt/7XCETkgM/iy8X9L03MsyHyEifJjmwTpKuLkfI1
	NrZhObH8vqDQyE/yXfR4LzPUfhdFMlYIHam4mwdqu87t2Uw/vhbSyOLugTUCqK4ZlVow6li9I/7
	SatB2lnXToOSE2FurywP9WaoAC4R+2B2xCLZLFHcoEADHohD7oVsM7eEymYctPHj/KvuskO7I7s
	4UQqaCJ4sUlTpa1hnehSfPb7D9csiIZZSaCLhvQINUjmS72kPr8AUUnCLtK25fO/AIgImloH9J/
	IEZsDwM8/xCm8y9p8dztxZAzc2Pgwl+L7XiCxlMAa4sDbLagc7AMBDoPPjjAJN56g9tSwxa4pFa
	bMrDqsyuyrEgWfhmSnPiaw9CNF/VPYnMapWB0G2rTbMPIrQxXuEnC1y1VhbySlJ2TUy7tPIMLL4
	RmHAZzN8MpybV8UhMOPuZw/2egcPChUGNmOQG4UmHzvrZJgcO7c=
X-Received: by 2002:a17:90b:3a48:b0:3ab:413:49b6 with SMTP id 98e67ed59e1d1-3ab3a79a2d8mr1074419a91.41.1791530523677;
        Fri, 09 Oct 2026 00:22:03 -0700 (PDT)
Received: from setsuna.localnet ([2403:581e:d87e:0:fc2d:ed31:e80e:412d])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ab397920b4sm1115948a91.4.2026.10.09.00.21.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 09 Oct 2026 00:22:02 -0700 (PDT)
From: James Calligeros <jcalligeros99@gmail.com>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: David Rhodes <david.rhodes@cirrus.com>,
 Richard Fitzgerald <rf@opensource.cirrus.com>,
 Martin =?UTF-8?B?UG92acWhZXI=?= <povik+lin@cutebit.org>,
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Jaroslav Kysela <perex@perex.cz>,
 Takashi Iwai <tiwai@suse.com>, Matthias Brugger <matthias.bgg@gmail.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Shenghao Ding <shenghao-ding@ti.com>, Kevin Lu <kevin-lu@ti.com>,
 Baojun Xu <baojun.xu@ti.com>, Sen Wang <sen@ti.com>,
 Sven Peter <sven@kernel.org>, Janne Grunau <j@jannau.net>,
 Neal Gompa <neal@gompa.dev>, asahi@lists.linux.dev,
 linux-sound@vger.kernel.org, patches@opensource.cirrus.com,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org
Subject: Re: [PATCH v2 05/21] ASoC: dt-bindings: Add binding for Apple Silicon Mac
 audio
Date: Fri, 09 Oct 2026 17:21:52 +1000
Message-ID: <rT1KWd0SSiuQLd7MLQWREA@gmail.com>
In-Reply-To: <20261009-daring-objective-flounder-c0b66d@quoll>
References: <20261004-macaudio-v2-0-7b47ed6335a8@gmail.com>
 <20261004-macaudio-v2-5-7b47ed6335a8@gmail.com>
 <20261009-daring-objective-flounder-c0b66d@quoll>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261009_002204_851921_B40D3512 
X-CRM114-Status: UNSURE (   9.53  )
X-CRM114-Notice: Please train this message.
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

On Friday, 9 October 2026 5:17:53=E2=80=AFpm Australian Eastern Standard Ti=
me=20
Krzysztof Kozlowski wrote:
> On Sun, Oct 04, 2026 at 04:03:32PM +1000, James Calligeros wrote:
> > +examples:
> > +  - |
> > +    sound {
> > +      compatible =3D "apple,j416-macaudio", "apple,j316-macaudio";
> > +      model =3D "MacBook Pro J416";
> > +
> > +      #address-cells =3D <1>;
> > +      #size-cells =3D <0>;
> > +
> > +      dai-link@0 {
> > +        reg =3D <0>;
> > +        link-name =3D "Speakers";
> > +
> > +        dai-tdm-idle-mode-0 =3D "zero";
> > +        dai-tdm-idle-mode-3 =3D "zero";
> > +        dai-tdm-slot-tx-idle-mask-0 =3D <0xf0f0f0>;
> > +        dai-tdm-slot-tx-idle-mask-3 =3D <0x0f0f0f>;
> > +
> > +        codec {
> > +          sound-dai =3D <&speaker_left_woof1>,
> > +                      <&speaker_left_tweet>,
> > +                      <&speaker_left_woof2>,
> > +                      <&speaker_right_woof1>,
> > +                      <&speaker_right_tweet>,
> > +                      <&speaker_right_woof2>;
> > +        };
> > +
> > +        cpu {
> > +          sound-dai =3D <&mca 0>, <&mca 1>;
> > +        };
> > +      };
> > +
> > +      dai-link@1 {
> > +        reg =3D <1>;
> > +        link-name =3D "Headphone Jack";
> > +
> > +        codec {
> > +          sound-dai =3D <&jack_codec>;
> > +        };
> > +
> > +        cpu {
> > +          sound-dai =3D <&mca 2>;
>=20
> Example looks incomplete, you miss TDM slot properties.

The machine driver generates the TDM slot assignments for the DAIs
and sets them at runtime.





