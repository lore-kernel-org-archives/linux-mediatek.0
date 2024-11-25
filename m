Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 42F7CD59D72
	for <linux-mediatek@archiver.kernel.org>; Mon, 25 Nov 2024 21:25:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=T2m73Pnc/emE9RlC0ZhL+pX8gujYDDoxC4y19+hDz7Y=; b=jaLYePv6mMUTN5BDm4e8G/fKXX
	+mEtbpWYETaU3bE+TTuMEnALXsPFlwt7Z/Wfk1X5fnGY1QXcjapsDO4q6RYK4yfkacW/DrydEa+P4
	yadqWOoFY6X9O49Wn6QqgBEaBXF92HVD68cYApke8fuVHLxX0SlA8sOp7dm0Ovk17EcMWDBH3c+JX
	Q6hpedOBUax2dyS2rcnb2fV6EEzECNNPJq+qJUZYr+y6TVnxGurucyslvxfh1+x2rE0kkT4g6NuxZ
	nebuuACzRuoInf9sc293qFvAU45moSWYQl8c26I81OrN6VZICVk5+/FvAXYDDULQNlEUukv3gGekQ
	ifl7wVTg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tFgak-0000000986c-1sPu;
	Mon, 25 Nov 2024 21:25:58 +0000
Received: from bali.collaboradmins.com ([2a01:4f8:201:9162::2])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tFgW3-000000097Ip-387N;
	Mon, 25 Nov 2024 21:21:09 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1732569666;
	bh=sQrVPAx8ofXaIPbdduARL5wDhf7h7Z3abU3Xpaq7VqI=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=LfjxZWA1XzodK+vcZt2ELobIJnoZ0J30waBzEjB+mOBv+F+LVvmIhb+mCO/Uk4inI
	 MPkH9OT6035EUWgqmfi5P+tM3fsZLfG0Kyz/7XQ16ZuK3pXBUuQugXhWdBUjoEPNdd
	 yDj8vs8u1B8zx6R+jEJEuLf9LcXTN3T0MoPQyIB/wPqob2lKKY4cvLjz5KvhRHGUH6
	 iC7srjYzegZGXgosXISUw85LJNgHjaAYPf9n12y+fA8O/rmqh6ImamtBo8CtRztFGq
	 ZmcAxvykDgC9I5ia9uPpVO3HFQgCzdhE3Tpl1iQ+ju6pMyPVwWftDfy19lgVFsqAPx
	 y9pi5KwnK6DZw==
Received: from [192.168.1.63] (pool-100-2-116-133.nycmny.fios.verizon.net [100.2.116.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: nfraprado)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 8AA0917E37D2;
	Mon, 25 Nov 2024 22:21:04 +0100 (CET)
From: =?utf-8?q?N=C3=ADcolas_F=2E_R=2E_A=2E_Prado?= <nfraprado@collabora.com>
Date: Mon, 25 Nov 2024 16:20:31 -0500
Subject: [PATCH 4/5] thermal/drivers/mediatek/lvts: Start sensor interrupts
 disabled
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20241125-mt8192-lvts-filtered-suspend-fix-v1-4-42e3c0528c6c@collabora.com>
References: <20241125-mt8192-lvts-filtered-suspend-fix-v1-0-42e3c0528c6c@collabora.com>
In-Reply-To: <20241125-mt8192-lvts-filtered-suspend-fix-v1-0-42e3c0528c6c@collabora.com>
To: "Rafael J. Wysocki" <rafael@kernel.org>, 
 Daniel Lezcano <daniel.lezcano@linaro.org>, Zhang Rui <rui.zhang@intel.com>, 
 Lukasz Luba <lukasz.luba@arm.com>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Alexandre Mergnat <amergnat@baylibre.com>, 
 Balsam CHIHI <bchihi@baylibre.com>
Cc: kernel@collabora.com, linux-pm@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-mediatek@lists.infradead.org, Hsin-Te Yuan <yuanhsinte@chromium.org>, 
 Chen-Yu Tsai <wenst@chromium.org>, 
 =?utf-8?q?Bernhard_Rosenkr=C3=A4nzer?= <bero@baylibre.com>, 
 "Rafael J. Wysocki" <rafael.j.wysocki@intel.com>, 
 =?utf-8?q?N=C3=ADcolas_F=2E_R=2E_A=2E_Prado?= <nfraprado@collabora.com>
X-Mailer: b4 0.14.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241125_132107_926894_7B6233A5 
X-CRM114-Status: GOOD (  10.52  )
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

Interrupts are enabled per sensor in lvts_update_irq_mask() as needed,
there's no point in enabling all of them during initialization. Change
the MONINT register initial value so all sensor interrupts start
disabled.

Signed-off-by: Nícolas F. R. A. Prado <nfraprado@collabora.com>
---
 drivers/thermal/mediatek/lvts_thermal.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/thermal/mediatek/lvts_thermal.c b/drivers/thermal/mediatek/lvts_thermal.c
index 2271023f090df82fbdd0b5755bb34879e58b0533..90f305fa6fb659ae9e3db0faf1a406ef1500adf2 100644
--- a/drivers/thermal/mediatek/lvts_thermal.c
+++ b/drivers/thermal/mediatek/lvts_thermal.c
@@ -65,7 +65,6 @@
 #define LVTS_HW_FILTER				0x0
 #define LVTS_TSSEL_CONF				0x13121110
 #define LVTS_CALSCALE_CONF			0x300
-#define LVTS_MONINT_CONF			0x0300318C
 
 #define LVTS_MONINT_OFFSET_HIGH_SENSOR0		BIT(3)
 #define LVTS_MONINT_OFFSET_HIGH_SENSOR1		BIT(8)
@@ -951,7 +950,7 @@ static int lvts_irq_init(struct lvts_ctrl *lvts_ctrl)
 	 * The LVTS_MONINT register layout is the same as the LVTS_MONINTSTS
 	 * register, except we set the bits to enable the interrupt.
 	 */
-	writel(LVTS_MONINT_CONF, LVTS_MONINT(lvts_ctrl->base));
+	writel(0, LVTS_MONINT(lvts_ctrl->base));
 
 	return 0;
 }

-- 
2.47.0


