Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 54AC9C433EF
	for <linux-mediatek@archiver.kernel.org>; Tue, 24 May 2022 09:37:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=I8Mee4BBn5Ko5sM/emZlw7DH8aPYy40DzpjWNghcQZ4=; b=DqZtVe3wdpDicC
	4TMiNOdCjHZwel6uN3SEHVIs2TRrRY/0HQKp/vlJsXLAfO21Hl59UwNL5dB0o8T344g2luU98b155
	+FppqfPZXbUFhcyEH4QAZi5/0v29yQP9zyjOG9BtGtaTg7Id0+6d/kcPp7OiAvsZq183gT2vw29YD
	p8rRCfpNlJR6lIu/1LC/on/ZHt3Ag3UGvnkzKfpsBEDDfyTnHC2oOYhOdTqLAW8oZ80scq65nz7kA
	FddGlh5+0AEY5dQARTgdYMXaSbbu9sYHZvfDDovXwzm3CiiIxlyootsPIn51rUme2quM8r2UCvbfp
	6Hts3uAiOTI6qiO+Kgmw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ntQyb-007RT9-Qu; Tue, 24 May 2022 09:37:17 +0000
Received: from bhuna.collabora.co.uk ([46.235.227.227])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1ntQyO-007ROF-C2; Tue, 24 May 2022 09:37:06 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (Authenticated sender: kholk11) with ESMTPSA id CC4DB1F42BE6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1653385023;
 bh=Qvu6oYjtvlFJMX00HFzG17CCKmj3ObtXYANMidoi26o=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=Y+9ChHcVHwO/1P7ZMb8ua9f4tLygKxXG/yDSWKpg/PGNjfhCRnKCtGjX+5dLVB/fE
 Htv86ea5qztLMi5qs0m9Z0+x+vuxG6h23GjrPQ+3C5HDtYMeA3CjCHOHZH3LT7dNrW
 9loZ4TR4OCLtycAKKkGMI4tI4ItRuIPglfztxCaPIaamzac1MR22hQ5PC3775Gklm+
 cXf3RlDn+4j45XAXCEwEFsgxXPjeVb394di9t2SuvRE5m2fs8iEwBiPbRloosp20Bd
 XjNMDDAqjLXQLtkfu4Qu/zvBd2CBqn7XMQsY8hEKl8kY/bCu0+LMvfsBI8YJhr59qr
 jtspEuO7iYjgA==
Message-ID: <e33795d9-2cb6-3333-5ab2-c5789915f6ca@collabora.com>
Date: Tue, 24 May 2022 11:37:00 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.0
Subject: Re: [PATCH v2 0/7] clk: mediatek: use mtk_clk_simple_probe to
 simplify driver
Content-Language: en-US
To: Miles Chen <miles.chen@mediatek.com>,
 Matthias Brugger <matthias.bgg@gmail.com>
Cc: Chen-Yu Tsai <wenst@chromium.org>,
 Chun-Jie Chen <chun-jie.chen@mediatek.com>,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org
References: <20220524083843.9994-1-miles.chen@mediatek.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <20220524083843.9994-1-miles.chen@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220524_023704_735544_91D1249A 
X-CRM114-Status: GOOD (  19.48  )
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

Il 24/05/22 10:38, Miles Chen ha scritto:
> Hi everyone,
> 
> This is v2 patches to use mtk_clk_simple_probe to simplify driver.
> 
> Change since v1:
> - Angelo's patch [1] already exported mtk_clk_simple_probe and mtk_clk_simple_remove,
> so drop this part from my v1 and depends on [1].
> - add a reviewed-by tag
> 
> mtk_clk_simple_probe() was introduced by Chun-Jie in commit
> c58cd0e40ffa ("clk: mediatek: Add mtk_clk_simple_probe() to simplify clock providers")
> and mtk_clk_simple_remove() was added in commit
> commit 2204d96b1919 ("clk: mediatek: Add mtk_clk_simple_remove()")
> 
> With mtk_clk_simple_probe and mtk_clk_simple_remove,
> we can get rid of defining the same probe function in clk drivers.
> mtk_clk_simple_probe and mtk_clk_simple_remove are used in new platforms
> now, let's apply them to old SoCs.
> 
> The process is quite straightforward:
> a. Look up probe functions which can be replaced by mtk_clk_simple_probe()
> b. Add mtk_clk_desc and add .data
> c. Replace the probe function with mtk_clk_simple_probe and mtk_clk_simple_remove
> 
> I tested the series on MT8192 and MT6779.
> This patch is based on next-20220523 and [1].
> 
> Thanks,
> Miles
> 
> [1] https://patchwork.kernel.org/project/linux-mediatek/patch/20220518111652.223727-7-angelogioacchino.delregno@collabora.com/
> 

For the entire series:

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>

> 
> Miles Chen (7):
>    clk: mediatek: mt2701: use mtk_clk_simple_probe to simplify driver
>    clk: mediatek: mt2712: use mtk_clk_simple_probe to simplify driver
>    clk: mediatek: mt6765: use mtk_clk_simple_probe to simplify driver
>    clk: mediatek: mt6779: use mtk_clk_simple_probe to simplify driver
>    clk: mediatek: mt6797: use mtk_clk_simple_probe to simplify driver
>    clk: mediatek: mt8183: use mtk_clk_simple_probe to simplify driver
>    clk: mediatek: mt8192: add mtk_clk_simple_remove
> 
>   drivers/clk/mediatek/clk-mt2701-bdp.c         | 36 +++++++------------
>   drivers/clk/mediatek/clk-mt2701-img.c         | 36 +++++++------------
>   drivers/clk/mediatek/clk-mt2701-vdec.c        | 36 +++++++------------
>   drivers/clk/mediatek/clk-mt2712-bdp.c         | 34 +++++++-----------
>   drivers/clk/mediatek/clk-mt2712-img.c         | 34 +++++++-----------
>   drivers/clk/mediatek/clk-mt2712-jpgdec.c      | 34 +++++++-----------
>   drivers/clk/mediatek/clk-mt2712-mfg.c         | 34 +++++++-----------
>   drivers/clk/mediatek/clk-mt2712-vdec.c        | 34 +++++++-----------
>   drivers/clk/mediatek/clk-mt2712-venc.c        | 34 +++++++-----------
>   drivers/clk/mediatek/clk-mt6765-audio.c       | 34 +++++++-----------
>   drivers/clk/mediatek/clk-mt6765-cam.c         | 33 +++++++----------
>   drivers/clk/mediatek/clk-mt6765-img.c         | 33 +++++++----------
>   drivers/clk/mediatek/clk-mt6765-mipi0a.c      | 34 +++++++-----------
>   drivers/clk/mediatek/clk-mt6765-mm.c          | 33 +++++++----------
>   drivers/clk/mediatek/clk-mt6765-vcodec.c      | 34 +++++++-----------
>   drivers/clk/mediatek/clk-mt6779-aud.c         | 29 +++++++--------
>   drivers/clk/mediatek/clk-mt6779-cam.c         | 29 +++++++--------
>   drivers/clk/mediatek/clk-mt6779-img.c         | 29 +++++++--------
>   drivers/clk/mediatek/clk-mt6779-ipe.c         | 29 +++++++--------
>   drivers/clk/mediatek/clk-mt6779-mfg.c         | 27 +++++++-------
>   drivers/clk/mediatek/clk-mt6779-vdec.c        | 29 +++++++--------
>   drivers/clk/mediatek/clk-mt6779-venc.c        | 29 +++++++--------
>   drivers/clk/mediatek/clk-mt6797-img.c         | 36 +++++++------------
>   drivers/clk/mediatek/clk-mt6797-vdec.c        | 36 +++++++------------
>   drivers/clk/mediatek/clk-mt6797-venc.c        | 36 +++++++------------
>   drivers/clk/mediatek/clk-mt8183-cam.c         | 27 +++++++-------
>   drivers/clk/mediatek/clk-mt8183-img.c         | 27 +++++++-------
>   drivers/clk/mediatek/clk-mt8183-ipu0.c        | 27 +++++++-------
>   drivers/clk/mediatek/clk-mt8183-ipu1.c        | 27 +++++++-------
>   drivers/clk/mediatek/clk-mt8183-ipu_adl.c     | 27 +++++++-------
>   drivers/clk/mediatek/clk-mt8183-ipu_conn.c    | 27 +++++++-------
>   drivers/clk/mediatek/clk-mt8183-mfgcfg.c      | 29 +++++++--------
>   drivers/clk/mediatek/clk-mt8183-vdec.c        | 27 +++++++-------
>   drivers/clk/mediatek/clk-mt8183-venc.c        | 27 +++++++-------
>   drivers/clk/mediatek/clk-mt8192-cam.c         |  1 +
>   drivers/clk/mediatek/clk-mt8192-img.c         |  1 +
>   .../clk/mediatek/clk-mt8192-imp_iic_wrap.c    |  1 +
>   drivers/clk/mediatek/clk-mt8192-ipe.c         |  1 +
>   drivers/clk/mediatek/clk-mt8192-mdp.c         |  1 +
>   drivers/clk/mediatek/clk-mt8192-mfg.c         |  1 +
>   drivers/clk/mediatek/clk-mt8192-msdc.c        |  1 +
>   drivers/clk/mediatek/clk-mt8192-scp_adsp.c    |  1 +
>   drivers/clk/mediatek/clk-mt8192-vdec.c        |  1 +
>   drivers/clk/mediatek/clk-mt8192-venc.c        |  1 +
>   44 files changed, 430 insertions(+), 647 deletions(-)
> 


-- 
AngeloGioacchino Del Regno
Software Engineer

Collabora Ltd.
Platinum Building, St John's Innovation Park, Cambridge CB4 0DS, UK
Registered in England & Wales, no. 5513718

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
