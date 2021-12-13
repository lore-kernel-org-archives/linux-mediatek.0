Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D0513C433EF
	for <linux-mediatek@archiver.kernel.org>; Mon, 13 Dec 2021 07:24:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=iqDO2yKaWKiUqlkHUEBCad3ew5PiGrgHDUAlhEphrow=; b=uhYZZkWS99jspQ
	/h5adusASDhhVdJCpYCaW229oNcNQwQZLkrqkaHJW3BogSzuSl0G3uYtrsGsRTeFgD6dwKywrtyVn
	Mvgw7NhmJtd3rRFFwkRRelLvyP2cVFkf1CkxdFJBK8cdb9I9JiWBoOt0UKqTZYVMfYZeyw31r1nKt
	qQWE2DcV7d8r/rZJA4g3RUpEuFr5QVma81WgBmq2L9aij38JOgY6XCVSxjZE8oJ3cOmrHFWSeHTai
	8xyrHcJ7NfQS2yV4KqHxM11lDvYK8dpw5gRO44VTdaqaz8WT1U/0SLbGvsgbgm5AC+eTABCAV75XR
	X7/dwVDP0illa9vcS6LA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mwfhH-0083nv-UM; Mon, 13 Dec 2021 07:24:31 +0000
Received: from mail-pf1-x433.google.com ([2607:f8b0:4864:20::433])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mwfgp-0083bP-VB
 for linux-mediatek@lists.infradead.org; Mon, 13 Dec 2021 07:24:05 +0000
Received: by mail-pf1-x433.google.com with SMTP id r130so14186620pfc.1
 for <linux-mediatek@lists.infradead.org>; Sun, 12 Dec 2021 23:24:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=PHDKjEXSmqoSIP+TB1gPedSyi6ETK7cM1nPYeOviVPg=;
 b=iTfc6TJPsBL+LTaSAFFxrkBLrdtDnOZT025BYaoWu/Vqh49UGHatNRitpC0ROkmsIb
 3G4g45EbcV1b1+vNj3xfT1+cDOZRP5hOKLTzvEo7c1uxYfn6a+j9rhD+Vfq/NF2CSw9J
 fd0ByqizROJ8TT/4blfTOingAS8s3WztCeLz8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=PHDKjEXSmqoSIP+TB1gPedSyi6ETK7cM1nPYeOviVPg=;
 b=WvNVbQJzKUvxPz+WdsUJcKXhGvrY6AmxdF2hutSw/cR/DB62jFjzWXz0FLTQZMA/rP
 LX5ueizqeotcHICW5doaaCw9Sc+BTnYzYPqK5+GwdtIqNDvGogMe9vqn3/2CuurOiMjr
 XEB2GND/CrNQMhSqib8lZ7GXDBxve+cV/NERyw+LZISO5tB9HwGvZZEL/hbnKpnsfEDL
 9BfpmQKYgAkA7MWhsycaxgogdJ6cIAA55MQSp7/TghRPyDE6Os6QPKD+iZ+KmH/NA/v/
 e7B6kDUYRTFpIN8b1emK2tgZN2P4qFpqd7rjDUdRgB9HywZNo4eB+IlT8QhH2C6vVMVW
 4zsg==
X-Gm-Message-State: AOAM530K7ZF+WsStCu3i0FHGRTqiarki/mK3O9jq4YLxwPnvJrMDU02k
 Dzduujp46WRyUNjnFhfsMlAzTw==
X-Google-Smtp-Source: ABdhPJxsjVjfJN4rfywh9wlYcdwqLbk+6iNcwHEQBP/1nHNhraHh8toFSnB/i9niYEMN0PBtfZGoPg==
X-Received: by 2002:a65:5c88:: with SMTP id a8mr50572544pgt.542.1639380241991; 
 Sun, 12 Dec 2021 23:24:01 -0800 (PST)
Received: from hsinyi-z840.tpe.corp.google.com
 ([2401:fa00:1:10:9447:edff:ad23:1bfc])
 by smtp.gmail.com with ESMTPSA id e7sm11747562pfv.156.2021.12.12.23.24.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 12 Dec 2021 23:24:01 -0800 (PST)
From: Hsin-Yi Wang <hsinyi@chromium.org>
To: Matthias Brugger <matthias.bgg@gmail.com>
Cc: Rob Herring <robh+dt@kernel.org>, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
Subject: [PATCH 3/4] dt-bindings: arm64: dts: mediatek: Add mt8183-kukui-katsu
Date: Mon, 13 Dec 2021 15:23:54 +0800
Message-Id: <20211213072355.4079568-3-hsinyi@chromium.org>
X-Mailer: git-send-email 2.34.1.173.g76aa8bc2d0-goog
In-Reply-To: <20211213072355.4079568-1-hsinyi@chromium.org>
References: <20211213072355.4079568-1-hsinyi@chromium.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211212_232404_059333_6CB3772B 
X-CRM114-Status: UNSURE (   8.29  )
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

Katsu is known as ASUS Chromebook Detachable CZ1.

Signed-off-by: Hsin-Yi Wang <hsinyi@chromium.org>
---
 Documentation/devicetree/bindings/arm/mediatek.yaml | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/mediatek.yaml b/Documentation/devicetree/bindings/arm/mediatek.yaml
index 723810cffce2e7..75bb06d1802a08 100644
--- a/Documentation/devicetree/bindings/arm/mediatek.yaml
+++ b/Documentation/devicetree/bindings/arm/mediatek.yaml
@@ -175,6 +175,13 @@ properties:
         items:
           - const: google,kappa
           - const: mediatek,mt8183
+      - description: Google Katsu (ASUS Chromebook Detachable CZ1)
+        items:
+          - enum:
+              - google,katsu-sku32
+              - google,katsu-sku38
+          - const: google,katsu
+          - const: mediatek,mt8183
       - description: Google Kodama (Lenovo 10e Chromebook Tablet)
         items:
           - enum:
-- 
2.34.1.173.g76aa8bc2d0-goog


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
