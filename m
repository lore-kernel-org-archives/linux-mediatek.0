Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6F08DC43334
	for <linux-mediatek@archiver.kernel.org>; Wed, 20 Jul 2022 13:13:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=9LgN/S0aDXYI9VGCuWlvvgvQnGpuTnnqHsiuzMd2wxQ=; b=PUQQbP0OP3ajg4I2NnOeCSNUFh
	+GPHatdYa6C8D+9M+592LZVvzweH18JPHBmbnqlQWfyitWvPGZQJsOyVQO0WUI9HCoyzUi0pK8k22
	KGCFLAMaBr/49WGWVgkJPABzptYh5CHctrItdSSi5OODmu/m9FP6gLsFVOgeT3ILqJn8PLwIYo0nH
	o/r+Xv1EwjOaOgGyVg5dUU0LPNmiZh+zzR7UsQxTEqU5NQxHMVVMNylFHTRzbunTkXLFWsUNa+qe9
	T1xFxPfdlp0u9CXRPDPek+r7yoZqTRDeUBpe7YDLo75TfnWelF3ayuljGjm4OPFWX/b2tFA9g9lKn
	5jj832wQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oE9Vl-005pUb-Ri; Wed, 20 Jul 2022 13:13:09 +0000
Received: from mail-wm1-x32b.google.com ([2a00:1450:4864:20::32b])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oE9Ve-005pGW-Vo
	for linux-mediatek@lists.infradead.org; Wed, 20 Jul 2022 13:13:07 +0000
Received: by mail-wm1-x32b.google.com with SMTP id n185so10830027wmn.4
        for <linux-mediatek@lists.infradead.org>; Wed, 20 Jul 2022 06:13:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20210112.gappssmtp.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=9LgN/S0aDXYI9VGCuWlvvgvQnGpuTnnqHsiuzMd2wxQ=;
        b=hZDBwVWDP5UPXoM/26p/r+j251hc2vAqDOCERxSqp1n7sS06JhTWTNUFrAn/iDVTDd
         sk1s9gAeT8g6iMlidLoC2ByWsp6jDzKjyGiwTrHFM+kSqmhnpOGy27aGmIOCRSPQXtjU
         iuHcWvpuEBu/GQL3HjFfyH38HWdcfRwpw/QCs8xRs37MzT7Ik+pcHBHS4PQz7Y7kmEGs
         2zEZT/L22GV5s5xGf/GZOt2FikEOhhfo8etSuo2R+s9KR06g6oLOKoKJ9cp2Devph4aN
         HYnuH9yadQ7mkeUaGKIxYyw+FFFXzGLODhmRa8DXLmg2/yBLqQ88/ndcWxmAnabBH3H2
         gPtg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=9LgN/S0aDXYI9VGCuWlvvgvQnGpuTnnqHsiuzMd2wxQ=;
        b=z7fE6KxSxsHbLy9KN9qmYXeYZAVhvxCAP/Gpwpai8GZ7MT6KvEoo376ctAN7vybw1w
         9GuPzCh+1hBCerhZrRllJsrOBEFSvnNI9Fx8w4Nz+LbCbJUE7z3g7F1bF7ayKwif+Hlv
         Gku4LQJ/ehUdwjnMcs68NwYPi5tcVQTmpL0Svgiix2pUd7gkDYNukF/zDJSOW77MOZ/P
         wRtuGc9LlSMaDr7w8gAdOO9+rGTM3dJAuFB4AzjnMhzL6s0havZN3rTPKK1S5X8Gx1hI
         WL+jrHsQDaUWnpolBxwUIKl14SAmcISiS05aYIL98ZNtaNHLvSqJW1PC5cZRw3IyjQlq
         N1Fw==
X-Gm-Message-State: AJIora8t0cUhccrbYh2gRUesn2vFUkCkPBfiX/HFORheTwCCOJrKfbwz
	cf0FwM7yaNA0GOf+DQagE8FeeA==
X-Google-Smtp-Source: AGRyM1tHJE+D+NzsNowU+goDfK+LE01p5AmV4nGBMM9nPZVjT15IP9nJaaafPk1bF4qVs2pE8TNv1A==
X-Received: by 2002:a05:600c:3b91:b0:3a3:1cbe:d531 with SMTP id n17-20020a05600c3b9100b003a31cbed531mr3812400wms.159.1658322779330;
        Wed, 20 Jul 2022 06:12:59 -0700 (PDT)
Received: from amjad-ThinkPad-T490.home (2a01cb040613180084408ac44a1fa242.ipv6.abo.wanadoo.fr. [2a01:cb04:613:1800:8440:8ac4:4a1f:a242])
        by smtp.googlemail.com with ESMTPSA id y11-20020adfc7cb000000b0021d6924b777sm16853316wrg.115.2022.07.20.06.12.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 20 Jul 2022 06:12:58 -0700 (PDT)
From: Amjad Ouled-Ameur <aouledameur@baylibre.com>
To: fparent@baylibre.com
Cc: broonie@kernel.org,
	chaotian.jing@mediatek.com,
	chunfeng.yun@mediatek.com,
	devicetree@vger.kernel.org,
	dmaengine@vger.kernel.org,
	jic23@kernel.org,
	krzysztof.kozlowski+dt@linaro.org,
	linux-arm-kernel@lists.infradead.org,
	linux-i2c@vger.kernel.org,
	linux-iio@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-mediatek@lists.infradead.org,
	linux-mmc@vger.kernel.org,
	linux-phy@lists.infradead.org,
	linux-serial@vger.kernel.org,
	linux-spi@vger.kernel.org,
	linux-usb@vger.kernel.org,
	linux-watchdog@vger.kernel.org,
	linux@roeck-us.net,
	matthias.bgg@gmail.com,
	qii.wang@mediatek.com,
	robh+dt@kernel.org,
	srinivas.kandagatla@linaro.org,
	ulf.hansson@linaro.org,
	vkoul@kernel.org,
	wim@linux-watchdog.org
Subject: Re: [PATCH 16/17] arm64: dts: mediatek: add mt8365 device-tree
Date: Wed, 20 Jul 2022 15:12:57 +0200
Message-Id: <20220720131257.530168-1-aouledameur@baylibre.com>
X-Mailer: git-send-email 2.37.1
In-Reply-To: <20220531135026.238475-17-fparent@baylibre.com>
References: <20220531135026.238475-17-fparent@baylibre.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220720_061303_073889_157847E2 
X-CRM114-Status: UNSURE (   5.94  )
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

Hi Fabien,

> +		tzts4: tzts4-thermal {
> +			polling-delay-passive = <0>;
> +			polling-delay = <0>;
> +			thermal-sensors = <&thermal 4>;
> +			trips {};
> +			cooling-maps {};
> +		};

AFAIK mt8365 has only 3 thermal sensors, therefore tzts4 should not be
added.

Regards,
Amjad

