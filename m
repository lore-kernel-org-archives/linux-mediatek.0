Return-Path: <SRS0=iyt4=M5=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E10E7C4320E
	for <linux-mediatek@archiver.kernel.org>; Fri,  6 Aug 2021 04:16:35 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A9A0A608FC
	for <linux-mediatek@archiver.kernel.org>; Fri,  6 Aug 2021 04:16:35 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org A9A0A608FC
Authentication-Results: mail.kernel.org; dmarc=fail (p=reject dis=none) header.from=google.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:From:Subject:References:
	Mime-Version:Message-Id:In-Reply-To:Date:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=KyG8XnfuaUR94MAUz8CIAwLqoQeceSg9XQ6M2Jtj/O0=; b=Tdo1tFWtRu+tJ/if0woTRW+GyH
	IiBX/rcSIfTyOQ9bcId/SeKeC7EHEelOZL2yNoIL1GFTwHZV65qZobdqXVpdVZp/NCkgSSHlsaqdL
	XYXK6Mt85438hOZWY+Hp8UM/qbiF1UXUPdvOiVWwYcnmRAWyqvhybny9AgGHSK47bs5x/Xdkk4aya
	avsFZSWMqknSYslkNMkf/L6vogwWghONPeaCIwXeo3OoZK2YQOO42TVzh0oAH7rn079RORvGLAowT
	VL9bZEGVyIhXJzG6/V7Ez+UwzdT3ZOiOzMj3J+v2ApkY8gmTvpEYceiLnD6dA5gogmNVm7W7XPlRu
	KAjucD3g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mBrHV-00BT2A-Ni; Fri, 06 Aug 2021 04:16:25 +0000
Received: from mail-qt1-x849.google.com ([2607:f8b0:4864:20::849])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mBrH7-00BSsO-VJ
 for linux-mediatek@lists.infradead.org; Fri, 06 Aug 2021 04:16:03 +0000
Received: by mail-qt1-x849.google.com with SMTP id
 21-20020ac857150000b029024e8c2383c1so3765644qtw.5
 for <linux-mediatek@lists.infradead.org>; Thu, 05 Aug 2021 21:16:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=date:in-reply-to:message-id:mime-version:references:subject:from:to
 :cc; bh=DhkoP3CndI6xOQyniDPb4V1Ek5PJMvMmCPk1Pl/SFdk=;
 b=uE4ntQ3e6/bd319jhZU2640yqFPUWgI9Z1oQV6U50RDeC8CGxXBq7QWAVZaWSkPUCY
 Z8MRdY6/n6QIl7KSfmwzK4yf51Iy8sXYxYqgHGS//Fhz4/Cyoj2WJSUbd4FsXMiyVSI1
 otDzL4yIQuLjaEDO5J6QHCbAEOihaTVaZe6QOpzKmSbsCo9KbB3JHbCiPpYqpovSLX+y
 pbcHEITB9K7/f/1vHV0w2D/7XdAYxMzK3KYP7+hxiZZuRogOhivHt9PRKHAIolD704nH
 0ScMhmeZF4OOr3qriS0+ytBI/fdZC0BXt2HAf2EZzWLFeH2x9dQp5VOPTxdYhrBVMhmT
 ecEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:in-reply-to:message-id:mime-version
 :references:subject:from:to:cc;
 bh=DhkoP3CndI6xOQyniDPb4V1Ek5PJMvMmCPk1Pl/SFdk=;
 b=O/LiXI/38yhrXy+ICSI7lRt++WIsisi286C+KS9VrjilYhs5a0M+xLaHktnYeWAJRn
 1I2/GKIij6tO+AaD8N4kYC8Ou6OHV/T5tOd48jlNv6Z5n7m9dZfPNjLqlnslIpPYf4H2
 /AdfWyF5r3NBP3Ep7lk7ibyzwL5/FV8E81AzN4AYr88IbVLJR/g9vEBF+3zI49E6Ye+F
 0IxcUiXC/n2eHpP8Lw1LZy+3AVTAFmgPlH0m5MKW9RUxU8CEKYYcfhIOkdzwVteWJIaY
 uZXr5700c8lbmwgOyjA+J2FPYsivaxb2AgnebL66JalebFQFd26I+F1D4JN2utz7vlou
 dGPA==
X-Gm-Message-State: AOAM531/dENcrWEy+SvSWIKfYQUCz3gxtoVqdfcphu8Ftbm4wFso5LhD
 5wHeICCvcXqZlrAqLAvzEMTe90tKY/wb
X-Google-Smtp-Source: ABdhPJwDOZAFSB2KFl1TezoMeHIutNrC0Fy4BBTwqgurX8ctFKbAVKr3I5BgwGL0MmxhDupCCXCF9+RjcYUF
X-Received: from tzungbi-z840.tpe.corp.google.com
 ([2401:fa00:1:10:ebc2:859f:4153:773e])
 (user=tzungbi job=sendgmr) by 2002:a05:6214:2a85:: with SMTP id
 jr5mr9022641qvb.5.1628223359525; Thu, 05 Aug 2021 21:15:59 -0700 (PDT)
Date: Fri,  6 Aug 2021 12:15:18 +0800
In-Reply-To: <20210806041530.4170869-1-tzungbi@google.com>
Message-Id: <20210806041530.4170869-3-tzungbi@google.com>
Mime-Version: 1.0
References: <20210806041530.4170869-1-tzungbi@google.com>
X-Mailer: git-send-email 2.32.0.605.g8dce9f2422-goog
Subject: [PATCH v7 02/14] media: mtk-vcodec: vdec: use helpers in
 VIDIOC_(TRY_)DECODER_CMD
From: Tzung-Bi Shih <tzungbi@google.com>
To: hverkuil-cisco@xs4all.nl, yunfei.dong@mediatek.com, acourbot@chromium.org
Cc: tiffany.lin@mediatek.com, andrew-ct.chen@mediatek.com, 
 dafna.hirschfeld@collabora.com, mchehab@kernel.org, 
 linux-media@vger.kernel.org, linux-mediatek@lists.infradead.org, 
 linux-arm-kernel@lists.infradead.org, tzungbi@google.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210805_211602_040696_8DBC39F5 
X-CRM114-Status: UNSURE (   9.41  )
X-CRM114-Notice: Please train this message.
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

From: Alexandre Courbot <acourbot@chromium.org>

Let's use the dedicated helpers to make sure we get the expected
behavior and remove redundant code.

Signed-off-by: Alexandre Courbot <acourbot@chromium.org>
Reviewed-by: Tzung-Bi Shih <tzungbi@google.com>
Signed-off-by: Tzung-Bi Shih <tzungbi@google.com>
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
2.32.0.605.g8dce9f2422-goog


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
