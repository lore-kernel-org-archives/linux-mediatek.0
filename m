Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 84F49C07CA9
	for <linux-mediatek@archiver.kernel.org>; Sun, 26 Nov 2023 01:54:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:To:
	From:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=qMmCWPX59UJtqG86RQS8Ot62rGrmo3eqFy3GB/yFnLs=; b=NIi/W7IMPTkAP1m+/XOWIW/Nyq
	I9lu+Mw1pwajBRCFTsaG/fllfaoot99dgY6All50vIDIBNr5OYQ5y9J2+0kVWD+q1yNitBIfQoFbW
	bc5QNRuDtljkeOLD+ZFi4HQ0hb2l+QDrF2NMJdUVuWFftTtr9J8dIhVQzHXuCoe/d7c2LjU0UW+NT
	byaVudZINkIX3q/KTlg4SiXl4kyY1JKXBLcNA9bSSWlAhDlVGGO9Pv/GIiq7Wt79uyMbP/qmappcV
	iB7bEowN/qARUMmYOZ3538z4LrZZ6BjhO5x+X57d/DgmyLMR1ipRK2DWa5Blx8K7omUz/y0aFLkxk
	FJswsWCA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r74Lc-00A4jC-19;
	Sun, 26 Nov 2023 01:54:12 +0000
Received: from mail-wm1-x32a.google.com ([2a00:1450:4864:20::32a])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1r74LQ-00A4ae-2k;
	Sun, 26 Nov 2023 01:54:02 +0000
Received: by mail-wm1-x32a.google.com with SMTP id 5b1f17b1804b1-40b2ad4953cso22873255e9.0;
        Sat, 25 Nov 2023 17:54:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1700963639; x=1701568439; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=qMmCWPX59UJtqG86RQS8Ot62rGrmo3eqFy3GB/yFnLs=;
        b=ZIATQpojNpfsD96wrKbBKqhMfmVB6wv4sSOnvEoyc6v2YmdxwC3RtP/2gsENcwYZSr
         Hw9z6pv0dsSvvEHhgdTSkNOyFLYDxSRTXe5ikFG7zT9O2msVvYZkWt+Ydm9sQxmow5ex
         1hsj1Isajfs5x1xR9Lh1NrT0vQvOaEXNMGehJZ7RLDUkyz7MNyDcEzjU21WrA+k4GKrB
         he1zRjyjW8tExjN4Pt3nAliTK5+lWuUcdzELKO03sNglYeRuaxhqN2cG+DxkMWzw/f7o
         XFYMvxIBmQFVozEFnULYXsr4V3snXTfA90IDhouCAnACXuovdI73XVUXBFW4qnWUGTBc
         9rRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700963639; x=1701568439;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=qMmCWPX59UJtqG86RQS8Ot62rGrmo3eqFy3GB/yFnLs=;
        b=JRNinudTr9ZEdDDaz8XFIZKGp4pTzuSlkNi2omS5smY2QbGl1nsPO8Rn8pEd3aLGUc
         yY3PrrrRuJJvTWVcVbZgy/+2xMED558JN/zFmbBEmOhuokG2HkxunXMrQsIMH6LwLRbf
         KIGWtNU11FO8fFcz6YaPyZ5PFvQTdQhWR07WKsON6mnWPlD43BCuxKGi5f9Ohvn/jz1G
         KxsRWAwMOG1aybG4+PQHkxbMmzFF7whXCC+2kuywdG5vAcA90nHKdIoKewq2KOyTX4CP
         IE934MSv1TtUu1uFxv/vWArx7vRW6jn1I8pbNEVbnl8K1aCj9y/440U2L1piSusI4Qh8
         q2Ag==
X-Gm-Message-State: AOJu0Ywwss/+gqIFFi4+XEDwJg/aSmuR4WEMQ+C5sVo0i/HT3m7R3A/K
	Jljs1bydELQzXhUNazUPsfs=
X-Google-Smtp-Source: AGHT+IG1ceziC/+z97gXuY0UcTtf4RtdValQD8/J9dsJkOT+P4ZAnEAQamQO6FPuVGCiIDUiL9zX0A==
X-Received: by 2002:a05:600c:1d03:b0:40b:3e26:8733 with SMTP id l3-20020a05600c1d0300b0040b3e268733mr3829685wms.0.1700963639298;
        Sat, 25 Nov 2023 17:53:59 -0800 (PST)
Received: from localhost.localdomain (93-34-89-13.ip49.fastwebnet.it. [93.34.89.13])
        by smtp.googlemail.com with ESMTPSA id p34-20020a05600c1da200b00406408dc788sm9875344wms.44.2023.11.25.17.53.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 25 Nov 2023 17:53:59 -0800 (PST)
From: Christian Marangi <ansuelsmth@gmail.com>
To: "David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Andy Gross <agross@kernel.org>,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konrad.dybcio@linaro.org>,
	Andrew Lunn <andrew@lunn.ch>,
	Heiner Kallweit <hkallweit1@gmail.com>,
	Russell King <linux@armlinux.org.uk>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Christian Marangi <ansuelsmth@gmail.com>,
	Robert Marko <robert.marko@sartura.hr>,
	netdev@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-msm@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Subject: [net-next PATCH RFC v3 5/8] dt-bindings: net: add QCA807x PHY defines
Date: Sun, 26 Nov 2023 02:53:43 +0100
Message-Id: <20231126015346.25208-6-ansuelsmth@gmail.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20231126015346.25208-1-ansuelsmth@gmail.com>
References: <20231126015346.25208-1-ansuelsmth@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231125_175400_894283_0F67AA44 
X-CRM114-Status: GOOD (  14.52  )
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

From: Robert Marko <robert.marko@sartura.hr>

Add DT bindings defined for Qualcomm QCA807x PHY series related to
calibration and DAC settings.

Signed-off-by: Robert Marko <robert.marko@sartura.hr>
Signed-off-by: Christian Marangi <ansuelsmth@gmail.com>
---
 include/dt-bindings/net/qcom-qca807x.h | 30 ++++++++++++++++++++++++++
 1 file changed, 30 insertions(+)
 create mode 100644 include/dt-bindings/net/qcom-qca807x.h

diff --git a/include/dt-bindings/net/qcom-qca807x.h b/include/dt-bindings/net/qcom-qca807x.h
new file mode 100644
index 000000000000..e7d4d09b7dd4
--- /dev/null
+++ b/include/dt-bindings/net/qcom-qca807x.h
@@ -0,0 +1,30 @@
+/* SPDX-License-Identifier: GPL-2.0-only OR MIT */
+/*
+ * Device Tree constants for the Qualcomm QCA807X PHYs
+ */
+
+#ifndef _DT_BINDINGS_QCOM_QCA807X_H
+#define _DT_BINDINGS_QCOM_QCA807X_H
+
+/* Full amplitude, full bias current */
+#define QCA807X_CONTROL_DAC_FULL_VOLT_BIAS		0
+/* Amplitude follow DSP (amplitude is adjusted based on cable length), half bias current */
+#define QCA807X_CONTROL_DAC_DSP_VOLT_HALF_BIAS		1
+/* Full amplitude, bias current follow DSP (bias current is adjusted based on cable length) */
+#define QCA807X_CONTROL_DAC_FULL_VOLT_DSP_BIAS		2
+/* Both amplitude and bias current follow DSP */
+#define QCA807X_CONTROL_DAC_DSP_VOLT_BIAS		3
+/* Full amplitude, half bias current */
+#define QCA807X_CONTROL_DAC_FULL_VOLT_HALF_BIAS		4
+/* Amplitude follow DSP setting; 1/4 bias current when cable<10m,
+ * otherwise half bias current
+ */
+#define QCA807X_CONTROL_DAC_DSP_VOLT_QUARTER_BIAS	5
+/* Full amplitude; same bias current setting with “010” and “011”,
+ * but half more bias is reduced when cable <10m
+ */
+#define QCA807X_CONTROL_DAC_FULL_VOLT_HALF_BIAS_SHORT	6
+/* Amplitude follow DSP; same bias current setting with “110”, default value */
+#define QCA807X_CONTROL_DAC_DSP_VOLT_HALF_BIAS_SHORT	7
+
+#endif
-- 
2.40.1


