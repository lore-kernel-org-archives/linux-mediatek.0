Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ADE27CD342C
	for <linux-mediatek@archiver.kernel.org>; Tue,  3 Sep 2024 07:53:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:In-Reply-To:Date:References:Subject:Cc:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=CtNmo9re+7Yvhm1wct00g9dYy6n+zo3R/1J33fswy0I=; b=a4ugq4AELcIbcUaual1t/PU5Y+
	AwbaCW8BudosoE4IwV+tLM0Z5lz5XzR69ePDZX06+zMKhEeC+u0e3SOGOl7MSmGxDLcc68cBt7ymE
	ndfVt1IWf7kQD2/fsoTbLETdfokuIu5xSsnQPMq68Ce41AK1wtrN2+6RdN4/+g13D1W1mhn1PVUjh
	JN9iAf2JWQbXt0pKaAuAkMU7lkMfO2e9upVnmFuUWYFn/4EhlX48qCH/a0HR/QwHZcpSyfKe7z1CT
	i5gjwZ05oa48N48NHauK9c6t0pW+fJXvfeo8+ZrQglmJlJH6jVMGXYdTD8n52pKCYnXO0YOM9kUbW
	i4Qzj9xw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1slOM6-0000000Gm3P-0j93;
	Tue, 03 Sep 2024 07:53:38 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1slOJZ-0000000GlOp-0Fhw;
	Tue, 03 Sep 2024 07:51:02 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 0A6165C5666;
	Tue,  3 Sep 2024 07:50:57 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 74599C4CEC5;
	Tue,  3 Sep 2024 07:50:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1725349860;
	bh=enMEnSyK0jNHPU7yp7IVPrx6oVxfPhkG/5GIYZ4dcKg=;
	h=From:To:Cc:Subject:References:Date:In-Reply-To:From;
	b=PO3adIGD9QXcaLxsn+UYkxTFEniu9l4gE1ID45KjMX3yLkH5DazB0u1IBB4d8vzLd
	 l/5Fwl56gGpveG03eWt1WQIQ6p0u20PAR8qsqMsWDFDjeWnjFgGB4yB8ZntUoCyOYk
	 i1+EQxTEc6gtNRk1puU0jPx9BWXqfdunZoZ0ergRNWaqwnEHL5xHi1KHsIv+qHZc85
	 omyj9bce8K6nzb1MAWzf5BhEH6LvF2uxfoINz0TUt+DwPYibmNnq3U6fpx8Lbbch+5
	 5irOVssMvG9hSRB0/kkowIxiu22jDabPJAvw/Pw/5ooAs73F4bifl/MVu3exXaWGme
	 Picnt1dGInvMg==
From: Kalle Valo <kvalo@kernel.org>
To: Ma Ke <make24@iscas.ac.cn>
Cc: nbd@nbd.name,  lorenzo@kernel.org,  ryder.lee@mediatek.com,
  shayne.chen@mediatek.com,  sean.wang@mediatek.com,
  matthias.bgg@gmail.com,  angelogioacchino.delregno@collabora.com,
  mingyen.hsieh@mediatek.com,  deren.wu@mediatek.com,
  ruanjinjie@huawei.com,  greearb@candelatech.com,
  akpm@linux-foundation.org,  linux-wireless@vger.kernel.org,
  linux-kernel@vger.kernel.org,  linux-arm-kernel@lists.infradead.org,
  linux-mediatek@lists.infradead.org,  stable@vger.kernel.org
Subject: Re: [PATCH RESEND] wifi: mt76: mt7921: Check devm_kasprintf()
 returned value
References: <20240903014455.4144536-1-make24@iscas.ac.cn>
Date: Tue, 03 Sep 2024 10:50:54 +0300
In-Reply-To: <20240903014455.4144536-1-make24@iscas.ac.cn> (Ma Ke's message of
	"Tue, 3 Sep 2024 09:44:55 +0800")
Message-ID: <87wmjtjhup.fsf@kernel.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240903_005101_164601_6F2F521B 
X-CRM114-Status: GOOD (  15.69  )
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

Ma Ke <make24@iscas.ac.cn> writes:

> devm_kasprintf() can return a NULL pointer on failure but this returned
> value is not checked. Fix this lack and check the returned value.
>
> Found by code review.
>
> Cc: stable@vger.kernel.org
> Fixes: 6ae39b7c7ed4 ("wifi: mt76: mt7921: Support temp sensor")
> Signed-off-by: Ma Ke <make24@iscas.ac.cn>
> ---
>  drivers/net/wireless/mediatek/mt76/mt7921/init.c | 2 ++
>  1 file changed, 2 insertions(+)
>
> diff --git a/drivers/net/wireless/mediatek/mt76/mt7921/init.c b/drivers/net/wireless/mediatek/mt76/mt7921/init.c
> index ef0c721d26e3..5ab395d9d93e 100644
> --- a/drivers/net/wireless/mediatek/mt76/mt7921/init.c
> +++ b/drivers/net/wireless/mediatek/mt76/mt7921/init.c
> @@ -52,6 +52,8 @@ static int mt7921_thermal_init(struct mt792x_phy *phy)
>  
>  	name = devm_kasprintf(&wiphy->dev, GFP_KERNEL, "mt7921_%s",
>  			      wiphy_name(wiphy));
> +	if (!name)
> +		return -ENOMEM;
>  
>  	hwmon = devm_hwmon_device_register_with_groups(&wiphy->dev, name, phy,
>  						       mt7921_hwmon_groups);

You sent the previous version of this on August 26th:

https://patchwork.kernel.org/project/linux-wireless/patch/20240826095535.2603538-1-make24@iscas.ac.cn/

Please stop spamming like this and understand that maintainers are busy.

-- 
https://patchwork.kernel.org/project/linux-wireless/list/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches
https://docs.kernel.org/process/submitting-patches.html

