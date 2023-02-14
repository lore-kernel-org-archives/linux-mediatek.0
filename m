Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BB0F6C05027
	for <linux-mediatek@archiver.kernel.org>; Tue, 14 Feb 2023 10:07:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=KHM3B2nFszpjYu+7OzsVwr4R/aA7pqHSH7tj2R/7Bec=; b=4vJt7e0ustRDAlTlj7XkurNwVt
	AHt8rrSQm24ZuR4wwPZFDme8Xy23WTMMJfOHJR+EnmKJBoQSdfvLkWk/4eGN9CGYQgDSSxCQb4req
	Ngnz3JYG3JI9evKNbf9yclu1jxn46lZVgCKZDlM0lbjEACk2XAGNx/qzzy7gMFDTs4fIQKGlpFcW5
	/C008Yxq1mkJh7vL+/w75EWcDPbltQylXca2GvPwE8BkqinhcIUr6pear2WU6DymqxMrI2xXu++Qs
	fVuNxNyCV382BvhCncTvpSsCNbkdiSHyINU6hIrdcBBxgaBZ/RYeJ0vejcKwUITtn+CAcDBYRVOs1
	zbR+kwXg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pRsDp-000trE-MK; Tue, 14 Feb 2023 10:07:37 +0000
Received: from madras.collabora.co.uk ([46.235.227.172])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pRsCS-000t14-SL
	for linux-mediatek@lists.infradead.org; Tue, 14 Feb 2023 10:06:14 +0000
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id 6B793660216A;
	Tue, 14 Feb 2023 10:06:10 +0000 (GMT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1676369171;
	bh=s5SZVvdZQxR5mDQIx9uUkDGglHwSbD6+4806r+qB464=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=J4EQ4j/amiH3pmf/FxzX9tJcPvLnxMW72yTOmIwKMLsYpqZ/sxQWTvbwZoJfKxVql
	 dJeD1tXuDXJObc3SKSxxO4Hjb+Gfv8ls/Zh0dOMWG7ElB0iiWboM2TG9N+ExsawBJR
	 utatCMP1wzxrXwNC7vAs0E3itCqJd3qG5Ygy9SNkSWC0WyVZbl/F1KA9CID786pMb1
	 HAuD2k3YheYLPedZ/hKCO3KJ375cuNovHeKVMcosGRu1ioqUCMu9Ahx2R0UGTNJR1Z
	 AOeJ5vtNU2DFk0pRoxeLDUTsKy9fMPb00ApXsRUMUUBUfgSnHBxCnX6PYlxuutQ1S0
	 x34uLGq7mR7jQ==
Message-ID: <ba391995-014d-3308-53ad-81bbf0fee350@collabora.com>
Date: Tue, 14 Feb 2023 11:06:07 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.2
Subject: Re: [PATCH v2] wifi: mt76: mt7921: fix PCI DMA hang after reboot
Content-Language: en-US
To: Deren Wu <deren.wu@mediatek.com>, Felix Fietkau <nbd@nbd.name>,
 Lorenzo Bianconi <lorenzo@kernel.org>
Cc: Sean Wang <sean.wang@mediatek.com>, Soul Huang <Soul.Huang@mediatek.com>,
 YN Chen <YN.Chen@mediatek.com>, Leon Yen <Leon.Yen@mediatek.com>,
 Eric-SY Chang <Eric-SY.Chang@mediatek.com>, KM Lin <km.lin@mediatek.com>,
 Robin Chiu <robin.chiu@mediatek.com>, CH Yeh <ch.yeh@mediatek.com>,
 Posh Sun <posh.sun@mediatek.com>, Stella Chang <Stella.Chang@mediatek.com>,
 Evelyn Tsai <evelyn.tsai@mediatek.com>, Ryder Lee <ryder.lee@mediatek.com>,
 Shayne Chen <shayne.chen@mediatek.com>,
 linux-wireless <linux-wireless@vger.kernel.org>,
 linux-mediatek <linux-mediatek@lists.infradead.org>
References: <9f4a25c54dc68c941fbbd864e56e1b78868a5a9a.1676342819.git.deren.wu@mediatek.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <9f4a25c54dc68c941fbbd864e56e1b78868a5a9a.1676342819.git.deren.wu@mediatek.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230214_020613_117846_E8CB72FA 
X-CRM114-Status: UNSURE (   7.99  )
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

Il 14/02/23 03:49, Deren Wu ha scritto:
> mt7921 just stop some workers and clean up chip status before reboot.
> In stress test, there are working activities still running at the period
> of .shutdown callback and that would cause some hosts cannot recover
> DMA after reboot. To avoid the floating state in reboot, we use
> mt7921_pci_remove() to fully deinit all resources.
> 
> Fixes: f23a0cea8bd6 ("wifi: mt76: mt7921e: add pci .shutdown() support")
> Signed-off-by: Deren Wu <deren.wu@mediatek.com>

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>




