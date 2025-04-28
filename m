Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 20284C369D5
	for <linux-mediatek@archiver.kernel.org>; Mon, 28 Apr 2025 19:40:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=kZL+y4O4nVB6WkTciMzCG9+Q8Gw1aprj/ilNSB+S7lA=; b=sVFgkE3TcKUZcwrkVELlNpnAIE
	+BfieY7PWV1n4YJpfqtLZvzUXn0DjlIm+/ytmNQMUNSVh5noP0H3ZzibaloKtadBzt8SPDT0/eUKq
	Q6mIhX/PeaVuzCyFJgUscZ7Vgz4/Jd+0K2J1eL1s1TuPraFJcU7rHn7JWoXPeNxNvMjs6TcFvATSD
	1NgQ5tWqfgVFxh8S/37g20/7h7ES4b6JQmEzozJ4cDUddUm+Hl1A5s13S3tr2W/n6FplziP0tGOlc
	kmH/t6BOc4vuxc6wqSkRP+1LBwhPD0bD38KDU6IFOWx0v03c9wJQtpknW4hM3ViNSA5AgLB3Byr3/
	o9aaB4CA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u9UKq-00000007N1y-0m7w;
	Mon, 28 Apr 2025 19:40:12 +0000
Received: from mail-pl1-x62a.google.com ([2607:f8b0:4864:20::62a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u9UIr-00000007Mk0-2BWI
	for linux-mediatek@lists.infradead.org;
	Mon, 28 Apr 2025 19:38:11 +0000
Received: by mail-pl1-x62a.google.com with SMTP id d9443c01a7336-22c3407a87aso77631055ad.3
        for <linux-mediatek@lists.infradead.org>; Mon, 28 Apr 2025 12:38:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1745869088; x=1746473888; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=kZL+y4O4nVB6WkTciMzCG9+Q8Gw1aprj/ilNSB+S7lA=;
        b=IszaJKvlI+d/2NsvkC2n13BWmDGhKbZRYiYhdMBZR7vGelN/SuPh3WyOYWkb7wrFaH
         bHhZNisIPHUz7TmFx2UElHiRozQXTLcM9xTBhOhlZ0cPNyU6e4EMp69NSH4aT1hdcV0b
         vIY0tAwFO7DoSLaw5ZlfnLY2VDVr80buNNL3fd05xzi0Uuo4JvApaRs/H1raaqkPUAt6
         v+hbt8jUnBzv8dHjqlb+pEFmdDqu5HBGd6gDlAScxbAM+CPIubdxCGb4pYjsxlOGOvcC
         U/rx2YOM/GZRWE3lw0a9PgW+FtFgRmLupNY1P81wKf1oOmZ2cA8IGgVpchdekS+BKta0
         9JBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745869088; x=1746473888;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=kZL+y4O4nVB6WkTciMzCG9+Q8Gw1aprj/ilNSB+S7lA=;
        b=bF6PrGh9xfBVCy7FXASyk4obULPa0cR95w2k8mNh9OelbsHYmZoKMoBKrHx7xONcfA
         RcrJT26+OeqlLhpFG9+MEkNPB962N9qE4hyQG+2mq7d/oOOgeMsT1IIljiIA3AbBFor5
         NxccgSWBzEvL1iNFENrCx+pxi5llpKKFZTbvdHoHRa8S7T7+kc7wfMeAoAFeQEQN8t9Q
         gDIL7XG7ZehGA4jgZO7tgitdxLHhG0/zj73R876WiteKeJBG8anRpXeiAPYbQRcTBZsB
         RVgLh+V3YEsdmSn8YdYZFQBNi8VbhNeIBMKfh/zXAHw49ldi/gKtdk0h5J2zpAgjx2Ik
         D2Sw==
X-Forwarded-Encrypted: i=1; AJvYcCULo2j7QlUoLSAYCBWI95HPtjzJ6KGFUkB+NAFPV/ShCqAWwJ9Vk0W1UgX550WzchfHar7a+Jg8ORv5Gm/M1A==@lists.infradead.org
X-Gm-Message-State: AOJu0Ywb1oZjXbAkV13gKFTRa8LofxHEHTg8tRfHIdmzLfE1px05SQdu
	rqnudkItzCStrCfoCafxyinDOno8TBfFORccOPXzxDbB+d50qdVXYDX1GGn/lg==
X-Gm-Gg: ASbGncu+jy7i3Rt4PdVeJv9jjPHKr9QuNZJCE6ZzNsj3g3CUUZ27tgOd+/HqJcuPONp
	95VVh/1372FUTkzT0hT90ifoFlzi8wEVuz3RWoBeY638y0mojXCqTu2p/TL14L/oNU9vvxpWiTa
	NxhClaAD2vmvyUIQURX3/omV2Njqm7BOdkYPXyIQ840jqqnKOyo48x0Pg00UHz7+dIWjXkw8Dve
	p4LbOwSIUcrft3nnl0hQnWsPjkO1cjavbFsdBppEb/UETokLPDQLEfIH9neEncVLI+LwxGNnYjp
	nxbOAwk+I3Hb0DQlQFh3hGVPQczx64aIilrKligLj/f0I320VxyvFsjZFUJ6+BGTAVwp3Jr1PA=
	=
X-Google-Smtp-Source: AGHT+IEb7sjPxHBoM6DBUpDHrBYIpIDFqqlG7FLfEAc+dm0pnpCG2yrmeVJ4VnqTunSOtGlfHUdVJg==
X-Received: by 2002:a17:903:4405:b0:21f:164d:93fe with SMTP id d9443c01a7336-22de608f23emr13724175ad.53.1745869087882;
        Mon, 28 Apr 2025 12:38:07 -0700 (PDT)
Received: from google.com (28.67.125.34.bc.googleusercontent.com. [34.125.67.28])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-22db4dbdb4bsm87169915ad.92.2025.04.28.12.38.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Apr 2025 12:38:06 -0700 (PDT)
Date: Mon, 28 Apr 2025 19:38:02 +0000
From: Benson Leung <bleung@google.com>
To: Chen-Yu Tsai <wenst@chromium.org>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Benson Leung <bleung@chromium.org>,
	Tzung-Bi Shih <tzungbi@kernel.org>,
	Dmitry Torokhov <dmitry.torokhov@gmail.com>,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org, chrome-platform@lists.linux.dev,
	linux-input@vger.kernel.org,
	Douglas Anderson <dianders@chromium.org>
Subject: Re: [PATCH v2 2/8] dt-bindings: arm: mediatek: Merge MT8186 Voltorb
 entries
Message-ID: <aA_ZGndUwSLY9yQ3@google.com>
References: <20250421101248.426929-1-wenst@chromium.org>
 <20250421101248.426929-3-wenst@chromium.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="coaj1VmWJVD9+zVN"
Content-Disposition: inline
In-Reply-To: <20250421101248.426929-3-wenst@chromium.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250428_123809_552560_D3AA4468 
X-CRM114-Status: GOOD (  16.47  )
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


--coaj1VmWJVD9+zVN
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Apr 21, 2025 at 06:12:40PM +0800, Chen-Yu Tsai wrote:
> There are only two different SKUs of Voltorb, and the only difference
> between them is whether a touchscreen is present or not. This can be
> detected by a simple I2C transfer to the address, instead of having
> separate compatible strings and device trees.
>=20
> Drop the SKU-specific compatible strings and just keep the generic
> "google,voltorb" one.
>=20
> Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>
> Acked-by: Rob Herring (Arm) <robh@kernel.org>

Reviewed-by: Benson Leung <bleung@chromium.org>

> ---
> Changes since v1:
> - Added Rob's ack
> ---
>  Documentation/devicetree/bindings/arm/mediatek.yaml | 3 ---
>  1 file changed, 3 deletions(-)
>=20
> diff --git a/Documentation/devicetree/bindings/arm/mediatek.yaml b/Docume=
ntation/devicetree/bindings/arm/mediatek.yaml
> index 108ae5e0185d..49ddc504c160 100644
> --- a/Documentation/devicetree/bindings/arm/mediatek.yaml
> +++ b/Documentation/devicetree/bindings/arm/mediatek.yaml
> @@ -339,9 +339,6 @@ properties:
>            - const: mediatek,mt8186
>        - description: Google Voltorb (Acer Chromebook 311 C723/C732T)
>          items:
> -          - enum:
> -              - google,voltorb-sku589824
> -              - google,voltorb-sku589825
>            - const: google,voltorb
>            - const: mediatek,mt8186
>        - items:
> --=20
> 2.49.0.805.g082f7c87e0-goog
>=20

--coaj1VmWJVD9+zVN
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQQCtZK6p/AktxXfkOlzbaomhzOwwgUCaA/ZGgAKCRBzbaomhzOw
wnOoAQDrlivFR72rlTsDjXpRDqb5IDQN68oHJxMoVtwn/gvj5QEAwGk6b5hoLf1D
239knHKArUipas1DEpyXfJVjZk3+VQ0=
=L6Rm
-----END PGP SIGNATURE-----

--coaj1VmWJVD9+zVN--

