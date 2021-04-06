Return-Path: <SRS0=k4UB=JD=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-21.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BA78AC433ED
	for <linux-mediatek@archiver.kernel.org>; Tue,  6 Apr 2021 11:45:04 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 68B24613A3
	for <linux-mediatek@archiver.kernel.org>; Tue,  6 Apr 2021 11:45:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 68B24613A3
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=NPoCyr45Dl3+L3ZnLsl3cl8YSNhG9/MZ9rrCMlqKe2Q=; b=BjRsCzqdQjsZh7F0QR72IH0QQG
	NW1tjKWnjPi/VxCe0eFV+fYfWR1naxr/CKCkNspH4jTV/ZXiufwonoz0hXIljj1v8OYhYG1q+ReqY
	nbAPvCUXHRIzLCiKDh/RBnlHlyuMXjPt1bWTdp/T8fScx5edOguzaoe+O0ZyzuALhUQXh75uS2tF6
	l0iO43tOjejRxZlAbWbyKyE+hYHenSRxfdHsvmaGero1XAvnbh1E2Ci0g/w0JW/9plmvyswIzlpXO
	P0p5galI+oS9h8VVIuzqUIGZH1fYXrzfc6kgnBGKNN63VCH1idwqa0KPhV/5ltxvrbih1lW9b9GVH
	xq8+tDnA==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lTk8W-002Q2O-1T; Tue, 06 Apr 2021 11:44:48 +0000
Received: from mail-wr1-x433.google.com ([2a00:1450:4864:20::433])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lTk0X-002MvB-UJ
 for linux-mediatek@lists.infradead.org; Tue, 06 Apr 2021 11:36:37 +0000
Received: by mail-wr1-x433.google.com with SMTP id j18so13841693wra.2
 for <linux-mediatek@lists.infradead.org>; Tue, 06 Apr 2021 04:36:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=H+nH21JCvam+dYUjtR0Eymm99HB3jx355hDeinSGyzQ=;
 b=dfACU2xivv5z+PLTgQvy1TvdJbRUFa6y2RdAyY8l3qghCSlCCf9TrOMUJaX2QbqufE
 UP3Y41nF6bQ23r+Cq2oW0ZRvRrapW8H3tsQ0cMetakyEbdmucJvOouQt2MwdxYVzJPSr
 YAvemBGnWNC9u2IjB73TVWYfwstldzZNfePTi6mFVy+JW4o2MmtjakxnMVNBe3q6x2VJ
 gmH7s56rbHIZYwfK72Nl11sRp3AF8VPkb3rEUIdb+Cx1h/jiaLcWSWy6NHDwuptNLP8X
 46C+7Kxf6HEtrUGWdQthU6XPYoAbG4YJoC0T7eJPx3jjB7oxvPu+bmAfT6PVzKkLlYrt
 Uyag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=H+nH21JCvam+dYUjtR0Eymm99HB3jx355hDeinSGyzQ=;
 b=MKdc3okYWG+0XjZ3eQgSXzcZM/qydg+CRG/rXoAsp8Mibi188+0bMZ5hOSQ0puIveA
 yv4HKKhyz2BNAhi/3kHXROboEyv9Pa347AjCR/QubKUI/eSlEcpfD/K7Yn6mECbaw5X4
 dW9AEuoVAVJPSusrBeE42XZsYgYdW+HW4rej1os0/uJRzFWrZXJdacqCT8fCohQmk+zZ
 v0RBAQF1CvFMTsyvx9agbjXGSuhJjA7mPKBor+sf0qa4TpuxFfitRnM+a5khRRlXkb46
 +pEwLbeu7KClQAwkJtdltlCG+BPP1xnJZ9IEqECd2MlUkOvkLnIqTsoK6NmQqJEZFYCq
 MKgA==
X-Gm-Message-State: AOAM532kScKRCsWLy+yWiIq5mtPQBpNGs/+qakJ+oYVdoZt6CFGxvHQG
 2ssFn1QGWFWT3wNlUB93Yn9vVQ==
X-Google-Smtp-Source: ABdhPJxGxdN0DkHzApkTQUwPHD1Q4xSZfMoMeLq7WWOXS4qDqtTM09jiZ+TK5o3nnGduMSPPFgaAZw==
X-Received: by 2002:a05:6000:18ab:: with SMTP id
 b11mr34067108wri.403.1617708993266; 
 Tue, 06 Apr 2021 04:36:33 -0700 (PDT)
Received: from localhost.localdomain ([88.160.162.107])
 by smtp.gmail.com with ESMTPSA id k3sm11880735wrc.67.2021.04.06.04.36.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 06 Apr 2021 04:36:32 -0700 (PDT)
From: Fabien Parent <fparent@baylibre.com>
To: Rob Herring <robh+dt@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>
Cc: mkorpershoek@baylibre.com, Fabien Parent <fparent@baylibre.com>,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: [PATCH v3 1/3] arm64: dts: mediatek: mt8167: add larb nodes
Date: Tue,  6 Apr 2021 13:36:28 +0200
Message-Id: <20210406113631.2675029-1-fparent@baylibre.com>
X-Mailer: git-send-email 2.31.0
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210406_123634_490302_4686D818 
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

Add larb nodes for MT8167:
* larb0 is used for display (dsi and hdmi)
* larb1 is used for camera (csi)
* larb2 is used for the video hardware decoder

Signed-off-by: Fabien Parent <fparent@baylibre.com>
---

Note: This series is based on https://git.kernel.org/pub/scm/linux/kernel/git/matthias.bgg/linux.git/log/?h=v5.12-next/dts64-2

V3:
	* Removed unicode character in commit summary
V2:
	* Removed unneeded mediatek,larb-id property

 arch/arm64/boot/dts/mediatek/mt8167.dtsi | 30 ++++++++++++++++++++++++
 1 file changed, 30 insertions(+)

diff --git a/arch/arm64/boot/dts/mediatek/mt8167.dtsi b/arch/arm64/boot/dts/mediatek/mt8167.dtsi
index 4b951f81db9e..bbddd4b22d3e 100644
--- a/arch/arm64/boot/dts/mediatek/mt8167.dtsi
+++ b/arch/arm64/boot/dts/mediatek/mt8167.dtsi
@@ -140,5 +140,35 @@ smi_common: smi@14017000 {
 			clock-names = "apb", "smi";
 			power-domains = <&spm MT8167_POWER_DOMAIN_MM>;
 		};
+
+		larb0: larb@14016000 {
+			compatible = "mediatek,mt8167-smi-larb";
+			reg = <0 0x14016000 0 0x1000>;
+			mediatek,smi = <&smi_common>;
+			clocks = <&mmsys CLK_MM_SMI_LARB0>,
+				 <&mmsys CLK_MM_SMI_LARB0>;
+			clock-names = "apb", "smi";
+			power-domains = <&spm MT8167_POWER_DOMAIN_MM>;
+		};
+
+		larb1: larb@15001000 {
+			compatible = "mediatek,mt8167-smi-larb";
+			reg = <0 0x15001000 0 0x1000>;
+			mediatek,smi = <&smi_common>;
+			clocks = <&imgsys CLK_IMG_LARB1_SMI>,
+				 <&imgsys CLK_IMG_LARB1_SMI>;
+			clock-names = "apb", "smi";
+			power-domains = <&spm MT8167_POWER_DOMAIN_ISP>;
+		};
+
+		larb2: larb@16010000 {
+			compatible = "mediatek,mt8167-smi-larb";
+			reg = <0 0x16010000 0 0x1000>;
+			mediatek,smi = <&smi_common>;
+			clocks = <&vdecsys CLK_VDEC_CKEN>,
+				 <&vdecsys CLK_VDEC_LARB1_CKEN>;
+			clock-names = "apb", "smi";
+			power-domains = <&spm MT8167_POWER_DOMAIN_VDEC>;
+		};
 	};
 };
-- 
2.31.0


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
