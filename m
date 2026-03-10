Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 93FCBFD4F2E
	for <linux-mediatek@archiver.kernel.org>; Tue, 10 Mar 2026 20:05:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=DPTwHYGbckptva0R18TL8RRhJ8bcbXMlJm3dcfwo28E=; b=Mvp32L5gRK3DZbKugpD4RPjjFA
	nnwx1eFMjeB4fvB7seLNNTiNTzRDOmzSJKdJONhrSY44M6aUOczlIbyL5G1osI+GXst1EAi7BXwTq
	H00yDoPOH6eBW1VDn22QMCf8JcQrvhZpOBp+/rXpgG8m5NIOSSxHxGtBIvt/dOJDcKfGV96R1Pf7e
	YKW2lBYohNtz3yNZ/D9ScIWFYDskvhlKXhVDogKoA++isJSEOhcswR5sNG1QilNSSzCw3ryxrV6kQ
	rqV4I8M/v2r/9DXR3necZIrK+QswTJePG1Lu/21CD5XVcS4gNgNyjZJNq8MewQSjQYtyDyV5KqCWB
	s+RdNOKQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w03Ko-0000000ADa7-2cJA;
	Tue, 10 Mar 2026 20:05:42 +0000
Received: from mail-pf1-x436.google.com ([2607:f8b0:4864:20::436])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w03Km-0000000ADZ7-2NU4
	for linux-mediatek@lists.infradead.org;
	Tue, 10 Mar 2026 20:05:41 +0000
Received: by mail-pf1-x436.google.com with SMTP id d2e1a72fcca58-8299f1ca86fso2212260b3a.0
        for <linux-mediatek@lists.infradead.org>; Tue, 10 Mar 2026 13:05:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773173140; x=1773777940; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=DPTwHYGbckptva0R18TL8RRhJ8bcbXMlJm3dcfwo28E=;
        b=RHzKjNQFUu6Ex/jTuI9efzG308qos0raZgJTtslaY4yNpJmbKqFWzYJrIAKBydipVc
         2W5yD7amdAPidOmsEsE09z30YyGP+/SVTuTO+q2SLauhit6xRbUAwvrcByBdhJsvHRhH
         mPtaJBpUjWdAA0MtHVLn46SK1MoOqvae6Clt1ROvBJ7iBnqL976u71XK2OW7n0mURM8V
         JZFgPDkhU/auWjnmhSfP+pgwWo8AqcxIjJoLxpufuTbWPN4hDn9Nya91EfjXuLbIZZqA
         zUiEdpVk2D7/2Zwep5vV1L6VK5j431I7wVnRPkyctvKXU9XCRr5YANY09z30T6EBHt/E
         LPrA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773173140; x=1773777940;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=DPTwHYGbckptva0R18TL8RRhJ8bcbXMlJm3dcfwo28E=;
        b=FoplrlTwm98gHewTlvTX6w97SyJaQbNNP04lfOPSyq0hXH9F4lwU1cw703jqYKGQQJ
         8+N7ctELC9kpX6NE+L+Fw+ty47DQwSYTPEIt5ZvpvSN5LrHyHKz5OlMibQDlrCDv5GAJ
         3m0T5ABWZAXgAhHkzM0XtCS8Q5j5TrnXsZJ6NBzuzghMgTBaf0aFzUOQi6xwPfmNQEBs
         +ZsOaY4LOHws23+vHOq4dQDCmEed9cxoCOQhcFY75OcodkSmnDlUtGmyfZnV1rA5KuRV
         OMQyJMR90SCuDbxtbeXu55O7fepAjdaWhB/WgUw3JyCX+DPlozEFOzL3V70PVgChEjdj
         e2yQ==
X-Forwarded-Encrypted: i=1; AJvYcCXAJrk+dDhvds8Hjbk4hn6BmvYM5ouNyRCFinM+/U7ujAiGJX39wrYCS/RBw+lOkOFUVsN5v5LXnOzIxwDJow==@lists.infradead.org
X-Gm-Message-State: AOJu0Yw0LavZ2tqhB33aT9iLzDNYPhALPU7PMeXDptTQ5ra3ZeXYs0Xf
	n0UfGu+Y0hzEiJbdEnluX60fTu7PtczSLv1y+p5xCN89sioHlDa45tNq
X-Gm-Gg: ATEYQzzPdhn7uFZbo87FcaKnIL1i1aOg0K64R2rcaGdKY5hoQZK/vLybO7+weVeuiWp
	BAPV9jR1ngX6xoWGQ75eedQK1YXHjh50W9hqRAQHHLDTvgEyOM1XhfmrbPJibjY0SieXelSE2tK
	PTuBv2bXMUvMmkychB8NiQHK5xXLDEi2Z+SuLKa0KjcyVHyz+Ytu7tm0qhFjMFdD5TLG42UJN9x
	ajgmncV9vnEm8dJJf+I4hMmYsvPGQ7OqL3NoRQuetvs99jGj/d8FlxOcEI7bAB9IhJUf8YECvbc
	DQzl0mAT1sHH3mcOow30CVVKBoOOodi/I6sL2LIUEJdAb8Kg5zp66qnO9aJFmhdz7FxiBzZx3cE
	oTDl64pYI8gZWDa29okWiiN3ja1/du3WRUVI5PXTaBxvQiMzxI8UKfD5CYMwDn2ywR1yiKCzNlb
	ymTU461Y6H4vG+eKXcd8zl9VMsTWQIGgdUjRUB/iqY38CVupAi
X-Received: by 2002:a05:6a00:3397:b0:823:f96:63bb with SMTP id d2e1a72fcca58-829f721d2bfmr102248b3a.52.1773173139764;
        Tue, 10 Mar 2026 13:05:39 -0700 (PDT)
Received: from hu-ckantibh-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-829f6dc2d0asm101660b3a.13.2026.03.10.13.05.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Mar 2026 13:05:39 -0700 (PDT)
From: Sanjay Chitroda <sanjayembeddedse@gmail.com>
X-Google-Original-From: Sanjay Chitroda <sanjayembedded@gmail.com>
To: jic23@kernel.org,
	m.tretter@pengutronix.de,
	mchehab@kernel.org,
	p.zabel@pengutronix.de,
	tiffany.lin@mediatek.com,
	andrew-ct.chen@mediatek.com,
	yunfei.dong@mediatek.com,
	matthias.bgg@gmail.com,
	angelogioacchino.delregno@collabora.com,
	johan@kernel.org,
	elder@kernel.org,
	gregkh@linuxfoundation.org,
	pure.logic@nexus-software.ie
Cc: dlechner@baylibre.com,
	nuno.sa@analog.com,
	andy@kernel.org,
	kernel@pengutronix.de,
	kees@kernel.org,
	nabijaczleweli@nabijaczleweli.xyz,
	marcelo.schmitt1@gmail.com,
	maudspierings@gocontroll.com,
	hverkuil+cisco@kernel.org,
	ribalda@chromium.org,
	straube.linux@gmail.com,
	dan.carpenter@linaro.org,
	lukagejak5@gmail.com,
	ethantidmore06@gmail.com,
	samasth.norway.ananda@oracle.com,
	karanja99erick@gmail.com,
	s9430939@naver.com,
	tglx@kernel.org,
	mingo@kernel.org,
	sun.jian.kdev@gmail.com,
	weibu@redadmin.org,
	linux-iio@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-media@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	greybus-dev@lists.linaro.org,
	linux-staging@lists.linux.dev,
	sanjayembeddedse@gmail.com,
	skhan@linuxfoundation.org
Subject: [PATCH 1/7] staging: greybus: simplify cleanup using __free
Date: Wed, 11 Mar 2026 01:35:07 +0530
Message-Id: <20260310200513.2162018-2-sanjayembedded@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260310200513.2162018-1-sanjayembedded@gmail.com>
References: <20260310200513.2162018-1-sanjayembedded@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260310_130540_624961_5E435DFF 
X-CRM114-Status: GOOD (  13.33  )
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

From: Sanjay Chitroda <sanjayembeddedse@gmail.com>

Replace manual cleanup logic with __free attribute from cleanup.h. This
removes explicit kfree() calls and simplifies the error handling paths.

No functional change intended for kmalloc().

Signed-off-by: Sanjay Chitroda <sanjayembeddedse@gmail.com>
---
 drivers/staging/greybus/camera.c   | 27 +++++++----------------
 drivers/staging/greybus/loopback.c | 35 ++++++++++--------------------
 drivers/staging/greybus/raw.c      |  6 ++---
 3 files changed, 22 insertions(+), 46 deletions(-)

diff --git a/drivers/staging/greybus/camera.c b/drivers/staging/greybus/camera.c
index 62b55bb28408..14a603ca2400 100644
--- a/drivers/staging/greybus/camera.c
+++ b/drivers/staging/greybus/camera.c
@@ -519,8 +519,6 @@ static int gb_camera_configure_streams(struct gb_camera *gcam,
 				       struct gb_camera_stream_config *streams,
 				       struct gb_camera_csi_params *csi_params)
 {
-	struct gb_camera_configure_streams_request *req;
-	struct gb_camera_configure_streams_response *resp;
 	unsigned int nstreams = *num_streams;
 	unsigned int i;
 	size_t req_size;
@@ -533,11 +531,11 @@ static int gb_camera_configure_streams(struct gb_camera *gcam,
 	req_size = sizeof(*req) + nstreams * sizeof(req->config[0]);
 	resp_size = sizeof(*resp) + nstreams * sizeof(resp->config[0]);
 
-	req = kmalloc(req_size, GFP_KERNEL);
-	resp = kmalloc(resp_size, GFP_KERNEL);
+	struct gb_camera_configure_streams_request *req __free(kfree) =
+	    kmalloc(req_size, GFP_KERNEL);
+	struct gb_camera_configure_streams_response *resp __free(kfree) =
+	    kmalloc(resp_size, GFP_KERNEL);
 	if (!req || !resp) {
-		kfree(req);
-		kfree(resp);
 		return -ENOMEM;
 	}
 
@@ -641,8 +639,6 @@ static int gb_camera_configure_streams(struct gb_camera *gcam,
 
 done_skip_pm_put:
 	mutex_unlock(&gcam->mutex);
-	kfree(req);
-	kfree(resp);
 	return ret;
 }
 
@@ -650,7 +646,6 @@ static int gb_camera_capture(struct gb_camera *gcam, u32 request_id,
 			     unsigned int streams, unsigned int num_frames,
 			     size_t settings_size, const void *settings)
 {
-	struct gb_camera_capture_request *req;
 	size_t req_size;
 	int ret;
 
@@ -658,7 +653,8 @@ static int gb_camera_capture(struct gb_camera *gcam, u32 request_id,
 		return -EINVAL;
 
 	req_size = sizeof(*req) + settings_size;
-	req = kmalloc(req_size, GFP_KERNEL);
+	struct gb_camera_capture_request *req __free(kfree) =
+	    kmalloc(req_size, GFP_KERNEL);
 	if (!req)
 		return -ENOMEM;
 
@@ -680,8 +676,6 @@ static int gb_camera_capture(struct gb_camera *gcam, u32 request_id,
 done:
 	mutex_unlock(&gcam->mutex);
 
-	kfree(req);
-
 	return ret;
 }
 
@@ -870,16 +864,15 @@ static ssize_t gb_camera_debugfs_capabilities(struct gb_camera *gcam,
 		&gcam->debugfs.buffers[GB_CAMERA_DEBUGFS_BUFFER_CAPABILITIES];
 	size_t size = 1024;
 	unsigned int i;
-	u8 *caps;
 	int ret;
 
-	caps = kmalloc(size, GFP_KERNEL);
+	u8 *caps __free(kfree) = kmalloc(size, GFP_KERNEL);
 	if (!caps)
 		return -ENOMEM;
 
 	ret = gb_camera_capabilities(gcam, caps, &size);
 	if (ret < 0)
-		goto done;
+		return ret;
 
 	/*
 	 * hex_dump_to_buffer() doesn't return the number of bytes dumped prior
@@ -893,10 +886,6 @@ static ssize_t gb_camera_debugfs_capabilities(struct gb_camera *gcam,
 		buffer->length += sprintf(buffer->data + buffer->length,
 					  "%*ph\n", nbytes, caps + i);
 	}
-
-done:
-	kfree(caps);
-	return ret;
 }
 
 static ssize_t gb_camera_debugfs_configure_streams(struct gb_camera *gcam,
diff --git a/drivers/staging/greybus/loopback.c b/drivers/staging/greybus/loopback.c
index aa9c73cb0ae5..ae729f744ac5 100644
--- a/drivers/staging/greybus/loopback.c
+++ b/drivers/staging/greybus/loopback.c
@@ -508,10 +508,10 @@ static int gb_loopback_async_operation(struct gb_loopback *gb, int type,
 
 static int gb_loopback_sync_sink(struct gb_loopback *gb, u32 len)
 {
-	struct gb_loopback_transfer_request *request;
 	int retval;
 
-	request = kmalloc(len + sizeof(*request), GFP_KERNEL);
+	struct gb_loopback_transfer_request *request __free(kfree) =
+		kmalloc(len + sizeof(*request), GFP_KERNEL);
 	if (!request)
 		return -ENOMEM;
 
@@ -519,25 +519,24 @@ static int gb_loopback_sync_sink(struct gb_loopback *gb, u32 len)
 	retval = gb_loopback_operation_sync(gb, GB_LOOPBACK_TYPE_SINK,
 					    request, len + sizeof(*request),
 					    NULL, 0);
-	kfree(request);
 	return retval;
 }
 
 static int gb_loopback_sync_transfer(struct gb_loopback *gb, u32 len)
 {
-	struct gb_loopback_transfer_request *request;
-	struct gb_loopback_transfer_response *response;
 	int retval;
 
 	gb->apbridge_latency_ts = 0;
 	gb->gbphy_latency_ts = 0;
 
-	request = kmalloc(len + sizeof(*request), GFP_KERNEL);
+	struct gb_loopback_transfer_request *request __free(kfree) =
+		kmalloc(len + sizeof(*request), GFP_KERNEL);
 	if (!request)
 		return -ENOMEM;
-	response = kmalloc(len + sizeof(*response), GFP_KERNEL);
+
+	struct gb_loopback_transfer_response *response __free(kfree) =
+		kmalloc(len + sizeof(*response), GFP_KERNEL);
 	if (!response) {
-		kfree(request);
 		return -ENOMEM;
 	}
 
@@ -548,7 +547,7 @@ static int gb_loopback_sync_transfer(struct gb_loopback *gb, u32 len)
 					    request, len + sizeof(*request),
 					    response, len + sizeof(*response));
 	if (retval)
-		goto gb_error;
+		return retval;
 
 	if (memcmp(request->data, response->data, len)) {
 		dev_err(&gb->connection->bundle->dev,
@@ -558,10 +557,6 @@ static int gb_loopback_sync_transfer(struct gb_loopback *gb, u32 len)
 	gb->apbridge_latency_ts = (u32)__le32_to_cpu(response->reserved0);
 	gb->gbphy_latency_ts = (u32)__le32_to_cpu(response->reserved1);
 
-gb_error:
-	kfree(request);
-	kfree(response);
-
 	return retval;
 }
 
@@ -573,10 +568,10 @@ static int gb_loopback_sync_ping(struct gb_loopback *gb)
 
 static int gb_loopback_async_sink(struct gb_loopback *gb, u32 len)
 {
-	struct gb_loopback_transfer_request *request;
 	int retval;
 
-	request = kmalloc(len + sizeof(*request), GFP_KERNEL);
+	struct gb_loopback_transfer_request *request __free(kfree) =
+		kmalloc(len + sizeof(*request), GFP_KERNEL);
 	if (!request)
 		return -ENOMEM;
 
@@ -584,7 +579,6 @@ static int gb_loopback_async_sink(struct gb_loopback *gb, u32 len)
 	retval = gb_loopback_async_operation(gb, GB_LOOPBACK_TYPE_SINK,
 					     request, len + sizeof(*request),
 					     0, NULL);
-	kfree(request);
 	return retval;
 }
 
@@ -621,10 +615,10 @@ static int gb_loopback_async_transfer_complete(
 
 static int gb_loopback_async_transfer(struct gb_loopback *gb, u32 len)
 {
-	struct gb_loopback_transfer_request *request;
 	int retval, response_len;
 
-	request = kmalloc(len + sizeof(*request), GFP_KERNEL);
+	struct gb_loopback_transfer_request *request __free(kfree) =
+		kmalloc(len + sizeof(*request), GFP_KERNEL);
 	if (!request)
 		return -ENOMEM;
 
@@ -636,11 +630,6 @@ static int gb_loopback_async_transfer(struct gb_loopback *gb, u32 len)
 					     request, len + sizeof(*request),
 					     len + response_len,
 					     gb_loopback_async_transfer_complete);
-	if (retval)
-		goto gb_error;
-
-gb_error:
-	kfree(request);
 	return retval;
 }
 
diff --git a/drivers/staging/greybus/raw.c b/drivers/staging/greybus/raw.c
index 3027a2c25bcd..60a754b20432 100644
--- a/drivers/staging/greybus/raw.c
+++ b/drivers/staging/greybus/raw.c
@@ -126,15 +126,14 @@ static int gb_raw_request_handler(struct gb_operation *op)
 static int gb_raw_send(struct gb_raw *raw, u32 len, const char __user *data)
 {
 	struct gb_connection *connection = raw->connection;
-	struct gb_raw_send_request *request;
 	int retval;
 
-	request = kmalloc(len + sizeof(*request), GFP_KERNEL);
+	struct gb_raw_send_request *request __free(kfree) =
+	    kmalloc(len + sizeof(*request), GFP_KERNEL);
 	if (!request)
 		return -ENOMEM;
 
 	if (copy_from_user(&request->data[0], data, len)) {
-		kfree(request);
 		return -EFAULT;
 	}
 
@@ -144,7 +143,6 @@ static int gb_raw_send(struct gb_raw *raw, u32 len, const char __user *data)
 				   request, len + sizeof(*request),
 				   NULL, 0);
 
-	kfree(request);
 	return retval;
 }
 
-- 
2.34.1


