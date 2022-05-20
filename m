Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CD335C433F5
	for <linux-mediatek@archiver.kernel.org>; Fri, 20 May 2022 00:37:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:To:Cc:From:Subject:
	References:In-Reply-To:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=idDwpU3gjLjK5Rclu3Sh8yyogPQDat1ntc+C018fFww=; b=jXLcO9O4TBi293
	zdmy4pSFVLTAn57W4Pdilek/un3NtoA6vq0DFvl3f+8GQa8qlT7Ilid72LvdM+HWF3X/zi2piPNag
	qYynJXmi5IQMyTVYFfWQJnu3OT7zMQ5vqqF69Z82ZZa/cBbw/RNnBJZM/Ue1sKe8oDtz9I4Icb+bG
	RpKnCS7dcCllZJNYVgzIFYS15jxXyaJw5DTjEceiAroSRLXaa8QKN9pO++MGHWOrp6WqYV92X14Rm
	tnrQ981bEmM17xlxrMzXVxaquyrQzn45ndP5dz/iW3jx5eLUO25VAgBfaOUc+SXjfWTo6N1wKCIlT
	aDBGF4tWQ9XZ5aRirwiQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nrqdy-009pAW-0k; Fri, 20 May 2022 00:37:26 +0000
Received: from ams.source.kernel.org ([145.40.68.75])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nrqdm-009p7D-PV; Fri, 20 May 2022 00:37:16 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 6B916B82955;
 Fri, 20 May 2022 00:37:13 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 13B84C385AA;
 Fri, 20 May 2022 00:37:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1653007032;
 bh=0bY4PP/8AE23cA6dggmSHDxNih0qmDn74hKayz9cuko=;
 h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
 b=U1ES1eNvNfodef0NPGGoxZi7d1qTexNseH49e3rlgRQh5jtEJjftmwG7JB9Lb6YQQ
 LbxArY6creVNgumubdeL3PZQunKY5oKiFJF8UNGF8bMZytfLketZNj7Rxx7XTnjiKB
 jUAyVyw9/ukrKyLWydEnpZjXyhs3hI+IDqoUC9r9mrmRHVmjHR7K7p+oyPnqKpF+tM
 kmvHuZfWdrLaduvcLAoRfhgPgRdHMoFiV7M6YWusylTzEVq2GONB6iuVecTeKTUIGw
 1vHDEtUqPzjC8Uw5PHywUAbqx4HFq8xqKBlaHgn7MG1pIFYhvlFY4mKS5ugWccvRO7
 mbcyAcCg4/S1Q==
MIME-Version: 1.0
In-Reply-To: <20220519071610.423372-3-wenst@chromium.org>
References: <20220519071610.423372-1-wenst@chromium.org>
 <20220519071610.423372-3-wenst@chromium.org>
Subject: Re: [PATCH v3 2/5] clk: mediatek: apmixed: Drop error message from
 clk_register() failure
From: Stephen Boyd <sboyd@kernel.org>
Cc: Chen-Yu Tsai <wenst@chromium.org>,
 Chun-Jie Chen <chun-jie.chen@mediatek.com>,
 Miles Chen <miles.chen@mediatek.com>, Rex-BC Chen <rex-bc.chen@mediatek.com>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 linux-clk@vger.kernel.org, linux-mediatek@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
To: Chen-Yu Tsai <wenst@chromium.org>,
 Michael Turquette <mturquette@baylibre.com>
Date: Thu, 19 May 2022 17:37:09 -0700
User-Agent: alot/0.10
Message-Id: <20220520003712.13B84C385AA@smtp.kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220519_173715_017407_92503189 
X-CRM114-Status: GOOD (  11.75  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Quoting Chen-Yu Tsai (2022-05-19 00:16:07)
> mtk_clk_register_ref2usb_tx() prints an error message if clk_register()
> fails. It doesn't if kzalloc() fails though. The caller would then tack
> on its own error message to handle this.
> 
> Also, All other clk registration functions in the MediaTek clk library
> leave the error message printing to the bulk registration functions,
> while the helpers that register individual clks just return error codes.
> 
> Drop the error message that is printed when clk_register() fails in
> mtk_clk_register_ref2usb_tx() to make its behavior consistent both
> across its failure modes, and with the rest of the driver library.
> 
> Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>
> Reviewed-by: Miles Chen <miles.chen@mediatek.com>
> Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
> Tested-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
> Tested-by: Miles Chen <miles.chen@mediatek.com>
> ---

Applied to clk-next

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
