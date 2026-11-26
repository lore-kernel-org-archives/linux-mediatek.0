Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 61DDA606A326
	for <linux-mediatek@archiver.kernel.org>; Thu, 26 Nov 2026 00:07:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=qlqtf3u1;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=K0zGIyZX
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=oT6vSLMWO+jgERuhLwxL1GFaJ+9gw4J6oRotwcUYX4s=; b=qlqtf3u1rzSYWeHg0d4yUoU/i+
	7vaSgWwTqnnbUejYEZaybzoTjkHEosRlhFhCOh/Z5pOAtaFkVJK6V/4AmbT0rbWlTVbX51tQA9s6H
	IJwZsUSZdGDx3zTtfRKikSs3HcUhcPqCxA327K6CDJ0w4u1ELJ99kFGKaKKjE8w8euF3Hhib7scVx
	kYJpdlJQSn5QNFbjXchcToz0fcmBbwOg5GdAVvLbH7JPqBztAYuMJBqnGmjDOeFMRLwfRAcshcEcr
	7GIwJzpKF5s/CeF6hcb5rXjgjfUB4cd3Qub5udowyXY059byjmATbDdpwsN3gRNAtTP0Lndjk1fKh
	5KySJnLQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWN1S-0000000Bcmy-06sN;
	Thu, 26 Nov 2026 00:07:34 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWN1J-0000000Bcii-1Cvn;
	Thu, 26 Nov 2026 00:07:25 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 1112844D7E;
	Thu, 26 Nov 2026 00:07:25 +0000 (UTC)
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1795651644;
	b=oBrPUDIf5WsaCParskwU6JBcA11fL+AOQWlOugqoPeX5h5fwEBor+HfC8WnwEAE1KDFS
	 dpOhmk7tW+xwMTge03M/BAViHfTkl4sRq7YLKpUQgcEBsRrl3MCQ47sC7zYzNBQq78ANP
	 uBHLqXAyrWwXJjTuT+3TeNpctHdd8wMUuubCGsyUs1qQbESJYAP4CZO4IilHS/Ac5rkNQ
	 dKKtr1pbY5aEaYGZgr63fAVotNAY5hvmcI0foXvGoKLJLVSmuGugRUmXizEGOTTwyvP1m
	 9xT4jo8YMqZ9V338/jAxj052gphNIz4GuNTpLc6Sw71HbJ4SnVwhSd1E2UUgIWV5tow==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1795651644;
	h=DKIM-Signature:Received:From:To:Cc:Subject:Date:Message-Id:
	 In-Reply-To:References:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:X-Mailer:X-Developer-Signature:
	 X-Developer-Key:X-Endpoint-Received:X-Original-From:Reply-To;
	bh=oT6vSLMWO+jgERuhLwxL1GFaJ+9gw4J6oRotwcUYX4s=;
	b=sGeSXg01Sc5DkowdSnrKsmUK4mUgbyZ8LhoWU8Set6Iet7h2FE54pmrzXThACsxrpX2C
	 w5XDNv1OQ/4UoyyuNgmojghaA7NOg4M39urOZ9vFCP6OhtOOPmYaWM8g2gcCAUOrRXt5w
	 wqhhvm55SDzHK5Iow0EF5wgR5odpqadqjdglzGwXiQssa/JK5IWeU7xoqf+pAZnoEVd85
	 tIauhqqZb7jbcEn3CwYUJh67KhTwzjKWL24sNhch3ODbCkl0aDKJNqpF2pI36kweinGBS
	 BMGZNOllC7NVMktCIm8U38LvOkqkOyMZj9PlqYi4cvG5XHdax2w8qwlx72egNVhnItA==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id B340D1F000EE;
	Thu, 26 Nov 2026 00:07:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795651644;
	bh=oT6vSLMWO+jgERuhLwxL1GFaJ+9gw4J6oRotwcUYX4s=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:Reply-To;
	b=K0zGIyZX8CQ9rio2/vTcnmDk/P2DRaMs3ihWwnluL8Z90+x9ZD7rQa05liPmnREwi
	 lItFDZi0gwxdMRVoMcEA6HAIaVqKkcNYshyobv4QpLI9F5jCJ+9QJ4zYReO/h5QcQk
	 lryBCa+IZXqDtqDNMwlCnMbeBnKa9VsQxVVuEawt2tQDP4obGYxbE9v6DMq0fiiKYL
	 J96OEKWPeI7F3lTQMoJTQPZpUdsMLXFUJdUr3LGDOKlXnDmtDrC409d28MVKLO3R1b
	 PE6rtFEo4fnJ0iMU2YweU2Ue+6/sZR6y9PWVaMPd7sobpKqI2QtFnvgdC+pCKJKiGW
	 WPS4Pv0Hs3R2Q==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id 3F6ED4D0E3;
	Thu, 26 Nov 2026 00:07:12 +0000 (UTC)
From: Ilia Snezhkov via B4 Relay <devnull+iasnezhkov.gmail.com@kernel.org>
To: matthias.bgg@gmail.com, angelogioacchino.delregno@collabora.com, 
 robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, 
 broonie@kernel.org
Cc: flora.fu@mediatek.com, amergnat@baylibre.com, leilk.liu@mediatek.com, 
 me@adomerle.pw, devicetree@vger.kernel.org, linux-spi@vger.kernel.org, 
 linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org
Subject: [PATCH v2 1/3] dt-bindings: soc: mediatek: pwrap: Add compatible
 for MT6789
Date: Thu, 26 Nov 2026 00:07:12 +0000
Message-Id: <20261126000711.16163-2-iasnezhkov@gmail.com>
In-Reply-To: <20261126000711.16163-1-iasnezhkov@gmail.com>
References: <20261126000711.16163-1-iasnezhkov@gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795651631; l=1071;
 i=iasnezhkov@gmail.com; s=mindone2026; h=from:subject:message-id;
 bh=xb5m/UMxmolu0Khi5obeIEz8/HWCSujD/gSfpeukBqM=;
 b=ml3igffOURw8Hhm4RtGemNsfhbaAZrJ8bIMGXnMYpDBt4o9QkW3VPVuf/32Rr5KhUJCZJCCYT
 57FDagUSST/Bvi/lxZpjZzzHCc1XhsXxGPgyexo1n40xEElVDk7A4N7
X-Developer-Key: i=iasnezhkov@gmail.com; a=ed25519;
 pk=hQgXfiWi4ukk2jh4BHu1vRVhg9BUivo//AFp50AKMag=
X-Endpoint-Received: by B4 Relay for iasnezhkov@gmail.com/mindone2026 with
 auth_id=1643
X-Original-From: Ilia Snezhkov <iasnezhkov@gmail.com>
X-BeenThere: linux-mediatek@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-mediatek.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-mediatek/>
List-Post: <mailto:linux-mediatek@lists.infradead.org>
List-Help: <mailto:linux-mediatek-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mediatek>,
 <mailto:linux-mediatek-request@lists.infradead.org?subject=subscribe>
Reply-To: iasnezhkov@gmail.com
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
X-Spam-Status: No, score=-18.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

From: Arseniy Velikanov <me@adomerle.pw>

Add a compatible for the PMIC Wrapper found on the MT6789 SoC.

Rebased onto v7.4-rc4 with Rob Herring's Acked-by from v1 preserved.

Signed-off-by: Arseniy Velikanov <me@adomerle.pw>
Acked-by: Rob Herring (Arm) <robh@kernel.org>
Signed-off-by: Ilia Snezhkov <iasnezhkov@gmail.com>
---
 .../devicetree/bindings/soc/mediatek/mediatek,pwrap.yaml         | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/soc/mediatek/mediatek,pwrap.yaml b/Documentation/devicetree/bindings/soc/mediatek/mediatek,pwrap.yaml
index 79b7558..0c5ebf6 100644
--- a/Documentation/devicetree/bindings/soc/mediatek/mediatek,pwrap.yaml
+++ b/Documentation/devicetree/bindings/soc/mediatek/mediatek,pwrap.yaml
@@ -33,6 +33,7 @@ properties:
               - mediatek,mt2701-pwrap
               - mediatek,mt6765-pwrap
               - mediatek,mt6779-pwrap
+              - mediatek,mt6789-pwrap
               - mediatek,mt6795-pwrap
               - mediatek,mt6797-pwrap
               - mediatek,mt6873-pwrap
-- 
2.54.0 (Apple Git-157)




