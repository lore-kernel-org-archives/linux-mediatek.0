Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0013CCEDD89
	for <linux-mediatek@archiver.kernel.org>; Wed,  9 Oct 2024 13:08:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:Message-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=L/uGdh4k87UdLsVlqrkIfn4gIIwnutqsKO4ayJkibeU=; b=IhPYSH/1MC/Rz6sPRUauCSt+4J
	vhGIFDgtlkxOhjwXUTU1mi02rqyU4B5iumdRQMHbZfoJ+bGj9h1q+x4oFj0DUE34Bhr5qNnBmcjG3
	LPpruuRdz6v+QmmnZDKveVhxeK5PWP5/EDo66e+X8Vvn/HfcP0IJcAPzD7WL9rSglhSZK7dPlMW1J
	5cDRSCctupobMvEk9qwXsJr1GIB/sOprUHHSXT5mbtyD7ge6B3iUwn4QJOrRWHn57WnRgAJ1LKFLq
	QEL65V0P07Ul+Oo79Eb0w7TTUVWrKE+zXBjYKacLuQwNDi34RHIR0ReTQUU/rOJc8uP6o9A3ajPE2
	XOKqngGw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1syWQ8-00000009LWL-3ibQ;
	Wed, 09 Oct 2024 13:08:04 +0000
Received: from mail-pj1-x102e.google.com ([2607:f8b0:4864:20::102e])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1syWNq-00000009L4B-2p2C
	for linux-mediatek@lists.infradead.org;
	Wed, 09 Oct 2024 13:05:44 +0000
Received: by mail-pj1-x102e.google.com with SMTP id 98e67ed59e1d1-2e29555a1b2so975381a91.3
        for <linux-mediatek@lists.infradead.org>; Wed, 09 Oct 2024 06:05:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1728479141; x=1729083941; darn=lists.infradead.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=L/uGdh4k87UdLsVlqrkIfn4gIIwnutqsKO4ayJkibeU=;
        b=RlRjo6VzXYl1AMCy5OK/yFwpsvQPtuUJy60l4qC7xhc6HQJjZw+vtiZzDrwO9z9vcI
         MzzjPMO1IT0+P0PunDjp4IseimO4ienFGb6RiuqqrD8pAOZcJc6fFljYE0mvIbg2ABci
         642tu4xOg+Xsbbw8CzfID0FFdmHYC8tRjC+70=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728479141; x=1729083941;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=L/uGdh4k87UdLsVlqrkIfn4gIIwnutqsKO4ayJkibeU=;
        b=GlqMZUtrAKtH5CBC8fFAo1wi2mH+G675LVLZR6/04NahE4ND4Fu25prgmNplylgAWQ
         JQq9GVw9SLHn6a3ZxpYz3gGh+ConL+py4rAXW5PU6UgXl9+xRfk/KgeD3w5p2sVBn50C
         +zqChlog3E7sO4ZM0o6ilY//1CWQAtaMfSJYToRLM5faZ6G8/ZGnZNdJdMlKm2bKS5M2
         a1ZJa1jEA9FYGx8iDhke5GxLHeFbRplTQ1QpdvCiFJNB9CRRFXZJIY43mGYookctug1e
         2OGtZWQHNpijf7V81E3IIdDI2xOx4xlNhX5q55X1+9GcKpYHebIhTMXECcCL2z/8oDyr
         kd0g==
X-Forwarded-Encrypted: i=1; AJvYcCVCxRa9Y1ttdiVw/tIJJ8Nbm7lfAKuTLfrHwtVWgwBaynPLYpHOO5oPJPMuTPNydLzmhqcGuvt5WMpWFmgOXA==@lists.infradead.org
X-Gm-Message-State: AOJu0Yz6auUe1jJ4CI7eT5S0pRxY/gmmx7eCBKtFrBZA4kTy1Bib84sP
	1BObqGeA36u8WvemUCRuPgZP0kV0UFbea36S9wMSzst+FmU1glBVf7dj6LrmYg==
X-Google-Smtp-Source: AGHT+IHzwKapyr5IrtSV/oQYAnR61TVG717Y8jfp24t1h7rKro/RA9ZWHLXInZS86oKuaEz5xT2XKQ==
X-Received: by 2002:a17:90a:a410:b0:2e2:ac13:6f7 with SMTP id 98e67ed59e1d1-2e2ac130994mr2132526a91.4.1728479141363;
        Wed, 09 Oct 2024 06:05:41 -0700 (PDT)
Received: from yuanhsinte-p620-1.tpe.corp.google.com ([2401:fa00:1:10:bfd7:eb4:8571:b3f4])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-7e9f6c4adeasm7234252a12.84.2024.10.09.06.05.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Oct 2024 06:05:40 -0700 (PDT)
From: Hsin-Te Yuan <yuanhsinte@chromium.org>
Date: Wed, 09 Oct 2024 21:05:37 +0800
Subject: [PATCH v4] arm64: dts: mt8183: set DMIC one-wire mode on Damu
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241009-damu-v4-1-789b71bd6526@chromium.org>
X-B4-Tracking: v=1; b=H4sIAKF/BmcC/12Oyw6CMBQFf4V07TV9qdSV/2FYlHJLu4CaFqqG8
 O8WFia6nOScySwkYfSYyLVaSMTskw9jAXmoiHF67BF8V5hwyiWjVEGnhxm0sNwKeaklVaRMHxG
 tf+2ae1PYxjDA5CLq75kqRiGMCE8fETIHBrxtJe1OWhhb34wrHz8PxxD7Tel8mkJ872FZbOK/h
 iyKgnElTY3sXHP1q2jWdf0AJXpdJd4AAAA=
X-Change-ID: 20241009-damu-a3f2f3478409
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Hsin-Yi Wang <hsinyi@chromium.org>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
 Hsin-Te Yuan <yuanhsinte@chromium.org>
X-Mailer: b4 0.15-dev-2a633
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241009_060542_755162_405BCEB9 
X-CRM114-Status: GOOD (  10.66  )
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

From: Hsin-Yi Wang <hsinyi@chromium.org>

Sets DMIC one-wire mode on Damu.

Fixes: cabc71b08eb5 ("arm64: dts: mt8183: Add kukui-jacuzzi-damu board")
Signed-off-by: Hsin-Yi Wang <hsinyi@chromium.org>
Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Signed-off-by: Hsin-Te Yuan <yuanhsinte@chromium.org>
---
Changes in v4:
- Add Reviewed-by tag back, which is dropped in v3
- Link to v3: https://lore.kernel.org/r/20241009-damu-v3-1-1294c8e16829@chromium.org

Changes in v3:
- Add missing Sign-off-by tag
- Link to v2: https://lore.kernel.org/r/20240910-one-wire-v2-1-2bb40d5a3cf8@chromium.org

Changes in v2:
- Add fixes tag 
- Link to v1: https://lore.kernel.org/r/20240910-one-wire-v1-1-d25486a6ba6d@chromium.org
---
 arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-damu.dts | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-damu.dts b/arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-damu.dts
index 0b45aee2e29953b6117b462034a00dff2596b9ff..06a689feff52945d141d196d439cba034f25fdf6 100644
--- a/arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-damu.dts
+++ b/arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-damu.dts
@@ -26,6 +26,10 @@ &touchscreen {
 	hid-descr-addr = <0x0001>;
 };
 
+&mt6358codec {
+	mediatek,dmic-mode = <1>; /* one-wire */
+};
+
 &qca_wifi {
 	qcom,ath10k-calibration-variant = "GO_DAMU";
 };

---
base-commit: 75b607fab38d149f232f01eae5e6392b394dd659
change-id: 20241009-damu-a3f2f3478409

Best regards,
-- 
Hsin-Te Yuan <yuanhsinte@chromium.org>


