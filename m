Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6E252CD3436
	for <linux-mediatek@archiver.kernel.org>; Fri,  8 May 2026 06:36:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=22ncQpWLdF2X8pTtJBnqzgTb5DeYk3+PKhZtvYNM/EM=; b=EzcYgo+Vi/5htbjmSI2QxPdxrS
	JEfD9/itqk9O1xzqdg/VGIxQLou7U+fFWdTEp7yQAWN8XJ+m55r19BFm0ueA/zhUUcBQsHSU7bxGG
	/zweWoYfIH9+ldl43N+6aYswdlFFwp3h02xIKsTgbMlFl65q6vQlMwXhYAW5hzSx6GwZLXSZSetAw
	LS2crfEdbP4vgiNWIqVvpAvcZk72/GdRgjXUfFrzQ7zTE9N7kx46Jo848DVr9Pqvc4I5vUwJAMCnn
	OvaLzVcv78Ht6oOp5G6LcFD5SeRd6yUD7Bbsp/yKHCRDVEARMV70l2B55tuoAwXmXNkg7UBFc1J2P
	+bD72TKQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wLEpJ-00000005ktE-3rYo;
	Fri, 08 May 2026 06:36:46 +0000
Received: from mail-pg1-x52a.google.com ([2607:f8b0:4864:20::52a])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wLEpH-00000005ksT-2gmN
	for linux-mediatek@lists.infradead.org;
	Fri, 08 May 2026 06:36:45 +0000
Received: by mail-pg1-x52a.google.com with SMTP id 41be03b00d2f7-c798fc1a28cso698601a12.3
        for <linux-mediatek@lists.infradead.org>; Thu, 07 May 2026 23:36:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1778222202; x=1778827002; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=22ncQpWLdF2X8pTtJBnqzgTb5DeYk3+PKhZtvYNM/EM=;
        b=Ck+dTMyGjdez88YJa8kNhI2QPjlYP/9paJ61QHLtu6TiypmwzxW7SYIk67fC504bD3
         amSeLWb2i3kZZDPkcPNlKUVzW70pHTIfcVZyNkCSxbz072Zx5iRyVbQ/NR5uxJomNkbp
         ikyJIAoO8GNa+dvo4AClBMgYopJ4gOWF/BCrs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778222202; x=1778827002;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=22ncQpWLdF2X8pTtJBnqzgTb5DeYk3+PKhZtvYNM/EM=;
        b=VGN0HEF+v5l+Dmc2v4CoAORz0jacG9Plqt76+dAp/NFzpOXeVfxJt5PIjr2rt5Qec5
         OeUsVpWqpBf9cl3VTt0vOyZ77n1ECLs/Ojt1vhGo5mO2DJMNFBd/lIkEf+McAJrb9ERO
         GcqyWLNLGOqVo3eXfsi6vxxoalC6hL7Wl1Pri7iIEMCOxqchc+KYuGAzjOaWOIjHzeXs
         A8znFL4x2WkV1LJ7qWKJsCcLKpUi5GblkdZvygO340Oe/4mKIRcQPcqP4sKAyas52+z/
         KPHhYm6TN86Ku7V8yawVGqmP5FwfS/0bJ4v9YtC+Sc+nJuhE68NA24lTVr/I3e4iXA/F
         WPQg==
X-Forwarded-Encrypted: i=1; AFNElJ9t/nTTmQ+e0ynLwzX2Vv1v2MGHHcxrYBsM1AptDnYbm8o8xJBt/zusslPWmHcUGuYzxPOOD7Lje9/H81p9pQ==@lists.infradead.org
X-Gm-Message-State: AOJu0YwSd34CLbC9raPOaZVrzcxrxQ75akEOj38F3f9kqu0PIs3sTdu0
	v2ce95JWCJ8B0AQQF6Tf39TnqkroQ+P+MRoy0tmXx9qXIAnY/EOODNTyeN5RDtkuEg==
X-Gm-Gg: AeBDievw89HHTvL12qGbKJWIKiIH77QEbjODNRjrHrjdygPo1N8PBAIsVNggHoLK0eC
	hiDunSeDVpd7CrFV/XMYL/+XlAo6HNUV5bUL/GyalvW45bvc881R6olFh/UNBFheDTKl/98BoBO
	9mTIhtlDVnrwq9wG+ghYfwBg1SDUtkCTCD0/sveOUIDkEzp1nuwFFtcyT6PM/EPPLv9CU8yy9I+
	P5+dja3POaKl3aq9SWthIPPi4+GT93JMW1JwJBwNuliw4bwolgEVvCh1NK23stnqQwpTA0hDGtL
	0PlXbu5pZiNA4Bl/RH27qWWzzl80SK+Slqn/7+ejGfadBDTVGgsw76GqmYEMx6hgjGZ80blA2Qm
	2wSOVzhX5QA9/PmUOqTk3hA0meUm7c3HpfVWykHv0tsxq2XnEJzEkrLnNM3J+cBJv8x7lRSaG/j
	tt6JM2EYK8zG/2UACs9pbQtsoBCdFsvGUuuxKAwkq7WCZ/bPVtPYMPeAQXgAv+HxOswtdREL3Ko
	gQdkf3DqquDWKhv/Q==
X-Received: by 2002:a05:6a20:939d:b0:398:6ea8:21f7 with SMTP id adf61e73a8af0-3aa5a9559ebmr11751571637.15.1778222202210;
        Thu, 07 May 2026 23:36:42 -0700 (PDT)
Received: from wenstp920.tpe.corp.google.com ([2a00:79e0:201d:8:bac0:e137:a29f:62c])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-83967dbee14sm14850717b3a.48.2026.05.07.23.36.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 07 May 2026 23:36:41 -0700 (PDT)
From: Chen-Yu Tsai <wenst@chromium.org>
To: Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Ryder Lee <ryder.lee@mediatek.com>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	=?UTF-8?q?Krzysztof=20Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
	Manivannan Sadhasivam <mani@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Bjorn Helgaas <bhelgaas@google.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: Chen-Yu Tsai <wenst@chromium.org>,
	devicetree@vger.kernel.org,
	linux-pci@vger.kernel.org,
	linux-mediatek@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] dt-bindings: PCI: mediatek-gen3: Allow memory-region for restricted DMA buffer
Date: Fri,  8 May 2026 14:36:32 +0800
Message-ID: <20260508063633.3894348-1-wenst@chromium.org>
X-Mailer: git-send-email 2.54.0.563.g4f69b47b94-goog
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260507_233643_714481_996A5419 
X-CRM114-Status: GOOD (  11.91  )
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

On some SoCs without an IOMMU behind the PCIe controller, the PCIe
controller memory access could be limited to a small region by the
firmware configuring a memory protection unit. This memory region
must be assigned to the PCIe controller so that the OS knows to
use that region. Otherwise PCIe devices would not work properly.

Allow the memory-region property with one item pointing to a
restricted DMA buffer.

Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>
---
This patch compliments another patch that moved the memory-region from
the PCIe device to the PCIe controller [1].

[1] https://lore.kernel.org/all/20260430120725.241779-1-wenst@chromium.org/

 Documentation/devicetree/bindings/pci/mediatek-pcie-gen3.yaml | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/Documentation/devicetree/bindings/pci/mediatek-pcie-gen3.yaml b/Documentation/devicetree/bindings/pci/mediatek-pcie-gen3.yaml
index 4db700fc36ba..4a9e41d01628 100644
--- a/Documentation/devicetree/bindings/pci/mediatek-pcie-gen3.yaml
+++ b/Documentation/devicetree/bindings/pci/mediatek-pcie-gen3.yaml
@@ -115,6 +115,10 @@ properties:
   power-domains:
     maxItems: 1
 
+  memory-region:
+    maxItems: 1
+    description: phandle to restricted DMA buffer
+
   mediatek,pbus-csr:
     $ref: /schemas/types.yaml#/definitions/phandle-array
     items:
-- 
2.54.0.563.g4f69b47b94-goog


