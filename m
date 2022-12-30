Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5BD7EC4332F
	for <linux-mediatek@archiver.kernel.org>; Fri, 30 Dec 2022 21:41:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:To:
	From:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=nQFWSjnAmXGCxMB5DVpOmGczTzlI1ebWvjBAsrHPlS4=; b=XwFuQkp2XWJ317fhsefhwqV1UT
	nl9pK+6+d1bk/PxmfYs0zjk51jHFKZjXJ4zTjs8c28WwF80FlR1zqt99MYdNLUFBnR7/LZScIa/Uz
	REaolTV3bN4yFk5+U3yzNSFZwaleCqObccRdOUhVdLqzgqs+34a0weKMZz03T+gXGyi9pJ5/jva4j
	k6IPiAxVDT2+UV53rRVvFaI1OmmK314M7JxYuBJ0n65k2ROBFxX0RPEd2Z8c+BPCaSVb/fZTNTd0Z
	gJXafBA5f7Nbf5ieGwXGT3g9i8Thwwg/4brNowkFr+8IEyPr+3oB5QY2BrRfApAcOEZcuXkVugdkx
	B3ZeKdFQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pBN7z-00Dorj-JL; Fri, 30 Dec 2022 21:41:23 +0000
Received: from mail-ed1-x52c.google.com ([2a00:1450:4864:20::52c])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pBM6Y-00DLh5-Uy
	for linux-mediatek@lists.infradead.org; Fri, 30 Dec 2022 20:35:54 +0000
Received: by mail-ed1-x52c.google.com with SMTP id l29so24666099edj.7
        for <linux-mediatek@lists.infradead.org>; Fri, 30 Dec 2022 12:35:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=nQFWSjnAmXGCxMB5DVpOmGczTzlI1ebWvjBAsrHPlS4=;
        b=1nNFGNhve3KqK6RlreucmsxHteknOmdOaNO8JnlwNb9lHY07YiAC33PsEJ6zXeLFBb
         dt3prhxRI8yPypDpacPQDKNYm9TIehRAzpLeaO1JFw2tWWF9W4tE1BXFkFJcJkEihdz7
         wnXCmTavn5xqaF+Bdy08/LRhSZ0vxhR/5iRrILZW0iigMFRyd71lK+5rl+vMhid1zpl0
         YjwbLrimNFd5xcm/3wYwRGhOTK/D1lxc4XBLq5OQ6KIEAGcDZDSx/29SRt0wAec6Cc5J
         MRkh89LQz13Q8yrBvctjUr0GjMWh8qpTpQv2sLqRUENPWd29JaxIU9Dz6I/1pGwr5Ed3
         MFJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=nQFWSjnAmXGCxMB5DVpOmGczTzlI1ebWvjBAsrHPlS4=;
        b=7BhzhgHguU3PB5yjhfMRCD8CVjnB8y7joJnw5z2Iw7AT1ayIJP/NiTSKMv12rqDqs+
         FmUicuiqDAF6jhabLMQ92LKE4soP1zylrdleJHaD/ZQjUhAKKZLLHp0YSbcnUPQMek20
         6J0aw7NJtYWlzhlxsXJB9uOagIfeRW/b+/YzJk0yGZIjjB29ep02IPWFp+tRa1MIvB+K
         +k5TtIh78EFX0hriwfO/2ieAX1l2w+jEEtieciffYOytJPN5VJKysC1V8rL0HWBQlhcs
         t4k133eSd39E8NzCNyUABBSJWmWrEGfwr6QhCnqZO2iHGIume+XtTZPUKB3f/zroDzNC
         RDlQ==
X-Gm-Message-State: AFqh2kpRDC6E7ELr0jt075CrYQVMmh5bIJ1BFevLXSHSPPnfvT/Zu/sv
	/QNZIKCNSzs4BCm5BRvcde0zxZdnnfT0hVs5v5Q=
X-Google-Smtp-Source: AMrXdXvRRE7qV5S21eWJi/mZqwiBlRqXMqidqBxglTJ3pjDMqDyO+pFxWrpZ6hNS5jG3xuf3JUKRtA==
X-Received: by 2002:aa7:db47:0:b0:46d:b89a:de1e with SMTP id n7-20020aa7db47000000b0046db89ade1emr25833171edt.1.1672432548199;
        Fri, 30 Dec 2022 12:35:48 -0800 (PST)
Received: from predatorhelios.fritz.box (dynamic-2a01-0c22-cd9d-4b00-ef17-3c78-1696-7315.c22.pool.telefonica.de. [2a01:c22:cd9d:4b00:ef17:3c78:1696:7315])
        by smtp.gmail.com with ESMTPSA id c10-20020a056402158a00b00482c1f1a039sm8350500edv.30.2022.12.30.12.35.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 Dec 2022 12:35:47 -0800 (PST)
From: =?UTF-8?q?Bernhard=20Rosenkr=C3=A4nzer?= <bero@baylibre.com>
To: linux-mediatek@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	matthias.bgg@gmail.com,
	krzysztof.kozlowski+dt@linaro.org,
	robh+dt@kernel.org,
	gregkh@linuxfoundation.org,
	chunfeng.yun@mediatek.com,
	linus.walleij@linaro.org,
	lee@kernel.org,
	maz@kernel.org,
	tglx@linutronix.de,
	angelogioacchino.delregno@collabora.com
Subject: [PATCH v6 5/7] dt-bindings: usb: mediatek,mtu3: add MT8365 SoC bindings
Date: Fri, 30 Dec 2022 21:35:39 +0100
Message-Id: <20221230203541.146807-6-bero@baylibre.com>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <20221230203541.146807-1-bero@baylibre.com>
References: <20221230203541.146807-1-bero@baylibre.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221230_123551_027488_6418D816 
X-CRM114-Status: UNSURE (   8.01  )
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

From: Fabien Parent <fparent@baylibre.com>

Add binding documentation for the MT8365 SoC.

Signed-off-by: Fabien Parent <fparent@baylibre.com>
Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Signed-off-by: Bernhard Rosenkränzer <bero@baylibre.com>
Reviewed-by: Matthias Brugger <matthias.bgg@gmail.com>
---
 Documentation/devicetree/bindings/usb/mediatek,mtu3.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/usb/mediatek,mtu3.yaml b/Documentation/devicetree/bindings/usb/mediatek,mtu3.yaml
index 7168110e2f9de..d2655173e108c 100644
--- a/Documentation/devicetree/bindings/usb/mediatek,mtu3.yaml
+++ b/Documentation/devicetree/bindings/usb/mediatek,mtu3.yaml
@@ -28,6 +28,7 @@ properties:
           - mediatek,mt8188-mtu3
           - mediatek,mt8192-mtu3
           - mediatek,mt8195-mtu3
+          - mediatek,mt8365-mtu3
       - const: mediatek,mtu3
 
   reg:
-- 
2.39.0


