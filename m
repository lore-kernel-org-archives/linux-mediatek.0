Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 05FEACD1284
	for <linux-mediatek@archiver.kernel.org>; Thu, 11 Apr 2024 09:42:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From
	:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=DiLHDgn/ow9luhw1nNQ9woP7nKC5tV2aVysgQv7zBgU=; b=LBTREwewOZILGUbuUXowwj8kvj
	hmAifJSpM6oa3PsMw8873zXIXsgU3uECpQqYReaJ2ESC1PBXh6ANAu1ai0kyteS+IdNgsqU2f5Vew
	3sg6aTILoYQWL9PWGs4UY8J8by+KPpZpw6oqCwsN6RuP9hu4UAvrjEtxrd2+N9iO7mFATg8Jt3pUL
	13KQLW/LMDMvNR7VoiBOw7N8qiA/DZ6G52WUk9NLXan/Y3f3ygnQ7wP9RGi52EAaUF6jbGBjwvqJq
	CLxPEh32c2aE4zufJIE32MQd6h9ty+Nfuuwj9i7s+eK3XodZHkql/RlZcx5Kc/6VZa+S3Vc3hC4lH
	abspR8Sg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1ruqwx-0000000BN5r-2lnf;
	Thu, 11 Apr 2024 09:42:31 +0000
Received: from madrid.collaboradmins.com ([46.235.227.194])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1ruqwt-0000000BN3e-2CBn;
	Thu, 11 Apr 2024 09:42:28 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1712828544;
	bh=V8R9fkgyimeoVkPMlASX7iK8V0uOUDT/i1En1+rhSGs=;
	h=Date:Subject:To:References:From:In-Reply-To:From;
	b=j7nV2JTtFRFDoe55/cqaTLUAYGBaUQqgJp8iyOyERH3iEwVToQcRRXQ2xEWj7Do4d
	 LYbHMIvHXOhzWt+sISp7dkuL3zFZFHv4tqDdQ685cnQokNyiT2z8oApoj/K0yIOl7p
	 pxz3D7R/335KRnYQLqh5y5M88eRu6YjVflzRWqfpwOFEcm9xIhROxXFkwt3UCsj64x
	 OSeiJWkVo+A4+GkfHpTO5IkRotje5WBD4Wmmkj3SHRFuzJWhWSmddRnS1q461rxEEJ
	 kshUc99aQR2eu2hUa8KNfkI18O97E3zVBMhKGYx/zL1LwGF2LlbkW9YpXttDeWwBuG
	 jeim3z08d6Vlw==
Received: from [100.113.186.2] (cola.collaboradmins.com [195.201.22.229])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madrid.collaboradmins.com (Postfix) with ESMTPSA id 6AD6E378212B;
	Thu, 11 Apr 2024 09:42:23 +0000 (UTC)
Message-ID: <21d9e0d3-5e37-4e08-862a-df463c945919@collabora.com>
Date: Thu, 11 Apr 2024 11:42:22 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/5] pinctrl: mediatek: fix module autoloading
To: Krzysztof Kozlowski <krzk@kernel.org>, Dong Aisheng
 <aisheng.dong@nxp.com>, Fabio Estevam <festevam@gmail.com>,
 Shawn Guo <shawnguo@kernel.org>, Jacky Bai <ping.bai@nxp.com>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Linus Walleij <linus.walleij@linaro.org>,
 Sascha Hauer <s.hauer@pengutronix.de>, Sean Wang <sean.wang@kernel.org>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 zhanghongchen <zhanghongchen@loongson.cn>, Yinbo Zhu <zhuyinbo@loongson.cn>,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konrad.dybcio@linaro.org>, linux-gpio@vger.kernel.org,
 imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org,
 linux-arm-msm@vger.kernel.org
References: <20240411064614.7409-1-krzk@kernel.org>
 <20240411064614.7409-2-krzk@kernel.org>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <20240411064614.7409-2-krzk@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240411_024227_721774_CD02C61F 
X-CRM114-Status: UNSURE (   6.49  )
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

Il 11/04/24 08:46, Krzysztof Kozlowski ha scritto:
> Add MODULE_DEVICE_TABLE(), so the module could be properly autoloaded
> based on the alias from of_device_id table.  Pin controllers are
> considered core components, so usually they are built-in, however these
> can be built and used as modules on some generic kernel.
> 
> Signed-off-by: Krzysztof Kozlowski <krzk@kernel.org>
> 

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>



