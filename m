Return-Path: <SRS0=3MyJ=C3=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 649A1C43464
	for <linux-mediatek@archiver.kernel.org>; Fri, 18 Sep 2020 15:24:50 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 028B320717
	for <linux-mediatek@archiver.kernel.org>; Fri, 18 Sep 2020 15:24:49 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="NBJ4OzUb"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 028B320717
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=canonical.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=ZXKRRIUrLkFZyr1SyGrwkMm5kE69oa9z/pJaHypxZtA=; b=NBJ4OzUb326/boZ5sj6ix67A4X
	+m2j6DhFSBpXqkuhuVch3NBI4tqIfa2lQSsxHe48xp6soyunDUWSUa2lApWdEMl2LcDzcAOwMtCI4
	MwoyoFAWkcgPG5Ky6qySC7JIVZakEAiyhdHWIPmcMqBVQW65OJpqsX2yR5plf1PBdDcfttueGeN8E
	jWdxDcPxtQT1i1VGqoXx8wUjkML9xNOBJWxF8RvWHUVwnXuqArf0yOQWWMJsY49pmUwMveHwMcohY
	XvFJiBv/kT2w9rHKr0ZcVhipz3Snxh37XA3WF5JhiiGsZH7wvAFJBIyYBavdGmlgAaOP+vyHEkR1c
	ML5nuYXg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kJIFe-00040A-Gp; Fri, 18 Sep 2020 15:24:42 +0000
Received: from youngberry.canonical.com ([91.189.89.112])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kJIFZ-0003yo-Tq; Fri, 18 Sep 2020 15:24:38 +0000
Received: from 1.general.cking.uk.vpn ([10.172.193.212] helo=localhost)
 by youngberry.canonical.com with esmtpsa
 (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.86_2)
 (envelope-from <colin.king@canonical.com>)
 id 1kJIFQ-000436-Jm; Fri, 18 Sep 2020 15:24:28 +0000
From: Colin King <colin.king@canonical.com>
To: Ohad Ben-Cohen <ohad@wizery.com>,
 Bjorn Andersson <bjorn.andersson@linaro.org>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Pi-Hsun Shih <pihsun@chromium.org>, Erin Lo <erin.lo@mediatek.com>,
 Nicolas Boichat <drinkcat@chromium.org>, linux-remoteproc@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org
Subject: [PATCH] remoteproc/mediatek: fix null pointer dereference on null scp
 pointer
Date: Fri, 18 Sep 2020 16:24:28 +0100
Message-Id: <20200918152428.27258-1-colin.king@canonical.com>
X-Mailer: git-send-email 2.27.0
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200918_112438_046375_33E119AF 
X-CRM114-Status: GOOD (  11.23  )
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
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

From: Colin Ian King <colin.king@canonical.com>

Currently when pointer scp is null a dev_err is being called that
references the pointer which is the very thing we are trying to
avoid doing. Remove the extraneous error message to avoid this
issue.

Addresses-Coverity: ("Dereference after null check")
Fixes: 63c13d61eafe ("remoteproc/mediatek: add SCP support for mt8183")
Signed-off-by: Colin Ian King <colin.king@canonical.com>
---
 drivers/remoteproc/mtk_scp_ipi.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/drivers/remoteproc/mtk_scp_ipi.c b/drivers/remoteproc/mtk_scp_ipi.c
index 3d3d87210ef2..58d1d7e571d6 100644
--- a/drivers/remoteproc/mtk_scp_ipi.c
+++ b/drivers/remoteproc/mtk_scp_ipi.c
@@ -30,10 +30,8 @@ int scp_ipi_register(struct mtk_scp *scp,
 		     scp_ipi_handler_t handler,
 		     void *priv)
 {
-	if (!scp) {
-		dev_err(scp->dev, "scp device is not ready\n");
+	if (!scp)
 		return -EPROBE_DEFER;
-	}
 
 	if (WARN_ON(id >= SCP_IPI_MAX) || WARN_ON(handler == NULL))
 		return -EINVAL;
-- 
2.27.0


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
