Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3BC29C61DA4
	for <linux-mediatek@archiver.kernel.org>; Thu,  2 Feb 2023 10:40:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=PexX/V0c+w21JwIUEKWHSc7QoYhjon5sMZqAPNZ76zo=; b=PXXjsTsjgAk6W4rByXH51d182b
	qNjE6K16IdzmUY2syxwkmddVhU58l2UAMErPGJu9yZhJIpK1F23ssOVNN1KvOABiBqSdafysoMopO
	maGPtmYAQbFhdwSt3OCrhQ6hsakjBTwsjaoL3TRq2hlh1q7+uI0knOUhf2L5MT1x6D8oDH6l9U3Z6
	Oj6IP6wwN3r/ZId5XBjF8SDyKSmS0YHGx1QOcjJvuUPhBpi+VxpuX0tQfrsdNORb5IvUNB/EB+TjU
	yU6dhhha5Cj60oS9yyK3oHpR794g/rnD3nbh3jrhBOtRb9Qk0ut6cBxmdMYKYqw55+FiZCXi0wned
	sjniRI8Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pNX18-00FOUN-GP; Thu, 02 Feb 2023 10:40:34 +0000
Received: from mail-pj1-x1030.google.com ([2607:f8b0:4864:20::1030])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pNX16-00FOTV-0s
	for linux-mediatek@lists.infradead.org; Thu, 02 Feb 2023 10:40:33 +0000
Received: by mail-pj1-x1030.google.com with SMTP id on9-20020a17090b1d0900b002300a96b358so1416339pjb.1
        for <linux-mediatek@lists.infradead.org>; Thu, 02 Feb 2023 02:40:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=PexX/V0c+w21JwIUEKWHSc7QoYhjon5sMZqAPNZ76zo=;
        b=DSuetR/giXwCr7xl33WxRX4Hvfsvzbp00ZCg/YSjdN59Da6JVxqgvCvj75vLHYOwOH
         ltR2lE/nv3y8xMordBsJkMhC+SwyN0Z4Lod37n8akuTFQ6P8lxDmG4ljBUXUe9IP+sU6
         IB38AJQ9pTHm5zxM34c1mAK1pHIn9Y40T5m+0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=PexX/V0c+w21JwIUEKWHSc7QoYhjon5sMZqAPNZ76zo=;
        b=Xz0icXbmah6/O7hSg2eL0k7hNC2KGfO3HoNHEjXJotiFjPUkHDdxGb7ilajS1SPgfP
         /ydtepa/X+FLJvvn2Nj/b5BDvKMNgJNJPftVV7tkYR2U3tZ3SyiuuMyHBRmgijBjBt4H
         lDBDuS/h5eclSpJHBKafDdmM/cDija+pGgr4h/c8tkJS4RFJIxoPPnsUVfSEfR3CeqUF
         wZrqPbMIuKc52aOsMxhx/OLVRLBhKrdeNJQviSenqrOL+2uQc8d3jsVErqwdurl2WGEn
         4WgsGm2pokGnmhF/KyO4UTPbdCtdIwxbrZRovVrqErvVuZmZl/1wNoYuI+tg3iiy8Pqb
         GBeg==
X-Gm-Message-State: AO0yUKXJYVc2QIrBSfcrLIFW+TCUVRLJIZpkF/Q62ErHNysAYAvYYKyQ
	OlsPhi3sFZAluAQLsF4ECiRnSQ==
X-Google-Smtp-Source: AK7set+sw1iMXd99AlKQYQp6TJaHlmdMupoaYMb79i2bbcIgiPzqroi3GNubMJIp+d05hWuhQI1HZw==
X-Received: by 2002:a17:903:32c9:b0:196:2e92:e546 with SMTP id i9-20020a17090332c900b001962e92e546mr7508552plr.44.1675334430339;
        Thu, 02 Feb 2023 02:40:30 -0800 (PST)
Received: from wenstp920.tpe.corp.google.com ([2401:fa00:1:10:68a6:9bbd:a36a:4d1f])
        by smtp.gmail.com with ESMTPSA id jk22-20020a170903331600b00194c82c2a7bsm13365706plb.224.2023.02.02.02.40.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 02 Feb 2023 02:40:30 -0800 (PST)
From: Chen-Yu Tsai <wenst@chromium.org>
To: Matthias Brugger <matthias.bgg@gmail.com>
Cc: Chen-Yu Tsai <wenst@chromium.org>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	=?UTF-8?q?N=C3=ADcolas=20F=20=2E=20R=20=2E=20A=20=2E=20Prado?= <nfraprado@collabora.com>,
	soc@kernel.org
Subject: [PATCH] arm64: dts: mediatek: mt8195: Fix vdosys* compatible strings
Date: Thu,  2 Feb 2023 18:40:14 +0800
Message-Id: <20230202104014.2931517-1-wenst@chromium.org>
X-Mailer: git-send-email 2.39.1.456.gfc5497dd1b-goog
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230202_024032_114950_63C3E714 
X-CRM114-Status: GOOD (  13.91  )
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

When vdosys1 was initially added, it was incorrectly assumed to be
compatible with vdosys0, and thus both had the same mt8195-mmsys
compatible attached.

This has since been corrected in commit b237efd47df7 ("dt-bindings:
arm: mediatek: mmsys: change compatible for MT8195") and commit
82219cfbef18 ("dt-bindings: arm: mediatek: mmsys: add vdosys1 compatible
for MT8195"). The device tree needs to be fixed as well, otherwise
the vdosys1 block fails to work, and causes its dependent power domain
controller to not work either.

Change the compatible string of vdosys1 to "mediatek,mt8195-vdosys1".
While at it, also add the new "mediatek,mt8195-vdosys0" compatible to
vdosys0.

Fixes: 6aa5b46d1755 ("arm64: dts: mt8195: Add vdosys and vppsys clock nodes")
Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>
---

Since we are at -rc6 and Matthias already sent out pull requests, I've
CC-ed soc@ so that this may be picked up directly on top of them. This
should be merged for -next.

Thanks

 arch/arm64/boot/dts/mediatek/mt8195.dtsi | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/boot/dts/mediatek/mt8195.dtsi b/arch/arm64/boot/dts/mediatek/mt8195.dtsi
index 5ffcfd8da31d..93ba274c3f42 100644
--- a/arch/arm64/boot/dts/mediatek/mt8195.dtsi
+++ b/arch/arm64/boot/dts/mediatek/mt8195.dtsi
@@ -2439,7 +2439,7 @@ vencsys_core1: clock-controller@1b000000 {
 		};
 
 		vdosys0: syscon@1c01a000 {
-			compatible = "mediatek,mt8195-mmsys", "syscon";
+			compatible = "mediatek,mt8195-vdosys0", "mediatek,mt8195-mmsys", "syscon";
 			reg = <0 0x1c01a000 0 0x1000>;
 			mboxes = <&gce0 0 CMDQ_THR_PRIO_4>;
 			#clock-cells = <1>;
@@ -2625,7 +2625,7 @@ larb1: larb@1c019000 {
 		};
 
 		vdosys1: syscon@1c100000 {
-			compatible = "mediatek,mt8195-mmsys", "syscon";
+			compatible = "mediatek,mt8195-vdosys1", "syscon";
 			reg = <0 0x1c100000 0 0x1000>;
 			#clock-cells = <1>;
 		};
-- 
2.39.1.456.gfc5497dd1b-goog


