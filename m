Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 36E2FC54791
	for <linux-mediatek@archiver.kernel.org>; Wed, 13 Mar 2024 13:54:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=/heQt+Db0ehDtq1JCZPcwy70snmGl2Z1H+WOU5UmOPc=; b=DPZqY1rk6fYIsX0alU5qW0Ya7d
	pVisVEN2BMKOXhMgfpzjl7Y7dpqpv0sm4LLRXrALjMbEfeAocZnvzW0e+T29nc3P/aiIRNkCPHH0T
	r0ciXrNbIekQ7CUdy4OztQWRupsy2f2C/vI2HosI1i/S2w7pZ7NX5R+g/DlGoUUoVR9KKGPyPSdke
	0Ff/DJnBF27zHphrVwkJhQQgOd6z+x9R47tYXoHSdYqpUd8AhwCUk72rAVhnxt4Fi8jmF5sl5t3jh
	7ZArR1j+9WJbws0HJSmYS/m0Vh7sTuewlIH+LbLnxy/HRlCba0fDOStNcIyRNKAij+XJKownjejll
	a0grIK2g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rkP3W-0000000AIst-2soZ;
	Wed, 13 Mar 2024 13:54:06 +0000
Received: from mail-pl1-x636.google.com ([2607:f8b0:4864:20::636])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rkP3T-0000000AIqk-0hw2
	for linux-mediatek@lists.infradead.org;
	Wed, 13 Mar 2024 13:54:04 +0000
Received: by mail-pl1-x636.google.com with SMTP id d9443c01a7336-1dc5d0162bcso40916485ad.0
        for <linux-mediatek@lists.infradead.org>; Wed, 13 Mar 2024 06:53:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1710338039; x=1710942839; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=/heQt+Db0ehDtq1JCZPcwy70snmGl2Z1H+WOU5UmOPc=;
        b=LB/+rdn4y3mJMdPx7ttENYL8H5l4zHp2xDmBCUDTvKp2z2UexPfdBHNO3RvkDefMV2
         xulKtU1MBAiJmOTHLmnfbd426Z7hE3bIkZ66zDF6vHKzsAaQtBgWFlb6ORbl7uaIK5Be
         ByF9DQDP2l6jxCUDaO6iZOMKx6JceaU2JzjNU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710338039; x=1710942839;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=/heQt+Db0ehDtq1JCZPcwy70snmGl2Z1H+WOU5UmOPc=;
        b=f5uI3GdA2ChxDtC0XDr7LXGj1wPu7bFWh2bQs3vulmG0oxG04MTDZNyhb+lpsSiMFN
         3LMny25t+f1uYo8a6tzOuvhsSmwZKGhELkbNttmNcooMq+d1rzfigwSK9FsL38oRgUST
         hdYKcn0esRHJxSWFDXsPldcfBNJhGZ8QdN+wxUHdMq2xRBpHhiiC8MgvSsLIkY81Vm3v
         OPWaR6zq626zAfy2zJ/vbmufa1d4uBgVqSG6PU7/hsSJtAPH1P7kZ/adbkopWLbbGhP9
         7XpTpa80fCcNxiOUbGeOnTg9bp66E6qNAOdysVqkU92wTHekFLRxl4SpAd1MY8Xhscol
         nhaw==
X-Forwarded-Encrypted: i=1; AJvYcCUwjVq42hS2/XcoHdAM6R+1TomS2NS0YLAYAj9I9yGOsw60ZSpHXmGCYnpFzEMAikaT3qoNH3sNjSL06TDpHFLPJHDhnoQ+aTUVF0V3X05w6gIj
X-Gm-Message-State: AOJu0YzJWzwUCCq+RgvX8JICM421csWQIDf2XMMYF6bkxZAqokECKiXY
	o/MCA4VsslTqvV0qVd7/qcVxall0vnZB011tk4XHoF25ehp00hbqymz8cbOhfg==
X-Google-Smtp-Source: AGHT+IE3PgaxgQ7zHkHAgGrWi0X7VbrllC27gi8LCOikz9dtE/g945xwEfsoOmxKeOZnqAPMvOWqew==
X-Received: by 2002:a17:902:f544:b0:1dd:aa58:a648 with SMTP id h4-20020a170902f54400b001ddaa58a648mr8030088plf.43.1710338039452;
        Wed, 13 Mar 2024 06:53:59 -0700 (PDT)
Received: from treapking.tpe.corp.google.com ([2401:fa00:1:10:3708:eea3:d1b4:2032])
        by smtp.gmail.com with ESMTPSA id d16-20020a170902ced000b001d8aa88f59esm8632504plg.110.2024.03.13.06.53.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 13 Mar 2024 06:53:59 -0700 (PDT)
From: Pin-yen Lin <treapking@chromium.org>
To: Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: Chen-Yu Tsai <wenst@chromium.org>,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	=?UTF-8?q?N=C3=ADcolas=20F=20=2E=20R=20=2E=20A=20=2E=20Prado?= <nfraprado@collabora.com>,
	devicetree@vger.kernel.org,
	Pin-yen Lin <treapking@chromium.org>
Subject: [PATCH] arm64: dts: mediatek: mt8192-asurada: Update min voltage constraint for Vgpu
Date: Wed, 13 Mar 2024 21:51:36 +0800
Message-ID: <20240313135157.98989-1-treapking@chromium.org>
X-Mailer: git-send-email 2.44.0.278.ge034bb2e1d-goog
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240313_065403_222700_68331800 
X-CRM114-Status: GOOD (  11.68  )
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

Although the minimum voltage listed on the GPU OPP table is 606250 uV,
the actual requested voltage could be even lower when the MTK Smart
Voltage Scaling (SVS) driver is enabled.

Set the minimum voltage to 300000 uV because it's supported by the
regulator.

Fixes: 3183cb62b033 ("arm64: dts: mediatek: asurada: Add SPMI regulators")
Signed-off-by: Pin-yen Lin <treapking@chromium.org>
---

 arch/arm64/boot/dts/mediatek/mt8192-asurada.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/mediatek/mt8192-asurada.dtsi b/arch/arm64/boot/dts/mediatek/mt8192-asurada.dtsi
index 43d80334610a..5cc5100a7c40 100644
--- a/arch/arm64/boot/dts/mediatek/mt8192-asurada.dtsi
+++ b/arch/arm64/boot/dts/mediatek/mt8192-asurada.dtsi
@@ -1448,7 +1448,7 @@ regulators {
 			mt6315_7_vbuck1: vbuck1 {
 				regulator-compatible = "vbuck1";
 				regulator-name = "Vgpu";
-				regulator-min-microvolt = <606250>;
+				regulator-min-microvolt = <300000>;
 				regulator-max-microvolt = <800000>;
 				regulator-enable-ramp-delay = <256>;
 				regulator-allowed-modes = <0 1 2>;
-- 
2.44.0.278.ge034bb2e1d-goog


