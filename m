Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 70E5DC77B7C
	for <linux-mediatek@archiver.kernel.org>; Mon, 23 Jun 2025 14:52:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=NSTp5uzKi54Odg+OB9kuyDtFvbIP2kVUT8d1ZO5Olag=; b=NyjLznGO4D2NC1Evb3D5R++W/4
	o0Z/ryptN9adHXBHZalJzbgso9oOm7Tz1h+rxaqARLSmOkTp4QYP/EPYPp90jIqrg2Z/rlPVbYuJK
	0N3apZOvIAS9AAH90/h8+6gKuT3N2pcKf50tfRcl2pbcMI9f1iiDnX29ff6FtCEyGWAjicRnX0ZtH
	3Zr9+dMCZoFvQc3WuHUSkjBU6JFVjhsR73yNerQ3ks7lnM5STvj+t9JVwp6pMRzNr+cShDwbHuiFC
	FkQgvFRFqBkAYyWAMF2Fq0CERVSTRJtjfJZ1BN5afcIzDqamONrj0xCn1HvuDKjIyY7VTuqQzvs+8
	gBPDRJTg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uTiWt-000000037nE-25T0;
	Mon, 23 Jun 2025 14:52:15 +0000
Received: from bali.collaboradmins.com ([148.251.105.195])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uTfs1-00000002b8Y-0pEb;
	Mon, 23 Jun 2025 12:01:54 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1750680111;
	bh=x+YaW9SPO5D5OXeX5nvWtC3rkhnAG2cAbAN5a96RWbA=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=GAySvZGV/ARQ3af10jU7z5WFaKqTYWkGtmvmQiJpyMk8pxd77/cVaxzf7LgH3ottM
	 qKXdMwmrJQlRa6OG6NdrQ44yuWfEVgUqA6mwwfYIS+wN03nmm75EHVoz79m/WO2Xz4
	 x+FUu3DeGLEq7QhfDVcVyPvZ9RlkZaznduH/eEHCJqF/4tdRaOthgoV+Qwe87qT5ri
	 TDRVyhTdfL5ERZrTrXQaqYxS1hd7bnkZEV+7tljqG2Thj0lnOB9xUjTrv7rryTDSLJ
	 vUv0Ab+AAMSu1wSBDi0Cjr7IlUIFuX6QbBx4H9O1JBC2GobTexSP9njAv+bDzG2Oue
	 7JjfEmrHgaVXQ==
Received: from IcarusMOD.eternityproject.eu (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 4648617E1560;
	Mon, 23 Jun 2025 14:01:51 +0200 (CEST)
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
To: lgirdwood@gmail.com
Cc: broonie@kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	matthias.bgg@gmail.com,
	angelogioacchino.delregno@collabora.com,
	linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	kernel@collabora.com
Subject: [PATCH v1 3/4] dt-bindings: regulator: mediatek-dvfsrc: Add MT8196 support
Date: Mon, 23 Jun 2025 14:01:43 +0200
Message-ID: <20250623120144.109359-4-angelogioacchino.delregno@collabora.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250623120144.109359-1-angelogioacchino.delregno@collabora.com>
References: <20250623120144.109359-1-angelogioacchino.delregno@collabora.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250623_050153_383525_707EB234 
X-CRM114-Status: UNSURE (   7.79  )
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

Add a compatible for the MediaTek MT8196 Chromebook SoC's
regulators over DVFSRC.
This SoC has only one regulator "dvfsrc-vcore" and different
values for vsel compared to the others.

Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
---
 .../bindings/regulator/mediatek,mt6873-dvfsrc-regulator.yaml     | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/regulator/mediatek,mt6873-dvfsrc-regulator.yaml b/Documentation/devicetree/bindings/regulator/mediatek,mt6873-dvfsrc-regulator.yaml
index acac5c869f2c..685ccf9cf4d4 100644
--- a/Documentation/devicetree/bindings/regulator/mediatek,mt6873-dvfsrc-regulator.yaml
+++ b/Documentation/devicetree/bindings/regulator/mediatek,mt6873-dvfsrc-regulator.yaml
@@ -21,6 +21,7 @@ properties:
       - mediatek,mt8183-dvfsrc-regulator
       - mediatek,mt8192-dvfsrc-regulator
       - mediatek,mt8195-dvfsrc-regulator
+      - mediatek,mt8196-dvfsrc-regulator
 
   dvfsrc-vcore:
     description: DVFSRC-controlled SoC Vcore regulator
-- 
2.49.0


