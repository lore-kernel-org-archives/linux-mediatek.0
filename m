Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 07205C433EF
	for <linux-mediatek@archiver.kernel.org>; Wed,  6 Jul 2022 08:22:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=JwjM4aG2gB9+TdDB98m3vhzsdflSXb4D+/c8i8pKJx0=; b=42nR2L88n0IcTI8aUvSFRqwTUC
	6tX4TGQQsk7JoJ/ROoGVn5CDipgMXDlbLVcJAMdiJba85LAM2IQJ46uEPwu8utzvzcSWezyVoFZW7
	kivzL2D3MRCuJjjP1jpA+p4Xs85Bsa0cQiyGcBbuuLynY8x1l4QhDSU4Qqby3kcpRvjsQzqvQzYjL
	cSfPEStWYJHxVDJ/0Xnn0ecjD06KkLuQSLBbMqYxEeYb8jMwu8Cx7J6X4Zgo/ACfvUu27rbD0RJW9
	5Web9XMm+4JXJRwooM9yJadSxRhq+9IwEtOl7LWhWUgzjNuhCkOs50FDvwyB/vs5G3hFyrq6FC3QR
	kA3YO3Mg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o90IR-007LQH-3o; Wed, 06 Jul 2022 08:22:07 +0000
Received: from mail-pf1-x433.google.com ([2607:f8b0:4864:20::433])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o90IM-007LLL-Pc
	for linux-mediatek@lists.infradead.org; Wed, 06 Jul 2022 08:22:04 +0000
Received: by mail-pf1-x433.google.com with SMTP id l124so3348279pfl.8
        for <linux-mediatek@lists.infradead.org>; Wed, 06 Jul 2022 01:22:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=JwjM4aG2gB9+TdDB98m3vhzsdflSXb4D+/c8i8pKJx0=;
        b=N7dOOvucEDYkMqhp2ctayX7Z/y+eURq7LldgGQRj+MugzxvffpIXvCfvAIn6/ybvl6
         DJKXqzhMUySX352b33U36W/ZPbS30UgaBToh+RKEoeiqlEKezAxBJp/2fLE4yHXp51E9
         miuVayU/xVrUZhKUdARWa6siIeedl8mdvDZlU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=JwjM4aG2gB9+TdDB98m3vhzsdflSXb4D+/c8i8pKJx0=;
        b=qGSu5JC42rqEW1LNbMGIFqkf2hEnNy1aMyN529h8bgiecnV+3J8wVR4e4cq7XYUOYS
         bYv5koGwvO7IpiIBpRqoMDh0PnvQUvX2PL2qwge3xBHmEctBqEScqgho/umcLh3P0SFH
         s21H2yYQbPtrQ0NyE4FzoTzs3uqmtKCbGS9RLZPN83oneSDDKcEIPS4Zol1/67jF7O33
         25l1Z72fgS3v8YOZHu6QxAGm/4WYk5kkhowVrgqwNgbbJg6ztVROCJRlsUy77GjHIbtb
         HrYUsWAbxrNdN3maEBH4k4pPv/yDLGhHw9Q06Qks52vUgg63cDj1XVdhTZDZxfqz7wQE
         mdfA==
X-Gm-Message-State: AJIora/fuo9a0lfvxHwAnIyBaNWzt4m0n4TWGZDArmqRDFCWAqX3JyxB
	O/AqxcraHRUDEAofSQoOuoB+NA==
X-Google-Smtp-Source: AGRyM1vdyg/m1tsExpeqCPFt1V28vkyPJIpq4iabapLc2qReT+Wur6sP+aTdbO3uuzEOUpoqJb9qYw==
X-Received: by 2002:a05:6a00:174f:b0:525:518e:71d6 with SMTP id j15-20020a056a00174f00b00525518e71d6mr45951288pfc.68.1657095719919;
        Wed, 06 Jul 2022 01:21:59 -0700 (PDT)
Received: from wenstp920.tpe.corp.google.com ([2401:fa00:1:10:74a3:a7a4:af57:d7f])
        by smtp.gmail.com with ESMTPSA id rm1-20020a17090b3ec100b001ed27d132c1sm20767040pjb.2.2022.07.06.01.21.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 06 Jul 2022 01:21:59 -0700 (PDT)
From: Chen-Yu Tsai <wenst@chromium.org>
To: Tiffany Lin <tiffany.lin@mediatek.com>,
	Andrew-CT Chen <andrew-ct.chen@mediatek.com>,
	Yunfei Dong <yunfei.dong@mediatek.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Hans Verkuil <hverkuil-cisco@xs4all.nl>
Cc: Chen-Yu Tsai <wenst@chromium.org>,
	linux-media@vger.kernel.org,
	linux-mediatek@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Nicolas Dufresne <nicolas@ndufresne.ca>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Nicolas Dufresne <nicolas.dufresne@collabora.com>
Subject: [PATCH v2 1/6] media: mediatek: vcodec: decoder: Const-ify stepwise_fhd
Date: Wed,  6 Jul 2022 16:21:33 +0800
Message-Id: <20220706082138.2668163-2-wenst@chromium.org>
X-Mailer: git-send-email 2.37.0.rc0.161.g10f37bed90-goog
In-Reply-To: <20220706082138.2668163-1-wenst@chromium.org>
References: <20220706082138.2668163-1-wenst@chromium.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220706_012202_945085_52F5F72A 
X-CRM114-Status: GOOD (  11.68  )
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

stepwise_fhd is the reference framesize variable, and should not be
altered. Make it constant.

Fixes: ("76250b48de79 media: mediatek: vcodec: Getting supported decoder format types")
Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>
---
 .../media/platform/mediatek/vcodec/mtk_vcodec_dec_stateless.c   | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/media/platform/mediatek/vcodec/mtk_vcodec_dec_stateless.c b/drivers/media/platform/mediatek/vcodec/mtk_vcodec_dec_stateless.c
index 16d55785d84b..f1c0276c9026 100644
--- a/drivers/media/platform/mediatek/vcodec/mtk_vcodec_dec_stateless.c
+++ b/drivers/media/platform/mediatek/vcodec/mtk_vcodec_dec_stateless.c
@@ -119,7 +119,7 @@ static struct mtk_video_fmt default_cap_format;
 static unsigned int num_formats;
 static unsigned int num_framesizes;
 
-static struct v4l2_frmsize_stepwise stepwise_fhd = {
+static const struct v4l2_frmsize_stepwise stepwise_fhd = {
 	.min_width = MTK_VDEC_MIN_W,
 	.max_width = MTK_VDEC_MAX_W,
 	.step_width = 16,
-- 
2.37.0.rc0.161.g10f37bed90-goog


