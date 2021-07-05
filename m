Return-Path: <SRS0=Syrz=L5=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-18.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E4C52C07E9A
	for <linux-mediatek@archiver.kernel.org>; Mon,  5 Jul 2021 05:33:41 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B0261613E2
	for <linux-mediatek@archiver.kernel.org>; Mon,  5 Jul 2021 05:33:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org B0261613E2
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=chromium.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=nVYWkKWvgMTzjRxoqk1Lx0ruKX3CaRy0MxYLKqchVbg=; b=AQ6SqFdzj53tDl
	Rk0tVNRqV/4DRYlv1RRL+C1AqeUY29D4U+zzYfAave2qVryl7prWOdtP/yvMHNbso3Q44pL11jNjM
	LIV9twueBXEK+azWwXMWjVhh8bmLHEF9Lvq8kPaR1LvDJOgu7uMULRZblCp+R2MjQ6uKpZAGh9gVX
	C3uCAW6zC412Uby8uhS5b0zsTEWvVyAxoPIvMHPPWYnbjK2KecF/EHpsG8S01prfrDU8+RXQ9Ievn
	XtvI5quvpym5IJd/WTEiMs12x/Pz3izx5gTxC3lbuAO2+SsSdd+8IraOiq7OW2NbfXYWgiL1mk6gr
	/5lBXjNWo6qeIXbanf0A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1m0HEY-007qJH-FB; Mon, 05 Jul 2021 05:33:30 +0000
Received: from mail-pf1-x42f.google.com ([2607:f8b0:4864:20::42f])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1m0HEU-007qHL-Vs
 for linux-mediatek@lists.infradead.org; Mon, 05 Jul 2021 05:33:28 +0000
Received: by mail-pf1-x42f.google.com with SMTP id j199so15282200pfd.7
 for <linux-mediatek@lists.infradead.org>; Sun, 04 Jul 2021 22:33:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=WS/CNP/N9EeU5nSTjU5yi9ozS4pjpkLNaRuavopgyWI=;
 b=SmZWr9iSjTdz4g+PwZXKFVYp5kPkSfCiaYIngd088Q/vE76nX5afKnx1U9SIoJ9vGl
 E/1ED+sKEe3ENq2dfijfaoe/mUY7F9AA6ALukTFl+Y/1Q+srJlHH79iPXPv7Szo/dfit
 K7DBcN9lcs7HjT10spqq24ZtoESp/Ym0GZ89g=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=WS/CNP/N9EeU5nSTjU5yi9ozS4pjpkLNaRuavopgyWI=;
 b=sCASnkaNRQ5VGM6LbqEvNVQINXxoYZGq81f2n8dcS+uJE2C44CfDQ+j8E2WiQItw3h
 vgBYHiyg4FwnrTjwluM+NVZQvIUXtEVbBQiVh0IGdzrPoH0X61R4b0LQi8k6pjgtRSRe
 +XdqUCwyCBvmn0obDQwdRDneKMXo0VvfYre7DcabVzCKAGStJDZmEamGvrM1ok7Kic5B
 eMrcu8x/TIj9zpGrbUxgU1yvhebHh6Lbxumf/qjps0juaw93iEyMlylxRCbUEgTapJMy
 K/zj1m2HVypsah8Vg4E60QyNungdR6gc9lZLcq6/i/uuRQQWnq5ynS0fAVRNiEkXsv8/
 Rekw==
X-Gm-Message-State: AOAM533OiZTl5Tgwtqy16XixzELfn+EcTZQae799UVeoU/7d9xEQTM2T
 SBpeQ2y1Z6Pjgmp2HGoq3ZSKlg==
X-Google-Smtp-Source: ABdhPJwuL5YE4n+oyQ5y6zzGaRklfZ1IvcRIuzn32RygafdBFFhnP2zufiEevYJeO9uqbsmBx0kYCw==
X-Received: by 2002:a63:5d5c:: with SMTP id o28mr13943804pgm.22.1625463206343; 
 Sun, 04 Jul 2021 22:33:26 -0700 (PDT)
Received: from acourbot.tok.corp.google.com
 ([2401:fa00:8f:203:3fed:7130:60f:265a])
 by smtp.gmail.com with ESMTPSA id x19sm6805245pfp.115.2021.07.04.22.33.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 04 Jul 2021 22:33:26 -0700 (PDT)
From: Alexandre Courbot <acourbot@chromium.org>
To: Tiffany Lin <tiffany.lin@mediatek.com>,
 Andrew-CT Chen <andrew-ct.chen@mediatek.com>,
 Hans Verkuil <hverkuil-cisco@xs4all.nl>,
 Dafna Hirschfeld <dafna.hirschfeld@collabora.com>,
 Yunfei Dong <yunfei.dong@mediatek.com>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>, linux-media@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org,
 Alexandre Courbot <acourbot@chromium.org>,
 Tzung-Bi Shih <tzungbi@google.com>
Subject: [PATCH v6 02/14] media: mtk-vcodec: vdec: use helpers in
 VIDIOC_(TRY_)DECODER_CMD
Date: Mon,  5 Jul 2021 14:32:46 +0900
Message-Id: <20210705053258.1614177-3-acourbot@chromium.org>
X-Mailer: git-send-email 2.32.0.93.g670b81a890-goog
In-Reply-To: <20210705053258.1614177-1-acourbot@chromium.org>
References: <20210705053258.1614177-1-acourbot@chromium.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210704_223327_073152_C50EB8BB 
X-CRM114-Status: GOOD (  11.44  )
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
Reviewed-by: Tzung-Bi Shih <tzungbi@google.com>
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
2.32.0.93.g670b81a890-goog


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
