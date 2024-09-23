Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DA27ACF9C5B
	for <linux-mediatek@archiver.kernel.org>; Mon, 23 Sep 2024 10:02:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=6rolbVD9IITwU8QeI5jrElmhIDPAa1liHNorfNCxAH8=; b=VkWFbR4kn7WLc3LiKXVBgBN6OI
	8m8UIGP0WGAZrWbnNzmL+nrOVCpgzlt5eluN+IYj9tgjWI5z8EUoF6MYBROEiqMQPtsww4r8tw6XX
	73EwizX0mVMjoWPh3sjEBGJROojqFdevuycJ1qBb2hX/0F8DShoj7GRmb0Xa6LSVb2zGEmjDmowE+
	FARGaIMkh+Cfw05NIJ+1uI/bo/hBYFI6ID3jNeBobgyWRGVCJ2765wtxu77Ln5yU+olL8nJgF5Qre
	iW2PvBR93SdR8Hou5+iDtWtE58vQZAW9zHQ3w77z5IytkjNn82zljb827ahtocqSnnztgrNMys3ct
	bBqNKzFw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1ssftq-0000000GuIF-3Pcf;
	Mon, 23 Sep 2024 10:02:34 +0000
Received: from bali.collaboradmins.com ([148.251.105.195])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1ssfrb-0000000Gttj-2xHA;
	Mon, 23 Sep 2024 10:00:17 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1727085614;
	bh=7ECwv49t0WFiAx3RhC+fh1v+7w6XzbPg4STX+u9qe/0=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=HAIVGcXgONpShgBWkyfL+ym8Jj4ookW2rEdYeDNvI+hsmFDEuKbmTVhk3gZsR6VwX
	 oH/dC78n3lvf/ujs52/q8fZtEW1QxndWkKDEipAyUqgf13JdfBUFyDDqsxTF8gOlcx
	 gSJj0a5oIGFTz9ATPhpVSyHaMU/HFAhxRecFGwwWFlP2bhrbBnifjHhXAK4RCwhAdo
	 ejvAEfKZ/iyj4mYOPmoUMaqFPMGznqPkNSQjWO02LrbqcZZNL3yrQ/vJis6rjbjEZK
	 978tgdjkz4D6e5d8FPNz0aF1TuCp6vMIpIDDdFSYsIS1bfChzpk4xDie1ODWRvWhkq
	 Cr1IpRs3Hmcrw==
Received: from IcarusMOD.eternityproject.eu (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 55AB217E10AE;
	Mon, 23 Sep 2024 12:00:13 +0200 (CEST)
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
To: lee@kernel.org
Cc: robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	matthias.bgg@gmail.com,
	angelogioacchino.delregno@collabora.com,
	eddie.huang@mediatek.com,
	sean.wang@mediatek.com,
	alexandre.belloni@bootlin.com,
	sen.chu@mediatek.com,
	macpaul.lin@mediatek.com,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	linux-rtc@vger.kernel.org,
	kernel@collabora.com
Subject: [PATCH v1 1/3] dt-bindings: mfd: mediatek: mt6397: Add start-year property to RTC
Date: Mon, 23 Sep 2024 12:00:08 +0200
Message-ID: <20240923100010.97470-2-angelogioacchino.delregno@collabora.com>
X-Mailer: git-send-email 2.46.0
In-Reply-To: <20240923100010.97470-1-angelogioacchino.delregno@collabora.com>
References: <20240923100010.97470-1-angelogioacchino.delregno@collabora.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240923_030016_158930_15E0BB56 
X-CRM114-Status: UNSURE (   8.08  )
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

Enable evaluating the start-year property to allow shifting the
RTC's HW range.

Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
---
 Documentation/devicetree/bindings/mfd/mediatek,mt6397.yaml | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/mfd/mediatek,mt6397.yaml b/Documentation/devicetree/bindings/mfd/mediatek,mt6397.yaml
index 953358bc997a..a83cc35f51f1 100644
--- a/Documentation/devicetree/bindings/mfd/mediatek,mt6397.yaml
+++ b/Documentation/devicetree/bindings/mfd/mediatek,mt6397.yaml
@@ -71,6 +71,8 @@ properties:
                   - mediatek,mt6366-rtc
               - const: mediatek,mt6358-rtc
 
+      start-year: true
+
     required:
       - compatible
 
-- 
2.46.0


