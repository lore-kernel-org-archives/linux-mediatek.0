Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1EDADFD3775
	for <linux-mediatek@archiver.kernel.org>; Wed, 25 Feb 2026 16:36:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Subject:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Cc:To:From:Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=XX4ai7/kA1JrfXNrpCNkIDlOwikwomvibsgv25K1pKk=; b=T36amTsG6sbZn+OxiAg9GL2XEF
	bgJSkEbxkz7WPq5DAhZZmoFe28RXSihD5UsqqTgyX325p1T9d9aSBGSKbTSpjVP1ahh5bGiLFTifP
	UI/luvURoHEGk4WiHgrIZUoCiR98G8gcdMDEf2nrL2wc6Bg84uM3t0dKf5cmOZQIAlOf0umnjNnDp
	LN6aoQ2ahH3DYkUSFzfJagIyD5IMeRuXwX70uDQlyUsdw2OGbvETH/rcknHr9e2UX9HXMhJAYJD3R
	oCzn1mIT9gfKrMn96wWZdFRirTiNmKa4P9IDpOB6IVfo2w/u9JLr/V/wYUjAVg9zWWBPZlSAQoFfM
	xbCRkcyQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vvHrz-00000004XHq-1MQY;
	Wed, 25 Feb 2026 16:36:15 +0000
Received: from mail.hugovil.com ([162.243.120.170])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vvHrr-00000004XEn-2k9V;
	Wed, 25 Feb 2026 16:36:10 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=hugovil.com
	; s=x; h=Subject:Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Cc:To
	:From:subject:date:message-id:reply-to;
	bh=XX4ai7/kA1JrfXNrpCNkIDlOwikwomvibsgv25K1pKk=; b=qbVbDMbq62dN6kBqo/s705o8sx
	MZVlDbsGuEoTefCcVIgHXONFOu3LqIOFWHL46zDjckzqVeoYAaHLTnfwZR+iXEf8zwEv1RHL+y/IU
	7aSB40UbxE+u5IwPBPtbw5b2zmmpJ2aAX7ZSbNdx6LBEJwveQ0cbjX8EZnZWvFV6Bsm4=;
Received: from modemcable168.174-80-70.mc.videotron.ca ([70.80.174.168]:47746 helo=pettiford.lan)
	by mail.hugovil.com with esmtpa (Exim 4.92)
	(envelope-from <hugo@hugovil.com>)
	id 1vvHDL-0005uT-9J; Wed, 25 Feb 2026 10:54:15 -0500
From: Hugo Villeneuve <hugo@hugovil.com>
To: robin@protonic.nl,
	andy@kernel.org,
	geert@linux-m68k.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	dmitry.torokhov@gmail.com,
	hvilleneuve@dimonoff.com,
	mkorpershoek@kernel.org,
	matthias.bgg@gmail.com,
	angelogioacchino.delregno@collabora.com,
	lee@kernel.org,
	alexander.sverdlin@gmail.com,
	marek.vasut@gmail.com,
	akurz@blala.de
Cc: devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-input@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	hugo@hugovil.com
Date: Wed, 25 Feb 2026 10:53:59 -0500
Message-ID: <20260225155409.612478-3-hugo@hugovil.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260225155409.612478-1-hugo@hugovil.com>
References: <20260225155409.612478-1-hugo@hugovil.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 70.80.174.168
X-SA-Exim-Mail-From: hugo@hugovil.com
Subject: [PATCH v3 2/4] dt-bindings: input: add settling-time-us common property
X-SA-Exim-Version: 4.2.1 (built Wed, 08 May 2019 21:11:16 +0000)
X-SA-Exim-Scanned: Yes (on mail.hugovil.com)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260225_083609_875205_F9627A97 
X-CRM114-Status: GOOD (  12.20  )
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

From: Hugo Villeneuve <hvilleneuve@dimonoff.com>

Add common property that can be reused by other bindings.

Signed-off-by: Hugo Villeneuve <hvilleneuve@dimonoff.com>
---
Note: a similar property is used by gpio-matrix-keypad.yaml:
  col-scan-delay-us
---
 Documentation/devicetree/bindings/input/input.yaml | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/Documentation/devicetree/bindings/input/input.yaml b/Documentation/devicetree/bindings/input/input.yaml
index 502e0b7eb500..14652d324e2c 100644
--- a/Documentation/devicetree/bindings/input/input.yaml
+++ b/Documentation/devicetree/bindings/input/input.yaml
@@ -66,6 +66,14 @@ properties:
       reset automatically. Device with key pressed reset feature can specify
       this property.
 
+  settling-time-us:
+    description:
+      Delay, in microseconds, when activating an output line/col/row GPIO
+      before we can reliably read other input GPIOs that maybe affected by this
+      output. This can be the case for an output with a RC circuit that affects
+      ramp-up/down times.
+    default: 0
+
 dependencies:
   linux,input-type: [ "linux,code" ]
 
-- 
2.47.3


