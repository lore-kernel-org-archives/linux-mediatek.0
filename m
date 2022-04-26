Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 57F42C433F5
	for <linux-mediatek@archiver.kernel.org>; Tue, 26 Apr 2022 13:58:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=dn45g7c5OTfrkcXFV4GoIcwOfzpj6gQp62MivoCLrBc=; b=piFyu8i637ibI7
	9vttoZ3cCM2rVD84jt+a29KS6egaJUMiQTlgTE8Neqtzyr8H2VOZIAMF1uZrDsW2PA1RBB+7GsdqR
	UZ+DQ4TJp+cqFpfaXCCX1jO/kPLlOh1eI51kJxueiAmzPbmEDUkhk845/9Otx9s/asqFe5qzn5aBL
	xSH+1xPAeW+w4pEIDlAnZR6y8/nphcoobSM4XSCasmZmYfEZS/kFQM9aoUlQvFd1HNO9UIvh17Bmn
	Q/JwhiAowfjiCYrGHbC/Z3hjGDgB/8q1hodFBkBYeopjym9M6n0uIuEM3kwcrnflLC+Ht7BBY+tCd
	J+5UY0zTgtuALNClnSpw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1njLhs-00EoJ4-Lz; Tue, 26 Apr 2022 13:58:20 +0000
Received: from mail-wr1-x42a.google.com ([2a00:1450:4864:20::42a])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1njLdL-00Em2W-EK
 for linux-mediatek@lists.infradead.org; Tue, 26 Apr 2022 13:53:44 +0000
Received: by mail-wr1-x42a.google.com with SMTP id w4so25535795wrg.12
 for <linux-mediatek@lists.infradead.org>; Tue, 26 Apr 2022 06:53:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20210112.gappssmtp.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=6PPGdjzLBRfmjyoYZPbtheYxkUOxVcg2XjuwyGNEy84=;
 b=HYqHeXHh2jVFDzdmAAsOgALRoHWL3lylNXPL38qJKWgAhYHnpOcKvTgqc0S8MKTa1D
 KmiiqFzIT5/QBQVrAK+sjKMobtjDgyeim9RfZOHg46y/OlCh3osuBTszhmtAka/UQ2Gi
 /heJA9jcE+HxOs5yED5UC9WG32WsOgl11Ujh3pc/eLL+H2JU4Ky5ypWEEKOyEGqy1WKW
 Wj1m8C/Dyutxj3dogPfQlPCsD462xfyBYhPV7Z2sCQiO2hAFYEV1xQYsfGpr5NNQuJKx
 EJPIZnu1GBhAPjARnX3ityHRgQAeGIovnvXJlQxpSyJ0g3U0cSCeEq970+ij1X+3SB+0
 5eWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=6PPGdjzLBRfmjyoYZPbtheYxkUOxVcg2XjuwyGNEy84=;
 b=T0PDOL4p/2XLFmShqAtDTjoMFGyLaqYQ/pWhq0TXQ1t+YSb9fPzwgEgj1Ta6NIsAzu
 gGgOZEvHTq+Vd+y0/TYtjI57KG6kLWRmXoqNrm2YKRZpHwInWfjqRnM67tbiZCs3+AL9
 VRZtXn6nPZjLOwzfwV+gEsxdQRH1PM3xp+Wo/YaEzAp1IrRcft9/Qi2lx6Agl2t6o0Ks
 bq8vrzk2MdqlSh1Z4dLv1klS4K8w74aFGJVoPQDHrrZwco3HgvCaFkErG8MFzWG/2dSH
 GuOgcGqliFxrpyqHPyGgksDDW1Op9CELuZI+Y6rVMZRTc9ISFdNwiWim2txW47VpvBIH
 ol4Q==
X-Gm-Message-State: AOAM530asTTOB5PPreX3uFcBhdIoXVDKahvAcYgmFYlOmrUwIOI1qCnc
 gvlblcHJ6z3hpMDeM437nFNSLg==
X-Google-Smtp-Source: ABdhPJxv5zp1uTq4FHJtwaeINExGGDRpzDODK6frUqUyafJ3hBir6qwv2I4zIElowuN410a68r3QwA==
X-Received: by 2002:adf:ef46:0:b0:20a:e153:1f4e with SMTP id
 c6-20020adfef46000000b0020ae1531f4emr4710059wrp.352.1650981217679; 
 Tue, 26 Apr 2022 06:53:37 -0700 (PDT)
Received: from localhost.localdomain ([88.160.162.107])
 by smtp.gmail.com with ESMTPSA id
 m35-20020a05600c3b2300b00393ebe201a6sm5504775wms.44.2022.04.26.06.53.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 26 Apr 2022 06:53:37 -0700 (PDT)
From: Fabien Parent <fparent@baylibre.com>
To: Rob Herring <robh+dt@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Matthias Brugger <matthias.bgg@gmail.com>
Cc: Fabien Parent <fparent@baylibre.com>, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 linux-kernel@vger.kernel.org
Subject: [PATCH v2 7/8] arm64: dts: mediatek: mt6359: add node for PMIC keys
 support
Date: Tue, 26 Apr 2022 15:53:12 +0200
Message-Id: <20220426135313.245466-8-fparent@baylibre.com>
X-Mailer: git-send-email 2.36.0
In-Reply-To: <20220426135313.245466-1-fparent@baylibre.com>
References: <20220426135313.245466-1-fparent@baylibre.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220426_065339_669479_DC29ADF8 
X-CRM114-Status: GOOD (  10.42  )
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

Add node for the MT6359 PMIC keyboard in mt6359.dtsi.

Signed-off-by: Fabien Parent <fparent@baylibre.com>
---
v2: remove key definitions from dtsi

 arch/arm64/boot/dts/mediatek/mt6359.dtsi | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/arch/arm64/boot/dts/mediatek/mt6359.dtsi b/arch/arm64/boot/dts/mediatek/mt6359.dtsi
index df3e822232d3..c09cbd8e81ce 100644
--- a/arch/arm64/boot/dts/mediatek/mt6359.dtsi
+++ b/arch/arm64/boot/dts/mediatek/mt6359.dtsi
@@ -294,5 +294,9 @@ mt6359_vsram_others_sshub_ldo: ldo_vsram_others_sshub {
 		mt6359rtc: mt6359rtc {
 			compatible = "mediatek,mt6358-rtc";
 		};
+
+		mt6359keys: keyboard {
+			compatible = "mediatek,mt6359-keys";
+		};
 	};
 };
-- 
2.36.0


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
