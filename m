Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 34FC3C6FA86
	for <linux-mediatek@archiver.kernel.org>; Thu,  8 Sep 2022 19:35:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=8Pwq4EHxPkJegWDPryip04mxxSdIcKdjU6VWGi7ffIo=; b=1iiQS5LL9V8rrVFrdLDG0ZAOwj
	MDnTJMsAaVNEluUAYt6UiyI4IGUyr7WnLW4GHjUCc4Vz2ZF0jatkXHJrNUQ4Qyd99ocj4ElKY0RV/
	RaHCTjWv05bE0cNMTTq8DPlkhiHtjM6X1gx/OyuaP+rUsTnRZxWPrrKb67He82i1uOlKF3nqMyhii
	NYqs5JWRMgnJG21XXD24aD8aHCJKrqXMEoce565EUbCx8fiiiyBxPR2+GsKzUaqDTjoGv9BLh10lH
	1z1ylygNpt63crB5Ze+WQ5T48ufIaS8hTz/fts/wLK6RwAfPvjRMgqQF3Yxbzoag8og+sArpDkEYP
	Gjc7/L2g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oWNIw-007gwo-Ms; Thu, 08 Sep 2022 19:35:14 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oWNIr-007gso-7Q
	for linux-mediatek@lists.infradead.org; Thu, 08 Sep 2022 19:35:12 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id C8CB361E00;
	Thu,  8 Sep 2022 19:35:08 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0FDD2C433D6;
	Thu,  8 Sep 2022 19:35:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1662665708;
	bh=mzm5L4CAPDFUvFpZmOoeFfGUUflQPsc++RkAX676KYM=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=UpThxICq2otDlIIYFawQj8gPWRjBrQ5CS2MOSsvhqNQ33MpTBSPvEjcwUuoJSzGZt
	 kKIiRiIKu7k2q1nhbpWD0mHPs71LTY1pKityb2W6tUTR89Bp9SCSgUy/3Ho+aFTHEJ
	 tP7rYVVnld2MqbXjXrEpO4+LlUtdAXddu5UpOE9fqMpBCLoiheAgbUM2N+KStT4c6/
	 11wuoXWEH1JI8KaZ0BDTUYyIk8MYShCtNGIfzgb4VZiLIWsOXlSDu9J45j6mBem7Yy
	 9B4rRNEbWfmlaESOZ9eW5IE85nf07XjhlhewAnFodoZNHfpSf5IlTvE1X+Cn7SOVLf
	 1PMtrBTMaYN+Q==
From: Lorenzo Bianconi <lorenzo@kernel.org>
To: netdev@vger.kernel.org
Cc: nbd@nbd.name,
	john@phrozen.org,
	sean.wang@mediatek.com,
	Mark-MC.Lee@mediatek.com,
	davem@davemloft.net,
	edumazet@google.com,
	kuba@kernel.org,
	pabeni@redhat.com,
	matthias.bgg@gmail.com,
	linux-mediatek@lists.infradead.org,
	lorenzo.bianconi@redhat.com,
	Bo.Jiao@mediatek.com,
	sujuan.chen@mediatek.com,
	ryder.Lee@mediatek.com,
	evelyn.tsai@mediatek.com,
	devicetree@vger.kernel.org,
	robh@kernel.org
Subject: [PATCH net-next 02/12] dt-bindings: net: mediatek: add WED binding for MT7986 eth driver
Date: Thu,  8 Sep 2022 21:33:36 +0200
Message-Id: <e8e2e1134fde632b7f6aaf9d96feab471385f84c.1662661555.git.lorenzo@kernel.org>
X-Mailer: git-send-email 2.37.3
In-Reply-To: <cover.1662661555.git.lorenzo@kernel.org>
References: <cover.1662661555.git.lorenzo@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220908_123509_322035_F62D6F88 
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

Document the binding for the Wireless Ethernet Dispatch core on the
MT7986 ethernet driver

Signed-off-by: Lorenzo Bianconi <lorenzo@kernel.org>
---
 Documentation/devicetree/bindings/net/mediatek,net.yaml | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/Documentation/devicetree/bindings/net/mediatek,net.yaml b/Documentation/devicetree/bindings/net/mediatek,net.yaml
index f5564ecddb62..0116f100ef19 100644
--- a/Documentation/devicetree/bindings/net/mediatek,net.yaml
+++ b/Documentation/devicetree/bindings/net/mediatek,net.yaml
@@ -238,6 +238,15 @@ allOf:
           minItems: 2
           maxItems: 2
 
+        mediatek,wed:
+          $ref: /schemas/types.yaml#/definitions/phandle-array
+          minItems: 2
+          maxItems: 2
+          items:
+            maxItems: 1
+          description:
+            List of phandles to wireless ethernet dispatch nodes.
+
 patternProperties:
   "^mac@[0-1]$":
     type: object
-- 
2.37.3


