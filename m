Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3DFD2CD4F41
	for <linux-mediatek@archiver.kernel.org>; Fri, 15 May 2026 09:02:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ISYKmXVI5dGO3RCkjTpj/otEcK5TE9KEG1oM+kKbrzw=; b=4itRdTUKJuWuGPW1pZJEyLg/gl
	zU1GbSNdWPsVcbsYwhcJlmU+bkxbpED7aamS9VVwiVpePU5bc7meIgxfwId9Cata67S6g99RiFIz1
	uUrz5MS7FO0ryQMFdZHYmc5hhY4x8wkPeFjIPBXN2sC43Ceej1dSNeKkXK3o2QmiDj+1TIdRYoDNp
	V8zt6bBHJHRmJS6v3NUCNMREHVb2KwTs8qJoFg5kt55Yxp9SCB5XvXorNioYBuE1/g/4Rrs83mz4h
	q8SF5wAYv/80Ghf1jwAO48b82wCv5IMAkIAfI4ecR24VdNaMWSH/0dVDCFG7UyZyU+UB0kltGXQgM
	Y2QQq3RA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wNoRJ-00000007oyx-0lp6;
	Fri, 15 May 2026 09:02:37 +0000
Received: from mail-pj1-x102a.google.com ([2607:f8b0:4864:20::102a])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wNoRE-00000007oty-2edy
	for linux-mediatek@lists.infradead.org;
	Fri, 15 May 2026 09:02:33 +0000
Received: by mail-pj1-x102a.google.com with SMTP id 98e67ed59e1d1-3664df32e91so7795909a91.3
        for <linux-mediatek@lists.infradead.org>; Fri, 15 May 2026 02:02:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1778835752; x=1779440552; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ISYKmXVI5dGO3RCkjTpj/otEcK5TE9KEG1oM+kKbrzw=;
        b=e8V50OcnCvodTMRCTyQfR0t7qdRGbo5lud9B8ekZU5ftJRD3jh9BSwNDQWSJIhQeCh
         xixY5kDLss/tz6NfnVguPX7YJXtSymXKH5n38b0KikeThnqkEIwBU0LpHKIe2lfDnqfw
         Icw9SVeupOHWAJ5AtqqYtjO+OiNGmnHVfXyaY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778835752; x=1779440552;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=ISYKmXVI5dGO3RCkjTpj/otEcK5TE9KEG1oM+kKbrzw=;
        b=Ppv8tJWjSu8d2ad6mPRe5fMGQowrSUJNKlFgbhVB/DbT4x6F4Av0JUSmF3rY8wSaju
         yXFrEGeibStza29GW0dXhqOmXIsbkeZ9WUWOWgYhZLUpcu9udsEB6nsUXBxRpYxbZ5eq
         MO4vKW+DUUQHnQwnZUStpjwdRcqedgg9BZZPXoTVV7TQcGDXOgJ9f4flq74qqM6AOzbs
         dPdf18QBfVTuZcWRAWkGJEWdFS7ZVeEwIEPH0oE+gNEoeBJsE42n+KfzGC0JvJMnoFzg
         Vmte5pKPIyby6dJTJbke8uYvlrKYIw/IpPmfHowoRa7HQPXcFKi/qoqc8tag81A/jpa1
         CtIg==
X-Forwarded-Encrypted: i=1; AFNElJ+diBy71VSOlZ2ekFinoRNM5QJ2z9PLiGYxUwj9re+GFpwDy04haFj7e+k1LpM6JcgyR0gOtyOEH+QtvQ+qvA==@lists.infradead.org
X-Gm-Message-State: AOJu0YwjfDdXP/QP5Gw4wPaIb3CL4328YwJsUMyzlamV2MQtWroA07dJ
	423nOzzyGKi6jsLjPqbqgT6Gu+Wz9oRBEpnis/5oeyprCqyqJvTz62ePFpoyX5R47A==
X-Gm-Gg: Acq92OFh9M6RntmDwVZubwRRrvCxevguWMxmwAYO5q/xBQu+graoyUUZ52L2+0yIUn4
	xFna6v9Pcoini0Z/nQUXwGdTgYudhFsEtYqadKHaXGL6h5c0Gq6bpEB3UiUhmoBIMICKTLbSa7b
	giTfkn77gSxVYyza4x7eXVUOA4ZQFWlA7DvwEdkIvmTh1a2/s/gJ+HnNEvBwRUqZjjPiJAAP98o
	cFZhOYZ2FisOuTm7leiwZX32gsbi+GaUl945uKcad6TKCpjBj5mz7OBqBLCCjzGYQwGZeaw50E2
	BR7bTA/E76rlT9Cy8aS8ZlAdT+4pZsVydmgjlAQYzbPQE//f6+1wlqWA3bleCaG4doyC89NvBeM
	uGMKNAXVk9N6uwKLoBSQZsAuAgjopCLtFWI/AmfRJtOsKIqcUXqBOXkMZ6cxsFdATSnGwm5/GG3
	tdjHBsiM4XUe3Yxt/mIxVdZmNhXdpoDhFJZMF6l9/+qb5Baxjcv/h/OiFL7786Edg7NJQO8p0Sf
	AfR0A5qJ9dXgQnkJAg=
X-Received: by 2002:a17:90b:5784:b0:366:479c:59e8 with SMTP id 98e67ed59e1d1-369519dfe40mr3451397a91.8.1778835751725;
        Fri, 15 May 2026 02:02:31 -0700 (PDT)
Received: from wenstp920.tpe.corp.google.com ([2a00:79e0:201d:8:b3d8:e32e:c2fc:c31e])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-36951584654sm2076537a91.7.2026.05.15.02.02.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 15 May 2026 02:02:31 -0700 (PDT)
From: Chen-Yu Tsai <wenst@chromium.org>
To: Bartosz Golaszewski <brgl@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: Chen-Yu Tsai <wenst@chromium.org>,
	linux-pm@vger.kernel.org,
	linux-usb@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-mediatek@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Manivannan Sadhasivam <mani@kernel.org>
Subject: [PATCH RFC 07/12] dt-bindings: usb: mediatek,mtk-xhci: Allow ports for USB connections
Date: Fri, 15 May 2026 17:01:43 +0800
Message-ID: <20260515090149.3169406-8-wenst@chromium.org>
X-Mailer: git-send-email 2.54.0.563.g4f69b47b94-goog
In-Reply-To: <20260515090149.3169406-1-wenst@chromium.org>
References: <20260515090149.3169406-1-wenst@chromium.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260515_020232_679268_376ADE5B 
X-CRM114-Status: GOOD (  11.09  )
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

MediaTek's XHCI implementation supports both USB 2.0 High Speed (HS)
and USB 3.x Super Speed (SS). The block can also be synthesized with
either HS-only capability or HS+SS capability.

For example, on the MT8195, the first two instances support both HS and
SS, while the latter two instances support only HS.

Allow a ports sub-node for describing USB connections. Port 1 is Super
Speed if the controller is SS-capable, otherwise it is High Speed. Port
2 is High Speed if SS-capable. This port mapping scheme directly matches
what the hardware returns in its capability registers.

Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>
---
 .../devicetree/bindings/usb/mediatek,mtk-xhci.yaml  | 13 +++++++++++++
 1 file changed, 13 insertions(+)

diff --git a/Documentation/devicetree/bindings/usb/mediatek,mtk-xhci.yaml b/Documentation/devicetree/bindings/usb/mediatek,mtk-xhci.yaml
index 75ecce3bdc7a..d6c75bd20b78 100644
--- a/Documentation/devicetree/bindings/usb/mediatek,mtk-xhci.yaml
+++ b/Documentation/devicetree/bindings/usb/mediatek,mtk-xhci.yaml
@@ -184,6 +184,19 @@ properties:
   "#size-cells":
     const: 0
 
+  ports:
+    $ref: /schemas/graph.yaml#/properties/ports
+
+    properties:
+      port@1:
+        $ref: /schemas/graph.yaml#/properties/port
+        description: Super Speed (SS) data bus if SS-capable;
+          otherwise High Speed (HS) data bus.
+
+      port@2:
+        $ref: /schemas/graph.yaml#/properties/port
+        description: High Speed (HS) data bus if controller is SS-capable.
+
 patternProperties:
   "@[0-9a-f]{1}$":
     type: object
-- 
2.54.0.563.g4f69b47b94-goog


