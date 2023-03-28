Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 36172C76196
	for <linux-mediatek@archiver.kernel.org>; Tue, 28 Mar 2023 10:10:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=vSN9UmMWW8LKANBpEhn1gTCwWjUOTgkE62IMKkjwCg0=; b=fNYqSxPGRZjI/8L3+iL4vtnJ+6
	iryz44pLoBuP/TPTFW8R+hCA2wpOvamTlqVDcFQ3hPAVB3Vj1y/glLHNOy/lsYQvY1oWx+zis8lJh
	L2bUJd/VLpmGzzFXMbHgXPxgXNDhgcskyW4b+F5XtiDM89F96J8RkmwoK9V56FW1mqh2TQeS65VVY
	RbdKpz1ex6Px4ICrUBFmmayQzxQgcTyTvkSWO1irgCdzbueTrQ2urP0p4YKI06v78mzDmnuPfe6+T
	u5b95m1UC/hVlcb/pFVSMcnxb2u23FSaxs8mpV9kHIIZqBr81z+VzQ/Pq8zTSNjpvmsPiKBc9qrAv
	muHJQIuA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1ph6HE-00Drtr-1p;
	Tue, 28 Mar 2023 10:10:04 +0000
Received: from mail-yw1-x112f.google.com ([2607:f8b0:4864:20::112f])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1ph6H9-00Drpx-1R;
	Tue, 28 Mar 2023 10:10:00 +0000
Received: by mail-yw1-x112f.google.com with SMTP id 00721157ae682-545cb3c9898so145008137b3.7;
        Tue, 28 Mar 2023 03:09:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1679998198;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=vSN9UmMWW8LKANBpEhn1gTCwWjUOTgkE62IMKkjwCg0=;
        b=VKawVm2n11k73FEhif7iJNjBvNdUJqFH/tZb8L3hni41QNgUr986enklitCdxEr1H9
         aglfr6ut9ISDMsImSU08X7AM/5JLuloPNB8dEZdJmILvc5I72/Wxyi7Svsewu//vqRRr
         YaxARdrzpkaVjdHRaOAysmfO8Z8u0b6pSbndKxfrbgIRbaO3OpuaQsneMGE7Bky/iHY3
         8aPKg/cDmgN/Ekctjkg9R8E8VAvTalNt7rtTqexMepUA/NTbg5xD0JJ9Sgu8ppbcWC2w
         7X6F7RGsmKlPec4O66T7QZeyivKqb0ScNt6J1gl+rwhz0Gv3nIQ4qDDjgyfUjwEm1OM2
         y7Rw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679998198;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=vSN9UmMWW8LKANBpEhn1gTCwWjUOTgkE62IMKkjwCg0=;
        b=sgT/FvFfexXQGNe1qurTQiJ2+9+1hK1uvdlPfjnkdjdqWLGiG97ShCfq9P+gJcZJJg
         /BS8LUizXqYrQXsYzuemz9hC8D3zIXcFZJAHrWPLYYHEUEY5TI4fw8emGuJHti5CKiEj
         HG2YMqe9pKtDfypK/cVZ022UPR5/0m0cCBXkD/cwE4tcaB9AQeqaJNGvP97RhKH3U1aL
         j0fh67vaI9j8t5gkF1T2Umc2zWZmILf7K4Lyw+PKXdkDVumnb47KgALS4rANMmoWbsH7
         rY+Ts0Ir9qMibJBUduAMluIlu77fcpAmAc/C3qq7Qgckbb0LtOVgL4O+0fB05TqsMN0s
         3dSw==
X-Gm-Message-State: AAQBX9cd17Uv74UACaOK5J39U0K2g/2uathBkGja4F2oaJFoB5VA2GQl
	4JT6W21usA37r1UJi7OYxCs=
X-Google-Smtp-Source: AKy350YWB4pruYmWkJDXlOTgbL/NI+go42y4drnV22+3AcxHJlRDgpq7qrITFtJgvL+E/d34H2rk2A==
X-Received: by 2002:a0d:e803:0:b0:541:826c:2101 with SMTP id r3-20020a0de803000000b00541826c2101mr15910680ywe.12.1679998198233;
        Tue, 28 Mar 2023 03:09:58 -0700 (PDT)
Received: from chcpu13.cse.ust.hk (191host119.mobilenet.cse.ust.hk. [143.89.191.119])
        by smtp.gmail.com with ESMTPSA id cp27-20020a05690c0e1b00b00545a08184aasm2339676ywb.58.2023.03.28.03.09.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 28 Mar 2023 03:09:57 -0700 (PDT)
From: Wei Chen <harperchen1110@gmail.com>
To: tiffany.lin@mediatek.com
Cc: andrew-ct.chen@mediatek.com,
	yunfei.dong@mediatek.com,
	mchehab@kernel.org,
	matthias.bgg@gmail.com,
	angelogioacchino.delregno@collabora.com,
	linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	Wei Chen <harperchen1110@gmail.com>
Subject: [PATCH] media: mediatek: vcodec: Fix potential array out-of-bounds in decoder queue_setup
Date: Tue, 28 Mar 2023 10:09:51 +0000
Message-Id: <20230328100951.536955-1-harperchen1110@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230328_030959_481470_637F9D56 
X-CRM114-Status: GOOD (  11.27  )
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

variable *nplanes is provided by user via system call argument. The
possible value of q_data->fmt->num_planes is 1-3, while the value
of *nplanes can be 1-8. The array access by index i can cause array
out-of-bounds.

Fix this bug by checking *nplanes against the array size.

Signed-off-by: Wei Chen <harperchen1110@gmail.com>
---
 drivers/media/platform/mediatek/vcodec/mtk_vcodec_dec.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/drivers/media/platform/mediatek/vcodec/mtk_vcodec_dec.c b/drivers/media/platform/mediatek/vcodec/mtk_vcodec_dec.c
index 641f533c417f..cae34cc7c807 100644
--- a/drivers/media/platform/mediatek/vcodec/mtk_vcodec_dec.c
+++ b/drivers/media/platform/mediatek/vcodec/mtk_vcodec_dec.c
@@ -753,6 +753,13 @@ int vb2ops_vdec_queue_setup(struct vb2_queue *vq, unsigned int *nbuffers,
 	}
 
 	if (*nplanes) {
+		if (vq->type == V4L2_BUF_TYPE_VIDEO_CAPTURE_MPLANE)
+			if (*nplanes != q_data->fmt->num_planes)
+				return -EINVAL;
+		else
+			if (*nplanes != 1)
+				return -EINVAL;
+
 		for (i = 0; i < *nplanes; i++) {
 			if (sizes[i] < q_data->sizeimage[i])
 				return -EINVAL;
-- 
2.25.1


