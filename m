Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 85023C44520
	for <linux-mediatek@archiver.kernel.org>; Mon, 20 Jul 2026 15:15:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=6GA5/FZ0UEBjIo3jsFJRPrVNv7cnVsaH+IUEN70k1s4=; b=bl0nNI92ZrOR5B1y8cvnrnS0WS
	b7LsY3mGJaclrc++tubJDzngy2LRdLbztVnJkH5t5VPKtLIOitSrSXR4YcL0HJc3dqhVo3sb1b49H
	xb+Ze3K3n5UeAEdqp1P4FBkM9hLww1v3HVFCGsDSsStKXbjjZ4aU/Rw1ihL6efLmTrLm293PabmuZ
	jMqwaNujJnu5uzVBLwRBZKm04PS/x8i83z9aeBDc18s4o9+OT/qb+dOsASrb8/7kSN5DnmOXa3POm
	4u+f/Axe0iMFSat1s/WN5eYwrRwfxoLgfzgMfrtAYAOMlWBj1piz0UtSQIqxM93oZPzqBhLqjITM3
	RtCo7SxA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wlpiR-000000079Q5-2Gw1;
	Mon, 20 Jul 2026 15:15:35 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wlpiQ-000000079P4-3L2g
	for linux-mediatek@bombadil.infradead.org;
	Mon, 20 Jul 2026 15:15:34 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Type:Cc:To:Subject:Message-ID:
	Date:From:In-Reply-To:References:MIME-Version:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=6GA5/FZ0UEBjIo3jsFJRPrVNv7cnVsaH+IUEN70k1s4=; b=WkNeSe6QeouM8s9N2yT/yWsriA
	RRsR7k6bIEysahTMMxjtMMm64xTwJkRYsujH5TYjZ9MvjNDl1IQ/RQinLE7+rdTWQ3HxL1TgMxe34
	xOfvOH5mUZ0iDYixRxlwO88rfZe3HNXSA+u5ihwo1BR0DQr+TDkUECaMackXlms6toJODdD1kvSXy
	GHTAIy6AO4rWNQ+2oQPfiIIwAKv6yg6vcWEbJCZ7WKI7h3WlVLsrbkHQ6tvwmZy4H4NwgJLTgjKOF
	qtFqz8tC4aIh5sbVbQkMru0NOm8f6bD3VeceQAvTm34h/5+fxHCFF2o/SVTo9dOox4zEBy7DcXMUr
	VsXFZhxQ==;
Received: from mail-oa1-x2d.google.com ([2001:4860:4864:20::2d])
	by desiato.infradead.org with esmtps (Exim 4.99.2 #2 (Red Hat Linux))
	id 1wlpiM-0000000GikL-1DVj
	for linux-mediatek@lists.infradead.org;
	Mon, 20 Jul 2026 15:15:33 +0000
Received: by mail-oa1-x2d.google.com with SMTP id 586e51a60fabf-448cf99c133so2531714fac.1
        for <linux-mediatek@lists.infradead.org>; Mon, 20 Jul 2026 08:15:29 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1784560527; cv=none;
        d=google.com; s=arc-20260327;
        b=d1xhOwRL5VbLlkX0u3VZHyR1hlkrcmvt/hc70+qautowrzE27W6zBA+aq/E3xHP45D
         nJpmZq9eJB91iiWUDROXLtkpZNmY/nNf4rQYnhQbBuOM9HhvPnZRCsVc6IvcgjwIerIU
         MTDIq07lt9AXAiQT2fROIfh/hlQrFwbIdtQKsEWaRW40vpdLlF24Ljdnx/PdW1nn3dh0
         TV6FNW/v28A5NNKA2YSTLwxduBXA53DqM3Na6s2P0M371ey6WpUL2uQ3QxYSiBW0AU+/
         Fns3DyIUT5YPBkDXnMYljD6qWiO6pZL4hwMhyDbztyx09pmkHg1GxiT/UiYk9OsjRALI
         pRQA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=6GA5/FZ0UEBjIo3jsFJRPrVNv7cnVsaH+IUEN70k1s4=;
        fh=8LYgJ8xGHnkEbfDsW+zQmXm6KgRX8CLimtn/+Swj+Fs=;
        b=WgUYvnylBLeHp/uQvc4DcddA1aXsOcuRx67zd2z2uwKwLZMnoDuunO840XYC9K/pRN
         tZ1NzNO+Xw/+kOEIrCfd4rpCqqJ4mU/eW7sclSQeeXOpVxGdehlsBXpJRGrguzygMlEY
         E9o2v1KnWRbv0mpw/UVeV1JaKSC1dJI2WcHVarsyDk5+2ytv8b2Te9nhUI++LW0APacJ
         r9S7dt09r+8z7hBqXesbbmZNnWi68SdWl3ucx45K+lrdp5HDK9GuRscvH07q3kZP0JE8
         8rDx+EmLbvoYDaJ1x2htsNSFOIPUlPY1tS2AswPILvZI3x4B9+FnzYVMCwt6lurfA7KI
         00Nw==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784560527; x=1785165327; darn=lists.infradead.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=6GA5/FZ0UEBjIo3jsFJRPrVNv7cnVsaH+IUEN70k1s4=;
        b=FDVRoRhElDjZGTmk6+JEiCLaB1ZsDxxG116imVPRkUHrUK1v0LySFfgn5Es4iVRdgQ
         HR3Dq9BIOprG+LXlf6qpEpStUIzffXUDA4eujjLfnldGZEkch3lYDdraCM4n0Nh1lhx6
         sfVlvLHg2gi3sP6Jz8oQeEs/6qpnqe8KLVxZTCWva9up2PWO0M+hfszOVtb6Ek8IAeVS
         DiAI0h8S/Kxwzm9P1YIil4CxS6K0E2XNc8qvitIOBLZqrUeL8pVSS037vwsoBbakFqei
         4yAdOD3eQ2FonmcAXAD88oKxZs4R8CQL/VgaQVT7vPM2mipvo+4QXsDrrYFNPxMjFHz5
         Y0nA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784560527; x=1785165327;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=6GA5/FZ0UEBjIo3jsFJRPrVNv7cnVsaH+IUEN70k1s4=;
        b=AOj86BPF78BXXfBtkaXZ2y+/Dt0Uf6XLygM62pdFG+u1ZxcrVoi2Nm3lbhjdxuvjRM
         kbPmEFZ9Uc6XrrJpKtVp2RKco5Wt8djm6+SqqLB2nhJwN04Vj8+hqlUl7zhGjFlCSQ/h
         OfL2+ip7w/CKOjw22j4Hb5NvAXQ14IJEFtBRlwHMm/CaKj5hvtq06cRuLt8b7WnCO6+h
         DtHQC6Ee5iOsA7M8cT4b9C/QyXbZblH9IM64irmg0IpbODMEKL5wffBgQRvxMekWi1Yk
         IScxzFQ3nVCXtgL7cZLBKkgy36zCjJYHilUspVuwAfjOR8cjUeStXSZtzV3NB3zlAnaE
         hzMw==
X-Forwarded-Encrypted: i=1; AHgh+RqOCdR7w2pCEhIPdoz26FSeWLbQZaWeoNRcDAFJ4GO+sTGAG/ynJxlnNmBQ0h2/hLNfSqjwY9WFRYeIV3ReLA==@lists.infradead.org
X-Gm-Message-State: AOJu0YxJqj7x/feyNbQfjNNCIWq8tTnhiCV4j5k7nUBFhxe1RsGkUVig
	UAsKfe7WJvQvqOd5iPjcq5fQE74TVoGzFGmq3TlSnONiu6Yy5QU64X69Q2OkN6QB8BOv8ZC0vnO
	82fT5Y2Nm/8UofYt+uAKJ/DeYJXpTFFw=
X-Gm-Gg: AfdE7cnfWYb9nmAxgGu6GqoJZQBasahkgH9s5OpEk15HVZFXTaEa3w4xCGbY4Ex6HPT
	aOj1OqnXLLYMbjVil/jKFw0U1WjRrORgLJz9AzVfkwqLCi/wzA5Pqh/jpAdGyLBys+YqNR1/7Gr
	tqUZ+amlhu3VPmle1yMFzHjjBM/7o9urZ6nJeIGsurjM2e9H2YODcZv3TVKc/Skb5Oy1PX9/IIr
	NkF8lF7KXfmrrF65HVjmuY5cKyR0JbY3PqNAA8TvOtiT6AtWUY9v6E9YgWazVwRoXki9Wsp4nl1
	zygJNBERStXZy8WvPUKtHle4FoM=
X-Received: by 2002:a05:687c:260d:b0:435:bfb7:695d with SMTP id
 586e51a60fabf-45661144d55mr7411947fac.27.1784560527422; Mon, 20 Jul 2026
 08:15:27 -0700 (PDT)
MIME-Version: 1.0
References: <20260719-drm_simple_encoder_init-v1-0-a78c509e3062@gmail.com>
 <20260719-drm_simple_encoder_init-v1-1-a78c509e3062@gmail.com> <4af254a4-beb7-4f77-830f-42d5bacb10a4@suse.de>
In-Reply-To: <4af254a4-beb7-4f77-830f-42d5bacb10a4@suse.de>
From: Diogo Silva <diogompaissilva@gmail.com>
Date: Mon, 20 Jul 2026 17:15:13 +0200
X-Gm-Features: AUfX_mw73hUQoweWxVmRQ0kaDeRwypjcxis2alI1xmtq6INWQD6CfuNjqz3kn5o
Message-ID: <CAJpoHp73S2_cavgV3aVwC5PS8H1GRqTdDV-Xu8n6nXavBnV2=g@mail.gmail.com>
Subject: Re: [PATCH 01/15] drm/exynos: remove dependency on DRM simple helpers
To: Thomas Zimmermann <tzimmermann@suse.de>
Cc: Jingoo Han <jingoohan1@gmail.com>, Inki Dae <inki.dae@samsung.com>, 
	Seung-Woo Kim <sw0312.kim@samsung.com>, Kyungmin Park <kyungmin.park@samsung.com>, 
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	Krzysztof Kozlowski <krzk@kernel.org>, Peter Griffin <peter.griffin@linaro.org>, 
	Alim Akhtar <alim.akhtar@samsung.com>, 
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
	Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
	Michal Simek <michal.simek@amd.com>, Thierry Reding <thierry.reding@kernel.org>, 
	Mikko Perttunen <mperttunen@nvidia.com>, Jonathan Hunter <jonathanh@nvidia.com>, 
	Stefan Agner <stefan@agner.ch>, Alison Wang <alison.wang@nxp.com>, 
	Anitha Chrisanthus <anitha.chrisanthus@intel.com>, David Airlie <airlied@redhat.com>, 
	Gerd Hoffmann <kraxel@redhat.com>, Dmitry Osipenko <dmitry.osipenko@collabora.com>, 
	Gurchetan Singh <gurchetansingh@chromium.org>, Chia-I Wu <olvaffe@gmail.com>, 
	Jyri Sarha <jyri.sarha@iki.fi>, Liu Ying <victor.liu@nxp.com>, Frank Li <Frank.Li@nxp.com>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>, 
	Fabio Estevam <festevam@gmail.com>, Chun-Kuang Hu <chunkuang.hu@kernel.org>, 
	Philipp Zabel <p.zabel@pengutronix.de>, Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
	Geert Uytterhoeven <geert+renesas@glider.be>, Xinliang Liu <xinliang.liu@linaro.org>, 
	Sumit Semwal <sumit.semwal@linaro.org>, Yongqin Liu <yongqin.liu@linaro.org>, 
	John Stultz <jstultz@google.com>, Liviu Dudau <liviu.dudau@arm.com>, 
	Neil Armstrong <neil.armstrong@linaro.org>, Kevin Hilman <khilman@baylibre.com>, 
	Jerome Brunet <jbrunet@baylibre.com>, 
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>, Jonathan Corbet <corbet@lwn.net>, 
	Shuah Khan <skhan@linuxfoundation.org>, dri-devel@lists.freedesktop.org, 
	linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-tegra@vger.kernel.org, 
	virtualization@lists.linux.dev, imx@lists.linux.dev, 
	linux-mediatek@lists.infradead.org, linux-renesas-soc@vger.kernel.org, 
	linux-amlogic@lists.infradead.org, linux-doc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260720_161530_543031_B9AB1FE9 
X-CRM114-Status: UNSURE (   9.32  )
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

Hey,

> Again, you rather want drm_err() with drm_dev here.
>
> I've briefly looked over the series and many patches seem affected.
> Please prefer drm_ logging functions and DRM devices over the plain
> device equivalents.

Thanks. I will submit a v2 with consistent usage of drm_err().

Also, is there any ongoing task or would it be useful to submit patches
changing the usage of DRM_DEV_* functions with drm_* equivalents?
Or from dev_* to drm_* when possible ?

BR,
Diogo

