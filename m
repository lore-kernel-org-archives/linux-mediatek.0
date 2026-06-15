Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 11AE6CD98CE
	for <linux-mediatek@archiver.kernel.org>; Mon, 15 Jun 2026 07:19:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=bt6uMG9PgUYc/XVv1n4ledEppWz4qm8tk4GY6vs/fFQ=; b=ucEkctubx5VmHzl3pMqsIu2fPa
	XxEGHTo89Gh/Fmp9kwiR1PXnHH0ECmWJIToOf5EzXRVYrvZBxP57rVTFF2JwRg4LBWU0s3FvoAvD/
	G8bQohJVkPTfTiTFDrDHy8SJCNnxoXBx4BNKorzVy0uwmSGn7qooGC9q2zSNEIodGz7o/SkZLYbJ/
	w5syeSTa45RsMbaPAfoOYiDDKphfR5ZeT0r3pssBjLZarCdSeO/KEZ0O7wAL3UftOxTrxwtAqsCjj
	AR6DZ6S/Z0F3F46DQXYL9XZj7HKT1w/OjA0nhG3rSB4IW7Y5PN+tcpE6GokndRtakxuKJrUQSY2SF
	28iwmCew==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wZ1bL-0000000DlNi-0V9j;
	Mon, 15 Jun 2026 07:19:19 +0000
Received: from mail-wm1-x334.google.com ([2a00:1450:4864:20::334])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wZ1bH-0000000DlLC-2ffI
	for linux-mediatek@lists.infradead.org;
	Mon, 15 Jun 2026 07:19:17 +0000
Received: by mail-wm1-x334.google.com with SMTP id 5b1f17b1804b1-491b390f9e9so23164155e9.0
        for <linux-mediatek@lists.infradead.org>; Mon, 15 Jun 2026 00:19:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781507954; x=1782112754; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=bt6uMG9PgUYc/XVv1n4ledEppWz4qm8tk4GY6vs/fFQ=;
        b=JZq3bBMoDuFpThaIHQE4GL8FiuOfgWhvFrTC7s39HABtAIBOXwhHs9AhG37svJmmem
         oKu5iVp7UJ0aRpZi3s489gfkrnxAfMZBSx6fSJPOoKYqkCedbomzJJgr/AHzWSqppkZN
         mjk4WIpxZ3Oa2K/cmCdHZBW+nuEgFZeMCru75mid5QdB5za9kEnSzVUm7EaD0bar/4mq
         8IHnRGiDyhZ92GIRudkp6XXQLLSwGII/feXwFpof5ztAdyZ2VSTI8NIsFQKF5YammT8R
         6d//YdYZM0TgQe0SCNtkbqBsZRHvZ/600l0x+8lWjRjNd/id+djBFk4QFuudbQvgJvcP
         Lk3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781507954; x=1782112754;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=bt6uMG9PgUYc/XVv1n4ledEppWz4qm8tk4GY6vs/fFQ=;
        b=fHmYoC0ngDi1ZQ+4ds868KsguOB2oR8qCTudQiWXUiKg9a7otdk4fSIwFbUldEPyzX
         +lcgofWqODTW/kiGGuhtRktTLm+Q7apxTxYMOtZsymvEU74kKvv3SV+cUvNLNXD9LL/z
         1iWTW0lBYP0+j0AELy4tgjpHSO3RD4SX0K1Amj1wRRavSS4LP+cGFmVd1jcBv7SlCtCs
         X7jTl1lLdQF/pbuv8+s/zbEkPKYPiPFmHFiKxi1hNp0w+oTjfZfqpOt8DpT8HN3V2e3O
         NbTgvIyzKZXB0zi3UJM0idP2qoXleyaeBysL2HDg+glRTeO8lBADDyv7JkiQY1IyQ+a9
         1bDg==
X-Gm-Message-State: AOJu0Yz5xtu5zmxs+XhTkkpZ2ph4r1PEMaqQbA3wYxXaZ86ArZf5+Ru2
	Jw7DZPe0Z6yQMcCwFzugHJTu9FMOAJuroNosy4fZtJVoXDcAsUvGowQuFnivUqBH
X-Gm-Gg: Acq92OFPqWGRIr6wucEILptWcYNDYIAbEjq/uDunLZsbWupQ3gKy4NTNyKfaOv+1rQ8
	seDJpJkZLvSiK/ags+gTHr31VTXt4gghG8+lKojRGUB4J5MtRUEIkzC6yf/rJ0LJOhh794ZBZCj
	AroWH0G2AK2UToeccHv6aHc+nLgql/SZHPvJE1yo8muxqfgmgKENpjR2NLm4bkvKIKQP/czGmmj
	ByZyW0olPY5eJ/ZingvorUIMRkwo+rd3UB1ZiPfXkVkz+4R62TaL25/NxRfI6WhcyT49OOKXV4/
	NTaUEO9nm/bO4u/XI4xLKstMrQDeZ+NDi0jldtxrvaFTX7NP+aEXD03xIaFl0kAosD42lDV6+lh
	USL+Y3ldPd0yLl8BNUw5mt9vvNoc/P0B6NSV+zUb5sIfY7zo//959vcBJd/lxeTMDZm6MfjgRqU
	nnr4BfA2NMdzLMlJFb
X-Received: by 2002:a05:600d:8486:20b0:490:9782:3eb8 with SMTP id 5b1f17b1804b1-490ec4fc0c4mr117642565e9.25.1781507953725;
        Mon, 15 Jun 2026 00:19:13 -0700 (PDT)
Received: from luca-vm.. ([81.56.18.151])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-492203c0801sm200181015e9.10.2026.06.15.00.19.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 15 Jun 2026 00:19:13 -0700 (PDT)
From: Luca Leonardo Scorcia <l.scorcia@gmail.com>
To: linux-mediatek@lists.infradead.org
Cc: Fabien Parent <parent.f@gmail.com>,
	Val Packett <val@packett.cool>,
	Luca Leonardo Scorcia <l.scorcia@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Dmitry Torokhov <dmitry.torokhov@gmail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Sen Chu <sen.chu@mediatek.com>,
	Sean Wang <sean.wang@mediatek.com>,
	Macpaul Lin <macpaul.lin@mediatek.com>,
	Lee Jones <lee@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Linus Walleij <linusw@kernel.org>,
	Julien Massot <julien.massot@collabora.com>,
	Louis-Alexis Eyraud <louisalexis.eyraud@collabora.com>,
	Akari Tsuyukusa <akkun11.open@gmail.com>,
	Chen Zhong <chen.zhong@mediatek.com>,
	linux-input@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-pm@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-gpio@vger.kernel.org
Subject: [PATCH v7 2/9] dt-bindings: input: mtk-pmic-keys: Add MT6392 PMIC keys
Date: Mon, 15 Jun 2026 09:16:08 +0200
Message-ID: <20260615071836.362883-3-l.scorcia@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260615071836.362883-1-l.scorcia@gmail.com>
References: <20260615071836.362883-1-l.scorcia@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260615_001915_687004_08456D60 
X-CRM114-Status: UNSURE (   9.09  )
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

From: Fabien Parent <parent.f@gmail.com>

Add the binding documentation of mtk-pmic-keys for the MT6392 PMIC.

Signed-off-by: Fabien Parent <parent.f@gmail.com>
Signed-off-by: Val Packett <val@packett.cool>
Signed-off-by: Luca Leonardo Scorcia <l.scorcia@gmail.com>
Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Acked-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Acked-by: Rob Herring (Arm) <robh@kernel.org>
---
 Documentation/devicetree/bindings/input/mediatek,pmic-keys.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/input/mediatek,pmic-keys.yaml b/Documentation/devicetree/bindings/input/mediatek,pmic-keys.yaml
index 140a862ecfbe..ff720588128b 100644
--- a/Documentation/devicetree/bindings/input/mediatek,pmic-keys.yaml
+++ b/Documentation/devicetree/bindings/input/mediatek,pmic-keys.yaml
@@ -31,6 +31,7 @@ properties:
           - mediatek,mt6357-keys
           - mediatek,mt6358-keys
           - mediatek,mt6359-keys
+          - mediatek,mt6392-keys
           - mediatek,mt6397-keys
       - items:
           - enum:
-- 
2.43.0


