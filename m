Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6993E606A328
	for <linux-mediatek@archiver.kernel.org>; Wed,  4 Nov 2026 11:00:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=d6J5+fSu;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=t6Uemeas
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=GwE8Z7d8hC2B5A2aORLBN7ModRReguom9RWoATcO8ag=; b=d6J5+fSuPOw8R5vvTOO3IQ6E37
	NYMo/wJ2CV0T3AQNFG/cQzsktyfBNbkg5YMbFASym/J+toLOEivUomHX+izPiKELXhL3e1RqAlJDR
	UAEudMM494Lch7tsSgN1i3iuL+4PsgcG4SVUD1roosgRR/uh6+LtDwg/Ly563dH9E9XRq9D7LULN5
	yAyhyFD5v7BjcoqRThNOhYuqcHh5PlfHa7HOvc7hlNhzC2t918CdQfeG+Z63lxy4t+tEi8HwxhfVO
	gXPlq+XrWmZKKvQhw66usEWDkMgvHwbmzZMz7Nng1rcTZS7Z5ej49nNeKg2YvAaiVQn/TEbzxGP+4
	4HOdyNFg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOYiu-0000000554U-0XlB;
	Wed, 04 Nov 2026 11:00:08 +0000
Received: from mail-pl1-x636.google.com ([2607:f8b0:4864:20::636])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOYin-0000000551r-2EBz
	for linux-mediatek@lists.infradead.org;
	Wed, 04 Nov 2026 11:00:06 +0000
Received: by mail-pl1-x636.google.com with SMTP id d9443c01a7336-2e5378b281aso3216425ad.2
        for <linux-mediatek@lists.infradead.org>; Wed, 04 Nov 2026 03:00:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793790000; x=1794394800; darn=lists.infradead.org;
        h=content-type:content-transfer-encoding:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=GwE8Z7d8hC2B5A2aORLBN7ModRReguom9RWoATcO8ag=;
        b=t6Uemeasz/VEXAFAG44bHCEH9i9WE3hL0g5hqYwj23CMD/PFYvIyu8BeqqCNG/4dng
         QuxiIBlfomfgGzLwL02HZob/zsJdMokvo38h6hC/uS9ZrqdAqThcSGe87/o020luYuKQ
         fz/Bw/Ujd7Y6ozdBfJHdyQx51D8hEBLQy/NeTdJgB7y/rzSjnoEayj6DL5lrkba0DueT
         gPyxe93PVhc069ymowpQFxwAx10yFqMYx0rNtRr92Qghr45mJMwzrxnnGx2XDkybBeRs
         UJHWYzaZFdCO4YT/45Rdl7qhUPdpD2w+dchwJeROka55v4rptjF5BR/25CNsILlymyQW
         z5Jw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793790000; x=1794394800;
        h=content-type:content-transfer-encoding:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=GwE8Z7d8hC2B5A2aORLBN7ModRReguom9RWoATcO8ag=;
        b=PD0PICwYbbSWkml1vbIpWHrDPrMsDi5zcNw68yUfU6TSZWwDDvO45e6jEiJ/Qa+7mk
         Hs1vlFchdioqVCGhM8UHfuyZBo58oC4CL16v74pjyemSIkbZvtThiQtzjy2QTMGmIdtU
         ssazS9n15FddoVGVbO+b4bhAH5A/sctCYAq42+xVoK9/6WQSSVnMb7khkqE+ykxaCzty
         yp8GDmKBzKemJH9v/JrmTHVtddFBQxD/wWPayjgTnN+eCoGvpiEtTpMdCwnNDUGeDMhZ
         BIyDQyEI5Bt242RsGPS4SE23h69O1wfpN1jGDaTSuTt4Mxrgjj7aSj0bQh6E2Gn6+0Wk
         wt5A==
X-Forwarded-Encrypted: i=1; AKwUvBy1HshqKCJuAd/yrn7jLw1OHZzu/dN2OJLwJptrlPgKBMIcxqcUNnj+MNYqQ7XXkLq89UYp7u0Fe//l02BtqA==@lists.infradead.org
X-Gm-Message-State: APuU4Z+wINx4LJ7jVmY1bBf012fcK29GKav+7w9bFUjcNc8eLWqQKE84
	wKWQ0dgjO+RHqnb2fUAruJkOPjdoD0g/hwVATroSGgb/cqIinz9NZ+Fo
X-Gm-Gg: AYBFou12kzoAA6d/20CQTBP8e7PC8qu8eRebaWZPFaNmQ0ewRsDgI60Ldto0VNImJ35
	LNmMBwG2uF58a8FU4HTfSwIkufUF8DlE56MKWPd7Y0+4gD4/ZZDWYhNN3nMYKdSujVVCOi8dzKw
	UuvprgaEGoNoKJ+ALNB3C38Eo6Vaa08ww+vSJq/HBrpys1y8a6trnWgIqTPxOj+MFfa7FhRFVAx
	hx02mA5uMf8MRxdQGtGN4W0JDRTynVfOl7EP8OsHTRtzPGTF/yh48jwvl0N7RUMySsj1pBTxmrg
	OUuKmXV4yrYRQ11Waq0PCK3xZWvoZu+bDRc6rYw9Giil301mOjDyPGZLr9H7iSqD1fyK6xG7H0T
	//7s0duzi8VTVkagG+ldSF3+SH9hsNkXHcpXqsUBenTMBkWdvs5bsljC7WrXTTArxX69kFzNLZT
	LcChXYKnrd5Qm3vcHHYug6KF9Nx2cuhdqsiPzyZN6MPGlRz+2TNqQVOYfMPsgquI+9xyBgEtng9
	97WAUgodSgE77sAKhKmT8rtNW8xWKObkKohmTWWNA899oiMMovbuENkoGBYw6psTrJW/WawzUEh
	kZ15f+19Stg2GvscCeiGmslkiCCS5gnCcnIJUff0o3c7Yld9SiptskyaZp24lWt+ZWmb1jDprIS
	NlmHsBP8EKrbIT8KQSWef0eBaNoml9yyI4V5YDnT+FTCg5wltWj9qx5XesZnqdq7pVDi6O6ySOQ
	6xfLRz5ZaE5ImyEPQITf+GsYh1RQ==
X-Received: by 2002:a17:903:1844:b0:2e9:8bd4:577d with SMTP id d9443c01a7336-2eb364de4d8mr153487635ad.37.1793790000537;
        Wed, 04 Nov 2026 03:00:00 -0800 (PST)
Received: from minako.localnet ([2403:581e:d87e:0:739f:50a5:e171:f133])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ed090f7313sm5843875ad.45.2026.11.04.02.59.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Nov 2026 03:00:00 -0800 (PST)
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
Subject: Re: [PATCH v4 01/22] ASoC: dt-bindings: cs42l84: Allow referenced dai-common
 properties
Date: Wed, 04 Nov 2026 20:59:50 +1000
Message-ID: <nYufjgFVShG0c_ndRsefxw@gmail.com>
In-Reply-To: <20261104-eccentric-auk-of-zoology-55bcc4@quoll>
References: <20261103-macaudio-v4-0-637484efe46d@gmail.com>
 <20261103-macaudio-v4-1-637484efe46d@gmail.com>
 <20261104-eccentric-auk-of-zoology-55bcc4@quoll>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261104_030001_567199_90D6F8D5 
X-CRM114-Status: GOOD (  18.99  )
X-Spam-Score: -1.9 (-)
X-BeenThere: linux-mediatek@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-mediatek.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-mediatek/>
List-Post: <mailto:linux-mediatek@lists.infradead.org>
List-Help: <mailto:linux-mediatek-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mediatek>,
 <mailto:linux-mediatek-request@lists.infradead.org?subject=subscribe>
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
X-Spam-Status: No, score=-12.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Wednesday, 4 November 2026 8:48:25=E2=80=AFpm Australian Eastern Standar=
d Time=20
Krzysztof Kozlowski wrote:
> On Tue, Nov 03, 2026 at 05:39:49PM +1000, James Calligeros wrote:
> > Some consumers may wish to prepend the codec's name with a known value
> > to identify a specific codec among many and set #sound-dai-cells. Allow
> > this by allowing referenced properties from dai-common.yaml.
> >=20
> > Signed-off-by: James Calligeros <jcalligeros99@gmail.com>
> > ---
> >=20
> >  Documentation/devicetree/bindings/sound/cirrus,cs42l84.yaml | 8 ++++--=
=2D-
> >  1 file changed, 4 insertions(+), 4 deletions(-)
> >=20
> > diff --git a/Documentation/devicetree/bindings/sound/cirrus,cs42l84.yaml
> > b/Documentation/devicetree/bindings/sound/cirrus,cs42l84.yaml index
> > 94062c1d9d45..66cae8b7db5d 100644
> > --- a/Documentation/devicetree/bindings/sound/cirrus,cs42l84.yaml
> > +++ b/Documentation/devicetree/bindings/sound/cirrus,cs42l84.yaml
> > @@ -9,6 +9,9 @@ title: Cirrus Logic CS42L84 audio CODEC
> >=20
> >  maintainers:
> >    - Martin Povi=C5=A1er <povik+lin@cutebit.org>
> >=20
> > +allOf:
> > +  - $ref: dai-common.yaml#
> > +
> >=20
> >  description: |
> > =20
> >    The CS42L84 is a headphone jack codec made by Cirrus Logic and embed=
ded
> >    in personal computers sold by Apple. It was first seen in 2021 Macbo=
ok
> >=20
> > @@ -29,14 +32,11 @@ properties:
> >    interrupts:
> >      maxItems: 1
> >=20
> > -  '#sound-dai-cells':
> > -    const: 0
>=20
> This should not be removed. Why cells of 1 would be correct? If so,
> explain in commit msg.

This was unintentional, already fixed for v5.

>=20
> Best regards,
> Krzysztof

James



