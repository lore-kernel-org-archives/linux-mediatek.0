Return-Path: <SRS0=+2NV=IN=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BEADEC433E0
	for <linux-mediatek@archiver.kernel.org>; Mon, 15 Mar 2021 11:43:06 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5F30E64EB3
	for <linux-mediatek@archiver.kernel.org>; Mon, 15 Mar 2021 11:43:06 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 5F30E64EB3
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=chromium.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=K4/y1jbygWpvhcE8+BtEtXxE0ptuAOd7LBOkCo8WC4Y=; b=pt4Ca11gMb64lCEE/IJIUp/1jM
	+NfYu2Jt9glyyRXyJfpvG6OM7R9H+2WlVgX1LepVxvqt+gXQvogsVysxxld73bBX0bfreVGrmfDSc
	apW9eBNmiwp8wlTQ3CNDJdwIBo6s/LeId3UjoJ/mtq3533+3XaV6SABEyI9AscUBFCzsb9bG9OsB4
	EChT2CAORTZxcr9FZSOqAhN8sk2rTEraDqf05UdStFpPAMOqqQU/rRKkA0eIlC7y2iORFEQhUsUGU
	5l3NnFfyuZv/N38GmKMzi2tq4/CLcWbcP4Gg0vpdrwXalwrF7V4HcdvWV84aRgGSerk4S9Ae7rbL5
	eNob74ig==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lLlc5-00FgqV-SL; Mon, 15 Mar 2021 11:42:22 +0000
Received: from mail-pf1-x434.google.com ([2607:f8b0:4864:20::434])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lLlay-00FghO-BT
 for linux-mediatek@lists.infradead.org; Mon, 15 Mar 2021 11:41:15 +0000
Received: by mail-pf1-x434.google.com with SMTP id o3so1734091pfh.11
 for <linux-mediatek@lists.infradead.org>; Mon, 15 Mar 2021 04:41:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=DhxSzlXHtGlfEeBFDHzLfSiaE4UuFtHOZg5BLqDfKGQ=;
 b=li20L3BagNhJ0hbClmRmAWso+KjpQm0+6SWwVscsDqjd1IBhbyes1oh9L3WY0XqzCi
 TwLuzXfXZ78sKf0neiGKXJfckB9jKS9eimN+pSdGuk8Qv0zOKeIgFIl65uOsJrADiUIT
 StRZqdTmNCT46uadcyIZjPiMXf1daznABqjV4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=DhxSzlXHtGlfEeBFDHzLfSiaE4UuFtHOZg5BLqDfKGQ=;
 b=JDaJR6M2vn1LKPcYoj1uKfpSgkDPEMUFtIuh1TMN/O2+W13dRiluLlS09mRq0YfbsJ
 PNyjg9SJvNF6wSnvgHqmLvLhanT2IRWLkFUQzp3RkqITH8ooFSMDLdPnATAW9ZDyCwix
 qoiZYKHKiRKEd0jj/KIh6AqIelEMj7LUtbvXRGvkD7JCDAe/NWtfw/41Vp4SyO1Wffqc
 PavJd0flwnyGYv6UmlYtfsbgviVcRRtIn1lzZtcquTi4y+AsU714dX/LU9ZZCQTRX/h7
 T0jmvQmlhqp3vlBUCYx0s/71+OCOnZ2NzHcN49Nof/hoSwUtzbyoDJmsiKeh8LZHjNOu
 uFvQ==
X-Gm-Message-State: AOAM530GsiDgi7WG+y8UeeU+IphoWO5SEJIC8lpuvJy+FuxLF9QZ3zC7
 3Hjf+8o/pWUxV12qn4AycOWplg==
X-Google-Smtp-Source: ABdhPJz7AGpl1rifUGBo2AufTSWcYkSCUhsjpApraQYLxQUj2FrnggU00tSjLByDU+D514QI6cCCFw==
X-Received: by 2002:a63:c702:: with SMTP id n2mr22349356pgg.382.1615808470067; 
 Mon, 15 Mar 2021 04:41:10 -0700 (PDT)
Received: from hsinyi-z840.tpe.corp.google.com
 ([2401:fa00:1:10:89b7:339b:c097:5ebb])
 by smtp.gmail.com with ESMTPSA id u12sm13192621pfn.123.2021.03.15.04.41.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 15 Mar 2021 04:41:09 -0700 (PDT)
From: Hsin-Yi Wang <hsinyi@chromium.org>
To: linux-kernel@vger.kernel.org
Cc: Rob Herring <robh+dt@kernel.org>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Hsin-Yi Wang <hsinyi@chromium.org>,
 Enric Balletbo i Serra <enric.balletbo@collabora.com>,
 Fabien Parent <fparent@baylibre.com>, Sean Wang <sean.wang@mediatek.com>,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, Ben Ho <Ben.Ho@mediatek.com>
Subject: [PATCH v2 1/2] dt-bindings: arm64: dts: mediatek: Add
 mt8183-kukui-jacuzzi-damu
Date: Mon, 15 Mar 2021 19:41:03 +0800
Message-Id: <20210315114104.1241622-1-hsinyi@chromium.org>
X-Mailer: git-send-email 2.31.0.rc2.261.g7f71774620-goog
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210315_114112_649048_FE809F1F 
X-CRM114-Status: UNSURE (   8.54  )
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

mt8183-kukui-jacuzzi-damu board also known as ASUS Chromebook Flip CM3,
using mediatek mt8183 SoC.

Signed-off-by: Hsin-Yi Wang <hsinyi@chromium.org>
---
 Documentation/devicetree/bindings/arm/mediatek.yaml | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/mediatek.yaml b/Documentation/devicetree/bindings/arm/mediatek.yaml
index 93b3bdf6eaeb..a86716cdd408 100644
--- a/Documentation/devicetree/bindings/arm/mediatek.yaml
+++ b/Documentation/devicetree/bindings/arm/mediatek.yaml
@@ -125,6 +125,10 @@ properties:
               - google,krane-sku176
           - const: google,krane
           - const: mediatek,mt8183
+      - description: Google Damu (ASUS Chromebook Flip CM3)
+        items:
+          - const: google,damu
+          - const: mediatek,mt8183
 
 additionalProperties: true
 
-- 
2.31.0.rc2.261.g7f71774620-goog


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
