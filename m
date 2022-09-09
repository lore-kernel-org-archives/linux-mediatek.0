Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C4A76ECAAA1
	for <linux-mediatek@archiver.kernel.org>; Fri,  9 Sep 2022 07:40:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=4e7RlBTjQ/k7/7tVuA9R5TTzLZ8Baa2EHE13JLauQ6Y=; b=ccAYhCh2KNNIJaLpvf3rwI18Kk
	p5+0dGIL67jWxTWLbYO3q+0cepYAXRnaJOcEUzMCqJWrBoG7vEibquxzzqF/GWCu/1KaBM7qxX6ZT
	1fIXkFoItlSw5/tu9hXxH0WZFayEFz1uXCAEN78ORlQRBSE9UGRtq9U18y+epHatnL+1ar/JNw6C+
	maQnOXUzYIhJcghi2M7MA99HGWFMjS7PApHQyGPkEtHxY/xuytNLWnZ53a7ms9DeAK5cwKYQvw2vS
	fAsj/3d7Bv5KkbWua+mVmewzHPhV9K7UtKSrjy8nsdaXn6ICtbIf2fKJGSNtuZ5gH9VyB86Mj45/t
	+nizwQBQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oWYci-00E2uM-9g; Fri, 09 Sep 2022 07:40:24 +0000
Received: from mail-wr1-x42d.google.com ([2a00:1450:4864:20::42d])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oWYYq-00E09I-Js
	for linux-mediatek@lists.infradead.org; Fri, 09 Sep 2022 07:36:27 +0000
Received: by mail-wr1-x42d.google.com with SMTP id t14so1276393wrx.8
        for <linux-mediatek@lists.infradead.org>; Fri, 09 Sep 2022 00:36:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date;
        bh=4e7RlBTjQ/k7/7tVuA9R5TTzLZ8Baa2EHE13JLauQ6Y=;
        b=0jHVBB6vKhPCnwAJHFWzRMHXXiIrqoOYDn7Zh/vMmaV7ZC+JtEUN1G1S90boOZRoMO
         Snu4nB3VgcjpYiTT3Fq2KEaZbayZhCjF+50KF39bzaEQr8GoI3WuxwVbTQ/+xbmy2fY8
         pgzMXcKRgQhv5mWnmqaI8iKdQrJV9IVfvYrBcZVG5zWTiJ2ehpBQleR7aas6uRlj4kKq
         AmhZghYC42o1WEQHynaLG4dDJPjHnlkcRnz2BQT9hkczL231U9LW1oZiYxW04iFAxx0v
         rZT3I5ejiH65xkXAd71h6uRXTQpMF+83RFd/VOyOHYugFswy2DOJQlHVwiZ3fMXG7TP5
         iKvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date;
        bh=4e7RlBTjQ/k7/7tVuA9R5TTzLZ8Baa2EHE13JLauQ6Y=;
        b=lxONUej9TubHASn4EM/K2cw1XHD6fkCLHupm7KZztMXBfuL4Q435CP6+ZrV5MzISjL
         ZfFjt8X49WOOReVn/ZaN+h7cjFeO94RI6IT1iRNSkAnnvaxfdGwy1nhw7fwVkMrCvuJ0
         es1fzzU3dr1I+PU9hpKGxDJkoaK5AgSNN1515bAF9sPbaHY2PRMnpafr2eyHl42R78jo
         YeMdXEcMatqVSOzmqycNhZsi116jwKn8g0KEBHnNjP6ShJChbtgDW9UWjvXG5pRm/fqy
         OEe62G1qCd/shacpGr9Es4IWCpGG6gpoUhTb4NKinVTij/7gHn/DEb40nRv43rk4Z5rb
         hnjQ==
X-Gm-Message-State: ACgBeo1Az21v8JOAdkIsLyRfx8Vb0Hr5LlLxWWRrUlVeIpfbvc7ojKec
	9Zuw0pUnRTq7T1pXHHzCAvQbdA==
X-Google-Smtp-Source: AA6agR7krDdgNfaZrjk3h6m6Rzfrva10aTZHIv8TVDFrCMcpmMU3UrZGl4+8EOO5Zx+4WYxcvFE3+Q==
X-Received: by 2002:a5d:508c:0:b0:228:de49:b808 with SMTP id a12-20020a5d508c000000b00228de49b808mr7014788wrt.23.1662708982694;
        Fri, 09 Sep 2022 00:36:22 -0700 (PDT)
Received: from amjad-ThinkPad-T490.baylibre (laubervilliers-658-1-213-31.w90-63.abo.wanadoo.fr. [90.63.244.31])
        by smtp.googlemail.com with ESMTPSA id j5-20020a05600c1c0500b003a682354f63sm5345901wms.11.2022.09.09.00.36.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 09 Sep 2022 00:36:21 -0700 (PDT)
From: Amjad Ouled-Ameur <aouledameur@baylibre.com>
To: matthias.bgg@gmail.com
Cc: Amjad Ouled-Ameur <aouledameur@baylibre.com>,
	rafael@kernel.org,
	fparent@baylibre.com,
	amitk@kernel.org,
	daniel.lezcano@linaro.org,
	devicetree@vger.kernel.org,
	krzysztof.kozlowski+dt@linaro.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-mediatek@lists.infradead.org,
	linux-pm@vger.kernel.org,
	robh+dt@kernel.org,
	rui.zhang@intel.com
Subject: [PATCH v4 0/4] thermal: mediatek: Add support for MT8365 SoC
Date: Fri,  9 Sep 2022 09:36:05 +0200
Message-Id: <20220909073609.32337-1-aouledameur@baylibre.com>
X-Mailer: git-send-email 2.37.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220909_003624_891939_A478BB53 
X-CRM114-Status: UNSURE (   7.98  )
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

This patchset adds thermal support for MT8365 SoC which contains three
thermal sensors.

Changes in V4:
- rebased on thermal/linux-next
- Use callback for raw_to_mcelsius()
- Use struct 'struct thermal_zone_device_ops' instead of
no longer existent 'struct thermal_zone_of_device_ops'

Amjad Ouled-Ameur (1):
  thermal: mediatek: add another get_temp ops for thermal sensors

Fabien Parent (2):
  dt-bindings: thermal: mediatek: add binding documentation for MT8365
    SoC
  thermal: mediatek: add support for MT8365 SoC

Markus Schneider-Pargmann (1):
  thermal: mediatek: control buffer enablement tweaks

 .../bindings/thermal/mediatek-thermal.txt     |   1 +
 drivers/thermal/mtk_thermal.c                 | 197 +++++++++++++++---
 2 files changed, 166 insertions(+), 32 deletions(-)

-- 
2.37.3


