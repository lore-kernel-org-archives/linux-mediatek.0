Return-Path: <SRS0=AAZc=AL=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0BE19C433E0
	for <linux-mediatek@archiver.kernel.org>; Tue, 30 Jun 2020 06:28:26 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id CD30020759
	for <linux-mediatek@archiver.kernel.org>; Tue, 30 Jun 2020 06:28:25 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="rIeit77h";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="lsjiIug4"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org CD30020759
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=chromium.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=o7OR9HlvDduBaNvTyfSBnJbVxKwipam9AeY9nTfPFXo=; b=rIeit77hDfsPl6aV+OMt7m51I
	7qJZXJOUIIre4oeE+LiaOUlK8APjs33IdAWlkB6ZUP7Er8MFio3Q/eJxTQmJE5Ajj10GNhfXf4iAC
	DoXvTfa7O6l3SKPyMVGh9339lzfuPf7hHYd0yRm38Fnf9KL2AMY+2uiABtpqL7SA2Yh3Qf6CyX+re
	VZiR9S2heHD+mBANMWJmWKqZ/iavkudpW82bY1nzbWVAgz/w2zZe9PqMWAlfBrvpdSYrtkP6Syxhm
	H6kfHiwnpdZN0+oivLV9Ccy0LMJFmkQ7bYply4pengUGdeTXdKXUXdHoeDgj4OmZ3yzqxxkLYLOYm
	4lzCtFDog==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jq9kf-0006jn-Qf; Tue, 30 Jun 2020 06:28:17 +0000
Received: from mail-pg1-x544.google.com ([2607:f8b0:4864:20::544])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jq9kd-0006gY-MK
 for linux-mediatek@lists.infradead.org; Tue, 30 Jun 2020 06:28:16 +0000
Received: by mail-pg1-x544.google.com with SMTP id d4so9465713pgk.4
 for <linux-mediatek@lists.infradead.org>; Mon, 29 Jun 2020 23:28:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=WrH62sNOsIyA+bZUWvdaT8mtXVgNLKJ4Ma1LMcNUAKU=;
 b=lsjiIug4X6wJnLGMoqdnf2EtlRQdyHztqYifj+F9DWxMaUDWjC6VtcPJIP78h0kPu1
 KmgKxbrCDYhjm7+oQxOXI8pq0zvO3C6GktlJ4Th7zd1Zs3SF0kSjfa05rZ5kXqTVDJtP
 SfRHve4FD0yo4vE1OSWND44Ixw6FZ9l9ufmSc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=WrH62sNOsIyA+bZUWvdaT8mtXVgNLKJ4Ma1LMcNUAKU=;
 b=RTU4YiuPg693r0KGuYOm8AOid+0kvJqzYUr1tOT5y3+IYoxv+izs/vdAJu7wwwBBth
 7b+PuSNm1qrmkiNrjvrqX/JCT4TFjnnSdh1qhA7hQQYR5JHSxShT/RSKaiDFnjFspWaN
 5h8M6Rzij46RAN3CG5dbgg5QBzUkPDAwRCsWiFpFr1JbI0oJ0fZdHmj6tT5WM6pgN76P
 xWTip4+Cbojk0Pva41E1WCnT6S2a85g6GqMK279hgfMwYb9YsUYsjqe545jwxrUvGD4A
 3/zTlmMAbUeuCmAJTHOl4mpDczhKRT0SXoIBqxW6WKVP9XVxkNhSjjyzroJLDtyTUexX
 hlEQ==
X-Gm-Message-State: AOAM533MBJdmeqv69Mg5XKCPlSDX3gJSXgj77eRuNJ7Z6/GFe6gWrk4u
 /Zqy0wfge9Dlrtf9rNdst/tRy+df9Io=
X-Google-Smtp-Source: ABdhPJz3j1bYUqaPRUaPXgTjd0S72OVpblIcbiEiGszIAsdQ2p3a/yRuBNlTRr46ige0lND/m0u8rA==
X-Received: by 2002:a05:6a00:1511:: with SMTP id
 q17mr17923876pfu.16.1593498493649; 
 Mon, 29 Jun 2020 23:28:13 -0700 (PDT)
Received: from acourbot.tok.corp.google.com
 ([2401:fa00:8f:203:93d9:de4d:e834:3086])
 by smtp.gmail.com with ESMTPSA id d1sm1463366pfq.113.2020.06.29.23.28.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 29 Jun 2020 23:28:12 -0700 (PDT)
From: Alexandre Courbot <acourbot@chromium.org>
To: Tiffany Lin <tiffany.lin@mediatek.com>,
 Andrew-CT Chen <andrew-ct.chen@mediatek.com>,
 Rui Wang <gtk_ruiwang@mediatek.com>,
 Yunfei Dong <yunfei.dong@mediatek.com>, Pi-Hsun Shih <pihsun@chromium.org>,
 Maoguang Meng <maoguang.meng@mediatek.com>
Subject: [PATCH 9/9] dt-bindings: media: document mediatek,mt8183-vcodec-dec
Date: Tue, 30 Jun 2020 15:27:11 +0900
Message-Id: <20200630062711.4169601-10-acourbot@chromium.org>
X-Mailer: git-send-email 2.27.0.212.ge8ba1cc988-goog
In-Reply-To: <20200630062711.4169601-1-acourbot@chromium.org>
References: <20200630062711.4169601-1-acourbot@chromium.org>
MIME-Version: 1.0
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

MT8183's decoder is instantiated similarly to MT8173's.

Signed-off-by: Alexandre Courbot <acourbot@chromium.org>
---
 Documentation/devicetree/bindings/media/mediatek-vcodec.txt | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/media/mediatek-vcodec.txt b/Documentation/devicetree/bindings/media/mediatek-vcodec.txt
index 8093335afecb..b844800e0153 100644
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
2.27.0.212.ge8ba1cc988-goog


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
