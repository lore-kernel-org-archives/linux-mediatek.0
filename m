Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F19BFC43334
	for <linux-mediatek@archiver.kernel.org>; Fri,  1 Jul 2022 10:53:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=I4MDjjO8BzInQr5TM6t/zvnDVVooHxE4yuX82IM60po=; b=K1IvOAsHa9C1KizC4xWkmTtNbN
	x8+kqXR/wr28pU3SyYSmb+5mP4HolSReaJ3GF3/ZqjHN+hvFa8nrR+bxRuWgZ0o6OScSiUrPvfYpQ
	FdcCJXYGgGL9dw4UOwfXv5PndtQVQFnBTIHoli5Q6eqmJkFAr015APcgSbhzQ/wxCnDpD7w5nwetR
	pjWHTr1jKHMJPPoVXiIlP63lWoSOrD6ssqhxzNGcNpHsg/prnHHbPnAGex8G8Qy4GGQbHAcmmoag8
	2bXpHCCuKdaXu2OE6At0vZ4IHofW83KWPYV9+D96UT/gtJm7SxQNy4UGeSZUMpPpsFYimagdcaYqj
	6DrVyz3A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o7EH0-004CwD-Ci; Fri, 01 Jul 2022 10:53:18 +0000
Received: from mail-pj1-x1033.google.com ([2607:f8b0:4864:20::1033])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o7EGv-004Cqb-G0
	for linux-mediatek@lists.infradead.org; Fri, 01 Jul 2022 10:53:14 +0000
Received: by mail-pj1-x1033.google.com with SMTP id c6-20020a17090abf0600b001eee794a478so6066894pjs.1
        for <linux-mediatek@lists.infradead.org>; Fri, 01 Jul 2022 03:53:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=I4MDjjO8BzInQr5TM6t/zvnDVVooHxE4yuX82IM60po=;
        b=F3QxikYl5N3X8/xOvdJRq17w3/NvwpiHC3GsLbFy1xYBZcDslcuAXxxjAOmbRx+2Da
         JYZdAUyxWrab4Pt6Qpwnf19kDkkaaul5CO8fcfr5Lszh9rOuNFTCFUMOJl6sDAjDDbeT
         FnCw6/fhwibl1Y2uUb0unP3OSQTZgVklKjUgA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=I4MDjjO8BzInQr5TM6t/zvnDVVooHxE4yuX82IM60po=;
        b=mfjAjKS8/UdSkjzhgh8pcJDhpSt+dfhBTL1VFYPE1y9PzLnJh7/I3y3zPOJ2qqoOt5
         YbvWe0HeNYqqM+6ijriN3Pjmw9m9Cbl7uJIW5FDnq8pYdK/PGYj6T+WzIKjK7xl+ZMs4
         Mb0yankZCcd6RQNoKaf3sUTyVVJF6jh/rrf08DLXS5v1NQqWXn786/vgJ/PofMuCUTl/
         vIuXcl4mN1reTXtvbUsVR5kPxa9fyQ6pfFWhw4U+Y3/kqFoCFqrtZ/bDxZMB7JiUZJe7
         b+ngGr+VkA7OHl8at/6RQT9L1sRp3QJEgBgFzkrxWq8stTxXUpEykp5AAei5n+NImOJU
         Kt8g==
X-Gm-Message-State: AJIora+oSDHIhZ5pp/PgQ44nk6zmpt03F8Aa62ogCDxc9zU0kVB5cE/8
	Dn/LRH0GPnklntyXyJ7cuRm0jA==
X-Google-Smtp-Source: AGRyM1vbOP8ZG1cPe69kNtF3atkiQXQM1DFxbicYf1wohz+ZtbE2UYVdKl/eREdjtV/98YWDo3SckQ==
X-Received: by 2002:a17:90b:2245:b0:1ed:fef:5656 with SMTP id hk5-20020a17090b224500b001ed0fef5656mr15588223pjb.100.1656672789632;
        Fri, 01 Jul 2022 03:53:09 -0700 (PDT)
Received: from wenstp920.tpe.corp.google.com ([2401:fa00:1:10:59bf:8b47:50a0:b04f])
        by smtp.gmail.com with ESMTPSA id j2-20020a170902758200b0016a058b7547sm14906670pll.294.2022.07.01.03.53.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 01 Jul 2022 03:53:09 -0700 (PDT)
From: Chen-Yu Tsai <wenst@chromium.org>
To: Tiffany Lin <tiffany.lin@mediatek.com>,
	Andrew-CT Chen <andrew-ct.chen@mediatek.com>,
	Yunfei Dong <yunfei.dong@mediatek.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Hans Verkuil <hverkuil-cisco@xs4all.nl>
Cc: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Nicolas Dufresne <nicolas.dufresne@collabora.com>,
	Chen-Yu Tsai <wenst@chromium.org>,
	linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-mediatek@lists.infradead.org,
	Matthias Brugger <matthias.bgg@gmail.com>
Subject: [PATCH 2/6] media: mediatek: vcodec: Use meaningful decoder card name including chip name
Date: Fri,  1 Jul 2022 18:52:33 +0800
Message-Id: <20220701105237.932332-3-wenst@chromium.org>
X-Mailer: git-send-email 2.37.0.rc0.161.g10f37bed90-goog
In-Reply-To: <20220701105237.932332-1-wenst@chromium.org>
References: <20220701105237.932332-1-wenst@chromium.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220701_035313_568033_1619256E 
X-CRM114-Status: GOOD (  12.96  )
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

The card name for the video decoder previously held a static platform
name, that was fixed to match MT8173. This obviously doesn't make sense
for newer chips. Since commit a8a7a278c56a ("media: mediatek: vcodec:
Change decoder v4l2 capability value"), this field was changed to hold
the driver's name, or "mtk-vcodec-dec". This doesn't make much sense
either, since this still doesn't reflect what chip this is.

Instead, fill in the card name with "MTxxxx video decoder" with the
proper chip number.

Fixes: a8a7a278c56a ("media: mediatek: vcodec: Change decoder v4l2 capability value")
Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>
---
 drivers/media/platform/mediatek/vcodec/mtk_vcodec_dec.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/media/platform/mediatek/vcodec/mtk_vcodec_dec.c b/drivers/media/platform/mediatek/vcodec/mtk_vcodec_dec.c
index e7ea632a3f94..7f03dab518a4 100644
--- a/drivers/media/platform/mediatek/vcodec/mtk_vcodec_dec.c
+++ b/drivers/media/platform/mediatek/vcodec/mtk_vcodec_dec.c
@@ -248,7 +248,7 @@ static int vidioc_vdec_querycap(struct file *file, void *priv,
 	int platform_name = mtk_vcodec_dec_get_chip_name(priv);
 
 	strscpy(cap->driver, dev->driver->name, sizeof(cap->driver));
-	strscpy(cap->card, MTK_VCODEC_DEC_NAME, sizeof(cap->card));
+	snprintf(cap->card, sizeof(cap->card), "MT%d video decoder", platform_name);
 	snprintf(cap->bus_info, sizeof(cap->bus_info), "platform:mt%d-dec", platform_name);
 
 	return 0;
-- 
2.37.0.rc0.161.g10f37bed90-goog


