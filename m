Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 12E94C7EE23
	for <linux-mediatek@archiver.kernel.org>; Fri, 26 May 2023 06:32:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=WcusQp6OcfSqJMF8NpXBP2EIksMc7QBaKN7KQDMVLt0=; b=Zv8fgPhz8YxqYUqchljcnj4ikB
	WVJ2ZGvW0B4sLGQ+1x5CgddZtZ4TKQdk/C6/bmGVhI1IMg34qBKxbQ5CO9KZXQg4su7YFsxS4Jjxu
	IldwWxts7ZnFncEWDzdAtwUyvPKeSqXD6OtouINcWh7Z+k3H1I1LFCdFJ2xyfVXC8U0ozAe75sSxt
	crAnwXwPdAIVnnEPaDZQ2+miiisZPUlnQV7cCyvF938qGnwaZ0ZaTQsm20IJPdpLUMEUFi5pt66fB
	W1MvCBx8TOxpbQFNkGlsZ463WN0lW/IYvK01ALfs2Xqd6oWsTtMylpqh4HdGK/gRHzh15cWv5fNbN
	5l4ogPZA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q2Qza-001GLa-0B;
	Fri, 26 May 2023 06:32:02 +0000
Received: from mail-pf1-x436.google.com ([2607:f8b0:4864:20::436])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1q2QzW-001GKO-01
	for linux-mediatek@lists.infradead.org;
	Fri, 26 May 2023 06:31:59 +0000
Received: by mail-pf1-x436.google.com with SMTP id d2e1a72fcca58-64d604cc0aaso478990b3a.2
        for <linux-mediatek@lists.infradead.org>; Thu, 25 May 2023 23:31:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1685082716; x=1687674716;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=WcusQp6OcfSqJMF8NpXBP2EIksMc7QBaKN7KQDMVLt0=;
        b=BAEHHZCadJWD1FnUb7y5eXB/7raIJI60nN5wNAnIP/9PoFUnwvRLEVWCtljflKEZaZ
         xb37jsqSRWK/ETW3hgPcdttl8XPE/ehOk2iw2E16jcUTjQies2WUHlILX9ndDK/sT9Iq
         mdLFc3/TNbXq1L9NBTfFKY7eTxvKx37hQjs+Y=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685082716; x=1687674716;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=WcusQp6OcfSqJMF8NpXBP2EIksMc7QBaKN7KQDMVLt0=;
        b=TVo1+AtJfbSAEuaGuuWuni280CXnm4dlaGEIDnJvNLZrSbQVAEZivlR/OhznEaPS61
         Qz5Em9Em3lxvqEgfxA4oLoMBUH8y3nfydkytLbSpue7OR16afdbpGM/eeSz8QHPrqIMu
         r8g4oPly81LUpLfJ8vVD1D+VBVwWDwI+jk8RyD3ezvjZpIg/pw535yyzMMZ9u17iyDZf
         hvIqZNcK2UgWpKXqbGtPhpi/zRLMLF8sRFl6BgYhJ2lmaaK84jpPqqum4XtjKEK/V321
         DvRV2MptoFmCNtsYFuV/5/RAiC7W5y/oxC120Kbs6hYGxBwXGzwrTPGwNXV6i8NgQqQJ
         F5cw==
X-Gm-Message-State: AC+VfDx1jGoImcxoIYRlAyui9e1/fpcxfoGfCwsJ+YT7iIEIcOEaKq1y
	Og465ss4BJuKNUVVLY6m/ZbUyw==
X-Google-Smtp-Source: ACHHUZ57rV6GznshDRQuv9znwOTR7CCeO7CD9y+SnsBEvFdpWmBi8Ki20RhpnN5UHsrOuDByFKK3eA==
X-Received: by 2002:a05:6a20:2444:b0:10c:dd4f:faa7 with SMTP id t4-20020a056a20244400b0010cdd4ffaa7mr1430744pzc.1.1685082715786;
        Thu, 25 May 2023 23:31:55 -0700 (PDT)
Received: from treapking.tpe.corp.google.com ([2401:fa00:1:10:9579:4741:86ee:bf02])
        by smtp.gmail.com with ESMTPSA id y4-20020a62b504000000b0063b17b58822sm2075414pfe.74.2023.05.25.23.31.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 25 May 2023 23:31:55 -0700 (PDT)
From: Pin-yen Lin <treapking@chromium.org>
To: Mauro Carvalho Chehab <mchehab@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	Hans Verkuil <hverkuil-cisco@xs4all.nl>
Cc: Tiffany Lin <tiffany.lin@mediatek.com>,
	linux-mediatek@lists.infradead.org,
	Andrew-CT Chen <andrew-ct.chen@mediatek.com>,
	Minghsiu Tsai <minghsiu.tsai@mediatek.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Houlong Wei <houlong.wei@mediatek.com>,
	Yunfei Dong <yunfei.dong@mediatek.com>,
	linux-media@vger.kernel.org,
	Hsin-Yi Wang <hsinyi@chromium.org>,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Alexandre Courbot <acourbot@chromium.org>,
	Dafna Hirschfeld <dafna.hirschfeld@collabora.com>,
	Pin-yen Lin <treapking@chromium.org>
Subject: [PATCH v6] media: mtk-vpu: Ensure alignment of 8 for DTCM buffer
Date: Fri, 26 May 2023 14:31:39 +0800
Message-ID: <20230526063149.1801196-1-treapking@chromium.org>
X-Mailer: git-send-email 2.41.0.rc0.172.g3f132b7071-goog
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230525_233158_045520_3BC0D598 
X-CRM114-Status: GOOD (  14.97  )
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

From: Alexandre Courbot <acourbot@chromium.org>

When running memcpy_toio:
memcpy_toio(send_obj->share_buf, buf, len);
it was found that errors appear if len is not a multiple of 8:

[58.350841] mtk-mdp 14001000.rdma: processing failed: -22

This is because in ARM64, memcpy_toio does byte-size access
when the length is not a multiple of 8 while access to the
vpu iomem must be 4 aligned.

This patch ensures the copy of a multiple of 8 size by calling
round_up(len, 8) when copying.

Fixes: e6599adfad30 ("media: mtk-vpu: avoid unaligned access to DTCM buffer.")
Signed-off-by: Alexandre Courbot <acourbot@chromium.org>
Signed-off-by: Dafna Hirschfeld <dafna.hirschfeld@collabora.com>
Signed-off-by: Pin-yen Lin <treapking@chromium.org>
Reviewed-by: Houlong Wei <houlong.wei@mediatek.com>
Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>

---
This is a re-send of v5 because it was marked obsolete, but this patch
is required for MT8173 platforms.

Changes in v6:
- Collect review tag

 drivers/media/platform/mediatek/vpu/mtk_vpu.c | 17 ++++++++++++++++-
 1 file changed, 16 insertions(+), 1 deletion(-)

diff --git a/drivers/media/platform/mediatek/vpu/mtk_vpu.c b/drivers/media/platform/mediatek/vpu/mtk_vpu.c
index 5e2bc286f168..19ff4afea456 100644
--- a/drivers/media/platform/mediatek/vpu/mtk_vpu.c
+++ b/drivers/media/platform/mediatek/vpu/mtk_vpu.c
@@ -349,7 +349,22 @@ int vpu_ipi_send(struct platform_device *pdev,
 		}
 	} while (vpu_cfg_readl(vpu, HOST_TO_VPU));
 
-	memcpy_toio(send_obj->share_buf, buf, len);
+	/*
+	 * On Arm64, the memcpy_toio does byte-size access as long as address or length are
+	 * not 8 aligned. Access to the vpu iomem must be 4 aligned. Byte-size access is
+	 * not allowed and cause processing to fail. Therefore make sure the length
+	 * sent to memcpy_toio is a multiply of 8.
+	 */
+	if (len % 8 != 0) {
+		unsigned char data[sizeof(send_obj->share_buf)];
+
+		memset(data + len, 0, sizeof(data) - len);
+		memcpy(data, buf, len);
+		memcpy_toio(send_obj->share_buf, data, round_up(len, 8));
+	} else {
+		memcpy_toio(send_obj->share_buf, buf, len);
+	}
+
 	writel(len, &send_obj->len);
 	writel(id, &send_obj->id);
 
-- 
2.41.0.rc0.172.g3f132b7071-goog


