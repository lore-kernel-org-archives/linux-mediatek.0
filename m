Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 54414C7619A
	for <linux-mediatek@archiver.kernel.org>; Wed, 12 Apr 2023 13:12:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=zc4/7KYg8jDtCet1zrfHxIuoNb6cD+a384nMVvJtQlc=; b=ZLdTNpxx/3P4fXMD6GA0uc5H9p
	6rYOxo1T7a1brFr6yYyPdkNVuC+kC/GkL/iPJhAP30iB7ALHO3iWcjyN6O1/N6Q7+pgJ+dlAk3uas
	RjscfWZqgRj9rvX9QCye2AlV6fnV6/BYkcvmzKYcWC/nK0YrJe9CFcdYIahs1dxIle9aj6ery0w87
	kPDOn8q/ZlAU2C/3Qf7mNBSexCwy7TdgcKhKLj+vn7XjmRuTAyHO0CUeDBBrGt1DoibSq7aLxkZZY
	rdjtoulzBrgw+iR9IgbLrW1nq7MmTkN8+1i9B1wiYB989tM6Yg6irZmxPbJw+IyW97QzrOBoc+8rw
	84ySQ4ZA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pmaH7-003HC9-06;
	Wed, 12 Apr 2023 13:12:37 +0000
Received: from madras.collabora.co.uk ([46.235.227.172])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pmaGt-003H5d-1o;
	Wed, 12 Apr 2023 13:12:25 +0000
Received: from IcarusMOD.eternityproject.eu (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id 8EAAF6603206;
	Wed, 12 Apr 2023 14:12:21 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1681305142;
	bh=smAn5Frg1iVCEDY9hhWLZkFQHXI/vQRHeCWQGlGI1Kg=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=YbEHpT4xzXs1x0UWIY0Q0iGu7cVfZUM6Zj1z4BKDuOIUfYBo7RertQNhFceKkm4UQ
	 UFI3560uPc4i65fcQlEW/lebU+wg7irObZGnk1F1/veKD9c8+jKBOgZlpQRJ9cFTfb
	 tzKBvOI5iX+tMZjdLoPkrD4S7R+02lNpbMNbHWJ7AJ4Uu5YQiHuXKwx+a6UOnTmeOz
	 VQxZIUWTuLoLyzZF4D346FwXnreCnr+v6JYFU+9ZhVqOskfgJF07XnfrXOky7j4z+v
	 AHAQhGNc6vAefcZj/jCsvdNwc7Maj3EqyWrBQBdykbn2xBIm7JGI+xb1/In9fTWiyv
	 hHqYYVowdkOrQ==
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
To: matthias.bgg@gmail.com
Cc: robh+dt@kernel.org,
	krzysztof.kozlowski+dt@linaro.org,
	amergnat@baylibre.com,
	flora.fu@mediatek.com,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	kernel@collabora.com,
	phone-devel@vger.kernel.org,
	~postmarketos/upstreaming@lists.sr.ht,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH v3 1/6] dt-bindings: soc: mediatek: pwrap: Add compatible for MT6795 Helio X10
Date: Wed, 12 Apr 2023 15:12:11 +0200
Message-Id: <20230412131216.198313-2-angelogioacchino.delregno@collabora.com>
X-Mailer: git-send-email 2.40.0
In-Reply-To: <20230412131216.198313-1-angelogioacchino.delregno@collabora.com>
References: <20230412131216.198313-1-angelogioacchino.delregno@collabora.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230412_061223_726809_66CA71C7 
X-CRM114-Status: UNSURE (   8.73  )
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

Add a compatible for the PMIC Wrapper found on the MT6795 Helio X10 SoC.

Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 .../devicetree/bindings/soc/mediatek/mediatek,pwrap.yaml         | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/soc/mediatek/mediatek,pwrap.yaml b/Documentation/devicetree/bindings/soc/mediatek/mediatek,pwrap.yaml
index 3fefd634bc69..a06ac2177444 100644
--- a/Documentation/devicetree/bindings/soc/mediatek/mediatek,pwrap.yaml
+++ b/Documentation/devicetree/bindings/soc/mediatek/mediatek,pwrap.yaml
@@ -33,6 +33,7 @@ properties:
               - mediatek,mt2701-pwrap
               - mediatek,mt6765-pwrap
               - mediatek,mt6779-pwrap
+              - mediatek,mt6795-pwrap
               - mediatek,mt6797-pwrap
               - mediatek,mt6873-pwrap
               - mediatek,mt7622-pwrap
-- 
2.40.0


