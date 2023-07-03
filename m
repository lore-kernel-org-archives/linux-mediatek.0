Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CE3A7EB64DC
	for <linux-mediatek@archiver.kernel.org>; Mon,  3 Jul 2023 12:30:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=68iV/bGY7hE1VBMhH0oxMPJUlEsDejPcTlOTTz/7F/s=; b=XLKHLlj7qISGGflHMJdwt/DtkP
	DyTCzrAr8nHlH1zssvECNkPcJjH99ef/3SqyPerN5otN2p4DAO4BsZj6YYrpa79Q2UBIIBsYVx2HS
	REZQum+9q+IcbuJ9Z0tOU8lfw18FONthG6/VBKpj0JXpy2cNfL3u4hr/9B29m+dndj9DvAn0qGipr
	JKui5SLeDlW1Ra24TrBrD/+opuhAymot4AQvR7roMtYnZGbd9QhvtuK0AKN5Zi5ib8x/adJ0dJJ6f
	ttzSEyt127Rq+4YPTN7PNnokhxiqN9nXbmgRT5I46DQof4KiP9zAl9JK4N/QWfSltv36GSykFov6H
	K7Gul8Iw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qGIh5-00AUR6-3C;
	Mon, 03 Jul 2023 12:30:15 +0000
Received: from madras.collabora.co.uk ([46.235.227.172])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qGIh2-00AUPv-1L;
	Mon, 03 Jul 2023 12:30:13 +0000
Received: from [IPV6:2001:b07:2ed:14ed:c5f8:7372:f042:90a2] (unknown [IPv6:2001:b07:2ed:14ed:c5f8:7372:f042:90a2])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id 55DCA6606F62;
	Mon,  3 Jul 2023 13:30:08 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1688387409;
	bh=10ULvzLVa3uPh6pWKGK9iBRw5HZ3uis1iLD8mOYhqfw=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=J5fThttroPprXqRHHKBLtoaDz50gaGczy9Po19sSzCmkUgjfbnoJtSmqWQ91atMLn
	 hbOMMYb1dA04xd3lL+5fPpFEyJ56r38hCVBntW89RuqMKWG8pes7Tzt6ecbDvH7i6L
	 vJuGuwiV3kAJ3vHwEoUeqBVJy4SAo8rUjf4MmR3OCmbF6fODUY22ZqTJKjwIDG33JS
	 hvluBaHKUorn2TK2lcjZbd2tR013Z5JllRopxhxwhs2T2BI1lc74BlILmtgKAWZQ1b
	 dK7If3bPNBXDwqAfbEIJZGag3IQ0NuPhr8Apt6UfxtmFNcyuy12rCStcLU0Su/hq3Y
	 L0z16RWX5C+Nw==
Message-ID: <2dd412f0-86cb-3ae0-305d-0e8192b9128a@collabora.com>
Date: Mon, 3 Jul 2023 14:30:06 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Subject: Re: [PATCH v2 2/4] media: platform: mediatek: isp_30: add mediatek
 ISP3.0 sensor interface
Content-Language: en-US
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Chun-Kuang Hu <chunkuang.hu@kernel.org>
Cc: Julien Stephan <jstephan@baylibre.com>, Louis Kuo
 <louis.kuo@mediatek.com>, Phi-bang Nguyen <pnguyen@baylibre.com>,
 Florian Sylvestre <fsylvestre@baylibre.com>,
 Alexander Gordeev <agordeev@linux.ibm.com>,
 Andy Hsieh <andy.hsieh@mediatek.com>, Conor Dooley <conor+dt@kernel.org>,
 daoyuan huang <daoyuan.huang@mediatek.com>, devicetree@vger.kernel.org,
 Hans Verkuil <hverkuil-cisco@xs4all.nl>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-mediatek@lists.infradead.org, linux-media@vger.kernel.org,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, Moudy Ho
 <moudy.ho@mediatek.com>, Rob Herring <robh+dt@kernel.org>,
 Vasily Gorbik <gor@linux.ibm.com>
References: <20230630100321.1951138-1-jstephan@baylibre.com>
 <20230630100321.1951138-3-jstephan@baylibre.com>
 <CAAOTY_-qu2RWr496wXxc1Cp14eZfzKt4QgEH8fJns2LOjpwi8Q@mail.gmail.com>
 <CAAOTY_9SFRMb7d3c62SVDnZY00hRAZ=9wBi9QCcv1UKuc8iBtQ@mail.gmail.com>
 <20230703121853.GA16531@pendragon.ideasonboard.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <20230703121853.GA16531@pendragon.ideasonboard.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230703_053012_594107_38A9943F 
X-CRM114-Status: GOOD (  13.15  )
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

Il 03/07/23 14:18, Laurent Pinchart ha scritto:
> On Sun, Jul 02, 2023 at 05:20:25PM +0800, Chun-Kuang Hu wrote:
>> Chun-Kuang Hu <chunkuang.hu@kernel.org> 於 2023年7月2日 週日 上午7:35寫道：
>>> Julien Stephan <jstephan@baylibre.com> 於 2023年6月30日 週五 下午6:05寫道：
>>>>
>>>> From: Louis Kuo <louis.kuo@mediatek.com>
>>>>
>>>> This will add the mediatek ISP3.0 seninf (sensor interface) driver found
>>>> on several Mediatek SoCs such as the mt8365.
>>>>
>>>> Then seninf module has 4 physical CSI-2 inputs. Depending on the soc they
>>>> may not be all connected.
>>>>
>>>> Signed-off-by: Louis Kuo <louis.kuo@mediatek.com>
>>>> Signed-off-by: Phi-bang Nguyen <pnguyen@baylibre.com>
>>>> Signed-off-by: Florian Sylvestre <fsylvestre@baylibre.com>
>>>> Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
>>>> Signed-off-by: Julien Stephan <jstephan@baylibre.com>
>>>>
>>>
>>> [snip]
>>>
>>>> +
>>>> +static const struct mtk_seninf_conf seninf_8365_conf = {
>>>> +       .model = "mtk-camsys-3.0",
>>>> +       .nb_inputs = 4,
>>>> +       .nb_muxes = 6,
>>>> +       .nb_outputs = 4,
>>>> +};
>>>> +
>>>> +static const struct of_device_id mtk_seninf_of_match[] = {
>>>> +       {
>>>> +               .compatible = "mediatek,mt8365-seninf",
>>>> +               .data = &seninf_8365_conf,
>>>
>>> Now only support one SoC, so it's necessary to select the SoC data and
>>> you could directly place the data in the code. After support other
>>
>> Typo.
>>
>> Now only support one SoC, so it's not necessary to select the SoC data
>> and you could directly place the data in the code.
> 
> I think Julien has visibility on other SoCs that could use the same
> driver, and has designed the mtk_seninf_conf structure accordingly. I'll
> let Julien confirm (or tell I'm wrong).
> 

You're not wrong.

Cheers,
Angelo

>>> SoC, so we could know what should be placed in struct mtg_seninf_conf
>>> (Now we have no any information).
>>>
>>>> +       },
>>>> +       {
>>>> +       },
>>>> +};
>>>> +MODULE_DEVICE_TABLE(of, mtk_seninf_of_match);
> 



