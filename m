Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7DD6BCA0EE7
	for <linux-mediatek@archiver.kernel.org>; Fri, 30 Aug 2024 06:35:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=65vPLjjK0lUK36QVz1TbPuE8Z6mJN9QxNP2GyeGP7HY=; b=NYDFjkTPf6p/GWxlliBidxzLxP
	ZNDSpw9664WUqZaLsoPPFLC3BBdEAXvjV4g6XA57hE8S5FJqTU1wt37ZgszHpxcX8c8VVs1AR6Eyj
	sDr2fdRXJ7yiFpwC0tfY7WQka+RBDbYMz3dn7iQegCexWBjhS4cKFF9sPNQ9TFsKU+eP7QyOO+YVE
	l51wZhBQwShvqU+5tnVlrhykr5Te3xMtgsRRBEm8XU4zyOXDbHPX/ZnebY09hCfSPHjkYTVFk9YyU
	ibJdtL4ytNQ/cWCODnHVU+fY5fvatVFPmYHYVAAhoOvIsbSLIikz2yV9ovQ6qXp53FIVMhnEcCCZR
	ou5XbvXg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sjvEa-00000004yZV-0AyW;
	Fri, 30 Aug 2024 06:35:48 +0000
Received: from szxga08-in.huawei.com ([45.249.212.255])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sjvDf-00000004yJd-44eG;
	Fri, 30 Aug 2024 06:34:54 +0000
Received: from mail.maildlp.com (unknown [172.19.88.194])
	by szxga08-in.huawei.com (SkyGuard) with ESMTP id 4Ww7dp3fr0z18MyV;
	Fri, 30 Aug 2024 14:33:50 +0800 (CST)
Received: from kwepemh500013.china.huawei.com (unknown [7.202.181.146])
	by mail.maildlp.com (Postfix) with ESMTPS id 14CA1140202;
	Fri, 30 Aug 2024 14:34:41 +0800 (CST)
Received: from [10.67.109.254] (10.67.109.254) by
 kwepemh500013.china.huawei.com (7.202.181.146) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.11; Fri, 30 Aug 2024 14:34:39 +0800
Message-ID: <c29263ae-89f1-edd7-003a-bd03cdddc821@huawei.com>
Date: Fri, 30 Aug 2024 14:34:38 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.0
Subject: Re: [PATCH -next RESEND 00/10] mtd: Use
 for_each_child_of_node_scoped()
Content-Language: en-US
To: Miquel Raynal <miquel.raynal@bootlin.com>, Krzysztof Kozlowski
	<krzk@kernel.org>
CC: <michal.simek@amd.com>, <richard@nod.at>, <vigneshr@ti.com>,
	<liang.yang@amlogic.com>, <neil.armstrong@linaro.org>,
	<khilman@baylibre.com>, <jbrunet@baylibre.com>,
	<martin.blumenstingl@googlemail.com>, <matthias.bgg@gmail.com>,
	<angelogioacchino.delregno@collabora.com>, <heiko@sntech.de>,
	<mcoquelin.stm32@gmail.com>, <alexandre.torgue@foss.st.com>, <wens@csie.org>,
	<jernej.skrabec@gmail.com>, <samuel@sholland.org>, <kees@kernel.org>,
	<gustavoars@kernel.org>, <linux@treblig.org>, <robh@kernel.org>,
	<u.kleine-koenig@pengutronix.de>, <erick.archer@gmx.com>,
	<christophe.jaillet@wanadoo.fr>, <val@packett.cool>,
	<christophe.kerello@foss.st.com>, <linux-mtd@lists.infradead.org>,
	<linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-amlogic@lists.infradead.org>, <linux-mediatek@lists.infradead.org>,
	<linux-renesas-soc@vger.kernel.org>, <linux-rockchip@lists.infradead.org>,
	<linux-stm32@st-md-mailman.stormreply.com>, <jic23@kernel.org>
References: <20240826094328.2991664-1-ruanjinjie@huawei.com>
 <20240826115213.389acaef@xps-13>
 <f7430f87-88d2-4c08-bc1e-6bb3da4e332c@kernel.org>
 <20240826144917.2c4e202d@xps-13>
From: Jinjie Ruan <ruanjinjie@huawei.com>
In-Reply-To: <20240826144917.2c4e202d@xps-13>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.67.109.254]
X-ClientProxiedBy: dggems701-chm.china.huawei.com (10.3.19.178) To
 kwepemh500013.china.huawei.com (7.202.181.146)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240829_233452_900341_802BCD0B 
X-CRM114-Status: UNSURE (   6.86  )
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



On 2024/8/26 20:49, Miquel Raynal wrote:
> Hi Krzysztof,
> 
> krzk@kernel.org wrote on Mon, 26 Aug 2024 12:19:07 +0200:
> 
>> On 26/08/2024 11:52, Miquel Raynal wrote:
>>> Hi Jinjie,
>>>
>>> ruanjinjie@huawei.com wrote on Mon, 26 Aug 2024 17:43:18 +0800:
>>>   
>>>> Use scoped for_each_available_child_of_node_scoped() when iterating over
>>>> device nodes to make code a bit simpler.  
>>>
>>> Why is this a resend ? Did I miss a previous iteration?  
>>
>> You were not cc-ed on previous iteration. I asked for proper split
>> between subsystems and sending to maintainers, thus this resend.
> 
> Ok. Makes sense, and the patchset looks fine.

Hi, Miquel,

Could this series be merged, thank you!

> 
> Jinjie, please always include a changelog when you send new versions,
> and explanations for a RESEND.
> 
> Thanks,
> Miquèl

