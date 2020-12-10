Return-Path: <SRS0=Sq/6=FO=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.7 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 288B3C433FE
	for <linux-mediatek@archiver.kernel.org>; Thu, 10 Dec 2020 06:01:58 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D236F235F7
	for <linux-mediatek@archiver.kernel.org>; Thu, 10 Dec 2020 06:01:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org D236F235F7
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Message-Id:Date:Subject:To:From:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=knmBjKMv56x/jOhEqU7OoTptgFkVn845jO/Z15U4pe8=; b=eXg8BflKZRMaujjXhuMPEjWSxj
	PMjNynZkRbzhckLu09qbtb7lfrzvv/ZAl3H9TR7UtKztlOP+ykFX9aPARhriL4jEQBsq3nDdwPquO
	xEB1sEZ0BRwLvasW1O4mtmpCHd+y6bXQ91jucvPCkhK6qaTgp8gtmXo57vMKhKJBOLsdn+1BVUD+Z
	pdDG4gWkqHyH47Teyaj+/NZTf0a7NlJ25aEr5VNBW3ncwqBQ8L8Ur8PUIdcID496SA/sLqMvq5ybn
	SuVPTcsmTlLGpF/NN60Zv4Zy7v6bqqGbU3XXwdDU/2kgtDcdV0Fwe8ojHvroz8Cv0DqqHeKjMvnAE
	cWeG6+Ng==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1knF1O-0007C3-5R; Thu, 10 Dec 2020 06:01:46 +0000
Received: from mail-pf1-x442.google.com ([2607:f8b0:4864:20::442])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1knF1K-0007BQ-Ke; Thu, 10 Dec 2020 06:01:43 +0000
Received: by mail-pf1-x442.google.com with SMTP id b26so3036936pfi.3;
 Wed, 09 Dec 2020 22:01:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id;
 bh=AzWxFLY7pNZaeT3/xb0mQOVSBc85yc1XVJMoO/4h93Y=;
 b=btBGJnNwXko0u3o32l76Eel7YEXjoyDFa8RM0+X3IeXp+pNa3Ch6hQzyeJzN9TT/Yf
 A+gOWSRu2PF8aDRFLAHSVd4uYi+imtTAwiu2DlrEW7kgLVCF+vhTqLxMoyMpGqRk6XHI
 aj3ykPytUxyEKFHtUIWMdLAIkj6ZfTk3lOX4ABHgzszT122safOjd/iiMaZ/gXR3y32c
 1nfVJL1/Fwp3cAQf1LvzPu0c+gfhFDU2TDRDxlZXKNIdMPuJzK6rF0Ppkv3WEoYYMPwS
 E2Rv9aWRdSr35nbqESK5bW4iSLs/P+BOJPYaUtvbPe6+pL4jkyUIXILPYfc1zdcI/fey
 9k4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id;
 bh=AzWxFLY7pNZaeT3/xb0mQOVSBc85yc1XVJMoO/4h93Y=;
 b=au7ugjJ5sfVINNdlL0MpdNM5keyNncVPtd4Mm5v0ubw7Vf7WCkywAcuD6mm6pjPQ9U
 R10Rk1XU83TuqQDfOW72DruZ6iE6Xj9Wen2EcstKzPzFl4M5Pxc3c0zaD8/D+5zlsK3B
 jcWeIn755zXBbfLMHIpg1+XGyT3s4Q1WMerOmM01fyErzy9HKb9zoOeiL84ty9hPNRaq
 P8X4eL/RHybRgtiQTy1q04rOiWrXsTC9bk2/o5mEmlG2RhxoTY0I3OoZm1suzonvcCNr
 mIMAQ5aa5c/RkwNbC8Wwotsa298ezP1GHyrm9iDh1tKSVWtd26aIA/fbA4IydSIaD9nO
 gSpQ==
X-Gm-Message-State: AOAM5334PXqvt69e/Kz4fFHPTPvYBiA4+TSxGoa/5L+u/PaBLgr6OSVM
 u6cm6XsbFo+pXJAvdhRYU4s=
X-Google-Smtp-Source: ABdhPJzsiSmV/F5GXNMJ0EE1mhNhLiUyLcgxJWbJljMbl4eSmJ2tg6JTjzwr+yzn4pnjrykJQYAL7w==
X-Received: by 2002:a17:90b:a04:: with SMTP id gg4mr5911162pjb.8.1607580099216; 
 Wed, 09 Dec 2020 22:01:39 -0800 (PST)
Received: from localhost.localdomain ([2402:7500:568:b3ad:229b:9ee7:b946:7876])
 by smtp.gmail.com with ESMTPSA id j19sm4355377pff.74.2020.12.09.22.01.33
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Wed, 09 Dec 2020 22:01:37 -0800 (PST)
From: Gene Chen <gene.chen.richtek@gmail.com>
To: jacek.anaszewski@gmail.com, pavel@ucw.cz, robh+dt@kernel.org,
 matthias.bgg@gmail.com
Subject: [PATCH v12 0/5] leds: mt6360: Add LED driver for MT6360
Date: Thu, 10 Dec 2020 14:00:52 +0800
Message-Id: <1607580057-4408-1-git-send-email-gene.chen.richtek@gmail.com>
X-Mailer: git-send-email 2.7.4
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201210_010142_700280_161B6A3F 
X-CRM114-Status: GOOD (  11.69  )
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

Gene Chen (5)
 leds: flash: Add flash registration with undefined CONFIG_LEDS_CLASS_FLASH
 leds: flash: Fix multicolor no-ops registration by return 0
 dt-bindings: leds: Add LED_COLOR_ID_MOONLIGHT definitions
 dt-bindings: leds: Add bindings for MT6360 LED
 leds: mt6360: Add LED driver for MT6360

 Documentation/devicetree/bindings/leds/leds-mt6360.yaml |  159 +++
 drivers/leds/Kconfig                                    |   13 
 drivers/leds/Makefile                                   |    1 
 drivers/leds/leds-mt6360.c                              |  827 ++++++++++++++++
 include/dt-bindings/leds/common.h                       |    1 
 include/linux/led-class-flash.h                         |   42 
 include/linux/led-class-multicolor.h                    |   42 
 7 files changed, 1049 insertions(+), 36 deletions(-)

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
 - Fix print size_t by %lu
 - Fix dt-binding name regular experssion


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
