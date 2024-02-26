Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4F4B8C5478C
	for <linux-mediatek@archiver.kernel.org>; Mon, 26 Feb 2024 17:33:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=MaYfpx4jqxqKQ4ygGfIX8XBKNx0fRub/o4Qatc3GlF4=; b=tPRKmT9a6DqEbAl5zAdyf+S3Kl
	c7vefeVAK7KIou2OIWDz/ywLO3kgZKLwyoj1Bx9b2WuPi7oUvbhg54VQhjvxB+yOhllJ5HG9Oe1eZ
	oFN91aDoumjbwY4Bw/u8LKeLkqt1p2ljVb3ObyhGsMzY8TO6bi1S4d/7Ik4r0wqesRCXKyyIHbqzZ
	My6aa+A/warjgq5uiXsZVpxGqEwZ240nnF+om3d8BFvQZMq8TLxissTPPSmOgGnOgFu7irvIPNVfT
	lFp8HefAAgNO6yyEaviClDXq+4VISPjYLUIKB8QJPHQoO6q2RvymdXdhfBnn1cgiDAInVCR/PNeU1
	zUpIvo3w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1reeql-00000001zoX-3GpL;
	Mon, 26 Feb 2024 17:33:11 +0000
Received: from mail-qk1-x72d.google.com ([2607:f8b0:4864:20::72d])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1reeqT-00000001za7-3Oeg
	for linux-mediatek@lists.infradead.org;
	Mon, 26 Feb 2024 17:32:57 +0000
Received: by mail-qk1-x72d.google.com with SMTP id af79cd13be357-787b5c68253so235046085a.2
        for <linux-mediatek@lists.infradead.org>; Mon, 26 Feb 2024 09:32:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1708968771; x=1709573571; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=MaYfpx4jqxqKQ4ygGfIX8XBKNx0fRub/o4Qatc3GlF4=;
        b=jgjiVVac57E6m9n4l9K/glI7XCrxDni60Vy8+H9it16mQ701EoA8EHxgOSjdytSNCp
         276RjlbpKfJhByiO+egQB7SVdzW1eYSYAt0Z9OpMR7h3LodlDZo7RZ2xepiKvck+cZEQ
         qAhe0vLOOutwMRF2tG/ez2SYLEMZf0uU1+8d4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708968771; x=1709573571;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=MaYfpx4jqxqKQ4ygGfIX8XBKNx0fRub/o4Qatc3GlF4=;
        b=HAlbSEjn3n+BZsZLyvX0xxc/F5mLgE5ptOxOYKRRO+ighx/Sd+riH1mjT6GdMJE7Ib
         VgKITjmjeCbDGws2VQbLGyb60llwuAU7l0R+6kBtakeYLxbXxlNwit+h6j3G+vuUEroo
         Kiao0gvUAv8pwjF36LlxI/Pix+Ge+pvFCcgTyJge/OxemSyZzreKVK1ENDdWVKSlybeL
         z3K6epLGCTV52mTfBac9DO+Y22rA7wd2/lxjxdxkfzC+UVMtbDvryLep2T5kskaVgaul
         7o5ikgQLz/EDIBIFTBaGtjacTt8KX6tImrAyKpS5kUwMID8r+1u8ceh3lTUrUvG12ATd
         FDsg==
X-Forwarded-Encrypted: i=1; AJvYcCXCbWUzA6pJC1unJ6xj3yd3428m/EzFfQjx+hHe9Vy4gsGzbhERM5XIAYWaA/ggEnFAf68kZq2rX5Zx++ERDh2E/dDpl7Y26IzUOGD9bu6ZsRxQ
X-Gm-Message-State: AOJu0Yxmc5cPNlyHiJbUY4Ifr2TNMSONXMeXOIw4kaN+p1S+illXwcUV
	ZHToqGTzDAJ+20RIkE0VbM+GpS0Nu1DQ7DGiL2l9yNnYI4MTIRAEeqXlfIkvyheZ9btYLNUpibI
	=
X-Google-Smtp-Source: AGHT+IFPFo6h6yoUZfpwUnRcJdbbOQwMO+GXxTDc9YEiO9pMJYeFAGXUAR4HJURnNZTsUOrD6721QA==
X-Received: by 2002:a05:620a:17aa:b0:787:c71f:a55c with SMTP id ay42-20020a05620a17aa00b00787c71fa55cmr7498759qkb.59.1708968770886;
        Mon, 26 Feb 2024 09:32:50 -0800 (PST)
Received: from denia.c.googlers.com (115.25.199.35.bc.googleusercontent.com. [35.199.25.115])
        by smtp.gmail.com with ESMTPSA id b11-20020a05620a04eb00b0078725d0345dsm2672669qkh.2.2024.02.26.09.32.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Feb 2024 09:32:50 -0800 (PST)
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Mon, 26 Feb 2024 17:32:45 +0000
Subject: [PATCH v2 2/3] media: usb: pvrusb2: Fix Wcast-function-type-strict
 warnings
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240226-fix-clang-warnings-v2-2-fa1bc931d17e@chromium.org>
References: <20240226-fix-clang-warnings-v2-0-fa1bc931d17e@chromium.org>
In-Reply-To: <20240226-fix-clang-warnings-v2-0-fa1bc931d17e@chromium.org>
To: Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Nathan Chancellor <nathan@kernel.org>, 
 Nick Desaulniers <ndesaulniers@google.com>, 
 Bill Wendling <morbo@google.com>, Justin Stitt <justinstitt@google.com>, 
 Mike Isely <isely@pobox.com>, Tiffany Lin <tiffany.lin@mediatek.com>, 
 Andrew-CT Chen <andrew-ct.chen@mediatek.com>, 
 Yunfei Dong <yunfei.dong@mediatek.com>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Bjorn Andersson <andersson@kernel.org>, 
 Mathieu Poirier <mathieu.poirier@linaro.org>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, 
 llvm@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
 linux-mediatek@lists.infradead.org, linux-remoteproc@vger.kernel.org, 
 Ricardo Ribalda <ribalda@chromium.org>
X-Mailer: b4 0.12.4
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240226_093253_929827_94E8ABD1 
X-CRM114-Status: GOOD (  11.68  )
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
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Building with LLVM=1 throws the following warning:
drivers/media/usb/pvrusb2/pvrusb2-context.c:110:6: warning: cast from 'void (*)(struct pvr2_context *)' to 'void (*)(void *)' converts to incompatible function type [-Wcast-function-type-strict]
drivers/media/usb/pvrusb2/pvrusb2-v4l2.c:1070:30: warning: cast from 'void (*)(struct pvr2_v4l2_fh *)' to 'pvr2_stream_callback' (aka 'void (*)(void *)') converts to incompatible function type [-Wcast-function-type-strict] drivers/media/usb/pvrusb2/pvrusb2-dvb.c:152:6: warning: cast from 'void (*)(struct pvr2_dvb_adapter *)' to 'pvr2_stream_callback' (aka 'void (*)(void *)') converts to incompatible function type [-Wcast-function-type-strict]

Reviewed-by: Nathan Chancellor <nathan@kernel.org>
Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
---
 drivers/media/usb/pvrusb2/pvrusb2-context.c | 5 +++--
 drivers/media/usb/pvrusb2/pvrusb2-dvb.c     | 7 ++++---
 drivers/media/usb/pvrusb2/pvrusb2-v4l2.c    | 7 ++++---
 3 files changed, 11 insertions(+), 8 deletions(-)

diff --git a/drivers/media/usb/pvrusb2/pvrusb2-context.c b/drivers/media/usb/pvrusb2/pvrusb2-context.c
index 1764674de98bc..16edabda191c4 100644
--- a/drivers/media/usb/pvrusb2/pvrusb2-context.c
+++ b/drivers/media/usb/pvrusb2/pvrusb2-context.c
@@ -90,8 +90,9 @@ static void pvr2_context_destroy(struct pvr2_context *mp)
 }
 
 
-static void pvr2_context_notify(struct pvr2_context *mp)
+static void pvr2_context_notify(void *data)
 {
+	struct pvr2_context *mp = data;
 	pvr2_context_set_notify(mp,!0);
 }
 
@@ -107,7 +108,7 @@ static void pvr2_context_check(struct pvr2_context *mp)
 			   "pvr2_context %p (initialize)", mp);
 		/* Finish hardware initialization */
 		if (pvr2_hdw_initialize(mp->hdw,
-					(void (*)(void *))pvr2_context_notify,
+					pvr2_context_notify,
 					mp)) {
 			mp->video_stream.stream =
 				pvr2_hdw_get_video_stream(mp->hdw);
diff --git a/drivers/media/usb/pvrusb2/pvrusb2-dvb.c b/drivers/media/usb/pvrusb2/pvrusb2-dvb.c
index 26811efe0fb58..8b9f1a09bd53d 100644
--- a/drivers/media/usb/pvrusb2/pvrusb2-dvb.c
+++ b/drivers/media/usb/pvrusb2/pvrusb2-dvb.c
@@ -88,8 +88,9 @@ static int pvr2_dvb_feed_thread(void *data)
 	return stat;
 }
 
-static void pvr2_dvb_notify(struct pvr2_dvb_adapter *adap)
+static void pvr2_dvb_notify(void *data)
 {
+	struct pvr2_dvb_adapter *adap = data;
 	wake_up(&adap->buffer_wait_data);
 }
 
@@ -148,8 +149,8 @@ static int pvr2_dvb_stream_do_start(struct pvr2_dvb_adapter *adap)
 		if (!(adap->buffer_storage[idx])) return -ENOMEM;
 	}
 
-	pvr2_stream_set_callback(pvr->video_stream.stream,
-				 (pvr2_stream_callback) pvr2_dvb_notify, adap);
+	pvr2_stream_set_callback(pvr->video_stream.stream, pvr2_dvb_notify,
+				 adap);
 
 	ret = pvr2_stream_set_buffer_count(stream, PVR2_DVB_BUFFER_COUNT);
 	if (ret < 0) return ret;
diff --git a/drivers/media/usb/pvrusb2/pvrusb2-v4l2.c b/drivers/media/usb/pvrusb2/pvrusb2-v4l2.c
index c04ab7258d645..590f80949bbfc 100644
--- a/drivers/media/usb/pvrusb2/pvrusb2-v4l2.c
+++ b/drivers/media/usb/pvrusb2/pvrusb2-v4l2.c
@@ -1032,9 +1032,10 @@ static int pvr2_v4l2_open(struct file *file)
 	return 0;
 }
 
-
-static void pvr2_v4l2_notify(struct pvr2_v4l2_fh *fhp)
+static void pvr2_v4l2_notify(void *data)
 {
+	struct pvr2_v4l2_fh *fhp = data;
+
 	wake_up(&fhp->wait_data);
 }
 
@@ -1067,7 +1068,7 @@ static int pvr2_v4l2_iosetup(struct pvr2_v4l2_fh *fh)
 
 	hdw = fh->channel.mc_head->hdw;
 	sp = fh->pdi->stream->stream;
-	pvr2_stream_set_callback(sp,(pvr2_stream_callback)pvr2_v4l2_notify,fh);
+	pvr2_stream_set_callback(sp, pvr2_v4l2_notify, fh);
 	pvr2_hdw_set_stream_type(hdw,fh->pdi->config);
 	if ((ret = pvr2_hdw_set_streaming(hdw,!0)) < 0) return ret;
 	return pvr2_ioread_set_enabled(fh->rhp,!0);

-- 
2.44.0.rc0.258.g7320e95886-goog


