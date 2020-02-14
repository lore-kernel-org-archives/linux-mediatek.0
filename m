Return-Path: <SRS0=lPor=4C=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B2731C2BA83
	for <linux-mediatek@archiver.kernel.org>; Fri, 14 Feb 2020 12:01:59 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 827E4222C2
	for <linux-mediatek@archiver.kernel.org>; Fri, 14 Feb 2020 12:01:59 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="AlIMdoDM";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="mgJ1kYMC"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 827E4222C2
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=chromium.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:To
	:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=Lm6YZDWEczNliVFq4tY6cqF2nshsXSDgetyWG6fLAQM=; b=AlIMdoDMA//Iga
	4L03vPBkP2ho6ztsG1W12/3j/UWhl5wZcs2/rWvVfJoKEwvV3oEo9u9ATHxLiEmy+pi3Jf/TFP490
	DYh/JOIfm7N1hsTorCSuX2a88r0emh5ivd8we/sYPaszA/tlfFBIzXTHfkjGkC4SZ0d2YsYIhLmG2
	U+h4K/Fjbb3FV0kMDprYvoKuPOoAsbKLQM4HDYEONnx5wJo2KHVumXCAe4dQoMCQwATQqSpafiuWW
	Up5xAFZeGnVXA/tsT3q1Ov92YxK19/zBam/DgvimsWoaULYwMeYi2u0Yxs3aYsCuAk82KGrQM8/VE
	MrxpQuPuiPWtqQOvWbYA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1j2ZfL-0003ys-HJ; Fri, 14 Feb 2020 12:01:51 +0000
Received: from mail-pj1-x1043.google.com ([2607:f8b0:4864:20::1043])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1j2ZfI-0003yK-UY
 for linux-mediatek@lists.infradead.org; Fri, 14 Feb 2020 12:01:50 +0000
Received: by mail-pj1-x1043.google.com with SMTP id dw13so3795873pjb.4
 for <linux-mediatek@lists.infradead.org>; Fri, 14 Feb 2020 04:01:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=SrEeeiMYTh8tdM4uM57yi2C/Gx0ZYDeODDLqafFzdQw=;
 b=mgJ1kYMC+BKoJPHgI/QnmPPE5wphvts8MkBDeru9Bwop/IFN17dqQ8HwYmQciHiVmc
 8pDKI2wW53lT/DGGKiXtf8AYsk7nhkyInXUtN8syisSnx1SkqkFpmmaLOTfvCtTT8mN5
 aEz8ZBVe5ISoTRl7RQOkFKkH7rSgiFbU/VUMo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=SrEeeiMYTh8tdM4uM57yi2C/Gx0ZYDeODDLqafFzdQw=;
 b=OhwT5B14OygETXuZ06Tex8gAAr2fRqj+txHnLe+MZnJ61NnofCiUDP74lB+uiDHj5E
 mYIFpogMDkIo5hF1JyYoGF6HJEeEu84zPx8btOQqTFo5E7wBIYRCCAoLiOSwsVznJrEy
 qS6fJNFS1W8YKHEcsyXYExxLRpJCjrGmMdZCa6M6l1r1Q8ZLK1uZz3wRgxnBSsSZh/rS
 3AjOC0fGrv7sdGPRdR2K0O6KN4fohPlrekl3e6a1q24PyCyoIEtwHlunfNBc/aIsJj3X
 DAfDjraB++uNixpMLYZBoGkuOtsA31AQFslUYhqah3PZ/EwyZkQNg/Ougj0cc01Tl7FF
 1fIw==
X-Gm-Message-State: APjAAAUI3BMmOQ1/5OarVnkzHqsev8ctDBrM2jT5EuzjY4UqiDl5w10e
 FCo9utmIef+5qMQVhJgvyfiRbQ==
X-Google-Smtp-Source: APXvYqwWBAPzKlqlSPflws7rlPOk76DpJUm2SkfSFNRolVl+WFSLvA3yN/iX862TqE8JTe7pwnmITA==
X-Received: by 2002:a17:902:b40c:: with SMTP id
 x12mr3045452plr.70.1581681708257; 
 Fri, 14 Feb 2020 04:01:48 -0800 (PST)
Received: from hsinyi-z840.tpe.corp.google.com
 ([2401:fa00:1:10:b852:bd51:9305:4261])
 by smtp.gmail.com with ESMTPSA id s18sm7120275pgn.34.2020.02.14.04.01.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 14 Feb 2020 04:01:47 -0800 (PST)
From: Hsin-Yi Wang <hsinyi@chromium.org>
To: linux-arm-kernel@lists.infradead.org
Subject: [PATCH v2] media: mtk-vpu: avoid unaligned access to DTCM buffer.
Date: Fri, 14 Feb 2020 20:01:42 +0800
Message-Id: <20200214120142.50529-1-hsinyi@chromium.org>
X-Mailer: git-send-email 2.25.0.265.gbab2e86ba0-goog
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200214_040148_985221_DAA02888 
X-CRM114-Status: GOOD (  10.50  )
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
Change in v2:
- fix sparse warnings.
---
 drivers/media/platform/mtk-vpu/mtk_vpu.c | 17 ++++++++++-------
 drivers/media/platform/mtk-vpu/mtk_vpu.h |  2 +-
 2 files changed, 11 insertions(+), 8 deletions(-)

diff --git a/drivers/media/platform/mtk-vpu/mtk_vpu.c b/drivers/media/platform/mtk-vpu/mtk_vpu.c
index a768707abb94..c59373e84a33 100644
--- a/drivers/media/platform/mtk-vpu/mtk_vpu.c
+++ b/drivers/media/platform/mtk-vpu/mtk_vpu.c
@@ -600,15 +600,18 @@ int vpu_load_firmware(struct platform_device *pdev)
 }
 EXPORT_SYMBOL_GPL(vpu_load_firmware);
 
-static void vpu_init_ipi_handler(void *data, unsigned int len, void *priv)
+static void vpu_init_ipi_handler(void __iomem *data, unsigned int len,
+				 void *priv)
 {
 	struct mtk_vpu *vpu = (struct mtk_vpu *)priv;
-	struct vpu_run *run = (struct vpu_run *)data;
-
-	vpu->run.signaled = run->signaled;
-	strscpy(vpu->run.fw_ver, run->fw_ver, sizeof(vpu->run.fw_ver));
-	vpu->run.dec_capability = run->dec_capability;
-	vpu->run.enc_capability = run->enc_capability;
+	struct vpu_run __iomem *run = data;
+
+	vpu->run.signaled = readl(&run->signaled);
+	memcpy_fromio(vpu->run.fw_ver, run->fw_ver, sizeof(vpu->run.fw_ver));
+	/* Make sure the string is NUL-terminated */
+	vpu->run.fw_ver[sizeof(vpu->run.fw_ver) - 1] = '\0';
+	vpu->run.dec_capability = readl(&run->dec_capability);
+	vpu->run.enc_capability = readl(&run->enc_capability);
 	wake_up_interruptible(&vpu->run.wq);
 }
 
diff --git a/drivers/media/platform/mtk-vpu/mtk_vpu.h b/drivers/media/platform/mtk-vpu/mtk_vpu.h
index d4453b4bcee9..a7ac351b19c1 100644
--- a/drivers/media/platform/mtk-vpu/mtk_vpu.h
+++ b/drivers/media/platform/mtk-vpu/mtk_vpu.h
@@ -15,7 +15,7 @@
  * VPU interfaces with other blocks by share memory and interrupt.
  **/
 
-typedef void (*ipi_handler_t) (void *data,
+typedef void (*ipi_handler_t) (void __iomem *data,
 			       unsigned int len,
 			       void *priv);
 
-- 
2.25.0.265.gbab2e86ba0-goog


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
