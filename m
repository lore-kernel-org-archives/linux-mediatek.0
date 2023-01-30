Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 07EDCC54EED
	for <linux-mediatek@archiver.kernel.org>; Mon, 30 Jan 2023 10:32:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ZPoBz9/1/N6ODRgUu0zywPKZ5Pb9peKUsXrjhFsletU=; b=TL0Weu55tBpTNm5OSUaZdmiRQg
	u3rpHxcAJ1B55grmEo+lzL67NReCTZuQpuR/8FJBNzfcXKI7ZpURgk8Karp7H5qq7hHmdw4sELMx1
	9xFAHW4WlN7oVwsJK/pjYuZxeTzzfRv+DwJXuKfKYa53kD2nj2Ud+a96mgCjPNc3LcCRWttOu8GED
	x8qCX3XDdtL2ELzgyTGisinMXYdBeKPI7wdg4MjaOIn0jhk51/Uv/QrbuabmME7I0uEKQmDrbt51R
	YPuBJCU3snyeQ+CoChn6wdSYdL9z00S5t9CkHXPrBzqsG31i3jLZMsXP6+DiWBudZbUfMZn/q/7i9
	wF6vCXoA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pMRSK-0038K0-5E; Mon, 30 Jan 2023 10:32:08 +0000
Received: from mail-wr1-x42b.google.com ([2a00:1450:4864:20::42b])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pMRN3-0037Oy-3s
	for linux-mediatek@lists.infradead.org; Mon, 30 Jan 2023 10:26:42 +0000
Received: by mail-wr1-x42b.google.com with SMTP id h12so10537759wrv.10
        for <linux-mediatek@lists.infradead.org>; Mon, 30 Jan 2023 02:26:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ZPoBz9/1/N6ODRgUu0zywPKZ5Pb9peKUsXrjhFsletU=;
        b=ZRyN6STZ1TLPVz4LQ6q3JE4PIWOJj1I9SrDzQgnNUxCnJuucnPb47K5T+FT5VJqJhK
         O7/cyqU8K6RTZ+xoZ92FBBgXMi1SXmIumyAw3zE49VeVoVkCg+xC4bMIp9CwVBpGwgV+
         y1MxJbFLq0iCWns2b+hVFDDcpyNc720nV1LmafAtHn/n2W96sBotkpDyOvna77pG9sP6
         pPdfwpT2P+ZdYR6Qk6guRYpEpokyLcJ7bBJ2yNGthRpuCqIw7AOsVGJ/Yib4yo/Oh8fN
         FVTH/apMKrbFOcEOzGxtAc29B7xT//JupyxHXJDrXcqSVdyNziI2+Z/zZVg0y0FIe7Fe
         jywQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ZPoBz9/1/N6ODRgUu0zywPKZ5Pb9peKUsXrjhFsletU=;
        b=fvQG0hloyX0lJRPnOTNUuWCYc0GUy+/XnYMV3ey1/shzykGjtJQiDC06mkfPUF45x/
         4BR+fN9qretY+nv6DZpwmKYy8qZH3cuFe6mY1yGKyqIVGxjSN/XSXa5Eu2Cv1YV6Vjep
         mnChhlmuJnuHwgFCGMgW7Nk9tlRrHCX7KZ82UcXTcHPdIKBNAWvXL4VAjILR9i2hlpiT
         asCvVA7IjshvLKJoPMxBS4EVs8y+7Nex/L0SpISuq6y5/8ET+ZsntViiZNFPjZkcDlZ4
         fT9F1k7LvFrwroNbwMGXMb1TYqTIKpxjTRxwVgR09hpPG6AIkBf+xhvnuSBjnfkbtDrx
         ilSg==
X-Gm-Message-State: AFqh2koxT1a8Qw0fi3Qc9uEzf+4arFqJWLCcJg57fyonXY//OjvtxnKE
	BMdsch4KX5XklHz6lhFL80j+uA==
X-Google-Smtp-Source: AMrXdXsW7ZQDGKlzFTYhQEjR+p+Zk8AHHZFaUSI9MHLnvUkGztcTA7MZHFFlS/Gqk/Zh0lJ9wDVJ1g==
X-Received: by 2002:a05:6000:1e18:b0:2bc:846a:8ead with SMTP id bj24-20020a0560001e1800b002bc846a8eadmr46483687wrb.37.1675074399921;
        Mon, 30 Jan 2023 02:26:39 -0800 (PST)
Received: from alex-T14.baylibre (laubervilliers-658-1-213-31.w90-63.abo.wanadoo.fr. [90.63.244.31])
        by smtp.gmail.com with ESMTPSA id s5-20020a5d5105000000b002bdfcd8c77csm11426785wrt.101.2023.01.30.02.26.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 30 Jan 2023 02:26:39 -0800 (PST)
From: Alexandre Bailon <abailon@baylibre.com>
To: yong.wu@mediatek.com,
	joro@8bytes.org,
	will@kernel.org
Cc: robin.murphy@arm.com,
	matthias.bgg@gmail.com,
	krzysztof.kozlowski@linaro.org,
	robh+dt@kernel.org,
	iommu@lists.linux.dev,
	linux-mediatek@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	Alexandre Bailon <abailon@baylibre.com>
Subject: [PATCH 3/3] dt-bindings: iommu: memory: Use unmanaged iommu domain for the APU
Date: Mon, 30 Jan 2023 11:27:22 +0100
Message-Id: <20230130102722.133271-4-abailon@baylibre.com>
X-Mailer: git-send-email 2.38.2
In-Reply-To: <20230130102722.133271-1-abailon@baylibre.com>
References: <20230130102722.133271-1-abailon@baylibre.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230130_022641_183947_4ADC386C 
X-CRM114-Status: GOOD (  10.21  )
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

This updates the iommu id to use unmanaged iommu domain for the APU.
This is required by remoteproc to use the iommu.

Signed-off-by: Alexandre Bailon <abailon@baylibre.com>
---
 include/dt-bindings/memory/mediatek,mt8365-larb-port.h | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/include/dt-bindings/memory/mediatek,mt8365-larb-port.h b/include/dt-bindings/memory/mediatek,mt8365-larb-port.h
index 56d5a5dd519e7..86d82a8f6017d 100644
--- a/include/dt-bindings/memory/mediatek,mt8365-larb-port.h
+++ b/include/dt-bindings/memory/mediatek,mt8365-larb-port.h
@@ -24,8 +24,8 @@
 #define M4U_PORT_MDP_WROT0		MTK_M4U_ID(M4U_LARB0_ID, 7)
 #define M4U_PORT_MDP_RDMA1		MTK_M4U_ID(M4U_LARB0_ID, 8)
 #define M4U_PORT_DISP_FAKE0		MTK_M4U_ID(M4U_LARB0_ID, 9)
-#define M4U_PORT_APU_READ		MTK_M4U_ID(M4U_LARB0_ID, 10)
-#define M4U_PORT_APU_WRITE		MTK_M4U_ID(M4U_LARB0_ID, 11)
+#define M4U_PORT_APU_READ		MTK_M4U_UNMANAGED_ID(M4U_LARB0_ID, 10)
+#define M4U_PORT_APU_WRITE		MTK_M4U_UNMANAGED_ID(M4U_LARB0_ID, 11)
 
 /* larb1 */
 #define M4U_PORT_VENC_RCPU		MTK_M4U_ID(M4U_LARB1_ID, 0)
-- 
2.38.2


