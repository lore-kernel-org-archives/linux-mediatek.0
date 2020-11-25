Return-Path: <SRS0=wG/x=E7=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.7 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 00231C63777
	for <linux-mediatek@archiver.kernel.org>; Wed, 25 Nov 2020 10:51:40 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 6A812206E5
	for <linux-mediatek@archiver.kernel.org>; Wed, 25 Nov 2020 10:51:40 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="vDU9nNE2";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="OmbF/JUd"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 6A812206E5
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Message-Id:Date:Subject:To:From:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=4YQzN/yrUpyEBIuBvV3xcLgd/PcbWjLh4RJzR8NmhSE=; b=vDU9nNE2aNAVWDC6xgIYRsOKOz
	oKZbXGm/WUQR1onGGjWLeO/GNR5R3NMDsItMlYF2tlyoPkO9s33lx5qpsswLyoFxtEcRV2fNyLdCD
	x0YQgQB6WVPPy71GNNcRSti3GztMoKWr+Mc/G3pozdP9hnnt1EnsTr/62smmmC9Wrxc9YdTsy9pzr
	Dd2Jd2slYdG4xapVxSE14N0Co4ywQIJTc/ogiMHjEfeGKe0YkcEEl/+oh2XfhZnMk4atZl4mNMQlf
	tK/twj0v0w+F8yd+eg5i2UVI7rslefXgnhNAqx3aLFdQSJ9JnqnshMRc6n3ENWMBTwSe6NR94bwe7
	s4dFCw8A==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1khsOZ-0003j9-Qk; Wed, 25 Nov 2020 10:51:31 +0000
Received: from mail-pg1-x543.google.com ([2607:f8b0:4864:20::543])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1khsOV-0003hD-9z; Wed, 25 Nov 2020 10:51:28 +0000
Received: by mail-pg1-x543.google.com with SMTP id t21so2131817pgl.3;
 Wed, 25 Nov 2020 02:51:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id;
 bh=U/iwZD03hXqRuahzCXPW08p4leGFA6uirf6+jymbgcQ=;
 b=OmbF/JUdzm0+Ntw0wBAL+5B3szxFZbwVTg+ROKZoFzldL24Vhw0tfnFFcTe1Rc+BMN
 y0tqHB1m6nkYQ0SDjnwDiKm3ksLCWmFBJcoqP7lZYE1Tgj0OlYetc1fus0tXSYOfXxVv
 HPSTCF8iQq2vQZLaDoWIeFZUyK8Z/8Ee42Ae6t2WbUyX4BRAsppF8j/7Yv1Xh5h4lM0H
 U4r1MivMnmu1CYmciKJ5nULllnQhBp+3vgN0QUhBDWWj5nT7WcFZ1XcXooa4ZB6mSI2n
 cEKRqEq1fzHxfmXGGl0vPEeMs8zVLrJ5wiR5SerYllqZM03uMmTEas0x8M5IZofK38on
 v24A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id;
 bh=U/iwZD03hXqRuahzCXPW08p4leGFA6uirf6+jymbgcQ=;
 b=o3XPhMFZectFe9K9czgY2FuAO7U7ST8e36j+UTHXs5/1TL4T1FAIeHMC9FQ7cZeLvJ
 bMfBiVSMOSBKMycYPf6c6Tv+8psxfeV1MWR2rjbNUzsIaxMsnaHk8PbOSRXhe14Wa7ay
 nelKTuilkz5SJD/5EQ2/un8JwUKdRiI5ft6hixj0n3wiPWNX+pH7wFfwycTrsesgyM2j
 v8ryZWCfYycXQOp3A9YkQFaPT3awm6YqZmwi25YFc1p3/hbDlmqU2culFDl485/nVoMa
 UUziLFDAjZ7moUWy40EY7w4AYQ1bCgxggI7Ziketx045dimilSviItcL7RarPlo5h2wt
 m0tQ==
X-Gm-Message-State: AOAM531iAYjHF3nJeQCVshLaCEU7Q1O4j7fT+uOnTkI7vzmy0f7fTmGq
 frNkz2WXLFbBc5OQ2SDygpl0OO1kn3g=
X-Google-Smtp-Source: ABdhPJy98VvQwRIYC9G1ew0v3JZ8r1JC9RxnrL1Mr+34Go7K8DlC6YK5rutFExMnX7fHYy2FmUgk+g==
X-Received: by 2002:a63:d1b:: with SMTP id c27mr2625241pgl.25.1606301483890;
 Wed, 25 Nov 2020 02:51:23 -0800 (PST)
Received: from localhost.localdomain ([2402:7500:48b:4d7:7339:ae2d:114e:3859])
 by smtp.gmail.com with ESMTPSA id
 j10sm2049520pgc.85.2020.11.25.02.51.20
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Wed, 25 Nov 2020 02:51:23 -0800 (PST)
From: Gene Chen <gene.chen.richtek@gmail.com>
To: jacek.anaszewski@gmail.com, pavel@ucw.cz, robh+dt@kernel.org,
 matthias.bgg@gmail.com
Subject: [PATCH v8 0/6] leds: mt6360: Add LED driver for MT6360
Date: Wed, 25 Nov 2020 18:51:09 +0800
Message-Id: <1606301475-7030-1-git-send-email-gene.chen.richtek@gmail.com>
X-Mailer: git-send-email 2.7.4
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201125_055127_362911_7A3322D7 
X-CRM114-Status: GOOD (  11.75  )
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
 include/linux/led-class-flash.h                         |   36 
 include/linux/led-class-multicolor.h                    |    6 
 8 files changed, 1030 insertions(+), 4 deletions(-)

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


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
