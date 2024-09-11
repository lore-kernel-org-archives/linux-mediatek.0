Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 91F83EE4991
	for <linux-mediatek@archiver.kernel.org>; Wed, 11 Sep 2024 11:06:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:To:From:Reply-To:Content-Type:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=3HQV01fo8Eazmoun9faxS0xRrGLPbJrswKSNOP5sQk0=; b=DppvMVYTX+S2CV
	IqY8bS82j1b4nMu4Lhsf2qgsCSaF14D4P8OsQtvD8BqvsZGgU6rC3qJCH+6gHv9XvUqYS+6b4Jss+
	Exi1guPwedbvFRrJocuoOEr4rV2MlnwzPrUZvmhfj95golCck+tUR4vWADMZ4OJPW4Dgx8bUH81wj
	avUDs4Lbuf5LghSiizQA3SgukXbcGBFgNVyy7Tzhr+gs51TTTftHUCiZJ84B60KLkxZd4ECPhlbi4
	QhCkugJLCen7uEfHJUZnVWqwgWQvLF6OMWgD4zbIyHj1+yp4lxu1LZhsNH8Zuz3S5UW4vCeIh3skD
	6LfuLcs7IMbVmQLOQOYQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1soLBJ-00000009E3u-1KpZ;
	Wed, 11 Sep 2024 11:06:41 +0000
Received: from mail-pg1-x529.google.com ([2607:f8b0:4864:20::529])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1soKxP-00000009Ay0-3AOV
	for linux-mediatek@lists.infradead.org;
	Wed, 11 Sep 2024 10:52:21 +0000
Received: by mail-pg1-x529.google.com with SMTP id 41be03b00d2f7-7db12af2f31so386706a12.1
        for <linux-mediatek@lists.infradead.org>; Wed, 11 Sep 2024 03:52:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1726051939; x=1726656739; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3HQV01fo8Eazmoun9faxS0xRrGLPbJrswKSNOP5sQk0=;
        b=Af1fARgKBTR7H9ioeLobg4hFW84QU18a78+TJKTUmlraZnzDVHr1Q8OQW3KjU/Rv/l
         QHbRtZ0yuotwg7kbng/oUtJjzmUlpNJJ7LrEnRbiXMXnREWZHQpNmtr06xZimm5tJSX3
         /Xb1GMvwsrsGBeaFlNz8t1R81mP4qxpfWG9hQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1726051939; x=1726656739;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=3HQV01fo8Eazmoun9faxS0xRrGLPbJrswKSNOP5sQk0=;
        b=Btq6H/e0YAaeJ+YTBu/1y9KtzOpFPLTkOEuQxjyviz2B9OOhnBqcdhBk4ie9Hzp23l
         bSu9k7eNq+rV09rmSXE7sJYgRAY3c5ugF+fJwynWLslVnnxJd85a4f2R+e8Zinsm/a+F
         ed6l7imS9iCDmlv/2hsmw0Iv1jmHl9gM/dym0gLa9lamQ69Fin1ochPCOCzgSQoPo97w
         i+QrstmIOaUlKbFkc1PQ8blYlXDBY1mwW4ur+1JjfLNXs7OWp2z/nbQDyryFRn7u1FHX
         AsCRhzYR+m8o/x9kA8D9K7M547St/XmiQf3W1DpkJ8lBLOxi/Hdj8DA8K6Iz+d+drS0F
         XzqA==
X-Forwarded-Encrypted: i=1; AJvYcCVnN8dIhHrLHXzryTQcW7NJYBlDABh3F38klCjWzqQsNRZ5sY476cQrYCXHjdX9Oy7w7s2cdCkE+G3y8Ld/LA==@lists.infradead.org
X-Gm-Message-State: AOJu0YyJOH6dpRIsiKG6lyXCBBuTjMH9FPNWHjl0Q5BEHp0tNbhDdSv3
	wkES1N9ncC+B955EzfEZwM9JoNtF84L+bbd6ZI+vK0wLtzikvIrt7rF7qICXAA==
X-Google-Smtp-Source: AGHT+IGpIHc7bP/F9Qr9SpWnaJJbLZcEiPMmrVxSgqEtW06qM8RmvMPVCseAMDYizvq7I6rvYfbmIQ==
X-Received: by 2002:a05:6a20:c703:b0:1cf:2357:df1a with SMTP id adf61e73a8af0-1cf62c8d808mr4373257637.10.1726051938654;
        Wed, 11 Sep 2024 03:52:18 -0700 (PDT)
Received: from fshao-p620.tpe.corp.google.com ([2401:fa00:1:10:102f:d738:6069:fd4b])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-7d8242b3d13sm7147352a12.52.2024.09.11.03.52.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Sep 2024 03:52:18 -0700 (PDT)
From: Fei Shao <fshao@chromium.org>
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Matthias Brugger <matthias.bgg@gmail.com>
Subject: [PATCH v2 6/8] arm64: dts: mediatek: mt8188: Add SPMI support for PMIC control
Date: Wed, 11 Sep 2024 18:51:11 +0800
Message-ID: <20240911105131.4094027-7-fshao@chromium.org>
X-Mailer: git-send-email 2.46.0.598.g6f2099f65c-goog
In-Reply-To: <20240911105131.4094027-1-fshao@chromium.org>
References: <20240911105131.4094027-1-fshao@chromium.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240911_035219_819895_0D2715D1 
X-CRM114-Status: UNSURE (   8.92  )
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
Cc: Rob Herring <robh@kernel.org>, Conor Dooley <conor+dt@kernel.org>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org, Krzysztof Kozlowski <krzk+dt@kernel.org>, linux-arm-kernel@lists.infradead.org
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Add SPMI node for PMIC control on MT8188 SoC.

Signed-off-by: Fei Shao <fshao@chromium.org>
---

(no changes since v1)

 arch/arm64/boot/dts/mediatek/mt8188.dtsi | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/arch/arm64/boot/dts/mediatek/mt8188.dtsi b/arch/arm64/boot/dts/mediatek/mt8188.dtsi
index 61530f8c5599..32e5b7108f6a 100644
--- a/arch/arm64/boot/dts/mediatek/mt8188.dtsi
+++ b/arch/arm64/boot/dts/mediatek/mt8188.dtsi
@@ -1306,6 +1306,18 @@ pwrap: pwrap@10024000 {
 			clock-names = "spi", "wrap";
 		};
 
+		spmi: spmi@10027000 {
+			compatible = "mediatek,mt8188-spmi", "mediatek,mt8195-spmi";
+			reg = <0 0x10027000 0 0x000e00>, <0 0x10029000 0 0x000100>;
+			reg-names = "pmif", "spmimst";
+			assigned-clocks = <&topckgen CLK_TOP_SPMI_M_MST>;
+			assigned-clock-parents = <&topckgen CLK_TOP_ULPOSC1_D10>;
+			clocks = <&infracfg_ao CLK_INFRA_AO_PMIC_AP>,
+				 <&infracfg_ao CLK_INFRA_AO_PMIC_TMR>,
+				 <&topckgen CLK_TOP_SPMI_M_MST>;
+			clock-names = "pmif_sys_ck", "pmif_tmr_ck", "spmimst_clk_mux";
+		};
+
 		infra_iommu: iommu@10315000 {
 			compatible = "mediatek,mt8188-iommu-infra";
 			reg = <0 0x10315000 0 0x1000>;
-- 
2.46.0.598.g6f2099f65c-goog


