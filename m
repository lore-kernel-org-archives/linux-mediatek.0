Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9F4A4C2D0CD
	for <linux-mediatek@archiver.kernel.org>; Thu, 15 May 2025 13:36:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=GPQvSDNsGP21UtCMjtLguObeYIbupU++Wvm4cQkw6lQ=; b=ScACE2IZU7nJU8
	rW1NeIQM87SaOzWiyFN0CJLoAG2TEt6YQo7Ek3Q6TOZaOMpTIrYu8VKgTB8tHZZz+NpGI/HobQZfw
	+6IonsDZHWAsjTM0OyRC9wRbv3z+8x1DLtBCNodM98vWelJJmNVYrwESNJS6ml82aXihUfpY0tsGS
	SXwNUkE2uZVIzkJZHHir5cLIxKYc9JvNnOnvcHL523Jb1Kms0G7DwhqdxK3MtMC7Bfj889nSRYB40
	Fw38ABGxN9d/MqL94v7oG+Tcev15t1PQS0SEYMzySa/bfXIR5hhOv1kq9ecjdWddzb4ewT01wph02
	pYLZY8fnadraXupyo8uQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uFYlT-00000000kvx-1vWp;
	Thu, 15 May 2025 13:36:47 +0000
Received: from bali.collaboradmins.com ([148.251.105.195])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uFYge-00000000ju6-2zSL;
	Thu, 15 May 2025 13:31:50 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1747315906;
	bh=+qZaWRvZ9Dgx+EpqRZQgSt4qBnNCWnJbJUmOtKwdjgE=;
	h=From:Subject:Date:To:Cc:From;
	b=UUpIT/pFbKME4d3DBPwv84lQlVe92KlvTuedp+1qewWET30JdynRQQ8oehrCBQOZH
	 LpEPzxP1uMK7Q8aGd4yQTzsJmrXkyM39iT9EPn78NVcpJBwM1/O0nO5uX59pFl5+44
	 us/b6QjAOPK3rRTd+upxGroPb9TWqEmX2uktlApbUxw8ykdjpzuz+jDcK0YVJuFaye
	 sfYZOtc8jrDfxims7Q/2TT/ESVwRNZUgmjn7+4sTpMzELv+j10AXzv1ofd0030S/T5
	 S+/zrf0h6HXo3XFDMbC2tTeoTnVjcRXcbZpAsNnni6vRBZmE9PvG/YXu/0VciQsy+h
	 iAYHGqkVeIMMg==
Received: from apertis-1.home (2a01cb0892f2D600c8F85cf092D4Af51.ipv6.abo.wanadoo.fr [IPv6:2a01:cb08:92f2:d600:c8f8:5cf0:92d4:af51])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: jmassot)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id AEB6417E02BE;
	Thu, 15 May 2025 15:31:45 +0200 (CEST)
From: Julien Massot <julien.massot@collabora.com>
Subject: [PATCH 0/3] mt8188: Fix missing reset and clock-names DT
 properties
Date: Thu, 15 May 2025 15:31:42 +0200
Message-Id: <20250515-dtb-check-mt8188-v1-0-cda383cbeb4f@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAL7sJWgC/x3MQQqAIBBA0avErBvQYsC6SrQonXKILDQiCO+et
 HyL/19IHIUT9NULkW9JcoQCXVdg/RRWRnHF0KiGFGlCd81oPdsN98toY5CmhZQjR7ZroWRn5EW
 efzmMOX+RhBF7YgAAAA==
X-Change-ID: 20250515-dtb-check-mt8188-5af50d5d5c93
To: kernel@collabora.com, Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Garmin Chang <garmin.chang@mediatek.com>, 
 Friday Yang <friday.yang@mediatek.com>
Cc: Conor Dooley <conor.dooley@microchip.com>, linux-clk@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
 Julien Massot <julien.massot@collabora.com>
X-Mailer: b4 0.14.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250515_063148_899686_F53F63AD 
X-CRM114-Status: GOOD (  10.56  )
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

Hi all,

This patch series addresses some issues found in the MediaTek MT8188 device tree
and its corresponding bindings:

The #reset-cells property was missing in the MT8188 clock controller binding and
device tree nodes. This causes DT validation errors.

The clock-names property was missing from the Global Command Engine (GCE) mailbox node,
which also triggers a dtb-check failure.

Patch 1 updates the binding to declare #reset-cells as a valid property.
Patch 2 adds #reset-cells to all affected nodes in mt8188.dtsi.
Patch 3 fixes the missing clock-names property in the GCE node.

To: kernel@collabora.com
To: Michael Turquette <mturquette@baylibre.com>
To: Stephen Boyd <sboyd@kernel.org>
To: Rob Herring <robh@kernel.org>
To: Krzysztof Kozlowski <krzk+dt@kernel.org>
To: Conor Dooley <conor+dt@kernel.org>
To: Matthias Brugger <matthias.bgg@gmail.com>
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
To: Garmin Chang <garmin.chang@mediatek.com>
To: Friday Yang <friday.yang@mediatek.com>
Cc: Conor Dooley <conor.dooley@microchip.com>
Cc: linux-clk@vger.kernel.org
Cc: devicetree@vger.kernel.org
Cc: linux-kernel@vger.kernel.org
Cc: linux-arm-kernel@lists.infradead.org
Cc: linux-mediatek@lists.infradead.org

Signed-off-by: Julien Massot <julien.massot@collabora.com>
---
Julien Massot (3):
      dt-bindings: clock: mediatek: Add #reset-cells property for MT8188
      arm64: dts: mediatek: mt8188: Add missing #reset-cells property
      arm64: dts: mediatek: mt8188: gce: add missing 'clock-names'

 .../devicetree/bindings/clock/mediatek,mt8188-clock.yaml     |  3 +++
 arch/arm64/boot/dts/mediatek/mt8188.dtsi                     | 12 ++++++++++++
 2 files changed, 15 insertions(+)
---
base-commit: bdd609656ff5573db9ba1d26496a528bdd297cf2
change-id: 20250515-dtb-check-mt8188-5af50d5d5c93

Best regards,
-- 
Julien Massot <julien.massot@collabora.com>


