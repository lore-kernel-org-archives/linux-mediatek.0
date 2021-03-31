Return-Path: <SRS0=zLKe=I5=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F0D99C433E1
	for <linux-mediatek@archiver.kernel.org>; Wed, 31 Mar 2021 09:14:31 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5FDBE619C1
	for <linux-mediatek@archiver.kernel.org>; Wed, 31 Mar 2021 09:14:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 5FDBE619C1
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=chromium.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=2+FgNPrgwCOMJCIrCiQmS1Q07B0cyjOPi6qEevQSQjs=; b=mFRAe9zY7GnUymD/zq63euycpN
	ZVnWOBZ9XjSRARTiaOBSZM04Pbnm687Uioa7Heiqb58nZoBlXfTxuZipjWeRnhk/I+QkxMwYeTFpi
	GXsaotrPqQRNWbl17tu4YX3hYn98n9WJlqhRBHFXFxlCqdez1gSIT/G9Wf7iF+AuQxe5mU9fLGn0Z
	q8C/VMJTkFKWDa6ehEtfCOQNjk0bsV8zfTFmNiiq0hxZIoXmLLG5aVrwZcX78SlLtTMg9yCyvj7vp
	1KTJ4DD9g/5CXq9/Z44IUnw43D43rsVSliqmWcSnqvn1XavdPyD7zflq6PZMrRzDmZ+ArqrZbsSbe
	yWW6wy0A==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lRWvd-0064z0-6g; Wed, 31 Mar 2021 09:14:21 +0000
Received: from mail-pg1-x530.google.com ([2607:f8b0:4864:20::530])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lRWv0-0064r2-6X
 for linux-mediatek@lists.infradead.org; Wed, 31 Mar 2021 09:13:45 +0000
Received: by mail-pg1-x530.google.com with SMTP id f3so4556285pgv.0
 for <linux-mediatek@lists.infradead.org>; Wed, 31 Mar 2021 02:13:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=wSMkZYokyXMj9ctwi5eddd7Z7dKdZakXqSVex3m7s3s=;
 b=iKyT42M8FtBBrZU64CJCqhrGn/NHfzX638A7M0468/GCD/oYHOGTnlW/HqaudcG+xA
 R8BVx9YeAgDRgdxrmFUPG9c1T6l6OnQF6jZLNEftkYs8zMWeUrnH6rMe5L9dCPsjHlUI
 e9MIt9uTuVNq/qkThX+Z2V+iTjQhUElC4HPCw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=wSMkZYokyXMj9ctwi5eddd7Z7dKdZakXqSVex3m7s3s=;
 b=J3OJlIdiOAy2G9Ss7fJjBcH2po3JXYJb4h2Vtm+imBqUIAk+P+I9KeG626NlnIgr9O
 /oXk3j+/96irI3eFRwHflMORJzmdQ2ECq3UzhcSQlEPO5VYgFKdLgxTymC1DLNKHgEv/
 Xrezeg2PBA2NCxX431V75+tvjXgwsXgyMs9EUolYZIiC7wVfS6f5RvaCfk4aTpWiuOdF
 u0GMiEq4jhe072o4UHHdIlpJhKdty0BVl0ol/FYjr7gKtFQsiH5a2Zbbrb8d8NlY9fMU
 rkhYhRCDhabC8HqNpGgXUgRjIEQrL7aiHIImv997Sn9l2B7n0YIMpMwruNiRfOMVa7re
 7Q5Q==
X-Gm-Message-State: AOAM53020lwvXgji9isU8147HSOqHqK0lxb3eYLbwmKlOQNFd90ARihW
 kQriS4sIDClqmhNMhu/badg8LA==
X-Google-Smtp-Source: ABdhPJz4SDU8/o1IrKvO9iaYz+4Maznj3uz3Ov0JJ5HmuiCTXEcgqFw51BPz0s58frC2OQS5+sBLtg==
X-Received: by 2002:a63:6f8a:: with SMTP id k132mr2451919pgc.59.1617182011967; 
 Wed, 31 Mar 2021 02:13:31 -0700 (PDT)
Received: from hsinyi-z840.tpe.corp.google.com
 ([2401:fa00:1:10:85fc:9f25:6293:28f1])
 by smtp.gmail.com with ESMTPSA id s7sm1484723pjr.18.2021.03.31.02.13.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 31 Mar 2021 02:13:31 -0700 (PDT)
From: Hsin-Yi Wang <hsinyi@chromium.org>
To: Matthias Brugger <matthias.bgg@gmail.com>
Cc: Rob Herring <robh+dt@kernel.org>, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, Sean Wang <sean.wang@mediatek.com>,
 Ben Ho <Ben.Ho@mediatek.com>,
 Enric Balletbo i Serra <enric.balletbo@collabora.com>
Subject: [PATCH 1/4] dt-bindings: arm64: dts: mediatek: Add mt8183-kukui-kakadu
Date: Wed, 31 Mar 2021 17:13:24 +0800
Message-Id: <20210331091327.1198529-1-hsinyi@chromium.org>
X-Mailer: git-send-email 2.31.0.291.g576ba9dcdaf-goog
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210331_101342_475677_937B8CFA 
X-CRM114-Status: UNSURE (   7.83  )
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

Kakadu is also known as ASUS Chromebook Detachable CM3.

Signed-off-by: Hsin-Yi Wang <hsinyi@chromium.org>
---
 Documentation/devicetree/bindings/arm/mediatek.yaml | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/mediatek.yaml b/Documentation/devicetree/bindings/arm/mediatek.yaml
index cf24401edb85..9774f44b51d9 100644
--- a/Documentation/devicetree/bindings/arm/mediatek.yaml
+++ b/Documentation/devicetree/bindings/arm/mediatek.yaml
@@ -138,6 +138,13 @@ properties:
           - const: google,juniper-sku16
           - const: google,juniper
           - const: mediatek,mt8183
+      - description: Google Kakadu (ASUS Chromebook Detachable CM3)
+        items:
+          - const: google,kakadu-rev3
+          - const: google,kakadu-rev2
+          - const: google,kakadu
+          - const: mediatek,mt8183
+
 
 additionalProperties: true
 
-- 
2.31.0.291.g576ba9dcdaf-goog


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
