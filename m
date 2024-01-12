Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C61DCC4706C
	for <linux-mediatek@archiver.kernel.org>; Fri, 12 Jan 2024 09:46:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=A0Cf/MjcSaY/84F3kmGn5Q7d7Uek/IvCpGMQn1VE6u0=; b=KBh3/0LVu69iuSu04NlfA/lmmC
	l7ovXGnmtPHNracBtC9HhNEUEzIBiTlMt3cAYm35Tip8Hty+CyDkDvO/qYUFym4tDw7v7xakQrVEZ
	Fh9W36EPvMR17XWctUJri32aYSiYUUKGQxtFfn0iFrFOi/XymLjppqMzh7JttlBJx6GqRd95HoQdE
	IPA8V9EmPzWRGX8QDicyZjs5IShD/CD1qLI2tk4Y2yf5aY069X8+QCNkzSJAGwGeQeUdr6xEmA4Y3
	txR5eaa9GfDqaWBPgtkEbp8iHW6LcY5sSUcqFrmOFhTne+9oK19ETlltSfyULYy7RlliZYjyj5lUC
	z21lozIw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rOE7g-002N8E-22;
	Fri, 12 Jan 2024 09:46:44 +0000
Received: from madrid.collaboradmins.com ([2a00:1098:ed:100::25])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rOE7c-002N5s-2K;
	Fri, 12 Jan 2024 09:46:42 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1705052799;
	bh=mRwByIiVTJreubbEqTLuMGGfCpZaH/6lxKTlnASbr/M=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=LsmGPgn9ccNOnvg4YmWWBMpw82iRH7rByQdJildqyIjWjvzmE6iKHk4S+l6HmrZq3
	 teW9KvAzdWDRNXGHuFsqvqHMEBtClyLtv8bY+m7nC09hdLB1zjtPtvL6NqY3Z/QnlD
	 DuTrbvVMqfAsY9KOyvdKd9BNgzA9/hT0cR01GoUZ47klzaKmLSFbs3tFcSvimhE5uS
	 daMnzWLTbtIe53nhfpfV+/ddyvBbip4O7absmWKzDOCfqCFdjnbDtiJtOi702s+lck
	 rHK+B9b+5pa05KOz0x5HHmtSDH04ji8j9jQ665TItRnuEJ9Z4tYx5jXJ/VH4OROmR6
	 AGYwxZGZBouPg==
Received: from IcarusMOD.eternityproject.eu (cola.collaboradmins.com [195.201.22.229])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madrid.collaboradmins.com (Postfix) with ESMTPSA id 9A5203782021;
	Fri, 12 Jan 2024 09:46:38 +0000 (UTC)
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
Subject: [PATCH 01/15] dt-bindings: arm64: mediatek: Add MT8395 Radxa NIO 12L board compatible
Date: Fri, 12 Jan 2024 10:46:18 +0100
Message-ID: <20240112094632.66310-2-angelogioacchino.delregno@collabora.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240112094632.66310-1-angelogioacchino.delregno@collabora.com>
References: <20240112094632.66310-1-angelogioacchino.delregno@collabora.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240112_014640_888836_260C70A4 
X-CRM114-Status: UNSURE (   8.32  )
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

Add a board compatible for the Radxa NIO 12L, based on the MediaTek
MT8395 SoC.

Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
---
 Documentation/devicetree/bindings/arm/mediatek.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/arm/mediatek.yaml b/Documentation/devicetree/bindings/arm/mediatek.yaml
index 5d49c7af50e5..cc37c88d8d4a 100644
--- a/Documentation/devicetree/bindings/arm/mediatek.yaml
+++ b/Documentation/devicetree/bindings/arm/mediatek.yaml
@@ -345,6 +345,7 @@ properties:
       - items:
           - enum:
               - mediatek,mt8395-evk
+              - radxa,nio-12l
           - const: mediatek,mt8395
           - const: mediatek,mt8195
       - items:
-- 
2.43.0


