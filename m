Return-Path: <SRS0=eFaK=B7=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 54274C433E3
	for <linux-mediatek@archiver.kernel.org>; Fri, 21 Aug 2020 10:37:11 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 27AF320738
	for <linux-mediatek@archiver.kernel.org>; Fri, 21 Aug 2020 10:37:11 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="YlEYcdk6";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="Bt6juGPb"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 27AF320738
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=chromium.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=YPp4nf15D79pT0VT/Lv5mWlfZ26p3psWI8PidEr9UUw=; b=YlEYcdk6mhXAywvaKUpT3O178
	CUHkHVE37wqYUbau3vCy+io89MrGScKkE4i+re88GpsQ7fjc7/fPO1zuxVaqzNsfZ6GmbU6m0uXiT
	zZck6ZYAWKBh8/xkiTL33M5/lMnP8vBD67RgBaHNpFPe2fnPvrWzRc0nvTsyFK22dLPIyaQSaXr4f
	ps9aAgDW0K6IgVFqxHANtbsbkIaBJnr8o/nbFAzziRqdEtcdauFOWEkSEPxAiFYPRbbUvcNQwsX7s
	FQoCpL01llaw7zMSmoLneQu+Q8/pPtGKzzw/MnNzhkch2au6v29432SLPh8zy3sh78koU58tlgRGx
	/+hFG3W4A==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1k94Pw-0002F6-Bo; Fri, 21 Aug 2020 10:37:04 +0000
Received: from mail-pj1-x1042.google.com ([2607:f8b0:4864:20::1042])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1k94Pt-0002Ci-Mo
 for linux-mediatek@lists.infradead.org; Fri, 21 Aug 2020 10:37:03 +0000
Received: by mail-pj1-x1042.google.com with SMTP id q1so648262pjd.1
 for <linux-mediatek@lists.infradead.org>; Fri, 21 Aug 2020 03:37:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=HTg8ZbMrnEBX6XZbAtw/YXsu/7D2NGL6yCO27qDzwAM=;
 b=Bt6juGPbmaC1G1f3JZE/oHm9QQwPgDr5UQ3A7XNqPAM2EqDMqIbJMMvaI9zGbtYzSb
 FoDLRkep+6Ob8+bLttjezio5g1YDbu5a1XhpuBYQHRjlyT0md+Rpi9mrpHWs8KjxgFfc
 /NJMwiegqrTm2yh5Xue70gONScaWg/TFqN59o=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=HTg8ZbMrnEBX6XZbAtw/YXsu/7D2NGL6yCO27qDzwAM=;
 b=bTULdiJErs/1e9F2RQpHNTgADbZT0JDdkmDHkpTaoo7AVZR4FCZlaP2jqhQaSiAGV6
 iBi+a8rklZfmwejFboKEPO+/TCh389WUrRaCb5sxQ7HLC5tqAAmzj2Yccmt5Cq9V6el3
 oeX55aUtZHgFBhs39jkeN9rb4IKF8vGjVUvyM+Q+Iv35qniAQR1TX7HMgkBME6cYuCs7
 ZQFFwB9o5W1jA0rgBvRVmnVKHIDQO7/CFprhOy0JQmwizFBCy1Toa1uPk7HoxTHlPFfZ
 9Gh2ClQOkzEe1zRS2VkDjJBbCQ0bz+wx/PD8QIHU4PvV+R4tcvrI8EZZl9/pETI11EQT
 Zizg==
X-Gm-Message-State: AOAM532HsBckVs+5/x+sHnYW5Mto9wy2mUgUkut4nX0PfD38qycGr1Pl
 FObJQpo7cTOCtL+A3DvO4qIFFA==
X-Google-Smtp-Source: ABdhPJzN6nDyZup0sLKds7ZZBQYp8QWOg0gvyO+9HOXmutY4wIibEnN9fBRxqOPj3PZtKkGjIYQvxw==
X-Received: by 2002:a17:902:ead2:: with SMTP id
 p18mr1917778pld.259.1598006219865; 
 Fri, 21 Aug 2020 03:36:59 -0700 (PDT)
Received: from acourbot.tok.corp.google.com
 ([2401:fa00:8f:203:eeb1:d7ff:fe57:b7e5])
 by smtp.gmail.com with ESMTPSA id y20sm2081525pfn.183.2020.08.21.03.36.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 21 Aug 2020 03:36:59 -0700 (PDT)
From: Alexandre Courbot <acourbot@chromium.org>
To: Tiffany Lin <tiffany.lin@mediatek.com>,
 Andrew-CT Chen <andrew-ct.chen@mediatek.com>,
 Hans Verkuil <hverkuil-cisco@xs4all.nl>,
 Yunfei Dong <yunfei.dong@mediatek.com>,
 Maoguang Meng <maoguang.meng@mediatek.com>,
 Matthias Brugger <matthias.bgg@gmail.com>
Subject: [PATCH v4 08/17] dt-bindings: media: document mediatek,
 mt8183-vcodec-enc
Date: Fri, 21 Aug 2020 19:35:59 +0900
Message-Id: <20200821103608.2310097-9-acourbot@chromium.org>
X-Mailer: git-send-email 2.28.0.297.g1956fa8f8d-goog
In-Reply-To: <20200821103608.2310097-1-acourbot@chromium.org>
References: <20200821103608.2310097-1-acourbot@chromium.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200821_063701_833558_1EE7E448 
X-CRM114-Status: GOOD (  10.65  )
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
Cc: Rob Herring <robh@kernel.org>, Alexandre Courbot <acourbot@chromium.org>,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-mediatek@lists.infradead.org, linux-media@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

MT8183's encoder is similar to MT8173's.

Signed-off-by: Alexandre Courbot <acourbot@chromium.org>
Acked-by: Rob Herring <robh@kernel.org>
---
 Documentation/devicetree/bindings/media/mediatek-vcodec.txt | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/Documentation/devicetree/bindings/media/mediatek-vcodec.txt b/Documentation/devicetree/bindings/media/mediatek-vcodec.txt
index 99214faede90..8217424fd4bd 100644
--- a/Documentation/devicetree/bindings/media/mediatek-vcodec.txt
+++ b/Documentation/devicetree/bindings/media/mediatek-vcodec.txt
@@ -4,8 +4,9 @@ Mediatek Video Codec is the video codec hw present in Mediatek SoCs which
 supports high resolution encoding and decoding functionalities.
 
 Required properties:
-- compatible : "mediatek,mt8173-vcodec-enc" for encoder
-  "mediatek,mt8173-vcodec-dec" for decoder.
+- compatible : "mediatek,mt8173-vcodec-enc" for MT8173 encoder
+  "mediatek,mt8183-vcodec-enc" for MT8183 encoder.
+  "mediatek,mt8173-vcodec-dec" for MT8173 decoder.
 - reg : Physical base address of the video codec registers and length of
   memory mapped region.
 - interrupts : interrupt number to the cpu.
-- 
2.28.0.297.g1956fa8f8d-goog


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
