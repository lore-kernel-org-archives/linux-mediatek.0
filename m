Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0AB72CD1292
	for <linux-mediatek@archiver.kernel.org>; Sun,  7 Apr 2024 10:20:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=11Tiq4ypNUErXvEpc5K8WLl8hiInc4dHhElWuTzssUM=; b=RkLm7pVKvxj5xBXe/sDuVYLPEP
	Tkhv/zOAYQ5XPEryx0hsgiZwKpvm7lI0jM3OoeP0tgHqlFC6rwjpbXVt1AU4QDkTgQMw8wO5fwCKG
	TJMHHEvbhphf/u4vraxvjhl8Ska1jUDvkOvXNW9CDpK8mdNLC+KMkgeO54DEfSKH7EsvFJ9K2Ytyy
	PTwLKp5KtQqzVbxBYhNQr8pUwk569CSPIb8iB5hCuUK90wYX8BzDQle6GXkKM8L6MDTlYmwFTpqAL
	jgMpfDDdrBs83V5RH85ArTjoxVcTbT2+WhqM2EuEgxgyQt4rMcqe0IHaPmhCRzKBOaNdvk6b2MROn
	o8uCbUxQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rtPdK-0000000CK8u-1oQn;
	Sun, 07 Apr 2024 10:20:18 +0000
Received: from mail-wm1-x334.google.com ([2a00:1450:4864:20::334])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rtPdE-0000000CK4Z-1R9G
	for linux-mediatek@lists.infradead.org;
	Sun, 07 Apr 2024 10:20:15 +0000
Received: by mail-wm1-x334.google.com with SMTP id 5b1f17b1804b1-415523d9824so35794335e9.3
        for <linux-mediatek@lists.infradead.org>; Sun, 07 Apr 2024 03:20:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1712485207; x=1713090007; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=11Tiq4ypNUErXvEpc5K8WLl8hiInc4dHhElWuTzssUM=;
        b=MZuuVA3tO0E+7OUvW8N94M8gyU8fE3bLN9ST0ydYNxCAH09CrzniAikPv0+O8v3n8M
         ka7htMACnAXXx5SiUeV2Rjb3yNnpeT9/qOWgl5G64YIMTKxfpHPIOFNYLE9NjI/X8QlW
         cXu9EVFKRF/cH9a13tBiE9zOl7Twh2bI9++EounysL2tsVCD5cjDvH1E0/cERhupbbXV
         4iMdlGs6+ORw4HA7e3Q0dJGGNbUPnL9VE4n7ix6/QQeD8CTa0RQFt1tUoQP5jr2XTl0M
         jms5HG4mFU6344kxr7E6BLZxXJ9TZQhrxInxF0QBjEe8QpnDzTOcoBSo7RP8k+8q56Vo
         /e/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712485207; x=1713090007;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=11Tiq4ypNUErXvEpc5K8WLl8hiInc4dHhElWuTzssUM=;
        b=MvI/r2qgjppjKh4v8iWjF2hchWNz5ZJogO+8io5Ii8826wKU8qfzj1/G5/4rknIq6k
         c42kAYN12dNnRK+j4Dvm8hwAkYT5ricsTNUqkO5XfgkyNdiewuNQgec4E+u+hn2JuRUw
         eje9e3FJUG+pEa6d/gWr6412/6y5DCUqc24IgV5o8dcHNYPGpXjMFAW62Da/N4+Mxt8N
         M7ML4+qqDkLe4SbQZsVvnbFwrhK47fn48Db8wgJ7kccDcqttY2o0+H7FLR/Tb0iQ+GyS
         v7CxfJps47pOz55tfLacPGkLTDP9gz9tvkmQXuyJBxQwQr9G07Xc/Ld0PBoKmyvifIrJ
         tEFg==
X-Forwarded-Encrypted: i=1; AJvYcCXsKvIEVNH3hYqz9zVYEfIgvMIdoGip0aPdhhUr1ncIX3klcp0Rx/dQLUMB8JvLcWxxZ4wwFDJ7Xee2Tm/xJKH/Z67beGQrJ4iegeAM2+nv18Nq
X-Gm-Message-State: AOJu0YwWPdJ/+xCRbCEDVa2+A7FK3AI7pDSmMpGahkvxmu0Nc2JG8N6O
	j5GIbgrt3VakNeFn6vPzlmzC+rZLXRH75vWgNgQVRm/gGeWZeqJStso2xBlcUJs=
X-Google-Smtp-Source: AGHT+IFIU1jOBpcjYd9g1ytjU4Sh0w9UXvYPRaXVoXA0dFkiv+NuQmTaiBxAo39r6aQx6O2BMQCGZw==
X-Received: by 2002:a05:600c:c0e:b0:416:5327:ced with SMTP id fm14-20020a05600c0c0e00b0041653270cedmr1409027wmb.33.1712485207320;
        Sun, 07 Apr 2024 03:20:07 -0700 (PDT)
Received: from krzk-bin.. ([178.197.223.16])
        by smtp.gmail.com with ESMTPSA id f5-20020a5d58e5000000b0033ec9ddc638sm6354395wrd.31.2024.04.07.03.20.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 07 Apr 2024 03:20:06 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Bjorn Helgaas <bhelgaas@google.com>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	=?UTF-8?q?Krzysztof=20Wilczy=C5=84ski?= <kw@linux.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Hector Martin <marcan@marcan.st>,
	Sven Peter <sven@svenpeter.dev>,
	Alyssa Rosenzweig <alyssa@rosenzweig.io>,
	Ray Jui <rjui@broadcom.com>,
	Scott Branden <sbranden@broadcom.com>,
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
	Jim Quinlan <jim2101024@gmail.com>,
	Nicolas Saenz Julienne <nsaenz@kernel.org>,
	Florian Fainelli <florian.fainelli@broadcom.com>,
	Will Deacon <will@kernel.org>,
	Linus Walleij <linus.walleij@linaro.org>,
	Srikanth Thokala <srikanth.thokala@intel.com>,
	Ryder Lee <ryder.lee@mediatek.com>,
	Jianjun Wang <jianjun.wang@mediatek.com>,
	Sergio Paracuellos <sergio.paracuellos@gmail.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Daire McNamara <daire.mcnamara@microchip.com>,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konrad.dybcio@linaro.org>,
	Marek Vasut <marek.vasut+renesas@gmail.com>,
	Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
	Shawn Lin <shawn.lin@rock-chips.com>,
	Heiko Stuebner <heiko@sntech.de>,
	Jingoo Han <jingoohan1@gmail.com>,
	Gustavo Pimentel <gustavo.pimentel@synopsys.com>,
	Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
	Bharat Kumar Gogada <bharat.kumar.gogada@amd.com>,
	Michal Simek <michal.simek@amd.com>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Mark Kettenis <kettenis@openbsd.org>,
	Tom Joseph <tjoseph@cadence.com>,
	Ahmad Zainie <wan.ahmad.zainie.wan.mohamad@intel.com>,
	Jiaxun Yang <jiaxun.yang@flygoat.com>,
	Kishon Vijay Abraham I <kishon@kernel.org>,
	Thippeswamy Havalige <thippeswamy.havalige@amd.com>,
	linux-pci@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	asahi@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-rpi-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	linux-arm-msm@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	linux-rockchip@lists.infradead.org
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH 1/3] dt-bindings: PCI: cdns,cdns-pcie-host: drop redundant msi-parent and pci-bus.yaml
Date: Sun,  7 Apr 2024 12:19:58 +0200
Message-Id: <20240407102000.37213-1-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240407_032012_412903_F5413C3E 
X-CRM114-Status: UNSURE (   8.83  )
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

The binding reference common cdns-pcie-host.yaml, which already defines
msi-parent and has a reference to pci-bus.yaml schema.  Drop redundant
pieces here to make it a bit smaller.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 Documentation/devicetree/bindings/pci/cdns,cdns-pcie-host.yaml | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/Documentation/devicetree/bindings/pci/cdns,cdns-pcie-host.yaml b/Documentation/devicetree/bindings/pci/cdns,cdns-pcie-host.yaml
index bc3c48f60fff..a8190d9b100f 100644
--- a/Documentation/devicetree/bindings/pci/cdns,cdns-pcie-host.yaml
+++ b/Documentation/devicetree/bindings/pci/cdns,cdns-pcie-host.yaml
@@ -10,7 +10,6 @@ maintainers:
   - Tom Joseph <tjoseph@cadence.com>
 
 allOf:
-  - $ref: /schemas/pci/pci-bus.yaml#
   - $ref: cdns-pcie-host.yaml#
 
 properties:
@@ -25,8 +24,6 @@ properties:
       - const: reg
       - const: cfg
 
-  msi-parent: true
-
 required:
   - reg
   - reg-names
-- 
2.34.1


