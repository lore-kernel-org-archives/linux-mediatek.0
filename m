Return-Path: <SRS0=c7Bv=H4=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BA37FC433E0
	for <linux-mediatek@archiver.kernel.org>; Fri, 26 Feb 2021 10:02:58 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 668D564EEE
	for <linux-mediatek@archiver.kernel.org>; Fri, 26 Feb 2021 10:02:56 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 668D564EEE
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=chromium.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=GX9XvtNnworgvUm1U+hZVC47ZT8EEgPcsT6GZGHnpTs=; b=DxYaxg8E8On2V5pu6YusUszuC
	ZTaC8//lVER9iJrDw1wV59gthsz5jVTa0B4+pJGLEKshLboaPS+mE+NkvWJn1q0RJP4NKY0r0j93W
	hOmMnaKz0vDl65JPA1L23WFi3p/BovRS4SbYk+YTby1Q2G2ZLFWnCPKHKuqmGFWfJW9xB8BzmbszE
	3FQI9Gh4IF2AuW5nqbz8FRMl2Qv5KAo2ZgOvkBGZShTIaf0eRi0MmYKJmG34dXW4DKxRGvz0cRZwg
	nKlQLgQ+jWMNUqt9xtAv5MwW5kHWesiLHIoLC+zKL5dD0nxCrh/seaK/hHIiEjhNYgeh8/3S7Qj7E
	9cE1pHEZA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1lFZxE-00083N-8m; Fri, 26 Feb 2021 10:02:36 +0000
Received: from mail-pg1-x52b.google.com ([2607:f8b0:4864:20::52b])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1lFZx6-0007vI-Oc
 for linux-mediatek@lists.infradead.org; Fri, 26 Feb 2021 10:02:31 +0000
Received: by mail-pg1-x52b.google.com with SMTP id o63so5924193pgo.6
 for <linux-mediatek@lists.infradead.org>; Fri, 26 Feb 2021 02:02:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=WQNDkU+500oaLNnr6/H87wLcS76179lgtjRrVGbRbo0=;
 b=l2WhSkGpCkFNMw34fBmnRV9rSwS8Nn+50Rp/1Amx+5a3ZFCVm3W368JJVBq/7pUlK6
 THRAyocynBiFi0dEZz83aA28m9Nu/XWbwo+ogouGmuTiZ+7HyWcxNAFW06Mp96/BuWXu
 mqH/HshaCcS4iR0faPqQwNCNOFBDzqQq7M8DM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=WQNDkU+500oaLNnr6/H87wLcS76179lgtjRrVGbRbo0=;
 b=FQZ5MeJ3fsSLc2uuHJmkfsKtdryv8TqUyqnhi8GWD76PuxdJJKq9bRsYIg02FNxkgX
 tMKln3n+eRspVKGUpTnrRGAq6uEsLEheiiezj+7w8hBG5MwehGLtaAOfcP2JJHZfokGb
 OTsD5xJk0RYYvFYC3x+F9c43BT+QxpwJHn3QJtL97noH8t3KnVeFO/6I36EbfZwU5nVM
 X4GAwlsTOptUvK4EkPaORxHSAwy0sPi2qcY4R9mKXO8vAixgNe25uOEWJUgFdJgFEG0j
 5yBUrW75Tqwq14Wu3BiUr4ecaJxBVbunWCi+reIgDHL1TuQHaFGXO/L8KpHCZiGZPZ/V
 83+g==
X-Gm-Message-State: AOAM5304U6926tL7oTHQKXXv252R/vWvRCLj7FfBY4RhA6L0VLmzGS9G
 7sbhLTZGBDThgWeNiKALf8k/dg==
X-Google-Smtp-Source: ABdhPJyjC694FGK1elv0PdV59eZd0IgHmTfbCH66cTKytZPmlOb1dIm1+gj/IenqpVaHvv3cs9lT1g==
X-Received: by 2002:a63:4d52:: with SMTP id n18mr2177885pgl.237.1614333746419; 
 Fri, 26 Feb 2021 02:02:26 -0800 (PST)
Received: from acourbot.tok.corp.google.com
 ([2401:fa00:8f:203:5c91:233c:dd5b:b1b0])
 by smtp.gmail.com with ESMTPSA id o23sm9201565pfp.89.2021.02.26.02.02.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 26 Feb 2021 02:02:25 -0800 (PST)
From: Alexandre Courbot <acourbot@chromium.org>
To: Tiffany Lin <tiffany.lin@mediatek.com>,
 Andrew-CT Chen <andrew-ct.chen@mediatek.com>,
 Rob Herring <robh+dt@kernel.org>, Yunfei Dong <yunfei.dong@mediatek.com>
Subject: [PATCH v3 09/15] media: mtk-vcodec: enable MT8183 decoder
Date: Fri, 26 Feb 2021 19:01:42 +0900
Message-Id: <20210226100148.1663389-10-acourbot@chromium.org>
X-Mailer: git-send-email 2.30.1.766.gb4fecdf3b7-goog
In-Reply-To: <20210226100148.1663389-1-acourbot@chromium.org>
References: <20210226100148.1663389-1-acourbot@chromium.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210226_050230_160767_AE9B7049 
X-CRM114-Status: GOOD (  11.29  )
X-BeenThere: linux-mediatek@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-mediatek.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mediatek>, 
 <mailto:linux-mediatek-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mediatek/>
List-Post: <mailto:linux-mediatek@lists.infradead.org>
List-Help: <mailto:linux-mediatek-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mediatek>, 
 <mailto:linux-mediatek-request@lists.infradead.org?subject=subscribe>
Cc: Alexandre Courbot <acourbot@chromium.org>, linux-kernel@vger.kernel.org,
 linux-mediatek@lists.infradead.org, Hans Verkuil <hverkuil-cisco@xs4all.nl>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, linux-media@vger.kernel.org
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
2.30.1.766.gb4fecdf3b7-goog


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
