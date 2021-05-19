Return-Path: <SRS0=GdzH=KO=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6D27EC43600
	for <linux-mediatek@archiver.kernel.org>; Wed, 19 May 2021 14:31:02 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id EB0EB6135C
	for <linux-mediatek@archiver.kernel.org>; Wed, 19 May 2021 14:31:01 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org EB0EB6135C
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=chromium.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=93W935fa5ANZmOXB/9EWOh2kOelwdpKnQKrc56kY4s0=; b=fJFdlROodZ3fhe98v5fZE27Kb
	LT/CXGJMaF2VldzmOoLI/9qI7z+3XUzIqViTCXMfymQ8RmCCrlJ6QqfhmFtJRICRkByVW8px7M14M
	zhC5B7oLEOzu9s6DmM0fIRi4yoZaBkNpsy58U8pMxxTjb79ZPKFKCJpV0cYPz1Lrt/8Qvm9ncRhld
	1IE08jjawThNsc7HfwAaloBmYlKA8hhjbF/3QzwdblhDK56TpsRN9lCfx8B8TKnnUdcjN2Insxsr3
	7qVHIYKlX055ARH/UADXOT4SP9HS87PMaRgh/Cmajl1as2LqDUXz6+I2UhdfoQsch46Hmix+9nTHl
	+tVD+Y9vg==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1ljNDk-004Geg-BD; Wed, 19 May 2021 14:30:48 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1ljNDi-004Ge7-Ho
 for linux-mediatek@desiato.infradead.org; Wed, 19 May 2021 14:30:46 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
 MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender
 :Reply-To:Content-Type:Content-ID:Content-Description;
 bh=R+qFAFfMoc0Yucgu6eUD8mX568+obmb19D6ELlcRmjM=; b=tJIaPz657QEXbCjFGe7zlf7s6f
 OQg38yzWEmuKsPQZA9FMnB8+un0oRQJGjQQfSYjI+9dyeNQ+Ixo+m/CX04mQfpPp6gaYtM69s0Qjn
 6KS2OHxEWZfru3Hh9XYFa4rnCrmwf/ryeU2CAGeCZyy+P/ZZ0XVi97JoSYIj8SRf2tQnRqxmGQo9M
 0Gmp82Dy5Ar3KILtvMVBIBGda4x0jJPPaAFBJnAXTlt3WBahMrYkmNkvVsHwzgUPNI6dCOOuSwhHE
 mGs6cxFwxg/td93Zng4/Oa17Kmqb9K+5dz/fWBqU5C8HaZksKDVe/ULBsfoeQ2dgkgWxVeHjLE7yp
 UPGYtpkw==;
Received: from mail-pf1-x433.google.com ([2607:f8b0:4864:20::433])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1ljNDf-00FXnn-UG
 for linux-mediatek@lists.infradead.org; Wed, 19 May 2021 14:30:45 +0000
Received: by mail-pf1-x433.google.com with SMTP id b13so6276211pfv.4
 for <linux-mediatek@lists.infradead.org>; Wed, 19 May 2021 07:30:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=R+qFAFfMoc0Yucgu6eUD8mX568+obmb19D6ELlcRmjM=;
 b=iR+E7LPFefwqCp1itb4p/NP06ls686VNt/KWEA8X2O02aXe8wy/Oe1MZ1x8deyZ6hN
 ogf0kcoaqIV+x3AQPvXw2xzAlj4yUk8fZ8/bafIlyhT5HI81p4B0sulvkmO1RHO4TQJU
 kn+P+N8ADTLtpTkrYBYBDUOgYwAXQRZw5ec2g=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=R+qFAFfMoc0Yucgu6eUD8mX568+obmb19D6ELlcRmjM=;
 b=F3afijN877uZmrddMiLWtyT+I3gOIHOKcyn55ShTW+0km5VRiKEf2K1hl3J6Jz3zJf
 fWHn9FHks43y8ioTPRnXs2fFd/S4ybvCmqK2fJe1W/uPbC2Xp8bBWsi8jiMrEsyOmB8c
 nYBLxBOuqt8ZOjQxDvoRmuh3Z+7cnMhkrGGm+TWr5k5wWx6ypouulnS1PsWXAW3tStZ3
 tf2c2XZSYjBRmPxqLD5CEQ9uFyHpq+MdWDtLRjX42Og96oO7Psdr3rdeghoRHUbocOsR
 0z7uX9CNcJ7fFXiKmsPKK9TGsZse9cF/t1Up8fFvmf5c1UDAgSWkzJ5uVM/VuN+jhY0a
 gPSw==
X-Gm-Message-State: AOAM5313mIIEpIBTCuTrXoPNU3L+hGLuCpr6LAQ7UK5QEKDvANmasLbJ
 mc7TkDYIbddoUbBY1Jrm7UabAw==
X-Google-Smtp-Source: ABdhPJzE9m0ahz3wmyrv0dEBy0FOLET41SMlFMBOWhO5fu66APdGn1l+PQfBNwdSBI2gkwx01qJj1g==
X-Received: by 2002:a05:6a00:134b:b029:2bf:2c30:ebbd with SMTP id
 k11-20020a056a00134bb02902bf2c30ebbdmr11118765pfu.74.1621434642909; 
 Wed, 19 May 2021 07:30:42 -0700 (PDT)
Received: from acourbot.tok.corp.google.com
 ([2401:fa00:8f:203:87ab:ff82:1544:697])
 by smtp.gmail.com with ESMTPSA id 3sm14337661pff.132.2021.05.19.07.30.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 19 May 2021 07:30:42 -0700 (PDT)
From: Alexandre Courbot <acourbot@chromium.org>
To: Tiffany Lin <tiffany.lin@mediatek.com>,
 Andrew-CT Chen <andrew-ct.chen@mediatek.com>,
 Hans Verkuil <hverkuil-cisco@xs4all.nl>,
 Dafna Hirschfeld <dafna.hirschfeld@collabora.com>,
 Yunfei Dong <yunfei.dong@mediatek.com>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>, linux-media@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org,
 Alexandre Courbot <acourbot@chromium.org>
Subject: [PATCH v5 02/14] media: mtk-vcodec: vdec: use helpers in
 VIDIOC_(TRY_)DECODER_CMD
Date: Wed, 19 May 2021 23:29:59 +0900
Message-Id: <20210519143011.1175546-3-acourbot@chromium.org>
X-Mailer: git-send-email 2.31.1.751.gd2f1c929bd-goog
In-Reply-To: <20210519143011.1175546-1-acourbot@chromium.org>
References: <20210519143011.1175546-1-acourbot@chromium.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210519_073043_980780_EF0310C6 
X-CRM114-Status: GOOD (  11.55  )
X-BeenThere: linux-mediatek@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-mediatek.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mediatek>, 
 <mailto:linux-mediatek-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mediatek/>
List-Post: <mailto:linux-mediatek@lists.infradead.org>
List-Help: <mailto:linux-mediatek-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mediatek>, 
 <mailto:linux-mediatek-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Let's use the dedicated helpers to make sure we get the expected
behavior and remove redundant code.

Signed-off-by: Alexandre Courbot <acourbot@chromium.org>
---
 drivers/media/platform/mtk-vcodec/mtk_vcodec_dec.c | 13 +------------
 1 file changed, 1 insertion(+), 12 deletions(-)

diff --git a/drivers/media/platform/mtk-vcodec/mtk_vcodec_dec.c b/drivers/media/platform/mtk-vcodec/mtk_vcodec_dec.c
index 8df8bcfe5e9c..1a633b485a69 100644
--- a/drivers/media/platform/mtk-vcodec/mtk_vcodec_dec.c
+++ b/drivers/media/platform/mtk-vcodec/mtk_vcodec_dec.c
@@ -484,18 +484,7 @@ static void mtk_vdec_worker(struct work_struct *work)
 static int vidioc_try_decoder_cmd(struct file *file, void *priv,
 				struct v4l2_decoder_cmd *cmd)
 {
-	switch (cmd->cmd) {
-	case V4L2_DEC_CMD_STOP:
-	case V4L2_DEC_CMD_START:
-		if (cmd->flags != 0) {
-			mtk_v4l2_err("cmd->flags=%u", cmd->flags);
-			return -EINVAL;
-		}
-		break;
-	default:
-		return -EINVAL;
-	}
-	return 0;
+	return v4l2_m2m_ioctl_try_decoder_cmd(file, priv, cmd);
 }
 
 
-- 
2.31.1.751.gd2f1c929bd-goog


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
