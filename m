Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CB417CF9C5B
	for <linux-mediatek@archiver.kernel.org>; Mon, 23 Sep 2024 08:15:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=pQy8Dxfmu7fap2VOihFGL73YkwS/WJ5DNXUiPdnsd/I=; b=tSTq+6ONT3tzy//8+Fs8XbhOff
	5qyfwbZnGBW7oxS6X7Twl7BKRQR29zFDZEz2lF0KyBuhWwNQE63U7nOkPhU44bb1WrP7go5cItBPo
	Gu0OnbM3MyHQflZcpG9qCQlgEj8J1aa3UlUiNNLv3zU+oGg6mFm/2r8YDcY1TioYcvnyJBiG2Vfrg
	KRRjr89pTb8GwqTs55AxdG+sRbRuUhGMpoyEyTIhsFh/n3Eff/qimeik9C9ncUaYJYYPmAuEiJGU9
	hDFZoyJiFdmzHrIPw3ka7KvSAIybL24+kCKqEUQfSzk6Z2rcgaK+yFBFQ0FQMXQ6pG4/HwFc/beO2
	oiheJ+2A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1sseDs-0000000Gdtf-3MWp;
	Mon, 23 Sep 2024 08:15:08 +0000
Received: from mail-pl1-x633.google.com ([2607:f8b0:4864:20::633])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1sseCj-0000000Gdhz-0AZm
	for linux-mediatek@lists.infradead.org;
	Mon, 23 Sep 2024 08:13:58 +0000
Received: by mail-pl1-x633.google.com with SMTP id d9443c01a7336-20536dcc6e9so25625635ad.2
        for <linux-mediatek@lists.infradead.org>; Mon, 23 Sep 2024 01:13:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=compal-corp-partner-google-com.20230601.gappssmtp.com; s=20230601; t=1727079235; x=1727684035; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=pQy8Dxfmu7fap2VOihFGL73YkwS/WJ5DNXUiPdnsd/I=;
        b=YalaXfMYfupdfHmFHgfle69+1W+X0ImuXiHdaqGfWY4o5u05/AxKKzwXeOhP94DjqN
         r3Vlwfwxs4qZu+P/l/yyJ2WMCNPDo0Q5RI5kjUXj4pIxXFe1lLyStlfR0trVj23qTL16
         p3z5dvylt25CyOGDa8njzZf7Wo7MVu4lo91uOD+M6Uq2PPLryvJ7MrnVyZE3ySiweTOg
         /8i7oCNDCpBdpgubYuABSIZvMY1kunXtehCIA+rRQT25284Cjwc9KyC8dUJtHLF5huCN
         OSE2zSxLkUP9+vdcAucExuJFWl8KdBbQEEJ3nhOrOq/Vao4TkM7zj3iCfv5T/g6cge8u
         WJ3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727079235; x=1727684035;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=pQy8Dxfmu7fap2VOihFGL73YkwS/WJ5DNXUiPdnsd/I=;
        b=OzJL13/HqjbdPeaWXGr/Fl48AEj7DzhlzxiXmmZtcmsAY9LvpODBS37PkH06ZwerpP
         sHiVzxRxqphbSvSeegC91X4+3AN3rNyhlhlaGfVL03HihY2HMrIcBNmIwgJDf2gLYWRI
         pSe+9E24zQKINOJoh1HmVp4hD+13urDxha0CAoyQx/Y/OF1kYdfJZzj2erVsE468tNJq
         lp3bk8W+L3JsiYqxlvU6yQ4aGtepgjGfP9d90cVdwE7JyRNmeeooiylCBVTFunldNQ0U
         7A4U9M7Nm7ZO6H8fj52CySajrKx4SDNpb2lh0hzf4a4JeXiCugdVGLApe4dhqNY76NrV
         uaPA==
X-Forwarded-Encrypted: i=1; AJvYcCWFb2ouUdD+ITdcjwAq2V3WlCq7MK/9anez5CzoM17rZkJvRLl4xz1y03oc21uCOMeYzWIuKlCqy8dVbpT5cQ==@lists.infradead.org
X-Gm-Message-State: AOJu0Yx/e25n8S1OIdjUUgpO7eVB1lc0VWwmCc2YA7Mm7xcWeoehJGnk
	g2e8C9MuP7zARtdF5ybhATBwF/6uXB3kW6h8/1Y8hZSyIxV5z1bcJHzGz/MUF0M=
X-Google-Smtp-Source: AGHT+IE26gx2jgT7LO3ISI0SJ9dTEoWLtDfoJJBXr1rZ4bhzlohyJeU/p7j2+b//vCf8oO67DUUqNw==
X-Received: by 2002:a17:902:da85:b0:205:5427:2231 with SMTP id d9443c01a7336-208d840d687mr139802545ad.47.1727079235519;
        Mon, 23 Sep 2024 01:13:55 -0700 (PDT)
Received: from maxweng-Latitude-7410.. (2001-b030-0251-0200-ae0b-14c1-5918-69cd.hinet-ip6.hinet.net. [2001:b030:251:200:ae0b:14c1:5918:69cd])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2079470f38csm128256985ad.205.2024.09.23.01.13.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Sep 2024 01:13:54 -0700 (PDT)
From: Max Weng <max_weng@compal.corp-partner.google.com>
To: linux-kernel@vger.kernel.org
Cc: max_weng@compal.corp-partner.google.com,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	matthias.bgg@gmail.com,
	angelogioacchino.delregno@collabora.com,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Subject: [PATCH v1] arm64: dts: mediatek: mt8186: add FHCTL node
Date: Mon, 23 Sep 2024 16:13:40 +0800
Message-Id: <20240923081340.860715-1-max_weng@compal.corp-partner.google.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240923_011357_286325_E5B931B1 
X-CRM114-Status: UNSURE (   7.64  )
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

From: max_weng <max_weng@compal.corp-partner.google.com>

add fhctl device node.

Signed-off-by: max_weng <max_weng@compal.corp-partner.google.com>
---
 arch/arm64/boot/dts/mediatek/mt8186.dtsi | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/arch/arm64/boot/dts/mediatek/mt8186.dtsi b/arch/arm64/boot/dts/mediatek/mt8186.dtsi
index 148c332018b0..d3c3c2a40adc 100644
--- a/arch/arm64/boot/dts/mediatek/mt8186.dtsi
+++ b/arch/arm64/boot/dts/mediatek/mt8186.dtsi
@@ -29,6 +29,13 @@ aliases {
 		rdma1 = &rdma1;
 	};
 
+	fhctl: fhctl@1000ce00 {
+		compatible = "mediatek,mt8186-fhctl";
+		clocks = <&apmixedsys CLK_APMIXED_TVDPLL>;
+		reg = <0 0x1000ce00 0 0x200>;
+		status = "disabled";
+	};
+
 	cci: cci {
 		compatible = "mediatek,mt8186-cci";
 		clocks = <&mcusys CLK_MCU_ARMPLL_BUS_SEL>,
-- 
2.34.1


