Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 288E8D374AF
	for <linux-mediatek@archiver.kernel.org>; Fri, 18 Oct 2024 09:20:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:MIME-Version:Content-Type:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=XkkT1YK08fvvBnsXdekTj1dlk1F6WdJ88gbC//Uv2Rg=; b=RiWlPG2eFsLpW+bewHsWhn/8TD
	V9YST2hFVVNHBJzV47nQZfMj9uk/ErAB4+LLArJnd8mZFLRKGIutY3Fb39FK/2M5nIu8wXa7y/I+8
	skf6G8DXH4BI8KrviqVQVwniitZMocX54b13uMLr890oAWIPAGtwOpPbhcfQ5uSXUZbTNKMtpdCOD
	7sO+GLs3cmuf1cctrR3GVZi4IcBtnwDHFECdijeB5dcDDi7csumLvWUbOXonnE31EbO2WvPphqfYg
	kqq52m0mZCPR8OLg499JjPzy96eKsn2BmQ86LTT7sDmUz2R7K05aoHz+OZafTMXHOa0Jycmfkg1hR
	R0UoYNkA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t1j9f-00000000AS2-1adu;
	Fri, 18 Oct 2024 09:20:19 +0000
Received: from mail-pl1-x635.google.com ([2607:f8b0:4864:20::635])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t1j1j-000000008JC-31Py
	for linux-mediatek@lists.infradead.org;
	Fri, 18 Oct 2024 09:12:08 +0000
Received: by mail-pl1-x635.google.com with SMTP id d9443c01a7336-20b533c6865so894805ad.2
        for <linux-mediatek@lists.infradead.org>; Fri, 18 Oct 2024 02:12:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=huaqin-corp-partner-google-com.20230601.gappssmtp.com; s=20230601; t=1729242727; x=1729847527; darn=lists.infradead.org;
        h=references:in-reply-to:message-id:date:subject:cc:to:from:from:to
         :cc:subject:date:message-id:reply-to;
        bh=XkkT1YK08fvvBnsXdekTj1dlk1F6WdJ88gbC//Uv2Rg=;
        b=FUC4Nwf+qE36wIJnPlBUfLwiYr9+7S2sSLtuenn/1it+jB4M7MbJb5Q7aQUzw+NZmV
         7BVRGhrcudV56YRJpYrNXX3AlTjZjzP8PXg1BU8HYNsGgWTpfeWlSnIlhcB0QBnBNIye
         ZPvlkBEskKEHBf7YMaXcMr2W3iQmcA+/wI/Uzc/MrvOmGN+Nk5Al+wgzQ/f1Efj0vMdJ
         HUjJpan9UaWkcYQksS2vvXmOjW5+EPMp2DFUP+L/MMV2/LIodaGeKmiDx2b+o6hhlGxh
         yVGz33hcHGIKtYdYrXEYfQ6fF2EQ5/ulUDwprAL1lJ+Ci1LdLfAg3j9FPmAEOaMYHiKY
         y+RA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729242727; x=1729847527;
        h=references:in-reply-to:message-id:date:subject:cc:to:from
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=XkkT1YK08fvvBnsXdekTj1dlk1F6WdJ88gbC//Uv2Rg=;
        b=I7IMUhWX/ro7iQ1Jda4LYOgTHytjg4XpN1lqc+RsQcR6fmmqTHVh1+qczZHtvrjaal
         tgQyYYl+N2skzAhV0IsYQrBLD5XuQyrk+2YL/oJH2gzSwzAPl7e2WIm20R8oW/wVMs6L
         06KcZXCNXtGjvFgeIzlYSSJdTcKz1HcwBwwbSEXfqVWic6eBZRTrdvKUQqrbOS6gAMnW
         O9c19gNYlIilchW+U2fXdbeJLInHrTxbxgE8lU9U7ktqACAP23aubXhXHhNmPfSJTgXa
         dONN23FYlIPTDSMTUMLPFoxSxPNoRuIa1FFxIpC9UzdVugh74r2x44CWtzMs5iiFMYIh
         RmBw==
X-Forwarded-Encrypted: i=1; AJvYcCX0v9vJulPS5P3Y3H5UIJm9u8M9YXNZnRGUGb6MGn4W0+wvSQeuQfdAc+Nciy2XhxouxB84rB5XArKT9s95Dg==@lists.infradead.org
X-Gm-Message-State: AOJu0Yxq1Twhjc1Suv6mmostJTMHLnosg1xxo9Z4eIQjPhMcMkJ3VKfo
	+N7XIL6WE00OnQjby+b1cNz14BCrvST2sycYsttAZGBU95N6Fi3gxteKzdtuBG8=
X-Google-Smtp-Source: AGHT+IFU+OdYH5faJbm1npPyrHUQPkpVpJnW6eLNvXvJK6fIKzyxq5xuE0uIanU+RLnHqk+9JzTcBw==
X-Received: by 2002:a17:902:db0f:b0:20b:b93f:2fec with SMTP id d9443c01a7336-20e5a8aedd8mr10397965ad.8.1729242727131;
        Fri, 18 Oct 2024 02:12:07 -0700 (PDT)
Received: from ubuntu.huaqin.com ([116.66.212.162])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-20e5a747925sm8659115ad.71.2024.10.18.02.12.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 18 Oct 2024 02:12:06 -0700 (PDT)
From: Zhengqiao Xia <xiazhengqiao@huaqin.corp-partner.google.com>
To: devicetree@vger.kernel.or,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Cc: robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	matthias.bgg@gmail.com,
	angelogioacchino.delregno@collabora.com,
	wenst@chromium.org,
	hsinyi@chromium.org,
	sean.wang@mediatek.com,
	Zhengqiao Xia <xiazhengqiao@huaqin.corp-partner.google.com>
Subject: [PATCH v2 3/3] arm64: dts: mediatek: Add exton node for DP bridge
Date: Fri, 18 Oct 2024 17:11:35 +0800
Message-Id: <20241018091135.17075-4-xiazhengqiao@huaqin.corp-partner.google.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20241018091135.17075-1-xiazhengqiao@huaqin.corp-partner.google.com>
References: <20241018091135.17075-1-xiazhengqiao@huaqin.corp-partner.google.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241018_021207_778551_46A090BC 
X-CRM114-Status: UNSURE (   8.95  )
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

Add exton node for DP bridge to make the display work properly.

Signed-off-by: Zhengqiao Xia <xiazhengqiao@huaqin.corp-partner.google.com>
---
 arch/arm64/boot/dts/mediatek/mt8186-corsola.dtsi | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/arch/arm64/boot/dts/mediatek/mt8186-corsola.dtsi b/arch/arm64/boot/dts/mediatek/mt8186-corsola.dtsi
index 682c6ad2574d..943837f20377 100644
--- a/arch/arm64/boot/dts/mediatek/mt8186-corsola.dtsi
+++ b/arch/arm64/boot/dts/mediatek/mt8186-corsola.dtsi
@@ -424,6 +424,7 @@
 		ovdd-supply = <&mt6366_vsim2_reg>;
 		pwr18-supply = <&pp1800_dpbrdg_dx>;
 		reset-gpios = <&pio 177 GPIO_ACTIVE_HIGH>;
+		extcon = <&usbc_extcon>;
 
 		ports {
 			#address-cells = <1>;
@@ -1656,6 +1657,11 @@
 				try-power-role = "source";
 			};
 		};
+
+		usbc_extcon: extcon0 {
+			compatible = "google,extcon-usbc-cros-ec";
+			google,usb-port-id = <0>;
+		};
 	};
 };
 
-- 
2.17.1


