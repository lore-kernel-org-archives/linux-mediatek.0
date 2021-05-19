Return-Path: <SRS0=GdzH=KO=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6D86AC433B4
	for <linux-mediatek@archiver.kernel.org>; Wed, 19 May 2021 14:32:01 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E99006135C
	for <linux-mediatek@archiver.kernel.org>; Wed, 19 May 2021 14:32:00 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org E99006135C
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=chromium.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=7liIcymgtYjwxUTMWj3INNOSbhMMcbNogyzpBatJKyY=; b=Mrhtghvj68zN5FqHqRLLh0WpW
	9HzAIWeM5jLzK9KmTuEi1JnGrNWJOGDsh1V+Ko4+yRRYi1NouG7393ib5rcavsF8CjwSsfMw5GBl9
	I1qQfd8tvYektWKsBb8S+5JN2GLIVgL3vLU82uZapfeVyE8fZZ9h2XNBJWDbXgy5Zc962JpDf6AUA
	Qv3kxn+vk0kYPlqqE8it/trm12U9IBFPCNKhd4ozOSLT9e7u/pSBugoXXwh0/lnC4d+W/jZLLpax3
	cgqTcqJOmYQJMcpmH6u7DBxMVVcDyaMnVIhBK8ybuAnMzEWH3sUXHj/NHMBUf5PtgjsaiOS+P1tr9
	UwzZPloXg==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1ljNEX-004GxW-Jv; Wed, 19 May 2021 14:31:43 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1ljNEH-004GqT-TM
 for linux-mediatek@desiato.infradead.org; Wed, 19 May 2021 14:31:22 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
 MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender
 :Reply-To:Content-Type:Content-ID:Content-Description;
 bh=pxHWIv8mtXKu/R/yk/BzKvnm7qsRzpUVYJfZeXwk3dw=; b=HbunW08VspY/EmkiChY+W3pt9e
 cieXFQI0utRBgwwjubfms1gaRZG2UmzMsRGIfKYIu/QMgOhXfuLKUCGzrSR1c7f4TPJw0iw/fb6AW
 HOIqYWRr4SSLXtI6i8iQlY2jBE/HLSYvgfqZ4lr0Gq071LKBGcy+pE8fXm5uIjWQSM7DGip4SOlsC
 jIApHIGKGVtrJ/nnoavY836tGVygniL5Xje+m7sjkQK2x5Y53HCqjTxVvNdX36x7f10DZnnVH3+Ui
 c7gIyP/c2HBNpZdp4zQ8SNwCwzRK9MzuMRvn4mPpFOJlfsKI7qAD4uwNC74TMAghXztsFTwXaRwEa
 6X1k0Bhg==;
Received: from mail-pl1-x62a.google.com ([2607:f8b0:4864:20::62a])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1ljNEE-00FXwj-Uh
 for linux-mediatek@lists.infradead.org; Wed, 19 May 2021 14:31:20 +0000
Received: by mail-pl1-x62a.google.com with SMTP id 69so7137261plc.5
 for <linux-mediatek@lists.infradead.org>; Wed, 19 May 2021 07:31:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=pxHWIv8mtXKu/R/yk/BzKvnm7qsRzpUVYJfZeXwk3dw=;
 b=fXkuTtpeHQgusVE75tuFUeKE9nPDphT70P4L4q+fYAHlAj+GnhdKAXE7840oEYdytQ
 OKXKEf3OKBJruOF7UFGUIjYdgsEyfHFMyCoqTP3q+0BxEu3yfNw66MpUSL9GqcrIBP83
 J32QI06OgpG05IDlxcBtnJ0F5xMEzKXmAWxow=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=pxHWIv8mtXKu/R/yk/BzKvnm7qsRzpUVYJfZeXwk3dw=;
 b=WOcDZqAFYgOurSEfHdFdMEZdlBvd3Bxj+JPsbjNvu6E3SWqa1NuaoFuOs9KD+IvpJ5
 KqBjs8EU2u7MalALaMW7VmXIZuxbhpyi6EOiDGslCGdkbDk35St6srIDY+y7adDmkFhJ
 Hpyj++fJTqimWRzs2oX1e0iBXlbFYMVS+FG5SIz8TYk6eqCfhgLh4fRQN8b7gYVkvZaa
 SKEpIMg+z/NoY41/uVCRfUlmxLVMdk/kvI6tyr/fIu9AIN1BS5Wssc9vf5K/77caj2z3
 DDcJVjsDBHW3Mmx5gx0YotHzjCqkkWTNwTKNlkq7eiRU7wOJPnOTnq5FJcfDxyJhXEue
 jKzg==
X-Gm-Message-State: AOAM533xCQfzfW1dEJNMrf/u0NLaAUMg/RGE/6mntxx5SSItiSgOAOzp
 ou451Y2hteCPObW3chGozA/SqQ==
X-Google-Smtp-Source: ABdhPJzeqnOqsJpS5veow9PnfCXMTVK27upTC7YKtWnpvDe+ecqqvMOsYEizM4mYpgTDHsDyLTdEFw==
X-Received: by 2002:a17:90b:19d3:: with SMTP id
 nm19mr11510188pjb.215.1621434678224; 
 Wed, 19 May 2021 07:31:18 -0700 (PDT)
Received: from acourbot.tok.corp.google.com
 ([2401:fa00:8f:203:87ab:ff82:1544:697])
 by smtp.gmail.com with ESMTPSA id 3sm14337661pff.132.2021.05.19.07.31.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 19 May 2021 07:31:17 -0700 (PDT)
From: Alexandre Courbot <acourbot@chromium.org>
To: Tiffany Lin <tiffany.lin@mediatek.com>,
 Andrew-CT Chen <andrew-ct.chen@mediatek.com>,
 Hans Verkuil <hverkuil-cisco@xs4all.nl>,
 Dafna Hirschfeld <dafna.hirschfeld@collabora.com>,
 Yunfei Dong <yunfei.dong@mediatek.com>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>, linux-media@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org,
 Alexandre Courbot <acourbot@chromium.org>
Subject: [PATCH v5 14/14] media: mtk-vcodec: enable MT8183 decoder
Date: Wed, 19 May 2021 23:30:11 +0900
Message-Id: <20210519143011.1175546-15-acourbot@chromium.org>
X-Mailer: git-send-email 2.31.1.751.gd2f1c929bd-goog
In-Reply-To: <20210519143011.1175546-1-acourbot@chromium.org>
References: <20210519143011.1175546-1-acourbot@chromium.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210519_073119_007573_182233A7 
X-CRM114-Status: GOOD (  11.92  )
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
index f1e9261cbcf0..00f160ca0f12 100644
--- a/drivers/media/platform/mtk-vcodec/mtk_vcodec_dec_drv.c
+++ b/drivers/media/platform/mtk-vcodec/mtk_vcodec_dec_drv.c
@@ -375,12 +375,17 @@ static int mtk_vcodec_probe(struct platform_device *pdev)
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
2.31.1.751.gd2f1c929bd-goog


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
