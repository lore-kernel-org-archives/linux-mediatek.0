Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 708D8C87FCB
	for <linux-mediatek@archiver.kernel.org>; Tue,  5 Aug 2025 14:20:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=LIGUnNJChiCJwH2reiqqZYVZ5TVRFs9JQfHB1Hwrtwo=; b=GhOvccDgrotXOfi2RF7r5McJMG
	3FjwxJWj/A7Ej1JUlIhCKRCKH9AG+N/xp2r9MA6UQReIMqYnpJnci0IoWwfueelLfN7EoEWDVK/kX
	IZHHUW5pIOV04P+j5mQ24EBSPzgpWV76TF5usHHG5e0TDa7fL8eJqzUFswmV4RSTygPdhfW284nZ8
	TIyjPSoZN+5j64mqEc7tNlFezi79+shGgh0usft3McxR2gjVrnI39ePev99+GVDjNXawe/3KQwpta
	me+NXyqe5fKqDtkM3HrSZ8LvqUclwSx5maNQXYBhTD4H0+JBYcixEDRfgdYRaORs0IB4oMyjqjJaF
	rsuiiQAA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ujIWR-0000000CzKa-3qtM;
	Tue, 05 Aug 2025 14:20:11 +0000
Received: from bali.collaboradmins.com ([148.251.105.195])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ujI8r-0000000CuAL-20B4;
	Tue, 05 Aug 2025 13:55:51 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1754402148;
	bh=f6ZCFYCyhXVE4t1Jq2qeu/UDwYm0M4GvQNSvvsr39lo=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=JfRIr0CUauapEPiRlRMgRv0CiKR6IgCxcteLkPtXfIU2UM+i8A8bx+BjVbG12dlme
	 x3/j8Mt2OIraFWbkjsx0bdwlg+IIojBy/Zit5mISlEaukKQx8JxSFO14nJH+5nzwz7
	 rQTYw1LNQ4R8zTeFadn9EpPPnlL6YjGqsCKBSQ+A12OlrFUXGzaIyjbfvw/vYQXfSU
	 X+U7WS1sDUUqOnogScx804W8/Jha0BwIGbEFkrNev+ASWX2G2b/mwoPcEJ4b9GGX4K
	 1MemRZLVEscm/DeXvxOxJ9ery4sFGUF3gDxXRDnTkie1QOosi+YdgUPNckqR1LyrEK
	 +Y1WgMzDXjSXw==
Received: from laura.lan (unknown [IPv6:2001:b07:646b:e2:1976:d3fe:e682:e398])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: laura.nao)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 2EF1E17E0C83;
	Tue,  5 Aug 2025 15:55:47 +0200 (CEST)
From: Laura Nao <laura.nao@collabora.com>
To: mturquette@baylibre.com,
	sboyd@kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	matthias.bgg@gmail.com,
	angelogioacchino.delregno@collabora.com,
	p.zabel@pengutronix.de,
	richardcochran@gmail.com
Cc: guangjie.song@mediatek.com,
	wenst@chromium.org,
	linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	netdev@vger.kernel.org,
	kernel@collabora.com,
	Laura Nao <laura.nao@collabora.com>,
	=?UTF-8?q?N=C3=ADcolas=20F=20=2E=20R=20=2E=20A=20=2E=20Prado?= <nfraprado@collabora.com>
Subject: [PATCH v4 08/27] clk: mediatek: clk-mtk: Add MUX_DIV_GATE macro
Date: Tue,  5 Aug 2025 15:54:28 +0200
Message-Id: <20250805135447.149231-9-laura.nao@collabora.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250805135447.149231-1-laura.nao@collabora.com>
References: <20250805135447.149231-1-laura.nao@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250805_065549_656158_F292CE1E 
X-CRM114-Status: UNSURE (   9.97  )
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

On MT8196, some clocks use one register for parent selection and
gating, and a separate register for frequency division. Since composite
clocks can combine a mux, divider, and gate in a single entity, add a
macro to simplify registration of such clocks by combining parent
selection, frequency scaling, and enable control into one definition.

Reviewed-by: Nícolas F. R. A. Prado <nfraprado@collabora.com>
Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Signed-off-by: Laura Nao <laura.nao@collabora.com>
---
 drivers/clk/mediatek/clk-mtk.h | 19 +++++++++++++++++++
 1 file changed, 19 insertions(+)

diff --git a/drivers/clk/mediatek/clk-mtk.h b/drivers/clk/mediatek/clk-mtk.h
index e2cefd9bc5b8..3498505b616e 100644
--- a/drivers/clk/mediatek/clk-mtk.h
+++ b/drivers/clk/mediatek/clk-mtk.h
@@ -176,6 +176,25 @@ struct mtk_composite {
 		.flags = 0,						\
 	}
 
+#define MUX_DIV_GATE(_id, _name, _parents,		\
+		_mux_reg, _mux_shift, _mux_width,	\
+		_div_reg, _div_shift, _div_width,	\
+		_gate_reg, _gate_shift) {		\
+		.id            = _id,			\
+		.name          = _name,			\
+		.parent_names  = _parents,		\
+		.num_parents   = ARRAY_SIZE(_parents),	\
+		.mux_reg       = _mux_reg,		\
+		.mux_shift     = _mux_shift,		\
+		.mux_width     = _mux_width,		\
+		.divider_reg   = _div_reg,		\
+		.divider_shift = _div_shift,		\
+		.divider_width = _div_width,		\
+		.gate_reg      = _gate_reg,		\
+		.gate_shift    = _gate_shift,		\
+		.flags         = CLK_SET_RATE_PARENT,	\
+	}
+
 int mtk_clk_register_composites(struct device *dev,
 				const struct mtk_composite *mcs, int num,
 				void __iomem *base, spinlock_t *lock,
-- 
2.39.5


