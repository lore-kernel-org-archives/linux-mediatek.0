Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B293ACED63E
	for <linux-mediatek@archiver.kernel.org>; Wed,  9 Oct 2024 09:45:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=tuEiiQXW6gN/FW5ov0IqIjZ3ag14SorxuIumTsTzVx8=; b=w49R1eYZsEkspNT5lXQHV1Ds2A
	yxMxSjJJmCrRpDwb+Sms1Lr707ykaqheDqg/fq7cR4+tw1T2hpjHR8gcZJrYsk/t5yWJY/hArDOLt
	omal2/hCa9RqOdpMdUQMfn4Hl77dd7cs9rWV5tvoHE4tGDx+KEZKnuIZmEg60ThyBnPoLSXJsjmpN
	ioaFUnQylhRIJkjpho9VKZDvdL+uJQwxM07JkMWVJli/V2z7bX55d1JGM2RoWDGx15hqRaXpCS7s1
	Fb93hIYecinAFNM3jl6BScmU20DHfe76UsMW6iDg0yYdn4Yi94DNnUj7KwyzgeHSCea/oBszBPd1y
	l5mE4XCQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1syTG6-00000008jmE-0I4A;
	Wed, 09 Oct 2024 09:45:30 +0000
Received: from bali.collaboradmins.com ([148.251.105.195])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1syTEj-00000008jWn-3E6i;
	Wed, 09 Oct 2024 09:44:07 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1728467043;
	bh=Z3iinUjgnAvC1S95E+xKJvY9e95ZF0aoef8w+t7z4Lg=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=F/WLdswvR0RLYChmpOxzQ8J66bjMJ5ClcudqSqQ1VOXUfcSWUxw+DZaE3gSjUgj8I
	 C5+CErRmXg0sbc010nABjdQpKE8ygLc944c0rtOA5UiomXeUCH0ufVMnSjp7ZUzg+h
	 YCj1qxnbvh7A2OSujxBxCwMSgP2ANUiCVf3wZXevgGzUT3HYXIy9KUc/df28dGE5GL
	 CS8Ddg7wfvkDIOy2/4VEEs/OD729xLPfiUFkWIWW0eHskMXJ2gjfO4VapoB30woKpA
	 OpnEUzsFnJs6Oobvrd3wFsV4bmXlNFrvFm3cOwNJzgnBPSuRBF2G00bFSg5ee3w8l3
	 b5MvI81wL6kXQ==
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id B3C1417E120F;
	Wed,  9 Oct 2024 11:44:02 +0200 (CEST)
Message-ID: <37648a24-03be-4acc-bfba-cf0ecb4b8f91@collabora.com>
Date: Wed, 9 Oct 2024 11:44:02 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v9 3/3] pmdomain: mediatek: Use OF-specific regulator API
 to get power domain supply
To: Chen-Yu Tsai <wenst@chromium.org>, Ulf Hansson <ulf.hansson@linaro.org>,
 Matthias Brugger <matthias.bgg@gmail.com>, Mark Brown <broonie@kernel.org>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-pm@vger.kernel.org, Douglas Anderson <dianders@chromium.org>,
 Johan Hovold <johan@kernel.org>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Pablo Sun <pablo.sun@mediatek.com>, Macpaul Lin <macpaul.lin@mediatek.com>,
 Sebastian Reichel <sebastian.reichel@collabora.com>
References: <20240930044525.2043884-1-wenst@chromium.org>
 <20240930044525.2043884-4-wenst@chromium.org>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <20240930044525.2043884-4-wenst@chromium.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241009_024405_996356_FA16A843 
X-CRM114-Status: GOOD (  16.37  )
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

Il 30/09/24 06:45, Chen-Yu Tsai ha scritto:
> The MediaTek power domain driver contains a hack that assigns the device
> node of the power domain to the struct device of the power domain
> controller in order to use the devres regulator API.
> 
> Now that there is a proper OF-specific regulator API, and even a devres
> version, replace the hack with proper code.
> 
> This change is incompatible with incomplete device trees. Instead of
> assigning the dummy regulator in cases where the power domain requires
> a supply but the device tree does not provide one, the driver will just
> error out. This will be seen on the MT8390 EVK, which is missing
> supplies for the IMG_VCORE and CAM_VCORE domains. And likely all the
> MediaTek EVBs, which have no power domain supplies specified. This is
> however the correct behavior. If the power domain's supply is missing,
> then it should not work. Relying on other parts of the system to keep
> the unattached regulator enabled is likely to break in ways less easier
> to understand.
> 
> Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>


