Return-Path: <SRS0=c7Bv=H4=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8C05AC433DB
	for <linux-mediatek@archiver.kernel.org>; Fri, 26 Feb 2021 10:02:56 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2A0AA64EE2
	for <linux-mediatek@archiver.kernel.org>; Fri, 26 Feb 2021 10:02:56 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 2A0AA64EE2
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=chromium.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=412io3WQ52j3wXdU2Z5CpkdUxHGjovCmjnNlm/bMJM0=; b=GZqo2shGi4PXR866viu4QW352
	E9DDNUB2/jbrM97plTkQuhA4zaQ/Dd4UWQE1mrOkDh5SOuZR7glVObQI6lxv9t8/AZxOOkHJvYQ8F
	jPnrOW0ZjCf/0CreGTTJuRsASqRrCrytm4VlnHddlfEQtaFZJx/I/LmDwX/lDkF+14bGb0TkbyZAP
	QQeFJ4Pd/ovmQTQPNv+rQMa/bkkDhssoQPElUCvluo7i25gUFbaRTmWLtXLp4COjufBubjHuJ+ovZ
	bdoFMHg2TdIAXdCIa7++PJcvMXzqhoDgdvEcKxB2+pzbD5mI5NZOS33GdiKe6C0lS197+iLn1fxop
	qye0hhfLQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1lFZxC-00081b-KV; Fri, 26 Feb 2021 10:02:34 +0000
Received: from mail-pf1-x435.google.com ([2607:f8b0:4864:20::435])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1lFZx3-0007sz-GW
 for linux-mediatek@lists.infradead.org; Fri, 26 Feb 2021 10:02:29 +0000
Received: by mail-pf1-x435.google.com with SMTP id j24so5941582pfi.2
 for <linux-mediatek@lists.infradead.org>; Fri, 26 Feb 2021 02:02:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=bIALnHOxfqV79rmxtlQVLJ7XQLHlFw9MAesM3ioGoWo=;
 b=SkE9wICXCgToe1dlplqubNyP3Uu5GyOznpHgFFUphOPxG5wwvYBb0L5gJicXqSTLTV
 3Ac+tMUkSMIRQLMJ4lPq+6f0rjI56FUEhJU4ufbx9cBEjxf2BVXQC/r50iRbRiGR6grv
 jTlnI/hQAkqHwBQMFsyay8yLJ1cjyL6RoAdwI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=bIALnHOxfqV79rmxtlQVLJ7XQLHlFw9MAesM3ioGoWo=;
 b=R7B2nrSoOsuPTwWeQoE0GNCz72kyOmN4JKu0+a/rAO1lyr4llipJMuubRx8m8uDlyt
 X+YEHcj5mKE5dbs/ufnH1zntpeO+ONRgi+v77e1gzFWon/Ircxuzkehi42FpQRepf0OI
 fnM6LNy72laapx0piSJgs6oqnZezx5WL3XvoZqzJ2VQXSEh4LL2vJ7fb7zr1B09Og6qw
 hqx57SGYOSl8EgjWyxrMT0ADQo8B4C6TJSb8nUHPP5SN7+BPPWM/0/SDms/dVDYOvOUL
 r8eGrSpgALeXxPoLn+ZSgkWWgGKqF/7IQ75YtOdnprmesAp/2ljNRCK+pCd/Qj104psH
 Wwow==
X-Gm-Message-State: AOAM531Q0hq03BrT2q6kPmECxnEd5TZmuz3A29HFPQVX2povXiPSFgI6
 nUMBc4W1gC0YMqnsWHTqL04ptQ==
X-Google-Smtp-Source: ABdhPJzjj+uNB0y4UHgKTmkt+simNCrzoE6UqpjKQRM99q9y53EZRAREXkmj/1w04TJOFK+adS8shA==
X-Received: by 2002:a62:5344:0:b029:1df:c7d:3c3e with SMTP id
 h65-20020a6253440000b02901df0c7d3c3emr2531720pfb.11.1614333743609; 
 Fri, 26 Feb 2021 02:02:23 -0800 (PST)
Received: from acourbot.tok.corp.google.com
 ([2401:fa00:8f:203:5c91:233c:dd5b:b1b0])
 by smtp.gmail.com with ESMTPSA id o23sm9201565pfp.89.2021.02.26.02.02.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 26 Feb 2021 02:02:23 -0800 (PST)
From: Alexandre Courbot <acourbot@chromium.org>
To: Tiffany Lin <tiffany.lin@mediatek.com>,
 Andrew-CT Chen <andrew-ct.chen@mediatek.com>,
 Rob Herring <robh+dt@kernel.org>, Yunfei Dong <yunfei.dong@mediatek.com>
Subject: [PATCH v3 08/15] dt-bindings: media: document mediatek,
 mt8183-vcodec-dec
Date: Fri, 26 Feb 2021 19:01:41 +0900
Message-Id: <20210226100148.1663389-9-acourbot@chromium.org>
X-Mailer: git-send-email 2.30.1.766.gb4fecdf3b7-goog
In-Reply-To: <20210226100148.1663389-1-acourbot@chromium.org>
References: <20210226100148.1663389-1-acourbot@chromium.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210226_050225_623168_5A7BB621 
X-CRM114-Status: GOOD (  10.97  )
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
Cc: Alexandre Courbot <acourbot@chromium.org>, linux-kernel@vger.kernel.org,
 linux-mediatek@lists.infradead.org, Hans Verkuil <hverkuil-cisco@xs4all.nl>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, linux-media@vger.kernel.org
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
index 8217424fd4bd..30c5888bf2d6 100644
--- a/Documentation/devicetree/bindings/media/mediatek-vcodec.txt
+++ b/Documentation/devicetree/bindings/media/mediatek-vcodec.txt
@@ -7,6 +7,7 @@ Required properties:
 - compatible : "mediatek,mt8173-vcodec-enc" for MT8173 encoder
   "mediatek,mt8183-vcodec-enc" for MT8183 encoder.
   "mediatek,mt8173-vcodec-dec" for MT8173 decoder.
+  "mediatek,mt8183-vcodec-dec" for MT8183 decoder.
 - reg : Physical base address of the video codec registers and length of
   memory mapped region.
 - interrupts : interrupt number to the cpu.
-- 
2.30.1.766.gb4fecdf3b7-goog


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
