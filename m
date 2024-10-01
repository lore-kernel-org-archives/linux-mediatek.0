Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 13371CE7D10
	for <linux-mediatek@archiver.kernel.org>; Tue,  1 Oct 2024 11:38:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:To:From:Reply-To:Content-Type:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=HExE/eexnESQrLRIjvabM8eZD3ePYvWvDq6AbBnCJhI=; b=vohkoHp+RWUWUK
	sbDizyRtM4gFHLEiF32lH0/uOG74xNLqXvffDSQokmrmaPBBsdrD9DAb7ALkfDBlpC7ho3fvzrdHx
	8EEaTkNsOjbpjoPv31UMJa9gglWV2hb9emRa0E/MVl3Qwr1DCmKTfCsxrDfjx4cs+3msI3XlEs8d3
	ABTEHzvuen8wED5PXGkQi5xggi3Ou/jL978al2aRzjOjAX92/Je4Cn7fbfDg1sz3qPZOkGThA4jQk
	k+R4RQj1mkW0//Gn9sx9wY+z9k6IBDQyN2GjxAUgZ+wjeAOuJ9YFV2ekOij6SxiECB1oTyjXxxzj6
	saz9JvjBYoxZNQZIRBPQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1svbDN-00000002YD1-2ROw;
	Tue, 01 Oct 2024 11:38:49 +0000
Received: from mail-pf1-x434.google.com ([2607:f8b0:4864:20::434])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1svb6C-00000002WIm-3YXR
	for linux-mediatek@lists.infradead.org;
	Tue, 01 Oct 2024 11:31:26 +0000
Received: by mail-pf1-x434.google.com with SMTP id d2e1a72fcca58-71b00a97734so4687805b3a.1
        for <linux-mediatek@lists.infradead.org>; Tue, 01 Oct 2024 04:31:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1727782284; x=1728387084; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=HExE/eexnESQrLRIjvabM8eZD3ePYvWvDq6AbBnCJhI=;
        b=H4SAEiobGxBVSGRi+gsIsYrMuTBlMfuf0qfMz03t2PHRv1OLPC5zo0GvKKkQYkyYRI
         ZjEBXSddUEg9AueW+EsIbTS0Mn5WFmCVrLl0TtqstkJEVxvFLpLzUbGux8vY9IBY1Jzm
         gTZdokymoVW0isbKzWyPYoxk9rIVgIxJB2Yts=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727782284; x=1728387084;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=HExE/eexnESQrLRIjvabM8eZD3ePYvWvDq6AbBnCJhI=;
        b=o6/Cw07Ov/Firq7KvjpfCDHPpX5XXcAp2fxWjI+5KzpTb3cK89WV0NwWhWKvSvUbvH
         uMVfp7eNf+je+dqAVVCMgjM91WaQGaImd/VKcjili2fikMILOGTIOzf9dxIH52Ikgp6t
         9chDB2eSqrfhTLlfSp7GhF3tOKvc1HOE1zXl1SsGMqqSyfRvLNn1dFuAR7UXSMDtll75
         eYou0w5rbmIyPzBGPQDx/3nsO/TJzRYO551L/dThoXaLskphxdaDwq+qylEPVISY5qwU
         qCBIiP+cbEaDxOCyrI3CpztLQdTpcfqrdHE1vrP1fOlfgj2WmFzo4WxuJgwEqrIyxE+V
         q17Q==
X-Forwarded-Encrypted: i=1; AJvYcCXoHARpQhZ361XEOMrfgp+u94BfXCD+9mzbHo10kCzxelYFmphII9pDHi9TThLah/cw4T8gL32Cgw/qBAZgwA==@lists.infradead.org
X-Gm-Message-State: AOJu0YxV+L5KQi36Zo1jVFWC1rTevxDYOj7R7ktwVwLgeuqIxjCBl0vk
	LA9sii7m2rS5qwwDAk7zBlzEwCQk42+/7wTaEs8uxAJoxYw/MR5W+wOJYft0nw==
X-Google-Smtp-Source: AGHT+IEKMhrohdkvwi4Udq7vmrZm1RN5zUB0skQ6nIN1r9c0R1TPgRRbL55DWTsl/CIJ8EZMUnlJMA==
X-Received: by 2002:a05:6a00:8c2:b0:710:bd4b:8b96 with SMTP id d2e1a72fcca58-71b26079af9mr22686021b3a.28.1727782283633;
        Tue, 01 Oct 2024 04:31:23 -0700 (PDT)
Received: from fshao-p620.tpe.corp.google.com ([2401:fa00:1:10:e044:f156:126b:d5c6])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-71b264b63d9sm7810646b3a.52.2024.10.01.04.31.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Oct 2024 04:31:23 -0700 (PDT)
From: Fei Shao <fshao@chromium.org>
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Subject: [PATCH v2 2/8] dt-bindings: PCI: mediatek-gen3: Allow exact number of clocks only
Date: Tue,  1 Oct 2024 19:27:20 +0800
Message-ID: <20241001113052.3124869-3-fshao@chromium.org>
X-Mailer: git-send-email 2.46.1.824.gd892dcdcdd-goog
In-Reply-To: <20241001113052.3124869-1-fshao@chromium.org>
References: <20241001113052.3124869-1-fshao@chromium.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241001_043124_916428_A18F9586 
X-CRM114-Status: GOOD (  11.89  )
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
Cc: =?UTF-8?q?Krzysztof=20Wilczy=C5=84ski?= <kw@linux.com>, Conor Dooley <conor+dt@kernel.org>, Ryder Lee <ryder.lee@mediatek.com>, linux-pci@vger.kernel.org, Lorenzo Pieralisi <lpieralisi@kernel.org>, linux-kernel@vger.kernel.org, Krzysztof Kozlowski <krzk@kernel.org>, Jianjun Wang <jianjun.wang@mediatek.com>, Matthias Brugger <matthias.bgg@gmail.com>, devicetree@vger.kernel.org, linux-mediatek@lists.infradead.org, Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>, Bjorn Helgaas <bhelgaas@google.com>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Lorenzo Bianconi <lorenzo@kernel.org>, Rob Herring <robh@kernel.org>, linux-arm-kernel@lists.infradead.org
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

In MediaTek PCIe gen3 bindings, "clocks" accepts a range of 1-6 clocks
across all SoCs. But in practice, each SoC requires a particular number
of clocks as defined in "clock-names", and the length of "clocks" and
"clock-names" can be inconsistent with current bindings.

For example:
- MT8188, MT8192 and MT8195 all require 6 clocks, while the bindings
  accept 4-6 clocks.
- MT7986 requires 4 clocks, while the bindings accept 4-6 clocks.

Update minItems and maxItems properties for individual SoCs as needed to
only accept the correct number of clocks.

Fixes: c6abd0eadec6 ("dt-bindings: PCI: mediatek-gen3: Add support for Airoha EN7581")
Reviewed-by: Krzysztof Kozlowski <krzk@kernel.org>
Signed-off-by: Fei Shao <fshao@chromium.org>
---

(no changes since v1)

 .../devicetree/bindings/pci/mediatek-pcie-gen3.yaml          | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/Documentation/devicetree/bindings/pci/mediatek-pcie-gen3.yaml b/Documentation/devicetree/bindings/pci/mediatek-pcie-gen3.yaml
index 898c1be2d6a4..f05aab2b1add 100644
--- a/Documentation/devicetree/bindings/pci/mediatek-pcie-gen3.yaml
+++ b/Documentation/devicetree/bindings/pci/mediatek-pcie-gen3.yaml
@@ -149,7 +149,7 @@ allOf:
     then:
       properties:
         clocks:
-          minItems: 4
+          minItems: 6
 
         clock-names:
           items:
@@ -178,7 +178,7 @@ allOf:
     then:
       properties:
         clocks:
-          minItems: 4
+          minItems: 6
 
         clock-names:
           items:
@@ -207,6 +207,7 @@ allOf:
       properties:
         clocks:
           minItems: 4
+          maxItems: 4
 
         clock-names:
           items:
-- 
2.46.1.824.gd892dcdcdd-goog


