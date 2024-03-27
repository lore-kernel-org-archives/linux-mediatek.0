Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E386CC47DD9
	for <linux-mediatek@archiver.kernel.org>; Wed, 27 Mar 2024 16:22:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=AL90OeLN6HBr4p5W0lhhAZx03UxnubeNziLOtdV4E9M=; b=nGcbMBYm9dUhWDhebtRrvEce67
	KiWOpy4mGcqs53TpDB1Y9dNykJJV9eueXyRNHwXRD9I6JzLCm/rWA2zivc9fM6QIVM4ttGSPkFs05
	ASrNQSGb3hCYrrqU0CepxZ6qXH05eoI0qZ1tcwenCZ0aAvKm6vYc3FqyPZLeOB6NiEl6LVwnn5JHV
	sMWVLXnHoWBeiK4YBtWqYP6/77j3ikCEqMdp+8NG55mm2vCG2IfvLzCRzhAe5pw21BE4X6cDcXPQe
	j6m1A43Xkykli/JdnWg/KAHrpO3BsD7SSMOE5zwn585wnU+RP/V4fR7ndoG8IYPEUsf1mdMAByZQH
	4DE3RJGA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rpW2o-0000000A3kR-12W7;
	Wed, 27 Mar 2024 16:22:31 +0000
Received: from smtp5-g21.free.fr ([212.27.42.5])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rpW2a-0000000A3Z5-2k7D;
	Wed, 27 Mar 2024 16:22:18 +0000
Received: from [IPV6:2a01:e0a:255:1000:f49a:79c4:c3c6:eaf3] (unknown [IPv6:2a01:e0a:255:1000:f49a:79c4:c3c6:eaf3])
	(Authenticated sender: duncan.sands@free.fr)
	by smtp5-g21.free.fr (Postfix) with ESMTPSA id A3A9F60142;
	Wed, 27 Mar 2024 17:20:26 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=free.fr;
	s=smtp-20201208; t=1711556526;
	bh=g9NIYWY7Zqq4Jpe3GVuphoABvUpR98WMNlTO/PqC+cM=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=vSMCQaVHDvOS+MJTVx5PjO8YOXxmIEoXqqAuvBYuRC535uirpZWCAg3Zcduu9rDtt
	 KXKCxUyreW9ES5/mQaKWuQmfTpoSpYf8IwCcPc988GMFZvS+1wbAKCcOjbSk3mXiD9
	 ZK8Hamum4SVmsMBE1c9pxQwBG+dsyo12O4SxF8j/IiVpKDUrPYQJdtKDuV/HWRo3xL
	 PYIWjDHKv6Iwt5jWnepwy1J7Y+fjiF4JTHXVaKfZ4ukUUftUNKj+3Aem3Jcxh8PUFu
	 tZQKCHeE4q+71+QXSA4TwBR2eiNJVHnD/WyXCPKNPqsgcwl7VuDNvLoWg/63fz6oE5
	 pvkLMrw2O9NMA==
Message-ID: <7297be25-a3c8-4e8b-9a80-ff720ccddc90@free.fr>
Date: Wed, 27 Mar 2024 17:20:26 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 4/9] USB: Convert from tasklet to BH workqueue
To: Allen Pais <apais@linux.microsoft.com>, linux-kernel@vger.kernel.org
Cc: tj@kernel.org, keescook@chromium.org, vkoul@kernel.org, marcan@marcan.st,
 sven@svenpeter.dev, florian.fainelli@broadcom.com, rjui@broadcom.com,
 sbranden@broadcom.com, paul@crapouillou.net, Eugeniy.Paltsev@synopsys.com,
 manivannan.sadhasivam@linaro.org, vireshk@kernel.org, Frank.Li@nxp.com,
 leoyang.li@nxp.com, zw@zh-kernel.org, wangzhou1@hisilicon.com,
 haijie1@huawei.com, shawnguo@kernel.org, s.hauer@pengutronix.de,
 sean.wang@mediatek.com, matthias.bgg@gmail.com,
 angelogioacchino.delregno@collabora.com, afaerber@suse.de,
 logang@deltatee.com, daniel@zonque.org, haojian.zhuang@gmail.com,
 robert.jarzmik@free.fr, andersson@kernel.org, konrad.dybcio@linaro.org,
 orsonzhai@gmail.com, baolin.wang@linux.alibaba.com, zhang.lyra@gmail.com,
 patrice.chotard@foss.st.com, linus.walleij@linaro.org, wens@csie.org,
 jernej.skrabec@gmail.com, peter.ujfalusi@gmail.com, kys@microsoft.com,
 haiyangz@microsoft.com, wei.liu@kernel.org, decui@microsoft.com,
 jassisinghbrar@gmail.com, mchehab@kernel.org, maintainers@bluecherrydvr.com,
 aubin.constans@microchip.com, ulf.hansson@linaro.org,
 manuel.lauss@gmail.com, mirq-linux@rere.qmqm.pl, jh80.chung@samsung.com,
 oakad@yahoo.com, hayashi.kunihiko@socionext.com, mhiramat@kernel.org,
 brucechang@via.com.tw, HaraldWelte@viatech.com, pierre@ossman.eu,
 stern@rowland.harvard.edu, oneukum@suse.com,
 openipmi-developer@lists.sourceforge.net, dmaengine@vger.kernel.org,
 asahi@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
 linux-rpi-kernel@lists.infradead.org, linux-mips@vger.kernel.org,
 imx@lists.linux.dev, linuxppc-dev@lists.ozlabs.org,
 linux-mediatek@lists.infradead.org, linux-actions@lists.infradead.org,
 linux-arm-msm@vger.kernel.org, linux-riscv@lists.infradead.org,
 linux-sunxi@lists.linux.dev, linux-tegra@vger.kernel.org,
 linux-hyperv@vger.kernel.org, linux-rdma@vger.kernel.org,
 linux-media@vger.kernel.org, linux-mmc@vger.kernel.org,
 linux-omap@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
 linux-s390@vger.kernel.org, netdev@vger.kernel.org, linux-usb@vger.kernel.org
References: <20240327160314.9982-1-apais@linux.microsoft.com>
 <20240327160314.9982-5-apais@linux.microsoft.com>
Content-Language: en-GB
From: Duncan Sands <duncan.sands@free.fr>
In-Reply-To: <20240327160314.9982-5-apais@linux.microsoft.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240327_092217_149560_78BFF338 
X-CRM114-Status: UNSURE (   4.92  )
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

Hi Allen, the usbatm bits look very reasonable to me.  Unfortunately I don't 
have the hardware to test any more.  Still, for what it's worth:

Signed-off-by: Duncan Sands <duncan.sands@free.fr>

