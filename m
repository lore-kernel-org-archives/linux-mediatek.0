Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4D4C2D21690
	for <linux-mediatek@archiver.kernel.org>; Tue, 15 Oct 2024 12:43:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:MIME-Version:Content-Type:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=XkkT1YK08fvvBnsXdekTj1dlk1F6WdJ88gbC//Uv2Rg=; b=IEYHvoggJ/yx7CbyHaxJLCLpkD
	XOcWiaZPZK9lB4B2EmrxlwjJGI5fMKr2DGcqPa3OSgSXORxuov2S0MgxU2juyScZnIcLc7ASjfdYE
	nViCZ+xKJ1mLQkPayDS6BUycGouye0CqQflI9nHnbvpXTbVUF0FW4VmH9zLgTCRRkaw0Jcp02jrwa
	4rP96Yv/0E7dDTdn/r0brNf4Vde+PmA4eDq+EyQfrSteZvfyPKmu/RdmHzwwffJIoK0JVUJl+uLxs
	ALvLcFnfB+hlDgsrEQhRiYEpK/8xjYNH+bJA0qSu8J+ogiSS73/3JGLSCFUZMS0dGhkDZEbiWHAyy
	n0btgwEA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t0gto-00000008DSC-2450;
	Tue, 15 Oct 2024 12:43:40 +0000
Received: from mail-pj1-x1035.google.com ([2607:f8b0:4864:20::1035])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t0gdE-00000008A5H-2nLW
	for linux-mediatek@lists.infradead.org;
	Tue, 15 Oct 2024 12:26:33 +0000
Received: by mail-pj1-x1035.google.com with SMTP id 98e67ed59e1d1-2e2c2a17aa4so1064328a91.0
        for <linux-mediatek@lists.infradead.org>; Tue, 15 Oct 2024 05:26:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=huaqin-corp-partner-google-com.20230601.gappssmtp.com; s=20230601; t=1728995191; x=1729599991; darn=lists.infradead.org;
        h=references:in-reply-to:message-id:date:subject:cc:to:from:from:to
         :cc:subject:date:message-id:reply-to;
        bh=XkkT1YK08fvvBnsXdekTj1dlk1F6WdJ88gbC//Uv2Rg=;
        b=dtVbUVDU06Ck45B+0mWOkE2iW2v9PRXsLbzTygoPsiTUP0doTW55/sAa75f/8F0DZE
         KtacbsT+OmBsJSx6V0NG+1KW1lePLaGNF4Mk75E5yyLXJzcXRM2va9pf6KoKmYuIMzLt
         8+74kV8hlXWlVQcA6Sw8hRg9RFgOKUluH2l4KKwGU77yFleNoRBoIJx8ZTZ1F1+jC41y
         1z2RW2nx3REkeaKe+X0hHq5lQb13bSKTopISOhWf7aCc7aD9oq4IwjH4nefCKpyZmzcg
         mVqX6fWAAH9Scs886YgEUXIC85ll7dZIMWnz3HDUvqNTIY21xatyld7FYjUBgrxLx6Bx
         39cw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728995191; x=1729599991;
        h=references:in-reply-to:message-id:date:subject:cc:to:from
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=XkkT1YK08fvvBnsXdekTj1dlk1F6WdJ88gbC//Uv2Rg=;
        b=DTqAKQoES/rbNTy78MUZnMGmi89lUuqfFgA/ElkZmaR1kVSM9x11lv63YT/wfmaS01
         Cmzuw+IrMPqA86OFhN60hveTNcwDV1sCmF9yawIPZVjiYIz6E77vr/pQ+IAEMXZ9lhsi
         ASnxmK8r44SV5sA5zKyEtYzo/vi12WHi2Ui4W9M3KOs01vW4y0vZzyLaI8CE67QpSW9z
         YaT7wbYUqtvwtjYSx9tE/Qjtb63j6u94qGXtg7LnAFCisXvvkLTNMuc28EcO7FQ9fkdA
         090AKloo2dDr5v3RFD2vjZ86TBITUZLS+dBEDfFVeU6/hT4wHKU9kQOsxlvJyU56tnvk
         HpVg==
X-Forwarded-Encrypted: i=1; AJvYcCUHP2DqhqzUfX299RJtRMu9Mci7eeYztlplGpplIIBCS2jWuX66OVF7RLurvc06qtRhK+yWtr+x1E16PYgxlA==@lists.infradead.org
X-Gm-Message-State: AOJu0YxmafBR5p51wEUOvLoOfmNqb0i9F/IIe88swOOnxNJIQAvz51pA
	ZURwyuayKSbhytG+M3Jo2b57YUVWG4FRicxCC5es1iCFPN6er5WfnkgWbZmXmVI=
X-Google-Smtp-Source: AGHT+IFvZj2VfZqljCqw3jma49Pp6xcmlucmNJ1sekFJZrx2haRRMxJLdzbrnRlngELlYtE94RuvZw==
X-Received: by 2002:a17:90b:1056:b0:2e2:c423:8e16 with SMTP id 98e67ed59e1d1-2e2f0a2fb66mr7652523a91.1.1728995191585;
        Tue, 15 Oct 2024 05:26:31 -0700 (PDT)
Received: from ubuntu.huaqin.com ([116.66.212.162])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2e392e8cdc7sm1592844a91.10.2024.10.15.05.26.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Oct 2024 05:26:31 -0700 (PDT)
From: Zhengqiao Xia <xiazhengqiao@huaqin.corp-partner.google.com>
To: devicetree@vger.kernel.org,
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
	rafal@milecki.pl,
	macpaul.lin@mediatek.com,
	sean.wang@mediatek.com,
	Zhengqiao Xia <xiazhengqiao@huaqin.corp-partner.google.com>
Subject: [PATCH v1 3/3] arm64: dts: mediatek: Add exton node for DP bridge
Date: Tue, 15 Oct 2024 20:26:08 +0800
Message-Id: <20241015122608.24569-4-xiazhengqiao@huaqin.corp-partner.google.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20241015122608.24569-1-xiazhengqiao@huaqin.corp-partner.google.com>
References: <20241015122608.24569-1-xiazhengqiao@huaqin.corp-partner.google.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241015_052632_746694_21886C1D 
X-CRM114-Status: UNSURE (   9.27  )
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


