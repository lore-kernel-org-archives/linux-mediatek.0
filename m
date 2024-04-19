Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ECA6FC4345F
	for <linux-mediatek@archiver.kernel.org>; Fri, 19 Apr 2024 11:01:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=2ozatrqAUW665TsgI+DgE6yWy8Evw1+ngHGTHDukygk=; b=RVkXbJ9YmWiAS9RWfSJS5RJ2EW
	QFH8LBsjngbuUemqkEqwJm/yOrR9CY1tsnuRarLYf0mtZpKo2vE2L3Ds02s+q3SxX023eQ4HolO81
	HGnI3DUuxhp0hCpPz+Yj2Xv+YQiafcV1OkidDC/r9VHrlOFszYqks+cxmRG4/Ou0qM2FKL7dLbL1j
	j8tNjycG0/rr0D4xk1OWaiaIo07RW8nzFnr3hCxDlTOqiwDVxnEFR7/bz9IaAhgsw6FNQGGh6jpAT
	47HhdboZSFiotkeOH+XQ5YpganHay3xjsQ2dtLl78ArgzGGXCSK6Ska6/W2fLxqxWsADTfpVH/81P
	vA2WceSg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rxlzo-00000005No7-2cJF;
	Fri, 19 Apr 2024 11:01:32 +0000
Received: from mail-qk1-x72e.google.com ([2607:f8b0:4864:20::72e])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rxksB-000000058qs-0YFZ
	for linux-mediatek@lists.infradead.org;
	Fri, 19 Apr 2024 09:49:38 +0000
Received: by mail-qk1-x72e.google.com with SMTP id af79cd13be357-78edc3ad5fdso150396385a.0
        for <linux-mediatek@lists.infradead.org>; Fri, 19 Apr 2024 02:49:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1713520163; x=1714124963; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=2ozatrqAUW665TsgI+DgE6yWy8Evw1+ngHGTHDukygk=;
        b=cYzd7AR+I0kDzZxmUOUBO7rkmvOlZ1IERsxkRG+PSGAMSSB+vRpVW6xk5g+TwPdPx4
         BmowT1Hx9KJM15grRacDI0iOc9JEcbAt3A414bdTWILrUAbSH0c3JJKFWBr6N/gKM41R
         S8LLeV3md4IpDJA26CfMHGh5XWhqi1R8eyXYI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713520163; x=1714124963;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=2ozatrqAUW665TsgI+DgE6yWy8Evw1+ngHGTHDukygk=;
        b=X1+nIYWALYJDmz75sMOGNR+TQTMNrDei4RpwdG/JEO8d6dJw/MDiOsUYIIgdLZ5ZZI
         jjuXfgYVRoA2Kykjt7dR01zIYeDGk/+tkwOvah0PW4QCUGjnJLyZqwVbXP+QoGxtlm6T
         n+9rNT+tWmM7qEJGADkKg8e2WjteVcTlWLO+sQr+ctxZMnbS4SFEnVHZTT30tX5O5raH
         dFvWTIMXZtqiwzv/gEtcqdGU+VRqYPtWvV6bMfKDI96cESiakJPXSlwxQfebxPFTMyN8
         2JXPwyzr/aZRu5v/2Xpct3ZI9MN5yPkJWpSIj6xkr/wtxh5APxvsJsQinOaNv2lnIOzw
         BSqQ==
X-Forwarded-Encrypted: i=1; AJvYcCWXp55OqZoLUGFcNhYVi7TgbjQSzHva8Z8cSL9nAhjgjLKdJv3t/8vHSQ2Ak29JdNemLs1LUrOR+Zqwnlp0DWnp19BMhomtBNVx41uj07U3+2iX
X-Gm-Message-State: AOJu0YzOs6kqdzOyxVWmi9ynJfAqXba15N9oD+sDapl6UUzCXiw5dXNJ
	IOvcw84eLuj9BVMq1W+go31FBe+zlPrICKJH7MJfmFj+T1okWRjABxDxG0hang==
X-Google-Smtp-Source: AGHT+IGs3CfAvghko2vWhqg08VmqqoJ6LlEsRGr+WfzIJbh8ON10G5msy3tcDSad7YCzEwumD2LtKA==
X-Received: by 2002:a05:620a:44c3:b0:78e:e679:23cf with SMTP id y3-20020a05620a44c300b0078ee67923cfmr7789538qkp.1.1713520161754;
        Fri, 19 Apr 2024 02:49:21 -0700 (PDT)
Received: from denia.c.googlers.com (114.152.245.35.bc.googleusercontent.com. [35.245.152.114])
        by smtp.gmail.com with ESMTPSA id dt14-20020a05620a478e00b0078d735ca917sm1434532qkb.123.2024.04.19.02.49.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 19 Apr 2024 02:49:21 -0700 (PDT)
From: Ricardo Ribalda <ribalda@chromium.org>
Date: Fri, 19 Apr 2024 09:47:49 +0000
Subject: [PATCH v2 03/26] media: uvcvideo: Refactor iterators
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240419-fix-cocci-v2-3-2119e692309c@chromium.org>
References: <20240419-fix-cocci-v2-0-2119e692309c@chromium.org>
In-Reply-To: <20240419-fix-cocci-v2-0-2119e692309c@chromium.org>
To: Martin Tuma <martin.tuma@digiteqautomotive.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
 Hugues Fruchet <hugues.fruchet@foss.st.com>, 
 Alain Volmat <alain.volmat@foss.st.com>, 
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
 Alexandre Torgue <alexandre.torgue@foss.st.com>, 
 Paul Kocialkowski <paul.kocialkowski@bootlin.com>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Chen-Yu Tsai <wens@csie.org>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Samuel Holland <samuel@sholland.org>, 
 Sakari Ailus <sakari.ailus@linux.intel.com>, 
 Thierry Reding <thierry.reding@gmail.com>, 
 Jonathan Hunter <jonathanh@nvidia.com>, 
 Sowjanya Komatineni <skomatineni@nvidia.com>, 
 Luca Ceresoli <luca.ceresoli@bootlin.com>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Hans Verkuil <hverkuil@xs4all.nl>, Sergey Kozlov <serjk@netup.ru>, 
 Abylay Ospan <aospan@netup.ru>, 
 Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>, 
 Dmitry Osipenko <digetx@gmail.com>, 
 Benjamin Mugnier <benjamin.mugnier@foss.st.com>, 
 Sylvain Petinot <sylvain.petinot@foss.st.com>, 
 Stanimir Varbanov <stanimir.k.varbanov@gmail.com>, 
 Vikash Garodia <quic_vgarodia@quicinc.com>, 
 Bryan O'Donoghue <bryan.odonoghue@linaro.org>, 
 Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konrad.dybcio@linaro.org>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-stm32@st-md-mailman.stormreply.com, 
 linux-arm-kernel@lists.infradead.org, linux-staging@lists.linux.dev, 
 linux-sunxi@lists.linux.dev, linux-tegra@vger.kernel.org, 
 linux-mediatek@lists.infradead.org, linux-arm-msm@vger.kernel.org, 
 Ricardo Ribalda <ribalda@chromium.org>, 
 Sergey Senozhatsky <senozhatsky@chromium.org>
X-Mailer: b4 0.12.4
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240419_024935_331930_D366324A 
X-CRM114-Status: GOOD (  15.92  )
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

Avoid using the iterators after the list_for_each() constructs.
This patch should be a NOP, but makes cocci, happier:

drivers/media/usb/uvc/uvc_ctrl.c:1861:44-50: ERROR: invalid reference to the index variable of the iterator on line 1850
drivers/media/usb/uvc/uvc_ctrl.c:2195:17-23: ERROR: invalid reference to the index variable of the iterator on line 2179

Reviewed-by: Sergey Senozhatsky <senozhatsky@chromium.org>
Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
---
 drivers/media/usb/uvc/uvc_ctrl.c | 24 +++++++++++++-----------
 1 file changed, 13 insertions(+), 11 deletions(-)

diff --git a/drivers/media/usb/uvc/uvc_ctrl.c b/drivers/media/usb/uvc/uvc_ctrl.c
index e59a463c2761..a4a987913430 100644
--- a/drivers/media/usb/uvc/uvc_ctrl.c
+++ b/drivers/media/usb/uvc/uvc_ctrl.c
@@ -1850,16 +1850,18 @@ int __uvc_ctrl_commit(struct uvc_fh *handle, int rollback,
 	list_for_each_entry(entity, &chain->entities, chain) {
 		ret = uvc_ctrl_commit_entity(chain->dev, entity, rollback,
 					     &err_ctrl);
-		if (ret < 0)
+		if (ret < 0) {
+			if (ctrls)
+				ctrls->error_idx =
+					uvc_ctrl_find_ctrl_idx(entity, ctrls,
+							       err_ctrl);
 			goto done;
+		}
 	}
 
 	if (!rollback)
 		uvc_ctrl_send_events(handle, ctrls->controls, ctrls->count);
 done:
-	if (ret < 0 && ctrls)
-		ctrls->error_idx = uvc_ctrl_find_ctrl_idx(entity, ctrls,
-							  err_ctrl);
 	mutex_unlock(&chain->ctrl_mutex);
 	return ret;
 }
@@ -2165,7 +2167,7 @@ static int uvc_ctrl_init_xu_ctrl(struct uvc_device *dev,
 int uvc_xu_ctrl_query(struct uvc_video_chain *chain,
 	struct uvc_xu_control_query *xqry)
 {
-	struct uvc_entity *entity;
+	struct uvc_entity *entity, *iter;
 	struct uvc_control *ctrl;
 	unsigned int i;
 	bool found;
@@ -2175,16 +2177,16 @@ int uvc_xu_ctrl_query(struct uvc_video_chain *chain,
 	int ret;
 
 	/* Find the extension unit. */
-	found = false;
-	list_for_each_entry(entity, &chain->entities, chain) {
-		if (UVC_ENTITY_TYPE(entity) == UVC_VC_EXTENSION_UNIT &&
-		    entity->id == xqry->unit) {
-			found = true;
+	entity = NULL;
+	list_for_each_entry(iter, &chain->entities, chain) {
+		if (UVC_ENTITY_TYPE(iter) == UVC_VC_EXTENSION_UNIT &&
+		    iter->id == xqry->unit) {
+			entity = iter;
 			break;
 		}
 	}
 
-	if (!found) {
+	if (!entity) {
 		uvc_dbg(chain->dev, CONTROL, "Extension unit %u not found\n",
 			xqry->unit);
 		return -ENOENT;

-- 
2.44.0.769.g3c40516874-goog


