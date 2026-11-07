Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AF87D606D837
	for <linux-mediatek@archiver.kernel.org>; Sat,  7 Nov 2026 14:54:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=RThal5cn;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=gwfuwu8E
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Cc:To:In-Reply-To:References:Message-Id:
	Content-Type:MIME-Version:Subject:Date:From:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=SCSNncZb6gAvUHL12mxyJu+NPT2Q1zvEWGLqdpdMtDU=; b=RThal5cnhCfaa5vY5KykZ/mKZA
	eAx2aUtK3sZ0D+E2fnOI0qefO4TmOScqn8sp55gS5ZwQzE+6gdiJXj7fRz/CGqOd4HXfunLNPPZnV
	2Q2ljDOBbbRr0CQFBr6p6bhXiY65s7ZSlhsowkAXk4appHprXx9XsKh73+RfAX3Mzf5yN9uyVnzHP
	jREvkpu2GpPj02D8J+Pr3CXwxxDvTcErH4VeFQ5fzQ1h2ZeQ/d/kAVfYAtFXMZacyR2Uj7qlo4ufM
	YONtK4eEugHMSxPs9BssHNELym1+2LzATdOXjuAZdqvD4DWXxe25W8VeZW2kCmbpvu3Re49gqHL0e
	+QYRBKQg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xPhod-0000000ErSG-1Wvn;
	Sat, 07 Nov 2026 14:54:47 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xPhoc-0000000ErRR-0NtT;
	Sat, 07 Nov 2026 14:54:46 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 4679360D0F;
	Sat,  7 Nov 2026 14:54:45 +0000 (UTC)
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1794063285;
	b=S9QmgNjCd7imTlhfSc+11/lEAHdGxcWcszJg7qcczvD9rY2O4Jw6mJuly0SWS436kR2A
	 /GOKqXaA8zuX5iWJu5Axob6SIEP2AM6amsr24IEuIqQF0jtvoXv33Ag/Jj6kAmsAkhJI3
	 ydoEPr7SJYyxtgTcZ7BcK+xR0dJUvB/SVIAaOodG4LaIrxj2Ga+L54635+4qsmnybhfNi
	 1CA267DkMTCpcRM9FZuv6Caeqz0Yddq7S3VXFrc/Z4r0r+a2ARceunyjG9omdgG8AP920
	 6o0BP3xUfOu1u230JBh21PK8X5ZP/8RgE/+44+OhBXXYrSfcJDT2P747KE+JsKfPFog==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1794063285;
	h=DKIM-Signature:Received:From:Date:Subject:MIME-Version:Content-Type:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=SCSNncZb6gAvUHL12mxyJu+NPT2Q1zvEWGLqdpdMtDU=;
	b=HaIeMCIf5CdXL3ETSqvRnZyYE/3LO4907XPTc+iJjEgXP/eZHmhlNhgWt55CQyHqRnZA
	 PMJuknBG4W/ggoVsrkeaACcYsl2u2vRNSgr2s3Krcj0EJC0VR1aLnTnVPNHK2BTd95jcF
	 yg5qzZ6yv0tRFr/xu9CU0pyBq/oi34Y3395Ey/EX2QjyR3FOH/rh1XQhZ5/k26eBDTxxK
	 7ns6XogDF+P3amo00J0nhGFqtRhBMDTXMPHwEsI5FzuVs/gzZcS0IR/04HKKWr2aa/paI
	 v2nM7fWKbLy9V4uNll0Egs31q9zI+HfwZh+lN9/Vqoti5Ydg4uCc9wlV38O7WKJgO7w==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 707C31F008A3;
	Sat,  7 Nov 2026 14:54:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794063284;
	bh=SCSNncZb6gAvUHL12mxyJu+NPT2Q1zvEWGLqdpdMtDU=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To;
	b=gwfuwu8EKLyTD9sruuX0I5EotzL1B2BxsQrnrM2HsiU2NmvjPwZ4ZgSNeyNE9vvzz
	 WGMyI0VcYlqCqA0yl+veF88OYASr8jAsITz30ygCrt6oYh7/hvRxRisQD+p2KTmymk
	 KWsFQUi6Cj162U03JtDeN87rYitWHwx3YUDzuOe3YbU/atT43QgifeMpt6z6DfS3SL
	 GK3Mxp+NIiFF6/tKvm2hJFQTSgjx7STxw27rFoVXGn6Ch1dnG/aeGP9rkML1siMMaE
	 0yK1d5Ut3rKBO8EuSLrR2TPBg0dJzIEWH8UGgwyV3pZinskUkzDunYlaS+8fZ2Rnfv
	 b2CwJ0Zhwibbg==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id 00DDC47C3E;
	Sat,  7 Nov 2026 14:54:44 +0000 (UTC)
From: Roman Vivchar via B4 Relay <devnull+rva333.protonmail.com@kernel.org>
Date: Sat, 07 Nov 2026 16:54:42 +0200
Subject: [PATCH v3 1/3] dt-bindings: usb: mtu3: add mt6595
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Message-Id: <20261107-6595-mtu3-v3-1-f36bc569cb47@protonmail.com>
References: <20261107-6595-mtu3-v3-0-f36bc569cb47@protonmail.com>
In-Reply-To: <20261107-6595-mtu3-v3-0-f36bc569cb47@protonmail.com>
To: Chunfeng Yun <chunfeng.yun@mediatek.com>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: linux-usb@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-mediatek@lists.infradead.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Roman Vivchar <rva333@protonmail.com>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794063282; l=938;
 i=rva333@protonmail.com; s=20260510; h=from:subject:message-id;
 bh=6lNL8+H5yPn87h4OAqJ4JTDlIkabDJzqSIYmECK+Ohw=;
 b=11NQyOkxtXUeokO0Et/HXlv+SYZRAi1hV9g4eL0CVQdE+MqaOsnHiZuF31wHhipK08FhbRIh3
 VG62KWmULOaD48GOreLtoULia+8lBqD3ro6vw07hugciqa8P5BpCKS2
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

Add a compatible string for the MTU3 IP found on the MediaTek mt6595 SoC.

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Signed-off-by: Roman Vivchar <rva333@protonmail.com>
---
 Documentation/devicetree/bindings/usb/mediatek,mtu3.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/usb/mediatek,mtu3.yaml b/Documentation/devicetree/bindings/usb/mediatek,mtu3.yaml
index 21fc6bbe954f..4538df164a16 100644
--- a/Documentation/devicetree/bindings/usb/mediatek,mtu3.yaml
+++ b/Documentation/devicetree/bindings/usb/mediatek,mtu3.yaml
@@ -22,6 +22,7 @@ properties:
     items:
       - enum:
           - mediatek,mt2712-mtu3
+          - mediatek,mt6595-mtu3
           - mediatek,mt8173-mtu3
           - mediatek,mt8183-mtu3
           - mediatek,mt8186-mtu3

-- 
2.56.0



