Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C100FC43334
	for <linux-mediatek@archiver.kernel.org>; Wed, 22 Jun 2022 13:53:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=fJzYvTPSxzKEm4NV5gnTY8D7n5OVij8lNJswaYujAMI=; b=pFSCAipkZC7DXk3forULo3Ruhu
	pANylmJZgafa7oCwh5u1S5c0WZxbdZ/S1J4iJ0ncTF8gHyTNowc574Yu9y+sZ7uesrTvThgNBDgGP
	JIe/x5zuWNBpoLWTy3T8y/wGPohutzp6kVHQm96JW+cgzJ3mWvVIyltPSv1Qfi5zXWVSjsapJ886/
	0Voy7HZeBaR+3GI4uXaSQOJEjRmpUs1qX2606zO24FPhOuz3FQY23wO7udXLbHRZoEkAUUNuSkMeW
	MwZd0ni6HkJMS6mSGXSe0JByNkUWCTIb45eFm6Uq05UidxFjtqeBv+wS2kDJR1Q32OFy5uRih/n4x
	cbfZ4LcQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o40nP-00Aj7L-N9; Wed, 22 Jun 2022 13:53:27 +0000
Received: from madras.collabora.co.uk ([2a00:1098:0:82:1000:25:2eeb:e5ab])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o40nC-00Aj2c-0v; Wed, 22 Jun 2022 13:53:15 +0000
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id B2E3766016D1;
	Wed, 22 Jun 2022 14:53:10 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1655905991;
	bh=HhcnnDq4beNtScTMb3h4VkbecdlE9lMBTPsEFrZW0n0=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=iVMNDQFf9pL9Oze0QR5fsQ5tXYq+ypFB8D+RRhc3Lo3FR90qs8PjhorqD/2KiLOW3
	 bvyNIvm+QoCHQgQ2nAJf+hx5Wmqx2tSFwKtv2dmTgFxnCIVfm5nLLErkjth4Zvrfm5
	 v/zvS3DNkgINyheqUXu44yoVIP4Upz9cUnjFqG9GLrZW9XIr5yeqHSX88QU9zd46to
	 HaStmFNoTQBSAJDrYPvB/FeGZ8dDGprBEVPI0nUVVeiFm6C8iVEFN/f9WdaTgxV9Z6
	 H4vBoisLJ3dGIH5OtDaoTPzG6e24PdsKuPe7T9h6ggN2S1/RbF6DAColJufPDJjmRs
	 7HOfPnlpFjvag==
Message-ID: <b587116e-712e-07a5-cc83-457de768835b@collabora.com>
Date: Wed, 22 Jun 2022 15:53:07 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Subject: Re: [PATCH 0/3] leds-mt6323: Make driver flexible and cleanups
Content-Language: en-US
To: sean.wang@mediatek.com
Cc: pavel@ucw.cz, matthias.bgg@gmail.com, linux-leds@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 linux-kernel@vger.kernel.org, kernel@collabora.com
References: <20220516094222.30414-1-angelogioacchino.delregno@collabora.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <20220516094222.30414-1-angelogioacchino.delregno@collabora.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220622_065314_271535_34ED8F46 
X-CRM114-Status: GOOD (  14.55  )
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

Il 16/05/22 11:42, AngeloGioacchino Del Regno ha scritto:
> MT6323 is not the only PMIC that has a LEDs controller IP and it was
> found that the others do have a compatible register layout, except
> for some register offsets.
> The logic contained in this driver can be totally reused for other
> PMICs as well, so I can't see any reason to keep this specific to
> the MT6323 part.
> 
> This series brings meaningful platform data to this driver, giving
> it flexibility and making it possible and straightforward to add
> support for other (older, or newer!) PMICs.
> 
> AngeloGioacchino Del Regno (3):
>    leds: leds-mt6323: Specify registers and specs in platform data
>    leds: leds-mt6323: Open code and drop MT6323_CAL_HW_DUTY macro
>    leds: leds-mt6323: Drop MT6323_ prefix from macros and defines
> 
>   drivers/leds/leds-mt6323.c | 258 ++++++++++++++++++++++++-------------
>   1 file changed, 166 insertions(+), 92 deletions(-)
> 

Gentle ping on this series...

Thanks,
Angelo

