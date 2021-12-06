Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4A07CC433F5
	for <linux-mediatek@archiver.kernel.org>; Mon,  6 Dec 2021 13:05:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=9CpJchKdhy8tNLgbNIs2kNHhG8oGFfPkr6tlZxGk8bU=; b=O3hMLnMK7mQJy+
	PEMyJDvCcEsL7bB7EnZsDHuE7eFCf0GFT3uT4TiKY36fEbdOUQf4fTaqo357mlRGlNBjpQByhipuK
	/d1TNhKNx37Xrq1iz3e4BR89nb0USGZ08Fn8XGOzfUgHyQ8NI/iS1/47K5y189xjGkHI+kqZJwbOs
	yCkMLDFtbFH00lySMuWV0xOFYkarYZ1jTLZxzxCyzWdLGQ7iHJeyn1yNIv/Ld14qnduTiB5VAK382
	5q8Gmo469vuQx+ieiDVzWrTfOSywYOCBfWRp6TKe26HONbO9cYW5JC/ip6aCoDmfPaNnP43HPKbjQ
	UyKvkiZHUy+j0HSgDzIQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1muDgC-003u30-NM; Mon, 06 Dec 2021 13:05:16 +0000
Received: from mail-pj1-x1033.google.com ([2607:f8b0:4864:20::1033])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1muDfa-003tn3-2m
 for linux-mediatek@lists.infradead.org; Mon, 06 Dec 2021 13:04:39 +0000
Received: by mail-pj1-x1033.google.com with SMTP id np3so7696734pjb.4
 for <linux-mediatek@lists.infradead.org>; Mon, 06 Dec 2021 05:04:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=EZNxS2Er2+TWPCvjwKrCutia6d+RziQ5eq8Nih9Wpag=;
 b=NwQdgeQkNdIYvLlsCYBFOR7AArMeA4ocHnxglBH96EmJ72XZY4K6lP0WXCMPZC5MRd
 e+xFSAfy3OIMsGoCjnF1s7RECqJpn+ibnWq/3RijwIqsS0/GA1OD6qEdDWL9wxC28o7F
 QlNXB+IfCpWa0uCAhBQoxLGfF26k79BLgWYFM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=EZNxS2Er2+TWPCvjwKrCutia6d+RziQ5eq8Nih9Wpag=;
 b=FkkQSU7gr3VtaYtU5TUc/3F68hIvHILiDEY+t9ktOHgqlAqjcEhd6tUw4ZDuwrSw2T
 EXylBwl283VTlshkjxe4PzOTBUQE4vxUWHx0o7euH6sXPb7x5QSLGX7xCMgjaU1vV58D
 0cqYRymbhA9dDwOo2zaGnDl/HuYPR5ddOWk7cdKieqTMXEchHnHxxTaOgLcWxbyI/PHX
 wnU3ELWDjSmwpL4BBUnSaLQhtJ/ZyjJ4U0Wv/Sby8aLC3gaC5QgSV0aUtQTFNmiQBn9h
 O2+jccZ2wsSaF3WHL/boADVhjIHf3SeDgv6E3xUin+hJepZFIexpFgu3tKqPOORbZA9K
 PyAA==
X-Gm-Message-State: AOAM532mJFDUgrZ7LArVpHjSo0nZ1MqgvLlp8yA7aCj5x0T7wqXUcxgg
 5xkaNIUH7IZ2Hik4ZlLlwBzoiQ==
X-Google-Smtp-Source: ABdhPJxzHx6MmM0wI6OVhtmYu60irjAp+3SFk9nmVn9Dxj4qPjt0SsnUvMGMavc7yAJJu47x0/ncFg==
X-Received: by 2002:a17:902:b110:b0:142:7621:aecb with SMTP id
 q16-20020a170902b11000b001427621aecbmr43580422plr.55.1638795876908; 
 Mon, 06 Dec 2021 05:04:36 -0800 (PST)
Received: from hsinyi-z840.tpe.corp.google.com
 ([2401:fa00:1:10:5044:6464:4ad7:572c])
 by smtp.gmail.com with ESMTPSA id v25sm12402292pfg.175.2021.12.06.05.04.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 06 Dec 2021 05:04:36 -0800 (PST)
From: Hsin-Yi Wang <hsinyi@chromium.org>
To: Matthias Brugger <matthias.bgg@gmail.com>,
 Rob Herring <robh+dt@kernel.org>, linux-media@vger.kernel.org
Cc: linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
 linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org,
 yong.wu@mediatek.com
Subject: [v6 3/3] arm64: dts: mt8183: add jpeg enc node for mt8183
Date: Mon,  6 Dec 2021 21:04:25 +0800
Message-Id: <20211206130425.184420-3-hsinyi@chromium.org>
X-Mailer: git-send-email 2.34.1.400.ga245620fadb-goog
In-Reply-To: <20211206130425.184420-1-hsinyi@chromium.org>
References: <20211206130425.184420-1-hsinyi@chromium.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211206_050438_156032_25F2E4C9 
X-CRM114-Status: UNSURE (   9.22  )
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

From: Maoguang Meng <maoguang.meng@mediatek.com>

Add jpeg encoder device tree node.

Signed-off-by: Maoguang Meng <maoguang.meng@mediatek.com>
Signed-off-by: Hsin-Yi Wang <hsinyi@chromium.org>
---
v5->v6: no change, rebase to latest linux-next
---
 arch/arm64/boot/dts/mediatek/mt8183.dtsi | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/arch/arm64/boot/dts/mediatek/mt8183.dtsi b/arch/arm64/boot/dts/mediatek/mt8183.dtsi
index ba4584faca5aea..ac6b0c12d3b339 100644
--- a/arch/arm64/boot/dts/mediatek/mt8183.dtsi
+++ b/arch/arm64/boot/dts/mediatek/mt8183.dtsi
@@ -1530,6 +1530,18 @@ larb4: larb@17010000 {
 			power-domains = <&spm MT8183_POWER_DOMAIN_VENC>;
 		};
 
+		venc_jpg: venc_jpg@17030000 {
+			compatible = "mediatek,mt8183-jpgenc", "mediatek,mtk-jpgenc";
+			reg = <0 0x17030000 0 0x1000>;
+			interrupts = <GIC_SPI 249 IRQ_TYPE_LEVEL_LOW>;
+			mediatek,larb = <&larb4>;
+			iommus = <&iommu M4U_PORT_JPGENC_RDMA>,
+				 <&iommu M4U_PORT_JPGENC_BSDMA>;
+			power-domains = <&spm MT8183_POWER_DOMAIN_VENC>;
+			clocks = <&vencsys CLK_VENC_JPGENC>;
+			clock-names = "jpgenc";
+		};
+
 		ipu_conn: syscon@19000000 {
 			compatible = "mediatek,mt8183-ipu_conn", "syscon";
 			reg = <0 0x19000000 0 0x1000>;
-- 
2.34.1.400.ga245620fadb-goog


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
