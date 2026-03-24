Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D9E5DF532EF
	for <linux-mediatek@archiver.kernel.org>; Tue, 24 Mar 2026 08:09:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=XgTjr1ySaQqwvk8pm1AFU5JmGfYl/gMQzs5mt80viYk=; b=s7xJeApX1fECGcNJjKUm1ONWzC
	/cAUswdZw63lhBoI1T8dA1nSPGrJRm4xXT8+vWckn2a5P12QcaF3d7RDK5GbbLrx/idKSIlopCuDc
	7wdX+L5lpG0nSbddH73Xnz9KML5cz3L/wVazAuCZateU/L0Zfxo0nMOZKnreNZl/76A+Grdf2BL7z
	V1vckjF1Ca1vq35pAZ9HFwj+oyTXpSlaHEAJDalOx92yk4HX7QKacoWS14st7ZMWqfwHkC3r1T1v3
	P0Fasll4ocpC6TaaMhNRymB9Aa+KwbWGcxtHY7FgRtGU595VW/1hyYxu3LIg5iIlI2PJ+kH2tQBhw
	nXdN9yIQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w4wpD-00000000xTe-3uCr;
	Tue, 24 Mar 2026 08:09:19 +0000
Received: from mail-vk1-f170.google.com ([209.85.221.170])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w4wp3-00000000xOS-1jgv
	for linux-mediatek@lists.infradead.org;
	Tue, 24 Mar 2026 08:09:10 +0000
Received: by mail-vk1-f170.google.com with SMTP id 71dfb90a1353d-56b7fce3ae6so4674889e0c.1
        for <linux-mediatek@lists.infradead.org>; Tue, 24 Mar 2026 01:09:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1774339747; x=1774944547; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=XgTjr1ySaQqwvk8pm1AFU5JmGfYl/gMQzs5mt80viYk=;
        b=WcxPAD3cnXfmwkrqsjVejZfjYNhNTsTpqjOmt/o5OucOQRcNXJTQftEem2U+QTP74N
         jnKsZUS4xzT038sqwmozpY0tsW8PTgh5A+sQVzRRXVgz7JpdTq6aV5mUPUG1j8lYjuex
         Q1L4ms079rOLTJAIaV4UB+4l2ADgO9bP+N8yk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774339747; x=1774944547;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=XgTjr1ySaQqwvk8pm1AFU5JmGfYl/gMQzs5mt80viYk=;
        b=I/u8ciucesVtZKs07flzEY4fhkrWc1zt4EIaDQ5ELS0mw+sbqufNVCxATeNpfvkAWW
         iAiNK5yID1adyMmFXjM8jAW0CjZJywIMPmOWmefFVU32tYxh85pk5gJWuz24JGTCxaF7
         2Yh/Sz2fGnA0t5POgjQysvP89+jXD9Nw4JajXxSrZ7UFv7PWuwtXHN5d9qR5/smHm+bi
         wH/XLmktm+gspVmK6rY7lWOA1MxhcQgE65ssmgTd/TXfcVPpAcwWuBrTEW+2hmWjGpXs
         39wLMOsKWdVyS+T8pGXQdpFlLwmg7dhwP7VonkjtuCVMyVEGnceijEzVAD+2eMtwtysM
         3JvQ==
X-Forwarded-Encrypted: i=1; AJvYcCXFbm/kmEU+2r/lVWjm4fxPNnFWokA5TLxLGjGayT9JubPdxLivQtj1lWaxWd5MRwAKT20GRgYOKcT22mXh7w==@lists.infradead.org
X-Gm-Message-State: AOJu0Yy/BFX5f3U74sOowJi49WEVg2jyPNralnHVsy2pqaLV0PVVTdVp
	ZavKd90F2IBLSMGnrslQajF/dXYLLO74OGd9Al2Apmdz5RZ5PGHOXXNiUhGgsvSONY3cfj9wkxT
	FMRY=
X-Gm-Gg: ATEYQzxD/IntsiQlEJctpRVG8X/6rDi3cPD0EH96D+Dkr62g/iDJ0Jw3UM5cOdn6/GS
	GvhGxuCo+FsCv62CcQ3cJCtZDSg8uReG2D/DqefcM6RpV6KIG+1d8VWpspyoGZ+2awOn0Gxg6Vd
	WyN8UtmhPqJVB9tjB2gNl2ZdpGIg6xFpEdZ3OtUZWpakbLYcqITs831ErfyQlr0A3T4plUHXnOz
	lpgCDiP3GnPL+HG0Dtkwl1oS3SqchsZnwyT36Pn9SSmKB1byj9zb1Hh9/4v92nlqNaoEblT7gdF
	5PjjYbg7Fx4YZ8A1Mh6RMx6kUFlkXBbC0D39Xoa4l3vNH7/j/a0vFAASOwIy1SXebs3ovDVAK73
	if1U4H4gcjsmuVQ7YCO6lFfVAWk3g2IqL7mtxnXKJhFY3+vs3VGLVSUaiSJk+zUBsU5f3LL/PMr
	PjbFIIQAtPU2Guxqfco6esEZ1IodsfNVF+DdGK95Y53JfHpb/9qvKLSNAkeg==
X-Received: by 2002:a05:6122:2b03:b0:56b:a7de:7129 with SMTP id 71dfb90a1353d-56d138fdf0amr959995e0c.7.1774339747045;
        Tue, 24 Mar 2026 01:09:07 -0700 (PDT)
Received: from mail-ua1-f48.google.com (mail-ua1-f48.google.com. [209.85.222.48])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-56cea30c727sm12796039e0c.2.2026.03.24.01.09.05
        for <linux-mediatek@lists.infradead.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 24 Mar 2026 01:09:05 -0700 (PDT)
Received: by mail-ua1-f48.google.com with SMTP id a1e0cc1a2514c-94ab69af6c8so3319386241.0
        for <linux-mediatek@lists.infradead.org>; Tue, 24 Mar 2026 01:09:05 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCU+dECOHqm6ICiK7gdwpce3DGFVEmjxxtxB1ox1dOr4+Y5ElSjOMmchJHiOdVg8Iiaw1wYDJQlRY08e4egPKw==@lists.infradead.org
X-Received: by 2002:a05:6102:2b8b:b0:602:91be:3506 with SMTP id
 ada2fe7eead31-603160acc76mr1148240137.11.1774339744256; Tue, 24 Mar 2026
 01:09:04 -0700 (PDT)
MIME-Version: 1.0
References: <20260320084351.2461060-1-wenst@chromium.org> <20260320084351.2461060-13-wenst@chromium.org>
In-Reply-To: <20260320084351.2461060-13-wenst@chromium.org>
From: Fei Shao <fshao@chromium.org>
Date: Tue, 24 Mar 2026 16:08:27 +0800
X-Gmail-Original-Message-ID: <CAC=S1nicdkyeArSxDrnDubdBk1QECfRRsp8Mv0CNGfxs8kDQyw@mail.gmail.com>
X-Gm-Features: AQROBzBA4rP2zsCeaLi30ZrkxDrzS3ElI-DHHIjgmcs2EqAF9GjEhjgWRZZrfYI
Message-ID: <CAC=S1nicdkyeArSxDrnDubdBk1QECfRRsp8Mv0CNGfxs8kDQyw@mail.gmail.com>
Subject: Re: [PATCH 12/13] arm64: dts: mediatek: mt8188-geralt: Add MT6359
 PMIC supplies
To: Chen-Yu Tsai <wenst@chromium.org>
Cc: Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
	linux-mediatek@lists.infradead.org, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260324_010909_453388_08EDDCB1 
X-CRM114-Status: GOOD (  10.12  )
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

On Fri, Mar 20, 2026 at 4:44=E2=80=AFPM Chen-Yu Tsai <wenst@chromium.org> w=
rote:
>
> The MT6359 PMIC has a number of power inputs for its various buck and
> LDO regulators. The binding recently gained property definitions for
> them.
>
> Add the supplies for the PMIC regulators to the common design dtsi file.
>
> Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>
> ---
>  .../boot/dts/mediatek/mt8188-geralt.dtsi      | 21 +++++++++++++++++++
>  1 file changed, 21 insertions(+)
>

Reviewed-by: Fei Shao <fshao@chromium.org>

