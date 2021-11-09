Return-Path: <SRS0=Xaha=P4=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8BF95C433EF
	for <linux-mediatek@archiver.kernel.org>; Tue,  9 Nov 2021 05:33:53 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3EBF260E75
	for <linux-mediatek@archiver.kernel.org>; Tue,  9 Nov 2021 05:33:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 3EBF260E75
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=chromium.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=nmgJS5WGEiZxvRBTj5UkdsAzOMuqVPN6mtBrzniOYrI=; b=BOWOB95vDXjIMO
	Y1OTyx3UYwpuYGMCIiQLprNdi4ALDPgtdEZKnCsc1/nBmtejiB2KvTkJUD6wYGkS2QAobbK4jW42l
	In88zb/blL0tmVVFldedjJeydNGoL5pVVKxqT6L9AGVm4deM0CrabRq5r+36mG9Uqazs4dtWoizZA
	60y+JvlsqVFBzlPUkYNS5YY83Pxmzc5x5QL25mKU0avwiy9Z7A/syHkPYTBgxCYpgowRtmq/D48Qr
	F6a+qmFdx4AwTM+najI0z0mnRPF3I3h1Dwoj8EELHg/ubcgzapBI8kYIRoofspuzJDq0QxSMQt5NR
	M05JJ0WH4T6EBDtjTkmA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mkJlO-000hvX-Ju; Tue, 09 Nov 2021 05:33:42 +0000
Received: from mail-pl1-x62f.google.com ([2607:f8b0:4864:20::62f])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mkJlM-000htf-9o
 for linux-mediatek@lists.infradead.org; Tue, 09 Nov 2021 05:33:41 +0000
Received: by mail-pl1-x62f.google.com with SMTP id y1so18855727plk.10
 for <linux-mediatek@lists.infradead.org>; Mon, 08 Nov 2021 21:33:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=RLjicxNmNpYNSdlDLoBw1hRqse8yPujz3RAWyTpfEac=;
 b=odKCJ6d7H5bH4EsvYJwQsBe08JB8jHarQYqDI5Kfwc2NLU+hySWtFgWDhQox7QAke/
 9UTGnVcsxADRJFMy3iVKlsYAdiG/6ChqgO4Iqd/v2O91diGHSJajZrEL0t6N6N7373wQ
 C59FjlO9LlxmwUN4zx8GIG6KKQPHA2yIrygYg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=RLjicxNmNpYNSdlDLoBw1hRqse8yPujz3RAWyTpfEac=;
 b=mBSYby67Sn6DtlPRCtKaPz2Q2Cvtzi/yAYnWm4T1uHeGOHMBKavABrjyU5iInQ43bg
 RXvxIfqcIwLlEipvsOOaTHfGppIMe1S+cVvXOIiXXFqD9COk9uqZCVMlM590XdF4t2i3
 wqDaEd/T2nQYbtCuY23e6z1senlgMFcfRHaqAyWxu+lSUNwG3HIwL0UE+3jMI37lz8i8
 jynjyKg8EghmEX5yjaK42zsQm4mkV/K0QC/M6oYsthWulFooKCnt5o0sG7fgW0s+Oa5f
 1xOX79h29N3U/2QDR5yG32OCL18HdSIPJp4PEetafUHFMrFPkWxKxPc7VQl19sa6iaFw
 gLXA==
X-Gm-Message-State: AOAM531XgAatOz5vhmabm1iVy3jYVXgfaziaT/vbEp4QQQbsOmPcUuAj
 qmt/Is8YobAJImHRUQcneLHIRQ==
X-Google-Smtp-Source: ABdhPJz7orF7lfNNUIyXu6Own8rdIu7+OsJ5fOjCVqxqThwEdRZ8ZBjzbGsTPGx6uq8/Cofpfn2h5g==
X-Received: by 2002:a17:90b:1e0e:: with SMTP id
 pg14mr4240138pjb.143.1636436018094; 
 Mon, 08 Nov 2021 21:33:38 -0800 (PST)
Received: from hsinyi-z840.tpe.corp.google.com
 ([2401:fa00:1:10:cc3e:b71b:e327:fb32])
 by smtp.gmail.com with ESMTPSA id w5sm13741479pgp.79.2021.11.08.21.33.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 08 Nov 2021 21:33:37 -0800 (PST)
From: Hsin-Yi Wang <hsinyi@chromium.org>
To: Matthias Brugger <matthias.bgg@gmail.com>
Cc: Rob Herring <robh+dt@kernel.org>, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
Subject: [PATCH v2 1/7] arm64: dts: mt8183: jacuzzi: remove unused ddc-i2c-bus
Date: Tue,  9 Nov 2021 13:33:28 +0800
Message-Id: <20211109053334.1840273-1-hsinyi@chromium.org>
X-Mailer: git-send-email 2.34.0.rc0.344.g81b53c2807-goog
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211108_213340_385304_68642841 
X-CRM114-Status: UNSURE (   9.64  )
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

EDID is read from bridge, so the ddc-i2c-bus is unused.

Signed-off-by: Hsin-Yi Wang <hsinyi@chromium.org>
---
 arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi.dtsi | 1 -
 1 file changed, 1 deletion(-)

diff --git a/arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi.dtsi b/arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi.dtsi
index d8826c82bcda29..8f7bf33f607da2 100644
--- a/arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi.dtsi
+++ b/arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi.dtsi
@@ -9,7 +9,6 @@ / {
 	panel: panel {
 		compatible = "auo,b116xw03";
 		power-supply = <&pp3300_panel>;
-		ddc-i2c-bus = <&i2c4>;
 		backlight = <&backlight_lcd0>;
 
 		port {
-- 
2.34.0.rc0.344.g81b53c2807-goog


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
