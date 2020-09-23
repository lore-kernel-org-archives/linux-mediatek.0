Return-Path: <SRS0=fRkw=C7=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.3 required=3.0 tests=BAYES_00,DATE_IN_FUTURE_12_24,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CD6EDC2D0E2
	for <linux-mediatek@archiver.kernel.org>; Tue, 22 Sep 2020 12:51:41 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 658D02395C
	for <linux-mediatek@archiver.kernel.org>; Tue, 22 Sep 2020 12:51:41 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="BT9ULhxt";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="E8ABS3R7"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 658D02395C
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Message-Id:Date:Subject:To:From:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=Pq6dhwFJ4blCjQqYi1a3P+7JVm5x3OULWfDBtjUw1L8=; b=BT9ULhxtLfhM/KPUHENM7XgPlP
	w/us+Q1r7zfQuK+/pV0lQGPEVAXaIZ2XbU3wlT87CH0VLaHdlFqEURJjR4xKC2seNdxo2MHXEny0z
	6JpN5wWhtGfvp5+429d4HoTaFXuhEVbW3v4ggcKfU+ycF2xUecRdYrx1vpptNgyp/78pVBqwV1rSa
	heXoIcNNQ3wMF9N7nn7yV5mamwWFDEEOXt6EfUewvSSy0Nn/rEv4WekEzV3EeDOWFXyKYVepBX5HP
	Lr/n36BSklUdBIIIkgjb7FPAmZw06OPthmYLMxdo/BJdlkA5ruToAbIUNP8yw6KoHU3EZHOm63Yzl
	VTiMgm+Q==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kKhla-0000Yi-6B; Tue, 22 Sep 2020 12:51:30 +0000
Received: from mail-pf1-x443.google.com ([2607:f8b0:4864:20::443])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kKhlS-0000U4-An; Tue, 22 Sep 2020 12:51:23 +0000
Received: by mail-pf1-x443.google.com with SMTP id b124so12324137pfg.13;
 Tue, 22 Sep 2020 05:51:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id;
 bh=Uq4gszUN314/xrax/zivCjL8TtnAIPQarXrbHoUDZEw=;
 b=E8ABS3R7AQYqZW4xbmmlHZMrrHqhduMblu/D5suTnRNJuIlLN8UYQooUjD56MqtAwq
 w98dg3iOS+/k/EdOQK6N5eHRJB+DiWSBsdq3RWT3NF7f3m5HCpandqi2sXd3RqtUMPUa
 XnnUDQfsHPtlesfzMgkQfzHv84kAMlVN0fyuvX54Qb8EgCsktYzG4bLloKwgcZFOHHTa
 hmWsvh5TcbdwKOBrQJzDkuKXbBMhBd7b32o6yNCZWOVWjleNIeXYuPLgdpittmLE+weX
 M2O35yFEGQzp2UkvU2z6DKaIPBYxzK1H4QxBjBpVpdBQFLNXbhH8Negc+WI5ThoMwyaW
 Tl/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id;
 bh=Uq4gszUN314/xrax/zivCjL8TtnAIPQarXrbHoUDZEw=;
 b=eGOzVIrK5xvkoLOavRnKgoh01SVe2DaL/fU6uTnFio0TcijzVme8UKwUlP5ZXW+uIX
 jZUM+tgZtnn5h89hSRJXL1/sSskzjoYiImAtUXSvKl/SAJJ68h2yqPwZRLSkdhqMmnqI
 cOrk2hHsJASO8a8ywQcwMd9iQcbGfzDADOu7fj5vi1sT+0zPWNCQ0KdcDMrB4u+/kLsV
 qqmCrOkoU5cll5cER4wu3LiCZgNmZ28igGMwCerZ+iUVXeFas1N5cgbkrHP0iDPD/fac
 +EKHLkxoMxpWPyUjLwFhDPxz2J14tQJB7sVQGCfKTBKrna4hu/84OpGQ2/iSsh0rzXA6
 kRCA==
X-Gm-Message-State: AOAM530D8CCTcmGUsMfLYIkgIkdrizfGyfjVCBDpp8e5zlb/ClqJAxbt
 5SG1rBaXetSmT+DgV0NN0Ro=
X-Google-Smtp-Source: ABdhPJygZmnt7VKPOrJ+r7AEP2gHgW/QMzfNez2co3rHo1QeDJ1D4H6QbHERLnnMttxv3IJ+DhkwxA==
X-Received: by 2002:a62:3401:0:b029:150:e9ad:569 with SMTP id
 b1-20020a6234010000b0290150e9ad0569mr2670613pfa.75.1600779078923; 
 Tue, 22 Sep 2020 05:51:18 -0700 (PDT)
Received: from localhost.localdomain ([2402:7500:489:56d9:501b:f524:c013:2733])
 by smtp.gmail.com with ESMTPSA id b18sm14995695pfr.4.2020.09.22.05.51.13
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Tue, 22 Sep 2020 05:51:18 -0700 (PDT)
From: Gene Chen <gene.chen.richtek@gmail.com>
To: jacek.anaszewski@gmail.com, pavel@ucw.cz, robh+dt@kernel.org,
 matthias.bgg@gmail.com
Subject: [PATCH v4 0/2] leds: mt6360: Add LED driver for MT6360
Date: Wed, 23 Sep 2020 20:50:50 +0800
Message-Id: <1600865452-19649-1-git-send-email-gene.chen.richtek@gmail.com>
X-Mailer: git-send-email 2.7.4
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200922_085122_434040_89C20DB0 
X-CRM114-Status: UNSURE (   9.78  )
X-CRM114-Notice: Please train this message.
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

Gene Chen (2)
 dt-bindings: leds: Add bindings for MT6360 LED
 leds: mt6360: Add LED driver for MT6360

 Documentation/devicetree/bindings/leds/leds-mt6360.yaml |  107 ++
 drivers/leds/Kconfig                                    |   11 
 drivers/leds/Makefile                                   |    1 
 drivers/leds/leds-mt6360.c                              |  705 ++++++++++++++++
 4 files changed, 824 insertions(+)

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


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
