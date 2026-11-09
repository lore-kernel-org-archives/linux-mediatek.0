Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AB940606A332
	for <linux-mediatek@archiver.kernel.org>; Mon,  9 Nov 2026 06:10:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=KHrZrRQg;
	dkim=pass (1024-bit key) header.d=cmss.chinamobile.com header.i=@cmss.chinamobile.com header.a=rsa-sha256 header.s=default header.b=xVBy4/HL
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=kHmCaYxfDHn8K47bQjI+v/3u5wpeXFxvlLdiSYaq980=; b=KHrZrRQgooxTRAcAKFRmgojLeu
	TmsEtihMbNLbNxf4y/ix7zNTPhyoBriHwSnxE0U66yzcOQ43q88+UUYvWNB26u78GEQyyo9jPcoqX
	x/gMHkff0xPOru/BM6lsjwQD+ygEtPU0dq0/j/TSNupdl4SRzrb8Omahs+eYMe4eWLvbT143lAZUu
	49p2e/MfdcUnSh4Vc6oojYnYlNQz9xfF1n/da8BKfMtJrhozmwLqI2rkWWyCY50TB0AraqfB3SpR6
	pmn9+jjCE7aOapDfBMMhJ8U8MvVEL2qec8ycIeV9VSgGdusHqDvel48tTFnpQ4yFcyKenb2Gqcwgu
	YtcgL2UA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQIaC-0000000HTde-3RWI;
	Mon, 09 Nov 2026 06:10:20 +0000
Received: from cmccmta4.chinamobile.com ([111.22.67.137])
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQIa7-0000000HTdB-49fg
	for linux-mediatek@lists.infradead.org;
	Mon, 09 Nov 2026 06:10:19 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=cmss.chinamobile.com; s=default; l=0;
	h=from:subject:message-id:to:cc:mime-version;
	bh=47DEQpj8HBSa+/TImW+5JCeuQeRkm5NMpJWZG3hSuFU=;
	b=xVBy4/HL0A9+2H31cSsWHvQHnP9gbSDrHiAM8fkJn46Knr2s+E3JXEyNiJ+R74/9Yncq8NkdHvvkH
	 FwT9/mxIchDiYyvh3AmiyN1wmzJJ01DI/omGOyFdbl/WHknMzBBRYjZdL33kB42Pp0libmrTH+qKRN
	 e3dUBGSkRC6l7c7I=
X-RM-TagInfo: emlType=0                                       
X-RM-SPAM-FLAG: 00000000
Received: from spf.mail.chinamobile.com (unknown[10.188.0.87])
	by rmmx-syy-dmz-app08-12008 (RichMail) with SMTP id 2ee86af163bf240-612f2;
	Mon, 09 Nov 2026 14:10:08 +0800 (CST)
X-RM-TRANSID: 2ee86af163bf240-612f2
X-RM-TagInfo: emlType=0                                       
X-RM-SPAM-FLAG: 00000000
Received: from Z04181456177947 (unknown[10.55.1.71])
	by rmsmtp-syy-appsvr10-12010 (RichMail) with SMTP id 2eea6af163bfd18-8376f;
	Mon, 09 Nov 2026 14:10:08 +0800 (CST)
X-RM-TRANSID: 2eea6af163bfd18-8376f
From: Zhao Feng <zhaofeng2@cmss.chinamobile.com>
To: Bin Liu <bin.liu@mediatek.com>,
	linux-media@vger.kernel.org,
	linux-mediatek@lists.infradead.org
Cc: linux-kernel@vger.kernel.org,
	Zhao Feng <zhaofeng2@cmss.chinamobile.com>,
	stable@vger.kernel.org
Subject: [PATCH] media: mtk-jpeg: fix runtime PM leak in mtk_jpeg_dec_device_run()
Date: Mon,  9 Nov 2026 14:10:06 +0800
Message-ID: <20261109061006.1043-1-zhaofeng2@cmss.chinamobile.com>
X-Mailer: git-send-email 2.55.0.windows.5
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261108_221017_045381_3ACD411D 
X-CRM114-Status: GOOD (  10.33  )
X-Spam-Score: -2.4 (--)
X-BeenThere: linux-mediatek@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-mediatek.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-mediatek/>
List-Post: <mailto:linux-mediatek@lists.infradead.org>
List-Help: <mailto:linux-mediatek-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mediatek>,
 <mailto:linux-mediatek-request@lists.infradead.org?subject=subscribe>
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
X-Spam-Status: No, score=-16.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

mtk_jpeg_dec_device_run() takes a runtime PM reference with
pm_runtime_resume_and_get() and releases it in mtk_jpeg_dec_irq()
after the hardware signals completion.  If mtk_jpeg_set_dec_dst()
fails, however, the function jumps to dec_end without ever starting
the hardware, so the interrupt never fires and the PM reference is
leaked, keeping the device runtime-resumed forever.

mtk_jpeg_set_dec_dst() returns -EINVAL when the component count or
the per-component plane sizes parsed from the JPEG header do not
match the destination buffer, so the leak is reachable from
userspace with a crafted bitstream.

Drop the reference before jumping to dec_end.

Fixes: 5827e4b14ee7 ("media: platform: Improve power on and power off flow")
Cc: stable@vger.kernel.org
Signed-off-by: Zhao Feng <zhaofeng2@cmss.chinamobile.com>
---
Verified against current upstream master.  The multi-core decode
worker handles the same failure correctly (setdst_end/clk_end path
does pm_runtime_put()); only the single-core device_run misses it.
Not runtime-tested (no MediaTek JPEG hardware).

 drivers/media/platform/mediatek/jpeg/mtk_jpeg_core.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/media/platform/mediatek/jpeg/mtk_jpeg_core.c b/drivers/media/platform/mediatek/jpeg/mtk_jpeg_core.c
--- a/drivers/media/platform/mediatek/jpeg/mtk_jpeg_core.c
+++ b/drivers/media/platform/mediatek/jpeg/mtk_jpeg_core.c
@@ -1011,6 +1011,8 @@ static void mtk_jpeg_dec_device_run(void *priv)
 
 	mtk_jpeg_set_dec_src(ctx, &src_buf->vb2_buf, &bs);
-	if (mtk_jpeg_set_dec_dst(ctx, &jpeg_src_buf->dec_param, &dst_buf->vb2_buf, &fb))
+	if (mtk_jpeg_set_dec_dst(ctx, &jpeg_src_buf->dec_param, &dst_buf->vb2_buf, &fb)) {
+		pm_runtime_put(jpeg->dev);
 		goto dec_end;
+	}
 
 	schedule_delayed_work(&jpeg->job_timeout_work,
-- 
2.39.2




