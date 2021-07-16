Return-Path: <SRS0=t3QX=MI=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.7 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 177E7C07E95
	for <linux-mediatek@archiver.kernel.org>; Fri, 16 Jul 2021 08:33:54 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id DA4A8613C3
	for <linux-mediatek@archiver.kernel.org>; Fri, 16 Jul 2021 08:33:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org DA4A8613C3
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=CeCr1TGtp4n8SoMfVgFDd+qTue92Kw/3rO5LVvniQ34=; b=pMYZM0II8G3s3z
	f+m+voFBVszTfeUOkefi4Sz9uhWwPCHAEIAyQQnrZXFrs/Cj187wWUm82IAOuZNCI2Uj5aCOe0m+j
	TtmXHS1Ex6Oqu29R3VLZo0dLZc3rN913Sb9GUap4zK0njGGyJGSjCnwrWGwdzyj2aFsKz8liBn5UB
	0ocrRRm2YE0Q0pGStZiThtm1goKqv3btrpJZxyx0oDx0fJ20dT+gtJ8KqzP+wt1XAHj9yU5G8K+tM
	MYZx05W7jKYAvu42CFFFgGa8/qdhHZubeojNO+y+RXO3RDCiGO3wj70tJEIviSBob3mEyLO9HqcgJ
	3Nfe+KXWxIsw2igSriNw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1m4JHw-003kUh-9U; Fri, 16 Jul 2021 08:33:40 +0000
Received: from mail-pg1-x52c.google.com ([2607:f8b0:4864:20::52c])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1m4JHj-003kRu-0N; Fri, 16 Jul 2021 08:33:28 +0000
Received: by mail-pg1-x52c.google.com with SMTP id y4so9239645pgl.10;
 Fri, 16 Jul 2021 01:33:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=X5q1j0paT44yX2vEBK2m7+VzMGiDCsPQaSzFTe7w0v4=;
 b=KBtVbG4c2pdIMp91T9YBKrsQnC0+fWoyMnxR4IeJjxuyZRcZowc/8FnhGw8JHx4TxD
 MXWk5+lmpiiGv6wzfi9tpK3Qm+a7O6lm1jfa0Ux8RXbs3FqH8cdM5J/N+7zXZp9vEsrz
 ahvUkXXtyWF1t3CJD96HkuAZCfCTPw51J6LHy+uh9kXp2VnoKgbnqVjypvdyHzZxMItT
 Fx/49T0EuUHD4cJkl0E4EX7DapilVrjs99omlaXfFon6jNb5kUK74fSMaffsQ+PXaAvX
 opSShv5cnAaJ4NAlL01bANMh/W3GkVgha8P8RVDb9I2XrWpYiDEx6tFag7dpywHrf/+x
 WPUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=X5q1j0paT44yX2vEBK2m7+VzMGiDCsPQaSzFTe7w0v4=;
 b=gSDnXdBJGlzogM1N/MR5hDWLRA5mCiI0aAfE1m70h2V0dQ5cL2tx5l40mvhnRWPn8v
 anN2P0qGxS7uYwyCdCsGB1QZs6OXEQgtNj01osGdK8kDygrhjFwu7IvFqotIIzp5CiEy
 kpRSvvICiin6ZOSK8fSklnL345RQy1JXxF4tW6RxmqUbp28CtM7f5TBYS/e8b15ZwbY7
 kbAnZz35KeG6qlACU/in4th8lZ//kSB+GicnhQ69PGWDqexX2d2oUNRavnd08Z25Zs7x
 nMBc8SynpqhPCXQEVSCCyATmWI7KEytbkWOPt63tgynZ0+kD467ZtUkodePGjBmeuXfS
 OlvQ==
X-Gm-Message-State: AOAM531FHvYKV88AGKGkdqnGLFHWYwux67xYuA5imDfb7UQmTJtsAq5G
 DNaDxjW3NYNa51vkIrxNpl4=
X-Google-Smtp-Source: ABdhPJzB/wadrrjrmtiy7fOXu0qmDMmFUnV/TyKXl2Axja+ylouz/y83MeReqhGaqX6Ep36cSpvI/w==
X-Received: by 2002:a63:f654:: with SMTP id u20mr8895757pgj.89.1626424406363; 
 Fri, 16 Jul 2021 01:33:26 -0700 (PDT)
Received: from localhost.localdomain ([123.110.251.138])
 by smtp.gmail.com with ESMTPSA id 21sm9425633pfp.211.2021.07.16.01.33.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 16 Jul 2021 01:33:25 -0700 (PDT)
From: Gene Chen <gene.chen.richtek@gmail.com>
To: jacek.anaszewski@gmail.com,
	pavel@ucw.cz,
	matthias.bgg@gmail.com
Cc: dmurphy@ti.com, linux-leds@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 linux-kernel@vger.kernel.org, gene_chen@richtek.com, Wilma.Wu@mediatek.com,
 shufan_lee@richtek.com, cy_huang@richtek.com, benjamin.chao@mediatek.com
Subject: [PATCH v15 0/2] leds: mt6360: Add LED driver for MT6360
Date: Fri, 16 Jul 2021 16:17:29 +0800
Message-Id: <20210716081731.80118-1-gene.chen.richtek@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210716_013327_089509_2E8BA66D 
X-CRM114-Status: GOOD (  11.15  )
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

changelogs between v14 & v15
 - Add ack in commit message


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
