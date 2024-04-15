Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D551FC4345F
	for <linux-mediatek@archiver.kernel.org>; Mon, 15 Apr 2024 07:55:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=7+Rrya8OWhO2OUYAjnND4UTVsbL54yMSxeaMFRPI4hw=; b=ZrohrnNJQ+i4YxDRMB1Up0OcNG
	8j8dblyjn+Phufo6+9ae8prp9qYa/xGn3x5tMIS97NDjwHzwGRwyZXhxw9PgWmJ+nnNKKP/FTI/fJ
	NwRhyFC/kDbyeKVZgxBo3/9LVdea/xsVzeqEeD7ASF2HYNJxmZN4PhYy0G7LkWbN9VHQHPQ/rIKig
	duxXks5G7FitU33jT0dS0D4gxoP9E6hIkvyzroPy3Ygn7icXsFe5JM75AUsCohDzHuTQyv3c9rY73
	k0r0BMHOE2zJKl+iwGuEOE5NmDeX6o8+DgTCATDeetlvvHOgVnrNgmQziPNiSlEVHPerTX7ch1cEB
	iaKxR3zg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rwHBN-00000007Ps0-258m;
	Mon, 15 Apr 2024 07:55:17 +0000
Received: from madrid.collaboradmins.com ([2a00:1098:ed:100::25])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rwHAU-00000007PDi-40eS;
	Mon, 15 Apr 2024 07:54:25 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1713167661;
	bh=q+2QfLmc4hWTBhWiZECk9yzd7B5W4CyU9F/byVeWFuY=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=pJD55ocyShC5HkBmDuCivtbpCco+DUG9fTD51ju8QPtC2BbML1ftrWykX0qh8Dpc8
	 3D+plA0jHO0fsyhNcQHq0SfA7pYaxjgJRfbMXulzegGOK9g9NNIR8IzsvG880Wp5K7
	 ttbLl4xaYLbu7+CHd4O7o6xISu5x67EkKVCD+xbb766v84G+HoZCiNQAu4F6QmQqNd
	 dJDxEiG3/AHCS4BYOdOvmHnT1HqbeNvRPFGdbPHs6ns0+p0TvZ42Y77igEuW3sm4Zc
	 tPAhhTntaIV8CnsaI+AHOGspo1+6X46Eehy49vcYZYVdqA2iwkd7Qf+0gYEiFiXYx8
	 t6rI+ovj6M82g==
Received: from IcarusMOD.eternityproject.eu (cola.collaboradmins.com [195.201.22.229])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madrid.collaboradmins.com (Postfix) with ESMTPSA id 1931B37820F3;
	Mon, 15 Apr 2024 07:54:20 +0000 (UTC)
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
To: linux-scsi@vger.kernel.org
Cc: alim.akhtar@samsung.com,
	avri.altman@wdc.com,
	bvanassche@acm.org,
	robh@kernel.org,
	krzysztof.kozlowski+dt@linaro.org,
	conor+dt@kernel.org,
	peter.wang@mediatek.com,
	chu.stanley@gmail.com,
	jejb@linux.ibm.com,
	martin.petersen@oracle.com,
	lgirdwood@gmail.com,
	broonie@kernel.org,
	matthias.bgg@gmail.com,
	angelogioacchino.delregno@collabora.com,
	stanley.chu@mediatek.com,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-mediatek@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	Conor Dooley <conor.dooley@microchip.com>
Subject: [PATCH v3 6/8] dt-bindings: ufs: mediatek,ufs: Document MT8195 compatible
Date: Mon, 15 Apr 2024 09:54:04 +0200
Message-ID: <20240415075406.47543-7-angelogioacchino.delregno@collabora.com>
X-Mailer: git-send-email 2.44.0
In-Reply-To: <20240415075406.47543-1-angelogioacchino.delregno@collabora.com>
References: <20240415075406.47543-1-angelogioacchino.delregno@collabora.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240415_005423_286635_BC627785 
X-CRM114-Status: UNSURE (   7.50  )
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

Add the new mediatek,mt8195-ufshci string.
This SoC's UFSHCI controller is compatible with MT8183.

Acked-by: Conor Dooley <conor.dooley@microchip.com>
Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
---
 Documentation/devicetree/bindings/ufs/mediatek,ufs.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/ufs/mediatek,ufs.yaml b/Documentation/devicetree/bindings/ufs/mediatek,ufs.yaml
index 2f4b0a40bd5e..92d7e48d5d6d 100644
--- a/Documentation/devicetree/bindings/ufs/mediatek,ufs.yaml
+++ b/Documentation/devicetree/bindings/ufs/mediatek,ufs.yaml
@@ -17,6 +17,7 @@ properties:
     items:
       - enum:
           - mediatek,mt8192-ufshci
+          - mediatek,mt8195-ufshci
       - const: mediatek,mt8183-ufshci
 
   clocks:
-- 
2.44.0


