Return-Path: <SRS0=3R1W=EC=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1E66BC4363A
	for <linux-mediatek@archiver.kernel.org>; Tue, 27 Oct 2020 00:33:59 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B7FDB20882
	for <linux-mediatek@archiver.kernel.org>; Tue, 27 Oct 2020 00:33:58 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="1AMHz3XJ";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="k1ySWKwh";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="I4c2soXx"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org B7FDB20882
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=feMxh8ul70/YCkeb29mezdb29aMd/e0MyoOeB5b2xlU=; b=1AMHz3XJWn/R1x+WszXQZh3wW
	8904b3E7QgwBnqHO4rX5wTVJXD7hNcnLUPjSmiRQF+hEEqB5/RT1jfjKQpdG1vwmM8ZFP0eOZYmSw
	KUhakJrrOT+rHFt4C7To1agMaeBd4stT1jBQEA/6vW14VIqj6/oQh60/8vBNqFlP1Amh7OM79nP5L
	6ME+F0UcxQIDXL9UIZFJxi8W7nHfFJnAMIOSXdIFyYgtgBVtlS5lhCqhMt7JHUEkjG2/0FCknKUK3
	k469GhlPGrdMlSQiPZsVoqPK+Lzuag6Oe/kO3ZrhPf0JXqZiq0+JiiYOzffyL8BdXbIPiMdXTv8yB
	UXCUptGjg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kXCvp-0004J9-Bq; Tue, 27 Oct 2020 00:33:45 +0000
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kXCoE-0000RP-CE; Tue, 27 Oct 2020 00:25:54 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:MIME-Version:
 References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
 Content-Type:Content-ID:Content-Description;
 bh=9htPb5UD1KKE2BZBKYmx1uHUeQy/PVMZD/lZez1RJkE=; b=k1ySWKwhzIfPNTk01WHZRpdOtI
 tgqpv+bRSTsqT/co15w4CWKNBZUL5c4c1Q55xYFhpe48s3fTge/7qhmXLMj6HnnB6UY2q3ljk1tLl
 D2mWJ0b2A075cCLgD+iAiUjQQly2xlE3YA36m7ZPW/XQTlTc2dv4pNVrIpFZKNR0pBm5Jug5WIFgE
 +s2bBEo0XZlho296yI+6gWzIjD1zWHgmZjUrTjhMT3XtnzvBCaNt0c77QU6iSOjZ/MOEyP2ns6M+L
 9MU1D/5DHC9ZCVopvo7jify2aMoMiE4bQ3HEwrbCswI/nAPHB15JuuzrfVbBs1VBXbp6kPKxI7PO2
 rVZFYJ9A==;
Received: from mail.kernel.org ([198.145.29.99])
 by casper.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kXCYx-0008Nc-2l; Tue, 27 Oct 2020 00:10:15 +0000
Received: from sasha-vm.mshome.net (c-73-47-72-35.hsd1.nh.comcast.net
 [73.47.72.35])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 6B6B2217A0;
 Tue, 27 Oct 2020 00:10:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1603757405;
 bh=9D7kmQ3FNBNYxNJKulpvsSrMjLS6gEb8R+lb/VaU9o8=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=I4c2soXxrvi9bOmWQZ407zwANt+63TVc14XecOdjFm9510TzqZaPCKPguGC5I/re7
 KPAqTOBaSiDXL1oMjDLItO/iiWnGnciI94zX4TyazbLDEFhOlMe5ATnbeCh9pCrjMV
 GqP21/GarH59kg6XL5zlwu6OLY/aFnWKJ6t1ist4=
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH AUTOSEL 4.14 15/46] media: platform: Improve queue set up flow
 for bug fixing
Date: Mon, 26 Oct 2020 20:09:14 -0400
Message-Id: <20201027000946.1026923-15-sashal@kernel.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20201027000946.1026923-1-sashal@kernel.org>
References: <20201027000946.1026923-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201027_001007_991624_2397466D 
X-CRM114-Status: GOOD (  12.61  )
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
Cc: Xia Jiang <xia.jiang@mediatek.com>, Sasha Levin <sashal@kernel.org>,
 Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
 Tomasz Figa <tfiga@chromium.org>, linux-mediatek@lists.infradead.org,
 Hans Verkuil <hverkuil-cisco@xs4all.nl>, linux-arm-kernel@lists.infradead.org,
 linux-media@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

From: Xia Jiang <xia.jiang@mediatek.com>

[ Upstream commit 5095a6413a0cf896ab468009b6142cb0fe617e66 ]

Add checking created buffer size follow in mtk_jpeg_queue_setup().

Reviewed-by: Tomasz Figa <tfiga@chromium.org>
Signed-off-by: Xia Jiang <xia.jiang@mediatek.com>
Signed-off-by: Hans Verkuil <hverkuil-cisco@xs4all.nl>
Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/media/platform/mtk-jpeg/mtk_jpeg_core.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/drivers/media/platform/mtk-jpeg/mtk_jpeg_core.c b/drivers/media/platform/mtk-jpeg/mtk_jpeg_core.c
index 46c996936798a..fd9e13500fe7f 100644
--- a/drivers/media/platform/mtk-jpeg/mtk_jpeg_core.c
+++ b/drivers/media/platform/mtk-jpeg/mtk_jpeg_core.c
@@ -579,6 +579,13 @@ static int mtk_jpeg_queue_setup(struct vb2_queue *q,
 	if (!q_data)
 		return -EINVAL;
 
+	if (*num_planes) {
+		for (i = 0; i < *num_planes; i++)
+			if (sizes[i] < q_data->sizeimage[i])
+				return -EINVAL;
+		return 0;
+	}
+
 	*num_planes = q_data->fmt->colplanes;
 	for (i = 0; i < q_data->fmt->colplanes; i++) {
 		sizes[i] = q_data->sizeimage[i];
-- 
2.25.1


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
