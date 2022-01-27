Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 01609C433EF
	for <linux-mediatek@archiver.kernel.org>; Thu, 27 Jan 2022 11:52:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:Cc:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=22FaLYK1bHH0xeT5FdOf/zsJWo2h60RkUOI1U2Q8Ufg=; b=pXwNkl9viw7eDiq0t3U2tdpKGg
	LBujDP8VwZxTi6ZpBhiCcXYQdmXJuN9Si8smr0fwTfNuujk7VStvizE5M9dmqIn8ME4TbAV+4cCNS
	B3VKBNMgE7/Bc7sCjGnnqiXf1vuU/5VnlPlDrAmnrqSWweedqSpeeA1w9mhEbCkdmovndXScOqf2J
	XhYgwp5p3l4FmDUYz6bpKMjdHl8BcHj92NEqTCgATbY+qlKIu8cjOS1evOuoy+sP+yOGh4mF2q9If
	CB+jgJtAk/gaUlhdRiEnDBNVU3i9eRzCoOcobkTx0PHumUgcuHG/fMd7//X6zYpOQCTq0h7GrnLRp
	wjWa9cCg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nD3K2-00FZiF-B8; Thu, 27 Jan 2022 11:52:14 +0000
Received: from bhuna.collabora.co.uk ([2a00:1098:0:82:1000:25:2eeb:e3e3])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nD3K0-00FZh1-At
 for linux-mediatek@lists.infradead.org; Thu, 27 Jan 2022 11:52:13 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (Authenticated sender: kholk11) with ESMTPSA id 88FBE1F44C9C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1643284331;
 bh=DdkbTxmQp+SAGpru29bn+MIufi/Uo6XEdozCAJeoQCA=;
 h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
 b=F2bnAYU8uI72bl5vlNkwoqevgKkS8YDqOxLqWH1AVI/Oz7uHfuEyR2j1zlyRhCyrU
 KA4dQOtCZrxMGXoJNRq5seiVWzZCcw7dWVNTYeT9sO4+oFRlbjxZ+baq1p+f20q0bt
 l4KiSkx3weERNzfRa/d5V0F7XfkQm+WGf/8ffo6194uFGj2SoibE7nT6pl6n1KrAoN
 vwOFTqU93wATdpATITdELcYrF4I43+lqnZ/FP6HG4vz1L8kYT4qTKCZNWDX23artwK
 6dKyGDJE+/acBBCHrCZk4dqguiUHm/rOI82QUlKMJv2GYNxKDnY6TF6HXop3r0dAfx
 Vh9z9PNzauPgQ==
Subject: Re: [PATCH] spi: spi-mtk-nor: make some internal variables static
To: guochun.mao@mediatek.com, Mark Brown <broonie@kernel.org>
Cc: Matthias Brugger <matthias.bgg@gmail.com>,
 Bayi Cheng <bayi.cheng@mediatek.com>, Chuanhong Guo <gch981213@gmail.com>,
 Bin Zhang <bin.zhang@mediatek.com>, linux-mediatek@lists.infradead.org,
 srv_heupstream@mediatek.com,
 project_global_chrome_upstream_group@mediatek.com,
 linux-kernel@vger.kernel.org, linux-spi@vger.kernel.org,
 kernel test robot <lkp@intel.com>
References: <20220126091159.27513-1-guochun.mao@mediatek.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Message-ID: <528883a0-0d55-a44e-ea18-3b0293505f54@collabora.com>
Date: Thu, 27 Jan 2022 12:52:08 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <20220126091159.27513-1-guochun.mao@mediatek.com>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220127_035212_543670_10D5B2B8 
X-CRM114-Status: UNSURE (   8.20  )
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Il 26/01/22 10:11, guochun.mao@mediatek.com ha scritto:
> From: Guochun Mao <guochun.mao@mediatek.com>
> 
> Variables mtk_nor_caps_mt8173, mtk_nor_caps_mt8186 and
> mtk_nor_caps_mt8192 are not declared.
> Make them static.
> 
> Fixes: 5b177234e9fd ("spi: spi-mtk-nor: improve device table for adding more capabilities")
> Signed-off-by: Guochun Mao <guochun.mao@mediatek.com>
> Reported-by: kernel test robot <lkp@intel.com>

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
