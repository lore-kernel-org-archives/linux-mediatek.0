Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9EA35C369D7
	for <linux-mediatek@archiver.kernel.org>; Wed, 23 Apr 2025 04:04:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=69P3nlnxBw2v6kIwtTKkT8ULduVaYQnRi8mlA610Ew4=; b=Eq4bgL2oDhJU2MWtm9Bg/HGyiG
	L5uyCWCNKobsG9cszVo+ODTLCsMlz2tTbuv3fPu2Ee64XPL4kBd5uUHIHQEVmZaY5hAGwrg1UBzD+
	YlOE9GnpJV9wKPOei3wb8RZMrz35ECdZGdloTlMKJUh0YN/zFhzduiLpAA+Ll5vTMRnZhtIMexOAx
	MturTRNNhKRz4Nrs2LGlY5O7lsajM/SkXuJT78RKLj+7ySnHhxHG1lrK3qfGgdwDkkDgl4mlKgjC7
	x+3XID8zirIAnDmWGBI2Ph7+Yr44rAyy8SFTaN/k/NGC9gzk6Gb1baCgUeuPHnI1H6qpaslnVeTZg
	nX/IZDow==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u7RLP-000000099wO-2tAa;
	Wed, 23 Apr 2025 04:04:19 +0000
Received: from mail-pl1-x633.google.com ([2607:f8b0:4864:20::633])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u7RL7-000000099sa-1gc4
	for linux-mediatek@lists.infradead.org;
	Wed, 23 Apr 2025 04:04:02 +0000
Received: by mail-pl1-x633.google.com with SMTP id d9443c01a7336-224191d92e4so59044055ad.3
        for <linux-mediatek@lists.infradead.org>; Tue, 22 Apr 2025 21:04:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1745381040; x=1745985840; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=69P3nlnxBw2v6kIwtTKkT8ULduVaYQnRi8mlA610Ew4=;
        b=Bd7C9U9cusu1too3BdPtHdxvGbH/5Vv2TqC7Rvt6XQYF26GKgghpmJeMiH3qEymtAv
         D9Q4AVrn1h30N6SgHu2tYqsKHi2NHiPI85QlvoPMtAXsMAvDE0647+mYnaCTr+2JjaKe
         0EBTW32RnWPajJD3gevTtmGvtDYjj8C+ysEiw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745381040; x=1745985840;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=69P3nlnxBw2v6kIwtTKkT8ULduVaYQnRi8mlA610Ew4=;
        b=tdTl3glRFR1V9fXd1biRbQp9lp1fDSECIrysxfT8fdowl53i3gdEWMB6dumytRAudt
         oxY5oY4WyfFegcL+ThzurBYVXVpAtnzsbyibgyn81jGFj19trXuFI6/c8LmpGvE7yoXH
         irCpOTK2mFKAvSu1HVCzm1Y0J+8j7DRdNbOHUiYQaB22qFmXsPPClOQybwIBYnnE3YvV
         lzM3qi4UWBQ0iGGNV/Gey+lqYjtq5zYzstEV453K50PnX4zFjaXb3oB3IeHRbwzIHWMA
         k6g9uXLyaO7a/Lnz5jw98+OBQufOeBnDdKq1rTlgKU/tFOjcJ9GeuuFMcAAuxpNBnQZO
         Iv9w==
X-Forwarded-Encrypted: i=1; AJvYcCWaIvmT3ZM8DO2PEnYhN+EiPyZDFS0GZmOvQHOAkevSmEMUSnYVQwqL3RoY08LJaO9YdlKkl3vZwgN1h60GHQ==@lists.infradead.org
X-Gm-Message-State: AOJu0YzfXosYIH33WbgUfgiaLrr6goup+2x4JiDLUQqhCdY9cjQAGR/O
	GnHyvSmXrS+hu9mhdtYJDTC1OoNdJt9SjdTpC1edi1C9OFkYAhUo4ut0QXG7Og==
X-Gm-Gg: ASbGncs193J+Ah3XeMAx+XW4DmX/PwHei1yMZnq6kVXKAhEXnN+Jl2N23L0H8lG12z1
	EFK0fuQ/vf6cjRWe8gQbz3SI+B8f0EUmbhgjvjCnueCaG4XmukY62GS9NYDQiAC0/sM/mo57fjP
	onRDn3dOPGSrJk5U+4X/Ngev9XUJRz/GIb6pNUHGxQK6RR0bFWHqT4Nch8hvFY2AdY3ZQRcPPzF
	CzPklcDb5yTPJ5y7aULV7w0kEiyq/3DyhWTpllQ6RlDfpApw20EZQT+FQwK7F707E4fZWdtShuc
	ZlR5yh6X2ac0ob5/I9qrDBS7AlZJvAML78WDW7pjfjphAdFfSZqGf6KD7C/oH2GnPQ065km8+xs
	=
X-Google-Smtp-Source: AGHT+IFs37l1XCtk6TUjNGxDgTahK0TxvEQaxIjTsLH7CENRysCfaJj2nfs1pz+8IvfdUhEasSay/g==
X-Received: by 2002:a17:903:46c8:b0:224:584:6eef with SMTP id d9443c01a7336-22c53606ee5mr301444085ad.41.1745381040103;
        Tue, 22 Apr 2025 21:04:00 -0700 (PDT)
Received: from treapking.tpe.corp.google.com ([2401:fa00:1:10:d4b1:49c5:60dd:89a7])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-73dbfa5828esm9512894b3a.112.2025.04.22.21.03.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Apr 2025 21:03:59 -0700 (PDT)
From: Pin-yen Lin <treapking@chromium.org>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: Chen-Yu Tsai <wenst@chromium.org>,
	linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	Pin-yen Lin <treapking@chromium.org>,
	Enric Balletbo i Serra <eballetbo@kernel.org>,
	Hsin-Yi Wang <hsinyi@chromium.org>,
	Jitao Shi <jitao.shi@mediatek.com>,
	Nicolas Boichat <drinkcat@chromium.org>
Subject: [PATCH v2] arm64: dts: mt8183: Add port node to mt8183.dtsi
Date: Wed, 23 Apr 2025 12:03:39 +0800
Message-ID: <20250423040354.2847447-1-treapking@chromium.org>
X-Mailer: git-send-email 2.49.0.805.g082f7c87e0-goog
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250422_210401_467160_4B89628A 
X-CRM114-Status: GOOD (  11.47  )
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

Add the port node to fix the binding schema check. Also update
mt8183-kukui to reference the new port node.

Fixes: 88ec840270e6 ("arm64: dts: mt8183: Add dsi node")
Fixes: 27eaf34df364 ("arm64: dts: mt8183: config dsi node")
Signed-off-by: Pin-yen Lin <treapking@chromium.org>

---

Changes in v2:
- Rebase to v6.15-next/dts64

 arch/arm64/boot/dts/mediatek/mt8183-kukui.dtsi | 10 +++-------
 arch/arm64/boot/dts/mediatek/mt8183.dtsi       |  4 ++++
 2 files changed, 7 insertions(+), 7 deletions(-)

diff --git a/arch/arm64/boot/dts/mediatek/mt8183-kukui.dtsi b/arch/arm64/boot/dts/mediatek/mt8183-kukui.dtsi
index e1495f1900a7b4..f9ca6b3720e915 100644
--- a/arch/arm64/boot/dts/mediatek/mt8183-kukui.dtsi
+++ b/arch/arm64/boot/dts/mediatek/mt8183-kukui.dtsi
@@ -259,14 +259,10 @@ panel_in: endpoint {
 			};
 		};
 	};
+};
 
-	ports {
-		port {
-			dsi_out: endpoint {
-				remote-endpoint = <&panel_in>;
-			};
-		};
-	};
+&dsi_out {
+	remote-endpoint = <&panel_in>;
 };
 
 &gic {
diff --git a/arch/arm64/boot/dts/mediatek/mt8183.dtsi b/arch/arm64/boot/dts/mediatek/mt8183.dtsi
index 0aa34e5bbaaa87..3c1fe80e64b9c5 100644
--- a/arch/arm64/boot/dts/mediatek/mt8183.dtsi
+++ b/arch/arm64/boot/dts/mediatek/mt8183.dtsi
@@ -1836,6 +1836,10 @@ dsi0: dsi@14014000 {
 			phys = <&mipi_tx0>;
 			phy-names = "dphy";
 			status = "disabled";
+
+			port {
+				dsi_out: endpoint { };
+			};
 		};
 
 		dpi0: dpi@14015000 {
-- 
2.49.0.805.g082f7c87e0-goog


