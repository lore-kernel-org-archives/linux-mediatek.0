Return-Path: <SRS0=o4uA=FA=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.7 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CCC96C56202
	for <linux-mediatek@archiver.kernel.org>; Thu, 26 Nov 2020 11:53:24 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 480C020678
	for <linux-mediatek@archiver.kernel.org>; Thu, 26 Nov 2020 11:53:24 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="sw91Ky20";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="rOn0dxA5"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 480C020678
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Message-Id:Date:Subject:To:From:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=6+JRqCu4SKnOaf50vZRma0LlRbBNrQuBgmy+y2buBt4=; b=sw91Ky20odymSAMxG6KbhbwOf7
	cdOnM2ygzgv66pZPgeOTcRIWl7MilM4BH63zbH1Xjbg2YVYqTHxWYfdh10SSO9G8MorfvhOlVyZPg
	AkvUdZ2C7nffMceCwriZvWKN9c5vJJs+nzaahaHopSUg/nnq5YOGlq7gKdakUpVZEVQVfgz1oGanS
	FLK61DlObPJtAVeVu3P3XiadnJXzh84w3wxTRu4rxO26JzYyn3upBHTJg6TOGl0pXLLXTgf855L8m
	xFIZnsCI5RrDAdEnYhHhEX+bBVVZ3m0L4goC2ko7lbh5zutKPo5dDmewj2v16LIEaX7DSCMQoMRj9
	f4OzmvZA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kiFpo-0003a3-Bk; Thu, 26 Nov 2020 11:53:12 +0000
Received: from mail-pg1-x544.google.com ([2607:f8b0:4864:20::544])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kiFpj-0003YL-Dm; Thu, 26 Nov 2020 11:53:08 +0000
Received: by mail-pg1-x544.google.com with SMTP id 81so1588576pgf.0;
 Thu, 26 Nov 2020 03:53:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id;
 bh=NB+hgipCPxO33R/oYTaZ2+/pLeRXsls+8i2W5CCQlic=;
 b=rOn0dxA51INWEnuKSagvPNzYlpdrzneszl/wskmyYiHXKCmxBmwmtLkeF0QiS83U8+
 jZK8NA1Ai61bqtsL8jOa5T8FBzUhHeJk7jezzWuOdFEeWOxEp0E9+5C4f5xiVvNZvFWy
 IvqgZU1JPoI9Gp8D2Xlw/y9qGNzYAtT6582pTEpfitmXzzvzsyNOY0C+b1j7mB+PHtFW
 IFwP2xxsCmcESQGIYVO4X7brWGrDyddQYuB1sVDdQgWSfMHxjynER3ytoydGx5YimljD
 cy2q40LWCON4pNQK4m0E//kHylReXgGPnoMdGHs3mnwpdet2xRyJtBhjAiOmbAUp2urP
 fYtw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id;
 bh=NB+hgipCPxO33R/oYTaZ2+/pLeRXsls+8i2W5CCQlic=;
 b=lZljgfsUl3jLnSM6cAh2kq/q9vYDMlGbsFYKDCT51//N1yu6EXtxwGfIBVW3aX0cQ2
 DVbM/rTeM3+k0OssEPMD2d7TMi3L+IGVHVaWFDfAKs2MnPnrfv4KzRpu1l7a7gSg8SK/
 PWaC++NBXL6l5shs0RVkbyfwAwpeCKH9zqIOfLtmSBnazuYiC0TRhYgoxeOLcUD5w982
 APXVtpXmdh78urkOTW7J7G290x51h8F3EkVqIsEM00a7Pjfjq0ReMq9iH1RVaZUUfgaY
 mXVtehBzR1/JfKYgyKNfHbR4MfPC2bMygpdSqfWtrYbkGwDV7MnKKRG3pu8gOOC93R3R
 14Eg==
X-Gm-Message-State: AOAM532VOrWHp/jRqaxn0copO1i7H2O/zEo79cI2LQvocCxHFjN5Y4r/
 ov9juS+x5A/PxPcbyPOVPIo=
X-Google-Smtp-Source: ABdhPJwI4qEZTwkiIzlmjBp7u3mUWxJmwVlkf8Qv2IMVV4FtZaxOg35VzCo7nPoGVxyDmT05TH7fVw==
X-Received: by 2002:a63:2885:: with SMTP id o127mr2265597pgo.391.1606391583571; 
 Thu, 26 Nov 2020 03:53:03 -0800 (PST)
Received: from localhost.localdomain ([101.10.31.14])
 by smtp.gmail.com with ESMTPSA id r4sm4721617pgs.54.2020.11.26.03.52.59
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Thu, 26 Nov 2020 03:53:03 -0800 (PST)
From: Gene Chen <gene.chen.richtek@gmail.com>
To: jacek.anaszewski@gmail.com, pavel@ucw.cz, robh+dt@kernel.org,
 matthias.bgg@gmail.com
Subject: [PATCH v9 0/6] leds: mt6360: Add LED driver for MT6360
Date: Thu, 26 Nov 2020 19:37:28 +0800
Message-Id: <1606390654-6075-1-git-send-email-gene.chen.richtek@gmail.com>
X-Mailer: git-send-email 2.7.4
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201126_065307_567953_2E315AF9 
X-CRM114-Status: GOOD (  11.87  )
X-BeenThere: linux-mediatek@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-mediatek.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mediatek>, 
 <mailto:linux-mediatek-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mediatek/>
List-Post: <mailto:linux-mediatek@lists.infradead.org>
List-Help: <mailto:linux-mediatek-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mediatek>, 
 <mailto:linux-mediatek-request@lists.infradead.org?subject=subscribe>
Cc: gene_chen@richtek.com, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, cy_huang@richtek.com, benjamin.chao@mediatek.com,
 linux-mediatek@lists.infradead.org, dmurphy@ti.com, linux-leds@vger.kernel.org,
 Wilma.Wu@mediatek.com, linux-arm-kernel@lists.infradead.org,
 shufan_lee@richtek.com
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

This patch series add MT6360 LED support contains driver and binding document

Gene Chen (6)
 leds: flash: Add flash registration with undefined CONFIG_LEDS_CLASS_FLASH
 leds: flash: Fix multicolor registration no-ops by return 0
 dt-bindings: leds: Add LED_COLOR_ID_MOONLIGHT definitions
 dt-bindings: leds: common: Increase LED_COLOR_ID_* maximum size
 dt-bindings: leds: Add bindings for MT6360 LED
 leds: mt6360: Add LED driver for MT6360

 Documentation/devicetree/bindings/leds/common.yaml      |    2 
 Documentation/devicetree/bindings/leds/leds-mt6360.yaml |  164 +++
 drivers/leds/Kconfig                                    |   13 
 drivers/leds/Makefile                                   |    1 
 drivers/leds/leds-mt6360.c                              |  811 ++++++++++++++++
 include/dt-bindings/leds/common.h                       |    1 
 include/linux/led-class-flash.h                         |   42 
 include/linux/led-class-multicolor.h                    |   42 
 8 files changed, 1039 insertions(+), 37 deletions(-)

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


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
