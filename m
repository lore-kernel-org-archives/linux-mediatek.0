Return-Path: <SRS0=auVy=K3=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D11F4C4708F
	for <linux-mediatek@archiver.kernel.org>; Tue,  1 Jun 2021 04:00:48 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 983546127C
	for <linux-mediatek@archiver.kernel.org>; Tue,  1 Jun 2021 04:00:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 983546127C
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=chromium.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=5Oen5Q4YEeGb26mXCccZ4P/JOrgEJ8I8oDNXMSvVxhY=; b=vx5/U83MLdjUtK
	7SglJEJiapwZar7On6gEtLSDNiogkVN8oQt/GTFgTNE/LqTQh5FTKcGnr61gsufL6zXK0rqQV2DX8
	ms3Twv7r4VXdhFv8IAC7SApIrEf90plnt1h/LvKZtw9OKSLqvSmfOAnNE6boy0SrM8+7k4zPWjNeA
	uVClLczP+y04EtE+j++rX5TRtBx21h0IuF0RkuEFUPvpYXlxcLx0eUuQI2s6fTZ5gv9K/U3N4hm4f
	P8NuSbbm0CkPWUEfAbgHoWzFNXXT0UoQIqRU/rGYF2SYC9EdN+QVJYV37CX62Oya/y8mX4J6qOU0G
	scD/RjEOY5vXcNrG4B6Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1lnva3-00ESsu-Og; Tue, 01 Jun 2021 04:00:39 +0000
Received: from mail-pj1-x1034.google.com ([2607:f8b0:4864:20::1034])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1lnvZp-00ESo5-E1
 for linux-mediatek@lists.infradead.org; Tue, 01 Jun 2021 04:00:26 +0000
Received: by mail-pj1-x1034.google.com with SMTP id
 lx17-20020a17090b4b11b029015f3b32b8dbso678773pjb.0
 for <linux-mediatek@lists.infradead.org>; Mon, 31 May 2021 21:00:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=k3CXuIHvguEKDy/ECWlq3WX2NJbLw9/l4D5j8nQaStQ=;
 b=UPTILnt9B7+RBltwKhRkE3pDiFM447zC45wGOtGp30p7Gacb2MTU7rMY3naqzhfpLz
 VH4yJnFNaFN5lr1cF4PURM4D81wWhql55YMgqGbvu9NflrxWS1MnLdwlj5TPlHefOIO4
 Yt2BOQjYlm0lzGkyu7DibJv5p+gDjuJLdvj4E=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=k3CXuIHvguEKDy/ECWlq3WX2NJbLw9/l4D5j8nQaStQ=;
 b=EniRdzDCR5ZkS5Pwb9BMoCXf4Ma/uHtQCYW4gBX8WxJTz+AAWavsE9Ure3ZTuMVNJT
 rxhUJNHhVlwnkaxTJuDzQn6fZP5hxBtOp04eGx97112i93Ie1b25noB2H6CAEyvANbQ8
 JWPlO/4F6Nc5qzcEEjGU1/mTmbbf4MZrJh20JIM/4CfQnS5p0WD0kB8vnMLCL343V+/Q
 lfiChK320WxvRrUQ6nWsr0ow60uFT9Rl3wccBMcJEKeTQJufhue/wjrbD4IGAcI6nqCF
 Utt/ShibNOVVfBbs4bo/FadAUGuTNB++QAG3OQWLvZUfghvva2Om0+y4Oqa60VTPd+Vz
 SS9g==
X-Gm-Message-State: AOAM5311f24ibCCi0mEz3WFzqko98Hg35DQRdxefi5kCIXoAkjkD6vIH
 uJbMKwvAwkNxK88rNIUFzeZ0Fw==
X-Google-Smtp-Source: ABdhPJxVRZNWrzNMHtMZqws3k5caqBWHpgoq/Euc0BFxsKp0hxH4Lc9Fj8WdYMvbSZCNfIab89LMoQ==
X-Received: by 2002:a17:90a:9517:: with SMTP id
 t23mr2477148pjo.130.1622520019059; 
 Mon, 31 May 2021 21:00:19 -0700 (PDT)
Received: from hsinyi-z840.tpe.corp.google.com
 ([2401:fa00:1:10:5f83:3563:b780:4d82])
 by smtp.gmail.com with ESMTPSA id 191sm11866953pfx.121.2021.05.31.21.00.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 31 May 2021 21:00:18 -0700 (PDT)
From: Hsin-Yi Wang <hsinyi@chromium.org>
To: Matthias Brugger <matthias.bgg@gmail.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 linux-kernel@vger.kernel.org, Rob Herring <robh+dt@kernel.org>,
 Enric Balletbo i Serra <enric.balletbo@collabora.com>,
 chun-jie.chen@mediatek.corp-partner.google.com,
 Yong Wu <yong.wu@mediatek.com>
Subject: [PATCH v2 3/3] arm64: dts: mt8183: remove syscon from smi_common node
Date: Tue,  1 Jun 2021 12:00:14 +0800
Message-Id: <20210601040014.2970805-1-hsinyi@chromium.org>
X-Mailer: git-send-email 2.32.0.rc0.204.g9fa02ecfa5-goog
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210531_210025_505806_D06E0EBF 
X-CRM114-Status: UNSURE (   9.83  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

We don't need to register smi_common as syscon. Also add required
property power-domains for this node.

Signed-off-by: Hsin-Yi Wang <hsinyi@chromium.org>
Reviewed-by: Enric Balletbo i Serra <enric.balletbo@collabora.com>
---
 arch/arm64/boot/dts/mediatek/mt8183.dtsi | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/mediatek/mt8183.dtsi b/arch/arm64/boot/dts/mediatek/mt8183.dtsi
index c5e822b6b77a..e074c0d402ff 100644
--- a/arch/arm64/boot/dts/mediatek/mt8183.dtsi
+++ b/arch/arm64/boot/dts/mediatek/mt8183.dtsi
@@ -1263,13 +1263,14 @@ larb0: larb@14017000 {
 		};
 
 		smi_common: smi@14019000 {
-			compatible = "mediatek,mt8183-smi-common", "syscon";
+			compatible = "mediatek,mt8183-smi-common";
 			reg = <0 0x14019000 0 0x1000>;
 			clocks = <&mmsys CLK_MM_SMI_COMMON>,
 				 <&mmsys CLK_MM_SMI_COMMON>,
 				 <&mmsys CLK_MM_GALS_COMM0>,
 				 <&mmsys CLK_MM_GALS_COMM1>;
 			clock-names = "apb", "smi", "gals0", "gals1";
+			power-domains = <&spm MT8183_POWER_DOMAIN_DISP>;
 		};
 
 		imgsys: syscon@15020000 {
-- 
2.32.0.rc0.204.g9fa02ecfa5-goog


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
