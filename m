Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 13F8FC636D4
	for <linux-mediatek@archiver.kernel.org>; Fri, 17 Feb 2023 11:31:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=FwW/iEyJxKBx9iPQ0d/J+vqVmaiX/D8LOIXqH7FUctk=; b=yB7qxR3OXc1fRC1QYxS9ozItLP
	xG0v65h1OUo3R3XneznwIymEV2hvr0h0yw6iEoUB3qPB+zOm91LIoSTDh800eIoXqsGQECy7fgOuz
	1l2A83TX2pk7vMGvIMvnjxuPROBYTLQrZaNc6QGyg5qBRldonvTTYRs7xJoX0+98ofEg0R8tI5HtV
	hpM2fTiwUw79932VH2lYZI35Tqyd/hWOAU/YN4CJH80DeJEQwWpPD1SUyaJ5lu1SfJ1+/LRnxyCii
	esUduClySzwmj8jfj7nnB4PNpGaZFwvVk8Tm2Ur/qxRWlHufEaQdSg4ZhoQjFi9SGSnI+5Q0sUaek
	JBrR8iTw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pSyxs-00Dxhc-IJ; Fri, 17 Feb 2023 11:31:44 +0000
Received: from madras.collabora.co.uk ([46.235.227.172])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pSyxd-00Dxbu-NB; Fri, 17 Feb 2023 11:31:31 +0000
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id 406C0660212C;
	Fri, 17 Feb 2023 11:31:27 +0000 (GMT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1676633488;
	bh=SjoZg9J5DHeU0Fb2G9tLSBCQbSBH0EoGQ5RPHtKFqvc=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=FNWcnQXj0Qok59CkpqivO3INeptwaQZlf+oM0QpyHkfA7mXClbOPDqv2sk6sjRFoq
	 4vApNP8woYbx8XNIT5S7azLKzoIbJQfzZ6szC5YSIL0zl10TNe4+C7uwkoo60GJSqL
	 Zb8wPnT1HHsfpwbnzd6eIhpOSG9G8yjFS3JCyJqrYV89M71cF+2BqrK05Vp65u1MRy
	 a1UkqNnLwmyq0kjzMiRaa7F/R2VQGQDd66/kzTmqCWXOX+bc24/r03jMfOs47INfy2
	 srieZlcPiJYd1xN8t26P9tHdNJoAjA6sGUElOt/xUCBEch6WEObz8Ezsc3x9wvObbY
	 HpFgNONCK3RUg==
Message-ID: <5d886462-5f65-16ee-c1cf-7c529ce5a439@collabora.com>
Date: Fri, 17 Feb 2023 12:31:24 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.2
Subject: Re: [PATCH v2 39/47] clk: mediatek: Allow MT7622 clocks to be built
 as modules
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
 <20230214134127.59273-40-angelogioacchino.delregno@collabora.com>
 <CAGXv+5FtWp8BvLHJmJvXe=eXvM10-LTjQo9PkH1xKMvzY6YiHA@mail.gmail.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <CAGXv+5FtWp8BvLHJmJvXe=eXvM10-LTjQo9PkH1xKMvzY6YiHA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230217_033129_916186_BF7C311D 
X-CRM114-Status: GOOD (  14.35  )
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

Il 17/02/23 05:32, Chen-Yu Tsai ha scritto:
> On Tue, Feb 14, 2023 at 9:42 PM AngeloGioacchino Del Regno
> <angelogioacchino.delregno@collabora.com> wrote:
>>
>> Now that all drivers are using the simple probe mechanism change the
>> MT7622 clock drivers to tristate in Kconfig to allow module build.
>>
>> Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
>> ---
>>   drivers/clk/mediatek/Kconfig | 8 ++++----
>>   1 file changed, 4 insertions(+), 4 deletions(-)
>>
>> diff --git a/drivers/clk/mediatek/Kconfig b/drivers/clk/mediatek/Kconfig
>> index b5636b3225e8..55727889ebf5 100644
>> --- a/drivers/clk/mediatek/Kconfig
>> +++ b/drivers/clk/mediatek/Kconfig
>> @@ -336,7 +336,7 @@ config COMMON_CLK_MT6797_VENCSYS
>>            This driver supports MediaTek MT6797 vencsys clocks.
>>
>>   config COMMON_CLK_MT7622
>> -       bool "Clock driver for MediaTek MT7622"
>> +       tristate "Clock driver for MediaTek MT7622"
> 
> Same as MT2712, mt7622-apmixedsys is builtin_platform_driver.
> 
> ChenYu

Same as MT2712 - added remove callback, converted to module_platform_driver()
for v3!

Thanks again!
Angelo


