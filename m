Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5C967C83030
	for <linux-mediatek@archiver.kernel.org>; Thu,  3 Jul 2025 20:57:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=8D89p5uqoZLfESzyqhuwvQsVk9HQPJQB2bYzCDELvfc=; b=n88hgVl9LFyxDxVVj63O1Uv/3+
	tt1zMe/F75z8tFzGSVL6XeY/VB0T7fEuFRXbCM6h9Ce1nQul5WOAFgESvMfcuszBN4oa4n7Dsjhle
	uLIXjmv9QzSuBbVW29dObgrIWXegJcWTdz2z4pQhYymSr7eN+El9NefzdnO+9Sc0mJXjutd+iCOnu
	RQsTfdBb8SYiYN9dVnldhmonNg5XYPcav67C5RRTgrjICvwEktJG9Q+gP9Ml5W4nmF4KxTGZ0uNtk
	c2x8ygECwDsNZxqA02kU/RNVsB3Xj4gtYW5VNpuKR4AILStIYW/ZjydQKXop3v3cShJs2UQ/APUqK
	bxpAOnCA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uXR01-0000000CU08-2r2R;
	Thu, 03 Jul 2025 20:57:41 +0000
Received: from bali.collaboradmins.com ([2a01:4f8:201:9162::2])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uXM4r-0000000Brs1-3FoC;
	Thu, 03 Jul 2025 15:42:23 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1751557340;
	bh=d4fgjGNkQ+CXstPzPLDXaigiQXlneekXtm2M8pLICrA=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=cr+e74aaI3XBMprb3FkyJFS/LV1rzmN82Pu0ZYaG+QivXXQyS+w51mMOirYNccVlQ
	 PjKyVpuGrnnD07L4zOJF3gF4Le7fj3XN1vtV75QRvNZ0ELdQWN81WIbbyWtMDgUrUW
	 Zv+5KbTfli0NEWnWm+ay636fv50hbdEySWbxDZSEsOVSn84a8dKbO6tqN/z7BmrgzL
	 A6zyjG1Pqw/R1cqwz2BmFY9omF3h6ctqLoWezG/BsWbsvafEv1Iv/k77dEtyjD0UBI
	 wTlj82un8OotF1/9DHGppj6WI5040K/xeukg9U6awqrsfnZZQ8ivMqv3o7BnLawxcm
	 p+Z9sWkqs43MA==
Received: from yukiji.home (amontpellier-657-1-116-247.w83-113.abo.wanadoo.fr [83.113.51.247])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: laeyraud)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 69C6817E0EBD;
	Thu,  3 Jul 2025 17:42:19 +0200 (CEST)
From: Louis-Alexis Eyraud <louisalexis.eyraud@collabora.com>
Date: Thu, 03 Jul 2025 17:41:04 +0200
Subject: [PATCH 2/3] arm64: dts: mediatek: mt8390-genio-common: Add Home
 MT6359 PMIC key support
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250703-add-mt6359-pmic-keys-support-v1-2-21a4d2774e34@collabora.com>
References: <20250703-add-mt6359-pmic-keys-support-v1-0-21a4d2774e34@collabora.com>
In-Reply-To: <20250703-add-mt6359-pmic-keys-support-v1-0-21a4d2774e34@collabora.com>
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: kernel@collabora.com, linux-input@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-mediatek@lists.infradead.org, devicetree@vger.kernel.org, 
 Louis-Alexis Eyraud <louisalexis.eyraud@collabora.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1751557337; l=780;
 i=louisalexis.eyraud@collabora.com; s=20250113; h=from:subject:message-id;
 bh=d4fgjGNkQ+CXstPzPLDXaigiQXlneekXtm2M8pLICrA=;
 b=bnfzKGs+imz4mZg4UjsRjY9v61NAPDNnVI0EEbI+9pZdXNCTGd+EyoSKkiDaQSA7fSJfqXShB
 WOmYphl8Jw4B58JXT29cOZakM4rMlYPP75EHKh+rmhJ/Gn3TvynwjvM
X-Developer-Key: i=louisalexis.eyraud@collabora.com; a=ed25519;
 pk=CHFBDB2Kqh4EHc6JIqFn69GhxJJAzc0Zr4e8QxtumuM=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250703_084221_995729_D420F888 
X-CRM114-Status: UNSURE (   9.21  )
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

Add in mt8390-genio-common dtsi file the support of Home MT6359 PMIC
key.

Signed-off-by: Louis-Alexis Eyraud <louisalexis.eyraud@collabora.com>
---
 arch/arm64/boot/dts/mediatek/mt8390-genio-common.dtsi | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/arch/arm64/boot/dts/mediatek/mt8390-genio-common.dtsi b/arch/arm64/boot/dts/mediatek/mt8390-genio-common.dtsi
index eaf45d42cd347a2bd2db8af9ecef8f83f70c9183..a2cdecd2b9034e2f295d817e846d6ed1845e686a 100644
--- a/arch/arm64/boot/dts/mediatek/mt8390-genio-common.dtsi
+++ b/arch/arm64/boot/dts/mediatek/mt8390-genio-common.dtsi
@@ -1161,6 +1161,10 @@ power-key {
 			linux,keycodes = <KEY_POWER>;
 			wakeup-source;
 		};
+
+		home {
+			linux,keycodes = <KEY_HOME>;
+		};
 	};
 };
 

-- 
2.50.0


