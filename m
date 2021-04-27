Return-Path: <SRS0=NJpa=JY=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 21440C433ED
	for <linux-mediatek@archiver.kernel.org>; Tue, 27 Apr 2021 11:16:32 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 72F89613D0
	for <linux-mediatek@archiver.kernel.org>; Tue, 27 Apr 2021 11:16:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 72F89613D0
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=chromium.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=AbH6f7chg/VtFthw1TuIusckpjd+zBA/p8JfEeN5bc0=; b=UfHVFQyg2fCJ4R4+tRs8MIjLi
	haB/rPuZrlqomVWo2rX2ClQW6UnFWP/s/fIt/06nwXl43Rtim+1DENmKkHJJ/h5YziM2Brj9UIB57
	YGQlCYmmH+KWmYiDYOfRbjRu+M91EcLIk7eskkxPCr2GWctELuASEfQ6cMmLstDZsHSZmaLWEaLOF
	w8mF4/7dAuSgKri2KGduPtHogv0Xm0pgNRX7jYgs4fvUAdKOMtpe27eq/WT1qrtMjOQ6QxrUbNDbR
	takWqkpPMWWJ0pM4penvd5w19BXqC6PW9L8mOQj9Ny5z4lhw+k4jx8E/OJAkzyL23cx9dscroS7ye
	M/q7evelQ==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lbLhQ-001TpD-6V; Tue, 27 Apr 2021 11:16:16 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lbLhC-001TlR-4E
 for linux-mediatek@desiato.infradead.org; Tue, 27 Apr 2021 11:16:03 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
 MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender
 :Reply-To:Content-Type:Content-ID:Content-Description;
 bh=po7QYMX2bjP6lmDmZxPgPCLAaN+WesS3W5xew9880lo=; b=yhM7B0EXBIjBe+VIB0mGclFf7j
 l82y+ojtqsqPpWfWXn4oewEDVq9eZh503WS6cM6uWHEmEdzWbmvJLa14qKAnejSxFcoBB1oZ9APlK
 KpEnD9G2SGwSE90fmdytvZFuUS4EaKbGufsbWfAvdgkq15R3DNelHcAwntvVjQ2SJDungEaLxHslu
 ddwfZBJ0zVVAoQTWciJ3+DNqDlwqvspgvS63iMTnF91Rys+CDCtjX7a02U70L79jHTrD1zDLdmPk2
 JFFP7ahxdFgfZkubVPAeIHEbmXY0tFuycgXZs/vfcy+2WEWhc2eFxdCVJjldaNF6no+/ttBY2s1WW
 uNGLUvog==;
Received: from mail-pj1-x1031.google.com ([2607:f8b0:4864:20::1031])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lbLh9-00GgEg-No
 for linux-mediatek@lists.infradead.org; Tue, 27 Apr 2021 11:16:00 +0000
Received: by mail-pj1-x1031.google.com with SMTP id
 b14-20020a17090a6e0eb0290155c7f6a356so97404pjk.0
 for <linux-mediatek@lists.infradead.org>; Tue, 27 Apr 2021 04:15:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=po7QYMX2bjP6lmDmZxPgPCLAaN+WesS3W5xew9880lo=;
 b=Ofb4NdEX3S2iytgtS3/pPlP1K99zNiG+f8OLW8mkhYjYDGZz/hzd/XxTQ0h8To6ezU
 VQTSTTXKkTfKAenI3j6SvdSEPj5FT1ax9kcmCUzO1URw+894GTp83c3LCv8ZfazowJDO
 kggiebZoWJX0/NWqlDyl7MRgc7kRa+3cLS6pA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=po7QYMX2bjP6lmDmZxPgPCLAaN+WesS3W5xew9880lo=;
 b=ZE840rj8RcZAAVkJ+VG44gf2ZuuYNmH/Yulf+3fOjTD4QlcfWpQy5mXOGL7bKLC3wD
 2kz4ysyZ06O7hKsi5V5QOkkrTh347Qmu1nrv501r90DlwHBG0zsCxr3dCaONMgVhIjYH
 fKqbrQL5gX8/G8l1R3SpToo+q4aNoMlYjg4JBzUce+66zg9shxqiee4jpt029adQZaUe
 CW63SDhXoJrq81GWxmh5OTFYhYpisoov6FCedFMpNtWs5T/vkdYuJDF29rfifCq/QgqZ
 4sV6X2Id9f0cctvRXKE7SBqQ6B7qq4Nubhs7f67OtX7p1zeyVLP39ugn+k9+biJoYhY6
 sYZw==
X-Gm-Message-State: AOAM531LHX5aN7LFacNNTOLcDP6/aRN17Ulktdo2+qXZVV3lGyINlK+V
 jTIrJhAS0Od9WHJDw7NHfP3l8A==
X-Google-Smtp-Source: ABdhPJyXeuIoiIttCVmVyb9b58xtxgJ5aD/gCgZSHhItF1eClG5XVDPSa2tdqRuGiCSwTCqpRJoSAQ==
X-Received: by 2002:a17:902:9685:b029:e9:abc1:7226 with SMTP id
 n5-20020a1709029685b02900e9abc17226mr24369400plp.64.1619522159035; 
 Tue, 27 Apr 2021 04:15:59 -0700 (PDT)
Received: from acourbot.tok.corp.google.com
 ([2401:fa00:8f:203:b182:d363:32d0:53a2])
 by smtp.gmail.com with ESMTPSA id c21sm2347210pfc.165.2021.04.27.04.15.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 27 Apr 2021 04:15:58 -0700 (PDT)
From: Alexandre Courbot <acourbot@chromium.org>
To: Tiffany Lin <tiffany.lin@mediatek.com>,
 Andrew-CT Chen <andrew-ct.chen@mediatek.com>,
 Rob Herring <robh+dt@kernel.org>, Yunfei Dong <yunfei.dong@mediatek.com>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>,
 Hans Verkuil <hverkuil-cisco@xs4all.nl>, linux-media@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org,
 Alexandre Courbot <acourbot@chromium.org>
Subject: [PATCH v4 08/15] dt-bindings: media: document mediatek,
 mt8183-vcodec-dec
Date: Tue, 27 Apr 2021 20:15:19 +0900
Message-Id: <20210427111526.1772293-9-acourbot@chromium.org>
X-Mailer: git-send-email 2.31.1.498.g6c1eba8ee3d-goog
In-Reply-To: <20210427111526.1772293-1-acourbot@chromium.org>
References: <20210427111526.1772293-1-acourbot@chromium.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210427_041559_791570_A02F6527 
X-CRM114-Status: UNSURE (   9.95  )
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

MT8183's decoder is instantiated similarly to MT8173's.

Signed-off-by: Alexandre Courbot <acourbot@chromium.org>
---
 Documentation/devicetree/bindings/media/mediatek-vcodec.txt | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/media/mediatek-vcodec.txt b/Documentation/devicetree/bindings/media/mediatek-vcodec.txt
index 06db6837cefd..a2a2a9e2ade3 100644
--- a/Documentation/devicetree/bindings/media/mediatek-vcodec.txt
+++ b/Documentation/devicetree/bindings/media/mediatek-vcodec.txt
@@ -9,6 +9,7 @@ Required properties:
   "mediatek,mt8173-vcodec-enc" for mt8173 avc encoder.
   "mediatek,mt8183-vcodec-enc" for MT8183 encoder.
   "mediatek,mt8173-vcodec-dec" for MT8173 decoder.
+  "mediatek,mt8183-vcodec-dec" for MT8183 decoder.
 - reg : Physical base address of the video codec registers and length of
   memory mapped region.
 - interrupts : interrupt number to the cpu.
-- 
2.31.1.498.g6c1eba8ee3d-goog


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
