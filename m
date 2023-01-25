Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E6503C54E94
	for <linux-mediatek@archiver.kernel.org>; Wed, 25 Jan 2023 15:02:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:To:
	From:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=B2giSoKpmUMBjrMl9HUkga8ekHANL68RCzLpYCFzHvs=; b=TKqIiWcI0xAHHx4VvQaTMzTDMi
	ZtKw3TqrReD2cNHvmKQ0oHvDLdke9aPBGDHBKsdM6ppTXD1mtYDE5T8mpSHeEL0VCjFfW2jNERyfU
	kvlPBsH42dtl5mrd5O/TqPZLqHdjA/qcWy0xQ703cvX4Xjd/DDsZpHDpXW9TwMs80CpmCV/EFGEEe
	LTw6iWYs+DMkqM3fKC1LJjlzmI05u7XHp3G4o+4V6gyooUBU5Ia+Jh+Cmk+jUuhVCqnuUNzVFgGIH
	He/F/Fi/qX/GkJ8P8TCMeIaHAqEj/Q2IFCqtuzl44yAdOz5vnX1Ur1RWzFR1X014dlOrusO1VYQNo
	PNCR4n/g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pKhIH-007gsw-10; Wed, 25 Jan 2023 15:02:33 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pKhIF-007gs2-Cg
	for linux-mediatek@bombadil.infradead.org; Wed, 25 Jan 2023 15:02:31 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:To:From:Sender:
	Reply-To:Cc:Content-ID:Content-Description;
	bh=B2giSoKpmUMBjrMl9HUkga8ekHANL68RCzLpYCFzHvs=; b=e2+qC06E8NTp1WMKr6Ao9xmzD+
	AfaA5SMi/DN9jKZf5qbQt8DUSgA6drlTfzXIldU7BlVg6svyRnDBm1Y5G/Q3lEW2jvYjcsrTxCwKY
	Mju+cCVwmxdTYpmFWeARLy7AKXkfpx3NATlVBrgNF+RkJjmqnBkTr6vyukqRfeqdHT2Bipn8ryKmi
	gT2vTHPRhASCMuJKx8ZjxOJ/ebrxMLGXjRePcT3aj+srXPRYi7ipgcTNMtVi8WU0We2yMHbDLLcIy
	gsoZ4NwtXrcDXgk1bq0I20oroFvh8sec0lF4JhGCOtTKOhfxSiGjO9e7Fl/7VOSKcw3FlK26T55Ss
	qmtO27Zw==;
Received: from mail-ej1-x62f.google.com ([2a00:1450:4864:20::62f])
	by desiato.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pKgrY-002A0K-1E
	for linux-mediatek@lists.infradead.org;
	Wed, 25 Jan 2023 14:34:58 +0000
Received: by mail-ej1-x62f.google.com with SMTP id az20so48236398ejc.1
        for <linux-mediatek@lists.infradead.org>; Wed, 25 Jan 2023 06:35:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=B2giSoKpmUMBjrMl9HUkga8ekHANL68RCzLpYCFzHvs=;
        b=kQ6L5xYgk2+18HedslxV9VP4htolCDeVl8W5FgmN6R2IIAyhioZtcO8nXaShcD/YWY
         FANg3prPs2LeWtuHWif4TiHdjhnYzEZdBre23zbuwBJeEWvupV2VdCB/scDoW4Xb4XJ7
         nKF5fFAmNdr+qdpvzRLL5JhqmyzLxdBWyB3RpdxnW6zSDbaYduRoR2h0ffFxe4z2THZs
         nwc6eAOGrOO6a9Nh1Zejul1Wmzli4sM4uurgDn94D9auMiw4qQw8HJVfVjjH6aOE0pUF
         cowXWQmv5I5KRiyq9W9TqdQiAu+EmXSbyBuKRbddoXSpViuqORK9tpSMNNi2miLlBoRG
         gj0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=B2giSoKpmUMBjrMl9HUkga8ekHANL68RCzLpYCFzHvs=;
        b=ZvNLhENC+LKv1q0iNgkGhKq9/fyoOzqS+NsPzB0HumXhkHtvdOAL273mzO1rPIHrh5
         5EsqgxSz3oDfVHn9GiPurwaE4eCOHAsdN+j4hNzXmrfqjKOes7QwtcZrLZ7d/+qiBib5
         GfOTdu1N+9p4KZ79/rZFTXXzTdcY/QW8LsgPXN6HMNi3YxngbU+C4UOjxdG0EfkggZL+
         fNFMxg4TL1+hBb9VVkKAaExN12qlbvR2IqHeVKGEniCkZP5E56ZTRsE52CzFHpOuNTOc
         RsOJgjShwyXEB10quRdyPkDFDD3JC3EGvjZW2LBS+X1Y1r0qpFPs3MX8RRvOEyU7pz8/
         XntQ==
X-Gm-Message-State: AFqh2kpqTY6a+YBHv9KEPRn5VXdx2xUZlpMb7c7hjGoPgsgn0ORTMlA3
	7LMPaw0i6bOolof3ZGsaUXW7G9JU+adzjxfR
X-Google-Smtp-Source: AMrXdXtaIZrEnurCkz3yd2v2DJFwcX9KOokSAkiudb0bv0MpXe7Oawbn60EZB1shhY8H52QO+UJv9w==
X-Received: by 2002:a17:906:eb8e:b0:871:6b9d:dbc with SMTP id mh14-20020a170906eb8e00b008716b9d0dbcmr33632150ejb.21.1674657314542;
        Wed, 25 Jan 2023 06:35:14 -0800 (PST)
Received: from c64.fritz.box ([81.221.122.240])
        by smtp.gmail.com with ESMTPSA id gx2-20020a1709068a4200b0082000f8d871sm2437789ejc.152.2023.01.25.06.35.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Jan 2023 06:35:14 -0800 (PST)
From: =?UTF-8?q?Bernhard=20Rosenkr=C3=A4nzer?= <bero@baylibre.com>
To: linux-mediatek@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-gpio@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-serial@vger.kernel.org,
	linux-usb@vger.kernel.org,
	robh+dt@kernel.org,
	krzysztof.kozlowski+dt@linaro.org,
	tglx@linutronix.de,
	maz@kernel.org,
	lee@kernel.org,
	linus.walleij@linaro.org,
	matthias.bgg@gmail.com,
	gregkh@linuxfoundation.org,
	daniel.lezcano@linaro.org,
	chunfeng.yun@mediatek.com,
	angelogioacchino.delregno@collabora.com,
	nfraprado@collabora.com,
	allen-kh.cheng@mediatek.com,
	sean.wang@mediatek.com,
	zhiyong.tao@mediatek.com
Subject: [PATCH v9 7/9] dt-bindings: timer: mediatek,mtk-timer: add MT8365
Date: Wed, 25 Jan 2023 15:35:01 +0100
Message-Id: <20230125143503.1015424-8-bero@baylibre.com>
X-Mailer: git-send-email 2.39.1
In-Reply-To: <20230125143503.1015424-1-bero@baylibre.com>
References: <20230125143503.1015424-1-bero@baylibre.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230125_143456_619310_AC6C49AC 
X-CRM114-Status: UNSURE (   7.70  )
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

Add binding description for mediatek,mt8365-systimer

Signed-off-by: Bernhard Rosenkränzer <bero@baylibre.com>
Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 Documentation/devicetree/bindings/timer/mediatek,mtk-timer.txt | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/timer/mediatek,mtk-timer.txt b/Documentation/devicetree/bindings/timer/mediatek,mtk-timer.txt
index 8bbb6e94508b2..b3e797e8aa313 100644
--- a/Documentation/devicetree/bindings/timer/mediatek,mtk-timer.txt
+++ b/Documentation/devicetree/bindings/timer/mediatek,mtk-timer.txt
@@ -33,6 +33,7 @@ Required properties:
 
 	For those SoCs that use CPUX
 	* "mediatek,mt6795-systimer" for MT6795 compatible timers (CPUX)
+	* "mediatek,mt8365-systimer" for MT8365 compatible timers (CPUX)
 
 - reg: Should contain location and length for timer register.
 - clocks: Should contain system clock.
-- 
2.39.1


