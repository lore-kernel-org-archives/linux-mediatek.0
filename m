Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 10B7CD15D9D
	for <linux-mediatek@archiver.kernel.org>; Tue, 22 Oct 2024 11:14:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=0lIW4Wb18nTyhM0bbi98WhNBwSHn7JFubcRs4dz0PzM=; b=h3aOdByWdidinLGBh11RzxwsrH
	d2v6dxgIQVS6Uj9IM4f1QTDg/b/hqTB1RVECzNieP7fdJ/DPrO31ECiCQiVZUfihfLnMRAKOebg9W
	2K+73IO/Xn6pfXfpX88/kDJCHgXdorQyf6VhXCYUs8PS2Iv1YmW3egnB/9hEgRLVHuh56PNagOX3Y
	DKKXLOASlUrIFkOvxLghtMZJRs18tGoSnOLXum/WVuQ7J+d/EFKBLghm2dNva/x7MyujH4m/HzMHc
	W2WnC6qYzPhI+ruHI1p3lA2Kzzp8+f/uilHkDzMpNvTSh0nyYNExdZpmuAfZRbLrEx8t683/YZf5q
	fL4RrfRQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t3Cqe-0000000Af66-3V3t;
	Tue, 22 Oct 2024 11:14:48 +0000
Received: from mail-yb1-xb36.google.com ([2607:f8b0:4864:20::b36])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t3Cqb-0000000Af3t-27SU
	for linux-mediatek@lists.infradead.org;
	Tue, 22 Oct 2024 11:14:46 +0000
Received: by mail-yb1-xb36.google.com with SMTP id 3f1490d57ef6-e291f1d659aso4999488276.3
        for <linux-mediatek@lists.infradead.org>; Tue, 22 Oct 2024 04:14:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1729595684; x=1730200484; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=0lIW4Wb18nTyhM0bbi98WhNBwSHn7JFubcRs4dz0PzM=;
        b=mRnop8Phs6CMxI/LqKhj77r3Sz8yY8MCOCvZ3ox/PFlrQJulF09bWzvUAyOoy8wvGg
         W37Mxm1Ot6QVucaoSx3E46Q26H1GN/oN4oHZTHAyWzst3qC6DxO04t522j1GziqDZjjI
         hf7VClupDuDKATEWEqGX91253hT08IEZw0xp9LYeHAOwhyWwFm07PmxabCB/u4qbbWZN
         oT2J4yYr5oaOWnB6ogob9+mXc3UiMYdOr+9QA4AUYj1EmM5A2LobFSVYJD6azFfkpobK
         ICw8apubZnagKzvlA/xomkTYYC/X9j0bvyvr2k4AzdNb/0LBbMUpRXxQeUTnKldSbEJP
         ud3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729595684; x=1730200484;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=0lIW4Wb18nTyhM0bbi98WhNBwSHn7JFubcRs4dz0PzM=;
        b=C11Z9exfcNXXCUsg4CkgMOkZN73KUuxxQnREGKI5H6C05krcgf94xGQULwFROlL3ec
         CrpcW2pBbmE7iNo9v2tZbtZdtybGzPPiiOB8oyjO6K+yhsikzQ0oddgw4KiEauxJWJrg
         B82HBLulPrFBfewFU3jjZxI3JmNf5xAKqffn3l7zmVZYLVBRju4aZJnthDYxwPbwXp8f
         Uwljzf63CySo2t5PIeYyNWcwIE4xCQJv1SiDyIlsUx5CZ1Lwvy8bi2uviVIOECoYxWBw
         Yf2RrjJ+fALfnKbBwjPlKn5ortSsN4r9B3TwurNy4zMebgKWJVqOJedBC4SOTloFnMfp
         bA9A==
X-Forwarded-Encrypted: i=1; AJvYcCVhNwo/vlV3tAL1uGcDpeRs7RDL0PTWKwy5EjNoLyUVJQZ0YamgJ/368zkitQgdaJmMG0Grd4WhVpbxRzF3gw==@lists.infradead.org
X-Gm-Message-State: AOJu0Yya4S7yu7Ev2AaLaHKY7zQ7LmaJc+3EWcaj/G9blnItSukQlzeu
	/L3VY9QOEC3VpgCWHs9uSgwGPi7wvOLPDwCdcbL1w9Bi7XY0y1P5Ng684YU8mleAFRmT6B/tTgT
	DWSUS8G81uJwGI9ogZ07G+DDr9IHokn/xwICfAQ==
X-Google-Smtp-Source: AGHT+IFpse40o4X8e1WY4RLX2IO8eNJPCGg/k4PLRJOFjrePcxo0X9oUrn9Lc5Wix32KzQ4Lv5WuGRPtSxG1lG0RICc=
X-Received: by 2002:a05:6902:2b06:b0:e2b:db9c:5366 with SMTP id
 3f1490d57ef6-e2bdb9c5505mr7783762276.37.1729595684226; Tue, 22 Oct 2024
 04:14:44 -0700 (PDT)
MIME-Version: 1.0
References: <20241017085136.68053-1-y.oudjana@protonmail.com>
In-Reply-To: <20241017085136.68053-1-y.oudjana@protonmail.com>
From: Ulf Hansson <ulf.hansson@linaro.org>
Date: Tue, 22 Oct 2024 13:14:08 +0200
Message-ID: <CAPDyKFqck_0vwNVLzAubHArF2XH_S5pWNwPOfFkom1pPE0hoVg@mail.gmail.com>
Subject: Re: [PATCH v3 0/2] MediaTek MT6735 SCPSYS support
To: Yassine Oudjana <yassine.oudjana@gmail.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
	Alexandre Mergnat <amergnat@baylibre.com>, Fabien Parent <fparent@baylibre.com>, 
	Markus Schneider-Pargmann <msp@baylibre.com>, Alexandre Bailon <abailon@baylibre.com>, 
	Chen-Yu Tsai <wenst@chromium.org>, Eugen Hristev <eugen.hristev@collabora.com>, 
	MandyJH Liu <mandyjh.liu@mediatek.com>, Yassine Oudjana <y.oudjana@protonmail.com>, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-pm@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-mediatek@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241022_041445_566565_0B8D8522 
X-CRM114-Status: GOOD (  15.05  )
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

On Thu, 17 Oct 2024 at 10:51, Yassine Oudjana <yassine.oudjana@gmail.com> wrote:
>
> From: Yassine Oudjana <y.oudjana@protonmail.com>
>
> These patches are part of a larger effort to support the MT6735 SoC family in
> mainline Linux. More patches (unsent or sent and pending review or revision)
> can be found here[1].
>
> This series adds support for most SCPSYS power domains on MT6735. See patches
> for details.
>
> Changes since v2:
> - Rename DT bindings header to mediatek,mt6735-power-controller.h
> - Remove comment citing header from DT bindings
> Changes since v1:
> - Squash DT binding patches
> - Dual-licence DT binding as GPL/BSD
> - Switch to mtk-pm-domains driver
> - Add MFG bus protection bit
>
> [1] https://gitlab.com/mt6735-mainline/linux/-/commits/mt6735-staging
>
> Yassine Oudjana (2):
>   dt-bindings: power: Add binding for MediaTek MT6735 power controller
>   soc: mediatek: pm-domains: Add support for MT6735
>
>  .../power/mediatek,power-controller.yaml      |  1 +
>  .../bindings/soc/mediatek/scpsys.txt          |  1 +
>  drivers/pmdomain/mediatek/mt6735-pm-domains.h | 96 +++++++++++++++++++
>  drivers/pmdomain/mediatek/mtk-pm-domains.c    |  5 +
>  drivers/pmdomain/mediatek/mtk-pm-domains.h    |  2 +
>  .../power/mediatek,mt6735-power-controller.h  | 14 +++
>  include/linux/soc/mediatek/infracfg.h         |  5 +
>  7 files changed, 124 insertions(+)
>  create mode 100644 drivers/pmdomain/mediatek/mt6735-pm-domains.h
>  create mode 100644 include/dt-bindings/power/mediatek,mt6735-power-controller.h
>

Applied for next, thanks!

While applying I took the liberty to change the prefix of patch 2 into
"pmdomain: mediatek".

Kind regards
Uffe

