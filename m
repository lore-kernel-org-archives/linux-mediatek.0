Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E3BCFCFA751
	for <linux-mediatek@archiver.kernel.org>; Fri, 21 Nov 2025 08:38:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Subject:Cc:To:From:Date:Message-ID:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=2qSXvzlmdS35P7fsTtvXLVpdTT/36B4mvzOkNUVsHgc=; b=RmZeS4ugRIpG1tiU2obfTj3DWg
	bm0NDel0gsue89gPX9A6BLjwvIGUug5AfoTv6REpReOZFJc260hjL+TTmulZD9pLCGOu/xzoUiULm
	E47J4V35su8emOPsnV1nyzs2NHJzA0Rctkl1/I+naZCgGns5XaAzMyk45V66iT/8xJDrPZQ25ynjN
	ju+ULvvNp8bd7Q3DXM54zaQQ+gzzYXcTsgGpaI/8s5h3HlAn05KvaxG8f92QjgSaEjZ3SCKokPMcw
	v0vrg+1VhEbRHEE0CQyWXgpNH6zW6zDNAlF3bVvzdpixB4zRlLcpMAulvsOVi3a3KS1gcIuY1KsN7
	Q2sMEFOA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vMMeY-000000085Iw-0F6D;
	Fri, 21 Nov 2025 08:38:02 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vMMeX-000000085IX-0Fbv
	for linux-mediatek@bombadil.infradead.org;
	Fri, 21 Nov 2025 08:38:01 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=In-Reply-To:Content-Type:MIME-Version:
	References:Subject:Cc:To:From:Date:Message-ID:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=2qSXvzlmdS35P7fsTtvXLVpdTT/36B4mvzOkNUVsHgc=; b=S5cva67oS95vUtmfhUSVuUITx9
	aH+mdU6szD/6HI7TS8FD5a8oASLT8ZJHJhvLlRdyjek19XzPNoRKN0HdDn3I5Fsn+IJSRJnRYND4J
	uWRtxACo3T7rCdTeLm5rHbWP1wSnnun4n9l63UN7Xn85pO30y+oOiuq3JkfRJOGKsu0aQ2/t2BnJF
	mtDo7OY23UnSNEqFbJHSOt/XiMavomlpS3W7GikYgTMOTuD0vC0G1UFLbGX4GZggXSx6umDMyZnVE
	7BoDWoKk9wW7H944R2teYLgRnkpW9M75mXzi7hgGQCf30lMZPY/7c7DaBzfUY2P8d0RnipZAD+v48
	ELhapAwg==;
Received: from mail-wm1-x329.google.com ([2a00:1450:4864:20::329])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vMLmr-0000000GKL1-1y2c
	for linux-mediatek@lists.infradead.org;
	Fri, 21 Nov 2025 07:42:35 +0000
Received: by mail-wm1-x329.google.com with SMTP id 5b1f17b1804b1-47775fb6c56so15100925e9.1
        for <linux-mediatek@lists.infradead.org>; Fri, 21 Nov 2025 00:37:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1763714276; x=1764319076; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:subject:cc
         :to:from:date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=2qSXvzlmdS35P7fsTtvXLVpdTT/36B4mvzOkNUVsHgc=;
        b=MjR/WIJqdfIYgUvkVNPr3zuUFscGmonjdV5wHNW6GSTKth4untqkawU1LiHBJa9LX0
         jbjNo/oKOJtUOMU97fJ2cenYhtmdQyP65zd+2WgYjzZuHmifG+B3fI+zVYDJd9HXaJBS
         bQE++2KVoxK0Sd0HDOlrX6ZYCG/Im6iJe4zdtL1SApc56fj7ujTHeQeGHbQjpoyKd0JE
         7awbO+Ii4/J3uT3OYgptT+hYApmFhibyCmMk19ISNTbdxmBCOaogg+5ChCsegEGMm1lq
         d17qI9E4a8fMDIVJy/stOIIjxzIQamyu6JwUtAZIx7xl82sqm6xsY4rP4+DpA1bwNjTG
         UCxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763714276; x=1764319076;
        h=in-reply-to:content-disposition:mime-version:references:subject:cc
         :to:from:date:message-id:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=2qSXvzlmdS35P7fsTtvXLVpdTT/36B4mvzOkNUVsHgc=;
        b=CrjSKEwseSEFVj1zcNj7yvLHqzI1nZ/rtHLG6RG8qGV7JXHj8MpZzkGvPaVS7Q3T2C
         bAPe3cxJA1uWXOiLgI5qfRbtU3R72m9tleEIAQcBJuAlV700bdQhGJ2QreAKgqAx+6Hy
         8ncbBqpzY8885mHnz+mU9oiyidMOWmm/AEkL06wiMBfXUJiE00Jxt/blU0xmwgHHXtDc
         OftoT/zpzGWWaNcrgvjAM/2MZXTLs17Hv8V9ees5mVf+uLN5q1z4m4z3/k7dfmh3H0Qb
         k54qRrDuWaRFJI1FP1CsxeHoOsNkpbTs1WxRnJD/GSQb+5GLXOb+Ov+JWLX4weXRghpi
         MeLQ==
X-Forwarded-Encrypted: i=1; AJvYcCWYCZhdZ9CvAExFpOnLJDPlO7b8wsInEmvJwYOH/KlT88zPKp9QUg2afmvD68K3KvWsI+w8ShQwFcUWAAYcGg==@lists.infradead.org
X-Gm-Message-State: AOJu0YzVIt7eARSf5vFWQ1iR9NIQWU1zBNL7o4PXm9IJFyhyzt0WIp2f
	PBCA/NQKdIEQOHCf5eMDMv1hdM1SbzwIu6eHr1zCOf4QYagXd1Y4S5qy
X-Gm-Gg: ASbGncsDJi1n7M0SkqUdC+EoJXymolNSgj6DmJSRXw2dRnBlsVX2BJq39v5DA7p2HXu
	IVKCpsSkUTa6C/ZxNrq1J86axe7t+TFghll0eIqAU0nRFE23opSPmynHpXf7fV7j7cc/bKi2lXk
	dll6dKisVS8kjP5Mz9LC+SUv+gOqrUF2GMhIhQ8MsLQWKZc1NhPNQ2TTCHoSSvnYIpVVewsGblC
	mADrJB4W2y5RJniNjjBm0hmYhetbLTGM8dlnx5YsorrTCGoxxAVTq7GxPfoq2XHxZa8yB2pgaY3
	Wt4zDwUEojyoKDisbLDag5ap6HSClXMACiQLG8/KSGwEEf9pnLjyZXtaDqM+HYo+0OhvlXJI/hE
	G3gnTa8YF5fJcsz1Hl8vFhDxb7fpF4kUo2Wn7/CzEk95HNm6srK8sQwBO4AAhDjiKyGJAkw6Q3D
	u/4Ii3FpwEXVRvvX1vZbpYI1bkIeog5EIGR5AM2lw=
X-Google-Smtp-Source: AGHT+IEA+dyN8n6gI9VghYdVrCVyA5Lkx+Pi/7Qw0bW1qYcQrv+1D9Mt2waBz7nsc6tPHypUcxzIAw==
X-Received: by 2002:a05:600c:35ce:b0:477:6d96:b3e5 with SMTP id 5b1f17b1804b1-477c016c071mr18413245e9.7.1763714275447;
        Fri, 21 Nov 2025 00:37:55 -0800 (PST)
Received: from Ansuel-XPS. (93-34-90-37.ip49.fastwebnet.it. [93.34.90.37])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-477a9deeb96sm82356155e9.4.2025.11.21.00.37.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 21 Nov 2025 00:37:55 -0800 (PST)
Message-ID: <692024e3.050a0220.183811.f1dc@mx.google.com>
X-Google-Original-Message-ID: <aSAk4XQ-S6d7iXUs@Ansuel-XPS.>
Date: Fri, 21 Nov 2025 09:37:53 +0100
From: Christian Marangi <ansuelsmth@gmail.com>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Cyril Chao <Cyril.Chao@mediatek.com>, Arnd Bergmann <arnd@arndb.de>,
	=?iso-8859-1?Q?N=EDcolas_F=2E_R=2E_A=2E?= Prado <nfraprado@collabora.com>,
	Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
	linux-sound@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org, upstream@airoha.com
Subject: Re: [PATCH v2 2/3] ASoC: dt-bindings: Add Airoha AN7581 AFE YAML
References: <20251121054537.25796-1-ansuelsmth@gmail.com>
 <20251121054537.25796-3-ansuelsmth@gmail.com>
 <20251121-daft-secret-collie-629a2c@kuoka>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251121-daft-secret-collie-629a2c@kuoka>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251121_074233_547211_D272E255 
X-CRM114-Status: GOOD (  19.88  )
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

On Fri, Nov 21, 2025 at 09:36:10AM +0100, Krzysztof Kozlowski wrote:
> On Fri, Nov 21, 2025 at 06:45:00AM +0100, Christian Marangi wrote:
> > Add documentation for Airoha AN7581 AFE YAML schema.
> 
> Drop YAML and YAML schema from subbect and commit description. See also
> submitting-patches in DT dir. You cannot add documentation for YAML
> schema. It's like adding a Linux driver for C code.
> 
> > 
> > Signed-off-by: Christian Marangi <ansuelsmth@gmail.com>
> > ---
> >  .../bindings/sound/airoha,an7581-wm8960.yaml  | 67 +++++++++++++++++++
> >  1 file changed, 67 insertions(+)
> >  create mode 100644 Documentation/devicetree/bindings/sound/airoha,an7581-wm8960.yaml
> > 
> > diff --git a/Documentation/devicetree/bindings/sound/airoha,an7581-wm8960.yaml b/Documentation/devicetree/bindings/sound/airoha,an7581-wm8960.yaml
> > new file mode 100644
> > index 000000000000..ebeda0876280
> > --- /dev/null
> > +++ b/Documentation/devicetree/bindings/sound/airoha,an7581-wm8960.yaml
> > @@ -0,0 +1,67 @@
> > +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> > +%YAML 1.2
> > +---
> > +$id: http://devicetree.org/schemas/sound/airoha,an7581-wm8960.yaml#
> > +$schema: http://devicetree.org/meta-schemas/core.yaml#
> > +
> > +title: Airoha AN7581 sound card with WM8960 codec
> > +
> > +maintainers:
> > +  - Christian Marangi <ansuelsmth@gmail.com>
> > +
> > +allOf:
> > +  - $ref: sound-card-common.yaml#
> > +
> > +properties:
> > +  compatible:
> > +    const: airoha,an7581-wm8960-sound
> > +
> > +  platform:
> > +    type: object
> > +    additionalProperties: false
> > +    properties:
> > +      sound-dai:
> > +        description: The phandle of AN7581 platform.
> > +        maxItems: 1
> > +    required:
> > +      - sound-dai
> > +
> > +  codec:
> > +    type: object
> > +    additionalProperties: false
> > +    properties:
> > +      sound-dai:
> > +        description: The phandle of wm8960 codec.
> > +        maxItems: 1
> > +    required:
> > +      - sound-dai
> > +
> > +unevaluatedProperties: false
> 
> Please place it after 'required:' block.
>

Thanks for the review. Will do!

> > +
> > +required:
> > +  - compatible
> > +  - audio-routing
> > +  - platform
> > +  - codec
> 
> Best regards,
> Krzysztof
> 

-- 
	Ansuel

