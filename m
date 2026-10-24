Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 36085606A31E
	for <linux-mediatek@archiver.kernel.org>; Sat, 24 Oct 2026 15:42:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=TnixXdDh;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=P2s4QXRM
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=Y0Zlmu99I73712v7dio42Q8sSfQByYjnANjrYzCm+Jk=; b=TnixXdDhOhzvJW
	JA5mfwJAK1eKSCPEkgDjNfBAqh3JR1ST0XsICpLRfcXAQTm92vaAypT/i2ESCrfoDXCVAploqFGFc
	HbgoVaZ58SD/sHeYCxGGS4IiRgu1s/1RabJ6PfEly/jer8xhxh1eGWK+eFdhcOCj9bXarVWksO02w
	eZvNGI7ATUZ6s7s3CLxwY/E9sWGsJm+AIiPAPEfHIKII1ijImPNXBlPoIM/9NygPPaPgDavdZSpV6
	o4fn7pxChh7H0/f+DvP48NxzBykakF90upDbp+tJB/KWtjJMx2SS+jFnbF8wD398/5ra53PP7Zfx6
	GTQZRwPfq18bVC0Qcr3Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xKdsr-00000000KH7-3pIU;
	Sat, 24 Oct 2026 15:42:13 +0000
Received: from mail-dy1-x1332.google.com ([2607:f8b0:4864:20::1332])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xKdsn-00000000KEj-30a3
	for linux-mediatek@lists.infradead.org;
	Sat, 24 Oct 2026 15:42:10 +0000
Received: by mail-dy1-x1332.google.com with SMTP id 5a478bee46e88-3535a54bed9so2824840eec.1
        for <linux-mediatek@lists.infradead.org>; Sat, 24 Oct 2026 08:42:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792856529; x=1793461329; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Y0Zlmu99I73712v7dio42Q8sSfQByYjnANjrYzCm+Jk=;
        b=P2s4QXRMG/WMB+TeMkoJj86QQAHT6Dzqyv9ktMbtTnJMWE/SU72Pk4Bp2i5xuewrrS
         97cYq8Zn8/4kGfwFAjqowakhWrHScCrUSpdYtOor43/DWt1Q4P5gOuX8a7jCpADi8YVj
         RG6Hly+g69WoYcPwo1WCx4gYYRGphOomH6kwuPOvkvIV2V9RIXp1hBto0uqcvtD9cSOY
         zR5BEtUxbxB9DsFXuce+rLrxWaIlgouYc1ooMRcPySLSzvCiFsN6OlZmYPPlf2QkymFG
         hxob74ERoqJ+tjZk85+ZhGoq0nU5umC4gycetBespeLloGC4kjLX1GpH0+6d5+3OFIOU
         t0CA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792856529; x=1793461329;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Y0Zlmu99I73712v7dio42Q8sSfQByYjnANjrYzCm+Jk=;
        b=p/UE0I4eeGy1E7gfywFwtMFQ83FUPSt3KXc129betII68UG9gPSbAROIAkeygsqRj2
         SzmLkcCVnzLGX8Wv1sigsPDmyIW1c6DQZ2vp8QKTnkWcq2E8hEx8Qyr2qk1IF7QuIhc9
         I5DhF71s/7x97nIALSX2MxOydQ/vzE5xbIt7sPyz2Uc0roVr23GYRIMpooepTU4TxqcT
         XPRzxBrBWHlNBRCT2sffROlr/+Bgq2nHP48APi+Hd8vmcrY7xE0JSXYxQtqVVBNn4vuu
         vYfKiUrEifl+tEYfA6zfWZV/gw8itw/kPexr8ZpCy48R+molOdnUULvSQAagLBbtOtQn
         CSuA==
X-Forwarded-Encrypted: i=1; AKwUvByHNjVOEKlAXEWeGPQHjuQv+WtxBWuszhijlZPbsL0n+77Aen4QVMEGy+THBfFclwVx/d4vNvJY8TvsSx4nRA==@lists.infradead.org
X-Gm-Message-State: AFq9FYLmA6o0m3O68EBxwwC9CLWE25JGhljUOFwrk3q9Dxx/EdM5Y+fx
	vYY/PByqb+g6HPRsV/MUVP4Hk/HHqTJS/O4zh4ioeaShtuJTegBBfxj3
X-Gm-Gg: AYBFou3b9cL2K9vcf9UOs/ZVD6K8lZdvYC4AmArCtsSKp0qj/C7y4Gh+jsa1Zk/ltPt
	pnOWgNj5Nb+laC8hjO106qFgF0AOI+J+LRlIZ1GJ3VxMbdVe0MvzCBtSjxNx+OB+/ddZf5rkVwL
	FkuUl/XSEhkIB3nen1/9o5kk1d5DyPbHLMzJRos3lEiC65h7S01ghVSgKFC6rAnUHrDIFYsceUJ
	0bXVE/291yEAmFek6/wYh79eeNK1wm6CRqAJhbuwPMJcEbuSx1vxQELrMrxMhprWlxJaaHJ6pUs
	oTZ1Jis6N+Cn4KXHwV2HtBkG/MJ7m6mXN0YxEJBIqHKuqiBnonU3QTwyWR2A1f4muDtE44Wy/pO
	bD2AQBQJnkuB/PX2jHqrgDb3XDnFXdCkKJcKf1Z19Isx9IuOTbu1yl5dzQJgP9AVin6GGazqyxb
	YZUGiH31bLoF2xY2jFUtz7HysRnh1Mqf1bJcStjdVWKb2udbLxs/HREljy8NQ1As0iaHeeCOYre
	7hlft2ZwHfTgtrzEn1N3cdBW7Q4eJAWVMPVnlgFIuUQKVWze0DRJ1QZgQ==
X-Received: by 2002:a05:693c:80cd:b0:34c:fb30:3e30 with SMTP id 5a478bee46e88-369e842cbf2mr3808651eec.7.1792856528662;
        Sat, 24 Oct 2026 08:42:08 -0700 (PDT)
Received: from plex ([2406:6d00:a27c:4200:aab8:e0ff:fe02:33c1])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-369e8daf444sm7766450eec.18.2026.10.24.08.42.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 24 Oct 2026 08:42:08 -0700 (PDT)
From: Chris Scott <gilroyscott1970@gmail.com>
To: netdev@vger.kernel.org
Cc: lorenzo@kernel.org,
	andrew+netdev@lunn.ch,
	davem@davemloft.net,
	edumazet@kernel.org,
	kuba@kernel.org,
	pabeni@redhat.com,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	matthias.bgg@gmail.com,
	angelogioacchino.delregno@collabora.com,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	pawlik.dan@gmail.com,
	zhengping.zhang@airoha.com,
	Chris Scott <gilroyscott1970@gmail.com>
Subject: [RFC net-next 1/3] dt-bindings: net: airoha: npu: add DMA pool memory region
Date: Sun, 25 Oct 2026 01:41:48 +1000
Message-ID: <20261024154150.45733-2-gilroyscott1970@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261024154150.45733-1-gilroyscott1970@gmail.com>
References: <20261024154150.45733-1-gilroyscott1970@gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261024_084209_774668_E461FEDC 
X-CRM114-Status: UNSURE (   9.32  )
X-CRM114-Notice: Please train this message.
X-Spam-Score: -1.9 (-)
X-BeenThere: linux-mediatek@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-mediatek.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-mediatek/>
List-Post: <mailto:linux-mediatek@lists.infradead.org>
List-Help: <mailto:linux-mediatek-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mediatek>,
 <mailto:linux-mediatek-request@lists.infradead.org?subject=subscribe>
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
X-Spam-Status: No, score=-15.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

From: Daniel Pawlik <pawlik.dan@gmail.com>

The EN7581 NPU can only address host DRAM at 0x80000000-0xbfffffff;
higher addresses alias the lower 1 GiB. Allow an optional shared DMA
pool, after the firmware region or after the WLAN regions, so coherent
buffers shared with the NPU can be kept inside that window. The
firmware region stays first for existing users.

The original version of this patch was written with Codex; it was
rebased onto net-next and its commit message rewritten with Claude
(Anthropic).

Link: https://lore.kernel.org/r/atCRsquzA1UxSpCc@mediatek.com
Signed-off-by: Daniel Pawlik <pawlik.dan@gmail.com>
Signed-off-by: Chris Scott <gilroyscott1970@gmail.com>
---
 .../bindings/net/airoha,en7581-npu.yaml       | 40 ++++++++++++-------
 1 file changed, 26 insertions(+), 14 deletions(-)

diff --git a/Documentation/devicetree/bindings/net/airoha,en7581-npu.yaml b/Documentation/devicetree/bindings/net/airoha,en7581-npu.yaml
index aefa19c5b4..21a1a27500 100644
--- a/Documentation/devicetree/bindings/net/airoha,en7581-npu.yaml
+++ b/Documentation/devicetree/bindings/net/airoha,en7581-npu.yaml
@@ -42,22 +42,34 @@ properties:
       - description: wlan irq line5
 
   memory-region:
-    items:
-      - description: NPU firmware binary region
-      - description: NPU wlan offload RX buffers region
-      - description: NPU wlan offload TX buffers region
-      - description: NPU wlan offload TX packet identifiers region
-      - description: NPU wlan Block Ack buffers region
-    minItems: 1
+    oneOf:
+      - items:
+          - description: NPU firmware binary region
+          - description: Coherent DMA pool for buffers shared with the NPU
+        minItems: 1
+      - items:
+          - description: NPU firmware binary region
+          - description: NPU wlan offload RX buffers region
+          - description: NPU wlan offload TX buffers region
+          - description: NPU wlan offload TX packet identifiers region
+          - description: NPU wlan Block Ack buffers region
+          - description: Coherent DMA pool for buffers shared with the NPU
+        minItems: 4
 
   memory-region-names:
-    items:
-      - const: firmware
-      - const: pkt
-      - const: tx-pkt
-      - const: tx-bufid
-      - const: ba
-    minItems: 1
+    oneOf:
+      - items:
+          - const: firmware
+          - const: dma
+        minItems: 1
+      - items:
+          - const: firmware
+          - const: pkt
+          - const: tx-pkt
+          - const: tx-bufid
+          - const: ba
+          - const: dma
+        minItems: 4
 
   firmware-name:
     items:
-- 
2.53.0


