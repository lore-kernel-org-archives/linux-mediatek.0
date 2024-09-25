Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E44B2C369A8
	for <linux-mediatek@archiver.kernel.org>; Wed, 25 Sep 2024 08:19:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=W9AVjJXlVNsdDdiooZI6SytFhmiFAlrIX0gpE9bjm5I=; b=xdDBVuoEyfCMOmpmmEFT77ZyR9
	YtJwluEJybvDHjdVOodm/W4RKMSiKOUtA5mb+SDcdC6M7zraGmiqhe/acjVYoHKREp9BQMdpt0s2n
	SOjYvrZaevF2zL+ATuSXYnlmHK0r+LuVIvO3LU331Q7Xx0bwmqB5zf4ytVQmpIL4wYsgDBdbvEfEt
	eGQu+d3IpA5ip88tRdMQuL/TPI0fmZtip4cGioyRuQfBxN8QwE9hMbwBocnTdv1iuYiqLPaLWCW24
	EbQ6+rDx6fVds/VVrUg+Z8djypHWAl8Ofmm9tFYHgDwc+pyU1P5FhDTVsxS14xHWWl+fBiAIsvUBi
	BckjsmJA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1stNFP-00000004UAM-3FhS;
	Wed, 25 Sep 2024 08:19:43 +0000
Received: from nyc.source.kernel.org ([147.75.193.91])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1stNEF-00000004Tvp-1L14;
	Wed, 25 Sep 2024 08:18:32 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 9B55AA435E7;
	Wed, 25 Sep 2024 08:18:21 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B2217C4CEC3;
	Wed, 25 Sep 2024 08:18:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1727252309;
	bh=RUsSczpAQhjEZF2llEwXsNcte5FrVgymGy0NJjooLZ8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=RGTZH0chrp9C23KPq4ZCeEayg+95LwkRcwlpHaCcYLLd+t5PDRO9BQPwGx09zlFig
	 GZrh/2ujIA81v3Ke+PZ4CfeMd472AtFttJMi88H6ynarqmjCf1kzhvXdn5yDjBR+rq
	 RNdJkXCrYm0uHOymki/Akhjv6pFIx6rXrLsJZTCnEBLEUjtVgJ8WLx01evHwIlOrYt
	 Uh0pv81vt9hU7SGx+LskuF3yHJ0mZmrO/efoHLXwLKFO0FMxK5vK+kBhLry2qTRbtm
	 437ch9Y1lN+A6Ie8DhxNWWVODveNJr4oI+3v/YXje4RNvdwm8oW4u1mJGHoZ+//Xhy
	 qytltr+03SIyQ==
Date: Wed, 25 Sep 2024 10:18:24 +0200
From: Andi Shyti <andi.shyti@kernel.org>
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: "zoie.lin" <zoie.lin@mediatek.com>, Qii Wang <qii.wang@mediatek.com>, 
	Matthias Brugger <matthias.bgg@gmail.com>, Project_Global_Chrome_Upstream_Group@mediatek.com, 
	linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org
Subject: Re: [v1,1/1] i2c: mediatek: add runtime PM operations and bus
 regulator control
Message-ID: <duauce4b6hlugfo6yelviaflkktfaix6g2kd2yqgdv5o36nhh4@despelul5fq5>
References: <20240920143627.23811-1-zoie.lin@mediatek.com>
 <20240920143627.23811-2-zoie.lin@mediatek.com>
 <33dc7f60-4364-4d7a-a66b-4bd881b41675@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <33dc7f60-4364-4d7a-a66b-4bd881b41675@collabora.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240925_011831_443844_C38D7CF9 
X-CRM114-Status: GOOD (  10.33  )
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

Hi,

...

> > @@ -1486,19 +1530,22 @@ static int mtk_i2c_probe(struct platform_device *pdev)
> >   	if (ret < 0) {
> >   		dev_err(&pdev->dev,
> >   			"Request I2C IRQ %d fail\n", irq);
> > -		goto err_bulk_unprepare;
> > +		goto err_clk_bulk_unprepare;
> >   	}
> > +	pm_runtime_set_autosuspend_delay(&pdev->dev, 1000);
> 
> One full second as autosuspend delay? Can this be shortened to 500? 250?
> 
> How was the one second wait chosen?
> 
> How much time does mtk_i2c_runtime_resume() take to resume the bus?

Besides that, please add a comment to explain why you chose
1000/500/250. Arbitrary values are not much appreciated.

Thanks,
Andi

