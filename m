Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BE561C3ABA3
	for <linux-mediatek@archiver.kernel.org>; Sun, 15 Sep 2024 19:35:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=nRpxdaFIHzOzVsYksVQ0yHwIyLAz6RoLwdsQAhW66Vo=; b=gwla9z8AUFLLN23SBEJaq05Fio
	851U+qPRtF/azu7JzHUWFn4UJEcPHT8OdkBVWG69YbAEVpTRw8ViglrT+PxYuQdsoXk1xylQhbNhF
	zBTYd7pj6rWeapkiyPFahr/Yp8ePusf7JT36hiOIg8zQb9ADxP2sxZjTtl/HVSQ5v9GmGDp7hAZXx
	b/evXt6E5mhS5ZTbMsEpU+aD9Xj63FXqdyQ5aDnCN0wZIiWclloM4rUOsuZxNpSjPQwp7Cg6J04xX
	CLsD1T4QLwUCrHSKFgUbh8YPlkj11NJSIe6fk3gvOgmtyRYUrZ/V3FwRTNTFvskjUrAU3fk/frXb9
	j65CT9DQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1spv2I-00000002aFF-2kIb;
	Sun, 15 Sep 2024 19:35:54 +0000
Received: from mail-pl1-x632.google.com ([2607:f8b0:4864:20::632])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1spv1B-00000002a1L-0UTs;
	Sun, 15 Sep 2024 19:34:46 +0000
Received: by mail-pl1-x632.google.com with SMTP id d9443c01a7336-201d5af11a4so42310955ad.3;
        Sun, 15 Sep 2024 12:34:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlemail.com; s=20230601; t=1726428884; x=1727033684; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=nRpxdaFIHzOzVsYksVQ0yHwIyLAz6RoLwdsQAhW66Vo=;
        b=K6vbwREoKdA4Vu3d8fC48V1XV03QwtzrUS2M1BLbmWGaGNttnBIj0N5y3O6PNOTniV
         +2wTYYdBPt5UCvQhM1Bf/43obJ9jv68xLg7grtYmOaYyf4Jbf4pSLZ7f3qKtSGol76+d
         AK1Y32wrzJtt23CdrGi+O4bKXG84JPOicKCSanVJTHo0ythovY4sCcV2UziS0WiRIvxY
         5kM5vl40r8mntTFUo0T5ECLikeHI0RRSWCPFOAjvcP5aKB1O/SFOzCxjQ1W1m+TRBxld
         YEEDijwZRVHrzQ/oHcl8qwju0QYrspU5mhl+QPfV1QZ7S6YDlwwVX4vUa4E3+NX/oPkW
         9QJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1726428884; x=1727033684;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=nRpxdaFIHzOzVsYksVQ0yHwIyLAz6RoLwdsQAhW66Vo=;
        b=JCXWfaqF2qVkpzAgtTbIAziN7drWwGaCQFJ+UdZpd0yloBVu1VUzsEn+vjrjT6A3dY
         rdjcllhkwfBoL03JxVr9VdmCB+845pTYGHeYY5lgHWVpXIUaw3EkU5VyDoXSt6AKcaOL
         fprVjAjKmAgJkKNHu3r9KBD/gvX/QWUfL3SuJLAfr3jDDjneTejWW7N2rZMdXl9cWvvQ
         0aHmYjIvrA+/8iuaSCT4ldYhRftVaypG6beoEC8hEOM8b/JapIME0VjntB1nCRey5q1K
         m9uDgYxHIftrzQxW/WvIgn18d6TmRHS+oRAwYXpUkqA1YiSI5KlO6Q6ETXrWNl+TqgQC
         H3WA==
X-Forwarded-Encrypted: i=1; AJvYcCUk1ryua3L1UH9AuX+H6xsfrIZbKsjLpXT9DEc7vtO363/GXp/7M6Euf8BH6sgKpWg+7HlDxXsqWmYNNn8KTKpaNg==@lists.infradead.org, AJvYcCVKlwJj5wEg12fW5B4kvTS2vmKofHkVLqjSLBmbFx3ZRz6qBD0K5afGgcmk+Y9mOqwP04oYwejSJF0IC73CNTc=@lists.infradead.org, AJvYcCVRq6SOH+aQXKd79FeUN5OWH1rIbPXQlTy0d+c3U7p2l63bPFir1fMfUKc53wER3zUOUhKXx8ncvcJWLq8a@lists.infradead.org
X-Gm-Message-State: AOJu0Yype78H+Vo9YhJZIt5ooEykt5tzuLWJCdpA5JIeu7AfJgFGp0Fo
	Kxrz0E4Zm6GMlMpEB015fybGWsf3b3Qka7unKvuEajRau/2WcwbtwZDrV3wRuqHe/M8sqbtGbAR
	560SqdouuVS5Ot0S6quLTM1iHKoM=
X-Google-Smtp-Source: AGHT+IEwWAUsKsReKqUwRX6bFUHcxg5LdPrAbDWpBlNKgtnCiuqZNg9QIOcYa1yarrAewo3Icr/xRF2g9uLNksk5XsM=
X-Received: by 2002:a17:902:ecc4:b0:202:508c:b598 with SMTP id
 d9443c01a7336-2076e447f9cmr210991925ad.59.1726428884437; Sun, 15 Sep 2024
 12:34:44 -0700 (PDT)
MIME-Version: 1.0
References: <20240908-regmap-config-const-v1-0-28f349004811@linaro.org> <20240908-regmap-config-const-v1-1-28f349004811@linaro.org>
In-Reply-To: <20240908-regmap-config-const-v1-1-28f349004811@linaro.org>
From: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Date: Sun, 15 Sep 2024 21:34:33 +0200
Message-ID: <CAFBinCB=4MtDSc94N-ijgjd0T6-O9pe26Wg+B44miX=iY1vmow@mail.gmail.com>
Subject: Re: [PATCH 1/5] drm/meson: drop unused staitc dw_hdmi_dwc_write_bits
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: Neil Armstrong <neil.armstrong@linaro.org>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
	Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>, 
	Stefan Agner <stefan@agner.ch>, Alison Wang <alison.wang@nxp.com>, 
	Chun-Kuang Hu <chunkuang.hu@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>, 
	Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
	Jagan Teki <jagan@amarulasolutions.com>, Andrzej Hajda <andrzej.hajda@intel.com>, 
	Robert Foss <rfoss@kernel.org>, Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
	Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
	dri-devel@lists.freedesktop.org, linux-amlogic@lists.infradead.org, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	linux-mediatek@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240915_123445_177117_BE937483 
X-CRM114-Status: UNSURE (   8.61  )
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

On Sun, Sep 8, 2024 at 4:21=E2=80=AFPM Krzysztof Kozlowski
<krzysztof.kozlowski@linaro.org> wrote:
>
> static inline dw_hdmi_dwc_write_bits() function is not used at all:
>
>   drivers/gpu/drm/meson/meson_dw_hdmi.c:276:20: error: unused function 'd=
w_hdmi_dwc_write_bits' [-Werror,-Wunused-function]
>
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Reviewed-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>

maybe s/staitc/static/ can be applied to $SUBJECT when applying this patch


Best regards,
Martin

