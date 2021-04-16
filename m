Return-Path: <SRS0=rcQv=JN=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F1526C433ED
	for <linux-mediatek@archiver.kernel.org>; Fri, 16 Apr 2021 16:41:40 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7B7C86115B
	for <linux-mediatek@archiver.kernel.org>; Fri, 16 Apr 2021 16:41:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 7B7C86115B
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=chromium.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=/rOnD6uoZmCFPWJEAJgxqdj22sBFQvQbMo1q0mXy/WE=; b=UEK1lqC2wsWbVi+4fDhP4QHTIK
	cTPZgsF4v64ltCjHVYII87WPX9XsEIHmS9KxHmHnkrzoncrYP0SHSMR7po2ifLSlKmytv6TzS116g
	acfT5uUuDsxvOqW+xKxg1TQuE9+RIg6DMgwa+jOsTWkupWUl4tEzo9x47/zHtPUVe5eYhD95i0IhK
	6ZZKXJHEkwmVaVZmJZ79YsHkobNULndgGV3rsCgr288CpP8jZUwHn6R9O8tUoGQLI58mehXAkMltu
	zE4jGE26WZYJTvVzXJbe1RfDD83IUjnmuu1sn/WgZ7MKkNDvF3MDP5QcrF201H36nGcR82TJ8GG10
	t9kXYWfA==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lXRWy-002oca-0G; Fri, 16 Apr 2021 16:41:20 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lXRWn-002oZz-D6
 for linux-mediatek@desiato.infradead.org; Fri, 16 Apr 2021 16:41:10 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
 MIME-Version:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:In-Reply-To:References;
 bh=hVriKR5I/NFf/xSL2VyqnYW9cKu0+GSesiyqdIeCgc4=; b=KWxDYlTR6jlg6OIWCdhllk20C4
 l9X//5q3AXDXaQY96YG6ffYAREUzsdCXKzy+hVOf5vevErTA3jhD5lUPIRzEntDgdMNPNpgtKgOzz
 2DTN3Ln2gysrhaiTWGGpg+j+qBYLqPXuFhUUz416SMkmt4ClQ93aP+zRD2pgkxNZGKtw+lwERp7qf
 1JwmtiE1Tkvi5UZuLbFmcuQSBImyFgUhcMlO282f01QGq7HnnJrMeB86MRwQi0ZeMrk6VI/EHpxhU
 vYG7YBwAkx1iVhSUYmkxDq3TbKwvvdoOpm6r9C6LYz+3sxpDmI1VprKG6FgpoVZv2aBsQSLRyjYXy
 aYvRxiDQ==;
Received: from mail-pf1-x430.google.com ([2607:f8b0:4864:20::430])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lXRWe-009YwO-LD
 for linux-mediatek@lists.infradead.org; Fri, 16 Apr 2021 16:41:08 +0000
Received: by mail-pf1-x430.google.com with SMTP id w8so15230722pfn.9
 for <linux-mediatek@lists.infradead.org>; Fri, 16 Apr 2021 09:40:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=hVriKR5I/NFf/xSL2VyqnYW9cKu0+GSesiyqdIeCgc4=;
 b=Msc2tJZeV8WokdPoMKXC3omkWOe6CmgHgiVy8+ZwnXKQe+QgnmH/rqJuD4c2XZdeBL
 AB5zfJ9TJpNXzkXhbdYBGqDerM1rTrTrGM/0iFXLBBZBAg8z53wvGfpWqD0r+PfL21eB
 MGvGgUHeUXQnWzyTbehKUi3s03YnZZ7JZ1aK4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=hVriKR5I/NFf/xSL2VyqnYW9cKu0+GSesiyqdIeCgc4=;
 b=gu09yV7RhVPoOwPyA/A9lR2V/t+7/njJd2mGk/8N3d74haOlD+CASdZGJthvKllu6e
 AYQSvZyls/FZ2c082T0Lq/Ee6rODhBm3rC/Z1ECy9wKbTCzX7YG+g2jOsVCKo6W643CN
 ZYYxkpRDtCY/UsbY4f0KZsmWJZ/TfbRFtHVDEsX1/52Lb88uzHeHAPvuWxzwcSuQvUNR
 SG/yby2Zz2N2my5ynbhouuUe0/K6kaII2Xq6TNmpAfJSvTVzd8mjZeKfDpzJz69o2mPa
 20XPsTU98Kdpy7U7TRL/uNGAOBXqJMHk0tFQ9INi9R8Cxzwy0sAku+URrH7FEcXXicUU
 J3dA==
X-Gm-Message-State: AOAM532zJ8h8iwz3XjC7ajrdFxVZIa07TfG9rxzbHWdSnfDSPRriYaUz
 uLsHtPgp9YlgSc9FwVXHMEUg3w==
X-Google-Smtp-Source: ABdhPJxq3u2vhRDPyJ0n6UPrUxkVQKghOU+fHnFtMyM6t2w8ke69ld6rlVKR+NYFWcvL8a1ww4jNhw==
X-Received: by 2002:a63:d153:: with SMTP id c19mr8848758pgj.311.1618591259312; 
 Fri, 16 Apr 2021 09:40:59 -0700 (PDT)
Received: from hsinyi-z840.tpe.corp.google.com
 ([2401:fa00:1:10:ccd5:218f:365:b90f])
 by smtp.gmail.com with ESMTPSA id g14sm6187186pjh.28.2021.04.16.09.40.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 16 Apr 2021 09:40:58 -0700 (PDT)
From: Hsin-Yi Wang <hsinyi@chromium.org>
To: Matthias Brugger <matthias.bgg@gmail.com>
Cc: Rob Herring <robh+dt@kernel.org>, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, Sean Wang <sean.wang@mediatek.com>,
 Ben Ho <Ben.Ho@mediatek.com>,
 Enric Balletbo i Serra <enric.balletbo@collabora.com>
Subject: [PATCH v2 1/8] dt-bindings: arm64: dts: mediatek: Add
 mt8183-kukui-jacuzzi-kappa
Date: Sat, 17 Apr 2021 00:40:48 +0800
Message-Id: <20210416164055.3223088-1-hsinyi@chromium.org>
X-Mailer: git-send-email 2.31.1.368.gbe11c130af-goog
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210416_094100_702834_5B2D2D68 
X-CRM114-Status: UNSURE (   7.58  )
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

Kappa is known as HP Chromebook 11a.

Signed-off-by: Hsin-Yi Wang <hsinyi@chromium.org>
Reviewed-by: Enric Balletbo i Serra <enric.balletbo@collabora.com>
---
 Documentation/devicetree/bindings/arm/mediatek.yaml | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/mediatek.yaml b/Documentation/devicetree/bindings/arm/mediatek.yaml
index aff57a8c8c30..81b86b189a8d 100644
--- a/Documentation/devicetree/bindings/arm/mediatek.yaml
+++ b/Documentation/devicetree/bindings/arm/mediatek.yaml
@@ -144,6 +144,10 @@ properties:
           - const: google,kakadu-rev2
           - const: google,kakadu
           - const: mediatek,mt8183
+      - description: Google Kappa (HP Chromebook 11a)
+        items:
+          - const: google,kappa
+          - const: mediatek,mt8183
       - description: Google Kodama (Lenovo 10e Chromebook Tablet)
         items:
           - enum:
-- 
2.31.1.368.gbe11c130af-goog


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
