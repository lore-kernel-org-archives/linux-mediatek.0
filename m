Return-Path: <SRS0=TL3J=AY=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 86A10C433E6
	for <linux-mediatek@archiver.kernel.org>; Mon, 13 Jul 2020 06:09:29 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 53741207BC
	for <linux-mediatek@archiver.kernel.org>; Mon, 13 Jul 2020 06:09:29 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="axFJsDvU";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="GYGiuENf"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 53741207BC
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=chromium.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=l8CJRhPhut9uRBQEU4SXh4QaK2Uz8/boTQfyF4v1lvo=; b=axFJsDvUorA9UWT4u8NZotriq
	v8o9jZyK0HGA5Dm+QeTMV3HqrPPe1VvPRtfWAeaBk8uPwSBCtSvseDzRkJO/9Ty7O7j6OY+5Axlsp
	Cyiym9wRXYwGO3AF7yEosjG6Czx44eq0L0pk/a+YyA0j48GccM5uRwytoJtTGLHfdqrKo2rTpyXgS
	4RNDnkktADJXWN6Y4nOvcE+ICf6REN0WnI3uhDU6aP+4mubJZV7O1zIdyLITGT6xI5EfFiEYn4hir
	e64kfmHocVIMqkYZYKmb4ExNQHhL34vtGUvcxWmUhA8U1Wwy+Yauz7LzQJtnRONuiokp8Q9NAi/+N
	vLdcqNvRQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jureS-0000M6-LR; Mon, 13 Jul 2020 06:09:20 +0000
Received: from mail-pl1-x641.google.com ([2607:f8b0:4864:20::641])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jureP-0000Kk-Vb
 for linux-mediatek@lists.infradead.org; Mon, 13 Jul 2020 06:09:18 +0000
Received: by mail-pl1-x641.google.com with SMTP id x9so5063737plr.2
 for <linux-mediatek@lists.infradead.org>; Sun, 12 Jul 2020 23:09:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=S9AFTK5sy5b65UBrUgiCWog3nZlxaQr2qNRRBWOcbPY=;
 b=GYGiuENfFP6o43mQKJmCtCaiBzvFIFl8M3X6pt8Y/jF3H6QjVXoheulq75HmYFiVwR
 IUdmXt37vxJj1oj2OcUA4oVLgnvoZijJ2pS/ZanKlz3IvmIM/k7mXzIuzZh3h0oeu8Yz
 ApuZ3CsG8HnsQPFM41Vppah/130o7vKdymElo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=S9AFTK5sy5b65UBrUgiCWog3nZlxaQr2qNRRBWOcbPY=;
 b=pm/pjj0EVwsHqRlMzFLOJ2PU1sf5a6M3l1st3QfhAT6mSy1sOZSbbIuotr/aEVJMqS
 lUXQs/UwCfh+y9eX6yA4pTflb3DePy3iiqtU5HRwiylCqHDtLgoxBxlyBocg3Lm4VlJW
 RweMRto1ugFvWgx76HXrC5Gdbz2ULWjnQhSoLjQUEkYZ8wLB7y44L1OpnzSF5BbUPEiX
 B9mFtvOf8NUVnVhD1Xa/nBDIGSc5LDhhoSoZ5Bx11N0nsaU86dcPm2a0yH5BqLAxDHL2
 j7W56tvuD4Z8/OKjDnj0JI5JI798LYTQxf0hygdyi3NtKC9wAgayhXkIRXzpZjb1uJzh
 acAw==
X-Gm-Message-State: AOAM531BSPHBZH+alFXgK3j6C1ibW6x+wf0h7+kIIxbNEyFPn7B4PGPP
 iJueCz65ISpgSmQvGScxdTz6MeHRXOI=
X-Google-Smtp-Source: ABdhPJx3SJkNWmCQs1+GoJ970CROhfFsXeZ9zlBtFpfasuDN/rfouoO4+8wFRudIjRawmBQHkbY/Vg==
X-Received: by 2002:a17:90a:f00d:: with SMTP id
 bt13mr19057042pjb.109.1594620556067; 
 Sun, 12 Jul 2020 23:09:16 -0700 (PDT)
Received: from acourbot.tok.corp.google.com
 ([2401:fa00:8f:203:eeb1:d7ff:fe57:b7e5])
 by smtp.gmail.com with ESMTPSA id c134sm13134934pfc.115.2020.07.12.23.09.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 12 Jul 2020 23:09:15 -0700 (PDT)
From: Alexandre Courbot <acourbot@chromium.org>
To: Tiffany Lin <tiffany.lin@mediatek.com>,
 Andrew-CT Chen <andrew-ct.chen@mediatek.com>,
 Hans Verkuil <hverkuil-cisco@xs4all.nl>,
 Yunfei Dong <yunfei.dong@mediatek.com>,
 Maoguang Meng <maoguang.meng@mediatek.com>
Subject: [PATCH v3 02/16] dt-bindings: media: mtk-vcodec: document SCP node
Date: Mon, 13 Jul 2020 15:08:28 +0900
Message-Id: <20200713060842.471356-3-acourbot@chromium.org>
X-Mailer: git-send-email 2.27.0.383.g050319c2ae-goog
In-Reply-To: <20200713060842.471356-1-acourbot@chromium.org>
References: <20200713060842.471356-1-acourbot@chromium.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200713_020918_034751_3B9A4C45 
X-CRM114-Status: UNSURE (   9.01  )
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
Cc: devicetree@vger.kernel.org, linux-mediatek@lists.infradead.org,
 linux-kernel@vger.kernel.org, Alexandre Courbot <acourbot@chromium.org>,
 linux-media@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

The mediatek codecs can use either the VPU or the SCP as their interface
to firmware. Reflect this in the DT bindings.

Signed-off-by: Alexandre Courbot <acourbot@chromium.org>
Acked-by: Tiffany Lin <tiffany.lin@mediatek.com>
---
 Documentation/devicetree/bindings/media/mediatek-vcodec.txt | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/media/mediatek-vcodec.txt b/Documentation/devicetree/bindings/media/mediatek-vcodec.txt
index b6b5dde6abd8..7aef0a4fe207 100644
--- a/Documentation/devicetree/bindings/media/mediatek-vcodec.txt
+++ b/Documentation/devicetree/bindings/media/mediatek-vcodec.txt
@@ -19,7 +19,9 @@ Required properties:
 - iommus : should point to the respective IOMMU block with master port as
   argument, see Documentation/devicetree/bindings/iommu/mediatek,iommu.txt
   for details.
-- mediatek,vpu : the node of video processor unit
+One of the two following nodes:
+- mediatek,vpu : the node of the video processor unit, if using VPU.
+- mediatek,scp : the noode of the SCP unit, if using SCP.
 
 
 Example:
-- 
2.27.0.383.g050319c2ae-goog


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
