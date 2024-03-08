Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 76A18C54E41
	for <linux-mediatek@archiver.kernel.org>; Fri,  8 Mar 2024 20:30:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:Message-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=yIHasFc6QDJakomTVw0AEw51lF0LsJnl5XPBrfNl5nQ=; b=Y7r9lKRao9xVG8sXS7bt13IPn2
	K6Ypfm66nNuNJws72uPbTUdvApQFQBA7KiueFod3AbPi56nmXEIDZRhpNJTqgCJZIegrBMlm3EGnG
	9yJ+KbEdLtJF66nAV+qOIyROL+eEM7KWO5EkT6nzyYjDUA3dvNDe42fjQUGB1djFbi1ISo9iC6E13
	N1D1V9ji84fOG4I8xYOqN5S4e+Rqh17vuaBGc5BDl8+ozZyajO5UQVaxbRInEYN/pVdZGXfjLvsXN
	w8zcTCeSpIHxy/Uql6tpxQyzg2tGQ7ootk/6wAmpVIe2SP2DpuHKwX3qFND8JaCF7m4SVA00X8tlJ
	es2aXcCQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rigrB-0000000BE55-3LN8;
	Fri, 08 Mar 2024 20:30:17 +0000
Received: from madrid.collaboradmins.com ([46.235.227.194])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rigr8-0000000BE4C-05Zd;
	Fri, 08 Mar 2024 20:30:16 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1709929809;
	bh=/adHs8UdVF6eIv76YbhCdGPFqVNfYolXsQeI4oZE9uw=;
	h=From:Date:Subject:To:Cc:From;
	b=RQQeO/Wkn6o2TdtidpJsJiobZy7eLnnr6sKKmHgzHO0Zb0Y+A4plHRqg1EgRL3PFj
	 1ekGdr53uZC0Lhxg5V9x+62b0f/NLHyZJ8MPseS6h5zrlcfTMzHha3PF03vly4T9zG
	 qfEEjmwO+SEZJSFdkrH4kiC4qy+dOSmZ5WHZRAHKe1DKAqnwvPHrS9s/KcdjDMK5wS
	 4vcohAKqFfITslM8mP63r8EbsN74W8TiDR348XfO2R8mBGH2ABeB/WDtcIzLTHMAqB
	 F4owS2OSZB8I0Nq4d3MMZ/w47OVX+HAZfIxs0WnVnncMPpw5o1HDUiAVz87CWA5IJU
	 WfT1iTxJzUSjw==
Received: from [192.168.1.26] (zone.collabora.co.uk [167.235.23.81])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: nfraprado)
	by madrid.collaboradmins.com (Postfix) with ESMTPSA id 9A09237820F2;
	Fri,  8 Mar 2024 20:30:07 +0000 (UTC)
From: =?utf-8?q?N=C3=ADcolas_F=2E_R=2E_A=2E_Prado?= <nfraprado@collabora.com>
Date: Fri, 08 Mar 2024 15:29:56 -0500
Subject: [PATCH] clk: mediatek: pllfh: Don't log error for missing fhctl
 node
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20240308-mtk-fhctl-no-node-error-v1-1-51e446eb149a@collabora.com>
X-B4-Tracking: v=1; b=H4sIAEN162UC/x2MSQqAMAwAvyI5G6gLVP2KeNA21aC2kooI4t8tw
 lzmMPNAJGGK0GUPCF0cOfgkRZ6BWUY/E7JNDqUqa1WpBvdzRbeYc0MfEpaQRIKgVa7Rk65bqw2
 k+hByfP/nfnjfD2fV3KxpAAAA
To: Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Johnson Wang <johnson.wang@mediatek.com>, 
 Edward-JW Yang <edward-jw.yang@mediatek.com>, 
 Chen-Yu Tsai <wenst@chromium.org>
Cc: kernel@collabora.com, linux-clk@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-mediatek@lists.infradead.org, 
 =?utf-8?q?N=C3=ADcolas_F=2E_R=2E_A=2E_Prado?= <nfraprado@collabora.com>
X-Mailer: b4 0.13.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240308_123014_329091_98D58815 
X-CRM114-Status: GOOD (  12.93  )
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

Support for fhctl clocks in apmixedsys was introduced at a later point
and to this moment only one mt6795 based platform has a fhctl DT node
present. Therefore the fhctl support in apmixedsys should be seen as
optional and not cause an error when it is missing.

Change the message's log level to warning. The warning level is chosen
so that it will still alert the fact that fhctl support might be
unintentionally missing, but without implying that this is necessarily
an issue.

Even if the FHCTL DT nodes are added to all current platforms moving
forward, since those changes won't be backported, this ensures stable
kernel releases won't have live with this error.

Fixes: d7964de8a8ea ("clk: mediatek: Add new clock driver to handle FHCTL hardware")
Signed-off-by: Nícolas F. R. A. Prado <nfraprado@collabora.com>
---
 drivers/clk/mediatek/clk-pllfh.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/clk/mediatek/clk-pllfh.c b/drivers/clk/mediatek/clk-pllfh.c
index 3a2b3f90be25..094ec8a26d66 100644
--- a/drivers/clk/mediatek/clk-pllfh.c
+++ b/drivers/clk/mediatek/clk-pllfh.c
@@ -68,7 +68,7 @@ void fhctl_parse_dt(const u8 *compatible_node, struct mtk_pllfh_data *pllfhs,
 
 	node = of_find_compatible_node(NULL, NULL, compatible_node);
 	if (!node) {
-		pr_err("cannot find \"%s\"\n", compatible_node);
+		pr_warn("cannot find \"%s\"\n", compatible_node);
 		return;
 	}
 

---
base-commit: 11afac187274a6177a7ac82997f8691c0f469e41
change-id: 20240308-mtk-fhctl-no-node-error-d0f87b749d7c

Best regards,
-- 
Nícolas F. R. A. Prado <nfraprado@collabora.com>


