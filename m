Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EE1FDCE8D7A
	for <linux-mediatek@archiver.kernel.org>; Thu, 19 Sep 2024 11:24:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=dMIeIkBw/sEwhttTsHHImWJDak9J5XbBMV3Q0L0EynM=; b=dwEF6zU27eRsTSGRoox9nWszaR
	bnDQYXoGVQCqmLcaW2AaE/ss1Gv1BKubiznyx5Wdsg6A9Ub0+X9pLjUFAVMWcuSl4mRuw8GK9E3gG
	n7sJ5mxuqFBCXCJRdgfS+Bel8eb9bh36KFTyZ2KRH4xhg3k0WTNNqn1rmd6wWoWMEz213IKPqmoXF
	u4PQrUs1d2qsrBuf13kybrdhLNtWXzTTky5YsoKVwFGSOJVNumBrO+TfIrmKIEmqEf4ysJM5bJ8Sn
	5A2dbIJHz6JkeraxVMDN/GDeAv5BJfj7qr8e0vn7gBagDLa8XFjjGXFDlxpvzKh88rVDghEj84fFg
	LlXU+Zhg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1srFGn-0000000A9Oy-2c1v;
	Thu, 19 Sep 2024 11:24:21 +0000
Received: from mail-pl1-x62f.google.com ([2607:f8b0:4864:20::62f])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1srFEg-0000000A92h-0iMR
	for linux-mediatek@lists.infradead.org;
	Thu, 19 Sep 2024 11:22:11 +0000
Received: by mail-pl1-x62f.google.com with SMTP id d9443c01a7336-205909afad3so9073595ad.2
        for <linux-mediatek@lists.infradead.org>; Thu, 19 Sep 2024 04:22:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1726744929; x=1727349729; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=dMIeIkBw/sEwhttTsHHImWJDak9J5XbBMV3Q0L0EynM=;
        b=fp4GSj2ji5d0Fpuu7kPapySnKbnlxFzBF/+ksf+TCwHNpvROSCTwuemulmMTjlWqKy
         QITSe/v+oc01CM97hDOY6xqeD0h04w10hwzLk8cMevzoqvCRgRLK7DE5a85V9rgq5TfE
         YUqxV3bmXXjMgqKoN3hphEjxYuRtLkXDrliT0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1726744929; x=1727349729;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=dMIeIkBw/sEwhttTsHHImWJDak9J5XbBMV3Q0L0EynM=;
        b=Q3iBnmZKxcp2cZukI+ibYsn8QvawI2PbuulJGl883omXeiqC+ntMI8OwARtVergX1B
         ffxq/HBxs+LW4PrF5wsgTYTwORQm6iydHqAqKNAUwkDp5bNZ9teb7W5uItlAgyvQqO1C
         P6ajp38ney3u1e1EoB3V/RSKrmwZhQ05Npx5Iy4Mbn6SRpPKndr0WwLTEcvuyF+Na1K7
         FZ7mytUzJh5cOp4KtrCEBb8eMxl3l2oDmBoT/QEAXIxaYBVeVJWbo2wtZBBuvRRoN235
         Xuxs3NmaMLYGRNcMFSMFbGR7NwFM4gyW8nVdFYxJxr5hTENkuVlnUxT4nLQa0tjdOUlH
         UAlQ==
X-Gm-Message-State: AOJu0YxPPyXpVJZx1lKr8CM1tz2+h8/csrpoMgVnNCODoZn7fAAsEmAB
	7DtNVo9+ZJ+iac/E/MhM1b8eLpqxPn+oaFrPOpn3RkCMNtWx0epk4MGOP8yAqg==
X-Google-Smtp-Source: AGHT+IFk5QDD/1gNzdKSfHXjASXaeXEteAWqOOFjRzNyDZr+9gLzrRtZ1AYty5vAcEPcBwRhs9emFQ==
X-Received: by 2002:a17:902:ced0:b0:205:937f:3ae3 with SMTP id d9443c01a7336-2076e3ea569mr391568935ad.44.1726744929503;
        Thu, 19 Sep 2024 04:22:09 -0700 (PDT)
Received: from localhost (117.196.142.34.bc.googleusercontent.com. [34.142.196.117])
        by smtp.gmail.com with UTF8SMTPSA id d9443c01a7336-207946fb724sm78146305ad.200.2024.09.19.04.22.07
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 19 Sep 2024 04:22:09 -0700 (PDT)
From: Rohit Agarwal <rohiagar@chromium.org>
To: chunkuang.hu@kernel.org,
	krzk+dt@kernel.org,
	ck.hu@mediatek.com,
	robh@kernel.org
Cc: linux-mediatek@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	Rohit Agarwal <rohiagar@chromium.org>,
	kernel test robot <lkp@intel.com>
Subject: [PATCH v2 2/2] dt-bindings: display: mediatek: dpi: Add power domain for MT8195 DP_INTF
Date: Thu, 19 Sep 2024 11:21:52 +0000
Message-ID: <20240919112152.2829765-3-rohiagar@chromium.org>
X-Mailer: git-send-email 2.46.0.792.g87dc391469-goog
In-Reply-To: <20240919112152.2829765-1-rohiagar@chromium.org>
References: <20240919112152.2829765-1-rohiagar@chromium.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240919_042210_236038_16BFECCB 
X-CRM114-Status: UNSURE (   9.12  )
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

Add power domain binding for MT8195 DP_INTF that resolves the following
error and many more similar ones:

arch/arm64/boot/dts/mediatek/mt8195-cherry-dojo-r1.dtb: dp-intf@1c113000:
power-domains: False schema does not allow [[55, 18]]

Reported-by: kernel test robot <lkp@intel.com>
Closes: https://lore.kernel.org/oe-kbuild-all/202409102119.AYvaTjUi-lkp@intel.com/
Fixes: 5474d49b2f79 ("dt-bindings: display: mediatek: dpi: Add power domains")
Signed-off-by: Rohit Agarwal <rohiagar@chromium.org>
---
 .../devicetree/bindings/display/mediatek/mediatek,dpi.yaml       | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/display/mediatek/mediatek,dpi.yaml b/Documentation/devicetree/bindings/display/mediatek/mediatek,dpi.yaml
index 1e748ee23fc7..201f1696854f 100644
--- a/Documentation/devicetree/bindings/display/mediatek/mediatek,dpi.yaml
+++ b/Documentation/devicetree/bindings/display/mediatek/mediatek,dpi.yaml
@@ -90,6 +90,7 @@ allOf:
                 - mediatek,mt8173-dpi
                 - mediatek,mt8183-dpi
                 - mediatek,mt8186-dpi
+                - mediatek,mt8195-dp-intf
     then:
       properties:
         power-domains: false
-- 


