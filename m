Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 075A9606A33E
	for <linux-mediatek@archiver.kernel.org>; Sat,  7 Nov 2026 12:22:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=uJzeoEXj;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=SNd3B3A4
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Cc:To:In-Reply-To:References:Message-Id:
	Content-Type:MIME-Version:Subject:Date:From:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=iq+4RPE8xfBkVGXWnIB8K+YFPH7w7Lo6KEQ8N9HLzTs=; b=uJzeoEXj92E6d5wyNxcfMyiyyC
	wxxvzHasMCee5O59FNFRDb8DLLBzMLh3wHYX4NVSHI4YiBgvEBpjZViyJ+lLzskMasY07nYqT7oH+
	crBp/8ppKT4WDDmhQcuOD66lNCVRp377OGM19FAIa2P2JbgaWRhmHQOXfI/UG7U9vWhnjGWFNR0RM
	kF4HYB57IBugpWcQcdJlSVUcUORUiHkEi8Ez5WLgbU5Z3cGIQ2UvVUdpbO70pj6MBibUpd8m+u8fx
	AHHLvCHzGdUm6B/q2HFb5yF3Ces1Bv3mwUWnDGSFZjQOgrxmJBm2NqAuQTWt9CZj4oHsq+0wRwkzm
	j6U8zxPw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xPfQv-0000000EepC-2vAY;
	Sat, 07 Nov 2026 12:22:09 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xPfQr-0000000Eem7-05eC;
	Sat, 07 Nov 2026 12:22:05 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 8C47F43E5C;
	Sat,  7 Nov 2026 12:22:04 +0000 (UTC)
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1794054124;
	b=n/arFKVIHv4S3V8jLEODYsSauHO3kDnBZZAyglGBUsF7+QofC7yQCOvfyx1+1V096/Uo
	 zDaSfYcRipDBia8pERZotxoBba7BJBqRodLf83HNO87ai6W6TVLrbR15pwP5WSV3BctVj
	 CBHf91tB6b4OeH7cxMX1FtyKZdviERdRZW2+hPsoxRwsEzlb9GS5Tjcb/Ec4zuSGT/dJc
	 2nSDgBzGqQdnh2Xr4NBI/XXsrb75fFyHbz40VCDP/hLXmftEa5AJXZtnNQGGpNa9p6DGV
	 6lTWow3o0XZnT2Zj5cvw6s4+1EWseunRMQlURrLztFSMGWSSXbD5U4wMy5xTJWfmACw==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1794054124;
	h=DKIM-Signature:Received:From:Date:Subject:MIME-Version:Content-Type:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=iq+4RPE8xfBkVGXWnIB8K+YFPH7w7Lo6KEQ8N9HLzTs=;
	b=brge581lxYt/QtNSYelcba8XtOpPEEUdVdNf592PktpB6tuDTTJk/Iyfsu/sL4ujU/fh
	 Y2drfn++7Tpk6Zh+FkJENIXxVFQjx3HLCLY5HzzmSatB+slXfnhm5AC+im6Vy8ClwLud1
	 dkO9o0IDCJtk/X84l+JHL3ZkStjqNWsVCFqcqd0D+B9NnA1R2HRn11d7IMhJPfZZPuXdf
	 uly/aO2mElOZiYsx9uwJeWrpBxkwP2Boy1aPGEiGBhRXkyFonB/qVfU4O+KcOt0GsBLWx
	 56FgbGoddob0R+WA68cOskrzbVy62rLfJeAh2LntknxZYZ+jHlR/U19qrHrRnw+w0bA==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 69EED1F008A3;
	Sat,  7 Nov 2026 12:22:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794054124;
	bh=iq+4RPE8xfBkVGXWnIB8K+YFPH7w7Lo6KEQ8N9HLzTs=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To;
	b=SNd3B3A4LqUrWO+Siuv2wt6omL2I+hovrNUDREfyLe+kbdvSymngJYlD+/9qTGGMX
	 jGSTQJCNOJ2OKQwT7e8JJeEKipBi8A6dy2S3OOQNXFu/Tm5T/+lgYYjJ5fCoy980Jw
	 SPf7e7LpEbZaZ5NGtWbtXKK+FZaLt0vFBQ+W/JEroAfntks3o8LCM6mVR/RD5UfXsM
	 HIg1PY5GXt2YcssbP5MUveP78vkkw9KmZ2YghaGV6kHS6+0L3390J/AVmLoTszhHjm
	 4dFF9gEvWEecI6TrL/I9XEnBKcVDzN/dVqDo3mWMbPny8zBIuV7apVrOO82t5fHuHW
	 oqEQEC8yds1iQ==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id E85D347BE4;
	Sat,  7 Nov 2026 12:22:02 +0000 (UTC)
From: Rui Cao via B4 Relay <devnull+i.udp0.com@kernel.org>
Date: Sat, 07 Nov 2026 20:22:00 +0800
Subject: [PATCH 3/4] dt-bindings: serial: mediatek,uart: Add MT6833
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Message-Id: <20261107-mt6833-base-v1-3-bda21083e9f3@udp0.com>
References: <20261107-mt6833-base-v1-0-bda21083e9f3@udp0.com>
In-Reply-To: <20261107-mt6833-base-v1-0-bda21083e9f3@udp0.com>
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
 Rui Cao <i@udp0.com>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794054121; l=922;
 i=i@udp0.com; s=20261107; h=from:subject:message-id;
 bh=MCmYdSBiOIw8bXy+sk2ZwCXWlI1Th2hdoYn0z9IY1kA=;
 b=hH0l5R2xfuIHSQAeZ2qg287lrnJtGDXFTbdBa2A0CTVpFX7/OhuoVWLRyB4Xm6uj09pCJm8Q3
 VbJeoSqz8CyAmk0MIi8pEyzn+nMn53mqGVYuiVNWNUIDDbIRw4dd0YM
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



