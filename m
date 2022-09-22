Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 80C78C6FA82
	for <linux-mediatek@archiver.kernel.org>; Thu, 22 Sep 2022 11:26:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ioX9JrjBVDaJM6+VmB6UCP57bswCy2m471sF45g6WU4=; b=RuhI981FW6T+d11n7TXmcjhThG
	KP0Tl9ZbXhUkBS12ufr5vYHOUuvNrsG7xWhfRjCh72IcFH3qTX88e/wftGpz1inXB3efxzmlAMwLO
	Ma8Z3IsJ0aP6ypwVanHtky9ACuwyKBlwvU1sOScHCQSMLhBYb8+eCzOzTDpdJO9hLDfJtOf9jY/p2
	YvFlRJkLdncmLXiCbaNL3oFyYCuXC96cFsEFyobex8fxwh3CznNw5m6DMcYuhdN9fRpQ93jMtMBPu
	8HLKYfMOBPm6WafKhEwH1iBOAEbHa1lmTXhcVAe1iaueH3dCM2/XHOK7Xvjc/TLjEVbLt8JRrDE7b
	+2kA3Ymg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1obKLo-00F9Du-0B; Thu, 22 Sep 2022 11:26:40 +0000
Received: from ams.source.kernel.org ([145.40.68.75])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1obKLd-00F9Bm-4t; Thu, 22 Sep 2022 11:26:30 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id 06474B81AE4;
	Thu, 22 Sep 2022 11:26:27 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 19E81C433C1;
	Thu, 22 Sep 2022 11:26:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1663845985;
	bh=r0sKRJGzevBgLu3Rbdi7fUNAHgKJFzt2opqHR0c7spk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=iRE4bI8A+0TnU1wE7Y8MT4qGFHaCrSvtI83L17WLv8Efu67EmK61r7AvprBhit1/U
	 fr+VL/x0UinsCEj1F7wbkhrvvCD8dcUJXTJhKQxZk+NStLPNKF86qOO++Xl6AOPuND
	 cY+4r6dYgdIJuln4W/atj2FZ7zrtzjXW1MuzDufYESpEuu1wYVqGwsiZq9v5lP86mW
	 n0qcCkKyFlXs5pbba3kb0fTaswhqW/ia066CwIY8xIKa5CdHp99qSXkaJ8DWqWYSbG
	 P4Mu7ocJKB1E8dMCLbk1Zk9bPDgjao1CoOyk2fXQoUa0B6uf6mxGaykpVPw/5a9Q0F
	 arknxZp/qNlJw==
Date: Thu, 22 Sep 2022 19:26:21 +0800
From: Tzung-Bi Shih <tzungbi@kernel.org>
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: broonie@kernel.org, alsa-devel@alsa-project.org,
	linux-kernel@vger.kernel.org, tiwai@suse.com, lgirdwood@gmail.com,
	linux-mediatek@lists.infradead.org, trevor.wu@mediatek.com,
	matthias.bgg@gmail.com, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH] ASoC: mediatek: mt8195-mt6359: Use snd_soc_pm_ops
 instead of custom ops
Message-ID: <YyxGXXSp2JD9a6ah@google.com>
References: <20220922103502.49981-1-angelogioacchino.delregno@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220922103502.49981-1-angelogioacchino.delregno@collabora.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220922_042629_391187_22677ABB 
X-CRM114-Status: GOOD (  12.00  )
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

On Thu, Sep 22, 2022 at 12:35:02PM +0200, AngeloGioacchino Del Regno wrote:
> -static const struct dev_pm_ops mt8195_mt6359_pm_ops = {
> -	.poweroff = snd_soc_poweroff,
> -	.restore = snd_soc_resume,
> -};
> -
>  static struct platform_driver mt8195_mt6359_driver = {
>  	.driver = {
>  		.name = "mt8195_mt6359",
>  		.of_match_table = mt8195_mt6359_dt_match,
> -		.pm = &mt8195_mt6359_pm_ops,
> +		.pm = &snd_soc_pm_ops,

snd_soc_pm_ops[1] sets some more fields.  I'm not quite sure whether
it would introduce any side effect or not.  Perhaps Trevor could
provide some suggestions.

[1]: https://elixir.bootlin.com/linux/v5.19.10/source/sound/soc/soc-core.c#L2150

