Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1568B109E54E
	for <linux-mediatek@archiver.kernel.org>; Thu, 26 Mar 2026 05:09:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:To:From:Date:Reply-To:Cc:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=G2TbPo/pMw3pBSbT82bq1wqpfPNit/D4PQZeEFgUmrY=; b=JQCM0L+xGKcLvJAd7kjdtPwDj/
	3zGyiB/BOL8LYgIaYxs/Tn6brwzY9S2GHUnnCTqdnboBd9lHnXOvGgBuo7OTpatG5Ku7XM4fdootM
	dNB9/1sJzfd96u9QURq7SLoldDNbWwZyq2kCOcLnRKv/e7PhYOcrUYU7/HHN7+EssmSz+g4x0+CtB
	m0cMMz35EBmj6os0Tr0m7rPve6OaNmtYQ4swnHodgP+bVjTfaOxWiPKJ92ejQVxf8NV/w8PHsZwmX
	Te1kIqcj9H0zPFcHFcyXEgxEUs2yQ2mCrrt/UDWAGC7mk+DA/H1w9e2Da2+rwRLej+ZiXByBHaYtY
	QAa14phw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w5cyY-00000004iMP-0lK8;
	Thu, 26 Mar 2026 05:09:46 +0000
Received: from pidgin.makrotopia.org ([2a07:2ec0:3002::65])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w5cyV-00000004iKh-1Kt6;
	Thu, 26 Mar 2026 05:09:44 +0000
Received: from local
	by pidgin.makrotopia.org with esmtpsa (TLS1.3:TLS_AES_256_GCM_SHA384:256)
	 (Exim 4.99)
	(envelope-from <daniel@makrotopia.org>)
	id 1w5cyQ-000000006qC-3Tq7;
	Thu, 26 Mar 2026 05:09:38 +0000
Date: Thu, 26 Mar 2026 05:09:35 +0000
From: Daniel Golle <daniel@makrotopia.org>
To: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Daniel Golle <daniel@makrotopia.org>,
	=?iso-8859-1?Q?N=EDcolas_F=2E_R=2E_A=2E?= Prado <nfraprado@collabora.com>,
	Laura Nao <laura.nao@collabora.com>,
	Chen-Yu Tsai <wenst@chromium.org>, Weiyi Lu <weiyi.lu@mediatek.com>,
	Chun-Jie Chen <chun-jie.chen@mediatek.com>,
	Ikjoon Jang <ikjn@chromium.org>, Sam Shih <sam.shih@mediatek.com>,
	linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Subject: [PATCH v2 1/3] clk: mediatek: add MUX_CLR_SET macro
Message-ID: <65e504ac2c2d19b4baba6b79a241788220b19b34.1774499536.git.daniel@makrotopia.org>
References: <cover.1774499536.git.daniel@makrotopia.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cover.1774499536.git.daniel@makrotopia.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260325_220943_381043_862739DA 
X-CRM114-Status: UNSURE (   8.85  )
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

Some MediaTek SoCs (e.g. MT7988) define infra muxes that have neither
a clock gate nor an update register.

Add a MUX_CLR_SET convenience macro that takes only the mux register
offsets, bit shift, and width, hardcoding upd_ofs = 0 and
upd_shift = -1 so callers cannot accidentally pass bogus sentinel
values to wrongly-typed fields.

Signed-off-by: Daniel Golle <daniel@makrotopia.org>
---
 drivers/clk/mediatek/clk-mux.h | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/drivers/clk/mediatek/clk-mux.h b/drivers/clk/mediatek/clk-mux.h
index 151e56dcf8842..8a5d6aca43aa9 100644
--- a/drivers/clk/mediatek/clk-mux.h
+++ b/drivers/clk/mediatek/clk-mux.h
@@ -126,6 +126,11 @@ extern const struct clk_ops mtk_mux_gate_hwv_fenc_clr_set_upd_ops;
 			0, _upd_ofs, _upd, CLK_SET_RATE_PARENT,		\
 			mtk_mux_clr_set_upd_ops)
 
+#define MUX_CLR_SET(_id, _name, _parents, _mux_ofs,			\
+		    _mux_set_ofs, _mux_clr_ofs, _shift, _width)		\
+		    MUX_CLR_SET_UPD(_id, _name, _parents, _mux_ofs,	\
+		    _mux_set_ofs, _mux_clr_ofs, _shift, _width, 0, -1)
+
 #define MUX_GATE_HWV_FENC_CLR_SET_UPD_FLAGS(_id, _name, _parents,			\
 				_mux_ofs, _mux_set_ofs, _mux_clr_ofs,			\
 				_hwv_sta_ofs, _hwv_set_ofs, _hwv_clr_ofs,		\
-- 
2.53.0

