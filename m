Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7A950C64ED6
	for <linux-mediatek@archiver.kernel.org>; Wed,  1 Mar 2023 11:11:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=qyhklXkRh1kxLAQGue92VwiEQB6z+bbDjgnuTBjaNVQ=; b=xa1Zwp8hUtr8nf6qhx5lkfrqsm
	LclLFoc1XgjYGqab3T5YDme/E87kZGVrKe3qjF8BEvIMnSo2LgpkHUHvMOslmKRF0ZWostPLISVpl
	bLGgVZxn8+GqF+56xVE7jVm9hlT9/slXRGh76kbWXsXlZAKr54O1W3uMYsW7kiUBAgvI7FDDi7kaW
	Tfqkfh6ErRZntbbTwLWqBgpECvZhyMUlZPzqwm5RsNbDaTfyZ6D6g/NfVZNo5iME+AHN9rFS9zsfK
	AeSAs0GfQFZ0QkYiLfbpKS1S3Am89ljapNt78pRf/u0gmNWTMwjf5cdO5dsdt817ZHFE/VwMObK+e
	Ibx92OTQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pXKMn-00FsYf-VR; Wed, 01 Mar 2023 11:11:25 +0000
Received: from madras.collabora.co.uk ([46.235.227.172])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pXKMQ-00FsOK-R1; Wed, 01 Mar 2023 11:11:07 +0000
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id C10A26602119;
	Wed,  1 Mar 2023 11:10:57 +0000 (GMT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1677669058;
	bh=eTzm+EIAjQcoyhPrp2GjtRD4G6+LecRvF0U2zjS/gWI=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=lVebGzc7EXXg57QxAJY8TSgbomC8z/uuRcUJCDyjanimBugLk1aa/j0Hk6OUwe1Xf
	 9B3TNWcQJDX8Hx83MU7TDiLzMIkWRPuM8J4L2b8tAErqpa0Zgbnpdp+knn1T/cTWsx
	 07HzAGuMu3T9L1WfEIBzdSrkaRYGdC2BuKceOz6sWRWzGdvzpXliLZZzSWssspGi7g
	 fh4gqh/zAgAQO6Vnh4HQM/j1v+4zEw9OgNpz7MF25PtcZMmIb7dw6fiw1AXfwWKLSt
	 8Ssup+fNGEvcNie4yXyZJhRgWIMqnYDdjCU0rMAXlchXynaHiBkyXtxTfAoI3zKL7s
	 nxGY/P4MKoHyg==
Message-ID: <0c26685f-225a-8ef9-a4c4-0afaf9deb742@collabora.com>
Date: Wed, 1 Mar 2023 12:10:55 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH v2 1/2] ASoC: mediatek: mt8188: add missing initialization
Content-Language: en-US
To: Trevor Wu <trevor.wu@mediatek.com>, broonie@kernel.org,
 lgirdwood@gmail.com, tiwai@suse.com, perex@perex.cz, matthias.bgg@gmail.com
Cc: alsa-devel@alsa-project.org, linux-mediatek@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20230301110200.26177-1-trevor.wu@mediatek.com>
 <20230301110200.26177-2-trevor.wu@mediatek.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <20230301110200.26177-2-trevor.wu@mediatek.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230301_031103_049212_0C0F97D6 
X-CRM114-Status: GOOD (  12.04  )
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

Il 01/03/23 12:01, Trevor Wu ha scritto:
> In etdm dai driver, dai_etdm_parse_of() function is used to parse dts
> properties to get parameters. There are two for-loops which are
> sepearately for all etdm and etdm input only cases. In etdm in only
> loop, dai_id is not initialized, so it keeps the value intiliazed in
> another loop.
> 
> In the patch, add the missing initialization to fix the unexpected
> parsing problem.
> 
> Fixes: 2babb4777489 ("ASoC: mediatek: mt8188: support etdm in platform driver")
> Signed-off-by: Trevor Wu <trevor.wu@mediatek.com>

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>


