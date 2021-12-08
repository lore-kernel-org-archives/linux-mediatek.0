Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 87458C433F5
	for <linux-mediatek@archiver.kernel.org>; Wed,  8 Dec 2021 01:48:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=URzTjIWvmDQIm9/LcPNsHoTnHpV7CtyElvK0EOE0ack=; b=GYSbjet+Ikr2QL
	WRgV6wSbY8gBIJptRtVYKJ9j4ZFz09LD7OCB8EQh66mfWSv//pszMLAwoRZCPDIAohL0HaC65BzTD
	1C8/66Q7HCP1cgSIpqPyM1gk0l7BKE5A5RUmBRxKyF3ZhRI+trtBJ2FsJl0DGcyK9h3v8NxfyMUeB
	0oVhZ7NMkTNgk7WNfqYtkwRUq1bqY+gcFCQgyHGZx1gpnmkxSZdinbcAOaLuGYC8SPKXnN1TmX5R8
	iU03EjvhpUaBKH6BrVda5LhZVm1ZrnDe/NPBzBAGSmF46bXnAc2qRMWnV3Zdg0ECVCdzTc66fq1ti
	OJMJrN4i/JIMeGzU7CPg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mum4S-00Acuv-Ov; Wed, 08 Dec 2021 01:48:36 +0000
Received: from mail-pg1-x52a.google.com ([2607:f8b0:4864:20::52a])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mum4Q-00Acth-IW
 for linux-mediatek@lists.infradead.org; Wed, 08 Dec 2021 01:48:35 +0000
Received: by mail-pg1-x52a.google.com with SMTP id l64so687415pgl.9
 for <linux-mediatek@lists.infradead.org>; Tue, 07 Dec 2021 17:48:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=aljXQrfp/nk+XodhSs669E3VvH0uoHB2cwz4E+feFs0=;
 b=fiDcvQk0WrAprIYApbU9yo9ksEjH49kQkrHRxO8VYFqjKLsmHFrxp57bYYCtGVdJPu
 wMZRXPE7jLmsMFFQj/CoL5dLu3WQngIU/D/7h0Fm97a56bz5+jGms0xnnTgcKN1y53uJ
 PFk75HQabTZJjEXA8vSNbc3Pmz9cDfuBfaFgo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=aljXQrfp/nk+XodhSs669E3VvH0uoHB2cwz4E+feFs0=;
 b=EgDlDQDBelCbULjfFhato1k1WXnLIp7mJowGQLAebHRmeW4YlKAliHgStr7Nyqwn/9
 mfrL0mAlub10GfuFMkghiEWr7eZ2cdjRfg8yfhZ2CkMEQF5ml9He5qThOoXAPZtpIRAf
 UgBKUH7JxQufM1XQuoarkHfZJW+6RgOcD9q5kfj8VpbOoQZmx7LxHtLZShCqK2k35B0n
 8U9CufDJLUZ97PZXHJwC31KFQ16FRt4aOVQGWZdisPHERfh0CqRtiIJTQdWdr6eVfHPN
 USTxxYn2Nd4Qn3uBshixXtHkNTbET7gZuJNm0zRvUydcsxoJJQfoXSWbsv//kQQjlO5W
 w2uw==
X-Gm-Message-State: AOAM532qmW5j8Ngqg7jdf5lAv7NnPEAZAh8/DYGXLGnAbXz6S8LoJDMn
 lIgbT/Tt8cz+t+4n/ySUNiLXxA==
X-Google-Smtp-Source: ABdhPJzq8zPem4Gf5ADs/xOZ7wd9Z00KjDeEcd/30o7dSRnnLPv1CAdeUkobknzxFUIM8jqsHdkgyQ==
X-Received: by 2002:a63:187:: with SMTP id 129mr27057651pgb.333.1638928109422; 
 Tue, 07 Dec 2021 17:48:29 -0800 (PST)
Received: from pmalani2.mtv.corp.google.com
 ([2620:15c:202:201:3bcc:3d23:303f:533b])
 by smtp.gmail.com with ESMTPSA id p17sm1080565pfh.86.2021.12.07.17.48.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 07 Dec 2021 17:48:29 -0800 (PST)
From: Prashant Malani <pmalani@chromium.org>
To: linux-kernel@vger.kernel.org,
	linux-mediatek@lists.infradead.org
Cc: Prashant Malani <pmalani@chromium.org>,
 Alexandru M Stan <amstan@chromium.org>, Benson Leung <bleung@chromium.org>,
 devicetree@vger.kernel.org (open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE
 BINDINGS), 
 linux-arm-kernel@lists.infradead.org (moderated list:ARM/Mediatek SoC support),
 Matthias Brugger <matthias.bgg@gmail.com>, Rob Herring <robh+dt@kernel.org>
Subject: [PATCH] arm64: dts: mt8183: kukui: Add Type C node
Date: Tue,  7 Dec 2021 17:47:58 -0800
Message-Id: <20211208014800.10058-1-pmalani@chromium.org>
X-Mailer: git-send-email 2.34.1.400.ga245620fadb-goog
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211207_174834_635080_059B6F77 
X-CRM114-Status: UNSURE (   8.43  )
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

Add a node describing the USB Type C connector, in order to utilize the
Chromium OS USB Type-C driver that enumerates Type-C ports and connected
cables/peripherals and makes them visible to userspace.

Cc: Alexandru M Stan <amstan@chromium.org>
Cc: Benson Leung <bleung@chromium.org>
Signed-off-by: Prashant Malani <pmalani@chromium.org>
---
 arch/arm64/boot/dts/mediatek/mt8183-kukui.dtsi | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/arch/arm64/boot/dts/mediatek/mt8183-kukui.dtsi b/arch/arm64/boot/dts/mediatek/mt8183-kukui.dtsi
index 94c13c459194..d2796d17b856 100644
--- a/arch/arm64/boot/dts/mediatek/mt8183-kukui.dtsi
+++ b/arch/arm64/boot/dts/mediatek/mt8183-kukui.dtsi
@@ -886,6 +886,20 @@ usbc_extcon: extcon0 {
 		cbas {
 			compatible = "google,cros-cbas";
 		};
+
+		typec {
+			compatible = "google,cros-ec-typec";
+			#address-cells = <1>;
+			#size-cells = <0>;
+
+			usb_c0: connector@0 {
+				compatible = "usb-c-connector";
+				reg = <0>;
+				power-role = "dual";
+				data-role = "host";
+				try-power-role = "source";
+			};
+		};
 	};
 };
 
-- 
2.34.1.400.ga245620fadb-goog


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
