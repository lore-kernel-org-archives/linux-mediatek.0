Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C9B1B606A6E2
	for <linux-mediatek@archiver.kernel.org>; Fri, 20 Nov 2026 19:56:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=z3Hccc0q;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=klm3j6ku
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=EOjCMewlxD7RB8eWSeGbzOtyaQZdrsyJsL/ch7K8e+A=; b=z3Hccc0qGphLIJ
	29a/v8cnKm7N92fnWTxRYyes48gsoU13TnaEarLsuLq2YCvse4SJrFK0J5mN9I4gaCPr0/xTa6RZJ
	Bfp5Aoi0Na+USG4VHIsteVHEAX4z6jGKhSXWqyyRpG7KFkwRE1Uqw61hmJ6aPAdf7yqvbQz5FQjs5
	gWjguUfpFoCuewA/FhLeyp1Ucklak6OIpLOIBT9i6C+XiqAcdpD98Waga2QuzZTHMWdD0WH6idbB8
	A6SjxplDWwGvtrUWUgFCXdneWsqRthQ3CKur90iJRLpVFXAyX/uHaX69iB0d+y6iQ7/f1k9j9YWie
	NVst3n5eKLhma8eqESIg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xUUiv-0000000GA2r-1Zdw;
	Fri, 20 Nov 2026 19:56:41 +0000
Received: from mail-ot1-x344.google.com ([2607:f8b0:4864:20::344])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xUUi7-0000000G9Mx-07AS
	for linux-mediatek@lists.infradead.org;
	Fri, 20 Nov 2026 19:56:15 +0000
Received: by mail-ot1-x344.google.com with SMTP id 46e09a7af769-86288992de5so1002813a34.1
        for <linux-mediatek@lists.infradead.org>; Fri, 20 Nov 2026 11:55:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795204550; x=1795809350; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=EOjCMewlxD7RB8eWSeGbzOtyaQZdrsyJsL/ch7K8e+A=;
        b=klm3j6kuF20vyznN2kJRapOOiJN73gbV8c62EfI6aIzTv6izKdmluekc9RYG0OxwyL
         UcGDSKBt+NpEOkA9G7d8WKYBWpItGy1TMKEct0GIJu8TaGvdLIcJYSM9LZ5973FEfpIr
         4iiIBw78FlnQYl+Ubc3iR/rnMMEYjQP8vTpDAxI8BvkIBl6OwUMst4Zm2bGQPpQVkoDZ
         TWXZOJsgFQblNhZKPID4f+UdNZjv5iPDVjlU8/2F+A+i8ZOYCBzSANsCSvkPxFzdvm+4
         CMKk0eLrXGeGRZC47IqnDvRepIYLDhgEaavKqNXFxx8ZQ/w6jDxZOjTHjKIqBeJYmkPC
         eUWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795204550; x=1795809350;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=EOjCMewlxD7RB8eWSeGbzOtyaQZdrsyJsL/ch7K8e+A=;
        b=CBHD6u/QFvykIel4vY7k8CzDnloV2ZRIs2EkygXeBytFCeiiaAgarGBsT5daWJoPYO
         i/oFc5J1eMI777UGJZ84oZSSXfTNAdYDlkFi6GORQA4hOebJtrlGEKKJe1uXf+5fZxJ8
         mOS4mgHJvZ90bzZZBslsCD5YbyvUOAoIgK0/QmhKd/qcREAfuUrzBsL7q2lm2+Iyt3h1
         Ax9srA8JagqRdkMgcDBjBXn8p/aZPlOZiOzKVn61349ci/X216AjbXRXcVaoNu6CyP4n
         tggVzwyBIoYD0TiTwi/JEgFZu1ousBSdqEslIcIzHby+XWIa2UdMQi6r86KxmxjFdzFZ
         N6/A==
X-Forwarded-Encrypted: i=1; AL+hErHigNsgyfbh6R5irwnTNKPzd0fX1xQ50pi8y5W/QQb64GrS/SVfftdKqzaYdQegzlR6aOmnK7lkUoJimDiqIQ==@lists.infradead.org
X-Gm-Message-State: APuU4Z+FfHYgX5oh+/PqKBd1H5X+zlhfSfpAlKm1uGkwTosJnLAapQ2l
	FUAYj+3dJD6ufTtjnXpmdX7BpnJDu9hIeZXhkoihvBsImdDNynBQmn2s
X-Gm-Gg: AYBFou2j1IyKrj/tUDgBlTOTBdZqOUXXrmdEzAuQKF1LvbZ619GllEHbWSVVQaUNdkQ
	CZuBPK2m9z5oe+P0HbaLm5BAMuK2N594KaAAMF1n5Yfe6sD7gz7xxAwVclp9iVlMC+WuqKGKN+G
	OHliinPfXZQzgEUG9CG9N8rj4ElD9qnfu4/EvIIA7vwZD5ZxdVWBl0VVHsu9EZgdnPf1bi4pXfq
	UiwVRQi4i8H7ahaWe4HCp9ZRpcSzjj4DTWVohK0zLuOG6dqg8QH+vaD4II8YKGCGGTSXj/Pk7zX
	BJWfLtbUv4CJ/fg3SB7y3+lsqSO1fRNHMMZj0TbsUIKbcohh9g0i2tV1YOagBL6HSvppAXLmV00
	0cycGhqEvy95YeDfpx24pQUyB3Cerf7I7Zkem/2yIcEFGBkiR3eVYg77wRwX1rce43LUDjO+OpD
	4dreW0jxkOZJ+/rlmBghaPkyC9nMWsvaJyTwtnaGh6GnvyKaiK0D0EcuQvnFSVSpGnxqgPk7Vn0
	QgzhFz0uGNj/yFpzo/m9/dY+aXw+Ty9xgFpkOx2iknWbzhrtpkhQqs8TNVoyU0Os6bdWKYHZKHf
	IiAjaljng0K2XobyuAZxp5mE9jGXMdgd3FvCcJuszuIu3erwkIhJvopmkIDWR1C8GW3rms9j5Cl
	w1f68W71XCmB+BnECfXWoZcl0os6mDcxp/lOKvfRJ
X-Received: by 2002:a05:6830:2543:b0:847:b333:229f with SMTP id 46e09a7af769-86309211342mr4517824a34.19.1795204550100;
        Fri, 20 Nov 2026 11:55:50 -0800 (PST)
Received: from [10.10.18.223] (wsip-64-207-253-118.tu.ok.cox.net. [64.207.253.118])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-863168dcf38sm2703953a34.9.2026.11.20.11.55.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Nov 2026 11:55:48 -0800 (PST)
From: Ryan Brue <ryanbrue.dev@gmail.com>
Date: Fri, 20 Nov 2026 13:55:40 -0600
Subject: [PATCH 6/8] media: mtk-mdp: Check buffer plane sizes against the
 format
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261120-rbrue-suez-upstreaming-mtk-vcodec-mdp-fixes-v1-6-877dea14c3d0@gmail.com>
References: <20261120-rbrue-suez-upstreaming-mtk-vcodec-mdp-fixes-v1-0-877dea14c3d0@gmail.com>
In-Reply-To: <20261120-rbrue-suez-upstreaming-mtk-vcodec-mdp-fixes-v1-0-877dea14c3d0@gmail.com>
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
 Ryan Brue <ryanbrue.dev@gmail.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795204536; l=1915;
 i=ryanbrue.dev@gmail.com; s=20260906; h=from:subject:message-id;
 bh=IrqYTU3e5VqOahizLwVLW6h+Y6jhsQAYsNliTerO8J0=;
 b=qQWo0793DmfQdxc0mRZsUo2XgpH9ekHbX/QzCsnhkM4TZTvhzCPSNce9IlDNfTxS2wUYX/mtP
 oK4WhQpcAJBAc49I2moR4k4xzsWXEfrHUNZkSfjcbjG589F3v1ZY2cE
X-Developer-Key: i=ryanbrue.dev@gmail.com; a=ed25519;
 pk=KsUvVaP//v/2q+ZBuacc7cLbsyEYn+AD71Sn28oZWKo=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261120_115551_203217_A480C37B 
X-CRM114-Status: GOOD (  11.68  )
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
2.56.0


