Return-Path: <SRS0=TL3J=AY=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CA790C4345D
	for <linux-mediatek@archiver.kernel.org>; Mon, 13 Jul 2020 06:09:47 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9C63920849
	for <linux-mediatek@archiver.kernel.org>; Mon, 13 Jul 2020 06:09:47 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="v572RyBG";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="e9eJSJSi"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 9C63920849
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=chromium.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=njqW7fdzolr9Od+RIOUz9H1HkH+3mEaoIOIQxJ2yoEI=; b=v572RyBGyFpSsOdfJdjK1tkzT
	VTd7/to0imdMqMwq7rO8jO/unpdxdsZEcjSnrJdLedNi7vE4IsOJ6HlK9o2zc6iIGucG+xjs5EY84
	z70Y6yTYtLr+NAfI07eW3wBJak2tfxeffhTW8gzQffamrT+l9ISuE5BxL/m9/TPg4T4UlqBE+hzMe
	BnNJQnP5izeWqghhR8evfdZPFTvTAIlB6dFP4ra/VEl7K3j2frnPdTBLIcf+opnuWh6MtX8jWTm4+
	LYMPCLfA8pVrt1pVvK/3uTj1zptFyJWRmYXbTYxNZm6YPm/zkbNS/ghR03/xPGIBUhetsoSkJYRHD
	6G91+s0HQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jurel-0000VL-Jn; Mon, 13 Jul 2020 06:09:39 +0000
Received: from mail-pj1-x1043.google.com ([2607:f8b0:4864:20::1043])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jurej-0000Sz-7E
 for linux-mediatek@lists.infradead.org; Mon, 13 Jul 2020 06:09:37 +0000
Received: by mail-pj1-x1043.google.com with SMTP id o22so5719873pjw.2
 for <linux-mediatek@lists.infradead.org>; Sun, 12 Jul 2020 23:09:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=B5SJRhGUMLnGQMUFDntsl5BWZJUWM/0k6ncUijg6biA=;
 b=e9eJSJSiGF6WMtv/BO8xgn4y9lS+3engHpcoQj4ttFSeWSlM7pKNQxEcW/PeneO269
 PHRBri/i+spv6QDrGPYwZgYqJXg9yVXafWGAv+QOUxZzmB3iw39KZ4wiGdPewdO+wSte
 z/gW5kkn0iQxcQGOIGluwcOdvFOcANOep/3TU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=B5SJRhGUMLnGQMUFDntsl5BWZJUWM/0k6ncUijg6biA=;
 b=cJejS3yIycEoKaiqeNEAd1WtsXcjHnnAx05BYPVldefOqZ5EyqRcVm6bMCt9dwDieZ
 Ls3QlZs6NzgfADS4hxLSLuDVe8WJsgfNXqc84oj0jkyqRNFHo9cq6kddPku+1HkrGGGI
 jHEKobzWuJ+QGFU15lwmxKnDZack3kw9VOa7+X12kzYmfzHk6KKUF0ZNWZ+zSyfkXKnI
 nMESfZ4BKHbQIqesha+Kmog2Sjaevb2sIURFmODfV1z8OykNRp2k7ugn+2X7+gi6yRkO
 WOoDM8UQ+cK48CYJgWmC6jbfLJbv7I0ZgU7dgQkA2IPL+9rCQtkAmSZPe1eOJiQZJMCL
 pxfQ==
X-Gm-Message-State: AOAM533ZB36c2rUM/BaQF9jfDKwMUm6YxmQ49AnQQt05UWnTIfoJvRgB
 +3UHqYkLK1abm52c570Np7FZCA==
X-Google-Smtp-Source: ABdhPJyfrsgnEB025G3HB/bdasCZtlOPEKmabswNGrrw3Z/BVQ8GGnY3KH9KNkNIzG22M+kR6d/lyg==
X-Received: by 2002:a17:90a:e60b:: with SMTP id
 j11mr18907748pjy.189.1594620575272; 
 Sun, 12 Jul 2020 23:09:35 -0700 (PDT)
Received: from acourbot.tok.corp.google.com
 ([2401:fa00:8f:203:eeb1:d7ff:fe57:b7e5])
 by smtp.gmail.com with ESMTPSA id c134sm13134934pfc.115.2020.07.12.23.09.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 12 Jul 2020 23:09:34 -0700 (PDT)
From: Alexandre Courbot <acourbot@chromium.org>
To: Tiffany Lin <tiffany.lin@mediatek.com>,
 Andrew-CT Chen <andrew-ct.chen@mediatek.com>,
 Hans Verkuil <hverkuil-cisco@xs4all.nl>,
 Yunfei Dong <yunfei.dong@mediatek.com>,
 Maoguang Meng <maoguang.meng@mediatek.com>
Subject: [PATCH v3 08/16] dt-bindings: media: document mediatek,
 mt8183-vcodec-enc
Date: Mon, 13 Jul 2020 15:08:34 +0900
Message-Id: <20200713060842.471356-9-acourbot@chromium.org>
X-Mailer: git-send-email 2.27.0.383.g050319c2ae-goog
In-Reply-To: <20200713060842.471356-1-acourbot@chromium.org>
References: <20200713060842.471356-1-acourbot@chromium.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200713_020937_329182_5F527B11 
X-CRM114-Status: UNSURE (   8.86  )
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

MT8183's encoder is similar to MT8173's.

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
2.27.0.383.g050319c2ae-goog


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
