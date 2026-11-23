Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F0DCA606A32C
	for <linux-mediatek@archiver.kernel.org>; Mon, 23 Nov 2026 21:05:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=mCU+uK40;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=RSAnZpzF
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Cc:To:In-Reply-To:References:Message-Id:
	Content-Type:MIME-Version:Subject:Date:From:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=Nn8XLrzNz4MV6ZKmxBFEHE5Xi6QhkVPpHPZEGulMKls=; b=mCU+uK40W+IoE/QTCLOg5GOD9o
	L1IP0etIVwcEciNKjrOFfUbpbJiObQRfCBHs4kjmy1E6jMQvfGvg91tHJqQt4YY9b0RaymGsNk106
	W6p1Uf4E0WmpEzGJpsaO/GTDexaqLQWlhWPVw0Z1wPq42lQHOtuWZvQkR17g+zlSdgK2HZUQcJNS5
	1loBRbsh5LV6gtw7BDF34G5yjn8l4TOQ80PFSFQcBHAEe6TovIfwzkZ6i3YDur9hTFJoVpkSpRd2s
	ueJuWqF1Lbkp816/EssmanZnEFp42ZrtMDbhw8269u/mxR0pxgAyp6jGJ9Wm5v3e5oUCDXMOBQLZr
	A3V9hFRA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVbE3-00000004vQT-2gVa;
	Mon, 23 Nov 2026 21:05:23 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVbDu-00000004vMy-2UCC;
	Mon, 23 Nov 2026 21:05:14 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 14ECF43BF8;
	Mon, 23 Nov 2026 21:05:14 +0000 (UTC)
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1795467913;
	b=lIzAMfqp75NSe8sW+/QP2iE0RsJt7VGATGZkJYkPP/XwUw5VvNiXMN04viFCUKSZXlvD
	 ljusoiMFmLXEcqm8rUal0JIUC8bidFM0qXDmjuULQ9nk4Nr4aVLmgdMRoqgr0RAdaroIX
	 FYiSE2U5e9BN0AyWeqCB6QFRhoFoAjvoTkd9M5qWjdxLom9/Vl9rFeuB/3BaMxxlxuneS
	 kWVeUxk+X8K3IEisOExxn4/u2U+KT9qgZQptqVp/mv+/lWiJA6HoLx8Qx/kIUgBt4p43f
	 H7OdCA1vJnhcWpcdpZqwJLyNtVB8efdpxpMWRH0zuhvY0vtqNW5C0S09CWHdmB1TLMw==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1795467913;
	h=DKIM-Signature:Received:From:Date:Subject:MIME-Version:Content-Type:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=Nn8XLrzNz4MV6ZKmxBFEHE5Xi6QhkVPpHPZEGulMKls=;
	b=DTYdn3AfXjnenhFldkMU0aTeQGsPPd8psjZVFL71e31ed38GaSxq50Gp2E/8u4BVGg0e
	 heHvq16YXCwVGhRsX14yM6h14dTLfMC8EyAq/iZ+dgiWR5Wm5wOJbRTgHnaYrDMqbYDxz
	 sBURqyvLtRZtwvUDHxTtda26m8Yifh20K4CsAGazFs1YSChGORrUGkvHWnGaQ5jDG+b1R
	 IRG2np8J3AiX5HJMFS+soYU8uPDNJZsOMuiT59OpfhC/YrLZqBfqJOChJsZy+zj4FtD90
	 c52npu1YggWhSQk8+dUXitDN+GS4lm7Upl0QT8cGjckhl3NH7UjQyvwOziVoyQRGGeQ==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 781511F000CA;
	Mon, 23 Nov 2026 21:05:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795467913;
	bh=Nn8XLrzNz4MV6ZKmxBFEHE5Xi6QhkVPpHPZEGulMKls=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To;
	b=RSAnZpzFdtCdrzv7PbFvaQ0eBvHJ5KzOldtdWVXnS1qauU686KMKHa3Rx5TanVMk8
	 a5Hi+MWRshKZArA1+0KtYRnf60Jo4N240MZdm5LXqiYK6kbLEUcgwIBT49ypPzMVDq
	 GckT1RHOJZM0Y44V1wWp2ncSzsaDHHhfWrMANEKDlIe0vc0wTiyr6rZPZxNTDjduV/
	 0AvRse2zSkcDRzHeJGc+Kp2ZgTZVIWbF7vkuOfTb3z3ADUmk0D0jjY3APCeliNG/m3
	 KMHWDxiEd5mK37fRsJxYCTz3h+4YAJM9xssVt1Gu+o4yx2t6l/bGMVAPJE6dJJeQvb
	 jzLxJx0NfHifA==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id EE8E54C756;
	Mon, 23 Nov 2026 21:05:06 +0000 (UTC)
From: Roman Vivchar via B4 Relay <devnull+rva333.protonmail.com@kernel.org>
Date: Mon, 23 Nov 2026 23:02:31 +0200
Subject: [PATCH v6 1/4] dt-bindings: nvmem: mediatek: efuse: add mt6572
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Message-Id: <20261123-6572-nvmem-v6-1-7ba710b15657@protonmail.com>
References: <20261123-6572-nvmem-v6-0-7ba710b15657@protonmail.com>
In-Reply-To: <20261123-6572-nvmem-v6-0-7ba710b15657@protonmail.com>
To: Srinivas Kandagatla <srini@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Andrew-CT Chen <andrew-ct.chen@mediatek.com>, 
 Lala Lin <lala.lin@mediatek.com>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
 Roman Vivchar <rva333@protonmail.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795467904; l=1140;
 i=rva333@protonmail.com; s=20260510; h=from:subject:message-id;
 bh=XWZ7anlopbltit1BOL7l7aOzWGMbH7JgBsZxHbvvyuo=;
 b=gPDZzyYwzSqIUBMB6fmdsyxjhnT1Nm1yFrNGgTr3uKjP61joGKlVFqtzjPSX2DlP1bcMr6LO7
 e2sSCiLvthTAJsJoIMe4MtJB1q2nuA1FNzrdAHlFUH0m3mN39gAXppz
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

Add a compatible string for the mt6572 SoC efuse controller.

Reviewed-by: Rob Herring (Arm) <robh@kernel.org>
Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Signed-off-by: Roman Vivchar <rva333@protonmail.com>
---
 Documentation/devicetree/bindings/nvmem/mediatek,efuse.yaml | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/nvmem/mediatek,efuse.yaml b/Documentation/devicetree/bindings/nvmem/mediatek,efuse.yaml
index f9323b3ecfc8..e10947164941 100644
--- a/Documentation/devicetree/bindings/nvmem/mediatek,efuse.yaml
+++ b/Documentation/devicetree/bindings/nvmem/mediatek,efuse.yaml
@@ -24,13 +24,16 @@ properties:
 
   compatible:
     oneOf:
+      - enum:
+          - mediatek,mt6572-efuse
+          - mediatek,mt8186-efuse
+
       - items:
           - enum:
               - mediatek,mt8188-efuse
               - mediatek,mt8189-efuse
               - mediatek,mt8196-efuse
           - const: mediatek,mt8186-efuse
-      - const: mediatek,mt8186-efuse
 
       - items:
           - enum:

-- 
2.56.1



