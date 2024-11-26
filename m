Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 560E9D3B7CA
	for <linux-mediatek@archiver.kernel.org>; Tue, 26 Nov 2024 09:58:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:Message-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=/Mk54wWOTxtnUjWD4fc+DJyfim3lSux+/TbFhyd5wc4=; b=TIFBHic8u7jkSDAF265oZyv/bn
	RQihFnHVqb7xPXbU7zWvZwv0jrcaUe5xjUc4Qzk9JoUvV0hM/HytUm+tuU2OKO11/V6IbkaAaIAFp
	F3+dwWi54k9Ep//y8l/eeCDcUgj5ZxDtZuqsLQRG2EVKfQ4kF0fkQGjj3WwZk7SXhhj34AfFnkCRr
	knZbFr5CyVCuZzHNIOgbsqNz80Fholi6gM8KA9TjNlt7fQhCpDSJh6KfLXYLXvGEXNYU59rvVZRzj
	9ZsNH5Qg8Ygxe1fkAVDaimOGfX/rEUpbdIIFmxUiTinp8np3kDK9RXWMkF4WHgm/KWEKEuBomiQIq
	l2/b9Vhg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tFsLJ-0000000AEg0-221o;
	Tue, 26 Nov 2024 09:58:49 +0000
Received: from mail-pl1-x62e.google.com ([2607:f8b0:4864:20::62e])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tFsKH-0000000AESS-3CSo
	for linux-mediatek@lists.infradead.org;
	Tue, 26 Nov 2024 09:57:47 +0000
Received: by mail-pl1-x62e.google.com with SMTP id d9443c01a7336-21290973bcbso51838295ad.3
        for <linux-mediatek@lists.infradead.org>; Tue, 26 Nov 2024 01:57:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1732615064; x=1733219864; darn=lists.infradead.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=/Mk54wWOTxtnUjWD4fc+DJyfim3lSux+/TbFhyd5wc4=;
        b=VMtaxMF7mNlmyyNZuwUj4yDBS/dLP/j9YO6tnbBoTx6I4INjjaSxLN8M8pWoolWzrR
         W6oukLXINElx08sBa1xWVhxZ5QNAxPv4VWZUvWjqLtHsS4EeI+4QHt4Ca5pJ8uMvMCYU
         9OLEhcN2W9D35uCiB/lA9a+6fk5IoqNcwUIUA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732615064; x=1733219864;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=/Mk54wWOTxtnUjWD4fc+DJyfim3lSux+/TbFhyd5wc4=;
        b=h7JDihDycccKcCozpNrUYqLXTtdW8yq80YYepBBH+1bYoO1rqIDNrwAgh9Uj6lacIs
         NNcGUT3yEz1u2v6AjUJRB+5SjaKzbbnXPwlFqX95N03sjMwL8iAr3R+9/Ny4DlBRD0SC
         YnICLvds+eLjdVmRiu+oVdjdYprtnVE4MjxiUZgOqOoTXr/EHCuxBlrxYorb9WhbBLn0
         Ca4xBFtexSmcAvmQtwTubYkm9paiwUz5OBlfGggfigraDMu61yK8jc9ZmQhZeJ9tS/vU
         jIoICL9Acp+47gmVgX17r8WxBxh0i2vxlkYbXwi1hqOXfsJ7OH5Ol34rriBUdTRAnyAY
         Gyhg==
X-Forwarded-Encrypted: i=1; AJvYcCX8SN4faJGM4n9cfglxcWX6Krot70zYQAH/6PyMa7aqGB8RY9oYSckWn86l5pVTQgS0qJNFIEiWgkJsB1fMiA==@lists.infradead.org
X-Gm-Message-State: AOJu0YxhsA7y4kil6qYrvWS69CapjqJEiD++o5PvFjnS7fTRTX9wHneW
	enEngxGCfpU4ck6XX3vUDE5ObG9x4daKTaZ2B/P4KQnRJBtm9/ClZlsCp3JQmWFEThWcoVhGD2R
	Lpw==
X-Gm-Gg: ASbGncuQPi8cQVhMufrRWfcWkfFtnSAUlsu1UsZrKXRioM1yBJiaAZVqvHTylKymNk3
	P7hs9E5gw5tr6e6010pkHi3diGKznzdn+ph1UQEKb1rcoBi7bkI2/GLf0b+RbuQCWw4I8PbbjiR
	eJRgOsnXzRin0E/Eg9HzAgvgoQH/oLHDjhsMqVAc+vSYFaPj+ChIaSRP4tZJn4jTDiOcY/QO12t
	LU4SAILOAm0GzkDb7dMQwijKlkunaeWM7QE6uqK1MZM2U29UsIZeZzN2cPJh/PII3jhokLDlpVP
	hH7XCzcDMg==
X-Google-Smtp-Source: AGHT+IFSDVH3rH4UFp5xBcT+SP0jqNRzEoGUEI6ov6sZL9QTnujK3nAAwyk2B7XeTcH6vPgj3iPXZg==
X-Received: by 2002:a17:903:228d:b0:211:f335:aba with SMTP id d9443c01a7336-2129f5790edmr273271445ad.31.1732615064355;
        Tue, 26 Nov 2024 01:57:44 -0800 (PST)
Received: from yuanhsinte-p620-1.tpe.corp.google.com ([2401:fa00:1:10:a3c8:df68:1f94:539c])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2129db890b7sm80908485ad.9.2024.11.26.01.57.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 26 Nov 2024 01:57:43 -0800 (PST)
From: Hsin-Te Yuan <yuanhsinte@chromium.org>
Date: Tue, 26 Nov 2024 17:57:40 +0800
Subject: [PATCH RESEND v4] arm64: dts: mt8183: set DMIC one-wire mode on
 Damu
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241126-damu-v4-1-e746eec2cb52@chromium.org>
X-B4-Tracking: v=1; b=H4sIAJObRWcC/72PMW/DIBSE/0rEXCoeYAyZMjRrh3asMoB5xAw2E
 U5oosj/vcRD1ahZunS8p7vv3V3JhDniRNarK8lY4hTTWIV8WpGut+MeafRVE864BMYM9XY4USs
 CD0K2WjJDqvWQMcTzgvkgb9v37esL2dV7yGmgxz6j/YYwA4ymEelnzEgLp0C5c5L5xoou6E3X1
 0w8Dc8p72/oPk7HlC9LwSKWB/ddiqgI4EZ2GkFpbu4RtxpFPsrJmmu1cS04rxqufr3+Fz+A+OF
 XBsApo4B5/2BH8/cdu3mevwCVSffi5gEAAA==
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
X-CRM114-CacheID: sfid-20241126_015745_792306_CD3D596E 
X-CRM114-Status: GOOD (  10.47  )
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
Reviewed-by: Matthias Brugger <matthias.bgg@gmail.com>
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
index 65860b33c01fe832f3a4b2e21d24ea6b4f0cba2b..3935d83a047e0827b6feddceb3e4dcb4fc3407cc 100644
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
base-commit: 7eef7e306d3c40a0c5b9ff6adc9b273cc894dbd5
change-id: 20241009-damu-a3f2f3478409

Best regards,
-- 
Hsin-Te Yuan <yuanhsinte@chromium.org>


