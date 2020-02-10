Return-Path: <SRS0=lG5C=36=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F2900C35254
	for <linux-mediatek@archiver.kernel.org>; Mon, 10 Feb 2020 03:54:28 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C57C620870
	for <linux-mediatek@archiver.kernel.org>; Mon, 10 Feb 2020 03:54:28 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="Jl1NhQ1+";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="He3CPtJv"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org C57C620870
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=chromium.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:To
	:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=a9uEB4tIE7ahiJHr7kY4Zyh9dk81NwaECFZ7FSOLUkQ=; b=Jl1NhQ1+y9a9vm
	46Q5ESbjYX4c2mLxwpZU5Ynejh3QRjuKGbvU+JbwoJ/s0w3yaNe4rlg1qP+8nnnbaDWR5qyNlLAAE
	PUxpdCOroECMVhWj3GNKxJZ2i05VX7PAZ7AAK2pnTnaeG62SFePaEfbedGe+KuQlGiJnS63i0w+SL
	SnxC2tyo6JMbsnMYu9zu+e2jXYrcBse8sBLwbEIqYfiu5E4VCqnK7hY11JqTVEzECI16mwR5LEBmw
	Ewh1DAXTWljOiMD6AxihrwwzymD0odRmnPA315Byh198MllmHi38AIX/3ZJXJdea6TumZZQVGVzVj
	fvTFZ76YmKUbktrVg3LA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1j109L-0000gJ-Ej; Mon, 10 Feb 2020 03:54:19 +0000
Received: from mail-pj1-x1041.google.com ([2607:f8b0:4864:20::1041])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1j109C-0000Xe-Ib
 for linux-mediatek@lists.infradead.org; Mon, 10 Feb 2020 03:54:11 +0000
Received: by mail-pj1-x1041.google.com with SMTP id d5so3586863pjz.5
 for <linux-mediatek@lists.infradead.org>; Sun, 09 Feb 2020 19:54:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=XGTENEjJ0+z+1EMrz+JrOfyO1gcPOMBNtUwze/u53KI=;
 b=He3CPtJv9IthCFqDIfd5GI3rJaw5+1kbpKBDyO7Wh+3kXUrMjKjh0CrcU+HW+xzZCr
 miz1L40jFvrEay6sQy8PjEMqFuo9NyFaimnfRq1NeGccaMAhHQcmx/siFCBt7B0SexUk
 /PZeCvkoEg7mEk1YNJcZ5d4a0eFn7hI/WNdyo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=XGTENEjJ0+z+1EMrz+JrOfyO1gcPOMBNtUwze/u53KI=;
 b=uAXfpO80BFF4GjRsxvxOSFxsEQj57wj9ZqVrcOyWymK3XG8p8Iayw58U73oWabyNQl
 6ZTdvvF9XxDJRHa0Ejq+HDnSZBH11+ZtyxvTNFIGR4yWdB3NtaajqA8FT8cMhPYYEFP6
 o17KJFpw9e7fuJUBYrsfo1/g/d2NXuxXpJmBG/nwFtSnJP5cPw4L27Bw9Kjl7yEhpVWE
 9vrEiirdE7/fj008bZDdMBzXIrEh5Z/QK4F9XSJGAcK8H1zERZOf4Wj11LrBAdzQF3vq
 Dtkqy3cTGseiSxQ89CqnMMy/dG51Nz3UiqjrgJJBVIZNccTbL5k34eMm8fsLEfqbZ06v
 soZg==
X-Gm-Message-State: APjAAAW7ksxr1GyiAJYca7vx5cLY9Q74fy1jEV6yFBZts6tOfJW1jm8r
 wol2ApZCFugV0f3NHVopgTc4OQ==
X-Google-Smtp-Source: APXvYqztMKtN5f2EXAltVefsi/KgAfmMtI7mmcAMBhBpCsFWH61jBs7TaCyvdwU2IC6/picaXka25A==
X-Received: by 2002:a17:902:567:: with SMTP id
 94mr10741617plf.174.1581306848902; 
 Sun, 09 Feb 2020 19:54:08 -0800 (PST)
Received: from hsinyi-z840.tpe.corp.google.com
 ([2401:fa00:1:10:b852:bd51:9305:4261])
 by smtp.gmail.com with ESMTPSA id c26sm10568151pfj.8.2020.02.09.19.54.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 09 Feb 2020 19:54:08 -0800 (PST)
From: Hsin-Yi Wang <hsinyi@chromium.org>
To: linux-arm-kernel@lists.infradead.org
Subject: [PATCH] media: mtk-vpu: avoid unaligned access to DTCM buffer.
Date: Mon, 10 Feb 2020 11:53:52 +0800
Message-Id: <20200210035351.227499-1-hsinyi@chromium.org>
X-Mailer: git-send-email 2.25.0.225.g125e21ebc7-goog
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200209_195410_610907_14658F3D 
X-CRM114-Status: UNSURE (   9.72  )
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
 drivers/media/platform/mtk-vpu/mtk_vpu.c | 9 ++++++---
 1 file changed, 6 insertions(+), 3 deletions(-)

diff --git a/drivers/media/platform/mtk-vpu/mtk_vpu.c b/drivers/media/platform/mtk-vpu/mtk_vpu.c
index a768707abb94..e705e85d6f5a 100644
--- a/drivers/media/platform/mtk-vpu/mtk_vpu.c
+++ b/drivers/media/platform/mtk-vpu/mtk_vpu.c
@@ -600,13 +600,16 @@ int vpu_load_firmware(struct platform_device *pdev)
 }
 EXPORT_SYMBOL_GPL(vpu_load_firmware);
 
-static void vpu_init_ipi_handler(void *data, unsigned int len, void *priv)
+static void vpu_init_ipi_handler(void __iomem *data, unsigned int len,
+				 void *priv)
 {
 	struct mtk_vpu *vpu = (struct mtk_vpu *)priv;
-	struct vpu_run *run = (struct vpu_run *)data;
+	struct vpu_run __iomem *run = data;
 
 	vpu->run.signaled = run->signaled;
-	strscpy(vpu->run.fw_ver, run->fw_ver, sizeof(vpu->run.fw_ver));
+	memcpy_fromio(vpu->run.fw_ver, run->fw_ver, sizeof(vpu->run.fw_ver));
+	/* Make sure the string is NUL-terminated */
+	vpu->run.fw_ver[sizeof(vpu->run.fw_ver) - 1] = '\0';
 	vpu->run.dec_capability = run->dec_capability;
 	vpu->run.enc_capability = run->enc_capability;
 	wake_up_interruptible(&vpu->run.wq);
-- 
2.25.0.225.g125e21ebc7-goog


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
