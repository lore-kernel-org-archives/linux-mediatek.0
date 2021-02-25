Return-Path: <SRS0=YoM+=H3=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8E4EDC433E9
	for <linux-mediatek@archiver.kernel.org>; Thu, 25 Feb 2021 10:17:09 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3294464F0E
	for <linux-mediatek@archiver.kernel.org>; Thu, 25 Feb 2021 10:17:09 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 3294464F0E
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=chromium.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=kNXzX2ZyNFLl+4qjvb4efyzYzw6BHJpbQuzT36cc+Ew=; b=pbzIhLYSKpHvZ/9UmjbyKYiIS
	GreW4Mni0aagTyQtIla/8rOWQz3/bG+4Kd3nAD0r2V2xcrg8b+I4HjM0KviqKkoFFOBXNTmTSK+j4
	Cfokq6tz/D6kauWVqUlUdxZ5kA2OK0icr7FF/bKoxdkLj7gq/oDZ8L82mIk4iAbnaN+nnaNAKGgIr
	QZ9FuV5SqrnCEpWNoIQuNzNh0J0BCtHiOT7QLonkwaSCrb1DGt9X2jPgVb2I4jPct9CrFjRJQPGCQ
	Edc2fp8TgnV+gTPiWFwRdonpocYivPbKuJYHzM6UjmjzJatn+YpEbIFSb2RMnnD0HFwj/ALOvfvVU
	/pEKJhOsg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1lFDhX-0002Xy-6k; Thu, 25 Feb 2021 10:16:55 +0000
Received: from mail-pj1-x102c.google.com ([2607:f8b0:4864:20::102c])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1lFDhS-0002Ui-VG
 for linux-mediatek@lists.infradead.org; Thu, 25 Feb 2021 10:16:52 +0000
Received: by mail-pj1-x102c.google.com with SMTP id e9so553065pjs.2
 for <linux-mediatek@lists.infradead.org>; Thu, 25 Feb 2021 02:16:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=+yS+AHb3s866k2lU1xZg4tYpUdbOibtq7glaYxaE4WE=;
 b=G+uLU8+yUATiEZ5HzQaduPeaScP4CKUMHIXLp99zpPe/n1rYF1y5KD8PyO5+Uhb4oZ
 S+oZod2AvWjLkHachJAObSMbOwqQlTr1xTS2cvLtMvtG3S1MR/v5+73nRnNvgOGfvg3J
 uPH+TQjr8WmHfXhrLVK3f3CFm4qtrXr42dWzo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=+yS+AHb3s866k2lU1xZg4tYpUdbOibtq7glaYxaE4WE=;
 b=luzOdLHeAIfIS9tzI2XdfFagBg7ej0rFVrpyyq0L/WgRfX5IR/UIUl71qS0iKWjmcT
 VAGVDG5txsqs8s0TnQ5kfKdF4bcusLXpniSt6oH8i5W61bDh9ssga6BS+tUCpXLj+Lji
 HmFWVPhBOyw68newxmcT4XPAosjukljXS2R7x4RSNK5OAw4QBfFfqDCVAv0lT/Lcj0iu
 SWP+xWMCUZ/uV/RruO4dRVJ5XWGQHk6MuNlMQkq+wHMKwVU6IirQmwUZPuSTjlV2krkN
 8vsEF3MLPMJmfxNpHAGZ5YvTINhP8zjiTwjImTleFquDkDSkkSUZ3uNqrgBn1Rs7PHmc
 1S/g==
X-Gm-Message-State: AOAM531qpDMvpZ29/YqxUTuv+cRSQKGlWVaUof8+6XTXfzZ3TX5PdBwD
 /LiYILJCy/AfQcN37iL8zsaRmw==
X-Google-Smtp-Source: ABdhPJwoIZ6BLFEX8Y/Krce0DGVLg703lQE0bVo0LkyeZhUB7NkSDv4jQgzyoGecoxzT7Z7DOkZAIA==
X-Received: by 2002:a17:90a:1616:: with SMTP id
 n22mr2620982pja.110.1614248209010; 
 Thu, 25 Feb 2021 02:16:49 -0800 (PST)
Received: from acourbot.tok.corp.google.com
 ([2401:fa00:8f:203:2550:3154:2c53:b6e7])
 by smtp.gmail.com with ESMTPSA id z2sm5848193pfc.8.2021.02.25.02.16.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 25 Feb 2021 02:16:48 -0800 (PST)
From: Alexandre Courbot <acourbot@chromium.org>
To: Tiffany Lin <tiffany.lin@mediatek.com>,
 Andrew-CT Chen <andrew-ct.chen@mediatek.com>,
 Rob Herring <robh+dt@kernel.org>, Yunfei Dong <yunfei.dong@mediatek.com>
Subject: [PATCH v2 8/8] media: mtk-vcodec: enable MT8183 decoder
Date: Thu, 25 Feb 2021 19:16:12 +0900
Message-Id: <20210225101612.2832444-9-acourbot@chromium.org>
X-Mailer: git-send-email 2.30.0.617.g56c4b15f3c-goog
In-Reply-To: <20210225101612.2832444-1-acourbot@chromium.org>
References: <20210225101612.2832444-1-acourbot@chromium.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210225_051651_061086_92A97576 
X-CRM114-Status: GOOD (  11.57  )
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
2.30.0.617.g56c4b15f3c-goog


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
