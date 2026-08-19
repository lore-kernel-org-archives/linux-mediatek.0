Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B4BC8C5DF6D
	for <linux-mediatek@archiver.kernel.org>; Wed, 19 Aug 2026 10:19:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=4MVVnQZpsnH8AWbTGeS0HwvQAF/scb90pwaSD2kjboo=; b=WFBCBgCuJdUotesEa0cSs8bQEQ
	HWLzAaBOyDd4Kl1zpcVL/pLz+CRt5US2LwN6NMUC0GrIXYzFSfd3uVYIiF0P/tooZKitRD9YE5J17
	dJoVBuEy4L7VRrCIDPYZmho3F6yEihFnVF4Z0ihftKgCREgz3wtAMdOZH8/byfEmSskTD63U1fl3B
	cxSiiOgrmENnwz67oN5iTmd8MgctBZgWvTR4uwFptSKQlyarqU4kxfCTdCw5p8vGykMyyGDnhR9AB
	DD5d65hcpe6Rp03PoKloHD8FB8Ice6faFzsRhs5rKYinJGNc4b5EzieWquUnJr8A9CJq1bdB2YARu
	wuJuaFAw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wwdOW-00000009W8S-2HT4;
	Wed, 19 Aug 2026 10:19:40 +0000
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wwdOC-00000009VrJ-1k7t
	for linux-mediatek@bombadil.infradead.org;
	Wed, 19 Aug 2026 10:19:22 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=4MVVnQZpsnH8AWbTGeS0HwvQAF/scb90pwaSD2kjboo=; b=IoSu3gPV1K6ap+P+PVBSaR1MfC
	VJcJL/SL+jzLlKDYF5gn/qdvWMWoujIoGNvgHIXplvUa3dr2P4ibsa2ftqZAMDt2BVDJKTefhDLVx
	+IdTEjwYd6ZvTZX6nc0CDH5V9Ne7aPTvnkKICa0cZMEwN2IIZJiE5lVyxjwjQz1RO/qB24TfpYl/P
	6HrtQMTnNc/Max3EbLOEVNok9ImCafVnnUgLxqgjigKOrvbUya3jNxFadOzAbggvmQC7GBx/Wo8tM
	RCgHoVrFjW2UtxuSQkYCNj8uEyFvMCs0n+WpAdg5Nr3KKBr9NgnUk48cAV+/rB5cgp/n5/uLE5dUE
	dEH+VMgA==;
Received: from mail-wm1-x332.google.com ([2a00:1450:4864:20::332])
	by casper.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wwdO9-0000000DUbB-0qtL
	for linux-mediatek@lists.infradead.org;
	Wed, 19 Aug 2026 10:19:19 +0000
Received: by mail-wm1-x332.google.com with SMTP id 5b1f17b1804b1-49557167508so8690325e9.1
        for <linux-mediatek@lists.infradead.org>; Wed, 19 Aug 2026 03:19:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787134755; x=1787739555; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=4MVVnQZpsnH8AWbTGeS0HwvQAF/scb90pwaSD2kjboo=;
        b=jplD6Ypw1jKdxD5RsVicSC+7cWJzE3umhd4uzO6h184bIlYsXX41k/7y2rEEeqduDY
         kJtTZyDfIsPBoNyniahPJKPqfoJfXmjdocrsZvgoxF20ResHSOr5SBI2jcjscYk44d1O
         Qou7d6aklSirl8e8HgYvwQ6IPj3Z6c7ofat+YMfuLlaJ71Id/curlYUQjMpw7SzIrH/o
         /LLJH3JmwehAuSxj0OMskXpxv3ixoxZxXg+4dJ6lifE7n2yI7wo1mDoB85sDXTOdOjC2
         FmcKsx1mq+nw8kvC+3BJxxqpWOnZ5+lpdM4/B4Ym0L/x0t1XxiFlOIOpAF9d7fjBWXqL
         rCvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787134755; x=1787739555;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=4MVVnQZpsnH8AWbTGeS0HwvQAF/scb90pwaSD2kjboo=;
        b=acxVLmYwB0QA1/C1Be9cRCDXCkz7OUMuyWuc9GLzJ7mRS1fHVgHkvc/W5HOVj69R8b
         x2VTajOZ3gVJqMjGD3NfOY6/8+f4d+3HME4v4cM4E9L45ETLb9uGrVvy0jEwcpicL8yU
         1MqrjuZKS7ABKoNGOD1KuQQYXBaiTeqnWFtMFWeLMff8znrzLw+IRlNexKVH6iDa0rzd
         0te759UPcXq1tutiUDGD6B5qnIAbABBUEhIeTOEtKr6kKjw3FIchJYHWcyvANu9SxivP
         sHQ34tuFK4Qj7wu0kdGHLGOEr8Drv2ACCqGfu6RBHMWNJkvEK6NqWeVDsPmhzWQgY3Az
         +nUw==
X-Gm-Message-State: AOJu0YyLHwcexmcJDsuiZ1daQLOnYjgsH9BtE1GMC4jgsevAA33WnoDc
	GhWjFqvhHiSpopRrP7WDgCxWns1nehik2NX0Fz8rUsREuzAVq/6B4kRcA9H/Ry1O
X-Gm-Gg: AR+sD11pw+k260l/UIhs+YfGvRcnsQKmYJJPl8qrEt8hTZcl/EpeJsP4l3tsL3luN0J
	MZAdXSlDjzrGbB99HbWYg23JOqN42kpT7i7sk9AbQy4vHmCDq1siG1jk6wxFyRqokiDRQww1iCc
	VsIBLVHL/nSgNQAi59xz7tkJM96CVh1IycJX8qmXJ7vQu9xvtdl4YVrzfT2RsxqBZR2nKkjTt5E
	aw++6FRN77PG2GePAOcdQBxJ4D7uJXbZXRPxn2SBdhZcPn3yX+gMi0rFLBWkkBWtX7H8jcxK8Er
	6lgjq3TrFWATOyQfF7hevOh4sZNjMoHsMFGXwUtAPWpryCPy1nKz0vnDww1loaEGMWcSN6mZ3gF
	PUjg3NRlsi4j4oSYzVfUohgQ/YRErg+79VxO68hb+MxojNiEOkq71XcRpBzg1Cyes0ZCXGkRffJ
	5tBgSo4hD0WgAQ4PxkR1+F76mks5bKLwaDP7PYoCsH4WmKgKdhmU0VyA==
X-Received: by 2002:a05:600c:4e15:b0:499:8a3a:fd3a with SMTP id 5b1f17b1804b1-499aa19a7c8mr69046125e9.5.1787134755440;
        Wed, 19 Aug 2026 03:19:15 -0700 (PDT)
Received: from luca-vm.. ([81.56.18.151])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-499a9b7c987sm27316965e9.1.2026.08.19.03.19.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 19 Aug 2026 03:19:14 -0700 (PDT)
From: Luca Leonardo Scorcia <l.scorcia@gmail.com>
To: linux-mediatek@lists.infradead.org
Cc: Luca Leonardo Scorcia <l.scorcia@gmail.com>,
	Akari Tsuyukusa <akkun11.open@gmail.com>,
	Wim Van Sebroeck <wim@linux-watchdog.org>,
	Guenter Roeck <linux@roeck-us.net>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	linux-watchdog@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH v4 3/7] arm: dts: mediatek: mt6589: Enable toprgu reset controller
Date: Wed, 19 Aug 2026 12:16:24 +0200
Message-ID: <20260819101853.44681-4-l.scorcia@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260819101853.44681-1-l.scorcia@gmail.com>
References: <20260819101853.44681-1-l.scorcia@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260819_111917_288299_98C283A2 
X-CRM114-Status: GOOD (  10.97  )
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

Enable the toprgu reset controller feature for the mt6589 SoC. This
allows generating reset signals for the 12 subsystems managed by its
top reset generation unit.

Signed-off-by: Akari Tsuyukusa <akkun11.open@gmail.com>
Signed-off-by: Luca Leonardo Scorcia <l.scorcia@gmail.com>
---
 arch/arm/boot/dts/mediatek/mt6589.dtsi | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/arm/boot/dts/mediatek/mt6589.dtsi b/arch/arm/boot/dts/mediatek/mt6589.dtsi
index 46dea445742b..2ba912a356af 100644
--- a/arch/arm/boot/dts/mediatek/mt6589.dtsi
+++ b/arch/arm/boot/dts/mediatek/mt6589.dtsi
@@ -7,6 +7,7 @@
 
 #include <dt-bindings/interrupt-controller/irq.h>
 #include <dt-bindings/interrupt-controller/arm-gic.h>
+#include <dt-bindings/reset/mediatek,mt6589-wdt.h>
 
 / {
 	#address-cells = <1>;
@@ -147,6 +148,7 @@ uart3: serial@11009000 {
 		wdt: watchdog@10000000 {
 			compatible = "mediatek,mt6589-wdt";
 			reg = <0x10000000 0x44>;
+			#reset-cells = <1>;
 		};
 	};
 };
-- 
2.43.0


