Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 026FECD37B0
	for <linux-mediatek@archiver.kernel.org>; Mon, 18 Sep 2023 10:30:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=vofQeiO5qK8L0KPjIe1dNHSpsi11GuP/nYaDkXkjYoA=; b=cZOHwM6rUYNjUcD7D47IIqcORj
	nh5sRyAmhjmIlZSB6wBeTrkDdambbVu74Om0w5eXYfz0ygLrRlVTjmioeyCILporNi2/EDGkTsMK5
	qbG3DbTrIB2BLDzEIPUH4ck2O66PHt+Gw+JJgbxdRAK0SweAuhlvYGzUs5x8I/H75fjid5f7FtrFF
	UdQQCyBVm2PTTprFFTjkSZBc9Tb5NBCRuORhgTRoHVHWyyjtJstU+ZLYSdhCE/cYqJv5ZlS/QvQnL
	PyPH3zZefZzFrzFVDJ7vuZQ9kv5baI+70MnumiTh8Z9TKtth3fkt9EIzPpo1dwn0lvcL6kHfQa+hi
	XmzprPDQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qiBVw-00F7k0-2s;
	Mon, 18 Sep 2023 10:30:00 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qiBVu-00F7iI-32
	for linux-mediatek@lists.infradead.org;
	Mon, 18 Sep 2023 10:30:00 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 64B0361086;
	Mon, 18 Sep 2023 10:29:58 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 76923C433C7;
	Mon, 18 Sep 2023 10:29:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1695032997;
	bh=zT/VqPIJgqnrap3GKwzfg3wRyyyaBajlc9TMmjJ9FgY=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=tY57RlMqWG0XaYJxZj60FxrXKxMACozrz9XSzD64kBZ2QFRgmFgI3U0O/3pI1hXeb
	 /Zmn7lzfTMpjQaJplyTdmyuMYpUFBDHbjYQVE8lecRJc3AJALJaR+e2HMXdSLlLgd4
	 MWAEn3uKxCP+QL5Z/kHdxTJ2UCAa8Wo91TO+AFNYyzxvIq3od7AwMQCJoZMM+NXoOE
	 y1zcj9fzIEHtXd/RNBUzpEShZjXqsubWukAM+bcznQWuEfTsg5PyRG2krFza+z5ImP
	 6MNlzE3CQZPEZEyU5+MY/OdYc02T/eyyU30Ang/jCBhDH+3q6mf8ZfULzBPu3iLgaR
	 Qy1wZwF6l2Kdw==
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
Subject: [PATCH v2 net-next 01/17] dt-bindings: soc: mediatek: mt7986-wo-ccif: add binding for MT7988 SoC
Date: Mon, 18 Sep 2023 12:29:03 +0200
Message-ID: <771d7b43e4b5698bc0cf684533537998b22690d8.1695032291.git.lorenzo@kernel.org>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <cover.1695032290.git.lorenzo@kernel.org>
References: <cover.1695032290.git.lorenzo@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230918_032959_020000_A8F650C7 
X-CRM114-Status: UNSURE (   8.27  )
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

Introduce MT7988 SoC compatibility string in mt7986-wo-ccif binding.

Acked-by: Rob Herring <robh@kernel.org>
Signed-off-by: Lorenzo Bianconi <lorenzo@kernel.org>
---
 .../bindings/soc/mediatek/mediatek,mt7986-wo-ccif.yaml           | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/soc/mediatek/mediatek,mt7986-wo-ccif.yaml b/Documentation/devicetree/bindings/soc/mediatek/mediatek,mt7986-wo-ccif.yaml
index f0fa92b04b32..3b212f26abc5 100644
--- a/Documentation/devicetree/bindings/soc/mediatek/mediatek,mt7986-wo-ccif.yaml
+++ b/Documentation/devicetree/bindings/soc/mediatek/mediatek,mt7986-wo-ccif.yaml
@@ -20,6 +20,7 @@ properties:
     items:
       - enum:
           - mediatek,mt7986-wo-ccif
+          - mediatek,mt7988-wo-ccif
       - const: syscon
 
   reg:
-- 
2.41.0


