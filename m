Return-Path: <SRS0=J0Vt=4N=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 38A6AC35E01
	for <linux-mediatek@archiver.kernel.org>; Tue, 25 Feb 2020 17:25:11 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id ECFEE2051A
	for <linux-mediatek@archiver.kernel.org>; Tue, 25 Feb 2020 17:25:10 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="QoDRiVgr";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="ltTXZwDq"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org ECFEE2051A
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=chromium.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:To
	:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=cz90zpH2S2hwyNll9Ci3v9EM5B+vAqNBDxjct1hGxxE=; b=QoDRiVgrznDI+z
	tx2nziQXFp2jkOOUTEuXb3pw/JVYJ9Uu/rY/iacWvkbq1ltTbm0o7jh/dMWbZtEQKQKQELCA0ohgA
	IexAD5kXisqPGuMTJnZmLQXkt+7Vesh8b4qEDXynpNM4BNQSbsoVvoAEA794FHkXvBXFgIBXFn8Rp
	7vp0sZD7CCzkpN+VNCl2YwZDOYwlIUWq9Fj4qfBjLT2yEVk0k9phS8Yj1B3fF6dHcYvBhX+INKkf9
	Wr77SAoYmNhEiyru4ElfvRExu1GJR1ClSbt4rhnQ4FB5sjmbXS52GBarkS6t64/rRCRXvje4VUkDK
	1CVoU3bHLbRCJ4ZsQp6Q==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1j6dx3-0003MD-2f; Tue, 25 Feb 2020 17:24:57 +0000
Received: from mail-pf1-x443.google.com ([2607:f8b0:4864:20::443])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1j6dwr-0003CC-NL
 for linux-mediatek@lists.infradead.org; Tue, 25 Feb 2020 17:24:47 +0000
Received: by mail-pf1-x443.google.com with SMTP id s1so7532280pfh.10
 for <linux-mediatek@lists.infradead.org>; Tue, 25 Feb 2020 09:24:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=lfotpKjLU7BxU2unCoAL0OLP6JpkqZvfhxJOwfxAYmg=;
 b=ltTXZwDqi3bj0f4va6iSNa+noIAQ6niJVSGeslx5czOaMstk4QGvtQQBXCIA5DdolR
 n4MHGW+hII0IRLuu5vH5+ECcXvVBUIxDWvuiepyhTBqQbzFDKU5Eg6L51TGu0NJl6T2d
 4Aj3Fnggf+FTY9ad5BqpOrZyLPt3CvCy1aEd8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=lfotpKjLU7BxU2unCoAL0OLP6JpkqZvfhxJOwfxAYmg=;
 b=k6G2Ve1c98mCzzeiKFU+UOEQqa2HdMifTcfl6mbRi3zZ7m14Rn0jrqsCrCAipKavHq
 4M3CDtqqgBZvu0YKa+EjD2EP5KvXJ+LbsOiWK+4lNOPJ5fyKpbwBQJns2yntwynqiY2G
 eubQ+3PfymNRmJWUJ6pkuwOmFhLIztmr4JMbt8YUEBfizyUfkyvu+ORoT0YMJ+qxC4Ad
 mo/p7QUjOnI2a7PVgplsk1cBmercE0dWkfvLK79NnrMDy3aSAYFpyzxzHENINmH38g3P
 tqIli8logKYVcJGW8IdSUjn7LsN+K+v4IHzqdbEUPijENA8Qfo50rtg40vfUV7NmxP+H
 KiXw==
X-Gm-Message-State: APjAAAWJZg2znpYc5r95w3C56GL2Fm5ZcEZNY4sF2AIxdf4n6cuv8Bqo
 JJ0U6ue4WQRWvjpfXGBg/G0Tag==
X-Google-Smtp-Source: APXvYqwArngtth7ItH3EpE8LH8S4j/eVAVVg6AqEvqOu3xoUF1RjeEXBYLVRxkXdit5VDdriBk3z6w==
X-Received: by 2002:a63:cf06:: with SMTP id j6mr39603191pgg.379.1582651483432; 
 Tue, 25 Feb 2020 09:24:43 -0800 (PST)
Received: from hsinyi-z840.tpe.corp.google.com
 ([2401:fa00:1:10:b852:bd51:9305:4261])
 by smtp.gmail.com with ESMTPSA id a17sm11099378pgv.11.2020.02.25.09.24.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 25 Feb 2020 09:24:42 -0800 (PST)
From: Hsin-Yi Wang <hsinyi@chromium.org>
To: linux-arm-kernel@lists.infradead.org
Subject: [PATCH v3] media: mtk-vpu: avoid unaligned access to DTCM buffer.
Date: Wed, 26 Feb 2020 01:24:37 +0800
Message-Id: <20200225172437.106679-1-hsinyi@chromium.org>
X-Mailer: git-send-email 2.25.0.265.gbab2e86ba0-goog
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200225_092445_785779_B5CE60E3 
X-CRM114-Status: UNSURE (   9.89  )
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
Cc: Andrew-CT Chen <andrew-ct.chen@mediatek.com>,
 Minghsiu Tsai <minghsiu.tsai@mediatek.com>,
 Hans Verkuil <hverkuil-cisco@xs4all.nl>,
 Enric Balletbo i Serra <enric.balletbo@collabora.com>,
 linux-kernel@vger.kernel.org, Houlong Wei <houlong.wei@mediatek.com>,
 Matthias Brugger <matthias.bgg@gmail.com>, linux-mediatek@lists.infradead.org,
 Mauro Carvalho Chehab <mchehab+samsung@kernel.org>,
 Tiffany Lin <tiffany.lin@mediatek.com>, linux-media@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

struct vpu_run *run in vpu_init_ipi_handler() is an ioremapped DTCM (Data
Tightly Coupled Memory) buffer shared with AP.  It's not able to do
unaligned access. Otherwise kernel would crash due to unable to handle
kernel paging request.

struct vpu_run {
	u32 signaled;
	char fw_ver[VPU_FW_VER_LEN];
	unsigned int	dec_capability;
	unsigned int	enc_capability;
	wait_queue_head_t wq;
};

fw_ver starts at 4 byte boundary. If system enables
CONFIG_HAVE_EFFICIENT_UNALIGNED_ACCESS, strscpy() will do
read_word_at_a_time(), which tries to read 8-byte: *(unsigned long *)addr

Copy the string by memcpy_fromio() for this buffer to avoid unaligned
access.

Fixes: 85709cbf1524 ("media: replace strncpy() by strscpy()")
Signed-off-by: Hsin-Yi Wang <hsinyi@chromium.org>
---
Change in v3:
- fix sparse warnings.
Change in v2:
- fix sparse warnings.
---
 drivers/media/platform/mtk-vpu/mtk_vpu.c | 14 ++++++++------
 1 file changed, 8 insertions(+), 6 deletions(-)

diff --git a/drivers/media/platform/mtk-vpu/mtk_vpu.c b/drivers/media/platform/mtk-vpu/mtk_vpu.c
index a768707abb94..e3fd2d1814f3 100644
--- a/drivers/media/platform/mtk-vpu/mtk_vpu.c
+++ b/drivers/media/platform/mtk-vpu/mtk_vpu.c
@@ -603,12 +603,14 @@ EXPORT_SYMBOL_GPL(vpu_load_firmware);
 static void vpu_init_ipi_handler(void *data, unsigned int len, void *priv)
 {
 	struct mtk_vpu *vpu = (struct mtk_vpu *)priv;
-	struct vpu_run *run = (struct vpu_run *)data;
-
-	vpu->run.signaled = run->signaled;
-	strscpy(vpu->run.fw_ver, run->fw_ver, sizeof(vpu->run.fw_ver));
-	vpu->run.dec_capability = run->dec_capability;
-	vpu->run.enc_capability = run->enc_capability;
+	struct vpu_run __iomem *run = (struct vpu_run __iomem __force *)data;
+
+	vpu->run.signaled = readl(&run->signaled);
+	memcpy_fromio(vpu->run.fw_ver, run->fw_ver, sizeof(vpu->run.fw_ver));
+	/* Make sure the string is NUL-terminated */
+	vpu->run.fw_ver[sizeof(vpu->run.fw_ver) - 1] = '\0';
+	vpu->run.dec_capability = readl(&run->dec_capability);
+	vpu->run.enc_capability = readl(&run->enc_capability);
 	wake_up_interruptible(&vpu->run.wq);
 }
 
-- 
2.25.0.265.gbab2e86ba0-goog


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
