Return-Path: <SRS0=VpQz=L2=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 37CD6C11F68
	for <linux-mediatek@archiver.kernel.org>; Fri,  2 Jul 2021 10:24:06 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id F31F961410
	for <linux-mediatek@archiver.kernel.org>; Fri,  2 Jul 2021 10:24:05 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org F31F961410
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=chromium.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=MoIZq963znxw11NOOgQhDogITy3Zj91qVw29UIrBAuc=; b=ILJG6rXeV7I+So
	5dKNfwR6aEjg6Gdp9vVujAM0cNtG8G5CjFYmWO+rsS2a8o6B3ij3+dffIkSP7DDHbZ6mrzlmJyEns
	vi8T6AHa3vP3kwMOOfC3iEpaCz2GNzwAfkOe/Ipam+Y1IfZKdIzoLMSHw8HIH8xVCUP5A2syE5TUS
	rCM86p99cjakLzYavpAxQQfpIWo8UE4xDXleo9IB5UUjjEFGLLS2feMqFPjyxoSKJ+DjY8NG27jw7
	5/7cJJmcGsyzbFLobA/wUfSFdxhjQs2lARta5sE9Q8ASrgrTLZVuf7FtAdWM6MhlEU31HxJgBpdt4
	Ro1Sjp5wW+m6Ej2rJszw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1lzGKz-002kz4-0Q; Fri, 02 Jul 2021 10:23:57 +0000
Received: from mail-pg1-x534.google.com ([2607:f8b0:4864:20::534])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1lzGKP-002kow-Ia
 for linux-mediatek@lists.infradead.org; Fri, 02 Jul 2021 10:23:23 +0000
Received: by mail-pg1-x534.google.com with SMTP id m26so9086619pgb.8
 for <linux-mediatek@lists.infradead.org>; Fri, 02 Jul 2021 03:23:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=jp+Bhq4lKPiXlt4EaMla6Yc+MtggvqEHex3ImjFAmEU=;
 b=PWpyV8RSDVBda3F+KD+HwhmTw+MqtWuLLQXquKBpQIH5TTz0HMydEa6poyzI2T46Mz
 bKv4jJquVOihYOLEiuVq351KwNgctRsTxbZKAsXMJNP90FCyWbwCdXx+XiRORyGlHFKf
 nNBf1bIu4EkQxHIs3EEqgPGOl4UCgHvA3XDfE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=jp+Bhq4lKPiXlt4EaMla6Yc+MtggvqEHex3ImjFAmEU=;
 b=qCYO5C7p8/9x36Bli1/zLTQzQG0CkF76k6nON0m4MmIdsMxPf3KO/SUpGkYEAXoLUD
 rfTBtbutVkO1gPGgWS1hCFkViNrw5S3AttwQkoQav9RqkPg9x3k4RrpMOInbGGKp14LO
 zprLluVLl6RO0u8BzKaMyMvnrsO7lV6kNox8YTS9WeY04M52BBH84c0BUwCImjfj0tzT
 vKDzreAF3QhtDTKQLIFm+d+oT+omn+LIpljT5qeINxmrxqn8PCsTUJZp835/3E14tu0C
 PL0+Pux8ogEzvFUtDGmygdcl2aSAW9uxz1grFMM1OQpfaftJ9fXKNfgyJA7pA/Z8E2lw
 mFKw==
X-Gm-Message-State: AOAM530LhE5Zi4rFumknLuJkyXxNMNQ7iXyPxBz/UO7ltQ9kKEYZnBId
 iqv5uk58ZGBGSJp6MVIPKg1gXQ==
X-Google-Smtp-Source: ABdhPJwoOPVoCSfUpMXiGFWZ9icm7QWpEkvqB7rr6mfeotvi+E2V0XfrHm9+YgiEdsFt0c9hFbdIcQ==
X-Received: by 2002:a05:6a00:15d3:b029:308:b2ed:6560 with SMTP id
 o19-20020a056a0015d3b0290308b2ed6560mr4603080pfu.32.1625221400502; 
 Fri, 02 Jul 2021 03:23:20 -0700 (PDT)
Received: from hsinyi-z840.tpe.corp.google.com
 ([2401:fa00:1:10:b63b:3ac0:4dda:fdd2])
 by smtp.gmail.com with ESMTPSA id d13sm2863484pfn.136.2021.07.02.03.23.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 02 Jul 2021 03:23:20 -0700 (PDT)
From: Hsin-Yi Wang <hsinyi@chromium.org>
To: Matthias Brugger <matthias.bgg@gmail.com>,
 Rob Herring <robh+dt@kernel.org>,
 Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
 linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org,
 maoguang.meng@mediatek.com, yong.wu@mediatek.com
Subject: [PATCH v5 RESEND 3/3] arm64: dts: mt8183: add jpeg enc node for mt8183
Date: Fri,  2 Jul 2021 18:23:04 +0800
Message-Id: <20210702102304.3346429-3-hsinyi@chromium.org>
X-Mailer: git-send-email 2.32.0.93.g670b81a890-goog
In-Reply-To: <20210702102304.3346429-1-hsinyi@chromium.org>
References: <20210702102304.3346429-1-hsinyi@chromium.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210702_032321_684294_0819BD1E 
X-CRM114-Status: GOOD (  11.20  )
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

From: Maoguang Meng <maoguang.meng@mediatek.com>

Add jpeg encoder device tree node.

Signed-off-by: Maoguang Meng <maoguang.meng@mediatek.com>
Signed-off-by: Hsin-Yi Wang <hsinyi@chromium.org>
---
 arch/arm64/boot/dts/mediatek/mt8183.dtsi | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/arch/arm64/boot/dts/mediatek/mt8183.dtsi b/arch/arm64/boot/dts/mediatek/mt8183.dtsi
index f90df6439c088..ca8ad953de914 100644
--- a/arch/arm64/boot/dts/mediatek/mt8183.dtsi
+++ b/arch/arm64/boot/dts/mediatek/mt8183.dtsi
@@ -1435,6 +1435,18 @@ larb4: larb@17010000 {
 			power-domains = <&spm MT8183_POWER_DOMAIN_VENC>;
 		};
 
+		venc_jpg: venc_jpg@17030000 {
+			compatible = "mediatek,mt8183-jpgenc", "mediatek,mtk-jpgenc";
+			reg = <0 0x17030000 0 0x1000>;
+			interrupts = <GIC_SPI 249 IRQ_TYPE_LEVEL_LOW>;
+			mediatek,larb = <&larb4>;
+			iommus = <&iommu M4U_PORT_JPGENC_RDMA>,
+				 <&iommu M4U_PORT_JPGENC_BSDMA>;
+			power-domains = <&spm MT8183_POWER_DOMAIN_VENC>;
+			clocks = <&vencsys CLK_VENC_JPGENC>;
+			clock-names = "jpgenc";
+		};
+
 		ipu_conn: syscon@19000000 {
 			compatible = "mediatek,mt8183-ipu_conn", "syscon";
 			reg = <0 0x19000000 0 0x1000>;
-- 
2.32.0.93.g670b81a890-goog


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
