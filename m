Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8E4C2C43219
	for <linux-mediatek@archiver.kernel.org>; Sun, 30 Jan 2022 14:51:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=bwuxtg7i6NEhnaRHo5SmsG5uE/+ivX6DIe/FPQUY6ow=; b=Qn0QsO3vOS1ocv
	gUuKuZI+gMnjmLRK/+R3rAsz9+ewVmBwVyJjdHBJ/+tg5of7Es6xdlCm6hGYQrED0MNxJjDA+ctkt
	y+GZst4SwA92+w2zg6qkJc9F4e2w1iYHJtYtfQMD7WqcskmJAq0zpI8X9+tmEr57ulvfKSQOsCX76
	JIMToBgz+2iden/2elM89tGpGw7xpg+iNpw79OP26dVbPf4jX+k4mRLhRqKdgAqZdYqvzbkI/Ke+X
	7JJIMJTjlLJCq6Y9FgwiR7IAQkVLvgWNAx+vgIKJCSkjlFgJ/zTG+b8PpLGpWvT9c9LRnI5S948O4
	/U/lM3QcFXgsT9nlUwKQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nEBYD-006j1n-Fn; Sun, 30 Jan 2022 14:51:33 +0000
Received: from nbd.name ([2a01:4f8:221:3d45::2])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nEBYA-006izC-Lo; Sun, 30 Jan 2022 14:51:32 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=nbd.name;
 s=20160729; h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:
 Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=zuMwAtKwAKhJ6tXZBjnRsIGNnEtjFz5TcgOQeseaIuU=; b=TpGpl+qIhYbRJ8YgeIL99jdLaD
 978oeCUO2qrlfL0ky06yQ84S2IpANUgN+pSAclofFi06hZc8MwPO0SUCtyVA4O275Ikc9VKmWK/jj
 0asZ+KNcWbihH9xgs4JY57P521xgy5OFopVSVynroTkJArMX5uQ0J9vWEjDOrT+xqfgY=;
Received: from p200300daa716f900d40f7dfd86c385e0.dip0.t-ipconnect.de
 ([2003:da:a716:f900:d40f:7dfd:86c3:85e0] helo=Maecks.lan)
 by ds12 with esmtpsa (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.89) (envelope-from <nbd@nbd.name>)
 id 1nEBY5-0002if-Do; Sun, 30 Jan 2022 15:51:25 +0100
From: Felix Fietkau <nbd@nbd.name>
To: Rob Herring <robh+dt@kernel.org>
Cc: soc@kernel.org, linux-mediatek@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org, john@phrozen.org,
 Rob Herring <robh@kernel.org>, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
Subject: [PATCH v9 01/13] dt-bindings: Add vendor prefix for Airoha
Date: Sun, 30 Jan 2022 15:51:04 +0100
Message-Id: <20220130145116.88406-2-nbd@nbd.name>
X-Mailer: git-send-email 2.32.0 (Apple Git-132)
In-Reply-To: <20220130145116.88406-1-nbd@nbd.name>
References: <20220130145116.88406-1-nbd@nbd.name>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220130_065130_960527_DD4CF530 
X-CRM114-Status: UNSURE (   7.41  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

From: John Crispin <john@phrozen.org>

Add vendor prefix "airoha" for Airoha, a subsidiary of MediaTek

Acked-by: Rob Herring <robh@kernel.org>
Signed-off-by: John Crispin <john@phrozen.org>
Signed-off-by: Bert Vermeulen <bert@biot.com>
Signed-off-by: Felix Fietkau <nbd@nbd.name>
---
 Documentation/devicetree/bindings/vendor-prefixes.yaml | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/vendor-prefixes.yaml b/Documentation/devicetree/bindings/vendor-prefixes.yaml
index eb8ab0d82198..d2f9fd7654bc 100644
--- a/Documentation/devicetree/bindings/vendor-prefixes.yaml
+++ b/Documentation/devicetree/bindings/vendor-prefixes.yaml
@@ -59,6 +59,8 @@ patternProperties:
     description: Aeroflex Gaisler AB
   "^aesop,.*":
     description: AESOP Embedded Forum
+  "^airoha,.*":
+    description: Airoha
   "^al,.*":
     description: Annapurna Labs
   "^alcatel,.*":
-- 
2.32.0 (Apple Git-132)


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
