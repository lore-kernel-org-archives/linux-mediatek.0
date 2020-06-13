Return-Path: <SRS0=c1Td=72=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5856FC433DF
	for <linux-mediatek@archiver.kernel.org>; Sat, 13 Jun 2020 23:09:19 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2A480207F7
	for <linux-mediatek@archiver.kernel.org>; Sat, 13 Jun 2020 23:09:19 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="Yz5VeSkK";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=umn.edu header.i=@umn.edu header.b="blYeLB6r"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 2A480207F7
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=umn.edu
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
	References:List-Owner; bh=I/eLGvJbOcpbjiSIBRvphUIu5mWlSPpSe2hot7vWwew=; b=Yz5
	VeSkK4Twd7rKocZlNpf0ASZQrSLXIUatwbQwBfH1z55Io4EaOVFuJNxdYcqRW+abLxFxwiCXGV9GE
	F6pMlB8Ci7L/JEyhYrYtFv9OVezD/0PJsSfC1k88N+DboeeksDVWrfETY0vSEcPwuYDXPp5Fbm/SE
	ND+PzMEKOMEoGgLoQksFmKTuqcJS6ow1UkOTZsCfFGNuh06ebP+64oErchJgiVKEYiFknzfExqQ8v
	Bik0507PZFwAskoh3DYcqaHDKneXRvTmZ4qoaVyGjLXl/+aeidCpgskcMJH97J4OEX8XEIgPbor+Z
	kmeH88KzD0+tKP42QX2QGNK/7yz9mcA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jkFGq-0000OC-Cv; Sat, 13 Jun 2020 23:09:04 +0000
Received: from mta-p8.oit.umn.edu ([134.84.196.208])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jkFGi-0000Fw-GX
 for linux-mediatek@lists.infradead.org; Sat, 13 Jun 2020 23:08:57 +0000
Received: from localhost (unknown [127.0.0.1])
 by mta-p8.oit.umn.edu (Postfix) with ESMTP id 49ktZD0VTSz9vbsf
 for <linux-mediatek@lists.infradead.org>; Sat, 13 Jun 2020 23:08:52 +0000 (UTC)
X-Virus-Scanned: amavisd-new at umn.edu
Received: from mta-p8.oit.umn.edu ([127.0.0.1])
 by localhost (mta-p8.oit.umn.edu [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id j9NW4_20l1nk for <linux-mediatek@lists.infradead.org>;
 Sat, 13 Jun 2020 18:08:51 -0500 (CDT)
Received: from mail-il1-f199.google.com (mail-il1-f199.google.com
 [209.85.166.199])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mta-p8.oit.umn.edu (Postfix) with ESMTPS id 49ktZC5vLSz9vbsc
 for <linux-mediatek@lists.infradead.org>; Sat, 13 Jun 2020 18:08:51 -0500 (CDT)
DMARC-Filter: OpenDMARC Filter v1.3.2 mta-p8.oit.umn.edu 49ktZC5vLSz9vbsc
DKIM-Filter: OpenDKIM Filter v2.11.0 mta-p8.oit.umn.edu 49ktZC5vLSz9vbsc
Received: by mail-il1-f199.google.com with SMTP id l20so9269047ilk.22
 for <linux-mediatek@lists.infradead.org>; Sat, 13 Jun 2020 16:08:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=umn.edu; s=google;
 h=from:to:cc:subject:date:message-id;
 bh=bqeKwkOk6XZo5v2wD5bUoMhkkwGMTZ2YIiOp5s0J3EI=;
 b=blYeLB6ruy/BG0h+sr5PZC8DoM0/i2T2Yvh9NEaV9hzbNZD1SDp9DY8c6cGGW/AAT/
 39f7Fd2g7xUEK781SumumsDR8PTGMWjNkPMgb8rsDjymEeiJO+9lbMyZJn1wG9UjuiMb
 /QXZN998+U3zxGn1RCQGoxuNoYt+KjginABbTtg/Sj4aFeSW0C1XTY7YH0O6ThyPhE2E
 KTCIqxnZf8fr/NFJimQ06vaP/Vq/HJxx1HEiBl0WS0OYT0FBQTojqzpingYrxbBOOaWr
 ktfhq9wtBiQAw9gz3W7hGuQRUieM5kIlPjn3HaDvJrMU+bJ1swi6J+dcnxFdIf4lSuFT
 8q+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id;
 bh=bqeKwkOk6XZo5v2wD5bUoMhkkwGMTZ2YIiOp5s0J3EI=;
 b=BOtu1xjR23kL0S0u/KUo+Zfp4zpv3MWJQt1g6cgkp4Qu6Gynu9mI/Qp79WRFtY+1q9
 zXVGqx3iYJM/HpA0mOMpjWDgPMQ8y20vxk7TUckAADz4tXiwubiGBpkxAg0jtlGBiHU2
 qrY2ye+NhfUcD+6QF1e96BsVFLKRxyvPZI1xwJxMrNfZm+BE5gwRUaJXIilxmM42WLzr
 BTvMI08pG/4Xkv36SSQRQPLg7CvTGHtzPjprqH4ykriXfmAhC9JgMUEf0dey9zorhYXX
 TMcXIJv/L7xqYuWwehFgzdCQ1WSmC1UnoALr4DiiL2wVy4SzaHtvehULY+/aRJLCDfg6
 542g==
X-Gm-Message-State: AOAM532gvdyrGftwF0uuL6GhtRlVAlO5pqMgSrINfZkDXv4XTD7ToSt2
 5AyClx09V/DH83jFXNO9gDZZS9tTt2/cHGuTMRaXoaBxqxC0UVRKYobtTB18tM8Rzbo+PoAzH7B
 QUTBvqWZjFq/KhDp+Stnwes2cjbLlgb3P+rpa
X-Received: by 2002:a92:b00e:: with SMTP id x14mr18850437ilh.219.1592089731331; 
 Sat, 13 Jun 2020 16:08:51 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxmVCe/qnocqMDuI+rUSn33JC0xwAkRz8hA8NtZAbzgXhzeCZTSmGkdB8UI2YxFK+JAFiuFRQ==
X-Received: by 2002:a92:b00e:: with SMTP id x14mr18850406ilh.219.1592089731061; 
 Sat, 13 Jun 2020 16:08:51 -0700 (PDT)
Received: from qiushi.cs.umn.edu ([2607:ea00:101:3c74:4874:45:bcb4:df60])
 by smtp.gmail.com with ESMTPSA id y5sm5668155iov.3.2020.06.13.16.08.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 13 Jun 2020 16:08:50 -0700 (PDT)
From: wu000273@umn.edu
To: kjlu@umn.edu
Subject: [PATCH] media: mtk-jpeg: Fix a reference count leak.
Date: Sat, 13 Jun 2020 18:08:43 -0500
Message-Id: <20200613230843.14109-1-wu000273@umn.edu>
X-Mailer: git-send-email 2.17.1
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200613_160856_636711_1EB569AD 
X-CRM114-Status: GOOD (  11.45  )
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
Cc: Bin Liu <bin.liu@mediatek.com>, Minghsiu Tsai <minghsiu.tsai@mediatek.com>,
 Rick Chang <rick.chang@mediatek.com>, linux-kernel@vger.kernel.org,
 Ricky Liang <jcliang@chromium.org>, Hans Verkuil <hans.verkuil@cisco.com>,
 wu000273@umn.edu, Matthias Brugger <matthias.bgg@gmail.com>,
 linux-mediatek@lists.infradead.org, Mauro Carvalho Chehab <mchehab@kernel.org>,
 linux-arm-kernel@lists.infradead.org, linux-media@vger.kernel.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

From: Qiushi Wu <wu000273@umn.edu>

pm_runtime_get_sync() increments the runtime PM usage counter even
when it returns an error code. Thus call pm_runtime_put_noidle()
if pm_runtime_get_sync() fails.

Fixes: b2f0d2724ba4 ("[media] vcodec: mediatek: Add Mediatek JPEG Decoder Driver")
Signed-off-by: Qiushi Wu <wu000273@umn.edu>
---
 drivers/media/platform/mtk-jpeg/mtk_jpeg_core.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/media/platform/mtk-jpeg/mtk_jpeg_core.c b/drivers/media/platform/mtk-jpeg/mtk_jpeg_core.c
index f82a81a3bdee..097f0b050f67 100644
--- a/drivers/media/platform/mtk-jpeg/mtk_jpeg_core.c
+++ b/drivers/media/platform/mtk-jpeg/mtk_jpeg_core.c
@@ -710,8 +710,10 @@ static int mtk_jpeg_start_streaming(struct vb2_queue *q, unsigned int count)
 	int ret = 0;
 
 	ret = pm_runtime_get_sync(ctx->jpeg->dev);
-	if (ret < 0)
+	if (ret < 0) {
+		pm_runtime_put_noidle(ctx->jpeg->dev);
 		goto err;
+	}
 
 	return 0;
 err:
-- 
2.17.1


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
