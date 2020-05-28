Return-Path: <SRS0=lKUU=7K=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D173FC433DF
	for <linux-mediatek@archiver.kernel.org>; Thu, 28 May 2020 13:59:20 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A5FC620814
	for <linux-mediatek@archiver.kernel.org>; Thu, 28 May 2020 13:59:20 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="S5MYFd+B";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=bgdev-pl.20150623.gappssmtp.com header.i=@bgdev-pl.20150623.gappssmtp.com header.b="miP7UbEn"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org A5FC620814
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:To
	:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=25XxCi9qRjkw0Ra3azMaGAQ5gsST5eY8mx39ooM6AU0=; b=S5MYFd+BoU3poT
	KLloLOsI+yAQf4A3C5eIVHd+ndktUjMIBNwSDHQ8JBVL291BWVkzUlSjhCLRgIpo4F8p/+NPr6q+p
	O2oGB2Pf+h2HG+kboIxVhFeEdPlP/1mm1d7CItc3o8+8yITSHJEbgu5V0hPGK4DfT+sZS8e0M8zr4
	Bme/O3iWsGYwXwCKGOBSY7RWbcOH4gTVFJBhunEBxZSPJFv8/Op2lEMWzuMcR0xvI1fYWagqJt+gn
	fWp9I8yRWWEQv4/U3g/Zfycu53UnrLkg1Ga2RfQd4j6OtNQdaW3pOqoQ+gs/mnq5bPj8fA5QDEGUE
	Uh+M5oIl4l89pt070COQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jeJ3x-0000B4-2G; Thu, 28 May 2020 13:59:13 +0000
Received: from mail-wm1-x341.google.com ([2a00:1450:4864:20::341])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jeJ3r-0008WM-2P
 for linux-mediatek@lists.infradead.org; Thu, 28 May 2020 13:59:08 +0000
Received: by mail-wm1-x341.google.com with SMTP id r15so3265942wmh.5
 for <linux-mediatek@lists.infradead.org>; Thu, 28 May 2020 06:59:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bgdev-pl.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=z4Mht0hOJ/x269vYNUbhZmvFvBpXKo/z9k8ZE3MlgiM=;
 b=miP7UbEnqGNLwbuCqX3AjlcLiVr/EEW+iM9ZpMml9MEg9sEtBhsE1bnK0HHD2uRhfF
 ADhtu3NmeTdU1c/V4b/dzY7krJThryWtxqu9nO06W+kDnFqn9IS9Sfknoz7lVfmo899S
 eDnBBRKKKyv6X5DgQFNmSm6ReWWv49Rd3VQbPJ2J0GJTRVXxJVR4yKEPRHo/F/K2rrur
 wtwbTHAPGLqhAzcaiKZCw8Sxw3dIK8TCHAMTYW2WnbKUh9rmUlyYwoziHLLhZm6zhmnw
 XokQF5+qlAi+Y/cFuLWs/+HMfeny26GRAeu553j7xxdsSymRXQPvz3pB+w/CKf3GFHJX
 0S9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=z4Mht0hOJ/x269vYNUbhZmvFvBpXKo/z9k8ZE3MlgiM=;
 b=EcRtiM1UnrontPfcMKL30XY/gVxYAlqObNpCW5avDrCWxmULkGNgdOdUcrgPAApom3
 y21Rvc5DgdLpnNa4syug+Ge/FogqQIR/6RNN20WYans5PjA79PVY+YKbFf36VyJoWDVN
 gNqSMTw0Kj/YPD+Cd6qDkigEudi7WpPsUo/1AGcrANAnSpyVTrtZTyRKPBOn56tWJDSf
 QnTXkqxHq9OYlAgSsyk6fOdy21QPMBhUN10dYKKObTW1VqgMYWYeRasQqWaLtmYdHUFC
 5rQdDBRR3zJQ7eIjgvDWMcKVlTe0lTtlUiK3fnPsHfToOnKgidssTbm1Du+HpPkJpdTL
 vtJw==
X-Gm-Message-State: AOAM530hz0FL2g55owzLJpKdSA+A2ZS5cE2hWPBEK2fIWI5pViTlT85Q
 /8WbNWs4+hI01my9FlUezYR9BXYcJLE=
X-Google-Smtp-Source: ABdhPJwa2kiLYWJHItumPfhGeufMSpJNKjrDcHYRwjVY19oFSl+hS6FpEyyraLAC5F2EWT/iMGIlLA==
X-Received: by 2002:a7b:ca47:: with SMTP id m7mr1760608wml.173.1590674345652; 
 Thu, 28 May 2020 06:59:05 -0700 (PDT)
Received: from localhost.localdomain (lfbn-nic-1-65-232.w2-15.abo.wanadoo.fr.
 [2.15.156.232])
 by smtp.gmail.com with ESMTPSA id f2sm6395917wrg.17.2020.05.28.06.59.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 28 May 2020 06:59:04 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
To: "David S . Miller" <davem@davemloft.net>, Jakub Kicinski <kuba@kernel.org>,
 Rob Herring <robh+dt@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>
Subject: [PATCH net-next v2] dt-bindings: net: rename the bindings document
 for MediaTek STAR EMAC
Date: Thu, 28 May 2020 15:59:02 +0200
Message-Id: <20200528135902.14041-1-brgl@bgdev.pl>
X-Mailer: git-send-email 2.26.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200528_065907_209697_A9D41D02 
X-CRM114-Status: UNSURE (   9.05  )
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
Cc: devicetree@vger.kernel.org,
 Stephane Le Provost <stephane.leprovost@mediatek.com>,
 Bartosz Golaszewski <bgolaszewski@baylibre.com>, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, Fabien Parent <fparent@baylibre.com>,
 linux-mediatek@lists.infradead.org,
 Andrew Perepech <andrew.perepech@mediatek.com>,
 Pedro Tsai <pedro.tsai@mediatek.com>, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

From: Bartosz Golaszewski <bgolaszewski@baylibre.com>

The driver itself was renamed before getting merged into mainline, but
the binding document kept the old name. This makes both names consistent.

Signed-off-by: Bartosz Golaszewski <bgolaszewski@baylibre.com>
---
v1 -> v2:
- update the id field as well

 .../net/{mediatek,eth-mac.yaml => mediatek,star-emac.yaml}      | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename Documentation/devicetree/bindings/net/{mediatek,eth-mac.yaml => mediatek,star-emac.yaml} (96%)

diff --git a/Documentation/devicetree/bindings/net/mediatek,eth-mac.yaml b/Documentation/devicetree/bindings/net/mediatek,star-emac.yaml
similarity index 96%
rename from Documentation/devicetree/bindings/net/mediatek,eth-mac.yaml
rename to Documentation/devicetree/bindings/net/mediatek,star-emac.yaml
index f85d91a9d6e5..aea88e621792 100644
--- a/Documentation/devicetree/bindings/net/mediatek,eth-mac.yaml
+++ b/Documentation/devicetree/bindings/net/mediatek,star-emac.yaml
@@ -1,7 +1,7 @@
 # SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
 %YAML 1.2
 ---
-$id: http://devicetree.org/schemas/net/mediatek,eth-mac.yaml#
+$id: http://devicetree.org/schemas/net/mediatek,star-emac.yaml#
 $schema: http://devicetree.org/meta-schemas/core.yaml#
 
 title: MediaTek STAR Ethernet MAC Controller
-- 
2.26.1


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
