Return-Path: <SRS0=i2Ig=7C=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DFA67C433E0
	for <linux-mediatek@archiver.kernel.org>; Wed, 20 May 2020 08:28:38 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id AFB6E207ED
	for <linux-mediatek@archiver.kernel.org>; Wed, 20 May 2020 08:28:38 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="StDqrILC";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="NxYuD+W0"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org AFB6E207ED
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=chromium.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=CgGZDU80OaSWE4AEm1tXwEmSgui/KLhUJrUb2gwbDT0=; b=StDqrILCMJD+9N
	nM14qyPJL9i1rom4x+C3u8EpXHRf6Pt1ujPj8igrHSvUdDS/XBNqiv2FZlfW0BZdrKDmu0hPOnUOZ
	o38VAoe+G0AKClu2bEPhv1PO6fMzmFo+9zUBFnhHdgIcT7CgKziIeBdchlqwfgRVBLNCbVgskPxxM
	PGy92Dlm4UoVyv2cDyPNocKy6EW/dSRRM9kgZikJK46uzM+gqeqq/TEgXcuw2nHdZQIdJOUcJJXzd
	DPGx1TOOO9VnZzZok9x/EwUr3ATpgPMmDhWL3kfG3jWruRVg5HoKwhSjBVfcuqpUH2UYNs/r8Mzl8
	uIgt+MtCP+PE/sU6G1pA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jbK5T-0002yE-Ob; Wed, 20 May 2020 08:28:27 +0000
Received: from mail-pf1-x444.google.com ([2607:f8b0:4864:20::444])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jbK5I-0002jw-3I
 for linux-mediatek@lists.infradead.org; Wed, 20 May 2020 08:28:20 +0000
Received: by mail-pf1-x444.google.com with SMTP id y18so1195557pfl.9
 for <linux-mediatek@lists.infradead.org>; Wed, 20 May 2020 01:28:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=AFsCpw0e2sBJ3SKzImAxY1nX0ns77l6D7lZ5pyXVq7c=;
 b=NxYuD+W0eHByIVffmtX4cSE7Q15AfQjBOiJE0aaMyKH5qn8hRwM5tVCX+EYAbDZH54
 qFIOrLUElAH7aRgCsYUmbLYaOkS4LIg2VhrzWH6UchyRtXem6pBKNr0u9yy8yT20OjJW
 LY20zeuWDmsjsQyjkW43bgAIlBvCd1kVB0GpQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=AFsCpw0e2sBJ3SKzImAxY1nX0ns77l6D7lZ5pyXVq7c=;
 b=BA5EgokBpR2FoZ4f3gdJ5hfgSHRp6YlK6VaJqYrV2oPhyQ1TrvdR4XTWPOfrI/MmCK
 Ev9ikijB8k1Zohqsc84QU6H6vrBIV3K8LCpop3QqMO8pmlWjCT6rfbTvwettRGl59EeI
 5PORu9RjL0Xn1iLsJoYyTfnPfRtguUE7W/PsPelYVH9cv9YXoFbQ7xZwuVSz2vA820wL
 dBB9fZwHhW14TDiraGhYNPbU8SDTAdj8+0OSgFY4QU2DVc10aa1XVH9FCoect4HNQzn3
 gl58QWcdKkPOSPoHhu3WH+680rgShffvHAehA5H5WEoQeSOoWrDurMRQoij0e9Q7rBy0
 QZpA==
X-Gm-Message-State: AOAM530RfHzUkZGlh2/BxPFfa4IjCNVg1l0RLks+GCiF3JLH3fIfsoc0
 5ZDXBz+bLA5dxj4ZzWCGW9+/DA==
X-Google-Smtp-Source: ABdhPJwolvvdLtZTp/E/v1cgUwBNoOO4dJkGghCUnaIE6/nVSj9qiTNvax2QtVKvxMZxYBPTADizHQ==
X-Received: by 2002:a62:14d6:: with SMTP id 205mr3261015pfu.75.1589963295152; 
 Wed, 20 May 2020 01:28:15 -0700 (PDT)
Received: from acourbot.tok.corp.google.com
 ([2401:fa00:8f:203:93d9:de4d:e834:3086])
 by smtp.gmail.com with ESMTPSA id gg8sm1447775pjb.39.2020.05.20.01.28.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 20 May 2020 01:28:14 -0700 (PDT)
From: Alexandre Courbot <acourbot@chromium.org>
To: Tiffany Lin <tiffany.lin@mediatek.com>,
 Andrew-CT Chen <andrew-ct.chen@mediatek.com>,
 Rui Wang <gtk_ruiwang@mediatek.com>,
 Yunfei Dong <yunfei.dong@mediatek.com>, Pi-Hsun Shih <pihsun@chromium.org>,
 Maoguang Meng <maoguang.meng@mediatek.com>
Subject: [PATCH 10/10] media: dt-bindings: mtk-vcodec: document mediatek,
 mt8183-vcodec-enc
Date: Wed, 20 May 2020 17:27:23 +0900
Message-Id: <20200520082723.96136-11-acourbot@chromium.org>
X-Mailer: git-send-email 2.26.2.761.g0e0b3e54be-goog
In-Reply-To: <20200520082723.96136-1-acourbot@chromium.org>
References: <20200520082723.96136-1-acourbot@chromium.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200520_012816_185931_5FB153AD 
X-CRM114-Status: UNSURE (   9.38  )
X-CRM114-Notice: Please train this message.
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
Cc: linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org,
 Alexandre Courbot <acourbot@chromium.org>, linux-media@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Support for the MT8183 encoder has been added, document the
corresponding DT bindings.

Signed-off-by: Alexandre Courbot <acourbot@chromium.org>
---
 Documentation/devicetree/bindings/media/mediatek-vcodec.txt | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/Documentation/devicetree/bindings/media/mediatek-vcodec.txt b/Documentation/devicetree/bindings/media/mediatek-vcodec.txt
index 7aef0a4fe207..8093335afecb 100644
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
2.26.2.761.g0e0b3e54be-goog


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
