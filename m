Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 34A25C636D4
	for <linux-mediatek@archiver.kernel.org>; Fri, 17 Feb 2023 10:59:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=4yOcEOEJFggpT2XREFzie2PC+IoAAie9FEoB5intIDE=; b=NgEpWDtxdbfkgAxspfu26cfeE1
	UNXeihjaun4IDVdtk7pZxBTMtJFio5eZPxyAj8Pq7mVNy0KfuLUdggSej8/MNGudv6hxjdrTG0UYI
	xktnerdj1TBmxrrqhtTycfZOZBrn7QPmGPUK8MXEkkv9CCGbe4+XrcF9YQq5Vv/fBKJBjOK3hWSNi
	GTXYJatqDG/nNNGbTLkyXPXHo0KuvSJAzh/xtdrS3/aACZkSVonpeNm1yvQpeeGIKddNR9TFuhWwO
	sU2rXwc9cMFRk1/Rosswj0pikNLEH4CzpQi2WGiiLD1QdRS6bJAAxaL6Ly33QuPmSp7a9x41WUzrk
	UcX5yHxg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pSySM-00Dmhj-OT; Fri, 17 Feb 2023 10:59:10 +0000
Received: from madras.collabora.co.uk ([2a00:1098:0:82:1000:25:2eeb:e5ab])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pSyS1-00DmYx-Qv; Fri, 17 Feb 2023 10:58:51 +0000
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id 1F875660212C;
	Fri, 17 Feb 2023 10:58:47 +0000 (GMT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1676631528;
	bh=HiIY/CHOeQ0W4JiYTTFiDjPDA7EMN/1wcpbOI06k6UA=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=RFR+n/KsV6JSyO7HKc36N9BK0uTlofQ815g1IdTufZDYuzI66WwoSiXQUofFHyxe+
	 GSiEWk7cqSsLUgShorxctstElID+WoEeEaMOslvyrWH5fZp9XCpfr8kHcUD98q6NjB
	 28h3pFseB+baHNeQuOq/d4oejjTar+V5iIc115WDRlME472ZfmoUvTHkmFcrwzvTKW
	 sEctq9YYH6TooVYw3Zifim5dydsGaN7K28gWqfGWUY3UF0B1GtaASHyjcHaK37j/Ug
	 xcEgICvi/lBloYlIJC+HfssNSCqrfHlg6mCBhn5+AMWWV2URzkXDaEjwlJIm7qCWiH
	 GWkq3QJ+sLbzA==
Message-ID: <fb81280c-3bcf-7447-3328-0863b2ffd136@collabora.com>
Date: Fri, 17 Feb 2023 11:58:44 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.2
Subject: Re: [PATCH v2 32/47] clk: mediatek: mt7986-eth: Migrate to common
 probe mechanism
Content-Language: en-US
To: Chen-Yu Tsai <wenst@chromium.org>
Cc: mturquette@baylibre.com, sboyd@kernel.org, matthias.bgg@gmail.com,
 johnson.wang@mediatek.com, miles.chen@mediatek.com,
 chun-jie.chen@mediatek.com, daniel@makrotopia.org, fparent@baylibre.com,
 msp@baylibre.com, nfraprado@collabora.com, rex-bc.chen@mediatek.com,
 zhaojh329@gmail.com, sam.shih@mediatek.com, edward-jw.yang@mediatek.com,
 yangyingliang@huawei.com, granquet@baylibre.com, pablo.sun@mediatek.com,
 sean.wang@mediatek.com, chen.zhong@mediatek.com,
 linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 kernel@collabora.com
References: <20230214134127.59273-1-angelogioacchino.delregno@collabora.com>
 <20230214134127.59273-33-angelogioacchino.delregno@collabora.com>
 <CAGXv+5F5KxA_3jtbgXfat1xSL79_k+W7kzpiOZmGHyEM3fnSkQ@mail.gmail.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <CAGXv+5F5KxA_3jtbgXfat1xSL79_k+W7kzpiOZmGHyEM3fnSkQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230217_025850_069521_BEE53BBA 
X-CRM114-Status: UNSURE (   8.78  )
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

Il 17/02/23 05:12, Chen-Yu Tsai ha scritto:
> On Tue, Feb 14, 2023 at 9:42 PM AngeloGioacchino Del Regno
> <angelogioacchino.delregno@collabora.com> wrote:
>>
>> Convert this driver to use the common mtk_clk_simple_probe() mechanism.
>> While at it, also remove __initconst annotations (as these structures
>> are used also at runtime).
>>
>> Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
> 
> Reviewed-by: Chen-Yu Tsai <wenst@chromium.org>
> 
> Git really doesn't produce good diffs on these large rewrites *sigh*.

I know... and I feel the pain...

Cheers,
Angelo

