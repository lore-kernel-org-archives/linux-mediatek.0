Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0074CC433F5
	for <linux-mediatek@archiver.kernel.org>; Wed, 16 Mar 2022 02:32:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=sz1iiqBCAFUzaE4WYG0HwhA+9jdfZT6ALCVu+DnaHyI=; b=NbOUdhGvzImYo2
	zj+XTk+z/kBgOqaaJYKoDjkJDExhrZbJ4KY83yXZq2VNcTaT+m8EzUJjuTSNcLEaoSNyubCyuw0tb
	NCyaZZC1hz8EAIE4OAUW5R4eA/jccZEkliE0AMUVrYzE44gUVuIv/Nx0+EhigFOn1hJhRjW21Dvxz
	DFOoZATWVrkPDICRQNx29nJubf6R0ycJv5lCsCQu5H135cRfdpQITsMux9htLyCVBLtaH7iakLhHx
	xVnTX8SiJLYbBlLCgt6dCe8p6DewfGgaVIBG7/bDDz7c5OWYaHtrBoITZ3tYNVWaws6FT4whqatIo
	4z35Kv8eR9Pli2BOVwXw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nUJSm-00BDAq-O0; Wed, 16 Mar 2022 02:32:36 +0000
Received: from ams.source.kernel.org ([2604:1380:4601:e00::1])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nUJSa-00BD8K-9n; Wed, 16 Mar 2022 02:32:25 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id E98B1B819DE;
 Wed, 16 Mar 2022 02:32:21 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8E3CBC340E8;
 Wed, 16 Mar 2022 02:32:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1647397940;
 bh=JlWuwsVAf8tixVVfAj7k3At1hsOc2H52eSxmDWkWpNE=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=qi4zpYKrUUrbZLKM+Xl0nS5aG1eZ4vTX/qCHb5xZQd4h2K4CZaJPT1O3J8f4cuQmO
 ikj643PaI0do9JOx4U2u20nixZmCCxYuFzyRXN69OlhnqPurTuTfA9dQQW1ARw+Aol
 KrNmCKUUJhcFAdjc+xxLaBYPXIsPsze9agB9ApcFHB3/35FGDi8F3WHpVM3l1sIbw5
 RijlwULauuXFxRWs85GucfaVVoAI8vfxYmrlpklI3lk3kptoCMXwPZhbtiBcFUrXB9
 ykvLNpzHC1kX8zWNLMV3btNhs/7fH8zY80RnvNRhH9j6CWIaJi55cHaRMGGDpeUXRU
 7BCfWIauqWRBg==
Date: Wed, 16 Mar 2022 10:32:16 +0800
From: Tzung-Bi Shih <tzungbi@kernel.org>
To: Miaoqian Lin <linmq006@gmail.com>
Cc: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Jiaxin Yu <jiaxin.yu@mediatek.com>,
 Shunli Wang <shunli.wang@mediatek.com>, alsa-devel@alsa-project.org,
 linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] ASoC: mediatek: Fix error handling in
 mt8183_da7219_max98357_dev_probe
Message-ID: <YjFMMEniUVlb1QsX@google.com>
References: <Yia5XgkGyLbIRc1f@google.com>
 <20220316014059.19292-1-linmq006@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220316014059.19292-1-linmq006@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220315_193224_536314_218373D1 
X-CRM114-Status: GOOD (  16.16  )
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

On Wed, Mar 16, 2022 at 01:40:57AM +0000, Miaoqian Lin wrote:
> The device_node pointer is returned by of_parse_phandle()  with refcount
> incremented. We should use of_node_put() on it when done.
> 
> This function only calls of_node_put() in the regular path.
> And it will cause refcount leak in error paths.
> Fix this by calling of_node_put() in error handling too.
> 
> Fixes: 5bdbe9771177 ("ASoC: mediatek: mt8183-da7219: use hdmi-codec")
> Fixes: ebbddc75bbe8 ("ASoC: Mediatek: MT8183: Add machine driver with DA7219")

Again, I am not sure if the Fixes tag makes sense.  Although the issue was
there when the driver birth, there are some more commits after then.

Given that:
- The patch is a minor fix (see [1][2]).
- There is no specific commit the patch aims to fix.
I prefer to drop the Fixes tags.  In any case, I don't think the tags would be
helpful.

I would defer to Mark.

[1]: https://elixir.bootlin.com/linux/v5.17-rc8/source/include/linux/of.h#L129
[2]: https://elixir.bootlin.com/linux/v5.17-rc8/source/drivers/of/Kconfig#L55

> Signed-off-by: Miaoqian Lin <linmq006@gmail.com>

Reviewed-by: Tzung-Bi Shih <tzungbi@kernel.org>

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
