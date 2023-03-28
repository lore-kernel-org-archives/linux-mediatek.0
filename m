Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B73E8C76196
	for <linux-mediatek@archiver.kernel.org>; Tue, 28 Mar 2023 09:26:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=ET0WBr8YKj1eA2HA94tcZdb4WGxsEVdQEBVDSPWcXmw=; b=rxQxD7Gy9xjcROfopt/PJM2lrj
	Es7i06UPq3OZXP7GhPJF8N+Q6TiH3VbYFeA+sG/pI82fOMI2p8CJVysvKpz0T9/CWWfIPy0a7tgNa
	ml4JLCuAZ7WzbxqgXvdj7ayYC3udOWMc7y0tTNGTXmstxlTMn7c73tockVKmi0TRIQWUhDuXAkH+8
	ZtZQCO/VNTJVJa4Jx9J+1d+asQswDGR/njM5LA0hXSWhFizcx/j5uyk2UEM7P3VSJj4JgJLqCU/qf
	HiKLqOJnLN4UxDMJDZToDppWjdA2Ru+rPrQMKfzU3ipf6S2+qV7Q3AlYr9q4q3Y473GcQJmjHcZXs
	awD+HwGg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1ph5az-00Djra-1T;
	Tue, 28 Mar 2023 09:26:25 +0000
Received: from mail-yw1-x112e.google.com ([2607:f8b0:4864:20::112e])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1ph5au-00Djo3-2o;
	Tue, 28 Mar 2023 09:26:22 +0000
Received: by mail-yw1-x112e.google.com with SMTP id 00721157ae682-545ce8e77fcso141403797b3.1;
        Tue, 28 Mar 2023 02:26:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1679995577;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=ET0WBr8YKj1eA2HA94tcZdb4WGxsEVdQEBVDSPWcXmw=;
        b=ppqY09tR5sm5z/8am1ZM/TA22i7RRKVosNObZmQENqBuGmq0qFa3z6+AU30BDAWaRH
         T63QvKfFrfHG1qJRPM1WwUh6BFifu9+IY7NUIZDUShGEbQAAQUw73zQc/vtEdc9wCI7H
         xulnhBsPInc/baHhMI8TX7vRk/XxAX6vkJ3IXXIxHlVVF9u8Oybr7n9gShKedxdmVWDS
         8VRyybuct7TJUyoFc1GcZpsk33fQvGLwSexTKr02icIJhD03NJCMpc6ZdYZy26Lo/CGs
         Z5xJ96oXOPDg47iISpBvR8yIN0Ame90ncVHPzeg9fzf9irtVmlZ/Eh3gZf/W+HRToGXH
         qjog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679995577;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ET0WBr8YKj1eA2HA94tcZdb4WGxsEVdQEBVDSPWcXmw=;
        b=aykX3mMpHWPzi7NmMuExrRmzWNQKJzQ4nH+J1+adMtfG43kSpfCHXL8nxZ8SW7hTUO
         VjRGs8OnlFOcK2oGJ0IKdpISZMLYJqhja2L83yWfD0GqvHbmLhSHgeXXsyn90n94bjzb
         Ga0fZKZIZmfCnA5welqxNBJPHx/DSohp4coOWw+ot/CQ7G10BNWTNP9H8pEH1NsS2wCH
         yst5J/tt1hXIcq7aUHBqvF+W+54+WVqCY9hIi3otuKDNRziEdQ0xN5rQrYuXT3W8ZhIb
         rjLvj/JSTaln2FEzREiHvqF06Y61qno9pTTKZN6Aok8zrmpBVJzt5EWGNQEDNcwYrVNx
         mFTQ==
X-Gm-Message-State: AAQBX9dUlKo7Tfa78qe5LhJQlKdRkmJ9exTD2/+PW7AuOOks0VkEhK12
	MPQlPDANhiTWawmxr/6b6qI=
X-Google-Smtp-Source: AKy350YCbe1C6CuK51osRGy+cn0oCfy2X0sSC78oKe+SrwmzPgwW20fbW4MMNHKDKvLhSihDW1AmGw==
X-Received: by 2002:a81:5b45:0:b0:541:a189:bc74 with SMTP id p66-20020a815b45000000b00541a189bc74mr14986512ywb.41.1679995577070;
        Tue, 28 Mar 2023 02:26:17 -0700 (PDT)
Received: from chcpu13.cse.ust.hk (191host119.mobilenet.cse.ust.hk. [143.89.191.119])
        by smtp.gmail.com with ESMTPSA id a67-20020a811a46000000b00545a0818482sm2328586ywa.18.2023.03.28.02.26.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 28 Mar 2023 02:26:16 -0700 (PDT)
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
Subject: [PATCH] media: vcodec: Fix potential array out-of-bounds in vb2ops_venc_queue_setup
Date: Tue, 28 Mar 2023 09:26:08 +0000
Message-Id: <20230328092608.523933-1-harperchen1110@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230328_022620_912800_3694DDA7 
X-CRM114-Status: GOOD (  11.21  )
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
 drivers/media/platform/mediatek/vcodec/mtk_vcodec_enc.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/media/platform/mediatek/vcodec/mtk_vcodec_enc.c b/drivers/media/platform/mediatek/vcodec/mtk_vcodec_enc.c
index d65800a3b89d..1ea02f9136f6 100644
--- a/drivers/media/platform/mediatek/vcodec/mtk_vcodec_enc.c
+++ b/drivers/media/platform/mediatek/vcodec/mtk_vcodec_enc.c
@@ -821,6 +821,8 @@ static int vb2ops_venc_queue_setup(struct vb2_queue *vq,
 		return -EINVAL;
 
 	if (*nplanes) {
+		if (*nplanes != q_data->fmt->num_planes)
+			return -EINVAL;
 		for (i = 0; i < *nplanes; i++)
 			if (sizes[i] < q_data->sizeimage[i])
 				return -EINVAL;
-- 
2.25.1


