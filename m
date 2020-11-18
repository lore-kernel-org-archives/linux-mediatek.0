Return-Path: <SRS0=HQvY=EY=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.7 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5532AC5519F
	for <linux-mediatek@archiver.kernel.org>; Wed, 18 Nov 2020 10:48:29 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D16D9206A5
	for <linux-mediatek@archiver.kernel.org>; Wed, 18 Nov 2020 10:48:28 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="mQs4TIG1";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="QS/0iyG2"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org D16D9206A5
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Message-Id:Date:Subject:To:From:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=LaMhd3HyPHy8yNT8kHTr34M0LubeJddS1TAEakNeHaI=; b=mQs4TIG1qPSnI+kN83Pu7RUz1e
	TtwP/n6YVy5Sf83SyAXj+X4j46D9qh2Pebg4EZg809MwRYR0eihqYWQ3+v5QHYPVl74kO1HuDzEgW
	LQ1JLgxAsroKgCKZe5i2WJLeyjcKPw165stUhSt9zAFiclIIVppPi4ymI4SBnfeH/ffRbB8OXbZ2G
	4O6nokX70INS9eCZzQXi0IgNb9D0m4qBdqLQh7fvGk2b5U6j/XD7aDvfFE9Hb+Zd8kAo5tFyjGmWI
	Ib3ZCKRyji7BtxtLJCjHQtsCRcrH5V7/4OoXvPUZufkYzWwX4pob7q4ig5wyYrFTjQvvePk7lvykV
	KDKUxKyQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kfL0g-0005Oj-J8; Wed, 18 Nov 2020 10:48:22 +0000
Received: from mail-pj1-x1041.google.com ([2607:f8b0:4864:20::1041])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kfL0c-0005Nm-1Z; Wed, 18 Nov 2020 10:48:19 +0000
Received: by mail-pj1-x1041.google.com with SMTP id h12so846616pjv.2;
 Wed, 18 Nov 2020 02:48:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id;
 bh=g2A3s17Ye8BDh9Fc+sUSVuSA9T79VLMzyJbnNNbmIfQ=;
 b=QS/0iyG2/W0EDHf7nKT/USCClf/WPG2j00cYYEruaImBh1uXdjpaGAPIZEdP/Xok7y
 mZVHjjf2URHw3dey111sWlSxj7ctKUjRbaZ0MuNET66soqQLm5x/HIvsWSrglJ7WEeaG
 57dmu+3mxV/euEClfekJ5BgvkscDmRD9ahyeKklmHAM8XlM4yr/lAjwwZ9tfjEYyc0aT
 ybpc5JM/uBW2sMwVVDQlTSDtLWtEgUN5TX6NkNG2aY0zcFEPByXOz7PYyxci3gpBvVCD
 qe3sS5/FXf2vOjlh8dEea6ipkfiUntjkpXz39KZW+vNCUFX6F2FAwoGIJ0PZ5L8xFHM2
 QGDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id;
 bh=g2A3s17Ye8BDh9Fc+sUSVuSA9T79VLMzyJbnNNbmIfQ=;
 b=TB5Esub+bIeVaMJbHZagyGwE6A+4k35uKNYGdWncWGkX4AJpUJ6+PpMKXvce2w20lZ
 Wa20puCKQvDI8Xw0Q9W+XptwMdSVkuHWc8bE6ncSyEMnY7fPEbKMCGUFz2QTN0v5kRI/
 hFo/Lx3xKsPeooN45LgGD4/UqGZQE52jvDzduVuVzz9D6cYzVbjY/3S9sv2ODfn5tGHZ
 juwejN9JSbpmxglh4eW7IWaHG5QUNtBuT8qgxgZ5YOAC9Aml6C0L7UgyY3Nqe9wxQZvy
 sLbrK9MWTqUwObGzFea318St8VH+U8lo3Nnkvxz2HkXR2PIoofzHojCpbre3U6hDt8I+
 f0yA==
X-Gm-Message-State: AOAM531Tq/xjPmQD6vaj2YGJdtKIvPVvfPb3Hx44GIJwJcqAQwSdSv3g
 Yd3KYjPQ+OTq2In4EBZslvQ=
X-Google-Smtp-Source: ABdhPJyzF/QItXUyTDu+k1QY3PlQWpE7hAtbHX+unKcUTHEGfuZ+KeWKN4LiKVykhuWHbDVW7F1iSQ==
X-Received: by 2002:a17:902:6ac1:b029:d6:c43e:a42d with SMTP id
 i1-20020a1709026ac1b02900d6c43ea42dmr3931895plt.21.1605696496004; 
 Wed, 18 Nov 2020 02:48:16 -0800 (PST)
Received: from localhost.localdomain ([2402:7500:575:2174:b7aa:599:e762:e486])
 by smtp.gmail.com with ESMTPSA id
 a3sm25345154pfd.58.2020.11.18.02.48.09
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Wed, 18 Nov 2020 02:48:15 -0800 (PST)
From: Gene Chen <gene.chen.richtek@gmail.com>
To: jacek.anaszewski@gmail.com, pavel@ucw.cz, robh+dt@kernel.org,
 matthias.bgg@gmail.com
Subject: [PATCH v7 0/5] leds: mt6360: Add LED driver for MT6360
Date: Wed, 18 Nov 2020 18:47:37 +0800
Message-Id: <1605696462-391-1-git-send-email-gene.chen.richtek@gmail.com>
X-Mailer: git-send-email 2.7.4
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201118_054818_264719_309B8BAD 
X-CRM114-Status: GOOD (  11.30  )
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

In-Reply-To: 

Gene Chen (5)
 leds: flash: Add flash registration with undefined CONFIG_LEDS_CLASS_FLASH
 dt-bindings: leds: Add LED_COLOR_ID_MOONLIGHT definitions
 dt-bindings: leds: common: Increase LED_COLOR_ID_* maximum size
 dt-bindings: leds: Add bindings for MT6360 LED
 leds: mt6360: Add LED driver for MT6360

 Documentation/devicetree/bindings/leds/common.yaml      |    2 
 Documentation/devicetree/bindings/leds/leds-mt6360.yaml |  164 +++
 drivers/leds/Kconfig                                    |   13 
 drivers/leds/Makefile                                   |    1 
 drivers/leds/leds-mt6360.c                              |  808 ++++++++++++++++
 include/dt-bindings/leds/common.h                       |    3 
 include/linux/led-class-flash.h                         |   36 
 7 files changed, 1025 insertions(+), 2 deletions(-)

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


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
