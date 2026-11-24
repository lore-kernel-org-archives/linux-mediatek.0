Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D1744606A31E
	for <linux-mediatek@archiver.kernel.org>; Tue, 24 Nov 2026 14:30:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=w1xYrh2e;
	dkim=pass (2048-bit key) header.d=fooishbar.org header.i=@fooishbar.org header.a=rsa-sha256 header.s=google header.b=ghR46TcC
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=kFSlcrGHGfKA+EfrnFhI9X/nm4JGlc6mNtmuQxk7pQQ=; b=w1xYrh2eTfTdVdZOwN3BCKf4mA
	0ujpl1Rg/UdYP/JSgbsoG4L+IQnXmIuoCFqlD2Dvnctxpg7Mi89TrDKm1CclzKz0unBH+R3GOUjUu
	2dkiTl5moGHjQ2CXb71+zpWkL59lV6zBAHrFz0/Kga2XIlykm3i7KN+8ORetNlBjNTemSEydsgBnQ
	nl3/YlTgQjh+z9c/EU6Rg0xXX9YDgba/wiDN0nIrqtYXE8RO/6cT1lSPgA6nyJIIJfeWB84al5KqJ
	kk3nwAQKtW4VGH+YGyLwqDYEJhrKbbf2F1vWg+6AFgKOjQH9H8MeUrhMkik2BT1thtUfk8dviWv33
	jnh+UYbA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVrXq-00000006ko8-2Eym;
	Tue, 24 Nov 2026 14:30:54 +0000
Received: from mail-pf1-x432.google.com ([2607:f8b0:4864:20::432])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVrXe-00000006kmg-2Cd5
	for linux-mediatek@lists.infradead.org;
	Tue, 24 Nov 2026 14:30:53 +0000
Received: by mail-pf1-x432.google.com with SMTP id d2e1a72fcca58-8c70c2ab5a2so1772366b3a.3
        for <linux-mediatek@lists.infradead.org>; Tue, 24 Nov 2026 06:30:42 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795530641; cv=none;
        d=google.com; s=arc-20260327;
        b=oqhgsRdNI+KSW/ySe2th9lujI9sLCMlLYB09sULPxcHOLyg5P3mtyR2kLV0nX4ySps
         enAZPlFPBA5Q6c1pLAN7iJ1IRAR23z1Wp6mfVgtRC9+7usCaNhWoZfhGAXlAGdx4N7lz
         I5EId1ActeRqJz2/l/YrxHXSLbEJ/vUJNF5GlYexiZFfjuaZeyBCQTG1rbb5hLHeJLGF
         Yuk8A4tz75Cis5aJF6O0E+Vzl+5GVTgKGvMJ1MR8ViAYLlC6H3QOMsJpb0ELtH4x99St
         US6+efI3nwC2Zdmz+uedZdsByfI9xTyTEd47BtQBPYMWQwpVU9MdMDAd+toz5lbrArqN
         SETA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=kFSlcrGHGfKA+EfrnFhI9X/nm4JGlc6mNtmuQxk7pQQ=;
        fh=AdRLswYt3nesobxcLPw6j6u0RNRFFCSQBekZTSvIyUU=;
        b=FmF6sNkMPNF4TMqy/V2FGIgJUzoYDUYng9A2c80HRkOTcYFMULh6nucpIsJAXPWbIu
         2fKRtxuR4IaQFSWJOQwV5JpzSHIj/eWgGkqBm0WSBysE0CM/CuM6BhE9qXPP1Sdm0ryx
         xNp+0Z7YgffT/B9kQMJK41WTpxrMnM5OkOULE9ggwmX6mbHYVLgujf2OBDW/Cg4jN5if
         C3PW+qdfDoy2lxfv1TQUZ5KZPHJOjzbs+US1CakEBkYnOqvncdgHsgRmF5lNDjdDoLAk
         GUaMqk1OwQYw4IuElWV1H5nVsI9D6OQwOTk7LAiL5nCiiHHfKjzcN7CixAJSsYxrlxQh
         Eibw==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fooishbar.org; s=google; t=1795530641; x=1796135441; darn=lists.infradead.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=kFSlcrGHGfKA+EfrnFhI9X/nm4JGlc6mNtmuQxk7pQQ=;
        b=ghR46TcC8/7HLczdx5CqXQMMXZTbsy/vE//gfXmLkJZrxCupjqwgtrrOHa2xjsNvPr
         JsEJxiFO5ug8otb4gfce0OZfnFUTE9DrExn99ixPk9xLQPNVn38yfIeA83sNpkBQtQ5T
         9NjPO8HBcWyCQRilJCYM4t9MAAs81HKWk3j88z0xnudH5flv1WrC/7p9YmVuiWqhJibx
         d/W4y3Qk52e7k0dH2XA5pDR97hbfa4hBvqeH3GYGlHWHLYYeMjKPEdqkZCs0i+gYwUbV
         4lx1ZFott1mKqxms/JM5gpnntYMVM6Y5L5Zw0zlv83YTdevLBOcq6jsfLoAKlmkGkvlT
         +N4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795530641; x=1796135441;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=kFSlcrGHGfKA+EfrnFhI9X/nm4JGlc6mNtmuQxk7pQQ=;
        b=PdJaGKud4WVvo3r1+uDGPrXhHkJW9KpTsC2tQFYxD6nVjSiT1u/GXM6VMQCpyXjSJk
         gDCQj1xHSBOHBuFTDaoyCFJw1rUF/fJEPtG2W5qZYCKvBCTNjgjHhGL1s1V4lLUHt5f+
         taUUY+EpKuU2HsxBza9eE7Szim37Z9EU+zdOdsSUoA7p377fD1Q9VCErJhtqkMtOUNsx
         fmeLfhp3EUjIKJ/vvTX4liLQDA44XC+P/kV9kWiPi5v79ZhMVGpOP6+27csNggB+nxXB
         OyPNisnzNNvR3OdeShFy8ViV5V5DXOrm0elXGdV4IfXjYtw/RoDcKvftcnO/9IuhfH0m
         revQ==
X-Forwarded-Encrypted: i=1; AL+hErGHxKdIk8E3wD/tqlIjbDpyozzyWh5ZZXazNkcnV4YE6VS8kN1SJYE1eg9XTKUl7FhwiUkiBXJJWJmDwdGlwQ==@lists.infradead.org
X-Gm-Message-State: APuU4Z9es8jZZGzq1/5uilq/4kBWFgxnYTAgyr2kE2ziD61hKRUKZtrv
	T8IugWjrzgq4Naz4EMa5ovXL0U3l1vUggZIzvAAsNP2zVJWHa3E0SnlXTIbqYA17e+eMgjm7w/4
	KTpH9jNLh5yHBBNO+Yi6ODZxWU1XVKqfOz7VgsgBapQ==
X-Gm-Gg: AZFdTZeSvJbFqcEbOo3/CVtKQNS9F9UfjLqo6POeGqH2G+dL2Yho15jtCTS/EZd5UZL
	pfS+Gjet9JSQ7eAsipVZMsXu3h855KywV/kpi/se3WBwiRUgCgbP5SYk+/nqSoT0+RznVIsxs0x
	Jlqb91ufiyz0bQYdul+TlNygMHW5CRBK3uDmndMEFJHg2nFFAgtKnmJZQMRbYz6LWUhrpfhY7TA
	PSJGclspzqZ+fqeHeAHECKV8/Fou2q33utLDsu6qXgm+y4H++hQvP9cQ1eeCBtY8GWrdaNoffda
	LHePmY3x7E+fXQ3zDBVoNWXiha5+q3vDvIZdf/epfTdepUrpHq2daiNck07BuR11yJMF1G/XcCw
	p2zd6f/jBVzldQ6xBby0zdhp9Z4dolvs3XA==
X-Received: by 2002:a05:6a20:2589:b0:3f9:797f:3869 with SMTP id
 adf61e73a8af0-4014d359938mr14437260637.47.1795530641542; Tue, 24 Nov 2026
 06:30:41 -0800 (PST)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
References: <20260714114414.184512-1-angelogioacchino.delregno@collabora.com> <20260714114414.184512-4-angelogioacchino.delregno@collabora.com>
In-Reply-To: <20260714114414.184512-4-angelogioacchino.delregno@collabora.com>
From: Daniel Stone <daniel@fooishbar.org>
Date: Tue, 24 Nov 2026 14:30:29 +0000
X-Gm-Features: Aa3M54oeKn_H5KtwYJP7Cgtm4lKr9C1ncfB30nHv_jvzqMcIUhZDyb3veHGchVg
Message-ID: <CAPj87rOEtG9JqJsEZkatqrWUkerO9Xx93MBUrXXChJwCokE0Vw@mail.gmail.com>
Subject: Re: [PATCH v2 03/46] drm/mediatek: Export OVL Blend function
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: chunkuang.hu@kernel.org, p.zabel@pengutronix.de, airlied@gmail.com, 
	simona@ffwll.ch, maarten.lankhorst@linux.intel.com, mripard@kernel.org, 
	tzimmermann@suse.de, robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, 
	matthias.bgg@gmail.com, dri-devel@lists.freedesktop.org, 
	linux-mediatek@lists.infradead.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	justin.yeh@mediatek.com, jason-jh.lin@mediatek.com, kernel@collabora.com, 
	Paul-pl Chen <paul-pl.chen@mediatek.com>, Nancy Lin <nancy.lin@mediatek.com>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261124_063042_568279_96D4A26A 
X-CRM114-Status: GOOD (  14.13  )
X-Spam-Score: -2.1 (--)
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
X-Spam-Status: No, score=-5.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=no autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Hi Angelo,

On Tue, 14 Jul 2026 at 12:44, AngeloGioacchino Del Regno
<angelogioacchino.delregno@collabora.com> wrote:
> +unsigned int mtk_ovl_get_blend_mode(struct mtk_plane_state *state, unsigned int blend_modes)
> +{
> +       unsigned int blend_mode = DRM_MODE_BLEND_COVERAGE;
> +
> +       /*
> +        * For the platforms where OVL_CON_CLRFMT_MAN is defined in the hardware data sheet
> +        * and supports premultiplied color formats, such as OVL_CON_CLRFMT_PARGB888
> +        * and supports premultiplied color formats, such as OVL_CON_CLRFMT_PARGB8888.
> +        *
> +        * Check blend_modes in the driver data to see if premultiplied mode is supported.
> +        * If not, use coverage mode instead to set it to the supported color formats.
> +        *
> +        * Current DRM assumption is that alpha is default premultiplied, so the bitmask of
> +        * blend_modes must include BIT(DRM_MODE_BLEND_PREMULTI). Otherwise, mtk_plane_init()
> +        * will get an error return from drm_plane_create_blend_mode_property() and
> +        * state->base.pixel_blend_mode should not be used.
> +        */

This hasn't been true since 9813e158d13d. I know this series predates
that, and this is just existing code, but it's another instance of
'lie to userspace and fix stuff up behind its back' which we should
get rid of ASAP please.

Cheers,
Daniel

