Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 98720CA9ECF
	for <linux-mediatek@archiver.kernel.org>; Sun, 11 Oct 2026 08:21:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=Dr49tUUlFxPFnEicxFg6BKjDZLTyIOa8zv4bTCe4eu4=; b=DN1sfBs4w6RzduswLI6XrxHgrr
	jlP8tgeHwXacdBsgvRE9SKHp+hdQV0pi7cKhGcVUenLMuzFIy0u2I1H/aM4X/VBDZljsWtYGzjjlZ
	zTz9ip/49cGyBHV3qG+5aEfgA8OSWbDsRNKJUbNbuU8h5qFUW50Xrwi3fknd5mKFXJtA1yOVSXAEY
	R4GJsj5HmB5r8LRUUxdEeV7NH2rfguoYnYA1z2qIfAd2vc8u4tYoaNJ7RAoKDH7u7dqcNj1rEPRd4
	bG+lqwQa82PvUTzevhFk7JLnyoW0IAeP/BPvPXOzBj2GBXSyPprItuaTNU93qz7WP5rPh807xl9qa
	nrDLiE/w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xFonp-00000008qfA-0xDy;
	Sun, 11 Oct 2026 08:21:05 +0000
Received: from mail-wm1-x330.google.com ([2a00:1450:4864:20::330])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xFonk-00000008qcn-0O1q
	for linux-mediatek@lists.infradead.org;
	Sun, 11 Oct 2026 08:21:03 +0000
Received: by mail-wm1-x330.google.com with SMTP id 5b1f17b1804b1-49ff680331aso7421885e9.3
        for <linux-mediatek@lists.infradead.org>; Sun, 11 Oct 2026 01:20:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791706858; x=1792311658; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=Dr49tUUlFxPFnEicxFg6BKjDZLTyIOa8zv4bTCe4eu4=;
        b=SPL9BDbchk8RDvYE0ljtx9f0IO7Qrtk+GEZtWj1sb7SIBNobglQ9zqd/1+5vF/InkX
         rFb4dYLXL+PMxk7QYiHXNsRDZgseNlmpOZbZ8yXmyU88iEjSgouDQIvC4czYMN5OR9g5
         RBrpHW3jNSn0Pyrp249WS+Umph62G9LH0CtQLJ03H12tzYkt+7Y/+1E9AuLBcWjNgT21
         k3mF0fe5DSzsPTJw72ZrWXj97tcTrjUI3hxk4/XeLpLnFqTvNzNk4MmWVgYcdIQDpJgw
         MunvsqIICqGfT3SUavNRc7O4r8t0vOjrn9nyiHHOdYm1GCDZiJ8FyYGKMGddqD/LxH8j
         j7Tg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791706858; x=1792311658;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Dr49tUUlFxPFnEicxFg6BKjDZLTyIOa8zv4bTCe4eu4=;
        b=Pq9jt0c4f57aTq+Vid6xVNIMyrZQrqGOJrMZ0hS51Qmw0l6tgahl0qvFAWo9dp+RTY
         3fuHDcLxCIkAZBwUu9wK9KiA5GDFGsjcty4HYwxgYAYcoXk4lBd/VbIVeqd2YqJ9tOV6
         0u8V9qn6ijLJYuJke/0X0Y6JX+8oSW1HNKonbubWJ3WxWDJAnfdZLPrfZ7UFWgEBG/+Z
         cONv7OnUSB0vG9ujPycvC498qLhMWD/HK1O8bfWmRCBK3EPS23xtrLImx7wGqeOxILb5
         6qXcmCj6zltoAVNZUHF9qj6MUqN0pMyvtTZguZJUuGoA0/OFsqvyP6xEnXxEwUoDRoFV
         n6KA==
X-Gm-Message-State: AFq9FYLkIlguXeuJ81GQTYxv5FyS/DaGmKuUDy1TF6ulWLKqUgAx5/nU
	LvsclcnwJSy2ZHtQ0CNS43t6hpnit/joctfo20OlUG5t0TAVFAh8zzYlUzzphmowQ0s=
X-Gm-Gg: AYBFou0kUr6ZtOfXdbgMcHXrOoADNKFWbEVZ7XUHOPoMgjV5+ZxKUpka9aeVg3Xk8JV
	CGTBjA0fjQx8Y8y5LvbMEgV1vS16eCyXXmc/NKlKBWQqhKuEPw9kERULzTRp40hwlnvl7JPMJAb
	6SpDKOLRKA91MTKbYbPzBLB08Vjd+0CEMNk2+m1U0f+EuTfA82X3c0D5e0/bEUviDj1bjFN+6ot
	fKFFS472qCIB8uP/l0F6XsB4xs+XNomUIYqnySjYOEN3TFKYzGIHiueIPx/6y7HeG1qsBE5IeU/
	bvIvn+T5AoXCcjCYxCY9xjtqZS03D6iLt8FVRkimyDUxr1gMXfmmA3XWVNNq09cRaucR0Mdv8N6
	av6gsqpC2Wqto+6fT7yG2mDlvVJkkAgXuGK3WPuor0kQruXFuCVY3amOEMUjf7PWpT+zzejAwO9
	7KUi0DGP6o5Dyui8Y7Y5DJvAAajKko1Yf/NAiRVfPrEWtF0gCnvolGKqK4Mm/oC7D5Rw8=
X-Received: by 2002:a05:600c:4708:b0:49d:15b9:2a2a with SMTP id 5b1f17b1804b1-4a18e47a8a5mr126204925e9.10.1791706857720;
        Sun, 11 Oct 2026 01:20:57 -0700 (PDT)
Received: from luca-vm.lan ([154.61.61.58])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a195002123sm152063175e9.1.2026.10.11.01.20.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 11 Oct 2026 01:20:57 -0700 (PDT)
From: Luca Leonardo Scorcia <l.scorcia@gmail.com>
To: linux-mediatek@lists.infradead.org
Cc: Luca Leonardo Scorcia <l.scorcia@gmail.com>,
	Chun-Kuang Hu <chunkuang.hu@kernel.org>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Chunfeng Yun <chunfeng.yun@mediatek.com>,
	Vinod Koul <vkoul@kernel.org>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Manivannan Sadhasivam <mani@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	dri-devel@lists.freedesktop.org,
	linux-arm-kernel@lists.infradead.org,
	linux-phy@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [RFC PATCH 0/1] phy: mediatek: phy-mtk-hdmi: Use regmap to manipulate hdmi registers
Date: Sun, 11 Oct 2026 10:20:30 +0200
Message-ID: <20261011082042.348422-1-l.scorcia@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261011_012100_899915_CE0FCA89 
X-CRM114-Status: GOOD (  15.24  )
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

While working on MediaTek mt8167 HDMI support I noticed that on some SoCs
like mt8167 and mt8173 the registers used by HDMI PHY are actually inside
the memory space mapped by the apmixedsys driver. On mt8173 this driver
maps its memory using of_iomap, while on mt8167 it currently uses
devm_platform_ioremap_resource. The current phy_hdmi_mtk uses
devm_platform_ioremap_resource too, which causes a conflict between the
two at probe:

hdmi-phy: error -EBUSY: can't request region for resource
[mem 0x10018300-0x1001831f]

In patch [1] I initially proposed to use the same approach of mt8173
in mt8167 too. While working Sashiko correctly pointed out that it never
unmaps its memory during remove [2], even on mt8173. It is of course
possible to add code for that, but it would mean creating a dedicated
drvdata structure, and it seems a little invasive. Using the devm_*
functions is certainly cleaner.

This patch goes in the opposite direction - it converts all register
access for mtk hdmi phy to the regmap_* functions and obtains the regmap
using device_node_to_regmap, which internally uses iomap and does not
trigger the conflict. This way memory can still be managed by the
apmixedsys driver using the devm_* and the HDMI phy only gets a regmap.

This patch has been tested on mt8167 only. Unfortunately I have no devices
with the other SoCs that are touched by this refactoring, so I am sending
it as a RFC to gather feedback from more experienced kernel devs.

[1] https://lore.kernel.org/linux-mediatek/20261010115539.9237-4-l.scorcia@gmail.com/T/#u
[2] https://sashiko.dev/#/patchset/20261010115539.9237-1-l.scorcia%40gmail.com

Luca Leonardo Scorcia (1):
  phy: mediatek: phy-mtk-hdmi: Use regmap to manipulate hdmi registers

 drivers/phy/mediatek/phy-mtk-hdmi-mt2701.c | 145 ++++++++--------
 drivers/phy/mediatek/phy-mtk-hdmi-mt8173.c | 133 +++++++--------
 drivers/phy/mediatek/phy-mtk-hdmi-mt8195.c | 185 ++++++++++-----------
 drivers/phy/mediatek/phy-mtk-hdmi.c        |   2 +-
 drivers/phy/mediatek/phy-mtk-hdmi.h        |   3 +-
 5 files changed, 235 insertions(+), 233 deletions(-)

-- 
2.43.0


