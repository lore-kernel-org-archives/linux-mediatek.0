Return-Path: <SRS0=GIYZ=KT=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.7 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AF2EEC04FF3
	for <linux-mediatek@archiver.kernel.org>; Mon, 24 May 2021 21:07:35 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 6C3E061411
	for <linux-mediatek@archiver.kernel.org>; Mon, 24 May 2021 21:07:35 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 6C3E061411
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=Fkb1Kqct9UAo6pO8fpAhFjKjiqeIiGefrJobrKCJKXo=; b=eLCJkBnn25x/TS
	g8GR/75dCz8dwKm37jeLXTFRfdHWpHYRBDi5KfucakH87kBgkAzmaK4l6yoSaC1SL8RaaFk/8Yc8U
	ZVnE+Q1F3FpG5qfT5HY7LSRZRaG7crbOIcrVLsTBQ2/kMlyU57Cg8wEOAgLNPm+sAjTELmH72FILM
	2QR/vPWB5wKjmYom2cM3kgNBsAdQ6+y6XIuA20lvuFZ5QnrnwVyqbhamhH2Bq6o7oUEQ29iSNYVMw
	5GzlsI6a2GgiL2uZ3Bq6+En8mgDcmXyLs+EzQqBXF+OgbtKGY+usEYpNv9FmagO3zhw9rS1upW2eF
	thv98dnTF6ARwAt2rDCA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1llHnC-001tYS-DU; Mon, 24 May 2021 21:07:18 +0000
Received: from mail-pg1-x52e.google.com ([2607:f8b0:4864:20::52e])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1llCRm-0012PV-5a; Mon, 24 May 2021 15:24:51 +0000
Received: by mail-pg1-x52e.google.com with SMTP id i5so20369814pgm.0;
 Mon, 24 May 2021 08:24:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=SdxJSqfgziagedBw0XrcHxZm8bidCvv9boVgE9SVO4w=;
 b=hRKZ1Gc0eU5QYIkceJ3FdfaYPJ3pvcLbpZYHC5KjSd8N9Tg9XclrQHK3NfXeo79O5G
 N6N7COZ8ES2eMkzfe0JwoskjL5A0FlPA0vx5WaWzKcyDh8y2ys5Y/IUFsBsS0sKWQph1
 MLH0Rzo9nmN+fuADpeYMd+H1f3TUOBi9DChfyfWc36sgsbsBIPLYC0o/6YVM9lq6dV6X
 NjAV/V+rkQi9fYjZw2B/3837zs+UlHvcpHIUd1qi2B7bZA/zYlsVlUIBnou8mGTt/355
 SbwY6v9ePCvsgH+Xjzd8J3k34iBbC5/b1lsbfhMai1f9GgrKWgQKYCchQNoM9xVAESgn
 cmvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=SdxJSqfgziagedBw0XrcHxZm8bidCvv9boVgE9SVO4w=;
 b=CCOuGh9RhCqg2uLTRLqYiXB4ms5JiXxN+oD0UEeHvZDMGKCV0MsIH7ITTu6Eqqhqxy
 aA7F3mvO+XCsUG2T5lU7mTQTogWmNFe9MX6oc3qWdvoNNeWVR2L1DkT7T5fv9vjbQ6/n
 vydNwZfO3+bbb5+L2WzG/XBmOv/wFzYF7wa4izdkx6DdXtw8DGBN/MUpGFLyy9mqJRQA
 uG8dYhGnDiIFOyAJPno93zfawTuOCEcg+eG2xDBZXGd9vzCmmfDblBedAnHyqx2j83OZ
 Tx7uTw5E/C1ra/totMrkNmdju+8cRlx8ACQICKZeURMD0bFFawhIg0WOoaWRGFIKiITU
 /qDQ==
X-Gm-Message-State: AOAM5335k7WoYWxh2yhv+lEn7PLsmLYSEqB8ylUJtYfNEzEKJSAJyofg
 agAjaoqLnuXpLoe6dru7TcI=
X-Google-Smtp-Source: ABdhPJx7/6fAdLIu67aceMeF+xCB7VOiL6cBF8XdU3nRpUQ1xRRLy7NlNTpqHtuhxgEEEc0sdnudBw==
X-Received: by 2002:a62:4ecc:0:b029:2d7:d315:2579 with SMTP id
 c195-20020a624ecc0000b02902d7d3152579mr25028889pfb.21.1621869888526; 
 Mon, 24 May 2021 08:24:48 -0700 (PDT)
Received: from localhost.localdomain ([2402:7500:469:b4c4:1464:a4f2:334c:afaf])
 by smtp.gmail.com with ESMTPSA id a15sm10821597pff.128.2021.05.24.08.24.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 24 May 2021 08:24:47 -0700 (PDT)
From: Gene Chen <gene.chen.richtek@gmail.com>
To: jacek.anaszewski@gmail.com,
	pavel@ucw.cz,
	matthias.bgg@gmail.com
Cc: dmurphy@ti.com, linux-leds@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 linux-kernel@vger.kernel.org, gene_chen@richtek.com, Wilma.Wu@mediatek.com,
 shufan_lee@richtek.com, cy_huang@richtek.com, benjamin.chao@mediatek.com
Subject: [PATCH v14 0/2] leds: mt6360: Add LED driver for MT6360
Date: Mon, 24 May 2021 23:24:25 +0800
Message-Id: <20210524152427.123856-1-gene.chen.richtek@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210524_082450_258658_625A9B37 
X-CRM114-Status: GOOD (  10.80  )
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

This patch series add MT6360 LED support contains driver and binding document

Gene Chen (2)
 dt-bindings: leds: Add bindings for MT6360 LED
 leds: mt6360: Add LED driver for MT6360

 Documentation/devicetree/bindings/leds/leds-mt6360.yaml |  159 ++
 drivers/leds/flash/Kconfig                              |   13 
 drivers/leds/flash/Makefile                             |    1 
 drivers/leds/flash/leds-mt6360.c                        |  910 ++++++++++++++++
 4 files changed, 1083 insertions(+)

changelogs between v1 & v2
 - add led driver with mfd

changelogs between v2 & v3
 - independent add led driver
 - add dt-binding document
 - refactor macros definition for easy to debug
 - parse device tree by fwnode
 - use devm*ext to register led class device

changelogs between v3 & v4
 - fix binding document description
 - use GENMASK and add unit postfix to definition
 - isink register led class device

changelogs between v4 & v5
 - change rgb isink to multicolor control
 - add binding reference to mfd yaml

changelogs between v5 & v6
 - Use DT to decide RGB LED is multicolor device or indicator device only

changelogs between v6 & v7
 - Add binding multicolor device sample code
 - Add flash ops mutex lock
 - Remove V4L2 init with indicator device

changelogs between v7 & v8
 - Add mutex for led fault get ops
 - Fix flash and multicolor no-ops return 0
 - Add LED_FUNCTION_MOONLIGHT

changelogs between v8 & v9
 - reuse api in flash and multicolor header

changelogs between v9 & v10
 - add comment for reuse registration functions in flash and multicolor

changelogs between v10 & v11
 - match dt-binding reg property comment to the functionality name
 - remove exist patch in linux-next
 - dicide multicolor channel by color definitiion

changelogs between v11 & v12
 - Fix print size_t by %zu
 - Fix dt-binding name regular experssion

changelogs between v12 & v13
 - Fix kbuild test rebot build error

changelogs between v13 & v14
 - Move driver to flash folder
 - Remove LED FUNCTION MOONLIGHT
 - Keep 80 char per line



_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
