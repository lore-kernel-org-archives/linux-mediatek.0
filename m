Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1EFD9C83F1A
	for <linux-mediatek@archiver.kernel.org>; Thu, 24 Jul 2025 13:52:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=3lDH5ARB26e8DbHF4MxQq93Rk0WGstJeVZQEGstfRkg=; b=Fv8PTDGLkIzm+b
	c9ZMhPyjwG5xXReJxBki/ji5l5fGvgL0BzAFky2x/HgmhrbHFciuV2nhr7xGXj34mxg0TIPLMtHWd
	bx+LyNaLO/AqXS9/JQlfUs8JVYZ+Lud2v2D8ckHIOnZI0nos1KPOh+FtYD4YqtjDFJUq9Fzh8vKOG
	yNi9qrxXz0fPT4gBDWo5cURsBuhSyecYJQBsterxDrURb7WoGzkDl7O+I6nkNk/OWaE9tWnm/4OTr
	YMomH3GJt6xuzH7NOV/6LSamWAXFmolgG6E72adK0GNNBJcuCTGmgXBb6OHAIRyoTXd11y0rObHX1
	R6gBA3XnMQABoeIPvGRA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uewMj-00000007YXY-02BO;
	Thu, 24 Jul 2025 13:52:09 +0000
Received: from mail-lf1-x133.google.com ([2a00:1450:4864:20::133])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uesj4-000000078hd-1OHa
	for linux-mediatek@lists.infradead.org;
	Thu, 24 Jul 2025 09:58:59 +0000
Received: by mail-lf1-x133.google.com with SMTP id 2adb3069b0e04-553ba7f11cbso850581e87.1
        for <linux-mediatek@lists.infradead.org>; Thu, 24 Jul 2025 02:58:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1753351137; x=1753955937; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3lDH5ARB26e8DbHF4MxQq93Rk0WGstJeVZQEGstfRkg=;
        b=AFw4ho8NB2sgedY6E+qFCz1scUlwPRX2GkGzjzH1rzcicH54LCblL2oaqSO2CV5Dwi
         39k0ARwKiXBR4XSu70HvyFImEN/DD0RhYOCvy8WNF1fbMIGxhOAViFX/gmKIaz9z2KZJ
         iOYMPxixyp0V7TqVOLyk8jJoVel8UVstYNSOA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753351137; x=1753955937;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=3lDH5ARB26e8DbHF4MxQq93Rk0WGstJeVZQEGstfRkg=;
        b=hmr1etroIwgfoHM8MAtMKaXm30uK0x/yIFRV99xwbolUbPYFOxWepOuY6qNU/VXJF1
         7ZNNR2hhI7bO7GKr8q9uckQT1WnQ1xUQtCl/YqEMBrKBjld/JyqmQKesq1IlwkH0+6AU
         xJShBHDwXkBGLuy3zM2wOgIrPlbo9G/sO/HfbnXHJQA2ooDEpVkSYkRcs2+1eTYJf69I
         KmSVjOk1Zi88DG3HrIs3JMffGonACfjaxBhi4mJHORFtYpD6BFoDFId5YrvEhGqbgykn
         N+kgJ3hk8ycjuvnOak1WNGrTmobCAZnbj2D7Puz4Hs8ZGnyDVoWttXB3rjMmnYIJeZJ+
         iHiw==
X-Gm-Message-State: AOJu0YwZ8W6+h+luPi9C5WqUAhBMkacSNTPMv7R1YSuSznp+Uu1YvB5F
	mUVXNmDyI479Jtwcub8VKOXbIJ4lhxHVS5P6pMXhZrRlUrpt7EvdOFlJDGKsjeVufrteCjgVr3w
	w/ryFpey9jbS1dvvHwjccUP3bKEr+5GY5xZDFV0Za34v7FE5LNw4LCQ==
X-Gm-Gg: ASbGncuGuI3LqqqnsE5kyTZQViU17znuHaiLmhL9jwf9OxtDcq870nM7TLX8V5OLcAV
	n9SawLKBU/IpBn8yscaoQQU0ERBlG2O9okf0hm5lNjdfnqhI3AXUIxzKnOZ/l3cLde9jV+HOaL/
	R5LTBAt7HdmVVBZwBGq56yn3Gro1R+pOmEkgFGja2bKwOnNHjU/cuimhoCHjZYM1dDA7L7eqQNY
	r35gGC1QKDRMnp+TWZWe45Iar0WuCfifqE=
X-Google-Smtp-Source: AGHT+IFbWpnNaQRMkmMGCWJwKWLSFPCgKrpUVJhkWhmCg8wuzEAglTGmiTQG4cugbeqoeX5uFAZWT86WnfNSaUywLGk=
X-Received: by 2002:a05:6512:60d:20b0:554:f7ec:3b23 with SMTP id
 2adb3069b0e04-55a51359f3dmr1559012e87.15.1753351136563; Thu, 24 Jul 2025
 02:58:56 -0700 (PDT)
MIME-Version: 1.0
References: <20250724083914.61351-1-angelogioacchino.delregno@collabora.com> <20250724083914.61351-37-angelogioacchino.delregno@collabora.com>
In-Reply-To: <20250724083914.61351-37-angelogioacchino.delregno@collabora.com>
From: Chen-Yu Tsai <wenst@chromium.org>
Date: Thu, 24 Jul 2025 17:58:45 +0800
X-Gm-Features: Ac12FXwhroXh9igzrCvp17h0_fa0JxIrUDzrCtprSHzHickYMU-wGcIvqxYBtBo
Message-ID: <CAGXv+5G3kbSzs99mogy57mh+LUdi_87zBmFH8GQFWvROhLFbDg@mail.gmail.com>
Subject: Re: [PATCH 36/38] arm64: dts: mediatek: mt8195-cherry: Add missing
 regulators to rt5682
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250724_025858_385606_0A32A180 
X-CRM114-Status: UNSURE (   7.89  )
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
> Add the missing DBVDD and LDO1-IN power supplies to the codec
> node as both RT5682i and RT5682s require those.
>
> This commit only fixes a dtbs_check warning but doesn't produce
> any functional changes because the VIO18 LDO is already powered
> on because it's assigned as AVDD supply anyway.
>
> Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@coll=
abora.com>

Confirmed this matches the schematic.

Reviewed-by: Chen-Yu Tsai <wenst@chromium.org>

