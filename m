Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6774DC5321D
	for <linux-mediatek@archiver.kernel.org>; Mon, 26 Aug 2024 10:59:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=rXd1LoFo3M2FRF0C2w2/iH6RhUNxBPSbi5fetOl4Wq0=; b=N6adczA6FmQHiFGWhYp2Ceo+9N
	4Nv2WZil0ZVF+P0x+CZXNBjPcpnx4dFP+LCb+bikcMwZnc2zhqgxM7To4sAD2ZITFbeqs/D5rrBAX
	jkAqEifA8fDGwrTo7aQTspvrZFZ/Qs8CO3TM9kOGR1Ll3IOeNQ1E5tlwNF0NOpMZBxt/ThOqT8Ary
	6iBZQq6rZ8bHAS6796xSaUshqXA9h4FMQEvDNpcZ9QWbG+y3U5QueCB5vXXcQa9jkjbsDEgOJfGjX
	xIkEHI6q4HplylnFyAIe6/Uff149hpiuLZjZjIBiia7Wa/QDXZRQ1T/xiYc52+MQM9TsAMElGZjfN
	gVal+Jxw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1siXRF-000000072wc-08Ux;
	Mon, 26 Aug 2024 10:59:09 +0000
Received: from szxga01-in.huawei.com ([45.249.212.187])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1siXOw-00000007222-02BR;
	Mon, 26 Aug 2024 10:56:47 +0000
Received: from mail.maildlp.com (unknown [172.19.163.48])
	by szxga01-in.huawei.com (SkyGuard) with ESMTP id 4Wsnf2232YzyP9Y;
	Mon, 26 Aug 2024 18:55:54 +0800 (CST)
Received: from kwepemh500013.china.huawei.com (unknown [7.202.181.146])
	by mail.maildlp.com (Postfix) with ESMTPS id 1869618006C;
	Mon, 26 Aug 2024 18:56:40 +0800 (CST)
Received: from [10.67.109.254] (10.67.109.254) by
 kwepemh500013.china.huawei.com (7.202.181.146) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.11; Mon, 26 Aug 2024 18:56:38 +0800
Message-ID: <ade6d403-e54c-80fb-7d51-1e00602fcbfb@huawei.com>
Date: Mon, 26 Aug 2024 18:56:37 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.0
Subject: Re: [PATCH -next RESEND 00/10] mtd: Use
 for_each_child_of_node_scoped()
Content-Language: en-US
To: Krzysztof Kozlowski <krzk@kernel.org>, Miquel Raynal
	<miquel.raynal@bootlin.com>
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
From: Jinjie Ruan <ruanjinjie@huawei.com>
In-Reply-To: <f7430f87-88d2-4c08-bc1e-6bb3da4e332c@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.67.109.254]
X-ClientProxiedBy: dggems704-chm.china.huawei.com (10.3.19.181) To
 kwepemh500013.china.huawei.com (7.202.181.146)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240826_035646_344325_3055CD88 
X-CRM114-Status: UNSURE (   8.62  )
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



On 2024/8/26 18:19, Krzysztof Kozlowski wrote:
> On 26/08/2024 11:52, Miquel Raynal wrote:
>> Hi Jinjie,
>>
>> ruanjinjie@huawei.com wrote on Mon, 26 Aug 2024 17:43:18 +0800:
>>
>>> Use scoped for_each_available_child_of_node_scoped() when iterating over
>>> device nodes to make code a bit simpler.
>>
>> Why is this a resend ? Did I miss a previous iteration?
> 
> You were not cc-ed on previous iteration. I asked for proper split
> between subsystems and sending to maintainers, thus this resend.
> 
> Although for such big patchset, I would expect some waiting time, not
> sending immediately.

Sorry, I will pay attention to it later.

> 
> Best regards,
> Krzysztof
> 

