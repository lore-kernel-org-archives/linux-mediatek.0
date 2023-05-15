Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3B2D1C77B75
	for <linux-mediatek@archiver.kernel.org>; Mon, 15 May 2023 11:34:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=J0LgPQ64AJuPea68t1fSdMX8SGDAOFBo0PgwrAF3Fco=; b=q8BbE6WrJZhDjNIpLZjFAPbxO3
	aaNFJkG91hJge+W25HYJQrmnXX9dpVyN3ClNq3OekvFSDaVz4pLDIliuJh2pnwDp7Kedb0qcieXTj
	jOGz06nCYw6GMtAdhk3iwrWuauU6VU+foGwTnUsLh/omFaz0/YnfJ0xCQi6K1kNHdCEhGXWhTGoyq
	HFG+9LZSZaCkUDpD3mp+ukMlQMCuQqCTJgK8eQoUdrkE6N0tYNG7NVqdfbaPli68DeXxPlJFJy7cy
	I2wrQUfIP46UVa7xvMe/a6jvt3vsDAkqD+CNQVcI3fJT0K3YpKzSz22Yfz1XZPP41hP0K3R57tdQa
	YX3H2ICw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pyWSg-001zQE-2O;
	Mon, 15 May 2023 11:33:54 +0000
Received: from madras.collabora.co.uk ([2a00:1098:0:82:1000:25:2eeb:e5ab])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pyWSc-001zPH-0o;
	Mon, 15 May 2023 11:33:52 +0000
Received: from [IPV6:2001:b07:2ed:14ed:a962:cd4d:a84:1eab] (unknown [IPv6:2001:b07:2ed:14ed:a962:cd4d:a84:1eab])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id 6A37466031D7;
	Mon, 15 May 2023 12:33:48 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1684150429;
	bh=0Op7/1O++9f9jKqNzHu0BHLGnt+h03kOJbIaWi9PeKs=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=HrS1R2p9PM3I1yxbCWG+C30ZX/cEa5ugTBKNO3T5Emy1qniUwHhESsZhVy/LMKmMg
	 bKTtwNBibki/OauZ1RHDUi95FkFk2vKFuA5ht4V86ArWKFDyIoJr9zrvy/ifPx3Oo9
	 EDK2Yc+Wn8uRtv4Z+jzZTj+d/ht6NbponChojL5q4EftCnakM4bSPDBJK1b5okD5N7
	 CxLZtEKJCCeBaCTwa4kCuT/1Rwf27NikcsLNTn2J+ebnNHzOxm7SGfZeJrmQJmAsHg
	 jpccAqjglu9DCIWz0CBaqAcr5FmgjViOcOeR7F9PfZ0NK7m+A3SYwCOPWNd010UR1S
	 JeHS7lr9bPWHg==
Message-ID: <8a3249a5-787b-5c7d-cf7c-69b732eb100e@collabora.com>
Date: Mon, 15 May 2023 13:33:45 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.1
Subject: Re: [PATCH] mediatek/clk-mt8173-apmixedsys: use devm_of_iomap to
 avoid resource leak in clk_mt8173_apmixed_probe
Content-Language: en-US
To: Chen-Yu Tsai <wenst@chromium.org>, Hao Ge <gehao@kylinos.cn>
Cc: mturquette@baylibre.com, sboyd@kernel.org, matthias.bgg@gmail.com,
 gehao618@163.com, linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org
References: <20230509021214.17105-1-gehao@kylinos.cn>
 <CAGXv+5Gvw0QsOa-7E==61WUiJ-q=9qAqN9E0L9hsmk+t12RJ9A@mail.gmail.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <CAGXv+5Gvw0QsOa-7E==61WUiJ-q=9qAqN9E0L9hsmk+t12RJ9A@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230515_043350_426203_4393D98F 
X-CRM114-Status: GOOD (  18.39  )
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

Il 12/05/23 02:39, Chen-Yu Tsai ha scritto:
> On Tue, May 9, 2023 at 11:12 AM Hao Ge <gehao@kylinos.cn> wrote:
>>
>> Use devm_platform_ioremap_resource to take the place of of_iomap for
>> avoid that we don't called iounmap when return some error or remove
>> device.
>>
>> Fixes: 4c02c9af3cb9 ("clk: mediatek: mt8173: Break down clock drivers and allow module build")
>> Signed-off-by: Hao Ge <gehao@kylinos.cn>
>> ---
>>   drivers/clk/mediatek/clk-mt8173-apmixedsys.c | 4 ++--
>>   1 file changed, 2 insertions(+), 2 deletions(-)
>>
>> diff --git a/drivers/clk/mediatek/clk-mt8173-apmixedsys.c b/drivers/clk/mediatek/clk-mt8173-apmixedsys.c
>> index 8c2aa8b0f39e..8a2a88c63d15 100644
>> --- a/drivers/clk/mediatek/clk-mt8173-apmixedsys.c
>> +++ b/drivers/clk/mediatek/clk-mt8173-apmixedsys.c
>> @@ -146,8 +146,8 @@ static int clk_mt8173_apmixed_probe(struct platform_device *pdev)
>>          struct clk_hw *hw;
>>          int r;
>>
>> -       base = of_iomap(node, 0);
>> -       if (!base)
>> +       base = devm_of_iomap(&pdev->dev, node, 0, NULL);
>> +       if (IS_ERR(base))
> 
>  From lib/devres.c:
> 
>   * Please Note: This is not a one-to-one replacement for of_iomap() because the
>   * of_iomap() function does not track whether the region is already mapped.  If
>   * two drivers try to map the same memory, the of_iomap() function will succeed
>   * but the devm_of_iomap() function will return -EBUSY.
> 
> The register range for apmixedsys given in mt8173.dtsi overlaps with
> the HDMI phy. I'm concerned that would cause issues.

I agree, that will cause issues.

Regards,
Angelo


