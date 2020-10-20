Return-Path: <SRS0=YCpt=D3=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5389DC388F2
	for <linux-mediatek@archiver.kernel.org>; Tue, 20 Oct 2020 15:27:04 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 541A321D6C
	for <linux-mediatek@archiver.kernel.org>; Tue, 20 Oct 2020 15:27:03 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="q2qDwSDB";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="lX/Hn/gp"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 541A321D6C
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=+wH+0uD0kEWdsBrupaacDjzx/BKvT0aClDAgG26WsOo=; b=q2qDwSDBqfiyC/EPYNI+1BfL08
	IeGZSsMc0CTHsPaR5HwFSNrGGm6hNOH5vgtkZoNvezYDCM55tfq6XNx+UeMaV+U1klAU1jBcNPT1q
	63sx8gSDaHnC2RxH7flnK7YS/TodcZ60wneA7jOWNcnffgqVi9cYNmh1J2ITjexxcIm+WlImFCUqa
	+kMoqIpKJ5YtibUhekrUYnPr3RcsJyYjfUTmItJ4gT5xdZAeoQtCUH42oZBKn1/rJLrPDeZhCiAnr
	3XTKLphcKGHuokUx3oAmRV2Dv1/LzdxB5D2R9CG8lY1hmqBIXCi0hBfeUvUDEr4jtTYt8cUlO2HfF
	3Sk2j47w==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kUtXJ-0006U8-Q9; Tue, 20 Oct 2020 15:26:53 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kUtXF-0006TM-Ou; Tue, 20 Oct 2020 15:26:50 +0000
Received: from ziggy.com (unknown [213.195.119.110])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 4FA1921D6C;
 Tue, 20 Oct 2020 15:26:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1603207607;
 bh=4xGtl3FRFn5GI0tSM6nai/BhPtfdAZaAQ5vlpNpkEA4=;
 h=From:To:Cc:Subject:Date:From;
 b=lX/Hn/gpTiWi7/UgZrrIiV4GA4emxvWNP8W1/QOmrch04ZEcpItogKd1IvPZYxa9Z
 LMd+wjo6pauov3cISElVJ3p8bHTVeL7EDv/zPo5c7kKCLlXETNs3Dk7LPYbACnxZx5
 tpB/0yAr2SnQzH/PqKLbov43RN+0oSe5m1DHn91I=
From: matthias.bgg@kernel.org
To: matthias.bgg@gmail.com
Subject: [PATCH] MAINTAINERS: change mediatek wiki page
Date: Tue, 20 Oct 2020 17:26:39 +0200
Message-Id: <20201020152639.21950-1-matthias.bgg@kernel.org>
X-Mailer: git-send-email 2.28.0
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201020_112649_898729_4A817D7C 
X-CRM114-Status: GOOD (  13.29  )
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
Cc: kuohong.wang@mediatek.com, yh.chen@mediatek.com,
 linux-kernel@vger.kernel.org, Miles.Chen@mediatek.com,
 linux-mediatek@lists.infradead.org, Yingjoe.Chen@mediatek.com,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

From: Matthias Brugger <matthias.bgg@gmail.com>

The old wiki page unfortunately got lost by server crash.
The new wiki can be found on the kernel.org infrastructure

Signed-off-by: Matthias Brugger <matthias.bgg@gmail.com>
---
 MAINTAINERS | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/MAINTAINERS b/MAINTAINERS
index 14b8ec0bb58b..7d0088782a9f 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -2067,7 +2067,7 @@ M:	Matthias Brugger <matthias.bgg@gmail.com>
 L:	linux-arm-kernel@lists.infradead.org (moderated for non-subscribers)
 L:	linux-mediatek@lists.infradead.org (moderated for non-subscribers)
 S:	Maintained
-W:	https://mtk.bcnfs.org/
+W:	https://mtk.wiki.kernel.org/
 C:	irc://chat.freenode.net/linux-mediatek
 F:	arch/arm/boot/dts/mt6*
 F:	arch/arm/boot/dts/mt7*
-- 
2.28.0


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
