Return-Path: <SRS0=NJpa=JY=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 59C72C433B4
	for <linux-mediatek@archiver.kernel.org>; Tue, 27 Apr 2021 11:16:38 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A89D16101D
	for <linux-mediatek@archiver.kernel.org>; Tue, 27 Apr 2021 11:16:37 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org A89D16101D
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=chromium.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=dDOizZSwVt1/oU9HiVWRuIYK9CRl6M5ZiRcW3JH60YQ=; b=BSyploJjcwMJ/8+/oujSGVyWR
	7kUQGv8LeFwgfiXjjT4SgCsRva+LemnIRl5iiThx69FPVhGut2oww+0VDYx4qJUlB7IG5BPyCkA3Z
	21py2ZEAexUddVdT+8MAqWWRbSQTejDdrQvgwIyVynPMTEgqwY4rRZ+hLubsSRUQh9IAgyTC0thtG
	lZGSuNzIy4eb1Wt8YAzuQRAwF+KU876CoA1ieXX3or1ro9yqkEw2j4g+qP3HBPoCn3RCwsqbakjIr
	ECACduv9lAtGGf/V3CE1n26CQrSf/9RHxoCYpyIbQTBpsxmwa7hk/yGdCcVrwtW1a6HqwySiTfsU7
	LCDhBusTQ==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lbLhV-001TrE-I2; Tue, 27 Apr 2021 11:16:21 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lbLhH-001Tmt-Oz
 for linux-mediatek@desiato.infradead.org; Tue, 27 Apr 2021 11:16:08 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
 MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender
 :Reply-To:Content-Type:Content-ID:Content-Description;
 bh=qDhPIhfqI4Pq+xMHlyEIR9SMexQlN4dYaagLiPYwmXw=; b=h6NDDDozCjq57Qe9TE1ycJFpHG
 oRoisRKsQYYacG6OR3MlfamI4o4S7xyc1jv1oflVkx67ODHs0UExK32uzvi20+LmEAHfumSYWRiaQ
 3o2SiBRkBPBjcEENySHVC8eRjexa56egKY8yX2NLeWTyt81feEQFmo1FYQ1QBtxIQYpAxxs+uwORa
 hK2NbKct/KqgUkIdJuZnSZLShVZThMp57FBoqTWhiMMkyZNbwsIkyAOSqtZS9zw3Upgg5mXLJdzW0
 4GnNGqz9r3KYrTuP7lLn2TG3cNpTP3AZRmJvoIJ3U6dLbrOibuYNPQGekW6FlKZmODaUIX79zF+X3
 i0D8faKg==;
Received: from mail-pf1-x430.google.com ([2607:f8b0:4864:20::430])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lbLhF-00GgG2-8t
 for linux-mediatek@lists.infradead.org; Tue, 27 Apr 2021 11:16:06 +0000
Received: by mail-pf1-x430.google.com with SMTP id e15so4337648pfv.10
 for <linux-mediatek@lists.infradead.org>; Tue, 27 Apr 2021 04:16:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=qDhPIhfqI4Pq+xMHlyEIR9SMexQlN4dYaagLiPYwmXw=;
 b=oCxdPjDxqgobH5jkDDoNia3CKUV62rbY0dfh44gq35HsSMuaWJlr7F7TsvdG5aln89
 uH1/2zlA2BbYG7ca2eTjKcf+Zgx+Jsi1QXv4yKGn5lIrSXaVvO67wQ3TlvbBUdngMyaR
 vrJ0MO5ui2qHu/dLUbKRXQtfcWpYoxmDpPKBg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=qDhPIhfqI4Pq+xMHlyEIR9SMexQlN4dYaagLiPYwmXw=;
 b=puJ4eXPA0N4dRoKtbi8onQrvkQwX8gDHFsc7ctIjzB9ikr+TwWM7lr2JoglTkeGLqF
 3YR3eky1gz5kfd0vBigwWCgQnnMXZu6j4r0qIWHc0hggliEQt2j1GoP7sqytOrClover
 0k6/t73LIOFpp3jj8M4qbaj/Zldsa5dqhBl6kaGuREDacgk+YcssOiPU1n+RtdMVJFUk
 /rbSS4fnqSU2epmnskmxPrFu5U3DOcJfWwdmz0rZbfW9F3wTdJKbUmiGGNOPT0n/qkuP
 caZreBKvEsX5OFOiR0tqFk5ulsXr0M5OwTGhKjJf+GgwF9AIWxcFjsxMFkWcS1BSRgZS
 yjuw==
X-Gm-Message-State: AOAM531u4vE/hS9E5bZWhf8Mco7XkHZrL2voYGDrxVUveSKrK4KzcP20
 NDkcF4SRaXDo4kNapCA5JSYoXA==
X-Google-Smtp-Source: ABdhPJxqw98nbi47JE/oWyswUWPhOTXxfI7Or9Fl7giJxqzcHMD94e1TOTYdUKyFM6zwAZpP78OejQ==
X-Received: by 2002:a63:e347:: with SMTP id o7mr4815571pgj.184.1619522164479; 
 Tue, 27 Apr 2021 04:16:04 -0700 (PDT)
Received: from acourbot.tok.corp.google.com
 ([2401:fa00:8f:203:b182:d363:32d0:53a2])
 by smtp.gmail.com with ESMTPSA id c21sm2347210pfc.165.2021.04.27.04.16.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 27 Apr 2021 04:16:04 -0700 (PDT)
From: Alexandre Courbot <acourbot@chromium.org>
To: Tiffany Lin <tiffany.lin@mediatek.com>,
 Andrew-CT Chen <andrew-ct.chen@mediatek.com>,
 Rob Herring <robh+dt@kernel.org>, Yunfei Dong <yunfei.dong@mediatek.com>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>,
 Hans Verkuil <hverkuil-cisco@xs4all.nl>, linux-media@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org,
 Alexandre Courbot <acourbot@chromium.org>
Subject: [PATCH v4 10/15] media: mtk-vcodec: vdec: use helpers in
 VIDIOC_(TRY_)DECODER_CMD
Date: Tue, 27 Apr 2021 20:15:21 +0900
Message-Id: <20210427111526.1772293-11-acourbot@chromium.org>
X-Mailer: git-send-email 2.31.1.498.g6c1eba8ee3d-goog
In-Reply-To: <20210427111526.1772293-1-acourbot@chromium.org>
References: <20210427111526.1772293-1-acourbot@chromium.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210427_041605_331171_F305CAE9 
X-CRM114-Status: GOOD (  11.71  )
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
behavior on stateful decoders as well.

Signed-off-by: Alexandre Courbot <acourbot@chromium.org>
---
 .../media/platform/mtk-vcodec/mtk_vcodec_dec.c   | 16 ++--------------
 1 file changed, 2 insertions(+), 14 deletions(-)

diff --git a/drivers/media/platform/mtk-vcodec/mtk_vcodec_dec.c b/drivers/media/platform/mtk-vcodec/mtk_vcodec_dec.c
index 01c5333d6cff..4ef4b68ec9bd 100644
--- a/drivers/media/platform/mtk-vcodec/mtk_vcodec_dec.c
+++ b/drivers/media/platform/mtk-vcodec/mtk_vcodec_dec.c
@@ -52,22 +52,10 @@ static int vidioc_try_decoder_cmd(struct file *file, void *priv,
 	if (ctx->dev->vdec_pdata->uses_stateless_api)
 		return v4l2_m2m_ioctl_stateless_try_decoder_cmd(file, priv,
 								cmd);
-
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
+	else
+		return v4l2_m2m_ioctl_try_decoder_cmd(file, priv, cmd);
 }
 
-
 static int vidioc_decoder_cmd(struct file *file, void *priv,
 				struct v4l2_decoder_cmd *cmd)
 {
-- 
2.31.1.498.g6c1eba8ee3d-goog


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
