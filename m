Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B4A2EC83F11
	for <linux-mediatek@archiver.kernel.org>; Sat, 26 Aug 2023 02:03:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=3etukxNC1dI3ynqCZeY7keUFlu1n39mS7VfLGqwDi5Q=; b=GlwCj9qxvMuW/NsULALetyjfjS
	y0Nk79H79sSRXhcy8Mb90bvea4DjuPiE2H8D53rU8ov2VUWwsLJElzyCZn+Ke+8N1Qt5nozjos/8f
	hzAVCJPQ+g6b8w7TbSNXOnIl02PUs1mccXq4wZHBJTrf7VknUbrf3aGZx8fX4HdkR8fMHi9aznF8+
	ow4C77NoXWuQY5VMolOEB2GPi+PFjMPYEESdj8PouGt+iURugwFhWaPg4Ubk422rUJRopwA3DIlUg
	kTFMD48ZwW1ke4LgcTnUjLie/sX7A7s2viKqGD2voEjiPUCRAFqXZj51Mc2FHfJkMJFjFtSna2AK4
	gqaRYGuw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qZidh-006IRs-2R;
	Sat, 26 Aug 2023 02:03:01 +0000
Received: from szxga08-in.huawei.com ([45.249.212.255])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qZidd-006IPr-2f;
	Sat, 26 Aug 2023 02:02:59 +0000
Received: from kwepemi500008.china.huawei.com (unknown [172.30.72.56])
	by szxga08-in.huawei.com (SkyGuard) with ESMTP id 4RXg6374ZKz1L9Fn;
	Sat, 26 Aug 2023 10:01:15 +0800 (CST)
Received: from [10.67.109.254] (10.67.109.254) by
 kwepemi500008.china.huawei.com (7.221.188.139) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.31; Sat, 26 Aug 2023 10:02:48 +0800
Message-ID: <2b9c3a6d-8d1d-7815-c4ea-59ff77654e3c@huawei.com>
Date: Sat, 26 Aug 2023 10:02:47 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.0
Subject: Re: [PATCH -next 1/4] iio: adc: at91_adc: Use devm_clk_get_enabled()
 helper function
Content-Language: en-US
To: Jonathan Cameron <jic23@kernel.org>
CC: <lars@metafoo.de>, <nicolas.ferre@microchip.com>,
	<alexandre.belloni@bootlin.com>, <claudiu.beznea@tuxon.dev>,
	<matthias.bgg@gmail.com>, <angelogioacchino.delregno@collabora.com>,
	<Michael.Hennerich@analog.com>, <heiko@sntech.de>,
	<yangyingliang@huawei.com>, <robh@kernel.org>, <linux-iio@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-mediatek@lists.infradead.org>
References: <20230825105746.2999548-1-ruanjinjie@huawei.com>
 <20230825105746.2999548-2-ruanjinjie@huawei.com>
 <20230825135015.481d0aff@jic23-huawei>
From: Ruan Jinjie <ruanjinjie@huawei.com>
In-Reply-To: <20230825135015.481d0aff@jic23-huawei>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.67.109.254]
X-ClientProxiedBy: dggems704-chm.china.huawei.com (10.3.19.181) To
 kwepemi500008.china.huawei.com (7.221.188.139)
X-CFilter-Loop: Reflected
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230825_190258_051981_5A44F885 
X-CRM114-Status: UNSURE (   3.48  )
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



On 2023/8/25 20:50, Jonathan Cameron wrote:
> te patch moving to
> devm_request_irq() as then the exit paths will become much simpler and you
> can also move to return dev_err_probe() save a few pointless lines of code
> and give the benefit of debug info for deferred return codes.

Right！I'll cleanup these together in v2.


