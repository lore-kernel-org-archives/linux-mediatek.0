Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4417B606A686
	for <linux-mediatek@archiver.kernel.org>; Fri, 27 Nov 2026 03:00:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=g3KiUzJU;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=htBfnSsB
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=HV9hlsDvgupAmhSZdNLnY/9aDgMTgdYavQ7Hkay/0zM=; b=g3KiUzJUTHgrhteqr9wvBVSBak
	IMmGzZAhv1OhmLjBcuxc3cZ662HKXQNAnM+ugh5Kvuwz+ckJXnPmTjO+rnl40jPygotPrbjj09GH/
	tKxCR84bL3WYvvzpO2snPIWz++Eq6feJnnAPJRcXCZgNYnxKyE99aEOE6I5/80xkqPjJh3p3TP+wL
	0eCGFAWcuTk6KhcOQHZqnSRyZlwRmEDeUWv9O5FMKsesmFPKkf960sjz/QB1tUaVhd/yEYMRf91/M
	ImUfjxXopWpJtkPhTFADotlhI95tZNOrHECC+teEUiZzP6E0wlluc/LlHn8nxEkN/rlUa5CWyoGL2
	cnLTZ3xg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWmCW-0000000EpCu-40Xl;
	Fri, 27 Nov 2026 03:00:40 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWmCE-0000000Ep3w-3j1A;
	Fri, 27 Nov 2026 03:00:22 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 573AF443FD;
	Fri, 27 Nov 2026 03:00:22 +0000 (UTC)
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1795748422;
	b=sa2cGnY1/yVZhkeg2SnqNVoIUzAT/DTf+KDOKBGEW6nGvzQKjMv5D4CHiuTIMvpOAIdo
	 OsPAHL0jTUvLlT4gsUwuKwoKRVr5VXLsM2bOsyl0SbfHI793hNhYUHlEbqmOCLPd05jkl
	 byy/Q1IZ3viRzi+hX5vBEIKMzpxme8oRuvNA8LmmTXq7ORT6T26QM+h/Ei3US4VsmxwXt
	 eiwBwE1uSlcmnFasaqsrVXTec9XVAlDpUDSzsd2jee/pTvLGgnhp9EJIDU+s3q4zJodib
	 HfJZ636jykOUWSFhIz1TS49C5dphLCH47RfeGavnBJPRdpQu95Nq4G47we+4jf2toHA==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1795748422;
	h=DKIM-Signature:Received:From:To:Cc:Subject:Date:Message-Id:
	 In-Reply-To:References:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:X-Mailer:X-Developer-Signature:
	 X-Developer-Key:X-Endpoint-Received:X-Original-From:Reply-To;
	bh=HV9hlsDvgupAmhSZdNLnY/9aDgMTgdYavQ7Hkay/0zM=;
	b=m7QGczksUvZiEOprVTxfvtDQHGXlXQt/+iyycOje+5KJo0d/XofPMP52BNEZ7VWT3QYj
	 wGp+fDJt/Mi/2LurJuUvPo/r+4tWQn4J5D+29MBfFDw4h9pPYEVFNTAlbtTe5Vuu4Zi0O
	 l/PJ3vIl7EJV+I24R98VwbNGi7UR27knr5nIWULGBO4HM2EdblAAQGszAbxTLibyVY0nf
	 kpAH7I9h0ltUYxHhiIv+ZMo1KylUKrJk5g8n5X+DXVx5Ioz6F6953DE3Gxtz+l4w27FPz
	 ho7K7BXjrtPKOIwqwmT2PZSBkdZZBRTXaDA8t0SmzXAiaqAgJdjBMMVi2C7DHKMcXcg==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id C6C3F1F00898;
	Fri, 27 Nov 2026 03:00:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795748422;
	bh=HV9hlsDvgupAmhSZdNLnY/9aDgMTgdYavQ7Hkay/0zM=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:Reply-To;
	b=htBfnSsB0Rl43pKvkPns39uYaw3DymbJfS37kfvuQyO4Ww+UPcfM4EZq5eknNx4nV
	 T3gGCrA9eyc9JOCnLMzZD8yocXNotO+rT9RrRZr6BVaMnMl0VY0TRd33Xb/1CDYlOy
	 OphWDcnmwDDwyHuhQcWGrr82VIOTTb2K7JU640jb+uG7uHJb/dBysJAzzexe8KMN+c
	 NQzJShY7j2WdjDoyAWUEg3rC2/CwARUkp6fVH6Kze+z0h7SZNDBDwY3cCB4DMJUPcz
	 Kk7cXg4Vstl+yZ2V2GODj8OzgWXZTEmGs7l36QhFIFWwOLn8gX3p1qT5EzGMmqWqVZ
	 E1Qc5/Hpi1p5Q==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id 54C504B513;
	Fri, 27 Nov 2026 03:00:10 +0000 (UTC)
From: Ilia Snezhkov via B4 Relay <devnull+iasnezhkov.gmail.com@kernel.org>
To: matthias.bgg@gmail.com, angelogioacchino.delregno@collabora.com, 
 robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org
Cc: amergnat@baylibre.com, me@adomerle.pw, 
 Roman Vivchar <rva333@protonmail.com>, devicetree@vger.kernel.org, 
 linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org
Subject: [PATCH v4 1/3] dt-bindings: soc: mediatek: pwrap: Add compatible
 for MT6789
Date: Fri, 27 Nov 2026 03:00:10 +0000
Message-Id: <20261127030009.10572-2-iasnezhkov@gmail.com>
In-Reply-To: <20261127030009.10572-1-iasnezhkov@gmail.com>
References: <20261127030009.10572-1-iasnezhkov@gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795748409; l=1071;
 i=iasnezhkov@gmail.com; s=mindone2026; h=from:subject:message-id;
 bh=kQwY2v1MoN10/j2838WZb33UOSh8rL9DnpRERcRxn7E=;
 b=8D9rNZJ50F8beeCfjCNNdp2qS594ZSobkSKnwCs0gplH+FQi0bqpzVaoEMs+7C0+5w0Gjj+ni
 gbycUaXiRDpDx/0KMjxLzG6lFpWeny0LxhHFzm754u/0T0/HOj5+GTS
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

Signed-off-by: Arseniy Velikanov <me@adomerle.pw>
Acked-by: Rob Herring (Arm) <robh@kernel.org>
Signed-off-by: Ilia Snezhkov <iasnezhkov@gmail.com>
---
Rebased onto mainline with Rob Herring's Acked-by from v1 preserved.

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




