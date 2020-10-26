Return-Path: <SRS0=3R1W=EC=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 94100C2D0A3
	for <linux-mediatek@archiver.kernel.org>; Tue, 27 Oct 2020 00:00:54 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2622920773
	for <linux-mediatek@archiver.kernel.org>; Tue, 27 Oct 2020 00:00:54 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="to5jw0VW";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="cwvuMTXt";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="1xKyEYVi"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 2622920773
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=fyvSBk2ILKj1cYrEUBd61LfPbnExQhv3qKmsJlOHFqE=; b=to5jw0VWao1lsT80prkxUrT6v
	d1Mjum3Ndj9Ygaxy4W5ie3F0r1d6wGBUTsG4UUkO0A1gLsKYhpdCXvUZGyGZBSQHX7dKXg74OPRQA
	mUkAf9pi6j6wo+ddJbzSW4g4qUkN3E56C61ROU5YSXwtzzLXgQV2Eu34S7Xesu/Y/M4yV1V7sRlg6
	+FLP/8TVteRNKHjmgyYwGS8J8a4DDI9dOyI0tfBaDQthkOcn3lzm5Pu4F5clXaZUTisjcJX46dw5i
	u0a1m2dwc4B2ndSCrwtlnipgSLLjYXj64qPPHGGqc/xHOwnhh1+92Vq8PFCFouca2AOpT+4TYoq6t
	RHOjiOlkQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kXCPq-00065B-6o; Tue, 27 Oct 2020 00:00:42 +0000
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kXCIO-0002NU-QE; Mon, 26 Oct 2020 23:53:01 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:MIME-Version:
 References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
 Content-Type:Content-ID:Content-Description;
 bh=ijwF6JrkpHgAaPVSgf9Jb79+RPb4HtSYf+K+ldru5Us=; b=cwvuMTXtkQO1BXqydY0Xm7rXoV
 sQGdwyd0CiGbrlm6lJzu3jctEwwhvZLCXg5+NoxPzpYlc03IOZ9U+RyjaG7sSkPaA08OFXUKFenA1
 oYeImc7PuO+5S+4AYfKaxDGru0kvG2SvgZFCx2yjMnForVx5H1QIqbtawDBOPEeLeBFnN2Hqq7838
 T0TynmfBnu5f+XZrYiunvfJ3BYaOQKkW5dqtuLmJ0BgtcXJ6ZLbHp1VYGx4i6cLsxKg9kq9m8Advy
 azGn92Vjb9aZaON+Poi00TJ4ftXKTW7Lf4QpbY6oDgH80RvfZ93kE3CxMRv1BVjy0Aj/wCJ7Fntf8
 rHd8UKVA==;
Received: from mail.kernel.org ([198.145.29.99])
 by casper.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kXCIJ-0006Cz-QX; Mon, 26 Oct 2020 23:52:58 +0000
Received: from sasha-vm.mshome.net (c-73-47-72-35.hsd1.nh.comcast.net
 [73.47.72.35])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 21C072225C;
 Mon, 26 Oct 2020 23:52:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1603756374;
 bh=S2MHAPoe+Fmcjs3Mdb0IAiTXN/hDS47FXlvqopW9HD8=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=1xKyEYVirbm7Ag3hcuWiQPfmGmLwfYyk9UiUmOkpuhygRORheZqjrhOuFyg9XfETl
 p9YqOQGdcN/v6j6/6NINk1A6WLFjcDbNyydC8KrW9XoYJ+TRK5SVPE7IDbrXFGUC8H
 8k0DFf8Se4yADUH/Y7BxpPx/FQHlnmyeFf6K2utE=
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH AUTOSEL 5.8 040/132] media: platform: Improve queue set up
 flow for bug fixing
Date: Mon, 26 Oct 2020 19:50:32 -0400
Message-Id: <20201026235205.1023962-40-sashal@kernel.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20201026235205.1023962-1-sashal@kernel.org>
References: <20201026235205.1023962-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201026_235256_166927_2DFC2255 
X-CRM114-Status: GOOD (  12.56  )
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
index f82a81a3bdee2..c4b16dc2c0161 100644
--- a/drivers/media/platform/mtk-jpeg/mtk_jpeg_core.c
+++ b/drivers/media/platform/mtk-jpeg/mtk_jpeg_core.c
@@ -571,6 +571,13 @@ static int mtk_jpeg_queue_setup(struct vb2_queue *q,
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
