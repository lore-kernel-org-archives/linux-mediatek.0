Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 61DB1E75451
	for <linux-mediatek@archiver.kernel.org>; Tue,  3 Oct 2023 11:14:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=HKSzdHrC0ajnavbFJYpZ36Ccu0K+838C0VozQS726Fw=; b=3+sM4LIeh9YApCm/Jw1lWGippd
	DAOJT+V19imsB9rE/c/KtVkCG+N501fs0DZdhql0pNE4Wq38Uel/8Gl0gcSASiNQxGU0V0kwh1JOb
	0wJLVD8Rw5quSFlGvtd6wyS2pBZYlL5HYM9RALlqw9/k6UYJxnTIXW6SKPDDUoOFZce5uPQGWnpPm
	kM2H50dimEnO54pPZl4AFAy5K1m5DGPhOXq0rLxlYRnC+CpVbuUsYwgSybMA7chBcRdCfjTCw/MU1
	gkJ6w2qH+aSoIyre6N8gRdzpv0OA24ELLoFLIFKlDP/SzZajk3kZdf3jOY18qCAPeeSUvq1tnxi/3
	X0nR/aMw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qndLk-00EVDa-0B;
	Tue, 03 Oct 2023 11:14:00 +0000
Received: from madras.collabora.co.uk ([46.235.227.172])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qndLg-00EVAa-2S;
	Tue, 03 Oct 2023 11:13:58 +0000
Received: from IcarusMOD.eternityproject.eu (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id 10B3F6607329;
	Tue,  3 Oct 2023 12:13:54 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1696331634;
	bh=pAXKlMZYb9kk4/jOlDzFJfE6QfqONMhs8aaRerQ53qY=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=VTNWZ2tQ9KpIdiKtaVVu2akIqHUp32W5PraLcfdZZjOz5aBbBs3m1I/BsEgNzHUIc
	 0lqOP5mMe9UG+JoB0jMMaCQfEp5nDd9Oj0I8e23mgFsEfUIYPlnsA4PJiHN0V3hvtx
	 Vc1dXoW9J5pP64i/8CuLstMvFEf/aBORrF6bzYi081B1wXsDSIpx92PdGiGttG75Di
	 +jy9eP2KUluHQny3ZAOBwg+dY/IB2Pj+AuX5n3CjsTSI8Tw5VRk3jWrqGa/DWHgY5X
	 sJqm+XzCNbs01OY8/H3hQiL1iPyN/sI8MbWEUQBPQq2sruwpx3NOVyX+szFlDp75rU
	 5R6NAqpuw6QqA==
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Date: Tue, 03 Oct 2023 13:13:44 +0200
Subject: [PATCH 2/5] arm64: dts: mediatek: mt8195-demo: fix the memory size
 to 8GB
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20231003-mediatek-fixes-v6-7-v1-2-dad7cd62a8ff@collabora.com>
References: <20231003-mediatek-fixes-v6-7-v1-0-dad7cd62a8ff@collabora.com>
In-Reply-To: <20231003-mediatek-fixes-v6-7-v1-0-dad7cd62a8ff@collabora.com>
To: Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Rob Herring <robh+dt@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
 Conor Dooley <conor+dt@kernel.org>, Fabien Parent <fparent@baylibre.com>, 
 Miles Chen <miles.chen@mediatek.com>, 
 Macpaul Lin <macpaul.lin@mediatek.com>, 
 Chunfeng Yun <chunfeng.yun@mediatek.com>, Sam Shih <sam.shih@mediatek.com>, 
 Frank Wunderlich <frank-w@public-files.de>, 
 Jieyy Yang <jieyy.yang@mediatek.com>, 
 Tinghan Shen <tinghan.shen@mediatek.com>, 
 Seiya Wang <seiya.wang@mediatek.com>, soc@kernel.org
Cc: linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-mediatek@lists.infradead.org, devicetree@vger.kernel.org, 
 stable@vger.kernel.org
X-Mailer: b4 0.12.1
X-Developer-Signature: v=1; a=openpgp-sha256; l=1051;
 i=angelogioacchino.delregno@collabora.com; h=from:subject:message-id;
 bh=0AjmDhxqpfBUHke/hawEALL8dEPAtQdtDwHGbWp7zNw=;
 b=owGbwMvMwCU2y4zl/NrpLRWMp9WSGFKlv+fLvVLqnHPx2fqqXsN7D8Q6Y2blMLqE7lLYPaV/XlaH
 q+CUjlIWBjEuBlkxRRb1uzXZz9esZDzSfrYEZg4rE8gQBi5OAZjIjJOMDB+5d5o+OCj5be+KCcuLy2
 V6Mq+aKK/8sHi7/slvOZyz5oUy/NO6JcicbTSHZ4H72Q6/c/8S/gSqVqxd+EV8gcZRywyFaB4A
X-Developer-Key: i=angelogioacchino.delregno@collabora.com; a=openpgp;
 fpr=57152E620CAF29C5DBE574766833ABB5BEBAF7B7
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231003_041356_933959_5B233F13 
X-CRM114-Status: GOOD (  12.28  )
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

From: Macpaul Lin <macpaul.lin@mediatek.com>

The onboard dram of mt8195-demo board is 8GB.

Cc: stable@vger.kernel.org      # 6.1, 6.4, 6.5
Fixes: 6147314aeedc ("arm64: dts: mediatek: Add device-tree for MT8195 Demo board")
Signed-off-by: Macpaul Lin <macpaul.lin@mediatek.com>
Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Link: https://lore.kernel.org/r/20230905034511.11232-1-macpaul.lin@mediatek.com
---
 arch/arm64/boot/dts/mediatek/mt8195-demo.dts | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/mediatek/mt8195-demo.dts b/arch/arm64/boot/dts/mediatek/mt8195-demo.dts
index b2485ddfd33b..ff363ab925e9 100644
--- a/arch/arm64/boot/dts/mediatek/mt8195-demo.dts
+++ b/arch/arm64/boot/dts/mediatek/mt8195-demo.dts
@@ -48,7 +48,7 @@ key-0 {
 
 	memory@40000000 {
 		device_type = "memory";
-		reg = <0 0x40000000 0 0x80000000>;
+		reg = <0 0x40000000 0x2 0x00000000>;
 	};
 
 	reserved-memory {

-- 
2.42.0


