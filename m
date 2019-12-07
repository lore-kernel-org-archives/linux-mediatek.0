Return-Path: <SRS0=LwTv=Z5=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 16EFEC43603
	for <linux-mediatek@archiver.kernel.org>; Sat,  7 Dec 2019 22:50:08 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B8E52206DF
	for <linux-mediatek@archiver.kernel.org>; Sat,  7 Dec 2019 22:50:07 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="QhXekIsa";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="CvYvGt3z"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org B8E52206DF
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=jHq8nNbEK03MmO8V/ci8lEXVqn6tcQFrg0J8UPMSjWI=; b=QhXekIsa4lS+jV
	gditNHoKQANEh7W3LXMXV9AcZAOllu7ZS22GP+yc0rbRO+IoBPIWmyMm2K4lUZ1ICDh8MNnYeeTWC
	k6U59T8wJwgWl4bR4zLYj7ymg4Dr2fb3wKlx7ZAk4OuGQPv/ZsPvWHkiSn/WfX5PRm8/02J7DyBCW
	uL9UHmbx6gtbNeirMQ+Ea8w5BQZjqlmUCkvqz1B4b598jVpCBuFXwLuryMV5qGlSs1M0vzexrSEpL
	X9IwlB1DYuae8ZRYK48jQME8XFKgaKGCgDfAL6BZW3/mf0yaUmNQlM9Qp/B921cJoa7sUmGrOmko8
	i9BJ8rxQheHkj2RdXSXQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1iditd-0004q4-UQ; Sat, 07 Dec 2019 22:49:53 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1idisH-0003OG-A1; Sat, 07 Dec 2019 22:48:32 +0000
Received: from ziggy.de (unknown [95.169.229.25])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 5E2592467E;
 Sat,  7 Dec 2019 22:48:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1575758908;
 bh=T3/4wZPL9p7tEA69OL6cyT7PPtrc6Pr84n3ts0k0Pfo=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=CvYvGt3z/Sy+gpaY9YyraZYD2q3rsfkCdtc4BVBxEbD6975AhN+QnXfUMQt0i+ojx
 6S+x+4EoWlezGIT7geS9GrUahPX+e0uBpCR9m/QgZCWIXB3Vmkt62Qxx+uXBzb+e/8
 QBS35ZBCJ92daP1WH0ClM8d06l6/4I25cUotuXCE=
From: matthias.bgg@kernel.org
To: robh+dt@kernel.org, mark.rutland@arm.com, ck.hu@mediatek.com,
 p.zabel@pengutronix.de, airlied@linux.ie, mturquette@baylibre.com,
 sboyd@kernel.org, ulrich.hecht+renesas@gmail.com,
 laurent.pinchart@ideasonboard.com, enric.balletbo@collabora.com
Subject: [resend PATCH v6 05/12] media: mtk-mdp: Check return value of
 of_clk_get
Date: Sat,  7 Dec 2019 23:47:33 +0100
Message-Id: <20191207224740.24536-6-matthias.bgg@kernel.org>
X-Mailer: git-send-email 2.24.0
In-Reply-To: <20191207224740.24536-1-matthias.bgg@kernel.org>
References: <20191207224740.24536-1-matthias.bgg@kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20191207_144829_459566_E5C60909 
X-CRM114-Status: UNSURE (   9.28  )
X-CRM114-Notice: Please train this message.
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
Cc: matthias.bgg@kernel.org, devicetree@vger.kernel.org, rdunlap@infradead.org,
 frank-w@public-files.de, sean.wang@mediatek.com, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, sean.wang@kernel.org, wens@csie.org,
 drinkcat@chromium.org, linux-mediatek@lists.infradead.org, mbrugger@suse.com,
 hsinyi@chromium.org, linux-clk@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-media@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

From: Matthias Brugger <mbrugger@suse.com>

Check the return value of of_clk_get and print an error
message if not EPROBE_DEFER.

Signed-off-by: Matthias Brugger <mbrugger@suse.com>
---
 drivers/media/platform/mtk-mdp/mtk_mdp_comp.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/drivers/media/platform/mtk-mdp/mtk_mdp_comp.c b/drivers/media/platform/mtk-mdp/mtk_mdp_comp.c
index 9afe8161a8c0..4e2fc1337b80 100644
--- a/drivers/media/platform/mtk-mdp/mtk_mdp_comp.c
+++ b/drivers/media/platform/mtk-mdp/mtk_mdp_comp.c
@@ -110,6 +110,12 @@ int mtk_mdp_comp_init(struct device *dev, struct device_node *node,
 
 	for (i = 0; i < ARRAY_SIZE(comp->clk); i++) {
 		comp->clk[i] = of_clk_get(node, i);
+		if (IS_ERR(comp->clk[i])i) {
+			if (PTR_ERR(comp->clk[i] != -EPROBE_DEFER)
+					dev_err(dev, "Failed to get clock\n");
+
+			return PTR_ERR(comp->clk[i]);
+		}
 
 		/* Only RDMA needs two clocks */
 		if (comp->type != MTK_MDP_RDMA)
-- 
2.24.0


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
