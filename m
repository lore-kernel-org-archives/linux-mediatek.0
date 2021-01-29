Return-Path: <SRS0=ALEk=HA=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F2057C433E0
	for <linux-mediatek@archiver.kernel.org>; Fri, 29 Jan 2021 09:22:49 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7A08364E10
	for <linux-mediatek@archiver.kernel.org>; Fri, 29 Jan 2021 09:22:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 7A08364E10
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=chromium.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=HRdl/YeQMs6Bi25wEm2a9cvjWPzXdefuFnOxPoeEfPE=; b=p9hvx8pYs40Vy8NJwOi+DQnDq
	JknmxnyzIGtFOPzVhByed8YEUxXpA9XUti988J7rJEj+HIdMS49jYmhsNmE8MDI69yWIU2HmvCkcV
	C8hb0UYiJ08iNzj3B0QDH+QiLn/iUcbtltYIClnj38VZ53N3nvKT6uXiGQlCMhH5ykgYrDVK/lrEp
	u2lD2X92HyccRjFSBKMo8CK/Bw8Upn01vZ70Q2Ax2zTahjvpRaUXBOsq5lKA4J3r2FezDDhnkg+bW
	kulw44Oc/19Ero3wEbJRGqW/ruNCqBD+5wv9vyJiJrxPd7EHJKQ7HJO9pySBa5HUfDJC4HRb73VEV
	lcp4F5BEQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1l5PzD-0005LL-Jm; Fri, 29 Jan 2021 09:22:39 +0000
Received: from mail-pg1-x52d.google.com ([2607:f8b0:4864:20::52d])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1l5Pyw-0005Cz-B7
 for linux-mediatek@lists.infradead.org; Fri, 29 Jan 2021 09:22:23 +0000
Received: by mail-pg1-x52d.google.com with SMTP id n10so6238672pgl.10
 for <linux-mediatek@lists.infradead.org>; Fri, 29 Jan 2021 01:22:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=1Pn0ZbiAlX16dpKw5pmgMJlxLv+/NrVwQy7/e1oH3sI=;
 b=WYkrT72n0GWwwAndhgIvmEHt3hhcUsWDVcnPQ2Q0CNRY/ChtuPtw4BVk2a1rDzRF6b
 gcH3UQEFP141/TcXrGXdA/7xCCPWn6bdzJPNHvhch9z4VZSw4zrLG6SDI7xcwTIBrQsp
 ugzrrh9M/0LxJKesFNE2V9yVU7YBDYAKyJN7c=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=1Pn0ZbiAlX16dpKw5pmgMJlxLv+/NrVwQy7/e1oH3sI=;
 b=Fl9jDS/T1LZLoXC6FsYi+bcDrtyAH+UhHVW8Qko3ikHwdn9n8Nvo0c8lciP3PdkQv3
 Byg+5OYVAXIX55qeC0fwixC8qKTMbwUxghEAi1L+7cveBNvLPLPfFkR0aHYi2Ui8oaFz
 eAgPRqDJAOLrR7GCi4HtwamWgeHv/YNbjW/vewrvAzv0YHyku36qlbmPA3cbIFXNLCK4
 6OkLDdru5G/Dki2Pq5VtM5zdIYBxDiZacmvYGEAH5xP+KghlmhfcatS7nSeDJBPT8VoQ
 lLlrimNZZM8kEe7eXFOuc1kAu4tBu6sU407f+J9LUuK/cIUIopuX+ZMFFGV0ytE1zacR
 wFgA==
X-Gm-Message-State: AOAM533jQnqzH8URREJKCOxtfLtE3C3Q4+zGzSEq7NghNeSvdHQH4YYA
 gLvChm/AV2fU9i3aXP0MZQp1qQ==
X-Google-Smtp-Source: ABdhPJyvgi7p9OnM8oHlTqpPouXpLJgvsH4sANoZS+syyi+AQJA6VQxZdLBs2UKl9e0laORkqG9TFg==
X-Received: by 2002:a63:3403:: with SMTP id b3mr3940088pga.308.1611912140000; 
 Fri, 29 Jan 2021 01:22:20 -0800 (PST)
Received: from hsinyi-z840.tpe.corp.google.com
 ([2401:fa00:1:10:51f1:c468:a70b:7c09])
 by smtp.gmail.com with ESMTPSA id p7sm8032776pfn.52.2021.01.29.01.22.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 29 Jan 2021 01:22:19 -0800 (PST)
From: Hsin-Yi Wang <hsinyi@chromium.org>
To: CK Hu <ck.hu@mediatek.com>, Philipp Zabel <p.zabel@pengutronix.de>,
 Matthias Brugger <matthias.bgg@gmail.com>
Subject: [PATCH v13 2/8] arm64: dts: mt8183: refine gamma compatible name
Date: Fri, 29 Jan 2021 17:22:03 +0800
Message-Id: <20210129092209.2584718-3-hsinyi@chromium.org>
X-Mailer: git-send-email 2.30.0.365.g02bc693789-goog
In-Reply-To: <20210129092209.2584718-1-hsinyi@chromium.org>
References: <20210129092209.2584718-1-hsinyi@chromium.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210129_042222_473670_9D099E17 
X-CRM114-Status: GOOD (  12.42  )
X-BeenThere: linux-mediatek@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-mediatek.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mediatek>, 
 <mailto:linux-mediatek-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mediatek/>
List-Post: <mailto:linux-mediatek@lists.infradead.org>
List-Help: <mailto:linux-mediatek-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mediatek>, 
 <mailto:linux-mediatek-request@lists.infradead.org?subject=subscribe>
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org,
 Yongqiang Niu <yongqiang.niu@mediatek.com>, David Airlie <airlied@linux.ie>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-mediatek@lists.infradead.org, Daniel Vetter <daniel@ffwll.ch>,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

From: Yongqiang Niu <yongqiang.niu@mediatek.com>

mt8183 gamma is different with mt8173
remove mt8173 compatible name for mt8183 gamma

Fixes: 91f9c963ce79 ("arm64: dts: mt8183: Add display nodes for MT8183")
Signed-off-by: Yongqiang Niu <yongqiang.niu@mediatek.com>
Signed-off-by: Hsin-Yi Wang <hsinyi@chromium.org>
Reviewed-by: Enric Balletbo i Serra <enric.balletbo@collabora.com>
---
 arch/arm64/boot/dts/mediatek/mt8183.dtsi | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/arch/arm64/boot/dts/mediatek/mt8183.dtsi b/arch/arm64/boot/dts/mediatek/mt8183.dtsi
index 6c84ccb709af6..9c0073cfad452 100644
--- a/arch/arm64/boot/dts/mediatek/mt8183.dtsi
+++ b/arch/arm64/boot/dts/mediatek/mt8183.dtsi
@@ -1055,8 +1055,7 @@ aal0: aal@14010000 {
 		};
 
 		gamma0: gamma@14011000 {
-			compatible = "mediatek,mt8183-disp-gamma",
-				     "mediatek,mt8173-disp-gamma";
+			compatible = "mediatek,mt8183-disp-gamma";
 			reg = <0 0x14011000 0 0x1000>;
 			interrupts = <GIC_SPI 234 IRQ_TYPE_LEVEL_LOW>;
 			power-domains = <&spm MT8183_POWER_DOMAIN_DISP>;
-- 
2.30.0.365.g02bc693789-goog


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
