Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4086FC5AD49
	for <linux-mediatek@archiver.kernel.org>; Sun, 25 May 2025 10:49:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=FvMZwrrK4O9JD71L3DzuziqxKKZYlUuX09bTEYlT1Yw=; b=J6Ey956+r0mC3pClBT3No5jvGT
	rNwdC3PxA3CvT063YYdSxv8AT5zsTa4xrD2QJ13MzPSwdCW8r99bMA0HibMnO5EZCL1F4On09/8sU
	vhH8UkncCtdeSNDuREBqn0YoVkC7DEE7SMOQDN2k4t4J4WiHmjawBctpRhOu/APzMN+k2TYwx6uQB
	d307D+50Ogf72JZwRoo7IevbTFqPMCIELNnvkQS8+aNN/EYSvx0D20J1SrdgqUxTS/yfYjt8mGhBZ
	CRo+7btsKWpfsvGD4vZ8UFATPRzdc0+fTh5vtLdnTPUjAZ4LGYbzVJ+Pgfe5QVamPUJNJqif9rujY
	TdWuuddQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uJ8uc-00000006yBz-0gBA;
	Sun, 25 May 2025 10:49:02 +0000
Received: from mail-qk1-x72e.google.com ([2607:f8b0:4864:20::72e])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uJ8uX-00000006yAh-3nKz
	for linux-mediatek@lists.infradead.org;
	Sun, 25 May 2025 10:48:59 +0000
Received: by mail-qk1-x72e.google.com with SMTP id af79cd13be357-7c559b3eb0bso64548385a.1
        for <linux-mediatek@lists.infradead.org>; Sun, 25 May 2025 03:48:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fooishbar.org; s=google; t=1748170136; x=1748774936; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=FvMZwrrK4O9JD71L3DzuziqxKKZYlUuX09bTEYlT1Yw=;
        b=RObATym1mR9JulCT+XlOSlfCjDRyXu1rPj+b2HjGyD8Edo9Um5J3+vOYUWYWNX7l/I
         DHgqSWaCCO2tQX8Ch7MqhQ6qgaxjkowPhDdeblA+tNxR1haoQ5VKWrIdSTrN8FRzcAZH
         83yp9gWVk822FsXxkVrf59uyGhpAi/O+C4JZd6rdxayvsHuq5VB4Ltd6j3bJmO+P2540
         nyQ8uFs/uIyqX20e0iL8d03wqfMVLNXOdvsb/ATqnX9++01r51ExQu/AS6/JQmpHk1dA
         hqtOdA/wiDDArDZ6yopoPTZ77F05XZOI2oMPaT4MPClu5BOb8sKTWWpRGlPk9H/YmmNK
         OdgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748170136; x=1748774936;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=FvMZwrrK4O9JD71L3DzuziqxKKZYlUuX09bTEYlT1Yw=;
        b=bq2zp6bpr/fFf09oPaBOcA2/ZbrkmbRu/62S3+8s8Jk53ujzGGAg+X1EYfQvl4jzpn
         4bsPHLjcRtXyBrrXj0GZswhRll220Yo9OTdGTWBTsHNNtquaphwCZhZ1UnvC38SW+iy+
         loS5WXnvbfM/3N1jh73KQ4JWkrR3l/aXcd6BPEaGz2AZU2DgMXw5EYGZcI0wx+ciF0JW
         3pgDiGvqamMHmj/Z/+dOZqMIRuTE6+W8dNjmQqYgaqdtlc4fq3wPtNMdbfcOc2cSoug0
         bdJFmAGpaldBMmHjSjnahdvutw5bPwxQso26XkrQNe2IbLStQ9TRo2pM1xFKnj8DZY0y
         IA/w==
X-Forwarded-Encrypted: i=1; AJvYcCUGV2Ljj9BPzlTbvp5cm8FDz76Nqs/uN2A3fX7G8/XPmQZRYyqiUWq8pYHzVaYPM3IOGvVhym9Ov0VQhep90Q==@lists.infradead.org
X-Gm-Message-State: AOJu0YzWJFnP3/aXjYnObOdbOWd6Yno1Es93N8DyCzAFAXfLjVEUq6hS
	RlinhkkFyPuwjigoM6eMHUogx9D1Oiv2NNlhcsO4mmp4RGafDeIqmD3/Oh7pwnaGk0EozkIqxjf
	SEr1mWc97xUkANvasHIyMhDj/QvH+8XsDFuO4IXs7iw==
X-Gm-Gg: ASbGncuUi45SD+fAi8M8Tt/1HpyPwM8vVYo3+T6PKeY7tJj7bezSDJSWNM2ZxNIL7m0
	Jnw3sPCPOLpZ694JEec65mFCvvivg+aQnVk+mI0ID+WQjXJWpkDrXn7TAHGtgxnADtw4+eZGbd4
	AT/32co9P8ZTENG/zZqba8h4Y2CQtqupGhXVadh8vE
X-Google-Smtp-Source: AGHT+IHfLSQWm00np5MOUI9iSgjHG0uz8ZjLmKg3AyhQjzrIGk08erFcga0ZJK90E1+3HR6kZwenz2fYr+3ziRhndi0=
X-Received: by 2002:a05:622a:488e:b0:476:7d74:dd10 with SMTP id
 d75a77b69052e-49f46750736mr95207921cf.19.1748170136440; Sun, 25 May 2025
 03:48:56 -0700 (PDT)
MIME-Version: 1.0
References: <20250525051639.68753-2-krzysztof.kozlowski@linaro.org>
In-Reply-To: <20250525051639.68753-2-krzysztof.kozlowski@linaro.org>
From: Daniel Stone <daniel@fooishbar.org>
Date: Sun, 25 May 2025 11:48:44 +0100
X-Gm-Features: AX0GCFtHF5h48b9Isl1N9tQLNjTjzN8BGszS3KNow9_vXa4svv2OiPk4eOV2_U8
Message-ID: <CAPj87rMjAv-UphvFuQjop60o=wHrkfs4-XOM=JqH7f8Kk5dyVg@mail.gmail.com>
Subject: Re: [PATCH] media: dt-bindings: mediatek: Constrain iommus
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: Chun-Kuang Hu <chunkuang.hu@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>, 
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
	Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, dri-devel@lists.freedesktop.org, 
	linux-mediatek@lists.infradead.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250525_034858_100891_897A7FEA 
X-CRM114-Status: GOOD (  10.63  )
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

On Sun, 25 May 2025 at 06:16, Krzysztof Kozlowski
<krzysztof.kozlowski@linaro.org> wrote:
> --- a/Documentation/devicetree/bindings/display/mediatek/mediatek,ovl-2l.yaml
> +++ b/Documentation/devicetree/bindings/display/mediatek/mediatek,ovl-2l.yaml
> @@ -45,9 +45,8 @@ properties:
>        - description: OVL-2L Clock
>
>    iommus:
> -    description:
> -      This property should point to the respective IOMMU block with master port as argument,
> -      see Documentation/devicetree/bindings/iommu/mediatek,iommu.yaml for details.
> +    minItems: 1
> +    maxItems: 2

The comment removals are not documented in the commit message, and
it's not clear why removing information and references would be a good
thing.

Please see https://www.kernel.org/doc/html/latest/process/submitting-patches.html
for information on how to submit good-quality patches that can be
better reviwed by maintainers.

