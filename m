Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 04147C4707C
	for <linux-mediatek@archiver.kernel.org>; Fri, 12 Jan 2024 09:47:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=++hz+g+KO6qJy+F6RvYCQjyj8VhSM+V5Oidu0nMW/b8=; b=hFRfopfx+aA+s1NpoISaSa/Irm
	oq3BcEfSGiAxy1n+ITCLIMtvn+3maH6vF2KBGBUHIb3UEIN69ADE77tfYRNqbcazCND79FNWpeJnc
	5i4Uhe6VZVI7CwlNOUSQMxIjj/QhkwQ3R/lB7M5tzayw9vNTZNOAY6ofd3jA/Qc8gVvHdcwXxWi4y
	hfg6HechXd//cmGPkNDNkg54vLh8xzIh0/C6HbvUoSOIwhiaymHMIvoJUjdRPABtKwhPHDfQom3j8
	vsjbHdtppbRNPo1Ur5avFD2f7MYfhui/oIPe6nw7kRPcQZTs2HOezLSnCjUvl6FEOMrXiWSwTch1j
	dJajMHtQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rOE80-002NQG-23;
	Fri, 12 Jan 2024 09:47:04 +0000
Received: from madrid.collaboradmins.com ([46.235.227.194])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rOE7k-002NAW-2r;
	Fri, 12 Jan 2024 09:46:50 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1705052807;
	bh=A/hew+ECsb7JQ+PjQNHeZlTkpaBAsK7nTKJy6ngYdtI=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=tUBRlSgdePqmZVTbVSZIknDo47NeVJQVISZ74IJR7cPoo2g7QYn87wxsMr5/dyq+k
	 7zkZ2sWwm18VEH23wPsVpWTLmUPTk1Vyas9lzzyy53v8dPXd0Pgi2FTZKNXcdrLbSj
	 pEaSWPpotNfjYcOmTHvZXh4TXUwpgcDbTfxgVLucyLUgs1R/4SuKRLmJw94/ogfrnC
	 5uHncEdbleY3fo3Jr1vuLvJ+DTJ16Z1UcxXDBFWCH/HOkIuEdjkUK/5x/LjBS6sbhf
	 KfazfqoJkPdN9oLsMdo97bUVK+OZMFggFijsamLD3JQh0FUvZyxATHtn+stTeGPMJ5
	 qAoRnPXTepPzg==
Received: from IcarusMOD.eternityproject.eu (cola.collaboradmins.com [195.201.22.229])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madrid.collaboradmins.com (Postfix) with ESMTPSA id DC63B3782035;
	Fri, 12 Jan 2024 09:46:46 +0000 (UTC)
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
To: linux-mediatek@lists.infradead.org
Cc: robh+dt@kernel.org,
	krzysztof.kozlowski+dt@linaro.org,
	conor+dt@kernel.org,
	matthias.bgg@gmail.com,
	angelogioacchino.delregno@collabora.com,
	wenst@chromium.org,
	hsinyi@chromium.org,
	nfraprado@collabora.com,
	macpaul.lin@mediatek.com,
	sean.wang@mediatek.com,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	kernel@collabora.com
Subject: [PATCH 09/15] arm64: dts: mediatek: radxa-nio-12l: Enable System Companion Processor
Date: Fri, 12 Jan 2024 10:46:26 +0100
Message-ID: <20240112094632.66310-10-angelogioacchino.delregno@collabora.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240112094632.66310-1-angelogioacchino.delregno@collabora.com>
References: <20240112094632.66310-1-angelogioacchino.delregno@collabora.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240112_014649_051062_15069271 
X-CRM114-Status: UNSURE (   9.34  )
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

The SCP is used by the SoC for various tasks, including initializing
hardware video encoding/decoding hardware and managing other remote
processors. Enable this node and assign its own DMA pool to it.

Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
---
 arch/arm64/boot/dts/mediatek/mt8395-radxa-nio-12l.dts | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/arch/arm64/boot/dts/mediatek/mt8395-radxa-nio-12l.dts b/arch/arm64/boot/dts/mediatek/mt8395-radxa-nio-12l.dts
index 8492cf52413f..5a9e33013209 100644
--- a/arch/arm64/boot/dts/mediatek/mt8395-radxa-nio-12l.dts
+++ b/arch/arm64/boot/dts/mediatek/mt8395-radxa-nio-12l.dts
@@ -587,6 +587,11 @@ &pmic {
 	interrupts-extended = <&pio 222 IRQ_TYPE_LEVEL_HIGH>;
 };
 
+&scp {
+	memory-region = <&scp_mem>;
+	status = "okay";
+};
+
 &spmi {
 	#address-cells = <2>;
 	#size-cells = <0>;
-- 
2.43.0


