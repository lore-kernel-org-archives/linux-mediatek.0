Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3B9CDC00140
	for <linux-mediatek@archiver.kernel.org>; Fri, 12 Aug 2022 20:58:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=Li+ctB3aTvV7FkU9wN8f9wAxHxz6GEd1cuSoX1uT5/I=; b=rPK9tc0GrBYlZylgRFvcXMhE6E
	EamzDtjmpA4e4LM0/+fsAK92XPK1FVjYbWgNzQsiZKO0X7z7P7hE68eIHQjeQtKITqg9gS4O5eTfj
	XAyPnD/GSJhAGzEgQrUgO6Eh+9pb9iyIFpLdyh3S7aIIvXWsvAOEHOFYnzkH5/eP2ukJb+qzsqJ08
	EqYwZUiFX9O5DKiO89GhFF49H9MRlqPjA7I9yvXfpCk4C2UGWXs7RMs8eg9ah7AfqHhvAKhxnTp4F
	YYN+v7L+yTXvy7ukPmxFPrScp1YJ4mJK0xvBVTaFaDBUFiOYg3tVgbfsVFrDg4Fzc+N43HzsHmq2X
	2W5tDSmg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oMbjf-00DIAX-Ki; Fri, 12 Aug 2022 20:58:27 +0000
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oMbje-00DIA1-Fe
	for linux-mediatek@bombadil.infradead.org; Fri, 12 Aug 2022 20:58:26 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:Content-Type:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-ID:
	Content-Description:In-Reply-To:References;
	bh=Li+ctB3aTvV7FkU9wN8f9wAxHxz6GEd1cuSoX1uT5/I=; b=W8dWoZia9Jk+xeAzQqtDo6pjTH
	XEfS9zMMPfJZiTxCYwsZKj9WEzKXnscd7rV9fqLWGxNKA/T2XWjpySvveHl63KXm4i0NAG8/0JcsA
	BOylr55jloc4J7FHQSRZRhjqyibAVc6AcVyLDk4x5hHbwgcZ9p/fxldGOeFLwcL3hxO31k6+5IIOE
	WnUkBd9lEo0nhaFx6fB4TU9McYDaECJr5qxsPh/tOEdTnAZhz9NVFGnz5fc/07Dy8evCAchKHd9Kl
	WNNNSaxXNHOJ8Fk5xH69HxEwdmtdL19jFTzbxDFo6g8Bsdt0zeNFqq60CMcrFcFvP7rvxAFB8XkLY
	Ru5C4MWw==;
Received: from mx1.riseup.net ([198.252.153.129])
	by casper.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oMbja-002eZe-5t
	for linux-mediatek@lists.infradead.org; Fri, 12 Aug 2022 20:58:24 +0000
Received: from fews1.riseup.net (fews1-pn.riseup.net [10.0.1.83])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256
	 client-signature RSA-PSS (2048 bits) client-digest SHA256)
	(Client CN "mail.riseup.net", Issuer "R3" (not verified))
	by mx1.riseup.net (Postfix) with ESMTPS id 4M4GGl43pczDqPf;
	Fri, 12 Aug 2022 20:58:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=riseup.net; s=squak;
	t=1660337888; bh=lqIb/39ravYbx7WCjgTnGhey78nkmC1/ONugMtjoV2A=;
	h=From:To:Cc:Subject:Date:From;
	b=JH4Vzc7nuj19eou1mabDepZQSeG0TMLH1J7AJvQ9WK9ubuLFgJx7dXAFUtChxqA87
	 OhkdOl2vXRFefEhXbtd4rWoBtl0zzriPCouKxRw2ch0Exo5C3F2oxXiHWuW86VAe5Y
	 +kSqCZCDHfa6yElyc1vy8p/wUxos/QvMsrAF/iQc=
X-Riseup-User-ID: B98CDF838B390E4E878A3EA4F8DA48AF89E37DB8D26B1A3DCA91AE6A05788F60
Received: from [127.0.0.1] (localhost [127.0.0.1])
	 by fews1.riseup.net (Postfix) with ESMTPSA id 4M4GGb0B9hz5vTk;
	Fri, 12 Aug 2022 20:57:58 +0000 (UTC)
From: =?UTF-8?q?Ma=C3=ADra=20Canal?= <mairacanal@riseup.net>
To: David Airlie <airlied@linux.ie>,
	Daniel Vetter <daniel@ffwll.ch>,
	Maxime Ripard <maxime@cerno.tech>
Cc: dri-devel@lists.freedesktop.org,
	linux-kernel@vger.kernel.org,
	=?UTF-8?q?Ma=C3=ADra=20Canal?= <mairacanal@riseup.net>,
	Andrzej Hajda <andrzej.hajda@intel.com>,
	Neil Armstrong <narmstrong@baylibre.com>,
	Robert Foss <robert.foss@linaro.org>,
	Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
	Jonas Karlman <jonas@kwiboo.se>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Chun-Kuang Hu <chunkuang.hu@kernel.org>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	Rob Clark <robdclark@gmail.com>,
	Abhinav Kumar <quic_abhinavk@quicinc.com>,
	Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
	Sean Paul <sean@poorly.run>,
	Alain Volmat <alain.volmat@foss.st.com>,
	Emma Anholt <emma@anholt.net>,
	Maxime Ripard <mripard@kernel.org>,
	linux-mediatek@lists.infradead.org
Subject: [PATCH 0/5] Drop of_gpio header
Date: Fri, 12 Aug 2022 17:57:41 -0300
Message-Id: <20220812205746.609107-1-mairacanal@riseup.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220812_215822_501584_84330528 
X-CRM114-Status: UNSURE (   7.17  )
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

The legacy GPIO header <linux/gpio.h> and the deprecated OF GPIO header
<linux/of_gpio.h> should not be used anymore due to the existance of the
new GPIO header <linux/gpio/consumer.h>. Currently, the DRM still holds
seven OF GPIO header includes. That said, this series drops all the
OF GPIO header includes from the DRM, replacing it, when proper, with
the OF header.

Best Regards,
- Maíra Canal

Cc: Andrzej Hajda <andrzej.hajda@intel.com>
Cc: Neil Armstrong <narmstrong@baylibre.com>
Cc: Robert Foss <robert.foss@linaro.org>
Cc: Laurent Pinchart <Laurent.pinchart@ideasonboard.com>
Cc: Jonas Karlman <jonas@kwiboo.se>
Cc: Jernej Skrabec <jernej.skrabec@gmail.com>
Cc: Chun-Kuang Hu <chunkuang.hu@kernel.org>
Cc: Philipp Zabel <p.zabel@pengutronix.de>
Cc: Matthias Brugger <matthias.bgg@gmail.com>
Cc: Rob Clark <robdclark@gmail.com>
Cc: Abhinav Kumar <quic_abhinavk@quicinc.com>
Cc: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc: Sean Paul <sean@poorly.run>
Cc: Alain Volmat <alain.volmat@foss.st.com>
Cc: Emma Anholt <emma@anholt.net>
Cc: Maxime Ripard <mripard@kernel.org>
Cc: linux-mediatek@lists.infradead.org

Maíra Canal (5):
  drm/bridge: anx7625: Drop of_gpio header
  drm/mediatek: Drop of_gpio header
  drm/msm: Drop of_gpio header
  drm/sti: Drop of_gpio header
  drm/vc4: Drop of_gpio header

 drivers/gpu/drm/bridge/analogix/anx7625.c | 1 -
 drivers/gpu/drm/mediatek/mtk_dpi.c        | 1 -
 drivers/gpu/drm/mediatek/mtk_hdmi.c       | 1 -
 drivers/gpu/drm/msm/dp/dp_parser.c        | 2 +-
 drivers/gpu/drm/msm/hdmi/hdmi.c           | 1 -
 drivers/gpu/drm/sti/sti_dvo.c             | 2 +-
 drivers/gpu/drm/vc4/vc4_hdmi.c            | 1 -
 7 files changed, 2 insertions(+), 7 deletions(-)

-- 
2.37.1


