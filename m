Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 02086C4332F
	for <linux-mediatek@archiver.kernel.org>; Fri, 30 Dec 2022 21:40:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:To:
	From:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=bGuxAnhfIj2x3uYPeVPB/2g8dAYaMTxAZOm/4EaT1sM=; b=wijd900M+r6uPvRVhsaQMDfVTi
	4CuoWpiE8IKC9xBIn3G1i8Os99QV0QHgC20Dy3CY4ayYT/mwOjD1ZeQ3rwT4gOXDzRbyPuTjSa23r
	5HSk/obmh5HYdIof5g5Tuuye/rpySvHVFeFM4FXOdN8mLBuiYZ4KvbavJG1qp3d+YjjJLRKoKvKx8
	miKXMHRqLxiJc+ICZiUJY5HgUWqh/lmpaEVr54BycOWzKqQniImW2fxR6t/6pvFRbDcNQ7ATSp6GW
	e3WDcdNkleJ2j3rQdT5hum4WdGJj8PxJZIQJsHeAAf0YtU77YsmibQColwX58CHgL7Hw2ccN3LO7o
	sTEhhixw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pBN7H-00DoT3-Ga; Fri, 30 Dec 2022 21:40:39 +0000
Received: from mail-ed1-x531.google.com ([2a00:1450:4864:20::531])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pBM6V-00DLfE-OD
	for linux-mediatek@lists.infradead.org; Fri, 30 Dec 2022 20:35:51 +0000
Received: by mail-ed1-x531.google.com with SMTP id l29so24665876edj.7
        for <linux-mediatek@lists.infradead.org>; Fri, 30 Dec 2022 12:35:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=bGuxAnhfIj2x3uYPeVPB/2g8dAYaMTxAZOm/4EaT1sM=;
        b=jrBQbD2ncyKY9+6Qw1UneYFTXPe9bnAJoL7gYDxrLNXLCtzTpb/kUUTbGCWUiQ9rHG
         PMvLEn5wyw2OTj6qPDygZg5/1DyGqs2vlVRqhZb/rZlebfrmGXy86cvVQu6uf0lSfKEv
         wbTan9Jt/DCzLGUgO0SVDnZsYyWtVtIsbGBARltYeTiaNnGdrxP0dNDdbgrPwhTJ4TvR
         t1q2IbHbpfI930wG3qmWgOiSlRtOjAcHGD3nmkxfX5Jq1bZplVL2LgIm4nj4MZSiYCMk
         oaoOQcAAs/gMfMW+jV9j7bUfBjN090Qb4BuynzYFTm29PdDj4dz0OAre253OtuvcPTmw
         FVeQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=bGuxAnhfIj2x3uYPeVPB/2g8dAYaMTxAZOm/4EaT1sM=;
        b=PaBFNipbrenbPGZdo3LRCCu3UppU7lKzVQW+vIi+seut0vJYV9C7hQm/ne7QUQ1cGU
         PFR6g27etBCk0G7xO6NFHGj2Q9oiwWJl+UaDhTQJEBllPi9vszVLxriX1QwqGDJd3hqk
         svqNEfq1t1zEVJKMWFF0MwpVgklhX8n/QRfJH0qC39iZNkpbP/N2bBJWSh3xRRqkO4ox
         1OIf9nYsqJBn+9VEK2GtdujIFCk9KGpIPeB/TR9hwAndSCtFz35qTR4tHkgbg2p6xhQ5
         jBlyk3HaKmTmo893tjUkB9mL+JTENRT0wjyYvxEldbTsSHDwPUvpSUM9TkqYvc3i3War
         47Qg==
X-Gm-Message-State: AFqh2kq/y04dPTKjlSV5DShkBLcXRdS6pAQ3WeVf2E65AuqzCl20umNc
	F7vy99OR5xHdpV1RKznR/AHw8UhL6ffQhYbIox0=
X-Google-Smtp-Source: AMrXdXsCeCzqGEMDTH1R2aSWlkw2d+d2e8sOKhd3spzxOsnv3W/2UjG2cPl/NFmEv6DYDEsyL7ujGA==
X-Received: by 2002:aa7:d585:0:b0:48a:aaa0:5176 with SMTP id r5-20020aa7d585000000b0048aaaa05176mr4613190edq.29.1672432546162;
        Fri, 30 Dec 2022 12:35:46 -0800 (PST)
Received: from predatorhelios.fritz.box (dynamic-2a01-0c22-cd9d-4b00-ef17-3c78-1696-7315.c22.pool.telefonica.de. [2a01:c22:cd9d:4b00:ef17:3c78:1696:7315])
        by smtp.gmail.com with ESMTPSA id c10-20020a056402158a00b00482c1f1a039sm8350500edv.30.2022.12.30.12.35.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 Dec 2022 12:35:45 -0800 (PST)
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
Subject: [PATCH v6 3/7] dt-bindings: mfd: syscon: Add mt8365-syscfg
Date: Fri, 30 Dec 2022 21:35:37 +0100
Message-Id: <20221230203541.146807-4-bero@baylibre.com>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <20221230203541.146807-1-bero@baylibre.com>
References: <20221230203541.146807-1-bero@baylibre.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221230_123547_834389_E3F750EB 
X-CRM114-Status: UNSURE (   7.03  )
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

Document Mediatek mt8365-syscfg

Signed-off-by: Bernhard Rosenkränzer <bero@baylibre.com>
Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Reviewed-by: Matthias Brugger <matthias.bgg@gmail.com>
---
 Documentation/devicetree/bindings/mfd/syscon.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/mfd/syscon.yaml b/Documentation/devicetree/bindings/mfd/syscon.yaml
index 1b01bd0104316..7beeb0abc4db0 100644
--- a/Documentation/devicetree/bindings/mfd/syscon.yaml
+++ b/Documentation/devicetree/bindings/mfd/syscon.yaml
@@ -50,6 +50,7 @@ properties:
               - marvell,armada-3700-usb2-host-misc
               - mediatek,mt8135-pctl-a-syscfg
               - mediatek,mt8135-pctl-b-syscfg
+              - mediatek,mt8365-syscfg
               - microchip,lan966x-cpu-syscon
               - microchip,sparx5-cpu-syscon
               - mstar,msc313-pmsleep
-- 
2.39.0


