Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6E297E82CA8
	for <linux-mediatek@archiver.kernel.org>; Wed, 27 Sep 2023 15:38:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=KnK9e8ZFi3pebVdrAjDVtxSA0qCAi/hA6TDylmv0g/A=; b=cb78FnL6S6kipAp7WfHv2mzmBg
	6awEWhie3+6KaEvNC7e3sfFEQCvGFvT7138Azs95liEPTz97BmjzFgZeO4SY/Wzm0xbg4Zrpi2TwW
	XqFImEnt8A249qGV76nSqOyHMNHhfuy7zdCl9cJpmZ1BUlR/bCqPwmMbrymV2uxUPfqsPhKrKoCAf
	YBufxYB0WY92N1Tz6ZlNC4QhYXik5oNyXgrDDWSGeA3n0HjSDr90Q7CMhoQGzJdxUE1qEdvykbARN
	GgcDASWqqSBKlQpAuiENLDp4cVTHyRY/MIyLbO+BV5OlubjjrGNsx9pESEvPeVeOd/yGdb0VnqBYS
	JgRAO97g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qlWcc-001Iwb-02;
	Wed, 27 Sep 2023 15:38:42 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qlWaR-001GW0-0N;
	Wed, 27 Sep 2023 15:36:27 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=KnK9e8ZFi3pebVdrAjDVtxSA0qCAi/hA6TDylmv0g/A=; b=oaN7hUAbj3o2eEqeNZNDsuBGf7
	cd5Nyk91NZKm61x3aIU3oxLLzHXpsFcjG0PFmQW8URGwVXd6ZhNwUOhROquLZ1gO8F+vocwdHmtzG
	EKbY7CKxxgT4NFx4eH2nhP6Wy04/SQBAO2A7FH3kOoyUlZq0wK2lR3mqzH23x0XTUjS/SF4b2P1Q7
	LX1fMxvbpgPP7yQwvzW7jZZRkCco2HZ9A3GCDpC9KW2sp3E/mPCAq8T9lqKSaVJ/k8UG1OUXHV1vr
	y5ZULCSwq2jnA3gICMX24Gr/2okYVME5TVeXnFwVTVvPtVaHXzCaUvsywxjuM26rRzI6mZdd+mdKX
	4FZ7sIvg==;
Received: from madras.collabora.co.uk ([2a00:1098:0:82:1000:25:2eeb:e5ab])
	by desiato.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qlWaM-00403T-1S;
	Wed, 27 Sep 2023 15:36:25 +0000
Received: from benjamin-XPS-13-9310.. (unknown [IPv6:2a01:e0a:120:3210:672:46bd:3ec7:6cdf])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: benjamin.gaignard)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id 79ECC6607356;
	Wed, 27 Sep 2023 16:36:22 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1695828982;
	bh=vej0xyoaRLN25qHgld1P1pTyfPCEtxO7zlLcrG23sig=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=eGQ39OwLaIm9EJms2W8ErEii3GkWljsCnHEI5DOInTuSCVf37BQsFawnqiYxkLuD0
	 PU9VunYfXQ1Ra1dxXITVZcUD53mr9h4Kb8l2Z50RoMR80+dOIf4NbX9qJt7O7adIzR
	 VBKpDfqECg3c9e0YXI1HKek2UvZUi8ViQrBV0EV8BNzREKuNH+sMr3IhDOhNH2Sn9I
	 rGDe6RazYfMlKoI3G3a2y48mCp1JRE8O7lgHj7ujX7bgoy7ArwZewBhXuLaAX3tvK6
	 XbVrJsyj8+QBRt7NC38VLiABVyFlQCtMyXZnx8M4ZTLTBFNMeTHFN7YlNhGF+rjDfU
	 HpAhO1s5igRmw==
From: Benjamin Gaignard <benjamin.gaignard@collabora.com>
To: mchehab@kernel.org,
	tfiga@chromium.org,
	m.szyprowski@samsung.com,
	ming.qian@nxp.com,
	ezequiel@vanguardiasur.com.ar,
	p.zabel@pengutronix.de,
	gregkh@linuxfoundation.org,
	hverkuil-cisco@xs4all.nl,
	nicolas.dufresne@collabora.com
Cc: linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	linux-arm-msm@vger.kernel.org,
	linux-rockchip@lists.infradead.org,
	linux-staging@lists.linux.dev,
	kernel@collabora.com,
	Benjamin Gaignard <benjamin.gaignard@collabora.com>
Subject: [PATCH v8 31/53] media: coda: Stop direct calls to queue num_buffers field
Date: Wed, 27 Sep 2023 17:35:36 +0200
Message-Id: <20230927153558.159278-32-benjamin.gaignard@collabora.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230927153558.159278-1-benjamin.gaignard@collabora.com>
References: <20230927153558.159278-1-benjamin.gaignard@collabora.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230927_163624_163084_0C8EF947 
X-CRM114-Status: UNSURE (   9.76  )
X-CRM114-Notice: Please train this message.
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

Use vb2_get_num_buffers() to avoid using queue num_buffer field directly.

Signed-off-by: Benjamin Gaignard <benjamin.gaignard@collabora.com>
---
 drivers/media/platform/chips-media/coda-common.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/media/platform/chips-media/coda-common.c b/drivers/media/platform/chips-media/coda-common.c
index cc4892129aaf..f1d85758f6dd 100644
--- a/drivers/media/platform/chips-media/coda-common.c
+++ b/drivers/media/platform/chips-media/coda-common.c
@@ -794,7 +794,7 @@ static int coda_s_fmt(struct coda_ctx *ctx, struct v4l2_format *f,
 
 	if (vb2_is_busy(vq)) {
 		v4l2_err(&ctx->dev->v4l2_dev, "%s: %s queue busy: %d\n",
-			 __func__, v4l2_type_names[f->type], vq->num_buffers);
+			 __func__, v4l2_type_names[f->type], vb2_get_num_buffers(vq));
 		return -EBUSY;
 	}
 
-- 
2.39.2


