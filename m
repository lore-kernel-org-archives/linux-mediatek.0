Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8985C109E54E
	for <linux-mediatek@archiver.kernel.org>; Thu, 26 Mar 2026 05:09:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Subject:To:From:Date:Reply-To:Cc:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=Rwx2l65sgCDlYBuvJg72bajqf1kWODjUiE8Qj3wTuas=; b=kjhFLzYW9YbP8hYv8VWK/Fh8Bz
	MIuLueQzct1ZoXA+/abpASAc73PSZsTfavSNZuWlZUB9J49i455CwitRvijDW5makx1mo0bSxeIw2
	f7MeDHu0//aQG7PsSuEnuoWRen7EKlafmdIhKLeIVLE8lJL/mTYcc30/BtgT1oo/ATQ6TUeHmaef9
	MzgbfZtQC2Caal7tFniTyMyBZFaJ+YiG+7orN6FmhIZoUb2DSvZbN0AEzUW5AUPRu94jodfcvT1CF
	fiMG1LUPxhhDtyKRu0YQrUHOsvEMIEG9AY+B+2bMpZKrXVCFrUZrx1U6O53BZ/eq1KunJ2ZdnljiO
	3zFJdOaA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w5cyS-00000004iKG-2eCW;
	Thu, 26 Mar 2026 05:09:40 +0000
Received: from pidgin.makrotopia.org ([2a07:2ec0:3002::65])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w5cyP-00000004iJd-1dL8;
	Thu, 26 Mar 2026 05:09:38 +0000
Received: from local
	by pidgin.makrotopia.org with esmtpsa (TLS1.3:TLS_AES_256_GCM_SHA384:256)
	 (Exim 4.99)
	(envelope-from <daniel@makrotopia.org>)
	id 1w5cyC-000000006pt-3pea;
	Thu, 26 Mar 2026 05:09:25 +0000
Date: Thu, 26 Mar 2026 05:09:22 +0000
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
Subject: [PATCH v2 0/3] clk: mediatek: fix gate-less mux definitions
Message-ID: <cover.1774499536.git.daniel@makrotopia.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260325_220937_431304_86620939 
X-CRM114-Status: UNSURE (   7.01  )
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

Some MediaTek clock drivers define gate-less muxes without an update
register using MUX_GATE_CLR_SET_UPD, passing -1 as a sentinel for the
absent gate and update fields.  Since those fields are stored in u8 and
u32 struct members, the -1 truncates to unexpected values.

Add MUX_CLR_SET, a wrapper around MUX_CLR_SET_UPD that hardcodes the
absent fields, and convert the affected mux definitions in mt8192 and
mt7988 to use it.

Daniel Golle (3):
  clk: mediatek: add MUX_CLR_SET macro
  clk: mediatek: mt8192: use MUX_CLR_SET
  clk: mediatek: mt7988: use MUX_CLR_SET for gate-less muxes

 drivers/clk/mediatek/clk-mt7988-infracfg.c | 80 ++++++++++------------
 drivers/clk/mediatek/clk-mt8192.c          |  4 +-
 drivers/clk/mediatek/clk-mux.h             |  6 ++
 3 files changed, 46 insertions(+), 44 deletions(-)

-- 
2.53.0

