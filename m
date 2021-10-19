Return-Path: <SRS0=SpBb=PH=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EEFBFC433FE
	for <linux-mediatek@archiver.kernel.org>; Tue, 19 Oct 2021 09:36:58 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C55816137F
	for <linux-mediatek@archiver.kernel.org>; Tue, 19 Oct 2021 09:36:58 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org C55816137F
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=J473qh3PvdmaWieGyrEQe3efTKsqq6zWNQYptz0Yp/Q=; b=RtZeYdKJiqUD2b
	qrPFE/rXKCkZRO27DMyfpyoHAe+C6h6vkHSBgHGofh7hXip5o+rsSPQoZXsFzm+aNbKyg3qZqiQNm
	Wwq/J/D92dAR2ENbzGVFYhB4SGQtsNFTOzWoXBZ+7seIGjjroRZey1gr7y7PlNDFvZ/1UEA0lOe3p
	+Pj1+lURGo6Q9BcNhU6lwC27jfNMtFEJEYLPIUCiQvoBeY9lnrlTWkyYF3BFSMBy/lu8qJm9L2VhH
	nw78VyohgwhTLMZFZ1IPLvO64X693WRnaUweKvL/0zprrHiGfIwrZ108JKcQNc78+EkTAY65pSSaT
	Rhu0BM2DgoATozFoij5g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mclY2-000gFq-RG; Tue, 19 Oct 2021 09:36:42 +0000
Received: from mail-wr1-x435.google.com ([2a00:1450:4864:20::435])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mclXo-000gAA-JD
 for linux-mediatek@lists.infradead.org; Tue, 19 Oct 2021 09:36:30 +0000
Received: by mail-wr1-x435.google.com with SMTP id t2so46673304wrb.8
 for <linux-mediatek@lists.infradead.org>; Tue, 19 Oct 2021 02:36:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20210112.gappssmtp.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=pAQ3nDSi7GJKEkpq93Gk3fW3GifCTB9f+3J4xNuNsa8=;
 b=gP8nU56KZdDX/muBPZFm9b5HoHa1FEeoZNaQ2M517z2vjkHquJFNvDOJ/wxnFuRZmc
 6VEiXjBGNq4woQv9vGa6VmWMg4+aelNiIhZGvrtKs8tMVuO/F2zE7q/+GiEcS94XM2Z8
 tr3k5LODloiPk6Nmx/iMI9cKoOJH3WKCAMso2klC9XoLZ7Nrihxfs03+3KoLxzRkMNHP
 qZuUrzT9di/B3Ht8J8NWeW2s+llj+fySzAGXtW1t84ZyvjmbfyusOGnGosqJqftB2Y4T
 dlNIAEKjZpKNmEP/Tvhkr4ZvQAOlgNK2IKNTeO98tcnmXwoPa9xdhptRLpO9uOvWbOq8
 S98A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=pAQ3nDSi7GJKEkpq93Gk3fW3GifCTB9f+3J4xNuNsa8=;
 b=cewPKvFVe40ogy00qT2YbTiMJzAaDHQ5FsYSBq9F1cpda6zG+Xxf8hX1WzaxjrKo1D
 TeqH8LZguu7GBoV7C4AN+Mn7tG4u+degdQv4gcwXY+UgnV2HEEjPXx0dRC5b5kx2AEeE
 g5ZVcjahP0Q8j7yYDWDtOtPsm2GVi/BRY1gsXHzWesSgWZhMQtZ/zMsiitJ6OwcUSaHQ
 ohlxIj1KsJjLj/F7U8AfFPtkWDbUrRKGrP6cuZurO/QbVwfHVRm7thJn1M+kwyIeKllN
 YYu5voUBYNooThUzd54Z+kesLptlz6L4aVGAvvEYz73HC3807nPU18DXoLPBZTyHmBIz
 3/IA==
X-Gm-Message-State: AOAM533vmoMZxRf59qRwDHT2bIsSK7ik0H5RA5XsZbgsnOXixjHlbwXx
 LTeqiJszEZE5O5rOTgsOaPR8aQ==
X-Google-Smtp-Source: ABdhPJxOQXjEw6eiRtOB4dRH95sLoz/UAgvA3+DT3VX0bWePwEQwNePyd24CoSoDt1rFoxL8eXWmIA==
X-Received: by 2002:a5d:6e8d:: with SMTP id k13mr42883919wrz.295.1634636186755; 
 Tue, 19 Oct 2021 02:36:26 -0700 (PDT)
Received: from blmsp.lan ([2a02:2454:3e6:c900:5142:5fbb:5821:5dc3])
 by smtp.gmail.com with ESMTPSA id o23sm1765765wms.18.2021.10.19.02.36.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 19 Oct 2021 02:36:26 -0700 (PDT)
From: Markus Schneider-Pargmann <msp@baylibre.com>
To: Zhang Rui <rui.zhang@intel.com>,
 Daniel Lezcano <daniel.lezcano@linaro.org>,
 Matthias Brugger <matthias.bgg@gmail.com>, Rob Herring <robh+dt@kernel.org>
Cc: linux-pm@vger.kernel.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 fparent@baylibre.com, khilman@baylibre.com,
 Markus Schneider-Pargmann <msp@baylibre.com>
Subject: [PATCH v2 0/4] thermal: mediatek: Add mt8365 support
Date: Tue, 19 Oct 2021 11:34:00 +0200
Message-Id: <20211019093404.1913357-1-msp@baylibre.com>
X-Mailer: git-send-email 2.33.0
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211019_023628_691641_215B5A6D 
X-CRM114-Status: UNSURE (   9.36  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Hi,

this series adds a compatible to the bindings and a specific part for
the thermal driver.

In v2 I added a patch to remove unnecessary (void*) casts and fixed the
comments I received.

Thanks for any feedback or comments.

Best,
Markus


Fabien Parent (1):
  thermal: mediatek: add MT8365 thermal driver support

Markus Schneider-Pargmann (3):
  dt-bindings: thermal: mediatek: Add mt8365
  thermal: mediatek: Fix apmixed error message
  thermal: mediatek: Remove data void casts

 .../bindings/thermal/mediatek-thermal.txt     |   1 +
 drivers/thermal/mtk_thermal.c                 | 102 +++++++++++++++---
 2 files changed, 91 insertions(+), 12 deletions(-)

-- 
2.33.0


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
