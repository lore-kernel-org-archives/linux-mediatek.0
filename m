Return-Path: <SRS0=o4uA=FA=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B6206C56201
	for <linux-mediatek@archiver.kernel.org>; Thu, 26 Nov 2020 03:09:21 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9C1F021534
	for <linux-mediatek@archiver.kernel.org>; Thu, 26 Nov 2020 03:09:20 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="c4JR4As6";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="BM3vd/ZF"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 9C1F021534
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=chromium.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=IOWeCDVPfy9Vd0x8UYVA7zZYAxNxa0fRZussAfKuuVM=; b=c4JR4As6DxVYhshGPUUtHf1RUq
	V/bWIM5ejzDlzMYqNreAiWVwwc72lf5eGTkiPe1Z8Oulhice07pzA5dr+bXv4VAn8vCQSRH7CUyfi
	gXJrH+gs5C9XrZzSXMQX18oQerTdPfvipWiTl+rb0LZXoJzeaMn/wCgBPlIOXwuNTeaCdGdcyf6ga
	CxxBNEzQYfTHvFHuX3wKVvTD2dhthR3UaaEI0sbWwNUzRZG+s3o3LBNI+UnJq95xumv+MiCf0GPeP
	223Is5buVCvZxKsZP682kqEoRwUlnWcw3/5WepDXluyNKB1A6DcbtctB1LEUIqxiAlxIOyxHspQ2n
	WHEJdnvg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1ki7ea-0007Wi-0l; Thu, 26 Nov 2020 03:09:07 +0000
Received: from mail-pf1-x444.google.com ([2607:f8b0:4864:20::444])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1ki7eX-0007Vk-BZ
 for linux-mediatek@lists.infradead.org; Thu, 26 Nov 2020 03:09:02 +0000
Received: by mail-pf1-x444.google.com with SMTP id n137so360882pfd.3
 for <linux-mediatek@lists.infradead.org>; Wed, 25 Nov 2020 19:08:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=atnJehQZVO119pd4VO6r7q8kYsvyqoBTmsMlSh7A/i8=;
 b=BM3vd/ZFTSIIrKiVzBBNSfoocvC2mblhZ+0r6qJV9fNEKYFCP90dXn3R9CA4G5/2pW
 C99fiMkTeWf0gmDuqNgO58YNoGNW1I2ngQc3mvSf6PCpZpMlhxlsTxuUVEldMDeg00F8
 f2LEf6I/A7CjN2hp8bOumSlFwDFEcFucwQ3L0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=atnJehQZVO119pd4VO6r7q8kYsvyqoBTmsMlSh7A/i8=;
 b=bIrw/ZfCMW1cPvvPrzC0Vx1NBFdq2zq2jmu+CIFuV9gpGNEJ46KlX9gQw1hQTATEoH
 W0k6UQXoOl54SSnUixBgN3I0wT5Zl5TzE1uKwMQIIKJl5LuUr6w6/mnbkYLFH0zjMDmZ
 eSAGfjNKCvn0U2T5TkhjmnmnhbQr9CyrknvKUDbiZQmMdJW4j/izaSOaduz2y7bBUJvH
 dV4M1a53FTs88RLcCbpxCyYju6P/ldYXPiM/R1nPPgcitvVx12UM9WKz5j/y2xQuGph5
 diGBOZ2gZ968+rC6M+AZ3Dg59erwDkBdlwYodWFtLAukJcgjXTnTkTf0F2VEuwBPcn6B
 wPew==
X-Gm-Message-State: AOAM531NXuzkmxYo8XEmog+eYldtRlXghjldxArebDJX7yO1nnHHkxcf
 jplrsewpN89WEbrdLddpHJ/n/w==
X-Google-Smtp-Source: ABdhPJyAC2YiZ6o3LkjuCB38jzADK3Pw3TNqQRc+UnVcBfB1j9l5XRJ1Br9UH0oCUYWbT3uXJ1Z9ww==
X-Received: by 2002:a17:90b:30cb:: with SMTP id
 hi11mr1119711pjb.94.1606360131611; 
 Wed, 25 Nov 2020 19:08:51 -0800 (PST)
Received: from localhost.localdomain ([120.152.32.152])
 by smtp.gmail.com with ESMTPSA id y9sm4323663pjj.8.2020.11.25.19.08.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 25 Nov 2020 19:08:51 -0800 (PST)
From: Evan Benn <evanbenn@chromium.org>
To: linux-media@vger.kernel.org
Subject: [PATCH] media: mtk-vcodec: Fix order of log arguments
Date: Thu, 26 Nov 2020 14:08:42 +1100
Message-Id: <20201126140839.1.I723c6846bc6913bd0831a78874aa767dcbdae470@changeid>
X-Mailer: git-send-email 2.29.2.454.gaff20da3a2-goog
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201125_220901_542584_6B1AEF0B 
X-CRM114-Status: GOOD (  12.71  )
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
Cc: Andrew-CT Chen <andrew-ct.chen@mediatek.com>,
 Tiffany Lin <tiffany.lin@mediatek.com>, linux-kernel@vger.kernel.org,
 Evan Benn <evanbenn@chromium.org>, Matthias Brugger <matthias.bgg@gmail.com>,
 linux-mediatek@lists.infradead.org, Mauro Carvalho Chehab <mchehab@kernel.org>,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Signed-off-by: Evan Benn <evanbenn@chromium.org>

---

 drivers/media/platform/mtk-vcodec/mtk_vcodec_intr.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/media/platform/mtk-vcodec/mtk_vcodec_intr.c b/drivers/media/platform/mtk-vcodec/mtk_vcodec_intr.c
index a3c7a380c9308..785ec0df445ec 100644
--- a/drivers/media/platform/mtk-vcodec/mtk_vcodec_intr.c
+++ b/drivers/media/platform/mtk-vcodec/mtk_vcodec_intr.c
@@ -27,11 +27,11 @@ int mtk_vcodec_wait_for_done_ctx(struct mtk_vcodec_ctx  *ctx, int command,
 
 	if (!ret) {
 		status = -1;	/* timeout */
-		mtk_v4l2_err("[%d] cmd=%d, ctx->type=%d, wait_event_interruptible_timeout time=%ums out %d %d!",
+		mtk_v4l2_err("[%d] ctx->type=%d, cmd=%d, wait_event_interruptible_timeout time=%ums out %d %d!",
 				ctx->id, ctx->type, command, timeout_ms,
 				ctx->int_cond, ctx->int_type);
 	} else if (-ERESTARTSYS == ret) {
-		mtk_v4l2_err("[%d] cmd=%d, ctx->type=%d, wait_event_interruptible_timeout interrupted by a signal %d %d",
+		mtk_v4l2_err("[%d] ctx->type=%d, cmd=%d, wait_event_interruptible_timeout interrupted by a signal %d %d",
 				ctx->id, ctx->type, command, ctx->int_cond,
 				ctx->int_type);
 		status = -1;
-- 
2.29.2.454.gaff20da3a2-goog


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
