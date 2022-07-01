Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7AC0FC433EF
	for <linux-mediatek@archiver.kernel.org>; Fri,  1 Jul 2022 10:53:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=tNyMQ++pzshlrdbVzN0h4wlM/fIXVOempzIZ1eG6MMs=; b=NIE8cDQW/nsYqLTRlJ+qTBTdlq
	x8iyKtATpum+k6xaQf5lmf4YN+KzPo1V1QNJN5dacl9EH7EAdwhgLE3dlLPwNN6YLIJ5Z00ZAlBhS
	cI51l2IZpdTxdCWJA/lzA2jFZ6m/2OsMRQoo4WIeABAiEKON0H1cf5Xxy7CFul31nF3GReVCJ1Gnp
	lLJ1K6AzzJnbTXebT7XMRxWSliMC+Kub+h0vG/31ml1nXAo+ObMHJwVQBfwZFCcLSrEdBDmpa6Jx4
	afTct3tIPTEMw0u5HEHDiU63cfDJhYxAkjfS8/3wj63HpPtpgJBKXxUpYoBQH3X7eVL+/UeQJXa05
	txHEIIPA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o7EH7-004D1s-GK; Fri, 01 Jul 2022 10:53:25 +0000
Received: from mail-pl1-x62e.google.com ([2607:f8b0:4864:20::62e])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o7EGv-004Crn-Uf
	for linux-mediatek@lists.infradead.org; Fri, 01 Jul 2022 10:53:15 +0000
Received: by mail-pl1-x62e.google.com with SMTP id o18so2051811plg.2
        for <linux-mediatek@lists.infradead.org>; Fri, 01 Jul 2022 03:53:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=tNyMQ++pzshlrdbVzN0h4wlM/fIXVOempzIZ1eG6MMs=;
        b=R0aOMwa3NeqUy4oQXlLgM0ZB88OAVKA6dYgXtMw93bB6/rs23mPNXNFWvpU0GH4/yc
         Sb43dmVFsJsUaxYZMZDX+10lSYlhoOSouqkueKVSNJBpG6t7qXpuQD+ZkXbvjk+mCCu5
         7pJH8faeJl/CLhn1M3PPjQYQYZkmZZeoZC/cM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=tNyMQ++pzshlrdbVzN0h4wlM/fIXVOempzIZ1eG6MMs=;
        b=rKjZb38rgSufY+iK8suYqVIBPxi78TIMJUfSj4SFdgp3fWB8Sb6XhzWD+3bdNOz5IG
         ieVCWEzaDrYl6Rxts1nxFXhYSycWLZqRVAbn+PrYWpj1OfYN2V1/WIjoBUYjPHYJM43a
         1IyoGm+noqcTL8chmGoiREEfH17qIe3OfinwGjKlXtN/XPDooFrsIhxKC9cEMGqSIt1P
         HH8X7Z3MTndcLXADi4gRSyh5Jfwd0P57y/xgQtjO4bI6jvqdhzykyG0gkj5sdPEXewrO
         pNBcyxX8uSo2PRQ9oMv0CRlD10SeJkTSiAmuuMLeLZjyXaGm8sej062oQe1IZjeMXJnP
         hOLA==
X-Gm-Message-State: AJIora+3NuilPE2i64Yy5f1UrfJQ3kUpNkKC4qDFr6sH13W4eaMkHBql
	k+Bf/hyWn09u3IvBeCpwF4RyjZyV74yttw==
X-Google-Smtp-Source: AGRyM1uQQ52QyYlrWwh7GikfxSqOxRmuspOTO1vfzF1wU6i5Pt26r3/Hv3209Cj778VfSQ4D3XqAYw==
X-Received: by 2002:a17:902:db11:b0:16b:9057:8007 with SMTP id m17-20020a170902db1100b0016b90578007mr18154361plx.49.1656672791912;
        Fri, 01 Jul 2022 03:53:11 -0700 (PDT)
Received: from wenstp920.tpe.corp.google.com ([2401:fa00:1:10:59bf:8b47:50a0:b04f])
        by smtp.gmail.com with ESMTPSA id j2-20020a170902758200b0016a058b7547sm14906670pll.294.2022.07.01.03.53.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 01 Jul 2022 03:53:11 -0700 (PDT)
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
Subject: [PATCH 3/6] media: mediatek: vcodec: Use default bus_info for decoder capability
Date: Fri,  1 Jul 2022 18:52:34 +0800
Message-Id: <20220701105237.932332-4-wenst@chromium.org>
X-Mailer: git-send-email 2.37.0.rc0.161.g10f37bed90-goog
In-Reply-To: <20220701105237.932332-1-wenst@chromium.org>
References: <20220701105237.932332-1-wenst@chromium.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220701_035314_017775_28FC4BD8 
X-CRM114-Status: GOOD (  11.10  )
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

Since commit f2d8b6917f3b ("media: v4l: ioctl: Set bus_info in
v4l_querycap()"), the V4L2 core provides a default value for the
bus_info field for platform and PCI devices. This value will match
the default value for media devices added by commit cef699749f37
("media: mc: Set bus_info in media_device_init()"). These defaults
are stable and device-specific.

Drop the custom capability bus_info from the mtk-vcodec decoder
driver, and use the defaults. This also fixes the long standing
issue where the media device used for the stateless decoder didn't
have its bus_info set, and would never match its accompanying video
device.

Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>
---
 drivers/media/platform/mediatek/vcodec/mtk_vcodec_dec.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/media/platform/mediatek/vcodec/mtk_vcodec_dec.c b/drivers/media/platform/mediatek/vcodec/mtk_vcodec_dec.c
index 7f03dab518a4..209de1ec02e4 100644
--- a/drivers/media/platform/mediatek/vcodec/mtk_vcodec_dec.c
+++ b/drivers/media/platform/mediatek/vcodec/mtk_vcodec_dec.c
@@ -249,7 +249,6 @@ static int vidioc_vdec_querycap(struct file *file, void *priv,
 
 	strscpy(cap->driver, dev->driver->name, sizeof(cap->driver));
 	snprintf(cap->card, sizeof(cap->card), "MT%d video decoder", platform_name);
-	snprintf(cap->bus_info, sizeof(cap->bus_info), "platform:mt%d-dec", platform_name);
 
 	return 0;
 }
-- 
2.37.0.rc0.161.g10f37bed90-goog


