Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D5FD4C83F17
	for <linux-mediatek@archiver.kernel.org>; Thu, 10 Jul 2025 18:28:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:In-Reply-To:References:Message-Id:MIME-Version:Subject:
	Date:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=X6cvCt1VBmJTFRCGYPDZTJ8fBnxpBorEBWf40KWv3BU=; b=tEN5xm7adlSUNc5QtbTlCuawaE
	gOVTLHNye0x1I3aX5yVV0vRpuIeNX1QAvbH6BaO0KMqFrlFDBTo2DZxG5EsCylS5Mu9kO/4ATKzJx
	ELTG0p9YkzoMCT+ZPcvreALCghc6A+b0KKhxbcTiKN2xtjjdJoVCUk9L5q1j4goIkM26unYubkEFr
	7wnkm5qgGDHDS3T00AF0IAlsnphvBrjaR5UsMhLtjqaPdqLWWJ0+lw66/2ZO6AYFrfNswG589ithP
	PYqD3FQzl0oZVDJpNmvtWShubTs4CGsnEJKWS2hcrcHmdAyfe5ELBy890q1AgUOJEB3PV5SCK+n5x
	lbT1/uhA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uZw0g-0000000Chvs-3tN4;
	Thu, 10 Jul 2025 18:28:42 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uZtp4-0000000CMQ8-3J6f
	for linux-mediatek@lists.infradead.org;
	Thu, 10 Jul 2025 16:08:36 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1752163712;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=X6cvCt1VBmJTFRCGYPDZTJ8fBnxpBorEBWf40KWv3BU=;
	b=EK0AOZ+/9lqKil46DCLOATQWhYjTu01JtDo9iw2EsMZLe/hX5nk3pBL+cvJUQTx0SFFBDt
	sVh1c81omfsv75m/TEsFUAKV46tM5eRaJy/t/B1tVV3mgdoeZA7nbMDIVawLhRVL/ROWzk
	/siuo3rSt3GEDyhl6S+4biPkiEpI934=
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com
 [209.85.219.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-349-V4gC2g4sPcm-wAATyuaPIQ-1; Thu, 10 Jul 2025 12:08:30 -0400
X-MC-Unique: V4gC2g4sPcm-wAATyuaPIQ-1
X-Mimecast-MFC-AGG-ID: V4gC2g4sPcm-wAATyuaPIQ_1752163709
Received: by mail-qv1-f69.google.com with SMTP id 6a1803df08f44-6fabd295d12so20463836d6.1
        for <linux-mediatek@lists.infradead.org>; Thu, 10 Jul 2025 09:08:29 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752163709; x=1752768509;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=X6cvCt1VBmJTFRCGYPDZTJ8fBnxpBorEBWf40KWv3BU=;
        b=mhpgYYQ1MRCvcenF+9FgLT5aAraqMjQnPTNHShbmjtwB77OTBjIR5jaFZKjLNcCr7f
         t5jsKs1U4zclLTyg/kBGnn9L9lDqFFqO9VXt5jWhjAPet3uCvICPZcC7wOolI2+nwhuV
         wJ94twduJriv+Z6LpAxyxWqJ6FquAGfKXAo/ETvtD/PDYNYxaUobeGuCu8qLoB+p2mjl
         HVL6hFdpj6vT+rgL6AaX9rcQkpsuTksZDr8WYXoYA9KD/FV/6oWIzNA4fGxPEmXJPnK6
         fYIr0hmpZjjFl0ROVCabv2l3Rr7iuNXUgwWUDPeqdnolclV+RSqxQg5Ve/Azl44WMhnr
         NWDw==
X-Forwarded-Encrypted: i=1; AJvYcCVWZtNV501HtuHxQaKNSOl/rqC/hVyeffxNk53EzlBXsUpG5J7gVyoOhboAlfGy1vjJfP2A84B1XorY2per9A==@lists.infradead.org
X-Gm-Message-State: AOJu0Yz1FrS7Z1Twpsb9MYkXP4/eGD/6S7R2RaxmA7NHRqDClh08o1Tc
	p5lLKkqXcoKCpNoebD/gA5TIPhmXg7KBUlWwDyv+f6DPNH7V9oNKHUo3JFEFMTqeTovIVXf2Rnp
	EbPluLM+saq2ZCWfV3gn0XIBKmlgSCMRRkbx33rPtRqi47ISYvcKeNNiJHkOY7lITw5MivG/LMA
	==
X-Gm-Gg: ASbGncs5mnF8kcY1BS2cFyLoqub6JPrPSd0oxJe26u4jAhBmWuMreTUybdMR93rDZEt
	9nocDSZJC5PI8cUsMXwaViH0eQaWxXvmmW3M9Db5xgt6fN++ZbFhK6jMHPV5JH4sYlXdAYP4j4o
	BLVdxGgy+zWsfgqo7nYuLypGtN9o32QvlLexuBFJ8Hq27CUvjJkYBEdO+4S21qUZLlhfA9gMxKA
	NekrSGlbVJKrNvsz+SEfFm5/kAOVw88edZijYvMS/XnJVr3KxX5mRST5TtUA9dR+HC+Kik6KXFH
	4uPzXhdPrC7avpViRy2BdlMQN3dgyWtJqt6zxT1DTcMgJ4t4Rbyxc7qzTFnf
X-Received: by 2002:a05:6214:3107:b0:6fd:61b6:3360 with SMTP id 6a1803df08f44-7048b8bd8b7mr113600526d6.5.1752163708702;
        Thu, 10 Jul 2025 09:08:28 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IG7IKnx0oGY6DzZmPHsoNfOxbxEl/6NrEujAZIrZneNt1HGeFa55m0X6zYpF5NdeeHumqI+Dw==
X-Received: by 2002:a05:6214:3107:b0:6fd:61b6:3360 with SMTP id 6a1803df08f44-7048b8bd8b7mr113599866d6.5.1752163708155;
        Thu, 10 Jul 2025 09:08:28 -0700 (PDT)
Received: from [192.168.1.3] (c-73-183-52-120.hsd1.pa.comcast.net. [73.183.52.120])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-70497d39749sm9670216d6.58.2025.07.10.09.08.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Jul 2025 09:08:27 -0700 (PDT)
From: Brian Masney <bmasney@redhat.com>
Date: Thu, 10 Jul 2025 12:07:18 -0400
Subject: [PATCH 8/9] phy: rockchip: phy-rockchip-samsung-hdptx: convert
 from round_rate() to determine_rate()
MIME-Version: 1.0
Message-Id: <20250710-phy-clk-round-rate-v1-8-0ff274055e42@redhat.com>
References: <20250710-phy-clk-round-rate-v1-0-0ff274055e42@redhat.com>
In-Reply-To: <20250710-phy-clk-round-rate-v1-0-0ff274055e42@redhat.com>
To: Vinod Koul <vkoul@kernel.org>, 
 Kishon Vijay Abraham I <kishon@kernel.org>, 
 Chun-Kuang Hu <chunkuang.hu@kernel.org>, 
 Philipp Zabel <p.zabel@pengutronix.de>, 
 Chunfeng Yun <chunfeng.yun@mediatek.com>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Heiko Stuebner <heiko@sntech.de>, Maxime Ripard <mripard@kernel.org>, 
 Stephen Boyd <sboyd@kernel.org>
Cc: linux-clk@vger.kernel.org, linux-phy@lists.infradead.org, 
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
 linux-rockchip@lists.infradead.org, Brian Masney <bmasney@redhat.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1752163685; l=2561;
 i=bmasney@redhat.com; s=20250528; h=from:subject:message-id;
 bh=tFpHMfoqDqhzNTaVv7v0N0qvUtE+54itjjhNS/n95Lc=;
 b=e7X3yn2YeXeKXrOkS5F+e0IypwltHuyXsyzMnUIUuprHWBg0Yjbm20ihxHiKGf27VyMww7dN8
 zNFlSuHfbztAbMvbZ4Tm4rj9g4qefWj2ql3S7qfHwrgGweB+1fYDH7N
X-Developer-Key: i=bmasney@redhat.com; a=ed25519;
 pk=x20f2BQYftANnik+wvlm4HqLqAlNs/npfVcbhHPOK2U=
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: Ah71pjY8zMGoafTCor2KkdvFasTjtaa-aHdW0eyuNEE_1752163709
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250710_090834_906234_6EAEC693 
X-CRM114-Status: GOOD (  14.29  )
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

The round_rate() clk ops is deprecated, so migrate this driver from
round_rate() to determine_rate() using the Coccinelle semantic patch
on the cover letter of this series.

Signed-off-by: Brian Masney <bmasney@redhat.com>
---
 drivers/phy/rockchip/phy-rockchip-samsung-hdptx.c | 21 +++++++++++++--------
 1 file changed, 13 insertions(+), 8 deletions(-)

diff --git a/drivers/phy/rockchip/phy-rockchip-samsung-hdptx.c b/drivers/phy/rockchip/phy-rockchip-samsung-hdptx.c
index 79db57ee90d1487b51f4ddadde870a275dd7b17b..f027d2caa4c2ebfc0fdec08bcebf3f415ff1a064 100644
--- a/drivers/phy/rockchip/phy-rockchip-samsung-hdptx.c
+++ b/drivers/phy/rockchip/phy-rockchip-samsung-hdptx.c
@@ -1869,8 +1869,8 @@ static unsigned long rk_hdptx_phy_clk_recalc_rate(struct clk_hw *hw,
 	return hdptx->hw_rate;
 }
 
-static long rk_hdptx_phy_clk_round_rate(struct clk_hw *hw, unsigned long rate,
-					unsigned long *parent_rate)
+static int rk_hdptx_phy_clk_determine_rate(struct clk_hw *hw,
+					   struct clk_rate_request *req)
 {
 	struct rk_hdptx_phy *hdptx = to_rk_hdptx_phy(hw);
 
@@ -1879,14 +1879,17 @@ static long rk_hdptx_phy_clk_round_rate(struct clk_hw *hw, unsigned long rate,
 	 * To be dropped as soon as the RK DW HDMI QP bridge driver
 	 * switches to make use of phy_configure().
 	 */
-	if (!hdptx->restrict_rate_change && rate != hdptx->hdmi_cfg.tmds_char_rate) {
+	if (!hdptx->restrict_rate_change && req->rate != hdptx->hdmi_cfg.tmds_char_rate) {
 		struct phy_configure_opts_hdmi hdmi = {
-			.tmds_char_rate = rate,
+			.tmds_char_rate = req->rate,
 		};
 		int ret = rk_hdptx_phy_verify_hdmi_config(hdptx, &hdmi);
 
-		if (ret)
-			return ret;
+		if (ret) {
+			req->rate = ret;
+
+			return 0;
+		}
 
 		hdptx->hdmi_cfg = hdmi;
 	}
@@ -1896,7 +1899,9 @@ static long rk_hdptx_phy_clk_round_rate(struct clk_hw *hw, unsigned long rate,
 	 * hence ensure rk_hdptx_phy_clk_set_rate() won't be invoked with
 	 * a different rate argument.
 	 */
-	return hdptx->hdmi_cfg.tmds_char_rate;
+	req->rate = hdptx->hdmi_cfg.tmds_char_rate;
+
+	return 0;
 }
 
 static int rk_hdptx_phy_clk_set_rate(struct clk_hw *hw, unsigned long rate,
@@ -1925,7 +1930,7 @@ static const struct clk_ops hdptx_phy_clk_ops = {
 	.prepare = rk_hdptx_phy_clk_prepare,
 	.unprepare = rk_hdptx_phy_clk_unprepare,
 	.recalc_rate = rk_hdptx_phy_clk_recalc_rate,
-	.round_rate = rk_hdptx_phy_clk_round_rate,
+	.determine_rate = rk_hdptx_phy_clk_determine_rate,
 	.set_rate = rk_hdptx_phy_clk_set_rate,
 };
 

-- 
2.50.0


