Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D4135C433EF
	for <linux-mediatek@archiver.kernel.org>; Mon, 24 Jan 2022 17:07:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=bsi5j4+92Cxb0OMvC5bzuwo0kLBTav8Zx9oP0XQNg8I=; b=Z1Wv/kvDAm6dVt
	EU8TD/HVdq0COKGPT6KD+Ylksccm51wMhyqFzYtsLFP50fJlxapo0b0JvgicxN1vUpJisi4znRgKe
	eNtAMuUGvYm9CZO39yIKZuTy1GpVikpNJGQp8Qzdw3NHUxzAG3u/ZWrVEJLetkIQyxqkVXnNjf4/0
	qX4R0+4TXb9pOzEIcGwZCakynqe1JU1Qi5/z6fPvGQTh2zgzxVHbtS1/mvq/LcEDAQgnjNbN+yiLN
	X0ckM7PX6bUQBCiI9K2hurHy8qNe4Y+PNEOIqfWgA/hF27acQiM+TmQK6t6jiVCAktVXf2HLdO3Px
	HQjEfta9N6yWMrJQLq8Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nC2og-00487N-H7; Mon, 24 Jan 2022 17:07:42 +0000
Received: from mta-p5.oit.umn.edu ([134.84.196.205])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nC2od-00485q-UR
 for linux-mediatek@lists.infradead.org; Mon, 24 Jan 2022 17:07:41 +0000
Received: from localhost (unknown [127.0.0.1])
 by mta-p5.oit.umn.edu (Postfix) with ESMTP id 4JjGd66ZFLz9vhLG
 for <linux-mediatek@lists.infradead.org>; Mon, 24 Jan 2022 17:07:38 +0000 (UTC)
X-Virus-Scanned: amavisd-new at umn.edu
Received: from mta-p5.oit.umn.edu ([127.0.0.1])
 by localhost (mta-p5.oit.umn.edu [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id i10tWT8rtNHL for <linux-mediatek@lists.infradead.org>;
 Mon, 24 Jan 2022 11:07:38 -0600 (CST)
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com
 [209.85.214.198])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mta-p5.oit.umn.edu (Postfix) with ESMTPS id 4JjGd64VSJz9vhL9
 for <linux-mediatek@lists.infradead.org>; Mon, 24 Jan 2022 11:07:38 -0600 (CST)
DMARC-Filter: OpenDMARC Filter v1.3.2 mta-p5.oit.umn.edu 4JjGd64VSJz9vhL9
DKIM-Filter: OpenDKIM Filter v2.11.0 mta-p5.oit.umn.edu 4JjGd64VSJz9vhL9
Received: by mail-pl1-f198.google.com with SMTP id
 b15-20020a1709027e0f00b0014a922bc3a9so3662083plm.13
 for <linux-mediatek@lists.infradead.org>; Mon, 24 Jan 2022 09:07:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=umn.edu; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=bwacIyhw4ndT7Q8gzdzBTG/k+JrJsO2KqpjmIUL+vWA=;
 b=kJI91Vo7bN27z4B9JgEUCwzA8BYCtXAdsrJ4FHRzwnK64pe3UPnwWC1F0cAGOtZ7WG
 Q+88wHxzRN6/WrCSylWwmTG4jmJJ6i2+e5duI47qvf0R66Rz6hoYxplW21WD9Hy7PLZy
 py9092c5AXMrwBn+lzMOcQYIsP3dkSAMJto4d32KMFkO3G3u8GVXF+wBgDYbFwtlD4Ga
 ubmyLflng7RPkmH10M+jwZoJ2demX0+SmJLokvvSZy1SUuK9Ascu7NDXRo5OL9jVx7Jh
 jj2UH9Wn57Ne7QcoP4GoP2ITElgufFyQ5TRan3ToN4maFclNLlM/WUfp4hiasmMMwH+p
 nJQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=bwacIyhw4ndT7Q8gzdzBTG/k+JrJsO2KqpjmIUL+vWA=;
 b=Fn9Uu9PUeJnf+0JZo5oLim+1nu3DcgtfRcfI1CcKE23yuZOEy4mT6xNBgGYxsjjYAb
 szNZPirKdbCn+rm8FzIxHOFkRxWn7W/7W0cQ+2UCFu7E6zk1Ku+Ho+gqgh5XPLNYEvq2
 yA/CG5aB6Xq2eHxAH8EMooYPAZY+iyqChEpqrZSc5X3kwbie2R/fpE0gRXk82wqE/HT/
 6xSpThxnMeiBnyLAp0QgsgLO4OfKCE7CByKW9cGlwmO+a7goK5IWaj6Tq6M9SmQ65hzm
 +DKmxNteygYVAg5umlyzna3wr8dntD9XgS1ULTSYHYq62x+4hve03/bhJJcIvEyTJ8XO
 uY4A==
X-Gm-Message-State: AOAM533zrgEyqijDEggT+IZtj16M7NLUVtoWimxQz0H0WAktDOEj5NeO
 h6QnO/G8IXnaqwCqAsSYdrKbTlQA666OWSiI3MpDN0lorzRRF4zjYg6QadN3uivITV4KILHFRGJ
 bvZzVrUjP4I1rK/plryWijx6Wlc5VFLpwrcDu
X-Received: by 2002:a17:902:8ec9:b0:149:8864:cfd4 with SMTP id
 x9-20020a1709028ec900b001498864cfd4mr15147413plo.16.1643044057821; 
 Mon, 24 Jan 2022 09:07:37 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxphJVDZw2235x19mcgfApB+cYhwOKywYswD+mgI1+aI4SfPA9f1zN9tdRsco1iPLSlgQhNqg==
X-Received: by 2002:a17:902:8ec9:b0:149:8864:cfd4 with SMTP id
 x9-20020a1709028ec900b001498864cfd4mr15147388plo.16.1643044057532; 
 Mon, 24 Jan 2022 09:07:37 -0800 (PST)
Received: from zqy787-GE5S.lan ([36.4.61.248])
 by smtp.gmail.com with ESMTPSA id ha21sm13030092pjb.48.2022.01.24.09.07.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 24 Jan 2022 09:07:37 -0800 (PST)
From: Zhou Qingyang <zhou1615@umn.edu>
To: zhou1615@umn.edu
Cc: kjlu@umn.edu, Tiffany Lin <tiffany.lin@mediatek.com>,
 Andrew-CT Chen <andrew-ct.chen@mediatek.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Alexandre Courbot <acourbot@chromium.org>,
 Hans Verkuil <hverkuil-cisco@xs4all.nl>, linux-media@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 linux-kernel@vger.kernel.org
Subject: [PATCH] media: mtk-vcodec: Fix a NULL pointer dereference in
 mtk_vcodec_fw_scp_init()
Date: Tue, 25 Jan 2022 01:07:31 +0800
Message-Id: <20220124170731.59240-1-zhou1615@umn.edu>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220124_090740_087678_7463AEB9 
X-CRM114-Status: GOOD (  13.87  )
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

In mtk_vcodec_fw_scp_init(), devm_kzalloc() is assigned to fw and there is
a dereference of it right after that, which could lead to NULL pointer
dereference on failure of devm_kzalloc().

Fix this bug by adding a NULL check of fw.

This bug was found by a static analyzer.

Builds with 'make allyesconfig' show no new warnings,
and our static analyzer no longer warns about this code.

Fixes: 46233e91fa24 ("media: mtk-vcodec: move firmware implementations into their own files")
Signed-off-by: Zhou Qingyang <zhou1615@umn.edu>
---
The analysis employs differential checking to identify inconsistent 
security operations (e.g., checks or kfrees) between two code paths 
and confirms that the inconsistent operations are not recovered in the
current function or the callers, so they constitute bugs. 

Note that, as a bug found by static analysis, it can be a false
positive or hard to trigger. Multiple researchers have cross-reviewed
the bug.

 drivers/media/platform/mtk-vcodec/mtk_vcodec_fw_scp.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/media/platform/mtk-vcodec/mtk_vcodec_fw_scp.c b/drivers/media/platform/mtk-vcodec/mtk_vcodec_fw_scp.c
index d8e66b645bd8..aa36bee51d01 100644
--- a/drivers/media/platform/mtk-vcodec/mtk_vcodec_fw_scp.c
+++ b/drivers/media/platform/mtk-vcodec/mtk_vcodec_fw_scp.c
@@ -65,6 +65,9 @@ struct mtk_vcodec_fw *mtk_vcodec_fw_scp_init(struct mtk_vcodec_dev *dev)
 	}
 
 	fw = devm_kzalloc(&dev->plat_dev->dev, sizeof(*fw), GFP_KERNEL);
+	if (!fw)
+		return ERR_PTR(-ENOMEM);
+
 	fw->type = SCP;
 	fw->ops = &mtk_vcodec_rproc_msg;
 	fw->scp = scp;
-- 
2.25.1


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
