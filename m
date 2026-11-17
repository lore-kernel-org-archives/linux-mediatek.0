Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 98ABE606A329
	for <linux-mediatek@archiver.kernel.org>; Tue, 17 Nov 2026 09:11:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=mMfGLLRQ;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=aAgl0hWT
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Cc:To:In-Reply-To:References:Message-Id:
	Content-Type:MIME-Version:Subject:Date:From:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=NNMKqJ6UJ2dmcZEN3dlZmd+hJqSDh3rdufx7kyBbe/s=; b=mMfGLLRQu6/uxREFw8mbqUY5jh
	u2AFOGodEDnp/JrxyhPREPddPVNs8O704UxvIuicXRQgzlQzeqwNl5rYKHWJRQkh1IH1aMYtDDAdo
	vZvAvMO7SyEL76nhxsov4JYxVQIdgX2hG1ktt3L0qNJHeVUffSFtYLyiGb0M4t0iBqUYgeDHL1Tia
	DZfvX1dn33r2xCGuGPrShJA/6nY8nVBac7zFKi04alkfN0JbeiedunBcnwmKf8JDYVt2alfRaBiM+
	6BI5SVhuS06ASQTfvLWNf4SxjZOHd5okEXNT91gR5GRGiBFTuxlE2IzT4FcXiUf5ArsHB5CtF3TSF
	2no+bLgQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTFEE-0000000526P-1NcJ;
	Tue, 17 Nov 2026 09:11:50 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTFE3-000000051si-3Sgw;
	Tue, 17 Nov 2026 09:11:39 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 916F546903;
	Tue, 17 Nov 2026 09:11:39 +0000 (UTC)
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1794906699;
	b=oQcX0ggSbWpCl3C1hUSV3rfJmDLRgw0G6T5X324YP/n8l70oyCINZNKI3Sp20R8aaj7x
	 cZ9JdBGcWaFLnTz4dHD7u2EFI7dTzzYKzHPfQ5N6pmkNJNvphiFROJqYtgU4XThPTiD6T
	 prnm7ZBoP8G2q0mY6miF/EQ4bGKP/wt+yeoSyeNuHB2yVzy2Rr9fOXb+0i3GtV091c9xh
	 xrQSUQSjdSrRx3KELDIntRho38cBnbRiY3qqIngn3UMpBieg+fZVgQ+JnXWmSQszRQOx7
	 jPE3WGZZTV1Hy+FHfuqpVmKRPBHIqoN7Z2w2PSpEKfCEuViG0l7K0wTon1IVl9uRceQ==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1794906699;
	h=DKIM-Signature:Received:From:Date:Subject:MIME-Version:Content-Type:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=NNMKqJ6UJ2dmcZEN3dlZmd+hJqSDh3rdufx7kyBbe/s=;
	b=KWssRM1Ol4a1jA77+pwawQvkP3Bkxlx5iQmFJUsL9sNnKnRD3FGgtBL5H1rR3YsYVAdK
	 EmkKoHyUFL4/uiBGSN7pvDF6HbynzSjfTmPNbOHgEsWS+Mvl5VCT7glQPa5pcImapeAen
	 zu9EJ1zMM0rPqFwHOhpr9d5plRiOp8BEREwpt6lD0guLvj1aoO/IQ6QSRUlm9/r/D8kDI
	 7cz8R7bun6o261lyee6cqyMDVKDDM4jsMN3M4U8+cCvzc4W0CpWlbzrGbsGedb+mfvTax
	 OW7lvZgd0jX5JoReY9r4o9GclWqKaseo8yieRDwJOgMAoeROTyU51/RyrDTuPYPN/8w==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id F097A1F000C5;
	Tue, 17 Nov 2026 09:11:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794906699;
	bh=NNMKqJ6UJ2dmcZEN3dlZmd+hJqSDh3rdufx7kyBbe/s=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To;
	b=aAgl0hWTf3SLHIGLcsnGNgkIH9I1I6CHe9MS9di9XtEkUvMzq+hbZmecSqM1y7vxC
	 O3B7YB2LB2S+JBIpCuUEbq8fLZysnlwKHfsuFh7toFVv6ox+pk+HYRCilupZUuOwk0
	 ePvMYFvs2cUZrBut0o0OhT+hxXe6O4tZVZ3dWCP2Ga8WZq3/MrrAddsyJS4cbcM0PG
	 nT78ETBpBnUUaDQtyS6IhgkxSOHh2EklWQ9Bx9XhGVWOFI68bCZgV19yGXd9I1Jjn7
	 ZcY5/2mMmqj27D3MbT89YZZv/ciEQeqC/csHZsJPC7UhGRSp3eWtZyH2O1KX5Pe0Ce
	 ujj20v7lRpt5A==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id 7545E4A77F;
	Tue, 17 Nov 2026 09:11:37 +0000 (UTC)
From: Rui Cao via B4 Relay <devnull+i.udp0.com@kernel.org>
Date: Tue, 17 Nov 2026 17:11:34 +0800
Subject: [PATCH v2 4/5] dt-bindings: serial: mediatek,uart: Add MT6833
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Message-Id: <20261117-mt6833-base-v2-4-058a0685c40c@udp0.com>
References: <20261117-mt6833-base-v2-0-058a0685c40c@udp0.com>
In-Reply-To: <20261117-mt6833-base-v2-0-058a0685c40c@udp0.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Sean Wang <sean.wang@mediatek.com>, 
 Wim Van Sebroeck <wim@linux-watchdog.org>, 
 Guenter Roeck <linux@roeck-us.net>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Jiri Slaby <jirislaby@kernel.org>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
 linux-watchdog@vger.kernel.org, linux-serial@vger.kernel.org, 
 phone-devel@vger.kernel.org, Roman Vivchar <rva333@protonmail.com>, 
 Rui Cao <i@udp0.com>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794906695; l=1044;
 i=i@udp0.com; s=20261107; h=from:subject:message-id;
 bh=zoWluHfjwKwOYFFQBfnTx5qN73W+HlpVvqafQNgPfPA=;
 b=eDdve851oWXnmkWyQaofzfoAylL5gfmwuRoCotgZ1xtomidX89d4PFye1wFlQr4F9h4oXxhuX
 doPhRybJD05CzSVy2ZzKIoImW47x6COPq+56AWYIaOogeUC7WpEsU02
X-Developer-Key: i=i@udp0.com; a=ed25519;
 pk=XZJKcKgnUUjjyw8KuKy7u2QeIX0JLY/L1Fxzwwje41w=
X-Endpoint-Received: by B4 Relay for i@udp0.com/20261107 with auth_id=1443
X-Original-From: Rui Cao <i@udp0.com>
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
Reply-To: i@udp0.com
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
X-Spam-Status: No, score=-18.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

From: Rui Cao <i@udp0.com>

Add MediaTek's MT6833 (Dimensity 700). Its UARTs are MT6577-compatible:
MediaTek's MT6833 device tree gives them "mediatek,mt6577-uart" alone.

Reviewed-by: Roman Vivchar <rva333@protonmail.com>
Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Signed-off-by: Rui Cao <i@udp0.com>
---
 Documentation/devicetree/bindings/serial/mediatek,uart.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/serial/mediatek,uart.yaml b/Documentation/devicetree/bindings/serial/mediatek,uart.yaml
index 5bd8a8853ae..8fb793c3408 100644
--- a/Documentation/devicetree/bindings/serial/mediatek,uart.yaml
+++ b/Documentation/devicetree/bindings/serial/mediatek,uart.yaml
@@ -34,6 +34,7 @@ properties:
               - mediatek,mt6779-uart
               - mediatek,mt6795-uart
               - mediatek,mt6797-uart
+              - mediatek,mt6833-uart
               - mediatek,mt6893-uart
               - mediatek,mt7622-uart
               - mediatek,mt7623-uart

-- 
Git-157)



