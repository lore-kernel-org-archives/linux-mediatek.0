Return-Path: <SRS0=RqDu=3X=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.3 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,URIBL_DBL_ABUSE_MALW,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F1931C3524D
	for <linux-mediatek@archiver.kernel.org>; Mon,  3 Feb 2020 10:55:16 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C8D122080D
	for <linux-mediatek@archiver.kernel.org>; Mon,  3 Feb 2020 10:55:16 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="bQtVFKQx";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="KcF50IO/"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org C8D122080D
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=chromium.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=fV4VEai/ZXDJdupd/U76kkonYa2W9B9vH+H9tp8OQPM=; b=bQtVFKQx1RCT0K
	LhYje2LDLbTE5bUUGygGW+UisTZ4W9SpKfBL3TVX7KpCNFAxxbrVFpvonvoweAiV5n+1u3lhHtl+I
	4HBsdcp0psWIlopTD7hfzrd4+k/soEcH2bNGbdmdJCqC6be3OiA6Hl/+EdKaYSdlS90yQx7AdTWKB
	dLzFUH31fvwYgiDW/1huZ5Ol93ofIul0arXKuYHmkjPtKhdHdSKNW2WktF/zG3axfzp7uCsttpNuk
	+YSc1ebQeAdBmhJbo4mSFYh2+57GqWPiiuoxVeXlkBK3TIOzgYdPmnYnj89ruEMAhihMQdRlx+ie+
	6fKV8+WMylb2h3SDirJw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1iyZNd-0006CP-RQ; Mon, 03 Feb 2020 10:55:01 +0000
Received: from mail-pg1-x541.google.com ([2607:f8b0:4864:20::541])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1iyZNN-0005w4-Pl
 for linux-mediatek@lists.infradead.org; Mon, 03 Feb 2020 10:54:47 +0000
Received: by mail-pg1-x541.google.com with SMTP id k3so7621840pgc.3
 for <linux-mediatek@lists.infradead.org>; Mon, 03 Feb 2020 02:54:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=3xwqth0j0JRZwYTHk1uzdteKd9U7z+7i4HoTqeFc82U=;
 b=KcF50IO/E4F3bV6HRoxGXWkocwgYfL4QHDNpJmohTWE7Mt/7DBO48kGOO4x1nMzBhz
 98VjsZNOxigAaq8KC68jlonM1+3zNOLMUu+6sJV4YMF/TBmKuIufMmi0FtKp4LG5P+Er
 NnIDgXFEMqPXY3DorDvWeMroZ7FFro+6qfhMY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=3xwqth0j0JRZwYTHk1uzdteKd9U7z+7i4HoTqeFc82U=;
 b=h9QjfGWLhpUjCM3MRhcaziVOAcIYdEExxmNLvFVz8g7Zr+xLksYE7+mE84EARJMLYv
 6J7LkmHDptp0IZDES0apG1m79y08oNSAh9sUfXE46i7WWoDpSIvTDnXCGLwoOAZPFJhB
 tBocq5gRxY6mf9R8DBj5CwOmvO9PamGvlhL3q8F1Jrp9OxAuyTocnIFxQPR3TCD8IMNB
 GX3i0mdJFNYlSXRc2UPTvHopPtyeCn7QAEl/FxyXEzx5POIIy4ktE/hvoyQAR/ClpTyY
 ZG0FQ9s2smapXeBWSKYShvJOPUjF3hzPxXEAkpkgrqHezpmWxhE8sk1PzwIzt9HOXuI9
 1xPg==
X-Gm-Message-State: APjAAAVn6Qq/82aqA92CDXLD95B88X51cHB911TrOWuiC4ZgpptFfm9H
 woV2TjA2iw4VZxw4kAu9Hyk0BA==
X-Google-Smtp-Source: APXvYqxeDCmLp2xff3fH5hTl0Vp+K0sL/O47c03M7tcS/eAYUTtC+GbrGGzgODOg24pRPZgw8vEESQ==
X-Received: by 2002:a62:3304:: with SMTP id z4mr23056111pfz.79.1580727284802; 
 Mon, 03 Feb 2020 02:54:44 -0800 (PST)
Received: from hsinyi-z840.tpe.corp.google.com
 ([2401:fa00:1:10:b852:bd51:9305:4261])
 by smtp.gmail.com with ESMTPSA id 11sm20923835pfz.25.2020.02.03.02.54.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 03 Feb 2020 02:54:44 -0800 (PST)
From: Hsin-Yi Wang <hsinyi@chromium.org>
To: linux-arm-kernel@lists.infradead.org
Subject: [PATCH v5 2/3] arm64: dts: mt8173: add uart aliases
Date: Mon,  3 Feb 2020 18:53:48 +0800
Message-Id: <20200203105345.118294-3-hsinyi@chromium.org>
X-Mailer: git-send-email 2.25.0.341.g760bfbb309-goog
In-Reply-To: <20200203105345.118294-1-hsinyi@chromium.org>
References: <20200203105345.118294-1-hsinyi@chromium.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200203_025445_847209_D6F63FF0 
X-CRM114-Status: UNSURE (   7.86  )
X-CRM114-Notice: Please train this message.
X-BeenThere: linux-mediatek@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-mediatek.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mediatek>, 
 <mailto:linux-mediatek-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mediatek/>
List-Post: <mailto:linux-mediatek@lists.infradead.org>
List-Help: <mailto:linux-mediatek-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mediatek>, 
 <mailto:linux-mediatek-request@lists.infradead.org?subject=subscribe>
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org,
 Nicolas Boichat <drinkcat@chromium.org>, linux-kernel@vger.kernel.org,
 Enric Balletbo i Serra <enric.balletbo@collabora.com>,
 Rob Herring <robh+dt@kernel.org>, linux-mediatek@lists.infradead.org,
 Matthias Brugger <matthias.bgg@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Add serial as uart aliases in mt8173.

Signed-off-by: Hsin-Yi Wang <hsinyi@chromium.org>
Reviewed-by: Enric Balletbo i Serra <enric.balletbo@collabora.com>
---
 arch/arm64/boot/dts/mediatek/mt8173.dtsi | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/arch/arm64/boot/dts/mediatek/mt8173.dtsi b/arch/arm64/boot/dts/mediatek/mt8173.dtsi
index 8b4e806d5119..790cd64aa447 100644
--- a/arch/arm64/boot/dts/mediatek/mt8173.dtsi
+++ b/arch/arm64/boot/dts/mediatek/mt8173.dtsi
@@ -50,6 +50,10 @@ aliases {
 		mdp_wdma0 = &mdp_wdma0;
 		mdp_wrot0 = &mdp_wrot0;
 		mdp_wrot1 = &mdp_wrot1;
+		serial0 = &uart0;
+		serial1 = &uart1;
+		serial2 = &uart2;
+		serial3 = &uart3;
 	};
 
 	cluster0_opp: opp_table0 {
-- 
2.25.0.341.g760bfbb309-goog


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
