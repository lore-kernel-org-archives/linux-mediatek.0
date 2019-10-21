Return-Path: <SRS0=JbG7=YO=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0BCB8CA9EAF
	for <linux-mediatek@archiver.kernel.org>; Mon, 21 Oct 2019 21:46:34 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C320E20659
	for <linux-mediatek@archiver.kernel.org>; Mon, 21 Oct 2019 21:46:33 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="kyi/PjOE"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org C320E20659
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=KhEaf+hNmDRzNjz/QN+w3WNk5iVrS1hjh93ZfpG/vRI=; b=kyi/PjOEpyjjPJ
	7IXqdyTmNqDTGCcLbSZOx17lUlJ7Y9wC0htkDDffqE+gx5cby5htroy3UfxKaKdIjINvT5QKjitiG
	fsuoF3UDTh9njmawBKUDoX/+PGdCAPNW1KiyGUwVeEgRqN3oweoqWhk4XnAPwz1DSfOfdAsTotw9x
	th5SSMNpDj0QA5iCBYlIHVq9GLEl2iDnjrtd5RtkctZJ44GZd4NLIGLqBsWNzZ0eGncvuJIafFVrr
	DOs8tef2iHUP8WWCpi+51KP8H/esrlGts/WNMn4t9S1m2oGUW4rsFdLhf1diqy2/i5AZq/pXtoILg
	Rvr1ieyuvSoZdnU13RNA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1iMfVY-0000lA-1N; Mon, 21 Oct 2019 21:46:32 +0000
Received: from mail-oi1-f196.google.com ([209.85.167.196])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1iMfUy-0000CL-Bq; Mon, 21 Oct 2019 21:45:57 +0000
Received: by mail-oi1-f196.google.com with SMTP id k20so12416870oih.3;
 Mon, 21 Oct 2019 14:45:56 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=nG1jrqiVrLvARMweYNsyPG+j+EFZbDQxRJlgrVpfL4I=;
 b=VtycW8IzP8a16ec088v9Wa5wOzPnIqXpPHvZq1QwM6EuCXm10+KxTth0leun8lQPM8
 KLWjGN3HqMoUJAJh+toSfEx6XwQ0hXN92YJplM4PCJke62yFBUEOkNKAEIdORImon/+/
 QMcq1AXsIRJrorpQIBWza0/E3mv8RqgP+bV/Pjl2C/PWNcwrNK0TTgd1w0hgTcaFZFD8
 M4nhXTPGNgbwc0P9iPpldP4+Ipm5TBjOSky2F95PIZ+FbmpqeVWtSOyS5jZXB7A38Chk
 rxV82myZFOEjVnJgrqn0+Z4uZOytABHE9zZChpIHp9JF8YQuyRWAZQTCsVpGssAyOS5V
 LHOw==
X-Gm-Message-State: APjAAAW/rpJR5O7X7moJ4nzpzPrD40lDAObYtZFvS/sX/qndJsKttOO0
 IGrF3Si9IoemnQyQgpli8A==
X-Google-Smtp-Source: APXvYqz194LkjFFcxBO2leMnWf7q2qSETO24ZDGsm0zsCS7yjuJ9BThF7g7KveiT7DMyfLh8WcF/xA==
X-Received: by 2002:aca:40b:: with SMTP id 11mr191900oie.59.1571694355381;
 Mon, 21 Oct 2019 14:45:55 -0700 (PDT)
Received: from xps15.herring.priv (24-155-109-49.dyn.grandenetworks.net.
 [24.155.109.49])
 by smtp.googlemail.com with ESMTPSA id u130sm4122676oib.56.2019.10.21.14.45.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 21 Oct 2019 14:45:54 -0700 (PDT)
From: Rob Herring <robh@kernel.org>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH 1/6] drm/kirin: Use DRM_GEM_CMA_VMAP_DRIVER_OPS
Date: Mon, 21 Oct 2019 16:45:45 -0500
Message-Id: <20191021214550.1461-2-robh@kernel.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20191021214550.1461-1-robh@kernel.org>
References: <20191021214550.1461-1-robh@kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20191021_144556_401901_241DAF68 
X-CRM114-Status: GOOD (  11.45  )
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
Cc: =?UTF-8?q?Heiko=20St=C3=BCbner?= <heiko@sntech.de>,
 Neil Armstrong <narmstrong@baylibre.com>, David Airlie <airlied@linux.ie>,
 Liviu Dudau <liviu.dudau@arm.com>, Sandy Huang <hjc@rock-chips.com>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Benjamin Gaignard <benjamin.gaignard@linaro.org>,
 Yannick Fertre <yannick.fertre@st.com>, Kevin Hilman <khilman@baylibre.com>,
 Xinwei Kong <kong.kongxinwei@hisilicon.com>,
 Xinliang Liu <z.liuxinliang@hisilicon.com>, linux-rockchip@lists.infradead.org,
 Chen-Yu Tsai <wens@csie.org>,
 =?UTF-8?q?Noralf=20Tr=C3=B8nnes?= <noralf@tronnes.org>,
 "James \(Qian\) Wang" <james.qian.wang@arm.com>, CK Hu <ck.hu@mediatek.com>,
 Philipp Zabel <p.zabel@pengutronix.de>,
 Alexandre Torgue <alexandre.torgue@st.com>,
 Chen Feng <puck.chen@hisilicon.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, linux-mediatek@lists.infradead.org,
 Matthias Brugger <matthias.bgg@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Sean Paul <sean@poorly.run>, linux-arm-kernel@lists.infradead.org,
 Philippe Cornu <philippe.cornu@st.com>, Vincent Abriou <vincent.abriou@st.com>,
 Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Rongrong Zou <zourongrong@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

drm_gem_cma_dumb_create_internal() is not supposed to be used for
.dumb_create directly. drm_gem_cma_dumb_create() should be used instead.
If we do that, we might as well convert over to using
DRM_GEM_CMA_VMAP_DRIVER_OPS instead.

Cc: Xinliang Liu <z.liuxinliang@hisilicon.com>
Cc: Rongrong Zou <zourongrong@gmail.com>
Cc: Xinwei Kong <kong.kongxinwei@hisilicon.com>
Cc: Chen Feng <puck.chen@hisilicon.com>
Cc: David Airlie <airlied@linux.ie>
Cc: Daniel Vetter <daniel@ffwll.ch>
Signed-off-by: Rob Herring <robh@kernel.org>
---
 drivers/gpu/drm/hisilicon/kirin/kirin_drm_ade.c | 11 +----------
 1 file changed, 1 insertion(+), 10 deletions(-)

diff --git a/drivers/gpu/drm/hisilicon/kirin/kirin_drm_ade.c b/drivers/gpu/drm/hisilicon/kirin/kirin_drm_ade.c
index 73cd28a6ea07..490537a1d035 100644
--- a/drivers/gpu/drm/hisilicon/kirin/kirin_drm_ade.c
+++ b/drivers/gpu/drm/hisilicon/kirin/kirin_drm_ade.c
@@ -941,16 +941,7 @@ DEFINE_DRM_GEM_CMA_FOPS(ade_fops);
 static struct drm_driver ade_driver = {
 	.driver_features = DRIVER_GEM | DRIVER_MODESET | DRIVER_ATOMIC,
 	.fops = &ade_fops,
-	.gem_free_object_unlocked = drm_gem_cma_free_object,
-	.gem_vm_ops = &drm_gem_cma_vm_ops,
-	.dumb_create = drm_gem_cma_dumb_create_internal,
-	.prime_handle_to_fd	= drm_gem_prime_handle_to_fd,
-	.prime_fd_to_handle	= drm_gem_prime_fd_to_handle,
-	.gem_prime_get_sg_table = drm_gem_cma_prime_get_sg_table,
-	.gem_prime_import_sg_table = drm_gem_cma_prime_import_sg_table,
-	.gem_prime_vmap = drm_gem_cma_prime_vmap,
-	.gem_prime_vunmap = drm_gem_cma_prime_vunmap,
-	.gem_prime_mmap = drm_gem_cma_prime_mmap,
+	DRM_GEM_CMA_VMAP_DRIVER_OPS,
 
 	.name = "kirin",
 	.desc = "Hisilicon Kirin620 SoC DRM Driver",
-- 
2.20.1


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
