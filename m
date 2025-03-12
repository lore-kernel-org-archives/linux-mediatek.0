Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 03221C28B28
	for <linux-mediatek@archiver.kernel.org>; Wed, 12 Mar 2025 08:33:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:Message-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=k35eQjX0nxY5v8YxOmj3epRsm/l8SePfVF0+fNU2FcE=; b=sEdDdj6GImIryURpmVP5EBFEY9
	rMILw1lcuTniRsjlnXb91OOLPQA6IPW8MmU7s9XTBk6gUE5BRyRXx+Jds5QY4y/OvVQKZGOCiOXPY
	N3z3BxM7HCHclsZqRWTbHpY6CjyffaXINb/abdWcYY66REeiL1XRaIV+bzLmNeYrG432nnfTeg2LC
	0sDx3Z2YmyMN7CHgAqdqRp4o/QHCJBcu+33jWF/escWpy31wOuaCdYHeK+QpJK/xUzvpO/wkUg0CL
	D0q7uCFaNH+CAzi9+MLdGIoJTz0eMvhXT2oHRRkZjkNiDVFyY6RtZO6e8CsHdXbTzZMInrvUv7w2r
	cPrPjbXA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tsHWQ-00000007q8L-21Hy;
	Wed, 12 Mar 2025 08:33:02 +0000
Received: from nyc.source.kernel.org ([147.75.193.91])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tsHWO-00000007q7v-2H82
	for linux-mediatek@lists.infradead.org;
	Wed, 12 Mar 2025 08:33:01 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id C2353A46DD1;
	Wed, 12 Mar 2025 08:27:29 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 111C8C4CEE3;
	Wed, 12 Mar 2025 08:32:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1741768379;
	bh=RcBhlT2wJn3QV0h8NY8IhycUw8J//pMHO4F8vBiQQsI=;
	h=From:Date:Subject:To:Cc:From;
	b=SqtOvXIFIZC+nqsLcY2N76Z77uJV4Rhpe2+LC5SYq7WYcQOlXvBugyewsD8fDuOBo
	 XwmB/diod4drV+uk8DfSUUuVy71cfBufMIlUss+0UvuFYQOuXc3xsLJBnVvalXwYIo
	 v+HBSmXJRXVe0QP+mNL4mJRzFEChCN8Wo73wHfvnoqzOsqg+VFX/ittlTLbnmaQN7B
	 3iYVlA6xJ0okgXnitcACBFdVHuwu5uiEMZdsj1V2a8NBsA3CwxqBF7OpBw0Gn+/AJo
	 WfktkVgtOW0fCFUb8xPI6v3oNXzFHIJJiUR0GWX7n2kYE9yq5mjW8NSkeH9ah70Zkq
	 1tW72tQaRTTfg==
From: Lorenzo Bianconi <lorenzo@kernel.org>
Date: Wed, 12 Mar 2025 09:32:15 +0100
Subject: [PATCH v3] dt-bindings: mfd: syscon: Add the pbus-csr node for
 Airoha EN7581 SoC
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250312-en7581-pbus_csr-binding-v3-1-7bd9f00a25a4@kernel.org>
X-B4-Tracking: v=1; b=H4sIAI5G0WcC/4XNTQ6CMBCG4auQrq3p9EfAlfcwxtgywERTSKuNh
 nB3CytdGJfvl8wzE4sYCCPbFxMLmCjS4HOoTcFcf/EdcmpyMymkEUpUHH1pKuCjfcSzi4Fb8g3
 5jtelRrBatFbtWL4eA7b0XOXjKXdP8T6E1/oowbL+NxNw4HVd28YJFFjqwxWDx9t2CB1b0CQ/I
 IDfkMwQtM5Yg7qSqL6geZ7f2m/3/wgBAAA=
X-Change-ID: 20250308-en7581-pbus_csr-binding-974e1b40fb36
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Lee Jones <lee@kernel.org>
Cc: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 devicetree@vger.kernel.org, linux-mediatek@lists.infradead.org, 
 linux-pci@vger.kernel.org, Lorenzo Bianconi <lorenzo@kernel.org>
X-Mailer: b4 0.14.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250312_013300_659523_54C90A1E 
X-CRM114-Status: UNSURE (   8.12  )
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
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Introduce pbus-csr document bindings in syscon.yaml for EN7581 SoC.
The airoha pbus-csr block provides a configuration interface for the PBUS
controller used to detect if a given address is accessible on PCIe
controller.

Signed-off-by: Lorenzo Bianconi <lorenzo@kernel.org>
---
Changes in v3:
- Fix commit subject
- Link to v2: https://lore.kernel.org/r/20250311-en7581-pbus_csr-binding-v2-1-1fc5b5e482e3@kernel.org

Changes in v2:
- Move EN7581 pbus-csr binding in syscon.yaml
- Link to v1: https://lore.kernel.org/r/20250308-en7581-pbus_csr-binding-v1-1-999bdc0e0e74@kernel.org
---
 Documentation/devicetree/bindings/mfd/syscon.yaml | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/mfd/syscon.yaml b/Documentation/devicetree/bindings/mfd/syscon.yaml
index 4d67ff26d445050cab2ca2fd8b49f734a93b8766..7639350e7ede40c8934f41f854ff219354fb3e5b 100644
--- a/Documentation/devicetree/bindings/mfd/syscon.yaml
+++ b/Documentation/devicetree/bindings/mfd/syscon.yaml
@@ -27,6 +27,7 @@ select:
     compatible:
       contains:
         enum:
+          - airoha,en7581-pbus-csr
           - al,alpine-sysfabric-service
           - allwinner,sun8i-a83t-system-controller
           - allwinner,sun8i-h3-system-controller
@@ -126,6 +127,7 @@ properties:
   compatible:
     items:
       - enum:
+          - airoha,en7581-pbus-csr
           - al,alpine-sysfabric-service
           - allwinner,sun8i-a83t-system-controller
           - allwinner,sun8i-h3-system-controller

---
base-commit: d71fc910c58ed85a2ad5143502030bff73fc2088
change-id: 20250308-en7581-pbus_csr-binding-974e1b40fb36

Best regards,
-- 
Lorenzo Bianconi <lorenzo@kernel.org>


