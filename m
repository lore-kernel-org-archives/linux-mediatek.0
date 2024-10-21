Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 66354D3C92F
	for <linux-mediatek@archiver.kernel.org>; Mon, 21 Oct 2024 03:08:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:MIME-Version:Content-Type:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=XkkT1YK08fvvBnsXdekTj1dlk1F6WdJ88gbC//Uv2Rg=; b=QgoaFQyR0PQqtx+8wPN+uluF3L
	ap+VxfiFLFPSV7O8rX9+hRzYXN1iS4XnM0CGG0nx0yLzlyc3fOmMTgmrHLKNXPS6AYKjHVPabUzlW
	E4stEh0yPjcNEVoSeTBal36ve8wI2Ec9cTQBeeLzv4vGZXjFa3+/2wbApv+evZhv23vrcaa8bWbww
	7HAEdHeYdM6eHaiMFvt2G1lZHVNOtxYK9aT74xAxH1QVaRUHyaOlZxPcHVz53WFA5yqfADTvUJNnH
	C2IhlmpCZiSBdCOnV4gWIQuo0Ab2SgMPvAiy0W3a/9HmagUPa4cJC6BopXQAIbEt0aV8k8MogZhP0
	sATX82VQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t2imC-00000005w0N-2W3v;
	Mon, 21 Oct 2024 03:08:12 +0000
Received: from mail-pl1-x62a.google.com ([2607:f8b0:4864:20::62a])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t2igB-00000005urv-3xMI
	for linux-mediatek@lists.infradead.org;
	Mon, 21 Oct 2024 03:02:01 +0000
Received: by mail-pl1-x62a.google.com with SMTP id d9443c01a7336-20cafd36ed0so2767075ad.3
        for <linux-mediatek@lists.infradead.org>; Sun, 20 Oct 2024 20:01:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=huaqin-corp-partner-google-com.20230601.gappssmtp.com; s=20230601; t=1729479718; x=1730084518; darn=lists.infradead.org;
        h=references:in-reply-to:message-id:date:subject:cc:to:from:from:to
         :cc:subject:date:message-id:reply-to;
        bh=XkkT1YK08fvvBnsXdekTj1dlk1F6WdJ88gbC//Uv2Rg=;
        b=v2Ac98dzMoRzki7czZo2NdnBnG6LK8ctPUfM0soX7E3kaWQXelh9jTFL6a7Xmc3lvW
         BdCP6US6kh+ZPgfOcvDpLYCPbnFkEk5NQMoYaC7gQfVVb4sNFJlVk6mdHb8NnIySh857
         Att4GQ6rIwiywUdhKrU6yXL/5NCk65vOEvspTE0V3HvSvnuchF3Ps9Bs8tm6YneAf/82
         TJJHGCFlpuoLvLxcoA+XtATlcGMSean4mHs9MEPLqV9mmXXU6ar0svGhKPxBEmBfbOZx
         gaxFBTt4kCsmxQWYVWG+QpZeBct/v81yKihTN12u5sJJyQL9Ylpc3ZCSTftJtlqVQ/Hf
         MP9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729479718; x=1730084518;
        h=references:in-reply-to:message-id:date:subject:cc:to:from
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=XkkT1YK08fvvBnsXdekTj1dlk1F6WdJ88gbC//Uv2Rg=;
        b=uXKYxWob3hqkfIJaceoyVU2J7M8v3wWXTv9J7yHdNhYzCwuqwg4vaVoP2X2wt9P9Dw
         j0GI08+mlI4zLwKIUoeglnqe3VgxWGlMbxWivFX9xgA6fR368207IfUWGQiiDJ3SPvG7
         CygzSuRdU078ZbxaUga+OU4IYD6DrubXmKoTOvAQPtDk5ga7PyH1AWxfA1bOo4MV8U7o
         qM8IdgLp/3RzoEC24kA7mQQt7t1lZd3dSB3mRW8YsM4MpDwG8MTrEtXPD0uvPp1mHz3t
         NqIIYlXeNmQkqFUxJkLsvmhnIW/kRdYADkrmeKCc1hK4p5LaecoV2A0YqHOWBhwilHJ4
         /VUQ==
X-Forwarded-Encrypted: i=1; AJvYcCWxJISO/oyzeu86B6IAYvrWmNwmIheWMlyt6gQ3mRPLX2NqSqVikDNsRYFCEfFUZLj8gGIZ7LgFUzjhLT+KNA==@lists.infradead.org
X-Gm-Message-State: AOJu0Yyry857RQLn1DnodZFwDjxb5gQfoDkzp1+3RKzrGAQF1IfV8UJl
	DAyrgrCMsRvhS4qMac+9D4Np+gxDiq0Hq1KezX67i3IMfYD6UGGHmVJDJK1bgw8=
X-Google-Smtp-Source: AGHT+IF2l3fvw7cZnTVlJG1e6ibKKbfgh+RtTSulFnAnUTynhu5L+2rzXIOyMTwakDpVOl1YUTgIEA==
X-Received: by 2002:a05:6a20:4311:b0:1cf:4c3a:162a with SMTP id adf61e73a8af0-1d92c4ef619mr6775462637.5.1729479718621;
        Sun, 20 Oct 2024 20:01:58 -0700 (PDT)
Received: from ubuntu.huaqin.com ([116.66.212.162])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-71ec1313fb5sm1815601b3a.7.2024.10.20.20.01.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 20 Oct 2024 20:01:58 -0700 (PDT)
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
Subject: [PATCH v3 3/4] arm64: dts: mediatek: Add exton node for DP bridge
Date: Mon, 21 Oct 2024 10:59:37 +0800
Message-Id: <20241021025938.676-4-xiazhengqiao@huaqin.corp-partner.google.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20241021025938.676-1-xiazhengqiao@huaqin.corp-partner.google.com>
References: <20241021025938.676-1-xiazhengqiao@huaqin.corp-partner.google.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241020_200200_012347_0C153DD8 
X-CRM114-Status: UNSURE (   8.72  )
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


