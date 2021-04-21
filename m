Return-Path: <SRS0=vHqv=JS=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A0890C433B4
	for <linux-mediatek@archiver.kernel.org>; Wed, 21 Apr 2021 09:06:40 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 058DE600D1
	for <linux-mediatek@archiver.kernel.org>; Wed, 21 Apr 2021 09:06:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 058DE600D1
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=chromium.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=4kDFVI4V+JA3cSjO4VVeeXLHHW7C5s3NLeUxmikwE5I=; b=oPJf2aNxCTfFO8I6dx/zWF42r
	ERyzEmAmnA+JcabXScLi2decHhcCZTv2HjGnnQyEVTstyJQKsMv0W/TE99a0h+0kmx6twCRKf92NX
	T7tJXLHadH8v5D5oRM+E70YgqkTr6yYgXE6hSyIuuZPngidCNjjBYgqqaEdNRANhA7zYYxu3S7xMp
	dpyDrZ7X6Ilu1503FeiMmPi5ZZg2QB5OP6f6sjNN9y2GNRqbEGQnVPR7QYZA3nZbdU31Frt++Jlkj
	zb0cmG4fJawMiVw98Q0IBZeihv3Sj6D1kD0yRjiYkTXcdwF029JsMiFXH28st4t0ZL/N/Nf02i6uD
	62rVmXvcQ==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lZ8oS-00E2xD-2W; Wed, 21 Apr 2021 09:06:24 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lZ8oK-00E2w6-6J
 for linux-mediatek@desiato.infradead.org; Wed, 21 Apr 2021 09:06:22 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
 MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender
 :Reply-To:Content-Type:Content-ID:Content-Description;
 bh=JUFJlRYw+cqn/AL+S42IH0SJKjQ6r0g1wThs2iJNVzo=; b=QwN+6ik+91S7Bdm6wpI0bmWhg2
 IFOu+DdhU1M3wTl1oTwOAnIODsaydz3wnjaFbQLBI5on4ehYa34HjnSY75oTqIp+QW0xRQsENaZc7
 grB2RnVub+TBGcEDJqtzshtxnQ5Quwg+0qkCITUhg4vAWbeR12DkgaSh1BsZlaOelxiZQA4y+6Tcj
 nwICcbbfd2vOCNJIHyTRB7Dcie3tjjd//3FtCD2YEfBPjwV+UeDl8B15nCTjRnRJEHVEHF8G3o0Up
 /PRJnhO2oVZQ7/x7b6C4u8mFQnmiIvPo3CGWu8P8JgOkXUfdf9we9PdW7GMzrQQbw6fqERHdDXN2n
 ptjSZvYw==;
Received: from mail-pf1-x431.google.com ([2607:f8b0:4864:20::431])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lZ8oH-00CjeW-QR
 for linux-mediatek@lists.infradead.org; Wed, 21 Apr 2021 09:06:15 +0000
Received: by mail-pf1-x431.google.com with SMTP id i190so28129889pfc.12
 for <linux-mediatek@lists.infradead.org>; Wed, 21 Apr 2021 02:06:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=JUFJlRYw+cqn/AL+S42IH0SJKjQ6r0g1wThs2iJNVzo=;
 b=LmMv42o+n4oLkqZ+Uz95xhrzeAw6xn0dpztOFWfOSu6FArh1AgOBnXTsBUajkp8VTV
 zgPs0RXHc/PqFOyvAo+i9shPRVJsS6DxPTyNrH5x1q9aPYbI0xJytI+RBRsdnxgIrjke
 FKQTB4OEBGal1lwIRJM/s1C3hZ+C5q3H2EiW0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=JUFJlRYw+cqn/AL+S42IH0SJKjQ6r0g1wThs2iJNVzo=;
 b=hInYEW4GH+fCSFk1RWx9FFoSDHnElkAgoKLBXOxx9xBDf7jxId9sfZNp6Q9tveoRFq
 R+pGF9QOdaYlo3BMpP963eEaYdW4GyAi/jGxdWrfg9RrfDiu3UHZDp6Kxoq+DHId3xpG
 gh6/+2BRNQQEtuHBFIYBelK3+7ZWzhEwpC91NzEe8HjEOvXCz3N3v2i+NhBqggHxD6C2
 EkLbLq1xoFgAK+jDJ57lv9hoW/XVNyxz8o31Vp412llwJBKpA0lDTE4C3Mk0t4hucmAV
 aQd/eIzjQq5oLbd/kjZn3DBhHJ1YjFKS5LzJR61Rz+WOF2fr5UxR2kBmbi9utoRuBrtt
 2wBA==
X-Gm-Message-State: AOAM531ZdPl+9+SNd4+nSFE0x3syFH03GxcQiO9/dR9UnBctWC1rAIWc
 PmTu4wI5JyLmgjNsV2uQbgtFSQ==
X-Google-Smtp-Source: ABdhPJwLdS12xSxtecC4wgi0Qw8p7+oCENpmojb8ObATIWpCJ6sRqkQWExuuENFMOPjeX5GfG1BJnA==
X-Received: by 2002:a17:90a:6f45:: with SMTP id
 d63mr10008532pjk.39.1618995973292; 
 Wed, 21 Apr 2021 02:06:13 -0700 (PDT)
Received: from hsinyi-z840.tpe.corp.google.com
 ([2401:fa00:1:10:60c1:887e:ac53:9b5c])
 by smtp.gmail.com with ESMTPSA id jx20sm1495889pjb.41.2021.04.21.02.06.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 21 Apr 2021 02:06:12 -0700 (PDT)
From: Hsin-Yi Wang <hsinyi@chromium.org>
To: Matthias Brugger <matthias.bgg@gmail.com>
Cc: Rob Herring <robh+dt@kernel.org>, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, Sean Wang <sean.wang@mediatek.com>,
 Ben Ho <Ben.Ho@mediatek.com>,
 Enric Balletbo i Serra <enric.balletbo@collabora.com>
Subject: [PATCH v3 04/10] dt-bindings: arm64: dts: mediatek: Add
 mt8183-kukui-jacuzzi-kenzo
Date: Wed, 21 Apr 2021 17:05:55 +0800
Message-Id: <20210421090601.730744-5-hsinyi@chromium.org>
X-Mailer: git-send-email 2.31.1.498.g6c1eba8ee3d-goog
In-Reply-To: <20210421090601.730744-1-hsinyi@chromium.org>
References: <20210421090601.730744-1-hsinyi@chromium.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210421_020613_873891_E1AD83B7 
X-CRM114-Status: UNSURE (   9.82  )
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

Kenzo is known as Acer Chromebook 311.

Signed-off-by: Hsin-Yi Wang <hsinyi@chromium.org>
Reviewed-by: Enric Balletbo i Serra <enric.balletbo@collabora.com>
Acked-by: Rob Herring <robh@kernel.org>
---
 Documentation/devicetree/bindings/arm/mediatek.yaml | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/Documentation/devicetree/bindings/arm/mediatek.yaml b/Documentation/devicetree/bindings/arm/mediatek.yaml
index 0870490aa350..7afd01aad964 100644
--- a/Documentation/devicetree/bindings/arm/mediatek.yaml
+++ b/Documentation/devicetree/bindings/arm/mediatek.yaml
@@ -137,9 +137,11 @@ properties:
         items:
           - const: google,damu
           - const: mediatek,mt8183
-      - description: Google Juniper (Acer Chromebook Spin 311)
+      - description: Google Juniper (Acer Chromebook Spin 311) / Kenzo (Acer Chromebook 311)
         items:
-          - const: google,juniper-sku16
+          - enum:
+              - google,juniper-sku16
+              - google,juniper-sku17
           - const: google,juniper
           - const: mediatek,mt8183
       - description: Google Kakadu (ASUS Chromebook Detachable CM3)
-- 
2.31.1.498.g6c1eba8ee3d-goog


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
