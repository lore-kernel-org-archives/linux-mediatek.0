Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EEEC8C25B74
	for <linux-mediatek@archiver.kernel.org>; Tue, 21 May 2024 09:55:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=QIL8bJvqQtt10T5yeC3JXxYF7RA/JJU1vyZUZM4XpQE=; b=yLsx5/BtzxkrFJ
	W1WJAMlucbePd3now+FSelMi2gfDvyvI3hR6CjI3GdhzquOpSjrq/aftqt8Ci4YX98WRW/kkkXgA3
	AcrFaq1u6ObEgj/oyGllgC4qCzLbNoDFbecURVl+D2rH3oCI1GcJxNM+tTT+RfKYG+B9WcDefyrmX
	4Tqhb48UnvpxsEHvavqPqdVw43MhBbkJYfRFYdnIEufZzpZhDXaxv9E7XIlT0ixqobBGIhD7zC2+a
	2YTOQVQoj2CS/YjJU20Ql/PMpPdshY2vco/OyOMDER1OG/ugWuZNr9HklMKkaXTCnDdO0mHEdqvji
	GURvJxdi4zm83Y9aNUlA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s9MDr-0000000GyN6-2103;
	Tue, 21 May 2024 09:55:55 +0000
Received: from mail-ot1-x332.google.com ([2607:f8b0:4864:20::332])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s9MDn-0000000GyLn-2psR
	for linux-mediatek@lists.infradead.org;
	Tue, 21 May 2024 09:55:53 +0000
Received: by mail-ot1-x332.google.com with SMTP id 46e09a7af769-6f1242f1dcdso2111652a34.3
        for <linux-mediatek@lists.infradead.org>; Tue, 21 May 2024 02:55:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1716285350; x=1716890150; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=QIL8bJvqQtt10T5yeC3JXxYF7RA/JJU1vyZUZM4XpQE=;
        b=baILS8a24iyQ+4apv+/xB+WxtfeRfy9tRxMi7qIjFMbiNOMD6RT7dCXUjsx3GsABJl
         dqMZ7d7B7uBCMFxVHXjmViA/i4dGLcszkLXhJ/8IhALUwYeneTRkKluZ3TC9O/6fe1aO
         vtzbb0RCCoY3Hc1FtJSVV7SappAlV1xU75rEY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716285350; x=1716890150;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=QIL8bJvqQtt10T5yeC3JXxYF7RA/JJU1vyZUZM4XpQE=;
        b=J6g2YyqeoQ4fApYKuJUAbkaqGuL3olj+iPHcFm2KFi5DqmosVire5s+x+0eadjx18h
         4kZSHHYVtRtjs7vkSlU1rq5qxk1/9oms13tSUMiNQtJhFSNYt5tG+r9m7SC9y6pYmpV3
         Hm2HCsJ8MCEQ6V+Hz0mysX0BhlGqP0gSTmoubWpyKETOnxuJeFvcKP8HH3GJLSuqX7JO
         jAO8yL9Nttgptoosz88NZJtSTUmFku6Y6qfz1Cmq82FSPT1y0dnOCWSHGo3cHJ0ZgGq0
         FAdJtel2jcDq0KjtxvsRx/5S9ryd7clbufc0Z2kUocrPDttAVocGIprbDOJ00JkLNEy8
         aUfg==
X-Forwarded-Encrypted: i=1; AJvYcCWZpkZMB/P6Z0tZ4A2Il6OnsD4G8bLK0558BHlmcaw6v3nRBHzvhUWxnrgvwqW/A3JNvoTK8syLSF60VQ5gAjN9S2ZdUAgIK4g+nU7e7C9ACit4
X-Gm-Message-State: AOJu0YyiZSu3WsL18JNxsNuGbY1sMXwVG3d4wcHN51sxkOTVdcTtsy85
	+CsRg/tvP9AnGR9tnpD83oCSIXD23DM/PunQYCQYfacAx1jh7aOufJdJ+29opQ==
X-Google-Smtp-Source: AGHT+IFKIYFqTMarrGIwJW/xjD4E5TP4smgp1LW/1jUBwGpm9C4Gsb/IKEVVDk5X70ezxhmNydvPxw==
X-Received: by 2002:a05:6830:3299:b0:6f2:5b44:593c with SMTP id 46e09a7af769-6f25b445a16mr6106649a34.35.1716285349487;
        Tue, 21 May 2024 02:55:49 -0700 (PDT)
Received: from fshao-p620.tpe.corp.google.com ([2401:fa00:1:10:7412:b980:a8eb:dfa3])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-6f679902e57sm10016198b3a.110.2024.05.21.02.55.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 May 2024 02:55:49 -0700 (PDT)
From: Fei Shao <fshao@chromium.org>
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Hans Verkuil <hverkuil-cisco@xs4all.nl>
Subject: [PATCH] media: mediatek: vcodec: Reduce msg queue trans buffer size
Date: Tue, 21 May 2024 17:54:56 +0800
Message-ID: <20240521095536.3869399-1-fshao@chromium.org>
X-Mailer: git-send-email 2.45.0.rc1.225.g2a3ae87e7f-goog
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240521_025551_764551_321C8557 
X-CRM114-Status: GOOD (  13.15  )
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
Cc: Andrew-CT Chen <andrew-ct.chen@mediatek.com>, Nicolas Dufresne <nicolas.dufresne@collabora.com>, Yunfei Dong <yunfei.dong@mediatek.com>, linux-kernel@vger.kernel.org, Tiffany Lin <tiffany.lin@mediatek.com>, Xiaoyong Lu <xiaoyong.lu@mediatek.com>, linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org, Matthias Brugger <matthias.bgg@gmail.com>, Mauro Carvalho Chehab <mchehab@kernel.org>, Dan Carpenter <dan.carpenter@linaro.org>, linux-media@vger.kernel.org
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

In the MediaTek HW vcodec pipeline, the `trans` buffer is used to
transfer the data decoded by the lat decoder to the core decoder.

In the beginning, 6MB and 30MB were allocated for the trans buffer to
handle FHD and higher-resolution contents respectively, but it turns out
that's more than enough in practice and there's room for improvement.

The buffer sizes were reduced to 5MB / 8MB respectively and the decoders
have been validated to work normally on the MediaTek Android products.
It's time to adopt that change in the upstream MediaTek vcodec driver.

Reduce the msg queue trans buffer size to 5MB / 8MB respectively to
optimize the memory usage per decoder instance and improve the overall
system performance.

Signed-off-by: Fei Shao <fshao@chromium.org>

CC: Yunfei Dong <yunfei.dong@mediatek.com>

---
I consulted Yunfei and he confirmed that these are the sizes they are
using today.

 .../media/platform/mediatek/vcodec/decoder/vdec_msg_queue.c   | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/media/platform/mediatek/vcodec/decoder/vdec_msg_queue.c b/drivers/media/platform/mediatek/vcodec/decoder/vdec_msg_queue.c
index f283c4703dc6..e36741179a97 100644
--- a/drivers/media/platform/mediatek/vcodec/decoder/vdec_msg_queue.c
+++ b/drivers/media/platform/mediatek/vcodec/decoder/vdec_msg_queue.c
@@ -29,9 +29,9 @@
 static int vde_msg_queue_get_trans_size(int width, int height)
 {
 	if (width > 1920 || height > 1088)
-		return 30 * SZ_1M;
+		return 8 * SZ_1M;
 	else
-		return 6 * SZ_1M;
+		return 5 * SZ_1M;
 }
 
 void vdec_msg_queue_init_ctx(struct vdec_msg_queue_ctx *ctx, int hardware_index)
-- 
2.45.0.rc1.225.g2a3ae87e7f-goog


