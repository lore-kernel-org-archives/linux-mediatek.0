Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C3D65C001DF
	for <linux-mediatek@archiver.kernel.org>; Tue, 11 Jul 2023 07:45:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Cgk05Bi4DPvfIkGoArTkk61qauI/xeYK5oRcaF9m6Dk=; b=o6WrTUfu1stANA6KhlZxzxsjb4
	0s3iBtK9LEjh3DUu87bidSRzzgs5OP4I7CrgpKQ88sl/9xnDeD2zKyTYm1Ldtu6NTPg6gXIXLz1DJ
	1WfnadF5XobN69YeGTz99qT27687+SmuAm6K/eCaQIzB//ywgTzbRDOyItQ+qSIdHuSs3IE8UJQHG
	7rkme1J3uxPaMCFX1WA9Js6tkfn+jbvUvklU5KTTXe90L6e+BxN7/SPL83ViaQlJ7T7YimBROZE+h
	ImCxavlxtLQIZy2BuIya65JLg9Rt4HSD8luc5DV+1Tv/wEjsnlwh2AUxUiIS7i3VKht2l9SCcfJLS
	N63eR0yQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qJ83S-00E1LX-34;
	Tue, 11 Jul 2023 07:45:02 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qJ83P-00E1Jn-2i;
	Tue, 11 Jul 2023 07:45:01 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id AAB0A6135E;
	Tue, 11 Jul 2023 07:44:58 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3AF6EC43395;
	Tue, 11 Jul 2023 07:44:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1689061498;
	bh=ciw16WjgCbpUQ78bDN+pzL0lSeeM/GqmjDYLxzcY6yI=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=IwPp3mQJ1TpyDP96+oR3Fu3Y/tisMwzJG2v0fVSWQJXN7gzCcGlh4uys5YlZL++SC
	 kLrTV4b97MmeAs3dMISU77AFKE4abftNKYLCBgtQsxd7jlJ5+qGDTDgjcJM6xik/nf
	 /9X79Cnes411fTfqgKKacopYEzKKjablX4KPmEgO5Zt6gMZUUnipyKQVV7BfP1+9Ih
	 xBsXI/HcbssfS+AyGNjsamXF+M+3lcpfdppFLe//nShQV7d69khbihCujMoj0SP+I4
	 vei1AFDr1r2/qiPhmJp+O7vrcCb1zXKVJO9fzEi5IPTmzL2ZXJhj/HMBYgf5Bo5JCr
	 3LcTzz2ZggEgQ==
From: Vinod Koul <vkoul@kernel.org>
To: chunkuang.hu@kernel.org, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: p.zabel@pengutronix.de, chunfeng.yun@mediatek.com, kishon@kernel.org, 
 matthias.bgg@gmail.com, dri-devel@lists.freedesktop.org, 
 linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
 linux-phy@lists.infradead.org, linux-kernel@vger.kernel.org, 
 kernel@collabora.com
In-Reply-To: <20230525115258.90091-1-angelogioacchino.delregno@collabora.com>
References: <20230525115258.90091-1-angelogioacchino.delregno@collabora.com>
Subject: Re: [PATCH 0/3] MediaTek MIPI-DSI PHY: Cleanups
Message-Id: <168906149382.189433.16193247421071563678.b4-ty@kernel.org>
Date: Tue, 11 Jul 2023 13:14:53 +0530
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.12.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230711_004459_920762_1E2A9A10 
X-CRM114-Status: UNSURE (   8.91  )
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


On Thu, 25 May 2023 13:52:55 +0200, AngeloGioacchino Del Regno wrote:
> This series performs some cleanups to the MediaTek mipi-dsi PHY, used in
> various MediaTek SoCs; in particular, it's migrating this driver to
> register its clock as clk_hw provider instead and makes use of the devm
> function for the same, allowing to remove a pointer to struct clk and
> the whole .remove_new() callback, as it's not needed anymore.
> This also cleans up the of_device_id table.
> 
> [...]

Applied, thanks!

[1/3] phy: mediatek: mipi-dsi: Convert to register clk_hw
      commit: b1a34e7d196646a8fc0a6f91c2bf98943f3d440a
[2/3] phy: mediatek: mipi-dsi: Use devm variant for of_clk_add_hw_provider()
      commit: e812c5b62a978ae67d23c5eb237959596734a86e
[3/3] phy: mediatek: mipi-dsi: Compress of_device_id match entries
      commit: 5d295c1a20c747425c27dd9212ff091528136e55

Best regards,
-- 
~Vinod



