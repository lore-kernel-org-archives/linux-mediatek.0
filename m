Return-Path: <SRS0=NJpa=JY=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 31609C433B4
	for <linux-mediatek@archiver.kernel.org>; Tue, 27 Apr 2021 11:16:34 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8404661139
	for <linux-mediatek@archiver.kernel.org>; Tue, 27 Apr 2021 11:16:33 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 8404661139
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=chromium.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=HXwIXEcgfA44Iutkp3Y8rjSQfxUx5xCjC7ZCofkocIg=; b=j30cJixLwlPdZH0IhxhOwo2gw
	eQhKPdnuLnOlei56S8hXJGbBFIUOI/s5MqsOABHTaDsjuKdRz4Fzj/y2g4nXq/Po5PRK8dtKO3w36
	ADED4e6/7V7UE/KQkWuTu4mvuMBgg7LfQTrexEL49E8VAHUdAWqeXN7qHKqikoQMIjgUPH8a1pOoC
	prKrphW3ZNCfxetRDmzeUBiI9FFJzfEWodcPL67ypBaAfH3uyj/EMuNjuNiNUk35Z4EXqna78TE5f
	jMUNZnFOUf7i4KphobGqVtTXsmA9HcUZLQvQD6s4RaDu0e018H9JZq+Xoqyc2wlq+hCKwnqhzG18m
	lxr4tIMCQ==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lbLhR-001Tpv-JX; Tue, 27 Apr 2021 11:16:17 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lbLhF-001Tm0-3X
 for linux-mediatek@desiato.infradead.org; Tue, 27 Apr 2021 11:16:05 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
 MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender
 :Reply-To:Content-Type:Content-ID:Content-Description;
 bh=FGCi4wgyNmOswZhTsUzcguHV+B0Lp+oepbJNaLdIIQs=; b=V8US7ng/tjODdQwIMKfIcvfUaL
 JUdgzK7WIrx6PKZoMbZS/vEveT8nBsx4cijZI85mgTCXrObGvlA3EhnLSxpCSoA4n1bFxV9KmjX+3
 fNhzVqnuxSSTB3FDRaZbT6nMlaIdO/yChB5jQVt9R1N62CH8JppCa1SnTlenpDdtwflMERMGq1tRZ
 gho91uh5rhhvB95aJ32fsy/xgZWojrFafwGAK/A0VUmH5q6Av8PenS5jJmC6WlbaSwugOWhiwSVPd
 kjdkLZhvRjtxq0vxKApDdwTvqcgksWQX+qGRlS38UvafUeWWgBJsiISECDo2RHK0rE4IJZ7Lt9U1O
 crnY7rHA==;
Received: from mail-pg1-x534.google.com ([2607:f8b0:4864:20::534])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lbLhC-00GgFN-Ig
 for linux-mediatek@lists.infradead.org; Tue, 27 Apr 2021 11:16:03 +0000
Received: by mail-pg1-x534.google.com with SMTP id p2so26649033pgh.4
 for <linux-mediatek@lists.infradead.org>; Tue, 27 Apr 2021 04:16:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=FGCi4wgyNmOswZhTsUzcguHV+B0Lp+oepbJNaLdIIQs=;
 b=eM/J7FTNEqy/zfDU2sn4V/mLvs/9ZVj7P8OeX8GYnAg1OLcd/aZi3pIJ34tMwyGLTg
 ttZdQQSMaCDyhPcEOUdUT7UqSweFwjsZgymNQ2cqZ4t4cMdUNC8ACJqw+MqWwPw3TOqE
 XFZY6A4SL+Bh4dfHH3MxZaUUhPfMk/rCzWt8A=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=FGCi4wgyNmOswZhTsUzcguHV+B0Lp+oepbJNaLdIIQs=;
 b=n4tfZsfjEExV/aA2g0ziWIu2rJ0txWbUDaWgsD2VqfGp2LGK0Ou40VkP1OgLz08qsK
 T3KrBnS/nnpbuOzaXxNEzNSR/qwo7fjaQ/HTSsxuPOk7azxovD4EuwzbGntJEnB50bG5
 WnTcCeKPdAS99C1/JfC4C8M8PDNP0MMiZAm+Buv3exnJwASExMttZHOWv/e/2HVMKdue
 vNWv9LHjnAzR+WCfjdK+h79vW+vXuepKae9poGtKYQPzapeNfJwplomJpvk56gD6jgT2
 Hu2Ts8yAqcNkCYLxOr6jZMYCWuTwKL8x4Xnr05kQ5+xb/xn/141E4dgrMn0si2ZmBpjU
 twag==
X-Gm-Message-State: AOAM530ApY8CYTTEJd8eeIKnUX6R/RMv+XU3zM/ls46W8UOVrmemxzPu
 FkIuZg782MSMPlEzcNnHbCZWyg==
X-Google-Smtp-Source: ABdhPJzMT5Fck/ahyuMY+JNQxL/9oUgdrbw/UDDbspnGnAl+oGo6sz77U5W7LGN1CgNLep74HZAJZA==
X-Received: by 2002:a62:528e:0:b029:1f5:c5ee:a487 with SMTP id
 g136-20020a62528e0000b02901f5c5eea487mr21962939pfb.7.1619522161753; 
 Tue, 27 Apr 2021 04:16:01 -0700 (PDT)
Received: from acourbot.tok.corp.google.com
 ([2401:fa00:8f:203:b182:d363:32d0:53a2])
 by smtp.gmail.com with ESMTPSA id c21sm2347210pfc.165.2021.04.27.04.15.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 27 Apr 2021 04:16:01 -0700 (PDT)
From: Alexandre Courbot <acourbot@chromium.org>
To: Tiffany Lin <tiffany.lin@mediatek.com>,
 Andrew-CT Chen <andrew-ct.chen@mediatek.com>,
 Rob Herring <robh+dt@kernel.org>, Yunfei Dong <yunfei.dong@mediatek.com>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>,
 Hans Verkuil <hverkuil-cisco@xs4all.nl>, linux-media@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org,
 Alexandre Courbot <acourbot@chromium.org>
Subject: [PATCH v4 09/15] media: mtk-vcodec: enable MT8183 decoder
Date: Tue, 27 Apr 2021 20:15:20 +0900
Message-Id: <20210427111526.1772293-10-acourbot@chromium.org>
X-Mailer: git-send-email 2.31.1.498.g6c1eba8ee3d-goog
In-Reply-To: <20210427111526.1772293-1-acourbot@chromium.org>
References: <20210427111526.1772293-1-acourbot@chromium.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210427_041602_634892_0A704430 
X-CRM114-Status: GOOD (  11.67  )
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

From: Yunfei Dong <yunfei.dong@mediatek.com>

Now that all the supporting blocks are present, enable decoder for
MT8183.

Signed-off-by: Yunfei Dong <yunfei.dong@mediatek.com>
[acourbot: refactor, cleanup and split]
Co-developed-by: Alexandre Courbot <acourbot@chromium.org>
Signed-off-by: Alexandre Courbot <acourbot@chromium.org>
---
 drivers/media/platform/mtk-vcodec/mtk_vcodec_dec_drv.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/drivers/media/platform/mtk-vcodec/mtk_vcodec_dec_drv.c b/drivers/media/platform/mtk-vcodec/mtk_vcodec_dec_drv.c
index e942e28f96fe..e0526c0900c8 100644
--- a/drivers/media/platform/mtk-vcodec/mtk_vcodec_dec_drv.c
+++ b/drivers/media/platform/mtk-vcodec/mtk_vcodec_dec_drv.c
@@ -383,12 +383,17 @@ static int mtk_vcodec_probe(struct platform_device *pdev)
 }
 
 extern const struct mtk_vcodec_dec_pdata mtk_vdec_8173_pdata;
+extern const struct mtk_vcodec_dec_pdata mtk_vdec_8183_pdata;
 
 static const struct of_device_id mtk_vcodec_match[] = {
 	{
 		.compatible = "mediatek,mt8173-vcodec-dec",
 		.data = &mtk_vdec_8173_pdata,
 	},
+	{
+		.compatible = "mediatek,mt8183-vcodec-dec",
+		.data = &mtk_vdec_8183_pdata,
+	},
 	{},
 };
 
-- 
2.31.1.498.g6c1eba8ee3d-goog


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
