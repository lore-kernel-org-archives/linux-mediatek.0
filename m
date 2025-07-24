Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B8BF6C83F26
	for <linux-mediatek@archiver.kernel.org>; Thu, 24 Jul 2025 13:52:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=KWyqMGEUBT6sPlAYGN8ahqpDMLDIFJaLyGGzuzUqjK0=; b=sELAC2ItJEEc01
	F9nqYRJA99jo8jmukppdEM7lLVlWiD2mFGCeEkb1qk/xikuD6+tK4M66mXUAiS083DDPtaoUhhQdF
	mY2qzy/vdXM6XukLkUIuZZ7Mpwi4X8oVGO6s6cKQm3EDZ5/WBKXN8sjzyDxXohgQCvK/8zEtDxFgn
	JmWolpkLyqA4fGr8cVJ106p+nIv/It62/fUrTXa3lSXpE/gPNdhtzB9XJvYJzOAuBlSAk42ujVR+E
	tfmpJ9mdbV7MuqSqKCB/U+vJPZrD5MxeUVotaVBfCX0iE6q2TRRc41e1giPqNECTTSinid2hATany
	imOJBpwxPJKRweabpufg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uewMk-00000007YZX-1e82;
	Thu, 24 Jul 2025 13:52:10 +0000
Received: from mail-lf1-x129.google.com ([2a00:1450:4864:20::129])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uesmD-000000079Rg-2nLl
	for linux-mediatek@lists.infradead.org;
	Thu, 24 Jul 2025 10:02:15 +0000
Received: by mail-lf1-x129.google.com with SMTP id 2adb3069b0e04-558facbc19cso644232e87.3
        for <linux-mediatek@lists.infradead.org>; Thu, 24 Jul 2025 03:02:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1753351332; x=1753956132; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=KWyqMGEUBT6sPlAYGN8ahqpDMLDIFJaLyGGzuzUqjK0=;
        b=MOb/K9ktzk+6Sr3dGBmAqCj0P8uPfUKAIHF27+GGPJ/d4O1zpIIMO7KMbzZWNy3vrQ
         J2rxq3ocp/nk+R9x5ZPSS55lyQjjyPxecQMcUzWERqQz5xEQ9CzfawoEFdqHD7VSFRE6
         Q4LNyctBJqDCciSQD2YoN+JVE+bNQje5X3sjE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753351332; x=1753956132;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=KWyqMGEUBT6sPlAYGN8ahqpDMLDIFJaLyGGzuzUqjK0=;
        b=pl6mf8wwR8gSyzsgunHSuWWQ5Kvagpuz03XSm4bvf9QLP7FwYoP0r5+0SyGE+YZuhG
         eMmV0BzdZhQAFtbJ9IyPNLVFOQOmIssPySSfvd/wry3QXfpA7MDxpnoIFRANuukn9Kaz
         USvRiU3Ag5414QXZLt8Sl6fFiparD3BWXhPRpKwfI1wo9aKP8sIis5ntwbPWvrdD2wRw
         JS5VFQGfrp/9sVnUMf5CbWNjqc82DsDsuPJ1mihD24r/huhF39hZtjQBSimJ+HiPxBpu
         qXWwLbN/zDKNlCckqqRj9qwcy/M2e8j5FhbC216XET22PJioAygrZvV3s9mOpEsdGCYu
         EP/Q==
X-Gm-Message-State: AOJu0Ywb0ZpdWXzvcydgEouSfCZMvMQIkuoj6e3HRBYqmcJPIUM3svjt
	2eNVxmMdAWhQk4ZpOoFdAXHWCOPoKoZZAGV5zBvo3dqPuZQ7EBu8anJ7ViYRHoWXWl1tfkm5Dc+
	W10bpeUFmXPFF0bWCOgYqs1/m0hm8VZp/MpNIbfhH
X-Gm-Gg: ASbGnctxfUMDJtja796qs+JZr6/3H6k961f5Hu6QLJm7yLroiEx+RuDZ8ymMtq2zVhb
	O3lcXT/YAY597CLmy0iwF/+zanWrc080q30JO3lgHamELJjDAnVNe0KsLaFDvU3t0X7rXtMrAy0
	iY1hMbsBu+p1Hp504KGDBk5dGJ73ox7O28ck4itUiw+IQI8i0TByVGEb2j4S10/rlIqhqNF2BVJ
	SW40Kt9XBuhS9bT4CfinqIQAmfC6EkG7Ww=
X-Google-Smtp-Source: AGHT+IESUy0W5d8sN6DOxHQC9VYSfHke7csoBbtn4oiuNMESAIIOLfvRI9EoIcZqqzK+oAmlqA1BtKODIpYwZl1nk3k=
X-Received: by 2002:a05:6512:b06:b0:55a:4b25:b33b with SMTP id
 2adb3069b0e04-55a513879f4mr2300615e87.15.1753351331794; Thu, 24 Jul 2025
 03:02:11 -0700 (PDT)
MIME-Version: 1.0
References: <20250724083914.61351-1-angelogioacchino.delregno@collabora.com> <20250724083914.61351-36-angelogioacchino.delregno@collabora.com>
In-Reply-To: <20250724083914.61351-36-angelogioacchino.delregno@collabora.com>
From: Chen-Yu Tsai <wenst@chromium.org>
Date: Thu, 24 Jul 2025 18:02:00 +0800
X-Gm-Features: Ac12FXxwmEtskk9yW4VS4U_sXrqKN7rxCsdJIjp0VaKRTEqFbUzw8Bs63nu9Nbw
Message-ID: <CAGXv+5Gar47gRZoT6DUDpPRabjzoSE==Zi0wrR76A7g-SJL1=A@mail.gmail.com>
Subject: Re: [PATCH 35/38] arm64: dts: mediatek: mt8195-cherry: Move
 VBAT-supply to Tomato R1/R2
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250724_030213_703860_61681D1E 
X-CRM114-Status: UNSURE (   6.71  )
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
Cc: daniel.lezcano@linaro.org, mwalle@kernel.org, chunkuang.hu@kernel.org, linus.walleij@linaro.org, linux-remoteproc@vger.kernel.org, dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, olivia.wen@mediatek.com, shane.chien@mediatek.com, devicetree@vger.kernel.org, linux-gpio@vger.kernel.org, linux-phy@lists.infradead.org, airlied@gmail.com, simona@ffwll.ch, robh@kernel.org, herbert@gondor.apana.org.au, eugen.hristev@linaro.org, jassisinghbrar@gmail.com, jiaxin.yu@mediatek.com, andy.teng@mediatek.com, chunfeng.yun@mediatek.com, jieyy.yang@mediatek.com, kishon@kernel.org, conor+dt@kernel.org, jitao.shi@mediatek.com, p.zabel@pengutronix.de, arnd@arndb.de, kyrie.wu@mediatek.corp-partner.google.com, maarten.lankhorst@linux.intel.com, tinghan.shen@mediatek.com, mripard@kernel.org, ck.hu@mediatek.com, broonie@kernel.org, linux-mediatek@lists.infradead.org, houlong.wei@mediatek.com, matthias.bgg@gmail.com, tglx@linutronix.de, mchehab@kernel.org, linux-arm-kernel@lists.infradead.org, granquet@baylibre.com, sam.shih@mediatek.com, mathieu.poirier@linaro.org, fparent@baylibre.com, andersson@kernel.org, sean.wang@kernel.org, linux-sound@vger.kernel.org, lgirdwood@gmail.com, vkoul@kernel.org, linux-crypto@vger.kernel.org, tzimmermann@suse.de, atenart@kernel.org, krzk+dt@kernel.org, linux-media@vger.kernel.org, davem@davemloft.net
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Thu, Jul 24, 2025 at 4:41=E2=80=AFPM AngeloGioacchino Del Regno
<angelogioacchino.delregno@collabora.com> wrote:
>
> Move the VBAT supply to mt8195-cherry-tomato-{r1,r2} as this power
> supply is named like that only for the Realtek RT5682i codec.
>
> Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@coll=
abora.com>

Reviewed-by: Chen-Yu Tsai <wenst@chromium.org>

