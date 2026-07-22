Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E0318C44536
	for <linux-mediatek@archiver.kernel.org>; Wed, 22 Jul 2026 12:06:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:
	References:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:
	Subject:Date:From:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=lpoRTo2nAlh3qIxY8qteRus47cQqQE9IX3TOWIxm6Ng=; b=jrFO/zKlG5lnkIFsf1/muHsOB7
	5pXAYd17LdMoAwhGQpj57OfMMr9j8vVTHYzr7zZ9w9kUBG3U/SkSJSwxW/MGnC59QkP/Ql2mQPism
	L5GBPtjshmSs/wqNxNP0UNXcNv/H8oMYzoKkzAHXOFuiP4D+ymn3/BOl+0h0W7E7vrDWPO0qyjk+l
	LbgJ0Us/A+TpQW3ZTQnGS1XOYK2OknTBni51E65jY5oJZfmTxNVk4h3aAKxy9STgcKzXqdaL+vg3o
	ES8G918JaMDT+o9lpE8ybq7efRJFW+Lmh4NfbinUGmbH0qvVcpRW5GNf6FbyZuUvRmuaYzDuNBLcN
	Td0F4nHA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wmVij-0000000BhaV-3vpc;
	Wed, 22 Jul 2026 12:06:41 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wmVii-0000000BhZI-2fGh;
	Wed, 22 Jul 2026 12:06:40 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id F1DDC4395A;
	Wed, 22 Jul 2026 12:06:39 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id D4530C2BCFF;
	Wed, 22 Jul 2026 12:06:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1784721999;
	bh=5XWm0CYXpmO4KIt62r5OvlwOr5GLzpGa2LTrVyhC370=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=qvV6ofSKtWl703T+AaW1S3rWzM3XhgIj06glZ4hmXhRxVvO9bOvJ3TO+3x6/qMjtL
	 hwkHnkTZOSXqHzsfsFmTS6akqc28JG+1H98Bp91txCU5ELrxenR9iexPqUgbE+FZST
	 AHYsp/E8yQbfLc+2oSzlhlQQz0zAgB7fjWoI66SSMmh53XcGVymn5X9OiisQYe31g/
	 y7tgPxO95Q8HBJLdCuowQXGsx5TVOy7oaWgM2ZtZwvBotLTLzMvpVmJhBW8ZdhHuLo
	 ToafZTjqWRkseKHRcAJDB6A4Zrxs03uQiKGs+CeNymQmgJEXKpBr8Gzwp/1RsJokEC
	 jegSylDdAPIOQ==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BEAA2C4453C;
	Wed, 22 Jul 2026 12:06:39 +0000 (UTC)
From: Congcong Yao via B4 Relay <devnull+congcong.yao.mediatek.com@kernel.org>
Date: Wed, 22 Jul 2026 20:02:44 +0800
Subject: [PATCH RESEND v3 2/2] dt-bindings: memory-controllers: mtk-smi:
 Add support for mt8189
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260722-8189-smi-support-v3-2-ae00e13deeac@mediatek.com>
References: <20260722-8189-smi-support-v3-0-ae00e13deeac@mediatek.com>
In-Reply-To: <20260722-8189-smi-support-v3-0-ae00e13deeac@mediatek.com>
To: Yong Wu <yong.wu@mediatek.com>, Krzysztof Kozlowski <krzk@kernel.org>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Rob Herring <robh@kernel.org>, Conor Dooley <conor+dt@kernel.org>
Cc: linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, 
 Congcong Yao <congcong.yao@mediatek.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1784721998; l=3542;
 i=congcong.yao@mediatek.com; s=20260722; h=from:subject:message-id;
 bh=RfjGr9dS2BPv3kvuxEnkhOj9VPQPmNK7ihihb5BjbNg=;
 b=x7NGCgN8LrMDzFJIcNKrh88tbvs0GYx28y6/vxkixXR05ogRN+A7oci4VPiC3GFlg+a+seXF8
 +y+oAy+j07eDHhwUFa1zRyv66ykiEJeHKFwqja9ZJW0aVZnINSni1+s
X-Developer-Key: i=congcong.yao@mediatek.com; a=ed25519;
 pk=tIrmGxKQQxnfyb48iCCd19063tppPj89U3nupGYAIxg=
X-Endpoint-Received: by B4 Relay for congcong.yao@mediatek.com/20260722
 with auth_id=889
X-Original-From: Congcong Yao <congcong.yao@mediatek.com>
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
Reply-To: congcong.yao@mediatek.com
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

From: Congcong Yao <congcong.yao@mediatek.com>

Add smi larb, common and sub-commom binding description for mt8189.

About what smi-sub-common is, please check the below diagram,
we add it in mediatek,smi-common.yaml file.

Signed-off-by: Congcong Yao <congcong.yao@mediatek.com>
Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
---
 .../memory-controllers/mediatek,smi-common.yaml        | 18 ++++++++++++++++++
 .../bindings/memory-controllers/mediatek,smi-larb.yaml |  3 +++
 2 files changed, 21 insertions(+)

diff --git a/Documentation/devicetree/bindings/memory-controllers/mediatek,smi-common.yaml b/Documentation/devicetree/bindings/memory-controllers/mediatek,smi-common.yaml
index 0762e0ff66ef..4e1deeff92b1 100644
--- a/Documentation/devicetree/bindings/memory-controllers/mediatek,smi-common.yaml
+++ b/Documentation/devicetree/bindings/memory-controllers/mediatek,smi-common.yaml
@@ -25,6 +25,21 @@ description: |
   SMI generation 1 to transform the smi clock into emi clock domain, but that is
   not needed for SMI generation 2.
 
+  The smi-common connects with smi-larb and IOMMU. The maximum inputs number of
+  a smi-common is 8. In SMI generation 2, the engines number may be over 8.
+  In this case, we use a smi-sub-common to merge some larbs.
+  The block diagram something is like:
+
+                          IOMMU
+                           | |
+                       smi-common
+              ---------------------------
+               |          |           ...
+              larb0   sub-common      ...  <-max number is 8
+                   ----------------
+                    |     |    ...
+                  larb1 larbX  ...  <-max number is 8
+
 properties:
   compatible:
     oneOf:
@@ -40,6 +55,8 @@ properties:
           - mediatek,mt8186-smi-common
           - mediatek,mt8188-smi-common-vdo
           - mediatek,mt8188-smi-common-vpp
+          - mediatek,mt8189-smi-common
+          - mediatek,mt8189-smi-sub-common
           - mediatek,mt8192-smi-common
           - mediatek,mt8195-smi-common-vdo
           - mediatek,mt8195-smi-common-vpp
@@ -108,6 +125,7 @@ allOf:
         compatible:
           contains:
             enum:
+              - mediatek,mt8189-smi-sub-common
               - mediatek,mt8195-smi-sub-common
     then:
       required:
diff --git a/Documentation/devicetree/bindings/memory-controllers/mediatek,smi-larb.yaml b/Documentation/devicetree/bindings/memory-controllers/mediatek,smi-larb.yaml
index 2e7fac4b5094..9a5dafd7c07e 100644
--- a/Documentation/devicetree/bindings/memory-controllers/mediatek,smi-larb.yaml
+++ b/Documentation/devicetree/bindings/memory-controllers/mediatek,smi-larb.yaml
@@ -27,6 +27,7 @@ properties:
           - mediatek,mt8183-smi-larb
           - mediatek,mt8186-smi-larb
           - mediatek,mt8188-smi-larb
+          - mediatek,mt8189-smi-larb
           - mediatek,mt8192-smi-larb
           - mediatek,mt8195-smi-larb
 
@@ -85,6 +86,7 @@ allOf:
             - mediatek,mt8183-smi-larb
             - mediatek,mt8186-smi-larb
             - mediatek,mt8188-smi-larb
+            - mediatek,mt8189-smi-larb
             - mediatek,mt8195-smi-larb
 
     then:
@@ -119,6 +121,7 @@ allOf:
               - mediatek,mt6779-smi-larb
               - mediatek,mt8186-smi-larb
               - mediatek,mt8188-smi-larb
+              - mediatek,mt8189-smi-larb
               - mediatek,mt8192-smi-larb
               - mediatek,mt8195-smi-larb
 

-- 
2.43.0



