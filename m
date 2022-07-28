Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4D224C04A68
	for <linux-mediatek@archiver.kernel.org>; Thu, 28 Jul 2022 15:39:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=CqSVW/Ueq6eSKuuwfz5Rq7CFA5+wXLwAWIYxDZSpO44=; b=DIYAUPNOA5aq4ThaE54yZ6urnv
	YbNvm8V4XdEb8BoDY7UhYY62ERCuuCKJZ/3RmVO854AQG8swnULPJScyZttV+mzvDxCOoOFExYN66
	w2Q0eVa6BeyLZ0TMVhni+jb6b42y7E0hJOZXlBQ998FVYCzGjpW0ijiDdValUTvWfUUgs0U6pBdB1
	cYfZPFTeel2XzVgw156ZaWft2y0x0zfeFEeGDe2K96uQ9DCd538/kcsB10ETvdHrrxiWZCelZI/PA
	ULXqm8wty0xrVIoijXgsgOEfgvJc6zhsdIx4s0drztcCPx7BePGOirKoCWZ+c8Oy/0n48SMSoKbTu
	QAQE4HNg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oH5br-00AazE-Rv; Thu, 28 Jul 2022 15:39:35 +0000
Received: from mail-pg1-x52f.google.com ([2607:f8b0:4864:20::52f])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oH5bf-00Aart-TR
	for linux-mediatek@lists.infradead.org; Thu, 28 Jul 2022 15:39:25 +0000
Received: by mail-pg1-x52f.google.com with SMTP id f65so1805298pgc.12
        for <linux-mediatek@lists.infradead.org>; Thu, 28 Jul 2022 08:39:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=CqSVW/Ueq6eSKuuwfz5Rq7CFA5+wXLwAWIYxDZSpO44=;
        b=Mr16A+PaQ/QvRlFTof2HXImkabcfMVdsACcFH/i8ptMJGW1+/4dSaqJ2BBBZbr8sj1
         T/xZiOYHH9TxqQMvAbuFv+TD6zRIiIZWvOjT+sFZppRity0mktOZJF6Gn+Hajj67uf5z
         9Pv1twnvGQC0/BWmgqg9CgZVs82EDjtuTntDk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=CqSVW/Ueq6eSKuuwfz5Rq7CFA5+wXLwAWIYxDZSpO44=;
        b=ThXCVjrKnO6y9VwMajX0KM7CV2a9mp2OTqVf2HP4UqZy8qemomFOcCS0FATr1pRQlQ
         fw0R/ZAaYN1RM+lDjR6Ix55Nq++4qIg2t/ejSqDG7OcJupvf/Ppw9YkYT9cArRqDO699
         hdI9RcLsMdKQKuOXbLKkrdjBwpqWcM9TYr13crJF8JIL+cnasYVeZOlhVtIshOS0NJi2
         EejR7MeVQAwKABNIjy5N6OWSKirYn/HeYeNdoNKc0YR6ORLal498Y1XoSVODrDgG0odO
         F/SLny23RxHecxYat7xzCfSeb1DNOpKB6XgJPAPsBF+z6DjTBD2VWSrT2DTr2r4znsHN
         9ZkA==
X-Gm-Message-State: AJIora9GP6GfRu4FwoBulO4QWCwOf44dRWuyGZk3ai+sedUXXuVnl2a7
	3XpOgJl2+aN769boci23VhxVQA==
X-Google-Smtp-Source: AGRyM1u7RU0iN+DYfRvTGeLIPu8TkCTXOx9aEqO/5m1pJbFtITJo9P6lOu6fitsB9UUSmxcut8h8eg==
X-Received: by 2002:a63:1c24:0:b0:41b:40c5:f114 with SMTP id c36-20020a631c24000000b0041b40c5f114mr8543848pgc.3.1659022760163;
        Thu, 28 Jul 2022 08:39:20 -0700 (PDT)
Received: from treapking.tpe.corp.google.com ([2401:fa00:1:10:7c0f:5963:f38d:5645])
        by smtp.gmail.com with ESMTPSA id n5-20020a170902e54500b0016c0593876csm1462148plf.157.2022.07.28.08.39.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 28 Jul 2022 08:39:19 -0700 (PDT)
From: Pin-yen Lin <treapking@chromium.org>
To: Matthias Brugger <matthias.bgg@gmail.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	linux-kernel@vger.kernel.org
Cc: Eizan Miyamoto <eizan@chromium.org>,
	Evan Benn <evanbenn@chromium.org>,
	Hsin-Yi Wang <hsinyi@chromium.org>,
	Pin-yen Lin <treapking@chromium.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Rob Herring <robh+dt@kernel.org>,
	devicetree@vger.kernel.org
Subject: [PATCH v3] arm64: dts: mt8173-oak: Switch to SMC watchdog
Date: Thu, 28 Jul 2022 23:39:13 +0800
Message-Id: <20220728153913.2652153-1-treapking@chromium.org>
X-Mailer: git-send-email 2.37.1.359.gd136c6c3e2-goog
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220728_083923_967678_1C58CF41 
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
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Switch to SMC watchdog because we need direct control of HW watchdog
registers from kernel. The corresponding firmware was uploaded in
https://review.trustedfirmware.org/c/TF-A/trusted-firmware-a/+/3405.

Signed-off-by: Pin-yen Lin <treapking@chromium.org>
---

Changes in v3:
- Remove /delete-node/ and create a new node for SMC watchdog.

Changes in v2:
- Move the modifications to mt8173-elm.dtsi and add some comments.

 arch/arm64/boot/dts/mediatek/mt8173-elm.dtsi | 13 +++++++++++++
 1 file changed, 13 insertions(+)

diff --git a/arch/arm64/boot/dts/mediatek/mt8173-elm.dtsi b/arch/arm64/boot/dts/mediatek/mt8173-elm.dtsi
index e21feb85d822..fc8203297bac 100644
--- a/arch/arm64/boot/dts/mediatek/mt8173-elm.dtsi
+++ b/arch/arm64/boot/dts/mediatek/mt8173-elm.dtsi
@@ -161,6 +161,19 @@ hdmi_connector_in: endpoint {
 			};
 		};
 	};
+
+
+	smc_watchdog {
+		compatible = "arm,smc-wdt";
+	};
+};
+
+/*
+ * Disable the original MMIO watch dog and switch to the SMC watchdog, which
+ * operates on the same MMIO.
+ */
+&watchdog {
+	status = "disabled";
 };
 
 &mfg_async {
-- 
2.37.1.359.gd136c6c3e2-goog


