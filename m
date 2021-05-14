Return-Path: <SRS0=SQT7=KJ=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EA0A8C433B4
	for <linux-mediatek@archiver.kernel.org>; Fri, 14 May 2021 12:22:18 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 6086361285
	for <linux-mediatek@archiver.kernel.org>; Fri, 14 May 2021 12:22:18 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 6086361285
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=chromium.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=7yZD4v9WEIACfq4LOds8XongpuAv6MuJWItRVjzeghA=; b=hZGR7ZFdv26vDEVKnIHtXThKn
	LCgLUUVWE+wMMmW7dmWyzP2fMqVt1b9CYVG0H5oNoYsNC2JcYCcxCaktwROS+muKz4j5c3Z9q2HUE
	decpeNqktACguS2E0EQwadLsJqwIG0g3Ri+WGSf/RfjxPsrbZgblEd4MNRWxxldOAUilKgHoXTtPb
	oRGp1yXWQbD24sCv9mNTlF+eBa8npVX1BmlNhXQpoRu6VcL771DF8Lf9uGEa17PG8KMSJULYepUFJ
	Z2lakZr/JG8Je4VZYlYWJP8WRQrv+E1wBztgWm9we2rPcatVrhouHeyNcWRHiQTgyI31yEXZq8xLQ
	Fi4wfDocg==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lhWpP-0080uh-Hv; Fri, 14 May 2021 12:22:03 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lhWpB-0080ri-4p
 for linux-mediatek@desiato.infradead.org; Fri, 14 May 2021 12:21:49 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
 MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender
 :Reply-To:Content-Type:Content-ID:Content-Description;
 bh=eDsBcMn1LjQ/hDt4A5VW4rjJ3axqBAgkESJwxk85dos=; b=IL7XtchJHBgS32oCzxKzxol2/u
 8ND5zUaAo2D0Zk+LpgmPzVip47gRUzEm4sFn5imtUyY3CdMhPmD5/F5UEVBx9IBhoR8WXGg+CqRYs
 qYPFRgTbXejB2p81g3g2mkHTmmdmZ/1cBoUnyovVHFxnNXmHwp6ttf50ZFsl3tppIdyKBETNqlcqk
 NwHGt1jifq6lLfNZkVx88r6ShVmSsmWOpZjkfXfEU1hkIeJLtnwXzipqYfw4AAx2P/uNBWAU8bRzk
 +YwNsIAtqr/jKrGEYIYN3ckRsvB5jgwYTZs+UG1VUeaiF8Ssemrb0KPlTtUVT4UvqX/kETCGWkfdd
 0JGcZlLQ==;
Received: from mail-pf1-x432.google.com ([2607:f8b0:4864:20::432])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lhWp7-00By5m-EJ
 for linux-mediatek@lists.infradead.org; Fri, 14 May 2021 12:21:47 +0000
Received: by mail-pf1-x432.google.com with SMTP id c17so24516309pfn.6
 for <linux-mediatek@lists.infradead.org>; Fri, 14 May 2021 05:21:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=eDsBcMn1LjQ/hDt4A5VW4rjJ3axqBAgkESJwxk85dos=;
 b=SW5DJIHQpxkxWhkboLIm5KcifPgzvhRktiH30n6bS+X4SKEPha2DWC3KR5gyqr83hB
 YQPLn3bgk3aUNnuGPtDGve2THPWaS26HYtEvXb7Dr1y0ewiZLuhKY8KViKhfrhDk62QM
 K6LMvy3EL5Djw/52hUfs3ULA0sFQAiWklQQSw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=eDsBcMn1LjQ/hDt4A5VW4rjJ3axqBAgkESJwxk85dos=;
 b=OeuyypkrFb3+fezwr7ADw7RIRjcrguXkRPkSylsdgdISZsz4ILVKOzSNwWQUvsghuX
 Is03sHyT1pPs+tc+aaRJgKvMfQntf38tIhQq09axbfLXrxnAg4SUGyil219FEcwGhR4g
 +bZWGgPeeRgcXAQrfy29hlecxiM4riR3TvD3u4LaeKWqD3sVe2JNrxRxoUtheSGAOrAC
 cQR2ZpxXoFhBYbUun5OZXUWqGVpBgNbMqnajF19WfD6HHzcxm4zEVZDqj1WGISHXb3Hl
 NSB08MwEHxafg0F+7tCua8XoaX3n5lfHA7V3pZUd6AVEeTBrAYxb8j7qIMHwlUGEhoPP
 WcGA==
X-Gm-Message-State: AOAM532bqv/NpC5euNXOy7CJejbbR9GcpnAibIPlfI49IekgNIFWoHOf
 9sXN2hMlDJIvZAA3Viuducq54A==
X-Google-Smtp-Source: ABdhPJx6jr5fCAdWz8NJtqocenE0PKs3M5FF1QRbK4QlEM50P2vcTu20RWzMWUzaKu1vMlPRqVRlZg==
X-Received: by 2002:a62:80d2:0:b029:2b3:fca1:8829 with SMTP id
 j201-20020a6280d20000b02902b3fca18829mr31868512pfd.2.1620994904194; 
 Fri, 14 May 2021 05:21:44 -0700 (PDT)
Received: from ikjn-p920.tpe.corp.google.com
 ([2401:fa00:1:b:7641:4b1d:694e:6ea2])
 by smtp.gmail.com with ESMTPSA id u17sm4010117pfm.113.2021.05.14.05.21.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 14 May 2021 05:21:43 -0700 (PDT)
From: Ikjoon Jang <ikjn@chromium.org>
To: devicetree@vger.kernel.org,
	Lee Jones <lee.jones@linaro.org>
Cc: linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org,
 Matthias Brugger <matthias.bgg@gmail.com>,
 linux-arm-kernel@lists.infradead.org, Guenter Roeck <groeck@chromium.org>,
 Enric Balletbo i Serra <enric.balletbo@collabora.com>,
 Benson Leung <bleung@chromium.org>, linux-input@vger.kernel.org,
 Hsin-Yi Wang <hsinyi@chromium.org>, Jiri Kosina <jikos@kernel.org>,
 Stephen Boyd <swboyd@chromium.org>, Ikjoon Jang <ikjn@chromium.org>,
 Rob Herring <robh@kernel.org>, Rob Herring <robh+dt@kernel.org>
Subject: [RESEND PATCH v7 1/2] mfd: google,
 cros-ec: add DT bindings for a baseboard's switch device
Date: Fri, 14 May 2021 20:20:49 +0800
Message-Id: <20210514122051.266169-2-ikjn@chromium.org>
X-Mailer: git-send-email 2.31.1.751.gd2f1c929bd-goog
In-Reply-To: <20210514122051.266169-1-ikjn@chromium.org>
References: <20210514122051.266169-1-ikjn@chromium.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210514_052145_501637_309BEAF7 
X-CRM114-Status: GOOD (  13.06  )
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

This is for ChromeOS tablets which have a 'cros_cbas' switch device
in the "Whiskers" base board. This device can be instantiated only by
device tree on ARM platforms. ChromeOS EC doesn't provide a way to
probe the device.

Signed-off-by: Ikjoon Jang <ikjn@chromium.org>
Reviewed-by: Rob Herring <robh@kernel.org>
Acked-by: Enric Balletbo i Serra <enric.balletbo@collabora.com>

---

Changes in v7:
 - no changes from v6

Changes in v6:
 - Remove a label for cbas node in a example

Changes in v5:
 - Add missing blank lines and change the description property's position.
 - Add a note to description: "this device cannot be detected at runtime."

Changes in v4:
Define cros-cbase bindings inside google,cros-ec.yaml instead of
a separated binding document.

 .../bindings/mfd/google,cros-ec.yaml          | 20 +++++++++++++++++++
 1 file changed, 20 insertions(+)

diff --git a/Documentation/devicetree/bindings/mfd/google,cros-ec.yaml b/Documentation/devicetree/bindings/mfd/google,cros-ec.yaml
index 76bf16ee27ec..929c17552d8b 100644
--- a/Documentation/devicetree/bindings/mfd/google,cros-ec.yaml
+++ b/Documentation/devicetree/bindings/mfd/google,cros-ec.yaml
@@ -114,6 +114,22 @@ properties:
       - "#address-cells"
       - "#size-cells"
 
+  cbas:
+    type: object
+
+    description:
+      This device is used to signal when a detachable base is attached
+      to a Chrome OS tablet. This device cannot be detected at runtime.
+
+    properties:
+      compatible:
+        const: google,cros-cbas
+
+    required:
+      - compatible
+
+    additionalProperties: false
+
 patternProperties:
   "^i2c-tunnel[0-9]*$":
     type: object
@@ -180,6 +196,10 @@ examples:
             interrupts = <99 0>;
             interrupt-parent = <&gpio7>;
             spi-max-frequency = <5000000>;
+
+            cbas {
+                compatible = "google,cros-cbas";
+            };
         };
     };
 
-- 
2.31.1.751.gd2f1c929bd-goog


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
