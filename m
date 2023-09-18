Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4B27ACD13D2
	for <linux-mediatek@archiver.kernel.org>; Mon, 18 Sep 2023 10:30:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=oH+7gkGZ2NgBDOw55r/IVwyq/eF2vP6P8VImnTfCTKk=; b=kI/0DBOvBiMMQTQGCH42URwivO
	p3FxwuqmEFrCMQsQBoV7kvlGBmj9CJNm5A9cb5hgmO7xDrJsIJfHCaCVUCP2Aodci79LX92mAcTth
	RmBz//r9axsr5un4F+XfGmuSiGapYTMh8lhrbDf/k5T+fnpE0gPts9Ztwo+3BUpfwLd5DdXHuy70h
	PgernAeGd1yHKq37t4cJ/nhDdQ4M8YbrZtUUQ2Pjqtw+eMBcvk74uQDZWzeVOXNOS1zutNawdj91Z
	61c4sYL+GAU1CMMVweMPLxWslPK5+fRhQUEzNDdmRYDyZgK2/5SliGIiFu0nwrts9lUXa4BS62WOM
	pNqeaU/A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qiBW5-00F7rm-0V;
	Mon, 18 Sep 2023 10:30:09 +0000
Received: from ams.source.kernel.org ([2604:1380:4601:e00::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qiBW2-00F7lp-0N
	for linux-mediatek@lists.infradead.org;
	Mon, 18 Sep 2023 10:30:07 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id B5AC3B80B4E;
	Mon, 18 Sep 2023 10:30:02 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 182E3C433C8;
	Mon, 18 Sep 2023 10:30:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1695033001;
	bh=dP81EaTqhJtwTW8QQL5omQ9zy1uxWNFhA04z1xr2m9E=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=YSxFvkipJ+e3AVlxQrb1J7DTWqqGv0wiS/fsdtvpcKV91ONrCPU4pMqd1ZdHyzURL
	 AVIvYAOmK3LGidLT9+7PopqSZUdXA0dVMjl4T5Ma5IImVPxrpnS5bAoXhs29NF3zDV
	 6sTbKqCHQ1azqzassG0isC6sDbAt8WjPx/wiIkbP6GH0PGLJMyDgeYRXX2mWF3ozKO
	 OEQWmP3D7YPA4WO8yrl211E4fW7qcuDPT4n8cGYoqJyvRqs4rIPqksKHWP+BpkRcgT
	 Puz8CS/H6L7g8z/2bezRjQGhzD6NCKnjzCSZMp8PJ6Su9RzgZ9RkxDgEKvrf5G5A3y
	 bUyXyd1nImiRg==
From: Lorenzo Bianconi <lorenzo@kernel.org>
To: netdev@vger.kernel.org
Cc: lorenzo.bianconi@redhat.com,
	nbd@nbd.name,
	john@phrozen.org,
	sean.wang@mediatek.com,
	Mark-MC.Lee@mediatek.com,
	davem@davemloft.net,
	edumazet@google.com,
	kuba@kernel.org,
	pabeni@redhat.com,
	daniel@makrotopia.org,
	linux-mediatek@lists.infradead.org,
	sujuan.chen@mediatek.com,
	horms@kernel.org,
	robh+dt@kernel.org,
	krzysztof.kozlowski+dt@linaro.org,
	devicetree@vger.kernel.org
Subject: [PATCH v2 net-next 02/17] dt-bindings: arm: mediatek: mt7622-wed: add WED binding for MT7988 SoC
Date: Mon, 18 Sep 2023 12:29:04 +0200
Message-ID: <db678ef631a69ed962a6d2f8d9bd0bcbcdcd1b9f.1695032291.git.lorenzo@kernel.org>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <cover.1695032290.git.lorenzo@kernel.org>
References: <cover.1695032290.git.lorenzo@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230918_033006_317339_7189D2C9 
X-CRM114-Status: UNSURE (   8.25  )
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

Introduce MT7988 SoC compatibility string in mtk_wed binding.

Acked-by: Rob Herring <robh@kernel.org>
Signed-off-by: Lorenzo Bianconi <lorenzo@kernel.org>
---
 .../devicetree/bindings/arm/mediatek/mediatek,mt7622-wed.yaml    | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/arm/mediatek/mediatek,mt7622-wed.yaml b/Documentation/devicetree/bindings/arm/mediatek/mediatek,mt7622-wed.yaml
index 28ded09d72e3..e7720caf31b3 100644
--- a/Documentation/devicetree/bindings/arm/mediatek/mediatek,mt7622-wed.yaml
+++ b/Documentation/devicetree/bindings/arm/mediatek/mediatek,mt7622-wed.yaml
@@ -22,6 +22,7 @@ properties:
           - mediatek,mt7622-wed
           - mediatek,mt7981-wed
           - mediatek,mt7986-wed
+          - mediatek,mt7988-wed
       - const: syscon
 
   reg:
-- 
2.41.0


