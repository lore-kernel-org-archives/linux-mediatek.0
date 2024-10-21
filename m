Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AE50ED0E6C1
	for <linux-mediatek@archiver.kernel.org>; Mon, 21 Oct 2024 08:15:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=AnvHyOnj93OGsSuS3Yy5YdOPX+qDA4+kJEwXl0YhTUg=; b=YwLhlMf3dJrE0w
	CP0FBzuCyuuWkryQWRRfL4Ax4eYXrLYoIWEqKNfh22Q81E8rAhUXUJfU57c1FYHuMRheQxrDHyPUM
	J98uj2Nfnv1z1KyEBHw1eKf9ykRjOuBehNvZWieiaKAzjn4gpkejN9PuM8OQUCjYNqxtF1u3J53NA
	XgAUnH7mWRoB8KCZNqIU1rKmPFwhOruoxfuARoMNAkeZlyMSUY/eVeySltCs3n/KLm7vMUsZDUC3j
	n4qLo/a6dg5WTuhheNk0hvExotPXasTAyUpV6Jhin5GSiiXICm80UNeZZjyd4aTV0F4T0OwhKafl4
	LJh6o030gyZhmeP4fJog==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t2nZV-00000006Vh5-1jqz;
	Mon, 21 Oct 2024 08:15:25 +0000
Received: from mail-pf1-x42d.google.com ([2607:f8b0:4864:20::42d])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t2nXp-00000006VKb-3k23
	for linux-mediatek@lists.infradead.org;
	Mon, 21 Oct 2024 08:13:43 +0000
Received: by mail-pf1-x42d.google.com with SMTP id d2e1a72fcca58-71e70c32cd7so3388200b3a.1
        for <linux-mediatek@lists.infradead.org>; Mon, 21 Oct 2024 01:13:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1729498420; x=1730103220; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=AnvHyOnj93OGsSuS3Yy5YdOPX+qDA4+kJEwXl0YhTUg=;
        b=nx7HRZdGtuqUbXAtEQNoFuWJWgLFWPmlTic7+/OIGzShtl1qwu62VkeI6LH0W3W9i1
         JmH/1pCs3zNVygl+MKhCpUpjBnvzYiyauxr40d3UZq89W3JFSTreXgGcGQlNbIxesMLb
         Fu/e4W9lBQHeRpCLmdfZDlmk3+plqxUib31G4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729498420; x=1730103220;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=AnvHyOnj93OGsSuS3Yy5YdOPX+qDA4+kJEwXl0YhTUg=;
        b=PnIFdanPBhSMWVNMkDtn39g4gcdHJ6atbwaCa7C1MdyUVdyasEaKyQVXyHJsutEZnw
         flu1/owrW7IliUnrwuSidyF72IgLZvlQtqjME11CA6arRZIA2u5A4a6hp3ZAzjAciL5O
         USgpd6bJ7MtSyGDb3pG2Hf496aeqL3SJHWjZX06Lep0510HwAjY05WCZ3RCsQmN+EtBl
         9rizOcojYoU2t/J2E+T7I+5dR3hq8w3ULWpIhu0WDq475dZewZ8pq8J3I+Sn69BAuOvT
         PuhIH0floACNsmDasEzC2eQJBbADI4oPnwYDmxb7BqN78+42/ionVDv2MaqmqtSjkHRC
         yQfg==
X-Forwarded-Encrypted: i=1; AJvYcCUaT5ANaRzEHdg/WrlaRHyGTxH6kdWj3XuZEhUKtXzQEIijV+/Gfl5Yq6NIGfdtyn9oMm28/784Y8iMfwmIMg==@lists.infradead.org
X-Gm-Message-State: AOJu0YzvtShfIGRcX5pQ4WpYR9kfQ6qjhoMQCvQqat8jIG8Qq/dlE9mm
	aWNbVYijXB1FpgVUAVEpdnyM0bvS9R5893EXYh60eYPcwgpwWmy6e1XmNQ1GJA==
X-Google-Smtp-Source: AGHT+IHTst4CzwxlMo6qckbiC0esr8PkpKeIcvOCjqA/wtxgMHgUKyWplxQGBAiUUbJyZZiGDF4Cxw==
X-Received: by 2002:a05:6a00:2e1d:b0:71e:744a:3fbd with SMTP id d2e1a72fcca58-71ea31d3048mr14987728b3a.20.1729498420532;
        Mon, 21 Oct 2024 01:13:40 -0700 (PDT)
Received: from fshao-p620.tpe.corp.google.com ([2401:fa00:1:10:66d2:3298:fcb4:c6c9])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-71ec13336f1sm2291945b3a.81.2024.10.21.01.13.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Oct 2024 01:13:40 -0700 (PDT)
From: Fei Shao <fshao@chromium.org>
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Matthias Brugger <matthias.bgg@gmail.com>
Subject: [PATCH] arm64: dts: mediatek: mt8188: Fix USB3 PHY port default status
Date: Mon, 21 Oct 2024 16:10:47 +0800
Message-ID: <20241021081311.543625-1-fshao@chromium.org>
X-Mailer: git-send-email 2.47.0.rc1.288.g06298d1525-goog
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241021_011341_988396_25669890 
X-CRM114-Status: GOOD (  10.90  )
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
Cc: devicetree@vger.kernel.org, linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

The T-PHY controller at 0x11e40000 controls two underlying USB2 and USB3
PHY ports. The USB3 port works normally just like the others, so there's
no point in disabling it separately. Otherwise, board DTs would have to
enable both the T-PHY controller and one of its sub-nodes in particular,
which is slightly redundant and confusing.

Remove the status line in the u3port1 node, so it's ready to be used
once the T-PHY controller is enabled.

Fixes: 9461e0caac9e ("arm64: dts: Add MediaTek MT8188 dts and evaluation board and Makefile")
Signed-off-by: Fei Shao <fshao@chromium.org>
---

 arch/arm64/boot/dts/mediatek/mt8188.dtsi | 1 -
 1 file changed, 1 deletion(-)

diff --git a/arch/arm64/boot/dts/mediatek/mt8188.dtsi b/arch/arm64/boot/dts/mediatek/mt8188.dtsi
index 2710e18ce696..3d11a989f39f 100644
--- a/arch/arm64/boot/dts/mediatek/mt8188.dtsi
+++ b/arch/arm64/boot/dts/mediatek/mt8188.dtsi
@@ -1961,7 +1961,6 @@ u3port1: usb-phy@700 {
 					 <&clk26m>;
 				clock-names = "ref", "da_ref";
 				#phy-cells = <1>;
-				status = "disabled";
 			};
 		};
 
-- 
2.47.0.rc1.288.g06298d1525-goog


