Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 25404D15D96
	for <linux-mediatek@archiver.kernel.org>; Mon, 21 Oct 2024 14:15:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=0W4u+QtS4UNkEr65DGOIEiZitFsgZAiIfJ/DctJiwRs=; b=yGn9/mzMJDKoNsCSaZu3CXqacn
	fosTvxpJpPhKSApq7zyfVXKxMNd81U9qtRNWPw2nfy39VyypSeJlLDNayawvXv+GPJ1bt4yJz2SJL
	0CHFjO/H4kRZE/V2ho8d8jsMC5ud1c2oLIYSiqeNGFfGXC1mYpd0cDdN/wOEqUekXb17oHYWVaJv/
	BiW8uS8u/hQ6Juep7jXrUpTsYIFYCYU6z70FqfxNNbWpjm+1H7/p7wTjo5GeAKbLU0epJzcjLNCOh
	LDPmT/2ngPXRjiADA9wCTW0YHeruWqNIpuGJ8I4aqF4FSpSCBXIi9nLhLkxedmKZNFSwHLcXNlT4B
	/LJwCJHA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t2tBx-00000007aMa-3GuP;
	Mon, 21 Oct 2024 14:15:29 +0000
Received: from mail-wm1-x331.google.com ([2a00:1450:4864:20::331])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t2s00-00000007LJo-4AyT
	for linux-mediatek@lists.infradead.org;
	Mon, 21 Oct 2024 12:59:06 +0000
Received: by mail-wm1-x331.google.com with SMTP id 5b1f17b1804b1-4314fa33a35so45629975e9.1
        for <linux-mediatek@lists.infradead.org>; Mon, 21 Oct 2024 05:59:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1729515542; x=1730120342; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0W4u+QtS4UNkEr65DGOIEiZitFsgZAiIfJ/DctJiwRs=;
        b=b5hRW6Ht+swzH7APiDp+5yNoexEaqiWBpr16mxjPfI5A+avjs/lnsz+Zf9CsmwOBKR
         h3Ixm95fms2cAymWywqnQo4emYEI7L1P2tCp73sbxUhsT1yw1dxXvplxyoKL0EgerwT2
         BUovIFz2QXFd2ZO8pvykMIHogoVuRbSqxHbHxjP5pIePQJWVYjKyzT5HQItFboZkwtuc
         GObCkkopq+Dns65r0IGrjNyNJFG61FUsEbxYLcLwnDGcyiH+FwbZ14EXhYZkaAyllVYs
         K04dRx9riGLRpDAYPIKMbOobRwFV3fJy1liYdMNvnS6MwUshr392hfE4GYI4/F2YWnPs
         8knw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729515542; x=1730120342;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=0W4u+QtS4UNkEr65DGOIEiZitFsgZAiIfJ/DctJiwRs=;
        b=IgefCDiYMF7m02fVelmwArVUQBOCfeqIihyNz6/9NFA5M7AIgz3EDrwHPu+AAcyjQr
         pfzzUCSaYIAxs0IGX+oL7bb/NCnn8g6cBW+fAExhHZysopYJj1ZpzNZ5HYihk6/6SEp+
         pLw6Raod6vflBEVfIO97eo0hc87c51eEluwYtqHwfA1TK6a+f8lg49lUqm+09WDUq6rJ
         UrpCEmV9faYoKg32c+hGlc8XslY1S/bJHMG7xnkydTqyJtd0r77zMQ+x8rAbwhcvCwKd
         yRDeo5tu++HOmtkVv/2gUvp4HoaowzwnWFpw21BnNrp6N7NqQTzgaV6xVla9zi/KYJ1T
         Nrew==
X-Forwarded-Encrypted: i=1; AJvYcCUmUhhzlX6H0CmwvzqXMKboTOayQxjImUVHuoJte0WabflYLl5QN5i+rpeVoPWIdMVTxgx8FHFFxuVeWr53Sg==@lists.infradead.org
X-Gm-Message-State: AOJu0YzWtqNmW+mfEwrWOxmLw1Q1+0LxzAK4FGRmGYmdBfn+JkC0Ysap
	mY68tpkEtNq6BM1gj3lE4uXgpnsvcDAvOUGI/JGWhcQ9AhxLkIc9OXMEc5pe4LY=
X-Google-Smtp-Source: AGHT+IH04j80oL9ouXTZKR+04j2kFDZL0aYwGPdMMYjCKFcqtXA5i8kcVtQSqWhMcA827fSFGcOcew==
X-Received: by 2002:a05:600c:3151:b0:431:6060:8b22 with SMTP id 5b1f17b1804b1-43161641a62mr89150865e9.10.1729515542557;
        Mon, 21 Oct 2024 05:59:02 -0700 (PDT)
Received: from arrakeen.starnux.net ([2a01:e0a:982:cbb0:52eb:f6ff:feb3:451a])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4316f5cc4dfsm57452995e9.45.2024.10.21.05.59.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Oct 2024 05:59:02 -0700 (PDT)
From: Neil Armstrong <neil.armstrong@linaro.org>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>, 
 Stefan Agner <stefan@agner.ch>, Alison Wang <alison.wang@nxp.com>, 
 Chun-Kuang Hu <chunkuang.hu@kernel.org>, 
 Philipp Zabel <p.zabel@pengutronix.de>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Jagan Teki <jagan@amarulasolutions.com>, 
 Andrzej Hajda <andrzej.hajda@intel.com>, Robert Foss <rfoss@kernel.org>, 
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: dri-devel@lists.freedesktop.org, linux-amlogic@lists.infradead.org, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 linux-mediatek@lists.infradead.org
In-Reply-To: <20240908-regmap-config-const-v1-0-28f349004811@linaro.org>
References: <20240908-regmap-config-const-v1-0-28f349004811@linaro.org>
Subject: Re: (subset) [PATCH 0/5] drm: misc: few simple cleanups
Message-Id: <172951554139.1240386.5313614669791374928.b4-ty@linaro.org>
Date: Mon, 21 Oct 2024 14:59:01 +0200
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241021_055905_072811_8C2AB7BF 
X-CRM114-Status: UNSURE (   5.83  )
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

Hi,

On Sun, 08 Sep 2024 16:21:30 +0200, Krzysztof Kozlowski wrote:
> No dependencies, trivial patches.
> 
> Best regards,
> Krzysztof
> 

Thanks, Applied to https://gitlab.freedesktop.org/drm/misc/kernel.git (drm-misc-next)

[1/5] drm/meson: drop unused staitc dw_hdmi_dwc_write_bits
      https://gitlab.freedesktop.org/drm/misc/kernel/-/commit/d9c12481f980bdad9cf6fdb742e49c5b50622795
[2/5] drm/meson: constify regmap_config
      (no commit info)
[5/5] drm/bridge: ti-dlpc3433: constify regmap_config
      (no commit info)

-- 
Neil


