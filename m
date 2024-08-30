Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EA347CA0EE1
	for <linux-mediatek@archiver.kernel.org>; Fri, 30 Aug 2024 07:07:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=xfKg3et82GR8Ut+Mah5KVc5YDnZncDhvNa0IoupXc1A=; b=Tvz1OjL6HgZ5i0OxOORB6jM7mo
	GNRQGED/nm/pelLvy4+mjPaghQcL3nO0og8d1gpBEMLYqGKYrRUnfwp/5F6OmIryscWWbNpkUir3o
	/P/2ozlPmO+Qy9ar3FPe1hFHg/J3oIYByN/DRFMAzlDgFMtyFlWocnr6iRo5I/t/GZdV2SAqHLAmV
	/w5VJ+FZ64x46opHBPVm1TugnyIRrgsSnXSmrYz3El5RVnF43dJw0oSgdWrIyAaWUmUY04OJvmH8u
	pgkdKOhkr5ORsY1PMawZV1jRJCxHzcZ2jWz8McvFgVPyWeJgRtIe97vk1+hyH5btO7cuR7UfRBUG0
	j7Nhvq9g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sjvjR-000000053Gw-2fRh;
	Fri, 30 Aug 2024 07:07:41 +0000
Received: from mail-ej1-x631.google.com ([2a00:1450:4864:20::631])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sjvgY-000000052Gw-48wH
	for linux-mediatek@lists.infradead.org;
	Fri, 30 Aug 2024 07:04:46 +0000
Received: by mail-ej1-x631.google.com with SMTP id a640c23a62f3a-a83562f9be9so161875766b.0
        for <linux-mediatek@lists.infradead.org>; Fri, 30 Aug 2024 00:04:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1725001481; x=1725606281; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xfKg3et82GR8Ut+Mah5KVc5YDnZncDhvNa0IoupXc1A=;
        b=OOrIqqWXApOcXZCAXjJPF073o4SG1mvB3HoUWEO0QB9VumhJeRAwfLPK3V1YNRhqBl
         ST//GcfcB0wH7XlqWJXbOUdsqnPmFLTwpMXpsI6Y41SMIU08rYllvXlmzvqOZt7pO3sM
         iTCccOUv4DVFJ8ijp/LaNDxZ2sEfmAulvrpkSEoNSAyzivhN1UfPPLrQwuOOVnv6BKM9
         40xb4FwLXKHv5h/E3SCDHZjTqD6H0cN7Fgz77n4WSlg4CStY7CwZiWaIRuMO8RpdgtkH
         Mw70V8sjVyZ8H4wcIEZXFa9jXrM2S8Fl9KUs3anmIp5FtfftP6T3MycZnHwfe+2l/7Bt
         bQgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725001481; x=1725606281;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=xfKg3et82GR8Ut+Mah5KVc5YDnZncDhvNa0IoupXc1A=;
        b=jd/O8Bzt8/cqWYGonCe85pTsFAAdz/raw4QVyMy6MBr85teocIzhqyZF/lHFPCyqcp
         rABooNvSbhBrMxHoX61783JPf2bbEDRh45bwNHQGPXja0Zaq8aIofuPcXIidKiZIjW4k
         kejeIyHGLiRi5KXR/h8gLuHGtnctxtKcBBV3enosLJ572tRRDoxxMm6ANam7sqPaDcxT
         rXmsDIgzqpG3QMxojK5dezYeweLvv/W0+8bhA5OmWfZ0epHCVfCz7ID/gKWjzPXfV4Mc
         a1FXwgR+L3V3vGnOug2k9I9DdciqvrrFfuwwLO1uDPuvyLtsZVPVyhi5NKQY0ERqXXu6
         ZqCg==
X-Forwarded-Encrypted: i=1; AJvYcCWswqb25l6uPvVRWqO5U8fF7pROMYe7CdGPtihRZwRmhJD7lMp/ctFCWejfrDPtWe6QPviHlsWSF/STYvvnmg==@lists.infradead.org
X-Gm-Message-State: AOJu0Yz+lO/vKVBt/IJOj5crFIrGROvM5Ap6ATpb0YtQosszvHYhblY6
	49ECRMO9F6Vug4xJiDzaHR1l3RtVkQ2U/L91yzB4I/pRoxyFHX2TZzPBn4oQU1U=
X-Google-Smtp-Source: AGHT+IECnqDtOxbvfOy9sPbk0lCyiNAqNWYzneroZfijzEEU+LtepnDur/LFnUatGwBb6xPr3tERGg==
X-Received: by 2002:a17:907:6d0a:b0:a86:7f6a:8779 with SMTP id a640c23a62f3a-a897fad4d42mr418259566b.57.1725001481050;
        Fri, 30 Aug 2024 00:04:41 -0700 (PDT)
Received: from rayden.urgonet (h-217-31-164-171.A175.priv.bahnhof.se. [217.31.164.171])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a89892232c7sm178026866b.222.2024.08.30.00.04.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 Aug 2024 00:04:40 -0700 (PDT)
From: Jens Wiklander <jens.wiklander@linaro.org>
To: linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-media@vger.kernel.org,
	dri-devel@lists.freedesktop.org,
	linaro-mm-sig@lists.linaro.org,
	op-tee@lists.trustedfirmware.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Cc: Olivier Masse <olivier.masse@nxp.com>,
	Thierry Reding <thierry.reding@gmail.com>,
	Yong Wu <yong.wu@mediatek.com>,
	Sumit Semwal <sumit.semwal@linaro.org>,
	Benjamin Gaignard <benjamin.gaignard@collabora.com>,
	Brian Starkey <Brian.Starkey@arm.com>,
	John Stultz <jstultz@google.com>,
	"T . J . Mercier" <tjmercier@google.com>,
	=?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
	Sumit Garg <sumit.garg@linaro.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Jens Wiklander <jens.wiklander@linaro.org>
Subject: [RFC PATCH 3/4] dt-bindings: reserved-memory: add linaro,restricted-heap
Date: Fri, 30 Aug 2024 09:03:50 +0200
Message-Id: <20240830070351.2855919-4-jens.wiklander@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240830070351.2855919-1-jens.wiklander@linaro.org>
References: <20240830070351.2855919-1-jens.wiklander@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240830_000443_105076_53D7A520 
X-CRM114-Status: GOOD (  13.48  )
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

From: Olivier Masse <olivier.masse@nxp.com>

DMABUF reserved memory definition for OP-TEE secure data path feature.

Signed-off-by: Olivier Masse <olivier.masse@nxp.com>
Signed-off-by: Jens Wiklander <jens.wiklander@linaro.org>
---
 .../linaro,restricted-heap.yaml               | 56 +++++++++++++++++++
 1 file changed, 56 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/reserved-memory/linaro,restricted-heap.yaml

diff --git a/Documentation/devicetree/bindings/reserved-memory/linaro,restricted-heap.yaml b/Documentation/devicetree/bindings/reserved-memory/linaro,restricted-heap.yaml
new file mode 100644
index 000000000000..0ab87cf02775
--- /dev/null
+++ b/Documentation/devicetree/bindings/reserved-memory/linaro,restricted-heap.yaml
@@ -0,0 +1,56 @@
+# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/reserved-memory/linaro,restricted-heap.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Linaro Secure DMABUF Heap
+
+maintainers:
+  - Olivier Masse <olivier.masse@nxp.com>
+
+description:
+  Linaro OP-TEE firmware needs a reserved memory for the
+  Secure Data Path feature (aka SDP).
+  The purpose is to provide a restricted memory heap which allow
+  the normal world OS (REE) to allocate/free restricted buffers.
+  The TEE is reponsible for protecting the SDP memory buffers.
+  TEE Trusted Application can access restricted memory references
+  provided as parameters (DMABUF file descriptor).
+
+allOf:
+  - $ref: "reserved-memory.yaml"
+
+properties:
+  compatible:
+    const: linaro,restricted-heap
+
+  reg:
+    description:
+      Region of memory reserved for OP-TEE SDP feature
+
+  no-map:
+    $ref: /schemas/types.yaml#/definitions/flag
+    description:
+      Avoid creating a virtual mapping of the region as part of the OS'
+      standard mapping of system memory.
+
+unevaluatedProperties: false
+
+required:
+  - compatible
+  - reg
+  - no-map
+
+examples:
+  - |
+  reserved-memory {
+    #address-cells = <2>;
+    #size-cells = <2>;
+
+    sdp@3e800000 {
+      compatible = "linaro,restricted-heap";
+      no-map;
+      reg = <0 0x3E800000 0 0x00400000>;
+    };
+  };
-- 
2.34.1


