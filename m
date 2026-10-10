Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9D91CCA9EBB
	for <linux-mediatek@archiver.kernel.org>; Sat, 10 Oct 2026 02:48:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Ol+wvlr2CdZCdXa+I/bU7xRVzRqJragTtCzufPOHHa8=; b=NI0XnA80tdwsaaMZHjCGYMlyJx
	pWpPafTP331fvSRdutmF1o4iLkhZ8f9LwdbZ4CDudhf1ZQmIEn3okZ49Wzly+EGdxtn7kHuUAhM9M
	3lGhVXTsaJ9BlulWdJhg2wK0JDjvdw+LuQqGNpOarFsTtJjk51A+0ZN/0a/qRF2S83HuZPIQmsYsd
	zOlDlXaP+Xi26z/aha9aCovq36CskieiAmdFKOrTb7RDafhDjsa23gbN0uyKD/v+pDDPBsfIj/jqz
	rvxEaFeoHy8hbxbRfEfjY/m5KnWMLhLBBl+ktzypOT6HK34GXNkFFexEiBmeDNZSsELRMkslTgk7D
	9EkGu9Vg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xFN8n-00000007RS1-27wE;
	Sat, 10 Oct 2026 02:48:53 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xFN8l-00000007RRb-3uTs
	for linux-mediatek@bombadil.infradead.org;
	Sat, 10 Oct 2026 02:48:52 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Type:Content-Transfer-Encoding
	:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=Ol+wvlr2CdZCdXa+I/bU7xRVzRqJragTtCzufPOHHa8=; b=mEgS33hyeceHoeGmJP1/FGxU1R
	KnEeZtUSM17HonIxsiPBQewGN1xzF8H73keexU0UFo/14GImQFfxGpYi7MGP5a4bixyV2F3s0nJU2
	Jfw5+sjye7GIG0CV9xOo4lBQ97veWeQ7X2162HYvF/8tJWiRCiQnYEUtKTCWW3HSkQnt9oyQrCfrE
	JOFmjTi8cOyorrUlY/006ZZ5wUBCwWau5wP/xQVKT9FHAyCJGo+hwsbcm+VfPzN+4TyJG4gxKP6Cw
	xbeM3ghbuTAzzB9V3AiAkEYliMBEdezlOwygcRyLoU//5U9O8l6SEL6qsTsenct/XGX9XazjuZzOL
	k+8KJllg==;
Received: from mail-pj1-x1032.google.com ([2607:f8b0:4864:20::1032])
	by desiato.infradead.org with esmtps (Exim 4.99.2 #2 (Red Hat Linux))
	id 1xFN8i-0000000BmnO-0khs
	for linux-mediatek@lists.infradead.org;
	Sat, 10 Oct 2026 02:48:50 +0000
Received: by mail-pj1-x1032.google.com with SMTP id 98e67ed59e1d1-381b831d535so255819a91.0
        for <linux-mediatek@lists.infradead.org>; Fri, 09 Oct 2026 19:48:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791600525; x=1792205325; darn=lists.infradead.org;
        h=content-type:content-transfer-encoding:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Ol+wvlr2CdZCdXa+I/bU7xRVzRqJragTtCzufPOHHa8=;
        b=e/qgQwqzf5bbAv3C8ZBP+/k4yPFunHlPsSMi+GXm1gylqXhQdcGO7QElg1rB+j21hm
         z2X9ZvpIuAu36rH70dxeeHYQ/JxI1tWf0xtFVBeUOh8VxUa6rQjQsppcNc16BBOQF6KP
         nXsYyLCVMyoccPHKiE+rdFqW/+z4HYnPb9isUYEyxqVYTdEjOQkd8FNl8ioHvuDxXO21
         YtG5UodLXQLWO7JxYhSSyUFqa1R5VNvruPhNgE3EdwCZgfgJXfnr/fGBgAnfs2NHdp3d
         w9kzyq2zkJ356PyKrx42vjf/pUHjM+Sl3aCb0bagDG2VXMHptiFc0tQgGs+NmOo6xkQc
         9aaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791600525; x=1792205325;
        h=content-type:content-transfer-encoding:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Ol+wvlr2CdZCdXa+I/bU7xRVzRqJragTtCzufPOHHa8=;
        b=T62Y+AoOrfoaHJksFt9XBvSxZ47M7gcFtRqkKNVAgtZYSbGvdarqPoZkAC0zul+y/Q
         ss3hZNDcM3nUIAcC9Jtwx3Ax5kQnsoK/5ZZ0dOF4f9M/9FmJwgCzkF5l5QNFb/7x7M4K
         Hi3p1uljrJNjC6ssVss2BS6v1PyPSuJ1cbNdnPb/pmzaQHnN9vqzVVavB9h6vBYeND91
         czKPJQW/YojVbqGCmfKB4ratQYKBVwLIQCnNJ8KpG5ZU04Da8/nNUevfyetANOpnbhlZ
         H512JyGrY31tACEgy2AZjmp0REFoaEQln5dLg6DXpY9ZnRBRgSNS861naS1XlA+nRNnv
         q4rg==
X-Forwarded-Encrypted: i=1; AKwUvBzszgnEgt7QC4pe/LGswtssyocGNOKyTg2NBuTo+Ko5+WxKaSbN7UHdJWXFCZwWd+lCGecasflGkGta3DtGOA==@lists.infradead.org
X-Gm-Message-State: AFq9FYLts6Cp2ZJRSqv8I0t9cqjM4m4Vsg9BsJAu+kVty0h3uQjxoqf7
	3rPStfQSZf76SR6hLsyP22o5fnYohCOLLivEEPntSWI23itKgfpmGfW7
X-Gm-Gg: AYBFou0eu0NQ2iL8BQLnfvK1nplUvFx+VWCXzOiPQnrufOIIxXr6lVfpxB3awxFu57+
	VoyqWrIBJe0hLrSelywqnSMBqaJau/7yUhD4gnNDlSJgtelgN8VG0C4I4+Rclpijz+Ty9XuESJ/
	Vll9RnA61O8Iuw7AaiR4cA7rBLlZqnqFrw+fbsnFsGzhkFeesoz8ZyS69K/KNRgGJHYZjDb3Q6Y
	nGDcgaQosnNqKA+FBPnsP/0C38FVfYH8q/KsTROcRooRy8wg+eMqFtxROZ1EIcwrtqlR1loj5yh
	Ndf2901gfitA177okSLER/SeP61hRltOPT09DAJ7ECr3gytGa1NvjCoMkZv/T+svCJap6G3Un3H
	DvRgr38/d3NsX7d9Nf+BSJl1w0iArsX+BoNQhwyekZxNjlE/o6MBV4XFd7Dy5AAt5CgHNrCce7f
	igiOamCXUOteKSgYPwjIbHJ7/WUayR20AWZdnQ9YjU3wmwwxcvBlxxpPexo0PpdScaidWU3Fp7/
	CVyeEmC7iDRYyOvfVVi9TEp+P4IKYNiQC6yXfJtCT5HyqHWxTQYGP4KvD/S3jCGZFQ5rc96gH+d
	a8RO6qetVJbm6QfOU0R1rljloqXbJddGNLdI22pg6VeGcDX8Mrs=
X-Received: by 2002:a17:90b:5887:b0:3ab:364a:9532 with SMTP id 98e67ed59e1d1-3ab3acc548fmr3728946a91.44.1791600525144;
        Fri, 09 Oct 2026 19:48:45 -0700 (PDT)
Received: from setsuna.localnet ([2403:581e:d87e:0:fc2d:ed31:e80e:412d])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ab36ed040dsm7675161a91.6.2026.10.09.19.48.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 09 Oct 2026 19:48:44 -0700 (PDT)
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
Date: Sat, 10 Oct 2026 12:48:34 +1000
Message-ID: <m3VYUqb-SXeeNuWXNMFX0A@gmail.com>
In-Reply-To: <20261009-daring-objective-flounder-c0b66d@quoll>
References: <20261004-macaudio-v2-0-7b47ed6335a8@gmail.com>
 <20261004-macaudio-v2-5-7b47ed6335a8@gmail.com>
 <20261009-daring-objective-flounder-c0b66d@quoll>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261010_034848_964450_74BA51D2 
X-CRM114-Status: GOOD (  11.91  )
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
> > +    patternProperties:
> > +      "^dai-tdm-idle-mode-[0-9]$":
> > +        $ref: tdm-slot.yaml#/properties/dai-tdm-idle-mode
>=20
> This looks like you put several slots into one. TDM slot is for one
> slot, no?

The codec bus keepers (which these properties exist to support) only
need to be configured on one codec for the left and one codec for the
right. We use the "main" L and R woofer codecs for this purpose, so
the extension of the properties like this allows us to specify which
codec's bus keeper should be set up, as we need to support machines
with 6, 4, 2 and 1 speaker(s).



