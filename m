Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 356ED606A31E
	for <linux-mediatek@archiver.kernel.org>; Sat, 28 Nov 2026 04:36:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=kSe7/nwP;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Fr0mbyfQ
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=FaHBtF+1XYHP7dS8i8/BR+yPyNH36+psmbGxkykyZbE=; b=kSe7/nwPYarKzobEYJ3O9FGiTl
	c4Hdb7YGXeeMNYrt+WLwxxjyPjGni8X9Fbxq/nJ6n7PKrY3ZsjHWTaapllnPX8x6kpL9641K9sMPY
	XYS6GnZ/8AWrS22ukhpBkwVeoH7l6Ec4X0Wa7ZRRGhj0Kh7n2Jk2bXYpwPqB4pgb9wN+AAZO3ouY5
	tmiXJi4Q3tZFHZlti8Bhx+RriR7EsrOBxLG+Dpnq7z2RZC+fP7E6qCMFN3kyrPJqCTZA0l9pH+x5f
	Ou/7x3FbOjEyMAU3jyQtMipqI4dv3AJPXsJmzBV1Qcpe0qeH2rm25//DZfuDU09+xKVYLbfFRowrZ
	WWewAbiQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xXAAw-00000000NLD-3lQQ;
	Sat, 28 Nov 2026 04:36:38 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xXAAu-00000000NKu-35H9;
	Sat, 28 Nov 2026 04:36:37 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id C565060E02;
	Sat, 28 Nov 2026 04:36:35 +0000 (UTC)
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1795840595;
	b=N9D7977Ip6RwfO+Bt6ZkcfXjN7+F0uELuXrkDQ/yz5WyesZ2f2rtbHsI1sE49MykRIOV
	 XKPifAxwISvC2fNoZNTWzF39m9IbxP/O0SqtnszFeM12FvRHAu7lGU6bCBJKKe4aHP7xx
	 NvRwlXvFVB75b22mAifZMXKQg6HFVKsQOdEaK2uycav0I5XxvbgOHLDTDa3d6+BESZrWG
	 1kmqaslbeRqGo6xzgDFuS0lC/Qk30lMPacMVDXpp3HK6s7vvG6K5S3agdmh0TXYM8P8B3
	 2uOV1GJN4vids5JU2RmcllZF6t4VFR+r1/3puYAa2FS8Qjds8QsTvn3Z3xCgWHa/hFQ==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1795840595;
	h=DKIM-Signature:Received:From:To:Cc:Subject:Date:Message-Id:
	 In-Reply-To:References:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:X-Mailer:X-Developer-Signature:
	 X-Developer-Key:X-Endpoint-Received:X-Original-From:Reply-To;
	bh=FaHBtF+1XYHP7dS8i8/BR+yPyNH36+psmbGxkykyZbE=;
	b=139dIzE2mTDdZocjtdfVdPa8LsCVODV5E5m70j/N9eTXDAc/ej7pw3pkuf5yOWND34sb
	 U8/LR2a6+lpg6M8qxGp/zgiXzWrs0xUJjINup8I6f+EXLLdqFE9zz4T4eHD3KqLsZ8TgB
	 3WYIT6cKNkqL7BRA6k+dyuydNYjEmxIv16kbdcRfiGseoNPfL7JbdXOpBLox0SN14u5tn
	 65Do7Rk2x49beS0fJg+bWCLj3m7TT08EvPfaWltwDtcnb7/cgO6ERjKUqm/z96dgSOH4h
	 GKYDR+dRpoOjceYNumIrQUpECjAnDfpSp+hTagEYoQU70VTtrrar4e+k4uhMJepyNpw==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 489D61F00897;
	Sat, 28 Nov 2026 04:36:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795840595;
	bh=FaHBtF+1XYHP7dS8i8/BR+yPyNH36+psmbGxkykyZbE=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:Reply-To;
	b=Fr0mbyfQB6YFe04DaPERzCTitFacekMtIlpnQUPxR8g9u1aj61LsaEEsoON4J1ZvX
	 ydDHNu9YsomxsPIiQod6WB8zaoaMOpC3X6nQZcN+mUE87PiF0qWZ6DXhQIJw4Rb4Bo
	 2SabfbwxhbS8q3ZnqecD1rG0aab9Z0IQgXKIdGiIFtxNLxD3mhZ+cHf9nt7QNZNiAX
	 iEkA1L42XH4aZUlrkloeft/aGza9epE0M5JtosqNggIOIoF27wYufLl+wZVEm2MWqq
	 PyHWlRs09K0I3oRRPC1aAj8IwUA/mSw/+iFyeUzKi8FSM+ABnvqs+nPwNeqclRf4p2
	 ot+O+5ZJXla2w==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id C06E44DFA3;
	Sat, 28 Nov 2026 04:36:30 +0000 (UTC)
From: Ilia Snezhkov via B4 Relay <devnull+iasnezhkov.gmail.com@kernel.org>
To: matthias.bgg@gmail.com, angelogioacchino.delregno@collabora.com, 
 robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org
Cc: rva333@protonmail.com, amergnat@baylibre.com, me@adomerle.pw, 
 devicetree@vger.kernel.org, linux-mediatek@lists.infradead.org, 
 linux-arm-kernel@lists.infradead.org, phone-devel@vger.kernel.org, 
 linux-kernel@vger.kernel.org
Subject: [PATCH v5 1/3] dt-bindings: soc: mediatek: pwrap: Add compatible
 for MT6789
Date: Sat, 28 Nov 2026 04:36:30 +0000
Message-Id: <20261128043629.67417-2-iasnezhkov@gmail.com>
In-Reply-To: <20261128043629.67417-1-iasnezhkov@gmail.com>
References: <20261128043629.67417-1-iasnezhkov@gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795840589; l=1222;
 i=iasnezhkov@gmail.com; s=mindone2026; h=from:subject:message-id;
 bh=CYLVo9RfP6fxOAooIZCXkxQQ8iqQlvJmQ7Ov0Xsbjsg=;
 b=60tYNVLWaS6rV6VTH7hdKcxNi9athrstYaCzm8jHhPixubE58nkIRZu4xnwuK/KJzvd8BJgCN
 2o5hZOD3lOsDCBnMMheLf1md94+IIRcaNp5Yo5kYLpLY3bWN+V+48h5
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
Reviewed-by: Roman Vivchar <rva333@protonmail.com>
Signed-off-by: Ilia Snezhkov <iasnezhkov@gmail.com>
---
Changes since v4:
- Rebased onto linux-next (after mt6572 binding additions).
- Collected Reviewed-by from Roman Vivchar (keeping Rob Herring's
  Acked-by from v1).

 .../devicetree/bindings/soc/mediatek/mediatek,pwrap.yaml         | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/soc/mediatek/mediatek,pwrap.yaml b/Documentation/devicetree/bindings/soc/mediatek/mediatek,pwrap.yaml
index 6546eed..e85e221 100644
--- a/Documentation/devicetree/bindings/soc/mediatek/mediatek,pwrap.yaml
+++ b/Documentation/devicetree/bindings/soc/mediatek/mediatek,pwrap.yaml
@@ -34,6 +34,7 @@ properties:
               - mediatek,mt6572-pwrap
               - mediatek,mt6765-pwrap
               - mediatek,mt6779-pwrap
+              - mediatek,mt6789-pwrap
               - mediatek,mt6795-pwrap
               - mediatek,mt6797-pwrap
               - mediatek,mt6873-pwrap
-- 
2.54.0 (Apple Git-157)




