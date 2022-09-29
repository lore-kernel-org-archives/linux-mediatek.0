Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E7F9FC04A95
	for <linux-mediatek@archiver.kernel.org>; Thu, 29 Sep 2022 08:27:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=16RfkTKsIE2k7duLh80HnFOTlZLasZhUimPOAfse90I=; b=d8I5fEv6FLL08i9Uxq9UHXthZj
	zafPJ7jMVMPmSs1OCPAskPKoWwo48I/yF8/YabVsVZQYSow6pOzn7nniSVIiDMnhOPr9KK0LG+dOE
	A2UDUJM9/8TtvHZr9wAu5rM5bY9xmR6nn3GR5XFWOrkwq4afj9bXjBeGZaBe96fuM7Kqa7LLGM87h
	vBefcLfv0EXpQZRkRfXKvaxv7oScGc7zbQ5XC3ssVK0ff7cpyslxJOpjYIQw5nDOdzhs2yzeDaZ13
	Clf9CoE/kMf6EKRwavu98fUvRPycuXiGTx5WG0pggzY78/OUVNyE/BUKEFmVs5kYf7eeSFiHaMQvR
	5fhujc3w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1odosh-001omd-Ny; Thu, 29 Sep 2022 08:26:55 +0000
Received: from madras.collabora.co.uk ([46.235.227.172])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1odori-001oLb-Iq; Thu, 29 Sep 2022 08:25:55 +0000
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id F236C66022A4;
	Thu, 29 Sep 2022 09:25:52 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1664439953;
	bh=T14ztLUs3rI8WCYFeVow59cGotkbxkhfqFyrn4lich4=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=dkIMSdX2YSzFIAgYHMUXlbqpO7RE+ykm5Pd5VlsmxdNEkHq5sRgX3fM8OY3P3okmH
	 r8FFuF+GnO13BuoSdixsW4DQUVF9b9GS7QM3WPZqeWvp43OK50/VBnRJRyBhtUnaUR
	 av/YxpPC56e1DVb5OaMe/4Kx6TYIF9kEk3XdOuVEOXJfOu2PEqOm8ekH45xbVPsDfD
	 NhEXMMyRzyLRt8XPE7Zb3eUzOjpPD5zsKrp31ED+ffeDt62vjnz/8d+A9rfZxP6dvj
	 mBz37t42S9wdT6DSKltNQcVl1TOUJCTINoKXn8YzgbIAhkTkyuq5qyKRqLhTyaLfEv
	 LWxnqh29pdY3Q==
Message-ID: <31b6c672-a11a-9317-49e2-9be910edfefb@collabora.com>
Date: Thu, 29 Sep 2022 10:25:50 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.0
Subject: Re: [PATCH 1/8] soc: mediatek: mtk-svs: clean up platform probing
To: matthias.bgg@kernel.org, roger.lu@mediatek.com, jia-wei.chang@mediatek.com
Cc: nfraprado@collabora.com, khilman@baylibre.com,
 linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org,
 Matthias Brugger <matthias.bgg@gmail.com>
References: <20220928155519.31977-1-matthias.bgg@kernel.org>
 <20220928155519.31977-2-matthias.bgg@kernel.org>
Content-Language: en-US
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <20220928155519.31977-2-matthias.bgg@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220929_012554_791263_6075F775 
X-CRM114-Status: UNSURE (   8.03  )
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
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Il 28/09/22 17:55, matthias.bgg@kernel.org ha scritto:
> From: Matthias Brugger <matthias.bgg@gmail.com>
> 
> We only ever call the SoC specific probe function from
> svs_platform_probe. No need to carry that function in a global
> datastructure around.
> 
> Signed-off-by: Matthias Brugger <matthias.bgg@gmail.com>

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>



