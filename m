Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CAB25C433F5
	for <linux-mediatek@archiver.kernel.org>; Sun, 27 Mar 2022 20:03:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=5ezYfXlnnyFMukMWaZt47oc8v4Q+VaglSSaxHuJOjZ8=; b=rv64Wqlmj0/kOI
	TXMw5tqSXUd5/Kj4skMRML9Y4w5RJ+vcZ09piVYHTrQeSUZ7etJPf/lQdMWkS/WARGCfrH0MWvqgB
	iDGs7WLsCL1SyL2WrnZodqBICgVm2U0rpRc1M0F8Iw17iO2pi5EolFzb6mZAbhaWa89wuKkL24S00
	CW6kjna8Wj/BlqOJcPFAlXZ14h04RJhOcWQSOiXSt5EeLn0Ad60BmcWddLwBhKgBZCRKw5Oq7FKWw
	NpfOj83Cg0xEb5xmhVJFYC/mg4K9sqrDNlpWGn+mP5XyfoiGGh9mhLN5lySB1BVjYeyamlvVduH9q
	XEyxwgDqkNEKaOqsFPMA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nYZ77-006A3V-BH; Sun, 27 Mar 2022 20:03:49 +0000
Received: from mail-wm1-x32f.google.com ([2a00:1450:4864:20::32f])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nYZ73-006A2T-Mh
 for linux-mediatek@lists.infradead.org; Sun, 27 Mar 2022 20:03:47 +0000
Received: by mail-wm1-x32f.google.com with SMTP id r64so7248977wmr.4
 for <linux-mediatek@lists.infradead.org>; Sun, 27 Mar 2022 13:03:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20210112.gappssmtp.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=NzNcyGwm8LHGTeytkKUAAUCjc3GAPtXFAzyhohDYik4=;
 b=E05dJ/Ca1aU22j953Vb6g3K0jrq9lercGWVIdhA5Gn4hgjqAgSQv3d8JLq0WB1CBDk
 pmedoH4h11AMDox/HSzcssd5K0FCLjiFKRKidgVyxZIVIb6776nS7xtFj5CzRWDbRjLZ
 PH1PY4qZtcGWoCGXHj4T7ZDta0NmzICAg9a391+1qFFPNR8sKs4kp6txRGmxQJ0vCo41
 2Sk2pxZ2G9nWLJfaYj7gq4/jpIPcrVeHvXb2sfl75Y4M1sVYir1k19R/oU/Ajbkra+Yx
 Adx/OXkzjGN8ziOjZ3guLIDTkW47zxyyNQpXktioiNzCrtnVpIPQmoB/ZcKfu5KREHFj
 wk0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=NzNcyGwm8LHGTeytkKUAAUCjc3GAPtXFAzyhohDYik4=;
 b=vf2uJWJ5PCj9y+WZIKEfquZZNAxWGkxCN260uJiSKh6iwZfE5ugnMrLec/eftc2Va+
 J3uLXEVlwfs4tkHj0v6Gt/1U7eJ7bQnuJhC1AMUXlx4LTIjP1tzWcP+RNdcDO4fE715r
 Tdjix3LoNJU7eS0gteeWTASF/cMAIByuLlaWZCLUeeeUsDyUqjzufdQQJXI1v2foNqR7
 REIN/35kgeaZvUj5z7Zk2yFEOI5x43PjULyl/F3h0i/7hOTgMej5i2s0YVAsO0PH9iHc
 vXdcA3xzYol4EA6ONjc5YGD3C7DYFWrDnBXXUMHV3a/YF3CnykZehaNHMUwTJd+Ky2Rk
 taAQ==
X-Gm-Message-State: AOAM532zWibeMDiklCywJ+q19g0npzDHSTYT6arOlFVIlpG6AcyVjqfT
 0orF+87A4sZI0do4Wlih138iNg==
X-Google-Smtp-Source: ABdhPJx3fu7yAvD6RQEKRHJ2F7h8dkHOU7ejGoCi+sFtjOXG5nqTM2oS4cwC1VbylzjSrr3GLNKvxw==
X-Received: by 2002:a05:600c:3847:b0:38c:a460:7679 with SMTP id
 s7-20020a05600c384700b0038ca4607679mr31341776wmr.23.1648411422549; 
 Sun, 27 Mar 2022 13:03:42 -0700 (PDT)
Received: from localhost.localdomain ([88.160.162.107])
 by smtp.gmail.com with ESMTPSA id
 f14-20020a05600c154e00b0038d06cc21b2sm1354555wmg.35.2022.03.27.13.03.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 27 Mar 2022 13:03:41 -0700 (PDT)
From: Fabien Parent <fparent@baylibre.com>
To: Matthias Brugger <matthias.bgg@gmail.com>
Cc: Fabien Parent <fparent@baylibre.com>, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org
Subject: [PATCH v2 0/4] Add support for MediaTek MT8195 demo board
Date: Sun, 27 Mar 2022 22:03:08 +0200
Message-Id: <20220327200312.3090515-1-fparent@baylibre.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220327_130345_772349_524B985B 
X-CRM114-Status: GOOD (  11.26  )
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

This patch serie adds basic support for the MediaTek MT8195
demo board. For now the support is pretty basic and allow
just to boot, use USB, and the SD card.

When more IO support will be added for MT8195, new changes
will be pushed to the device-tree of the MT8195 demo board
to support these IOs as well.

This serie depends on the following patches:
[0] https://patchwork.kernel.org/project/linux-mediatek/patch/1622011927-359-9-git-send-email-hsin-hsiung.wang@mediatek.com/
[1] https://patchwork.kernel.org/project/linux-mediatek/patch/20220216113131.13145-4-tinghan.shen@mediatek.com/

Fabien Parent (4):
  dt-bindings: arm64: dts: mediatek: Add mt8195-demo board
  arm64: dts: mediatek: Add device-tree for MT8195 Demo board
  arm64: defconfig: enable MT6359 regulator driver
  arm64: defconfig: enable some mt6360 PMIC drivers

 .../devicetree/bindings/arm/mediatek.yaml     |   1 +
 arch/arm64/boot/dts/mediatek/Makefile         |   1 +
 arch/arm64/boot/dts/mediatek/mt8195-demo.dts  | 447 ++++++++++++++++++
 arch/arm64/configs/defconfig                  |   4 +
 4 files changed, 453 insertions(+)
 create mode 100644 arch/arm64/boot/dts/mediatek/mt8195-demo.dts

-- 
2.35.1


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
