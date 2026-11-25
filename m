Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E602C606A327
	for <linux-mediatek@archiver.kernel.org>; Wed, 25 Nov 2026 20:17:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=eUXyQqV4;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=b4TJyviE
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=O3cn42cRp9ta80RYl78FVY9fV9o47ecym0lO2qR+MbY=; b=eUXyQqV4nKlsOm
	UbNe64iwoNe48LYgC32g2MP1+3M8OOF2j5TJEj9GQA+BSaz69issoC/XD45Us6uwXLw8iiiAq8ZzH
	gcue5TIWU7iYopyHL+6cj7SlJ6z32Ys8ReUpE6nY4XCqHq+3Ev+DO3WVXca1V3Kkjdpm69w36Otjq
	8a3tx+NYA/LhXmDBOjzSdx62iptPKlC5OxvVN2kkBkal2jsXe7lS9aqfx9f0GhwQvco/qEYPfquSD
	4iSfW29eMGt3rhvGqckMeDhsR/LnER1ltqW7RCE5lFYWkqzfIIypY+44vLAFd4CmZcbQJPW5J+6OQ
	uvpWH4yVA81fLBxHBXmg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWJQS-0000000BFKA-2hT1;
	Wed, 25 Nov 2026 20:17:08 +0000
Received: from mail-oo2-x02.google.com ([2607:f8b0:4864:31::2])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWJPh-0000000BEs3-2sct
	for linux-mediatek@lists.infradead.org;
	Wed, 25 Nov 2026 20:16:24 +0000
Received: by mail-oo2-x02.google.com with SMTP id 46e09a7af769-849c2965b9eso1101190a34.1
        for <linux-mediatek@lists.infradead.org>; Wed, 25 Nov 2026 12:16:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795637780; x=1796242580; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=O3cn42cRp9ta80RYl78FVY9fV9o47ecym0lO2qR+MbY=;
        b=b4TJyviEnMDVx5LKl9g6xCW7uxvcgvkYV8ytV0kzrywaJp+fkhwF8pRSzjcKggo5PC
         fcWrj7pc5b4z2ZzbcDaVZ6E+mg/VIsQQmjdovv+kmBZb59xteD7jjLy3tb4hU6hHk/9x
         onXZqALbyRqm6OCafMKjIs20AFPHnZVoJ5MxEFOI+7svK7kB7b6Njh+wrpHgDXjGNMV3
         +ItZTcuq8OuHVh6uMPb7YA+intg+YckBlPvyl31XVCMM7XDDFwCqySJehlOTGWSClgWD
         /i2NY8CkWaRUxWyLDKOk1IL7F7Zg4RZH3k1DCqjtxtH5RdPE2UoZSttGANFQKwpC1pOT
         pF3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795637780; x=1796242580;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=O3cn42cRp9ta80RYl78FVY9fV9o47ecym0lO2qR+MbY=;
        b=ftIyfo45ZB+SbpUDQ4byXhp8vlgheNHFnTSIKbAOnmIi0hxg/ltmM3NtfyqRUnfThP
         8I9kpd77tHjKrW29cWQFXldegv74Z4vhp0nzjbNIlz+eH/g0Qqo/t20VYU0kcBdlnpcz
         /Mc/VgMLhieF5IP5SBBF7w7BRUhxOvXwgXMv3DKXydyEHLyEMDddEcsVouDBPSUMcccq
         l43pTESKdRu74Wwl9BFkEcn6Lo8BrNJ2A1iPP5fpLU0/bxRn8WZ0OETA9ONAImgGSQse
         9rMXQP3qFE61nouH63q3JFAToPTNIQiKBgHXK/bz/bXJqhRLXHAiR+XQhspYM3wkfX3G
         O2BA==
X-Forwarded-Encrypted: i=1; AL+hErHIFO5kmyGZDQd+7Y4UORb4gg8abFxPuMjk6z5SrbSXIQc/aQe9McuztMZt+Rl8Jxo8lsZkko0EVD6+H/EGqQ==@lists.infradead.org
X-Gm-Message-State: APuU4Z+fSEsQKAY9+GKPqGyx/M14lXTTxxQTNua4jx3kAcpQFlI1dHCR
	9HfhfhFbg0B46yUgcIkONr3hYJyneVXIyUPV5O/84HtJTkhHJCc66YwP
X-Gm-Gg: AZFdTZcMa9gZY3Nxpjga/tSsQ2sp0itOI9+eAp0F7KDhacqbHuDBD0SHTGLADk6cl3Y
	ZfwlYbJBAo7kcRLlpa50gYElnGSQZKkyeo4SxhqFcOGSIv0WjeD3ZaJ0//TjdNn7XOoefk/xrPr
	RU61MesbwF/WGkzFt0a5UwjNRIVPceeM2eL8m28TeNUletqmR90IUrTD6pmVkEHQ9j7z0Q8UArs
	1pRfrxNKwJe/gU8twwh0r1uwzUuIUtQd+TWaILHNZPB05OGvvTtrtODzZzec/z5cakfRhJKf6Z9
	lGJ1vyZFQYSMtbAerLZCzWr/Fqvix9a838Hu7tYpCA4oTyBHYrV4XJsYcjiyCMZCpe6EfyYaqDm
	geP5roqcgTJRr8JHJnhILQkgkCe1EQqtKhnOYTJ8TPZJJjL2f8jRb7ZjmEbC9nKqbcf7rdrSUYk
	vvmaQ7bz9nIjueIVBxTdIoqO7CzlyX+wZ2rwA/jq9Y5IbGB4RQ7kdrjQVTKaNEyfjXZQQgimWFH
	hcnJxBr4kHJk1iKB6TT/9prZLvZJzTdMrxtUFDzqZNB17aGrjrD6NHApWx5+VdI1WppfcIxapxO
	NNiYg2FDvlRsUDeOFAT49dFrdD2xJgmMzxo=
X-Received: by 2002:a05:6820:829:b0:71b:845a:3340 with SMTP id 006d021491bc7-71b845a3cacmr1304758eaf.67.1795637780542;
        Wed, 25 Nov 2026 12:16:20 -0800 (PST)
Received: from [192.168.0.98] ([50.26.120.197])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-71b380b6f82sm11341859eaf.10.2026.11.25.12.16.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Nov 2026 12:16:20 -0800 (PST)
From: Ryan Brue <ryanbrue.dev@gmail.com>
Date: Wed, 25 Nov 2026 14:16:09 -0600
Subject: [PATCH v2 6/9] media: mtk-mdp: Check buffer plane sizes against
 the format
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261125-rbrue-suez-upstreaming-mtk-vcodec-mdp-fixes-v2-6-fdc047cf75a5@gmail.com>
References: <20261125-rbrue-suez-upstreaming-mtk-vcodec-mdp-fixes-v2-0-fdc047cf75a5@gmail.com>
In-Reply-To: <20261125-rbrue-suez-upstreaming-mtk-vcodec-mdp-fixes-v2-0-fdc047cf75a5@gmail.com>
To: Tiffany Lin <tiffany.lin@mediatek.com>, 
 Andrew-CT Chen <andrew-ct.chen@mediatek.com>, 
 Yunfei Dong <yunfei.dong@mediatek.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Hans Verkuil <hverkuil@kernel.org>, 
 Minghsiu Tsai <minghsiu.tsai@mediatek.com>, 
 Houlong Wei <houlong.wei@mediatek.com>, 
 Enric Balletbo i Serra <eballetbo@kernel.org>, 
 Eizan Miyamoto <eizan@chromium.org>, 
 Francois Buergisser <fbuergisser@chromium.org>
Cc: Nicolas Dufresne <nicolas.dufresne@collabora.com>, 
 Youngjoon Lee <getfeus@gmail.com>, linux-media@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-mediatek@lists.infradead.org, 
 Mauro Carvalho Chehab <mchehab+huawei@kernel.org>, 
 Ryan Brue <ryanbrue.dev@gmail.com>, stable@vger.kernel.org
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795637766; l=1943;
 i=ryanbrue.dev@gmail.com; s=20260906; h=from:subject:message-id;
 bh=cuEbWTB4pH0BRk1X8WiZhDbNCpoA3GtHpeZU0Znpd0c=;
 b=Fk4k0A+X9pfrp5/bZ/6fIHGtDbMlWMdQhCZTNBXGLqrrhv8Zz0b1rhsC2ajbotj6wJD+CmQrL
 vLFuz3wryijAdlRCk9T/dEZW1Z9zxE7eokb6NXV/ZzUIE3EVelyj1qk
X-Developer-Key: i=ryanbrue.dev@gmail.com; a=ed25519;
 pk=KsUvVaP//v/2q+ZBuacc7cLbsyEYn+AD71Sn28oZWKo=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261125_121621_748353_0821870D 
X-CRM114-Status: GOOD (  12.71  )
X-Spam-Score: -2.1 (--)
X-BeenThere: linux-mediatek@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-mediatek.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-mediatek/>
List-Post: <mailto:linux-mediatek@lists.infradead.org>
List-Help: <mailto:linux-mediatek-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mediatek>,
 <mailto:linux-mediatek-request@lists.infradead.org?subject=subscribe>
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
X-Spam-Status: No, score=-15.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

queue_setup() ignores the number of planes and their sizes that come with
VIDIOC_CREATE_BUFS and always answers with the current format, so a
client can allocate buffers too small for it, which v4l2-compliance
reports:

  fail: v4l2-test-buffers.cpp(872): q.create_bufs(node, 1, &fmt) != EINVAL

Refuse a request with a different number of planes or a plane smaller
than the format needs, as vb2 expects of queue_setup(), and check each
buffer's planes in buf_prepare() as well.

Fixes: c8eb2d7e8202 ("[media] media: Add Mediatek MDP Driver")
Cc: stable@vger.kernel.org
Signed-off-by: Ryan Brue <ryanbrue.dev@gmail.com>
---
 drivers/media/platform/mediatek/mdp/mtk_mdp_m2m.c | 13 +++++++++++++
 1 file changed, 13 insertions(+)

diff --git a/drivers/media/platform/mediatek/mdp/mtk_mdp_m2m.c b/drivers/media/platform/mediatek/mdp/mtk_mdp_m2m.c
index a40bcf61b7ca..e0627127430b 100644
--- a/drivers/media/platform/mediatek/mdp/mtk_mdp_m2m.c
+++ b/drivers/media/platform/mediatek/mdp/mtk_mdp_m2m.c
@@ -546,6 +546,15 @@ static int mtk_mdp_m2m_queue_setup(struct vb2_queue *vq,
 	int i;
 
 	frame = mtk_mdp_ctx_get_frame(ctx, vq->type);
+	if (*num_planes) {
+		if (*num_planes != frame->fmt->num_planes)
+			return -EINVAL;
+		for (i = 0; i < frame->fmt->num_planes; i++)
+			if (sizes[i] < frame->payload[i])
+				return -EINVAL;
+		return 0;
+	}
+
 	*num_planes = frame->fmt->num_planes;
 	for (i = 0; i < frame->fmt->num_planes; i++)
 		sizes[i] = frame->payload[i];
@@ -563,6 +572,10 @@ static int mtk_mdp_m2m_buf_prepare(struct vb2_buffer *vb)
 
 	frame = mtk_mdp_ctx_get_frame(ctx, vb->vb2_queue->type);
 
+	for (i = 0; i < frame->fmt->num_planes; i++)
+		if (vb2_plane_size(vb, i) < frame->payload[i])
+			return -EINVAL;
+
 	if (!V4L2_TYPE_IS_OUTPUT(vb->vb2_queue->type)) {
 		for (i = 0; i < frame->fmt->num_planes; i++)
 			vb2_set_plane_payload(vb, i, frame->payload[i]);

-- 
2.56.1


