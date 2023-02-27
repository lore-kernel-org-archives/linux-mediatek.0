Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 05F58C64ED8
	for <linux-mediatek@archiver.kernel.org>; Mon, 27 Feb 2023 10:08:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=mmwuN3pcj845enFg4O2Zc0MzpKWEkjiLPZSJfA2MaCA=; b=PPym008+YUNENygYRn5JM9NtLc
	+lpEKkMH+7qJCtfT/LVtKqKRk5N0p9p6oPmJx2kMBhobHWI2SZj3gbva8ukEX4tflR8cY7um7o4lf
	FBSyXcx0n4qSK+1t5cT66zpBI2Pr220u1cw9J4tzs91wY+YQre4RFXpw8aN/wx3bMyYvM18/UwYls
	APnBicRGm88hyYXkuLX+MbqOkTfi2G6YKANEKT3Wp1Qh08m4TSvgA6SewgEp4vNIknH6nCkaTkatC
	eu/SGOY/yamuoXPtDtFOgQ8NgDq8Xj0ejwlWai34aUfB1ifH+HJjCMTelqdTvG7JREFrav6FoP1JN
	+oIeJm9g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pWaQh-009ArR-Em; Mon, 27 Feb 2023 10:08:23 +0000
Received: from mail-wm1-x335.google.com ([2a00:1450:4864:20::335])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pWaQb-009AoY-Fo
	for linux-mediatek@lists.infradead.org; Mon, 27 Feb 2023 10:08:21 +0000
Received: by mail-wm1-x335.google.com with SMTP id l7-20020a05600c4f0700b003e79fa98ce1so3470590wmq.2
        for <linux-mediatek@lists.infradead.org>; Mon, 27 Feb 2023 02:08:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=mmwuN3pcj845enFg4O2Zc0MzpKWEkjiLPZSJfA2MaCA=;
        b=MKohpDIz/S4Xg0x+X2KcU6t+pMtWw7x7aaCBC2MuziRcvdD9XfqUHYeXhiW+W43YBB
         WZMmSFC8bnLjoEf2XKmsxlNiDJa12aaZjQLXxytckvlazf30HKg1+peTtlqEUkieTxkH
         7RmP0u7MOT/LMhQr5ob35MvXuwnWeHc2KpK5k9Y1w9qDyCjrQE6e/ad6uk4r9od+9jvk
         meRFo3eLsviVdrZhy1gPgxUFhYVVyKitnLYOpBqxNQsQ9KMBew27BcURLOZtsccvOvaj
         CiOxQ/86WpcsJ3MUUK2xAMzmKNChDfPGgcCZZT1YN6VXbFeYyi2HOscibi1xsPfBo5+Y
         S1Ww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=mmwuN3pcj845enFg4O2Zc0MzpKWEkjiLPZSJfA2MaCA=;
        b=PsHgp2C8vHUJxoJ7qJSZcZStI8cbMl5ut3z2vBV09ii4XEkyrrKyvZPil3oMvlFD8J
         9qD6rOWRMwwJ5HzZk6ZJh81YbGvUHpdT7fq65AHW/+zw7F4DuNf3EUjZCS3EkRy9odfV
         Nf1mKUQP3sDDtgD4J/qDs9G3+3B5SwVp3jYdq5bRy651NkVGVK2Th1bhGN6CXPlMAiT1
         lQHPZ5FD2IRnmrzoMRXamnrlQ+OhWfz2sD+8gRu7m0eb07Qr21lsLyrsCTMUxJ5sjj9/
         VGEJKJ8qL++zSM65tYPTWCr2Pb27oe6/sFUlmTqCoAb0qWK2p1bQWA2WJABxMSDzL/jk
         j1cA==
X-Gm-Message-State: AO0yUKV5iIcSShnxCzN9+7kJkdnblu2P9MDfvdvEmnsCOaPI90xvQ2Fe
	gEoeZ9Qq6XqbLvgHGiE5Cb4=
X-Google-Smtp-Source: AK7set+NctmgblTUNjstaclh3h5TNdE8Cl1slDZhTW3edmpcS7hONvoasgmxBKplOMlZjM/KqCQXDQ==
X-Received: by 2002:a05:600c:34cb:b0:3eb:a4e:a2b2 with SMTP id d11-20020a05600c34cb00b003eb0a4ea2b2mr8854763wmq.4.1677492495859;
        Mon, 27 Feb 2023 02:08:15 -0800 (PST)
Received: from localhost ([102.36.222.112])
        by smtp.gmail.com with ESMTPSA id a2-20020adfdd02000000b002c3f03d8851sm6734921wrm.16.2023.02.27.02.08.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Feb 2023 02:08:14 -0800 (PST)
Date: Mon, 27 Feb 2023 13:08:11 +0300
From: Dan Carpenter <error27@gmail.com>
To: Julien STEPHAN <jstephan@baylibre.com>
Cc: Philipp Zabel <p.zabel@pengutronix.de>,
	David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Mattijs Korpershoek <mkorpershoek@baylibre.com>,
	dri-devel@lists.freedesktop.org, linux-mediatek@lists.infradead.org,
	kernel-janitors@vger.kernel.org
Subject: [PATCH] drm/mediatek: dsi: fix error codes in mtk_dsi_host_transfer()
Message-ID: <Y/yBC4yxTs+Po0TG@kili>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Mailer: git-send-email haha only kidding
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230227_020817_548849_E8CD8262 
X-CRM114-Status: GOOD (  13.80  )
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

There is a type bug because the return statement:

	return ret < 0 ? ret : recv_cnt;

will not return negatives on 64bit systems.  The problem is that the
function returns ssize_t types, while "ret" is int and "recv_cnt" is a
u32.  The negative values are type promoted to u32 and returned as
positive values instead of negative error codes.

Fixes: 81cc7e51c4f1 ("drm/mediatek: Allow commands to be sent during video mode")
Signed-off-by: Dan Carpenter <error27@gmail.com>
---
 drivers/gpu/drm/mediatek/mtk_dsi.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/mediatek/mtk_dsi.c b/drivers/gpu/drm/mediatek/mtk_dsi.c
index 7d5250351193..8e99981ca0e1 100644
--- a/drivers/gpu/drm/mediatek/mtk_dsi.c
+++ b/drivers/gpu/drm/mediatek/mtk_dsi.c
@@ -1016,12 +1016,12 @@ static ssize_t mtk_dsi_host_transfer(struct mipi_dsi_host *host,
 				     const struct mipi_dsi_msg *msg)
 {
 	struct mtk_dsi *dsi = host_to_dsi(host);
-	u32 recv_cnt, i;
+	ssize_t recv_cnt;
 	u8 read_data[16];
 	void *src_addr;
 	u8 irq_flag = CMD_DONE_INT_FLAG;
 	u32 dsi_mode;
-	int ret;
+	int ret, i;
 
 	dsi_mode = readl(dsi->regs + DSI_MODE_CTRL);
 	if (dsi_mode & MODE) {
@@ -1070,7 +1070,7 @@ static ssize_t mtk_dsi_host_transfer(struct mipi_dsi_host *host,
 	if (recv_cnt)
 		memcpy(msg->rx_buf, src_addr, recv_cnt);
 
-	DRM_INFO("dsi get %d byte data from the panel address(0x%x)\n",
+	DRM_INFO("dsi get %zd byte data from the panel address(0x%x)\n",
 		 recv_cnt, *((u8 *)(msg->tx_buf)));
 
 restore_dsi_mode:
-- 
2.39.1


