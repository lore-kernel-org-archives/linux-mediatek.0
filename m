Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C830CCD13CF
	for <linux-mediatek@archiver.kernel.org>; Mon,  2 Sep 2024 14:08:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=aiC3B7wWel8g1IjOYuF3tkcRLgYjGThJArjLJQX88Ug=; b=1MARwnqhhjFuIsbJhAminW8B2e
	z6tt6JEJwxK3hB/Ve1Yl5/12MIE6xbvN4/REyuZrIyDrsJe3kWvDRIACoxYBvzvKVXaepXTpe2ZJf
	4yGA8rLpJGJ54m2o55cOyqDUMQRtQOS28oMtTDsCNdnbDsSo09CkJUU6HtwhxaCWKfito9BAdTuNz
	VWTLDQem/UEqTXnU+GAM3uTyRvXVD8qn8+ej6nrI/Sbpwnm7h2FfPYV8sYMJN0afki6PnJhXQAPw3
	3wNPE3xh9As2lzhVvgkqQ3HXkqPKijk/yMhK80nusd3SKxNTBZlZxELDo0YaOWjlOIhYSVL7MuWvK
	7qlAGUDA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sl7jn-0000000EaxD-0iBU;
	Mon, 02 Sep 2024 14:08:59 +0000
Received: from mail-lj1-x235.google.com ([2a00:1450:4864:20::235])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sl7is-0000000EakY-1KfD;
	Mon, 02 Sep 2024 14:08:03 +0000
Received: by mail-lj1-x235.google.com with SMTP id 38308e7fff4ca-2f43de7ad5eso55052021fa.1;
        Mon, 02 Sep 2024 07:08:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1725286080; x=1725890880; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=aiC3B7wWel8g1IjOYuF3tkcRLgYjGThJArjLJQX88Ug=;
        b=X9uvAQTilbiZsAEmv+fmVXLhC5j1YlwHJ+o+M9xhZZOsA7IFjbdDLQzFExOI4v911c
         vSn2c4AW5Mkgm/t2kKxkdmGbSTIzsSA3ZS56A22c5u9RdvlZzujRUCUzz2AjTM86LnwF
         EwJkyKuNp5fM2AojbF5Sb2U8Q0yGdDC30ctP/grj4L7vUcxyecdAy93PDt+TOnWXPi1Q
         WJeDUUEJ9jdsZd6s75yWqr1aaJNfM4krjALf3N43BNtVn/zA3fgBdKlUNHVNdg8/O4sG
         T4k6Vn6zsG7+xJCnOlpJ41wJcgVZ6NYri+GE9ouQnzWIbZJN5XB6Q0hK0SUjasWS0IyC
         MgIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725286080; x=1725890880;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=aiC3B7wWel8g1IjOYuF3tkcRLgYjGThJArjLJQX88Ug=;
        b=GjpGGmcCS/oc7f/v3OAYZepIPN+3D2kB+MUYruU9raCXiTh71YaQBuZMcXZcmeVPEK
         EdCpiRnbmBhCV1+WI3E2Nz3OmSKbTOfdb/4fnccM3OG1HWQ6gVQjEl4OvaSHNtQ6VgOG
         Wj2TErDtLnInDjUqbRaBLU6SWLcXrZq+sReroFZSS60vtvfd8Sq830DyjBc86QIHJBa7
         vdkVbngtAmP2uKorIVc5cbI3WIyViGoLjiylx5q1P3N6kURUEZS3GF0nPIMf2gaEpVqC
         dVAEYbL6t02+ZGzPw6LI+SC6P1CLIZ424JkUd82E3hPMa8MhrkvAgAd863ImzZjlnI67
         WxGg==
X-Forwarded-Encrypted: i=1; AJvYcCUjI0lQJeLUfUcYgc93or6MTq/uz2tzAKbSNJKQdD3O/WBI3owfIs72pZKUVB1pX+dVB5GFcBcD723I+dqtlSfk@lists.infradead.org, AJvYcCWrzQkMtCIxdXMpTWkZUArBeDgY0fi1SoCkcv+5soay4l/dxQB5+gCGCHzTlYFXP/Lqz6zOEEIW1q/gUM+THlQ=@lists.infradead.org
X-Gm-Message-State: AOJu0Yz/N9U0CAWLIczlYMVqftLdhCvoVs9sftPiu2jk27eroTxbaOQH
	kTGsd/vTfEkol2kXSuq72Xg8THxddH7ymqfS4avUrCOF561vS+P6
X-Google-Smtp-Source: AGHT+IFoj5VV4GIPUolNGR2fXp6lt0IDaKyyQn244yprTyyO8JNuLOnzwjTsIlOH+K2Z1aj6fOdTTw==
X-Received: by 2002:a05:651c:549:b0:2ef:1d8d:2201 with SMTP id 38308e7fff4ca-2f6265841aemr53419881fa.23.1725286079480;
        Mon, 02 Sep 2024 07:07:59 -0700 (PDT)
Received: from localhost (craw-09-b2-v4wan-169726-cust2117.vm24.cable.virginm.net. [92.238.24.70])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-42bbd46b60bsm82240025e9.1.2024.09.02.07.07.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Sep 2024 07:07:58 -0700 (PDT)
From: Colin Ian King <colin.i.king@gmail.com>
To: Tiffany Lin <tiffany.lin@mediatek.com>,
	Andrew-CT Chen <andrew-ct.chen@mediatek.com>,
	Yunfei Dong <yunfei.dong@mediatek.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	linux-media@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Cc: kernel-janitors@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH][next] media: mediatek: vcodec: Remove trailing space after \n newline
Date: Mon,  2 Sep 2024 15:07:58 +0100
Message-Id: <20240902140758.308202-1-colin.i.king@gmail.com>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240902_070802_375288_CB144642 
X-CRM114-Status: GOOD (  11.95  )
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

There is a extraneous space after a newline in a mtk_venc_debug message.
Remove it.

Signed-off-by: Colin Ian King <colin.i.king@gmail.com>
---
 .../media/platform/mediatek/vcodec/encoder/venc/venc_h264_if.c  | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/media/platform/mediatek/vcodec/encoder/venc/venc_h264_if.c b/drivers/media/platform/mediatek/vcodec/encoder/venc/venc_h264_if.c
index f8145998fcaf..59e56b81d5e0 100644
--- a/drivers/media/platform/mediatek/vcodec/encoder/venc/venc_h264_if.c
+++ b/drivers/media/platform/mediatek/vcodec/encoder/venc/venc_h264_if.c
@@ -515,7 +515,7 @@ static int h264_encode_frame(struct venc_h264_inst *inst,
 	struct venc_frame_info frame_info;
 	struct mtk_vcodec_enc_ctx *ctx = inst->ctx;
 
-	mtk_venc_debug(ctx, "frm_cnt = %d\n ", inst->frm_cnt);
+	mtk_venc_debug(ctx, "frm_cnt = %d\n", inst->frm_cnt);
 
 	if (MTK_ENC_IOVA_IS_34BIT(ctx)) {
 		gop_size = inst->vsi_34->config.gop_size;
-- 
2.39.2


