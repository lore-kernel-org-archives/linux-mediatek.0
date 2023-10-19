Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 459A0CDB483
	for <linux-mediatek@archiver.kernel.org>; Thu, 19 Oct 2023 01:15:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Date:To:Cc:From:Subject:
	References:In-Reply-To:Content-Transfer-Encoding:MIME-Version:Content-Type:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=RqMBWNCIh+JHdtsaQoOyxVWv5G9F/rNE6ydRXBBW4eE=; b=l9rE6ILyTHR/E8e1rJMV7UsrJI
	M7at6vmKf/vIyV+G9mkuXilYzGcs9XwfbXUBMliqffZpxWeO+xfWoEncR+ed9ZEpPIZbiLCb1rGlo
	PwbfIgKaHW8BbMmvBpu4jHzE+JzbjSNaRX+7ZW8EGCVG4LQ0A/mJ33hHwJlyOtsAcVLYRr25qV2pY
	2Y9dUuSHCqUXV13aMOiYY90ljgM50gn+HamiAM/Xpl65JXLXXtbSAwr3Db6RY1v6I20tV+vlQEmnO
	8gNSJrtzted7IIe16fGSPGOInqDqJPyxhfl43GOroj8dm9JRCKc7yJkde+K2a9zEEXdQ1u3PUzZCl
	K5g2O1uw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qtHdh-00G2oA-0p;
	Thu, 19 Oct 2023 01:15:53 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qtHdc-00G2mh-2G;
	Thu, 19 Oct 2023 01:15:51 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 2A1E9619F1;
	Thu, 19 Oct 2023 01:15:48 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B9D96C433C8;
	Thu, 19 Oct 2023 01:15:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1697678147;
	bh=RqMBWNCIh+JHdtsaQoOyxVWv5G9F/rNE6ydRXBBW4eE=;
	h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
	b=XRJupeUCZSn2Xn0tVlPHJrNYEVxlkFU0cHZ2uxVavzHgMwrjMYrmv3vfKDue952ek
	 MyQi6Sqmn4ZWHHk82aCqaF1Rrf39jSbJ91sZW4C7xNepgHaCfVj7xt8mAvgHPPzrFz
	 uKfqxZJ13NtuPQYMKkWeNrWEpYDU1y1dfO220WH7ZQfJfXquuQ3SSCNNEwrX/g4yh9
	 FNaydZMXlqtLCVWcZrPXuS+40R/kZmJ/R5MtazImrXznUMVlnzWMQH7I/s96NyPvNA
	 sDDSuTeNSzcAZNnoT43rBIFk5xchXumJNPDDs4/p8vx6ia1jhRhtmHtOkialCNCr/X
	 JiLcCjkdUR58w==
Message-ID: <63f772d70abf27dcbeabba6a13f26a4f.sboyd@kernel.org>
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20230912093407.21505-3-jiasheng@iscas.ac.cn>
References: <20230912093407.21505-1-jiasheng@iscas.ac.cn> <20230912093407.21505-3-jiasheng@iscas.ac.cn>
Subject: Re: [PATCH 3/5] clk: mediatek: clk-mt6797: Add check for mtk_alloc_clk_data
From: Stephen Boyd <sboyd@kernel.org>
Cc: linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, Jiasheng Jiang <jiasheng@iscas.ac.cn>
To: Jiasheng Jiang <jiasheng@iscas.ac.cn>, amergnat@baylibre.com, angelogioacchino.delregno@collabora.com, cw00.choi@samsung.com, frank.li@vivo.com, kevin-cw.chen@mediatek.com, luca.ceresoli@bootlin.com, macpaul.lin@mediatek.com, mars.cheng@mediatek.com, matthias.bgg@gmail.com, msp@baylibre.com, mturquette@baylibre.com, owen.chen@mediatek.com, robh@kernel.org, ryder.lee@mediatek.com, u.kleine-koenig@pengutronix.de, wendell.lin@mediatek.com, wenst@chromium.org, wenzhen.yu@mediatek.com
Date: Wed, 18 Oct 2023 18:15:45 -0700
User-Agent: alot/0.10
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231018_181548_783760_4CD6C49E 
X-CRM114-Status: UNSURE (   7.64  )
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

Quoting Jiasheng Jiang (2023-09-12 02:34:05)
> Add the check for the return value of mtk_alloc_clk_data() in order to
> avoid NULL pointer dereference.
>=20
> Fixes: 96596aa06628 ("clk: mediatek: add clk support for MT6797")
> Signed-off-by: Jiasheng Jiang <jiasheng@iscas.ac.cn>
> ---

Applied to clk-next

