Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 23E97606A693
	for <linux-mediatek@archiver.kernel.org>; Thu, 26 Nov 2026 12:41:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=ZK6za+FB;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=CjWcARKN
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Cc:To:In-Reply-To:References:Message-Id:
	Content-Type:MIME-Version:Subject:Date:From:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=SjpbVUORvM/BvTGUVTvdLM0c2sbh4H3tlWX7jQXZfu8=; b=ZK6za+FBsM7nH2Bgm7WgzaFHx0
	LFxeD6yVWfh0x0ICacomKpatxqPy1EA7GuACb8zXuzEBIVrJXPWk7vHkypGd6kk91s4y+4T8og9PK
	9EotnUrrwOCXTJ7yBFrMPtZ4FPDpYtwaZdfRNdAfNC+e6VO9ybIf97RksuV5fDuEHGU3scvUNsGm0
	T+SdzZoPNSd9CGSGHwFldQS4tnsF41YJBM7/GOVOXGNGXAOB+8HLDlx7qg+5C8hfAyS94fnIogJCl
	GFmMrB6KiBIcKgFCMTcoqGUlkWqjPQhjAtWMkFQw7rmC42e4VV5Raj7oKH4UAbTwhfDSN4t5WCFz9
	bF9JSmVw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWYn9-0000000DBHs-3N04;
	Thu, 26 Nov 2026 12:41:35 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWYn3-0000000DBDT-04Yg;
	Thu, 26 Nov 2026 12:41:29 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id C24B0446C8;
	Thu, 26 Nov 2026 12:41:28 +0000 (UTC)
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1795696888;
	b=B/YGZW6qt/dse5Qm44wHNb5Zy4+ayAg4ULVZC0DfEFK36Hyvoe7dnFHi+ieP4IG3dltH
	 rFCzssk/duBCbfDpvV77BSGDS8WEOLwVplkTpz0gTu8FAhOgVZ3AP94HH/3KajnKy02M7
	 v1gmeeM2w4xACwWR36ToOS07h/0hL2CS6qdrypPbexEcQzPkgawtrLn5cSTlpFukRMKQd
	 wzou6XnNKnO2PuBZiH7yK5PIRtOkdWvpNuH4bVMQ1wyxtExFK0TdmZoh9/i/+041lZoK8
	 DRXUyjwiHgS7b+p2iwjS/sSEeCLRRt2gNECPV8QwJsjh2tNpO1Af/9fzHvEdmnMWfIA==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1795696888;
	h=DKIM-Signature:Received:From:Date:Subject:MIME-Version:Content-Type:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=SjpbVUORvM/BvTGUVTvdLM0c2sbh4H3tlWX7jQXZfu8=;
	b=e1pFeP/xJjiKiMOgJHojJsYuJ01dfz+VEYJVoB/DsFoH/Ip9OnJQGmLPfnn6tAl+GMhC
	 JZFOpncx47PX/4TYmB7uityhszqr632B4N5gqNLP7JQG0d0kBfFXYjUVIPoq3m2EoJwRg
	 W7JCdnsDIXyS3ZoRtXT8HV1cEaoka+mnrIi2hJKijAmwPmthMej8dgVou8zA7nl9suFws
	 NJHRMdNMkwzj2WtRdxEbwSHChyJUIONckOnhljDiyxetJQL9qryMMdwh5LMpon30eh20W
	 QK5ATOP1hfeyTt6JA8+iWVQ67+NFomUutWkpvOXD7XvOVFutxsSH6w8Oi/G+GzL8j9g==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 59A8B1F000D1;
	Thu, 26 Nov 2026 12:41:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795696888;
	bh=SjpbVUORvM/BvTGUVTvdLM0c2sbh4H3tlWX7jQXZfu8=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To;
	b=CjWcARKNeEVD9vkxQCIrtJkKAAf0qNiZSUJjhIlUNJbCST+3OxmrKTuvNKOzpOgBt
	 enp6zj+cTw0EUpXqLpJlSUSEM4E87rxwauIJxUGoBrGQ2zsOGJ6npPr/9QFvSel/j5
	 dNXUJh/BEET0zZ7qU3f6SA4y4iDeiB//ZuK5jvC7SW1mDqjghbfzHYIYi2pO+EtNEV
	 CXs2mvqzG55FIdCHUuLRI9hUZadYYprXKOHQYMZeFCE5+sh52HBoPKNUdGwF4DPgy+
	 0QgQ3QeU2l09xpHBdEeTn5O/AYCuKFkOTI40SoQqoCJK9dT5Pi4aFN4vs0i0FGUJ9r
	 ygraw5M2Ehu0Q==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id DCF3E4D4D4;
	Thu, 26 Nov 2026 12:41:16 +0000 (UTC)
From: Roman Vivchar via B4 Relay <devnull+rva333.protonmail.com@kernel.org>
Date: Thu, 26 Nov 2026 14:39:57 +0200
Subject: [PATCH 4/8] dt-bindings: timer: mediatek,timer: add mt6768
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Message-Id: <20261126-6768-init-v1-4-abc364a2447e@protonmail.com>
References: <20261126-6768-init-v1-0-abc364a2447e@protonmail.com>
In-Reply-To: <20261126-6768-init-v1-0-abc364a2447e@protonmail.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Sean Wang <sean.wang@mediatek.com>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Jiri Slaby <jirislaby@kernel.org>, 
 Wim Van Sebroeck <wim@linux-watchdog.org>, 
 Guenter Roeck <linux@roeck-us.net>, Philipp Zabel <p.zabel@pengutronix.de>, 
 Daniel Lezcano <daniel.lezcano@kernel.org>, 
 Thomas Gleixner <tglx@kernel.org>, Radu Rendec <radu@rendec.net>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
 linux-serial@vger.kernel.org, linux-watchdog@vger.kernel.org, 
 Roman Vivchar <rva333@protonmail.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795696875; l=826;
 i=rva333@protonmail.com; s=20260510; h=from:subject:message-id;
 bh=NGd4Hn7heos5qVJtPfP2QH/SqVPqRmKe6GXcwrzmpug=;
 b=oPyw04jky2NZuEhsSdV3OT8f3GZczlDvO+TDel/JKhmlkL8yyK3t5Q5w3hhtkmmc0JkNgmcJp
 O90A7Zt7EkyCWHzlDnB0+GfxqsFeuQoi23yUuZYtF1sdV0MFBGQbSbG
X-Developer-Key: i=rva333@protonmail.com; a=ed25519;
 pk=zww/nWjBGoQ4POXCG0BV6fx2iuXK6jx77rsKPA5YK5Y=
X-Endpoint-Received: by B4 Relay for rva333@protonmail.com/20260510 with
 auth_id=777
X-Original-From: Roman Vivchar <rva333@protonmail.com>
Content-Transfer-Encoding: 7bit
X-BeenThere: linux-mediatek@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-mediatek.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-mediatek/>
List-Post: <mailto:linux-mediatek@lists.infradead.org>
List-Help: <mailto:linux-mediatek-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mediatek>,
 <mailto:linux-mediatek-request@lists.infradead.org?subject=subscribe>
Reply-To: rva333@protonmail.com
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
X-Spam-Status: No, score=-16.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	FREEMAIL_REPLYTO_END_DIGIT,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

From: Roman Vivchar <rva333@protonmail.com>

Add a compatible string for the mt6768 systimer that is compatible with
the mt6765.

Signed-off-by: Roman Vivchar <rva333@protonmail.com>
---
 Documentation/devicetree/bindings/timer/mediatek,timer.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/timer/mediatek,timer.yaml b/Documentation/devicetree/bindings/timer/mediatek,timer.yaml
index 337580dc77d8..6abb62145621 100644
--- a/Documentation/devicetree/bindings/timer/mediatek,timer.yaml
+++ b/Documentation/devicetree/bindings/timer/mediatek,timer.yaml
@@ -40,6 +40,7 @@ properties:
       # SYST Timers
       - items:
           - enum:
+              - mediatek,mt6768-timer
               - mediatek,mt7629-timer
               - mediatek,mt8183-timer
               - mediatek,mt8186-timer

-- 
2.56.1



