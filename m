Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B3CE1C43334
	for <linux-mediatek@archiver.kernel.org>; Wed, 20 Jul 2022 18:20:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=NY9cJreJS+8dTIRGmrgidqYE3b7KxSEOo/TVdrxG4d8=; b=q/tOUHOycAp+j9ldpoNxZiqw8g
	SPUs3/sOqmbMHBtrSHor74ZnNkhdT2CKgY0kx7SmIO08YnwL3h2s9fAmKeb0cQwmWr8Mb97aWr4cR
	xVJDFruTr2z1HRpDZihAYX9qGQLAFJcnIdb6+SKATejfJW8tKypIWv7NR8FolFFnvCvAJ8u6qCCVt
	7Jm8eaUj4kTneoJxwz2kgkrR9Ibq0om7qVGnEzuYOU0chiqS7PjRC1obiK0jHa8UN25Dfsv6co34P
	MG0fmq8volblozb83LEU7XHUqxRsHsl2QAKSx8q1j1R1vqs0ALIO6m5nbzXMJI0dAv4bLahTUUO4D
	Ux8o7KBQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oEEIa-009A7l-DX; Wed, 20 Jul 2022 18:19:52 +0000
Received: from mail-wr1-x42a.google.com ([2a00:1450:4864:20::42a])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oEEIL-0099yh-Lh
	for linux-mediatek@lists.infradead.org; Wed, 20 Jul 2022 18:19:40 +0000
Received: by mail-wr1-x42a.google.com with SMTP id e15so22041274wro.5
        for <linux-mediatek@lists.infradead.org>; Wed, 20 Jul 2022 11:19:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20210112.gappssmtp.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=NY9cJreJS+8dTIRGmrgidqYE3b7KxSEOo/TVdrxG4d8=;
        b=HeBQ+q8vwmoOwDim0LlmLDOVVnf5cKWvW0P3ll0FGcUCRb7AxtuiwiFdCqRdELVcHf
         u2+sBwsBRkKubwJrcwmj6RLl+gCNPmN5HdZ9nV52WUPxLFrpIGWnmnxhRPMY51CYzK87
         vDrGNNisSkftJhPZ8zboSC3K9w2zazdIg+620CqaxA8+oTw958VJwH4orw87YYz+QGp9
         Pw9ruxLn85LfjfXwo8EHVacwXBtDJB5rTE1o0ctARmKCdQidRUYTdgkp1ZMIVRVGhNrf
         U2ooXPBg1xW/EA56cugFZEEsyQUyZIZg3BAIcgE2z+1QnY9GF48RMDUMX5vPninvfaHO
         GYpw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=NY9cJreJS+8dTIRGmrgidqYE3b7KxSEOo/TVdrxG4d8=;
        b=tAqy1alOjW0KHs0ErpWSlfO8qTj8MTE/bCNCltVBbIjE3E0+CR2zz0xerWMM6+UOdB
         lEwuT2EtnN5awYDGAp2GfoIjY5UVIDxIFe7N0kfdCXlyqf8h8yYOGXFMBsctGyvSKsou
         weLNmlnSFyHyI7GqkXX1mJKY9Qs29IxMC8DlRV1G0QNhftpYe/f1QL63pgIU1OirICfv
         zUVWvAKfMQ8aL9vM0A3XnFPfhnUrlhH3l3mc90ogTkvQQipbI+eUNZQzxCAf5FY9RQsd
         qaXJvxhxHiikaPuYuXF7twCzOafrLZjcprbjdDGooyJKXk12sy1hroETroZ0vXpActQD
         STrA==
X-Gm-Message-State: AJIora9z4mEVhS3aHz5UMnd6VisnV4RCuiy1g0uAvJ9V6J2URJmkCl//
	5/E1v77XDezkEMQXrRCgxXgjtw==
X-Google-Smtp-Source: AGRyM1uOSnTxFw11JEDWcRNpBDAT1cS/8w7zBzTLAlxFhmOCrLYwrxJYzMip4iynsppCZeNaBxrrjg==
X-Received: by 2002:a05:6000:156e:b0:21d:c50a:7cdb with SMTP id 14-20020a056000156e00b0021dc50a7cdbmr26493839wrz.16.1658341174422;
        Wed, 20 Jul 2022 11:19:34 -0700 (PDT)
Received: from amjad-ThinkPad-T490.home (2a01cb040613180084408ac44a1fa242.ipv6.abo.wanadoo.fr. [2a01:cb04:613:1800:8440:8ac4:4a1f:a242])
        by smtp.googlemail.com with ESMTPSA id z17-20020a05600c0a1100b003a31d200a7dsm3400093wmp.9.2022.07.20.11.19.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 20 Jul 2022 11:19:33 -0700 (PDT)
From: Amjad Ouled-Ameur <aouledameur@baylibre.com>
To: matthias.bgg@gmail.com
Cc: rafael@kernel.org,
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
	rui.zhang@intel.com,
	Amjad Ouled-Ameur <aouledameur@baylibre.com>
Subject: [PATCH v2 0/4] thermal: mediatek: Add support for MT8365 SoC
Date: Wed, 20 Jul 2022 20:18:50 +0200
Message-Id: <20220720181854.547881-1-aouledameur@baylibre.com>
X-Mailer: git-send-email 2.37.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220720_111937_926978_E4CE0DEA 
X-CRM114-Status: UNSURE (   7.22  )
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

Note that the V1 [0] was originally introduced by Fabien Parent [1]. He
requested that I take over this patchset.

[0]: https://lore.kernel.org/linux-arm-kernel/20220530183833.863040-1-fparent@baylibre.com/
[1]: Fabien Parent <fparent@baylibre.com>

Amjad Ouled-Ameur (1):
  thermal: mediatek: add another get_temp ops for thermal sensors

Fabien Parent (2):
  dt-bindings: thermal: mediatek: add binding documentation for MT8365
    SoC
  thermal: mediatek: add support for MT8365 SoC

Markus Schneider-Pargmann (1):
  thermal: mediatek: control buffer enablement tweaks

 .../bindings/thermal/mediatek-thermal.txt     |   1 +
 drivers/thermal/mtk_thermal.c                 | 191 +++++++++++++++---
 2 files changed, 162 insertions(+), 30 deletions(-)

-- 
2.37.1


