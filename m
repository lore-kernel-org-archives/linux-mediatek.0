Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 908E5C77B75
	for <linux-mediatek@archiver.kernel.org>; Mon, 15 May 2023 13:29:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:To:From:Date:Reply-To:Cc:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=oc3dWJ9BeHmIOGl7K20BCJihT++yUchNCQOpzUbNuqY=; b=oaCMZf9V8UYI/sf9WbQgP2ALo2
	z7ZRDIQOy2IyyNjulLk9p03dqsycLEKciz2QXKmd6D+jAlxCfKwFY0hi8twen6/Mrnn1v18LrSLyl
	7wYIFYN6VLQEsulyhaOHrP6ZzkHwUPfgUoCpCZHs9ojnyqTYCp/jpNzG9Db5Fr5oj234U9gw9mYoy
	XaJRBJdGn6/Pg+K0dtxMLratuAkYNdWynWQ7bgyM1ElWblBWlCEBsgAuxu6LNMNpd/uxnWCxg3qhr
	NY5dkprQJNL3XpZTx+JVrTzSeXQ9tOQOxAejK0ipEa2+mw4AcRkHuTMoY8bNquSLwJ8qOtbKAiH0u
	8r2sSqMw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pyYGC-002GJl-2i;
	Mon, 15 May 2023 13:29:08 +0000
Received: from pidgin.makrotopia.org ([185.142.180.65])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pyYG9-002GHS-2N;
	Mon, 15 May 2023 13:29:06 +0000
Received: from local
	by pidgin.makrotopia.org with esmtpsa (TLS1.3:TLS_AES_256_GCM_SHA384:256)
	 (Exim 4.96)
	(envelope-from <daniel@makrotopia.org>)
	id 1pyYFg-0003D3-2D;
	Mon, 15 May 2023 13:28:38 +0000
Date: Mon, 15 May 2023 15:25:59 +0200
From: Daniel Golle <daniel@makrotopia.org>
To: Felix Fietkau <nbd@nbd.name>, Lorenzo Bianconi <lorenzo@kernel.org>,
	Ryder Lee <ryder.lee@mediatek.com>,
	Shayne Chen <shayne.chen@mediatek.com>,
	Sean Wang <sean.wang@mediatek.com>, Kalle Valo <kvalo@kernel.org>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Jonathan Cameron <Jonathan.Cameron@huawei.com>,
	Peter Chiu <chui-hao.chiu@mediatek.com>,
	Daniel Golle <daniel@makrotopia.org>,
	Frank Wunderlich <frank-w@public-files.de>,
	Alexander Couzens <lynxis@fe80.eu>,
	Sujuan Chen <sujuan.chen@mediatek.com>,
	Bo Jiao <bo.jiao@mediatek.com>,
	Nicolas Cavallari <nicolas.cavallari@green-communications.fr>,
	Howard Hsu <howard-yh.hsu@mediatek.com>,
	MeiChia Chiu <MeiChia.Chiu@mediatek.com>,
	Johannes Berg <johannes.berg@intel.com>,
	Wang Yufen <wangyufen@huawei.com>, Lorenz Brun <lorenz@brun.one>,
	linux-wireless@vger.kernel.org, netdev@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Subject: [PATCH v2 1/2] dt-bindings: net: wireless: mt76: add bindings for
 MT7981
Message-ID: <0f04fcc9f81cd15a8ee2a9194cf95f2b924ef299.1684155848.git.daniel@makrotopia.org>
References: <cover.1684155848.git.daniel@makrotopia.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cover.1684155848.git.daniel@makrotopia.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230515_062905_780069_B2D70CA1 
X-CRM114-Status: UNSURE (   8.75  )
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

Add mediatek,mt7981-wmac compatible string entry.

Signed-off-by: Daniel Golle <daniel@makrotopia.org>
---
 .../devicetree/bindings/net/wireless/mediatek,mt76.yaml          | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/net/wireless/mediatek,mt76.yaml b/Documentation/devicetree/bindings/net/wireless/mediatek,mt76.yaml
index 67b63f119f64..9081731611ef 100644
--- a/Documentation/devicetree/bindings/net/wireless/mediatek,mt76.yaml
+++ b/Documentation/devicetree/bindings/net/wireless/mediatek,mt76.yaml
@@ -28,6 +28,7 @@ properties:
       - mediatek,mt76
       - mediatek,mt7628-wmac
       - mediatek,mt7622-wmac
+      - mediatek,mt7981-wmac
       - mediatek,mt7986-wmac
 
   reg:
-- 
2.40.1


