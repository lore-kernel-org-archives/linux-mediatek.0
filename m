Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6F17BC369B2
	for <linux-mediatek@archiver.kernel.org>; Mon, 14 Apr 2025 12:46:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:References:In-Reply-To:Date:Cc:To:From
	:Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=D1V8ghNFhSQVvyCHqapThgtbdBVpNPOOv/+xtuw1fLY=; b=PArgrE17zIzspOjfh4YrGzdJaj
	gmsMfDvnNQ7U25ANu0YNkNjw9VD8eaL/QHGJQAfuV0ubbLVbmsEo6e30fuX80JpNM1cC93KN36s/p
	ih4BFWR4AE8MesVDXPQdLhKthOT/UjAGNTXi8zsMOBe+gM3ce27Nc4He5ZPyBQQfo1KCnzofmNubd
	AvPcF0Hlc+BZMEAZ2nbY/6HJlW96O+Ln2ylmHZbTX0L8lbT8tHbl8yjtzoNbSWFTvRAznRxK2ZfVq
	GsqDdbXKkbm8pN2xhsjfbkWJgmK3wfD2/9QWY4pJ7F8XsyUBx+W+cCeP6SGaeForBCwmebDBYOQ/T
	DJAwmxng==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u4JCy-00000001zyr-1wh6;
	Mon, 14 Apr 2025 12:46:40 +0000
Received: from mail-qt1-x82b.google.com ([2607:f8b0:4864:20::82b])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u4J7C-00000001zDq-1ohp
	for linux-mediatek@lists.infradead.org;
	Mon, 14 Apr 2025 12:40:43 +0000
Received: by mail-qt1-x82b.google.com with SMTP id d75a77b69052e-4775ce8a4b0so69099101cf.1
        for <linux-mediatek@lists.infradead.org>; Mon, 14 Apr 2025 05:40:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ndufresne-ca.20230601.gappssmtp.com; s=20230601; t=1744634441; x=1745239241; darn=lists.infradead.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=D1V8ghNFhSQVvyCHqapThgtbdBVpNPOOv/+xtuw1fLY=;
        b=zqwyLBKxjv0ivYK81HZy0kp4hgngR75vWBqnekDRPRyjoJYzOaVf6BCgFwQHepm1fE
         G3aGfpJTtg+71JJiMye8jy+xJKLz8kQVgc2qxzBqikVT08XXYgP4RrisZ+10aSPYq703
         4bQRrkYN9/D8by1d/U/pE6HOLbjSmFNImD6tk7EoQ3BYEo6WqWbBVPfSJqLMNgs8leEJ
         J/XAj5CnCV/cNmRmxW0hlxcffKTmgUslFLeHTCbjf6VRlNct/fJl/Bl57+0dD/SZQ3Km
         7kl6BkVWnQCUYsfpiurVtaTqpDfgRYlFg4PDG2PTyPvm1Iyl5qPuyhfDcOrwqpZWqNUv
         CR6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744634441; x=1745239241;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=D1V8ghNFhSQVvyCHqapThgtbdBVpNPOOv/+xtuw1fLY=;
        b=TTwwnlx0FyBCm9KXJ6RyT8NOcPZZOZJeV9ZVqD99dkB+xB3Y9Uo0iQHc8H23mkjIWJ
         sEbJIG6IfN+btNccK3YXcAx2xGq4HqciKWS9FY+wBYz1BPQrGgqyAKqdU+huMoPN/V1z
         8lrSACs9eec/mODqAibvkNDlWcY7in3L7DvbsYqpFQYGs/nSpyTSrkWD4jozX4HwRUsA
         FmNv0fHs33KLIwjlTO320QNimBCQCzdv6MI5n3e0YTYdMoxygKUVquyVym9Qul7TJeVt
         khhPrdot74D99Q+bmHFfAh0FOl2NBct/edWL2gkYV6LIQmk5TKp88NSleIPrs4wlqazu
         AzjQ==
X-Forwarded-Encrypted: i=1; AJvYcCXOzOz69RmvhDF6tJ67NeXGATBdsmC/bTle2ywjqUvIDzoUIjh/GK1yxRl2o75YVf6Xo42drMjHEHrD4jOx+Q==@lists.infradead.org
X-Gm-Message-State: AOJu0YzNIi9mQKbVA2xLx9SkCRcNTRSozZYAgPI1EUmGkGLzMX/rqQIv
	r/EBQItjTb1m7380y1Xq5EW3vnsCroFj9EkXyO8DTOLB2y32y0XuwNELSikCjVw=
X-Gm-Gg: ASbGncv7dXufYkR5szpvRLGh8XuMqc/voVKyaSPDOLmC5s7csrdbOFxFrnNz0ar2k41
	WTOW2Ac3FkXdsI1TQmzWIckMBJwNDq1UeQg2+2PtuFRv7IjP4+t53MhXqbOW9oCEF+j2fyL38pS
	UgJ561LNtZN+d83xLFmLBo1At/DUw0Svo0sLlnITsC6fW7J3HAxsc0y05WA5s4LlOQ/f4pnspqR
	Nozpyr1KNMfwNuKHxxMPJZZDaMQOAD9GbZCmutpHK0nszu88EM7KSJ0LyNdwPFllvnkmLcP2BSI
	MSXycotWTzYhQOJzfnKoDBG26X5ZGrmiCO8O/Z+8EFssExFBsjYeiawI
X-Google-Smtp-Source: AGHT+IHzRC5MPk4gCdZQDiLMvimp8F/pyevk6/f63+hfdgj8+aLB0yoSTDhdEMEr6WLqPX5YOYzzJQ==
X-Received: by 2002:a05:622a:1892:b0:477:6f2c:4a07 with SMTP id d75a77b69052e-4797750fda2mr191211911cf.4.1744634441327;
        Mon, 14 Apr 2025 05:40:41 -0700 (PDT)
Received: from ?IPv6:2606:6d00:11:e976::c41? ([2606:6d00:11:e976::c41])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-4796eb2b4easm73431781cf.34.2025.04.14.05.40.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Apr 2025 05:40:40 -0700 (PDT)
Message-ID: <e79a3bfb0cb57fea17ad7852ce3b4fe720c2cbd2.camel@ndufresne.ca>
Subject: Re: [PATCH v1 2/3] dt-bindings: media: mediatek: mdp3: Add
 compatibles for MT8188 MDP3
From: Nicolas Dufresne <nicolas@ndufresne.ca>
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
	chunkuang.hu@kernel.org
Cc: p.zabel@pengutronix.de, airlied@gmail.com, simona@ffwll.ch, 
	maarten.lankhorst@linux.intel.com, mripard@kernel.org, tzimmermann@suse.de,
 	robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
 mchehab@kernel.org, 	matthias.bgg@gmail.com, moudy.ho@mediatek.com,
 dri-devel@lists.freedesktop.org, 	linux-mediatek@lists.infradead.org,
 devicetree@vger.kernel.org, 	linux-kernel@vger.kernel.org,
 linux-media@vger.kernel.org, 	linux-arm-kernel@lists.infradead.org,
 kernel@collabora.com, 	sebastian.fricke@collabora.com,
 macpaul.lin@mediatek.com
Date: Mon, 14 Apr 2025 08:40:39 -0400
In-Reply-To: <20241218105320.38980-3-angelogioacchino.delregno@collabora.com>
References: <20241218105320.38980-1-angelogioacchino.delregno@collabora.com>
	 <20241218105320.38980-3-angelogioacchino.delregno@collabora.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.0 (3.56.0-1.fc42) 
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250414_054042_487228_5B93B755 
X-CRM114-Status: UNSURE (   9.66  )
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

Le mercredi 18 d=C3=A9cembre 2024 =C3=A0 11:53 +0100, AngeloGioacchino Del =
Regno a =C3=A9crit=C2=A0:
> Add compatible strings for the FG, HDR, RSZ, STITCH, TCC, TDSHP
> and WROT hardware components found in MediaTek's MT8188 SoC.
>=20
> This hardware is compatible with MT8195.
>=20
> Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@coll=
abora.com>

Acked-by: Nicolas Dufresne <nicolas.dufresne@collabora.com>

> ---
> =C2=A0.../devicetree/bindings/media/mediatek,mdp3-fg.yaml=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0 | 8 ++++++--
> =C2=A0.../devicetree/bindings/media/mediatek,mdp3-hdr.yaml=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 | 8 ++++++--
> =C2=A0.../devicetree/bindings/media/mediatek,mdp3-rsz.yaml=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 | 1 +
> =C2=A0.../devicetree/bindings/media/mediatek,mdp3-stitch.yaml=C2=A0=C2=A0=
 | 8 ++++++--
> =C2=A0.../devicetree/bindings/media/mediatek,mdp3-tcc.yaml=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 | 8 ++++++--
> =C2=A0.../devicetree/bindings/media/mediatek,mdp3-tdshp.yaml=C2=A0=C2=A0=
=C2=A0 | 8 ++++++--
> =C2=A0.../devicetree/bindings/media/mediatek,mdp3-wrot.yaml=C2=A0=C2=A0=
=C2=A0=C2=A0 | 1 +
> =C2=A07 files changed, 32 insertions(+), 10 deletions(-)
>=20
> diff --git a/Documentation/devicetree/bindings/media/mediatek,mdp3-fg.yam=
l b/Documentation/devicetree/bindings/media/mediatek,mdp3-fg.yaml
> index 03f31b009085..40fda59fa8a8 100644
> --- a/Documentation/devicetree/bindings/media/mediatek,mdp3-fg.yaml
> +++ b/Documentation/devicetree/bindings/media/mediatek,mdp3-fg.yaml
> @@ -16,8 +16,12 @@ description:
> =C2=A0
> =C2=A0properties:
> =C2=A0=C2=A0 compatible:
> -=C2=A0=C2=A0=C2=A0 enum:
> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 - mediatek,mt8195-mdp3-fg
> +=C2=A0=C2=A0=C2=A0 oneOf:
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 - enum:
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 - mediatek,mt8195=
-mdp3-fg
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 - items:
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 - const: mediatek=
,mt8188-mdp3-fg
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 - const: mediatek=
,mt8195-mdp3-fg
> =C2=A0
> =C2=A0=C2=A0 reg:
> =C2=A0=C2=A0=C2=A0=C2=A0 maxItems: 1
> diff --git a/Documentation/devicetree/bindings/media/mediatek,mdp3-hdr.ya=
ml b/Documentation/devicetree/bindings/media/mediatek,mdp3-hdr.yaml
> index d4609bba6578..d9f926c20220 100644
> --- a/Documentation/devicetree/bindings/media/mediatek,mdp3-hdr.yaml
> +++ b/Documentation/devicetree/bindings/media/mediatek,mdp3-hdr.yaml
> @@ -16,8 +16,12 @@ description:
> =C2=A0
> =C2=A0properties:
> =C2=A0=C2=A0 compatible:
> -=C2=A0=C2=A0=C2=A0 enum:
> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 - mediatek,mt8195-mdp3-hdr
> +=C2=A0=C2=A0=C2=A0 oneOf:
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 - enum:
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 - mediatek,mt8195=
-mdp3-hdr
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 - items:
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 - const: mediatek=
,mt8188-mdp3-hdr
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 - const: mediatek=
,mt8195-mdp3-hdr
> =C2=A0
> =C2=A0=C2=A0 reg:
> =C2=A0=C2=A0=C2=A0=C2=A0 maxItems: 1
> diff --git a/Documentation/devicetree/bindings/media/mediatek,mdp3-rsz.ya=
ml b/Documentation/devicetree/bindings/media/mediatek,mdp3-rsz.yaml
> index f5676bec4326..8124c39d73e9 100644
> --- a/Documentation/devicetree/bindings/media/mediatek,mdp3-rsz.yaml
> +++ b/Documentation/devicetree/bindings/media/mediatek,mdp3-rsz.yaml
> @@ -20,6 +20,7 @@ properties:
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 - mediatek,m=
t8183-mdp3-rsz
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 - items:
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 - enum:
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0 - mediatek,mt8188-mdp3-rsz
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 - mediatek,mt8195-mdp3-rsz
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 - const: med=
iatek,mt8183-mdp3-rsz
> =C2=A0
> diff --git a/Documentation/devicetree/bindings/media/mediatek,mdp3-stitch=
.yaml b/Documentation/devicetree/bindings/media/mediatek,mdp3-stitch.yaml
> index d815bea29154..1d8e7e202c42 100644
> --- a/Documentation/devicetree/bindings/media/mediatek,mdp3-stitch.yaml
> +++ b/Documentation/devicetree/bindings/media/mediatek,mdp3-stitch.yaml
> @@ -16,8 +16,12 @@ description:
> =C2=A0
> =C2=A0properties:
> =C2=A0=C2=A0 compatible:
> -=C2=A0=C2=A0=C2=A0 enum:
> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 - mediatek,mt8195-mdp3-stitch
> +=C2=A0=C2=A0=C2=A0 oneOf:
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 - enum:
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 - mediatek,mt8195=
-mdp3-stitch
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 - items:
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 - const: mediatek=
,mt8188-mdp3-stitch
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 - const: mediatek=
,mt8195-mdp3-stitch
> =C2=A0
> =C2=A0=C2=A0 reg:
> =C2=A0=C2=A0=C2=A0=C2=A0 maxItems: 1
> diff --git a/Documentation/devicetree/bindings/media/mediatek,mdp3-tcc.ya=
ml b/Documentation/devicetree/bindings/media/mediatek,mdp3-tcc.yaml
> index 14ea556d4f82..6cff7c073ce4 100644
> --- a/Documentation/devicetree/bindings/media/mediatek,mdp3-tcc.yaml
> +++ b/Documentation/devicetree/bindings/media/mediatek,mdp3-tcc.yaml
> @@ -17,8 +17,12 @@ description:
> =C2=A0
> =C2=A0properties:
> =C2=A0=C2=A0 compatible:
> -=C2=A0=C2=A0=C2=A0 enum:
> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 - mediatek,mt8195-mdp3-tcc
> +=C2=A0=C2=A0=C2=A0 oneOf:
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 - enum:
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 - mediatek,mt8195=
-mdp3-tcc
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 - items:
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 - const: mediatek=
,mt8188-mdp3-tcc
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 - const: mediatek=
,mt8195-mdp3-tcc
> =C2=A0
> =C2=A0=C2=A0 reg:
> =C2=A0=C2=A0=C2=A0=C2=A0 maxItems: 1
> diff --git a/Documentation/devicetree/bindings/media/mediatek,mdp3-tdshp.=
yaml b/Documentation/devicetree/bindings/media/mediatek,mdp3-tdshp.yaml
> index 8ab7f2d8e148..cdfa27324738 100644
> --- a/Documentation/devicetree/bindings/media/mediatek,mdp3-tdshp.yaml
> +++ b/Documentation/devicetree/bindings/media/mediatek,mdp3-tdshp.yaml
> @@ -16,8 +16,12 @@ description:
> =C2=A0
> =C2=A0properties:
> =C2=A0=C2=A0 compatible:
> -=C2=A0=C2=A0=C2=A0 enum:
> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 - mediatek,mt8195-mdp3-tdshp
> +=C2=A0=C2=A0=C2=A0 oneOf:
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 - enum:
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 - mediatek,mt8195=
-mdp3-tdshp
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 - items:
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 - const: mediatek=
,mt8188-mdp3-tdshp
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 - const: mediatek=
,mt8195-mdp3-tdshp
> =C2=A0
> =C2=A0=C2=A0 reg:
> =C2=A0=C2=A0=C2=A0=C2=A0 maxItems: 1
> diff --git a/Documentation/devicetree/bindings/media/mediatek,mdp3-wrot.y=
aml b/Documentation/devicetree/bindings/media/mediatek,mdp3-wrot.yaml
> index 53a679338402..b6269f4f9fd6 100644
> --- a/Documentation/devicetree/bindings/media/mediatek,mdp3-wrot.yaml
> +++ b/Documentation/devicetree/bindings/media/mediatek,mdp3-wrot.yaml
> @@ -20,6 +20,7 @@ properties:
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 - mediatek,m=
t8183-mdp3-wrot
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 - items:
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 - enum:
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0 - mediatek,mt8188-mdp3-wrot
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 - mediatek,mt8195-mdp3-wrot
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 - const: med=
iatek,mt8183-mdp3-wrot
> =C2=A0

