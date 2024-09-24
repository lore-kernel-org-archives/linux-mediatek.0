Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9F0A9CF9C71
	for <linux-mediatek@archiver.kernel.org>; Tue, 24 Sep 2024 10:16:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=y57Ibtgt1zP23aWMDwtUVSUKvmV/IC2JcsKXN4OB9I8=; b=u2Hfl8aaceDc5V3uIIGEOuyBFq
	BT1O2uvXJlk6V97188X5pVA/xG/0zbcwvWg4XY6HOgTCB8tUQe2GB3+aZbpNqREhlLYwIxipIRc3M
	04OA/xTkb0JYM+VPFjAj2McctyDpeWdXktlymqtItx3O5Fac0rsUzMEXCZ82KVLWrB1eQEMeN8mxI
	4MxHDiW+EX4gh9UfdIwNB8QBOGILwgln00tHHBe7CVZzyjJ4Kp2DvhFq4LpMRbItE6CfBo/xqyf2x
	ZvFAbCgLII3unZjw/nYoPCVa9YVaCrOp1tI1+da8tce5cMmxIY5Muki5m+PtStsWQ1ks9SL6pSuqq
	0TtQr93A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1st2aZ-00000001y5f-2qeF;
	Tue, 24 Sep 2024 10:16:11 +0000
Received: from mail-pj1-x1033.google.com ([2607:f8b0:4864:20::1033])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1st2aW-00000001y3i-49Ru
	for linux-mediatek@lists.infradead.org;
	Tue, 24 Sep 2024 10:16:10 +0000
Received: by mail-pj1-x1033.google.com with SMTP id 98e67ed59e1d1-2d8a744aa9bso3602242a91.3
        for <linux-mediatek@lists.infradead.org>; Tue, 24 Sep 2024 03:16:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=compal-corp-partner-google-com.20230601.gappssmtp.com; s=20230601; t=1727172968; x=1727777768; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=y57Ibtgt1zP23aWMDwtUVSUKvmV/IC2JcsKXN4OB9I8=;
        b=lb/Gub8l31GM4I+4/M3DHObMjKqrM4WqWTdfQX+MbfxyAB49LqKFc2oQN33b1LGeu5
         f+U5HfpKuLQruCmcU7oNQgreai4bVkkh7j1J4vfy440LZCjaNbBL49T1P0cbWIP9fM6v
         JETrlYDYlr1+6mjE7uubs/b4FIWkvXZFoWeIkej5D5Fwaa+ut4NgKsHRZRMvWNXvY+31
         h/XzIVUUPFxQDVr7ZUn4uBFFk013YHcmP366HMYqslNHhFSyxnJAjtf29g5xJw+J+V/a
         Jojsd8gtioKbo1ebY9BGhC03uSN4XQVjt3UZXlEUOfweqCVBL5JqzOwY5KJ4k4OplCL6
         cIIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727172968; x=1727777768;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=y57Ibtgt1zP23aWMDwtUVSUKvmV/IC2JcsKXN4OB9I8=;
        b=oPp/5lqAiF6SYXTdnjUphFD0xwefSKY0+AXRxxCM+y0/vS3frA/NUiTst3kqP3Mj+E
         bGG1PcwdCcvB3CLQM+WnjSw0nIA2gCEyZvuzxhIMj1ifLtL80vSDh8GZ7ZYzIiCGlqYg
         eaeX/hx+DsvkVTrGvjgH9zSNNoVM4ysFItYQ7UV65oAlaAv5usoJjwS/DSveE99C0J9J
         oG/fNqjJxH+OEtkgeFnoK2dzeAOgcIxOQeXi7gRFtU0plsbV/6gKnz8owSV3VV5usPsy
         scDZqcgje0xWxoEgvfACYvESP4h19+WsQivsVuvBfC2zrGW3gxH5ucmewt1uXCl9+s0E
         JkVA==
X-Forwarded-Encrypted: i=1; AJvYcCXkns04ZdkYP/fCD9H+JgrLcfmGGdwPBUGA1ztt721JEXGHcXGcEdx7Jh6XMLAUMW/+6Bh7EXfceV4josNkmA==@lists.infradead.org
X-Gm-Message-State: AOJu0Yx8R5VU5hiQXk5QWz0iljqh8rSjISMGNFLPjdOIn3XQITU7kLzQ
	yAM2vzjG9p52nfLHmf1rq+8FdwU4AQCFaFpmUyDylyfS9jNiq4/61bX/gPx5dwc=
X-Google-Smtp-Source: AGHT+IHxkDIDooKDiN5trgHeA5d1FvvNdy8Qz1yU1ArIWXSbVdyscznYv2WTK7P+IqsQoLTzm8h/LA==
X-Received: by 2002:a17:90b:485:b0:2cf:c9ab:e747 with SMTP id 98e67ed59e1d1-2dd7f36cb4cmr19096154a91.1.1727172967663;
        Tue, 24 Sep 2024 03:16:07 -0700 (PDT)
Received: from maxweng-Latitude-7410.. (2001-b030-0251-0200-5beb-19f3-7d17-3d48.hinet-ip6.hinet.net. [2001:b030:251:200:5beb:19f3:7d17:3d48])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2e05b5c182fsm579290a91.1.2024.09.24.03.16.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Sep 2024 03:16:06 -0700 (PDT)
From: Max Weng <max_weng@compal.corp-partner.google.com>
To: linux-kernel@vger.kernel.org
Cc: max_weng@compal.corp-partner.google.com,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	matthias.bgg@gmail.com,
	angelogioacchino.delregno@collabora.com,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Subject: [PATCH v3] arm64: dts: mediatek: mt8186: add FHCTL node
Date: Tue, 24 Sep 2024 18:15:59 +0800
Message-Id: <20240924101559.879167-1-max_weng@compal.corp-partner.google.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240924_031609_216861_9129D20B 
X-CRM114-Status: UNSURE (   8.34  )
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

From: max_weng <max_weng@compal.corp-partner.google.com>

add FHCTL device node for Frequency Hopping and Spread Spectrum clock function.

Signed-off-by: Max Weng <max_weng@compal.corp-partner.google.com>
---
 Change from v2 to v3
 * Remove the Change-Id tag. 
 arch/arm64/boot/dts/mediatek/mt8186.dtsi | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/arch/arm64/boot/dts/mediatek/mt8186.dtsi b/arch/arm64/boot/dts/mediatek/mt8186.dtsi
index 148c332018b0..d3c3c2a40adc 100644
--- a/arch/arm64/boot/dts/mediatek/mt8186.dtsi
+++ b/arch/arm64/boot/dts/mediatek/mt8186.dtsi
@@ -29,6 +29,13 @@ aliases {
 		rdma1 = &rdma1;
 	};
 
+	fhctl: fhctl@1000ce00 {
+		compatible = "mediatek,mt8186-fhctl";
+		clocks = <&apmixedsys CLK_APMIXED_TVDPLL>;
+		reg = <0 0x1000ce00 0 0x200>;
+		status = "disabled";
+	};
+
 	cci: cci {
 		compatible = "mediatek,mt8186-cci";
 		clocks = <&mcusys CLK_MCU_ARMPLL_BUS_SEL>,
-- 
2.34.1


