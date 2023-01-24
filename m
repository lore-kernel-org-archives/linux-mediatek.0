Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 877D7C38142
	for <linux-mediatek@archiver.kernel.org>; Tue, 24 Jan 2023 13:18:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=uRFuR+tKXTVFSVWgTM1ydP6t5wcQk1JNcVFjOiTIWVE=; b=GFU+CZDxd80MXvrSSZ2+AT+qMB
	Si6OfGnty3qNVgD5Qb9xMtzqIbFSQsbCQ2n/KlkpeS5JhFKDIQm/Dy70t3M96z2OLQ21pnStZyZJl
	dpmi00AKjHU6Sm/CkJJF/XWHBWMpxR3x0/f8uLsrI4ZPOAymLWpwtB+qmcOp4YHFKjfUAa4XNfrWZ
	+0DLAaBevK8Um9IurOy0X/Zhve9/JVE6ypBS5LxSazaqRBsdmsIXJTVMAnCgzgbHRVa1GryiAegWD
	z5Uv4XA0SBzWYvZTYT5anij+paFnnHCxx/h7G5URXuF5toSshKeD1S4F2Yxj/HOJ3MNwTh3wUN/RQ
	wE4QHkVg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pKJCA-003vYu-4R; Tue, 24 Jan 2023 13:18:38 +0000
Received: from mail-wr1-x42e.google.com ([2a00:1450:4864:20::42e])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pKJAx-003v69-EL
	for linux-mediatek@lists.infradead.org; Tue, 24 Jan 2023 13:17:30 +0000
Received: by mail-wr1-x42e.google.com with SMTP id d14so10162129wrr.9
        for <linux-mediatek@lists.infradead.org>; Tue, 24 Jan 2023 05:17:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=uRFuR+tKXTVFSVWgTM1ydP6t5wcQk1JNcVFjOiTIWVE=;
        b=wYEAShBZ3B+0Nockbo7T+kiNbl6jdoG36gVC3lyA2hVvJxJL0RiRp0MdmJMovKJJK4
         aGr0BXt1jc14RYpVbVO5oBkCJYDoOnM/0dB5jqD4FvEPMEc7lIp5tYRg9Kpw9S7Xopot
         a+M9Z9kiSig3VqlH9L3ha2fs6rCiocv8t/cHS+Zz7tWwfUGsV5GPRH6UcBegCCh+wSCl
         EZEXkOfbeouKKwhmNUHxID2Mst+WpQBmJjuuijuOl/QMy9FTPgnr/enUT1hhQyo2TE7+
         u+Q5VV3OBeAMcDntn2w61gPIYtPzZM4AjKysy1A3LriLubUDS6jTb8fFlW4sHv40C06Q
         AXdg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=uRFuR+tKXTVFSVWgTM1ydP6t5wcQk1JNcVFjOiTIWVE=;
        b=Z8VIiHT2ycKvdCfHJaO0J3SZeSIThMAK3VVaNYHYY3A4mNVxB8HsxGHl7Z/tOySSdc
         3fKwYDmyDTK5Qblh/5zzQIgBnaBuDeGlKPErmzHJWmCE109qsYHj8T0uVfWnTN7TH2V+
         SeF67mBvXFwrxisan9OZQ8NR0g0boTT0Ctwjoq2dKqxnEIUFZfc57HXrLFGiDN7m0BxK
         JS4abNBwOjoNcHCRs+wLARw1g6Qnz4ym4J6z/IjUFoDXtktew63MdbToWVSmdStNnCYw
         19gy1n4+5ymzwEZxmHCTmWpRuVhlTDu7fuUNQBw168a6OLhVhz8grEYhSq8oIWQtBA99
         JJjg==
X-Gm-Message-State: AFqh2kqyBzh0XPbehfzjkDWEJO2tBkfAPRUguc79CGaOj1vrxaRbZbxI
	dtAvjuHkvAr0PRlxm6mO4oKv+w==
X-Google-Smtp-Source: AMrXdXvzfegMVJZsAQeZApCFjS5isJncUHlBYtAFFI3zGp9RNZfbhsZUwriwwOkjOVH4iWWeJqAvVA==
X-Received: by 2002:a5d:67c3:0:b0:242:8af9:b987 with SMTP id n3-20020a5d67c3000000b002428af9b987mr18230999wrw.13.1674566241023;
        Tue, 24 Jan 2023 05:17:21 -0800 (PST)
Received: from t480-bl003.civfrance.com (58.188.158.77.rev.sfr.net. [77.158.188.58])
        by smtp.gmail.com with ESMTPSA id a5-20020adfeec5000000b002bfb5ebf8cfsm49427wrp.21.2023.01.24.05.17.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Jan 2023 05:17:20 -0800 (PST)
From: bchihi@baylibre.com
To: daniel.lezcano@linaro.org,
	angelogioacchino.delregno@collabora.com,
	rafael@kernel.org,
	amitk@kernel.org,
	rui.zhang@intel.com,
	matthias.bgg@gmail.com,
	robh+dt@kernel.org,
	krzysztof.kozlowski+dt@linaro.org,
	rdunlap@infradead.org,
	ye.xingchen@zte.com.cn,
	p.zabel@pengutronix.de
Cc: linux-pm@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	devicetree@vger.kernel.org,
	khilman@baylibre.com,
	james.lo@mediatek.com,
	rex-bc.chen@mediatek.com
Subject: [PATCH v11 3/6] arm64/dts/mt8195: Add efuse node to mt8195
Date: Tue, 24 Jan 2023 14:17:14 +0100
Message-Id: <20230124131717.128660-4-bchihi@baylibre.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230124131717.128660-1-bchihi@baylibre.com>
References: <20230124131717.128660-1-bchihi@baylibre.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230124_051723_516854_6E4BB742 
X-CRM114-Status: UNSURE (   8.49  )
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

From: Balsam CHIHI <bchihi@baylibre.com>

Add efuse node.
This will be required by the thermal driver to get the calibration data.

Signed-off-by: Balsam CHIHI <bchihi@baylibre.com>
Reviewed-by: Matthias Brugger <matthias.bgg@gmail.com>
Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
---
 arch/arm64/boot/dts/mediatek/mt8195.dtsi | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/arch/arm64/boot/dts/mediatek/mt8195.dtsi b/arch/arm64/boot/dts/mediatek/mt8195.dtsi
index 5d31536f4c48..09df105f4606 100644
--- a/arch/arm64/boot/dts/mediatek/mt8195.dtsi
+++ b/arch/arm64/boot/dts/mediatek/mt8195.dtsi
@@ -1380,6 +1380,12 @@ pciephy_glb_intr: pciephy-glb-intr@193 {
 			dp_calibration: dp-data@1ac {
 				reg = <0x1ac 0x10>;
 			};
+			lvts_efuse_data1: lvts1-calib@1bc {
+				reg = <0x1bc 0x14>;
+			};
+			lvts_efuse_data2: lvts2-calib@1d0 {
+				reg = <0x1d0 0x38>;
+			};
 		};
 
 		u3phy2: t-phy@11c40000 {
-- 
2.34.1


