Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 88D91CD3439
	for <linux-mediatek@archiver.kernel.org>; Tue, 19 Sep 2023 05:03:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=laTm7dnxWOCcW2RIknshlwm/kbQUB6RtmbdVs9LREqk=; b=SVnUPPTQtPgMmZzoZIyy+2QG2O
	39uYY+mf8ju9GWsSBzkC4oRHgXoo6C5XFuhjF5mxSc0HRN7aJlc3dpjq5GlUzCiooiw5VQWxtIBJE
	clJaVSTPCwI4VoTeqG1n30V8UAvIoLo+aTpMp8qwbboHfgGG8EFmkwjClXBpXetTmwe9/BNOvSR4v
	XOddH2PMZSsbjAW9BVuGrCwu42DU101u6tCv2kf9JFva0h5SgXAz56ny89IWJTk86bdckkM17AnZd
	PcT/WLohz4msGIWjkTfa9KLe4ujpUK4F7H9GmHY/7+3i6WtxJEmZfJ0CuEdGMr+EZgY0BjLxHkj1a
	5/qlQgkQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qiStM-00H0Yr-31;
	Tue, 19 Sep 2023 05:03:20 +0000
Received: from mail-pf1-x42a.google.com ([2607:f8b0:4864:20::42a])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qiStG-00H0Vu-2M
	for linux-mediatek@lists.infradead.org;
	Tue, 19 Sep 2023 05:03:18 +0000
Received: by mail-pf1-x42a.google.com with SMTP id d2e1a72fcca58-68fb79ef55eso4765948b3a.0
        for <linux-mediatek@lists.infradead.org>; Mon, 18 Sep 2023 22:03:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1695099791; x=1695704591; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=laTm7dnxWOCcW2RIknshlwm/kbQUB6RtmbdVs9LREqk=;
        b=Eii+j6EgmnSVn1Vf9XrcA6FN0eSdP1XNwuoWiFWLQeyrkXouBnKFKCvkhF+pkOQgeT
         /c4EC5mN5N9bUmg1ML9Gad/KP6zQOVK39eczeteug+E+Ly+9y+EuIbJrAxd01sGAZo1F
         2UcqhABBX/pTky1/EcVFmZqjiSOoPboRjfXqI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695099791; x=1695704591;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=laTm7dnxWOCcW2RIknshlwm/kbQUB6RtmbdVs9LREqk=;
        b=dI1PWXBhWdlJUx+KY6BLc2vwp+B0AdMv5YEMw3pnAN3EuT4XMxtClF5ExYWWHUhojm
         GINek6Tq4r2KgYAJDmeskeGVsXZUHJsC+zJMU8oF9EsZQbyaPs0Qm2InUywr1ExkY3lc
         E+5akGy2exlTngTn8wmOv3Y/c7DbISqROcI9pDLHRVypTjIOoryYnEQW3ujqjSiTAasO
         Bh3y7+bVMs/sTUjQUjpslA4U/29R7Na17yxW57ARRF3LN+cGkGEHxdOCGyhiH6HMY+IV
         enx1kErAfCS0lU00SSIwUiuprFlv6f0R5szMv6Hya5G+pP+p9ho/M7d4ePdClFmSjL/K
         57CA==
X-Gm-Message-State: AOJu0Yzp2t0PyclL8ENgZAaUUEeROtEYU9n3qLTXWV44ivcN8BHwBi8N
	qFt2l7v/diENrKGBUOkEfPxeVQ==
X-Google-Smtp-Source: AGHT+IGycmQsNFwgoBQwKURop8RFXZn7kdUvjCHaXVun+krQq3OvwV8JGEXJPbCRePSXThTCs6siig==
X-Received: by 2002:a05:6a20:5611:b0:14e:b4d5:782e with SMTP id ir17-20020a056a20561100b0014eb4d5782emr11869037pzc.29.1695099790851;
        Mon, 18 Sep 2023 22:03:10 -0700 (PDT)
Received: from wenstp920.tpe.corp.google.com ([2401:fa00:1:10:40a:900d:e731:5a43])
        by smtp.gmail.com with ESMTPSA id z13-20020aa785cd000000b00686edf28c22sm313169pfn.87.2023.09.18.22.03.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 18 Sep 2023 22:03:10 -0700 (PDT)
From: Chen-Yu Tsai <wenst@chromium.org>
To: Bjorn Andersson <andersson@kernel.org>,
	Mathieu Poirier <mathieu.poirier@linaro.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: Chen-Yu Tsai <wenst@chromium.org>,
	Tinghan Shen <tinghan.shen@mediatek.com>,
	linux-remoteproc@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Laura Nao <laura.nao@collabora.com>
Subject: [PATCH] remoteproc: mediatek: Detect single/multi core SCP with rpmsg-name property
Date: Tue, 19 Sep 2023 13:03:04 +0800
Message-ID: <20230919050305.3817347-1-wenst@chromium.org>
X-Mailer: git-send-email 2.42.0.459.ge4e396fd5e-goog
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230918_220315_195122_75ED37BB 
X-CRM114-Status: GOOD (  17.58  )
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

In the just landed multi-core SCP work, detection of single/multi core
SCP is done by checking the immediate child node of the SCP complex
device node. In the original work this was done by matching the child
node's name. However the name wasn't previously standardized. This
resulted in breakage on MT8183 and MT8192 Chromebooks while the driver
side changes were picked up and the device tree changes were not picked
up.

Instead, match against the "mediatek,rpmsg-name" property, which is
required to be present in the rpmsg sub-node. This makes the
aforementioned devices running old device trees working again.

Reported-by: Laura Nao <laura.nao@collabora.com>
Fixes: 1fdbf0cdde98 ("remoteproc: mediatek: Probe SCP cluster on multi-core SCP")
Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>
---
The patch is based on next-20230918 with a whole bunch of local patches
stacked on top. None of my local patches are related to remoteproc, so
it should be fine.

I tested on both MT8183 Juniper and MT8192 Hayato and on both systems
the SCP successfully probed again.

 drivers/remoteproc/mtk_scp.c | 12 +++++++++++-
 1 file changed, 11 insertions(+), 1 deletion(-)

diff --git a/drivers/remoteproc/mtk_scp.c b/drivers/remoteproc/mtk_scp.c
index ea227b566c54..ca15d9f382a1 100644
--- a/drivers/remoteproc/mtk_scp.c
+++ b/drivers/remoteproc/mtk_scp.c
@@ -1149,13 +1149,23 @@ static int scp_is_single_core(struct platform_device *pdev)
 	struct device *dev = &pdev->dev;
 	struct device_node *np = dev_of_node(dev);
 	struct device_node *child;
+	bool has_rpmsg;
 
 	child = of_get_next_available_child(np, NULL);
 	if (!child)
 		return dev_err_probe(dev, -ENODEV, "No child node\n");
 
+	/*
+	 * On single core SCP systems, the immediate child of the SCP device
+	 * is the rpmsg node; on multi core systems, there's an intermediate
+	 * level node, one describing each core. Instead of matching on the
+	 * node name, which was recently changed in the DT binding in a
+	 * backward incompatible way, match against the "mediatek,rpmsg-name"
+	 * property, which is required in all rpmsg sub-nodes.
+	 */
+	has_rpmsg = of_property_present(child, "mediatek,rpmsg-name");
 	of_node_put(child);
-	return of_node_name_eq(child, "cros-ec-rpmsg");
+	return has_rpmsg;
 }
 
 static int scp_cluster_init(struct platform_device *pdev, struct mtk_scp_of_cluster *scp_cluster)
-- 
2.42.0.459.ge4e396fd5e-goog


