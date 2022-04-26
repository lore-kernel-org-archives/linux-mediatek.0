Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8150FC433F5
	for <linux-mediatek@archiver.kernel.org>; Tue, 26 Apr 2022 00:14:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:To:Cc:From:Subject:
	References:In-Reply-To:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=wmkBgOWUBfmGQwmRl+qVh/bSly5jVgA6uk6p77ycE5k=; b=c2KTFOhUc306FW
	BpZUhFLH9YTMrZK00c7EJgKHJR2Hz3kQ+G2Hq8aV2g/jWKsQ2ueo0D+e2FTi0WqG3wfI68JaZ2fC5
	yeNyUl8eYoLYheQxVnGsztFfipUvChvzbPMdnlWalUMasBJshou91fvQb6nhUw4UuatVr/Oyu6ZHW
	/f3jf/EhrsVHzfWHkDn5ZdRamv50CJX5PBnE7YK1rATTyr4XvvTmgn1QFZr8SLEBUOClLOj/io9Rw
	+o0eNYvIDMsx5FVWXyHQ2c83/vw3jRIPYsGtHwtsSIEhVQr62VSOHw4bhY9ctI2bnfwhKzusUssUN
	pxb9PaVddXjk5uJMuJIQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nj8qW-00Bq61-SG; Tue, 26 Apr 2022 00:14:24 +0000
Received: from ams.source.kernel.org ([2604:1380:4601:e00::1])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nj8pi-00Bpcr-QV; Tue, 26 Apr 2022 00:13:36 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 75945B81BBE;
 Tue, 26 Apr 2022 00:13:33 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F1360C385B9;
 Tue, 26 Apr 2022 00:13:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1650932011;
 bh=Ow78VkIBAEP36TlYSEZ7SB8Qi7mldmLyeftLK2D/pK4=;
 h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
 b=iVk0GsA9BztxcW7kQFzC8MoziAMy2yzq/aRZt9d6VAe+1GfSy0IbduYATQ9HJJWXZ
 Tdo95vEIUS6NPoUPaIZxUtOvgh6EGaHT6eYBrJBFZ5e0xplP8ZbGk/L7eYs0FXltCx
 TCD0v9BnaOwJEgZYucvc7hkEkRzzVCfhYbMbJTu2b/zQThxRbX4xmohRWK7c5netXj
 SLlNvfI6mzFra4/dHuSedKapLfRLRBhXStcNLzlPGGw26Lz0GBdMz7RFz2R52uFRNi
 6HFg+s4aZc4dDzdmaxADPm84P8TTrKl59hTxiE8FuQjdD2TwFzsMCwq2Gm11SoQbsM
 3zV4XRUKwLc0A==
MIME-Version: 1.0
In-Reply-To: <20220409132251.31725-11-chun-jie.chen@mediatek.com>
References: <20220409132251.31725-1-chun-jie.chen@mediatek.com>
 <20220409132251.31725-11-chun-jie.chen@mediatek.com>
Subject: Re: [PATCH v5 10/15] clk: mediatek: Add MT8186 imgsys clock support
From: Stephen Boyd <sboyd@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-mediatek@lists.infradead.org, linux-clk@vger.kernel.org,
 devicetree@vger.kernel.org, srv_heupstream@mediatek.com,
 Project_Global_Chrome_Upstream_Group@mediatek.com,
 Chun-Jie Chen <chun-jie.chen@mediatek.com>
To: Chun-Jie Chen <chun-jie.chen@mediatek.com>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Nicolas Boichat <drinkcat@chromium.org>, Rob Herring <robh+dt@kernel.org>
Date: Mon, 25 Apr 2022 17:13:28 -0700
User-Agent: alot/0.10
Message-Id: <20220426001330.F1360C385B9@smtp.kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220425_171335_034798_4D975687 
X-CRM114-Status: UNSURE (   7.25  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Quoting Chun-Jie Chen (2022-04-09 06:22:46)
> Add MT8186 imgsys clock controllers which provide clock gate
> control for image IP blocks.
> 
> Signed-off-by: Chun-Jie Chen <chun-jie.chen@mediatek.com>
> Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
> Reviewed-by: Miles Chen <miles.chen@mediatek.com>
> ---

Applied to clk-next

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
