Return-Path: <SRS0=Hr4j=P3=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 667B9C433EF
	for <linux-mediatek@archiver.kernel.org>; Mon,  8 Nov 2021 07:28:29 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2E656611C0
	for <linux-mediatek@archiver.kernel.org>; Mon,  8 Nov 2021 07:28:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 2E656611C0
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=chromium.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=8irSapryZWgf28Jy+KXL4FwBHEE1nraBeN3pwfZlroI=; b=TtJJSD0NQf7QD8
	nm7kcthD2y7bqAYgGApmChBffk/ZB/wP6T3oxul7CTSpSWudreBiN4W64Ijzw8zEtTTMdZ1ag0si5
	OMiMe0qLxBpWUfK6uSklY7od0nAcM2A1b6ecJIRQ9qVeGkrhnLsPn1jzZMa9Dpc/jiXH2ayhMgTVz
	OjwC3WIvSaFqIupmmo9WEQocFlr3xiLNDkm/gv67V4HtI5Mp+vb0/9FU6JH/PO3dre3B1/D1i8oHK
	7fflYTKnJ12MfJqAjfr0TlsaJrxK5Z/YQKzlxwxvpO7vHRS1w6nPwjg0PO+qRSq1NiyAF8EFZnfYd
	Plut9XIFEgDKOkB/2DHQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mjz4i-00FZWe-CJ; Mon, 08 Nov 2021 07:28:16 +0000
Received: from mail-pg1-x535.google.com ([2607:f8b0:4864:20::535])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mjz3u-00FZ69-3p
 for linux-mediatek@lists.infradead.org; Mon, 08 Nov 2021 07:27:29 +0000
Received: by mail-pg1-x535.google.com with SMTP id g28so5744474pgg.3
 for <linux-mediatek@lists.infradead.org>; Sun, 07 Nov 2021 23:27:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=86/08aG+p6XRAME724Hp/6Odjw/P8UK3rjLz7Rko9pk=;
 b=BoKRvTZq9J89itv9JdK95/IEvYvlERVkjE4uPlab1EPj81cb7iIkNKBKx2A3R/yObw
 rEAqUp4cNaL2pspRaB/VkcTnTKLJkW6ZibMb0Radd063Qh0L5z8Qr+KBkYwO5Lg6nIV5
 XWh+kD3mxSCrLSR8xyyEQjAUMZC2hy78prXEE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=86/08aG+p6XRAME724Hp/6Odjw/P8UK3rjLz7Rko9pk=;
 b=A8Y+XcmgmNB/ee7v0ZS88DMqQXKxqNZdTKLAciMxMATimJJEBBOTykSyriSHpdpPn3
 kYrT+lmU7rXzkNMq3sgNnoWyXM7Xpyld8l4oFwEzfffhovlVlJAS5tFy5nq0f2BhCC9C
 6XaYwbNhvZ8l1CRYexLeEg61I0KYtGrX7TgGi6A5JQeV57Atx6ZNLEcGRoKBVSEgi2FF
 nY0bj0nyNatrCkzpWn8h2R6mGCsbBcyysgy51pkt4KekcxCqxlhYpz3ohlW+ZsCwtetf
 b1j6TJIvMoRR+xO0cTLPjLCzQk4kgByUQawdYTUM6khNKKxrGDqPVJgX7xk2PR7TXlhi
 7c+g==
X-Gm-Message-State: AOAM530odZae03YqDEoz8nxQrezkEPYnIHlSi10qJbekcG3Z6yEpjKfH
 sHQPM3o1aYUI1Ssh/YwS/5GbNHsvOHmbQg==
X-Google-Smtp-Source: ABdhPJxBc8kDL+AipaPGGIJV+ISqQwRN6bcmo0o4RCyreI3Ep0nB0BYF3VKg8o/EMmACT5x2zTXZXw==
X-Received: by 2002:aa7:8204:0:b0:494:68ea:ea89 with SMTP id
 k4-20020aa78204000000b0049468eaea89mr30641937pfi.74.1636356444836; 
 Sun, 07 Nov 2021 23:27:24 -0800 (PST)
Received: from hsinyi-z840.tpe.corp.google.com
 ([2401:fa00:1:10:5f03:6a9b:24e8:3a2e])
 by smtp.gmail.com with ESMTPSA id e8sm11684972pgn.46.2021.11.07.23.27.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 07 Nov 2021 23:27:24 -0800 (PST)
From: Hsin-Yi Wang <hsinyi@chromium.org>
To: Matthias Brugger <matthias.bgg@gmail.com>
Cc: Rob Herring <robh+dt@kernel.org>, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
Subject: [PATCH 5/7] dt-bindings: arm64: dts: mediatek: Add
 mt8183-kukui-jacuzzi-cozmo
Date: Mon,  8 Nov 2021 15:27:09 +0800
Message-Id: <20211108072711.1628566-5-hsinyi@chromium.org>
X-Mailer: git-send-email 2.34.0.rc0.344.g81b53c2807-goog
In-Reply-To: <20211108072711.1628566-1-hsinyi@chromium.org>
References: <20211108072711.1628566-1-hsinyi@chromium.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211107_232726_202077_E08965A7 
X-CRM114-Status: UNSURE (   9.50  )
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

Cozmo is known as Acer Chromebook 314 (CB314-2H/CB314-2HT) Chromebook.

Signed-off-by: Hsin-Yi Wang <hsinyi@chromium.org>
---
 Documentation/devicetree/bindings/arm/mediatek.yaml | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/mediatek.yaml b/Documentation/devicetree/bindings/arm/mediatek.yaml
index 0fa55497b96fd2..7cf0c76cd31006 100644
--- a/Documentation/devicetree/bindings/arm/mediatek.yaml
+++ b/Documentation/devicetree/bindings/arm/mediatek.yaml
@@ -134,6 +134,10 @@ properties:
               - google,krane-sku176
           - const: google,krane
           - const: mediatek,mt8183
+      - description: Google Cozmo (Acer Chromebook 314)
+        items:
+          - const: google,cozmo
+          - const: mediatek,mt8183
       - description: Google Damu (ASUS Chromebook Flip CM3)
         items:
           - const: google,damu
-- 
2.34.0.rc0.344.g81b53c2807-goog


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
