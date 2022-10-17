Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 74A8EC43219
	for <linux-mediatek@archiver.kernel.org>; Mon, 17 Oct 2022 09:55:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=qDStrmhJLQQiKlNnei+g685omE97wrR3T9mBXZH41BA=; b=plojqowpvAb2Uu2Y00+kiD96BY
	XZ+kiQkj7E+xZqugQ+KBvmthDlgTmk5x8/icgN+GYi3WPfjxlfgxI2X95uFHXG5ye621IkF6DwFxW
	c9MzR1E1oHPJ5BcAI2TrBOXzNIvFW4zqKw4lGF7zkpv1YgyRv9+DXXgqqvNVhHXB/Y69mibaqZaxQ
	0KCf01y/E2JZGu+ij3YXlQyKIMWqVWoT3iLFCeI0JbAfuiYwSxhHD/igpSp4JDpU6ne3EML4MGHcy
	TP9IP4ZMfpJoDPrOBI41Ugu+/mBhMBnLBsAIWAwKxNqoYmARbSUnUpehi01cnbBtCafpNqaBJ+NlL
	i9buRdDg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1okMq0-00A2GX-4z; Mon, 17 Oct 2022 09:55:12 +0000
Received: from madras.collabora.co.uk ([2a00:1098:0:82:1000:25:2eeb:e5ab])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1okMpw-00A22s-U3
	for linux-mediatek@lists.infradead.org; Mon, 17 Oct 2022 09:55:10 +0000
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id 67A596600357;
	Mon, 17 Oct 2022 10:55:07 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1666000507;
	bh=mkjOjjOXCXqris3rbpAafu+DINsdWCcTHpAeTHhUQC4=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=jJ7w7y7Azm2L2STCUpXOif78aQi1DGv546+HPTeB9o0yLNcK3k1XqMo5ODYHJnTqJ
	 sKeKwlnUPDa5gNCHIBlLHI7DAya3VOoHLFboM4KrkktMWQg8WHaxvaPf5TfOgwWjq1
	 MK4gFrooagjqQsGG3Ne52Tat+khr4xvnUJjSkAW4MdBBVjvx31xMRD2SwWuQXO3JAH
	 EdcC3zfnRACeyG2ematgXyBgB0XhS2uKzGkWBYaFIE500k8zKMns136+GnGyqrDu7Q
	 L+1CWNf9xTD+0NeV/7t8Gn2FzFZ6iaPkOASEr396hJZoRD2Rxf8tYcG6wQOYrpujgY
	 e3ArMpfWuvtog==
Message-ID: <ad7840dc-f4d9-18c7-cc1c-91e5c0dfa4a6@collabora.com>
Date: Mon, 17 Oct 2022 11:55:04 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.3
Subject: Re: [PATCH net 3/3] net: ethernet: mtk_eth_wed: add missing
 of_node_put()
Content-Language: en-US
To: Yang Yingliang <yangyingliang@huawei.com>,
 linux-mediatek@lists.infradead.org, netdev@vger.kernel.org
Cc: nbd@nbd.name, davem@davemloft.net
References: <20221017035156.2497448-1-yangyingliang@huawei.com>
 <20221017035156.2497448-4-yangyingliang@huawei.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <20221017035156.2497448-4-yangyingliang@huawei.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221017_025509_149974_76E230A8 
X-CRM114-Status: UNSURE (   6.32  )
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

Il 17/10/22 05:51, Yang Yingliang ha scritto:
> The device_node pointer returned by of_parse_phandle() with refcount
> incremented, when finish using it, the refcount need be decreased.
> 
> Fixes: 804775dfc288 ("net: ethernet: mtk_eth_soc: add support for Wireless Ethernet Dispatch (WED)")
> Signed-off-by: Yang Yingliang <yangyingliang@huawei.com>

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>



