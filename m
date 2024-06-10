Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8E802C27C5F
	for <linux-mediatek@archiver.kernel.org>; Mon, 10 Jun 2024 08:43:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=gJX22UwsbDN2D//lp41IPOhz7i9utMQcuwXw0dQ5Dr8=; b=dcjRBG8YKTDGzzKcxu8f6huPbI
	XfK5Le+e6bPrr3bmWr/F1PZRWUdLzk6wkRQ6fp1qsYxm1xFYzk9/l7lU/zZCTQRmFSZ4PyY4gS6pd
	fbfYj0eIBl1pRojOGHp9HN68mJs4Y3UbriklaDndvfXH6kjp+5hcvC0OUHxF5JAshIrc6KdTorJdl
	4/J+DSKM8+cSkbXvDm91oEuMrsH0uiFbYUABHphOvlonnJ3KtSzykLAWNe+Bm+any/EU4PRDfEx6q
	4psmHmhQOXSV1ug7BJZxbRegcqnRkHl3VFVXPJzz3Z9mlpXWphC5gbqV/DoURJ55gIqwxBbBJcoS/
	4nhMN5ew==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sGacf-00000004IXh-38H6;
	Mon, 10 Jun 2024 08:43:25 +0000
Received: from madrid.collaboradmins.com ([2a00:1098:ed:100::25])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sGacb-00000004IWE-3lSb;
	Mon, 10 Jun 2024 08:43:23 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1718009000;
	bh=LNIdzzsyqhCcgncvNLcOHzzyUBy2LZ72RSb393VPJD8=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=JjcWTaLH9RJQ8OsGhSaTMWLC5Fv/zpn5Gv1aSyQk78fF2Yx+4NKYt0+IVLJCbPibb
	 5B6368IDCGBDKI2/MMnHFxYrXRPEXDdkEUN0739oxncZij4l7SgxsKJ23Mn0VTk4PJ
	 XL0jKEPhjfmmF7kw1dPmRFmRYRfPYXlswCBbuyl+A/9bDww9tazb2H2WI66CU53R9c
	 QnPEpd1S2BoYDlN9bP/nmNZ86U7SCMz/5xHTdjooR1S4aV9cq008K15l8q3VV6dhLb
	 6uWN5CJXSJiHv2javX5Y9u5T2LLdtOZjD/d3LnzTBP5TzB1RvSn6K2NxdX+Uqaj5XS
	 vXsSNPQWxW6gg==
Received: from [100.113.186.2] (cola.collaboradmins.com [195.201.22.229])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madrid.collaboradmins.com (Postfix) with ESMTPSA id E2EDC378148F;
	Mon, 10 Jun 2024 08:43:19 +0000 (UTC)
Message-ID: <29cb4283-34ef-4c90-ad53-ea572576d3fa@collabora.com>
Date: Mon, 10 Jun 2024 10:43:19 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] regulator: add missing MODULE_DESCRIPTION() macro
To: Jeff Johnson <quic_jjohnson@quicinc.com>,
 Support Opensource <support.opensource@diasemi.com>,
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Matthias Brugger <matthias.bgg@gmail.com>
Cc: linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, kernel-janitors@vger.kernel.org
References: <20240608-md-drivers-regulator-v1-1-da338665db7a@quicinc.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <20240608-md-drivers-regulator-v1-1-da338665db7a@quicinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240610_014322_103125_AC807740 
X-CRM114-Status: GOOD (  16.79  )
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

Il 09/06/24 06:53, Jeff Johnson ha scritto:
> On x86, make allmodconfig && make W=1 C=1 reports:
> WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/regulator/da9121-regulator.o
> WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/regulator/max20411-regulator.o
> WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/regulator/rt4831-regulator.o
> WARNING: modpost: missing MODULE_DESCRIPTION() in drivers/regulator/tps6286x-regulator.o
> 
> Add the missing invocation of the MODULE_DESCRIPTION() macro to all files
> which have a MODULE_LICENSE(). This includes mtk-dvfsrc-regulator.c, which
> did not produce a warning with the x86 allmodconfig, since it may cause
> this warning with other configurations.
> 
> Signed-off-by: Jeff Johnson <quic_jjohnson@quicinc.com>
> ---
>   drivers/regulator/da9121-regulator.c     | 1 +
>   drivers/regulator/max20411-regulator.c   | 1 +
>   drivers/regulator/mtk-dvfsrc-regulator.c | 1 +
>   drivers/regulator/rt4831-regulator.c     | 1 +
>   drivers/regulator/tps6286x-regulator.c   | 1 +
>   5 files changed, 5 insertions(+)
> 
> diff --git a/drivers/regulator/da9121-regulator.c b/drivers/regulator/da9121-regulator.c
> index 96257551bb12..3571b6242e3a 100644
> --- a/drivers/regulator/da9121-regulator.c
> +++ b/drivers/regulator/da9121-regulator.c
> @@ -1192,4 +1192,5 @@ static struct i2c_driver da9121_regulator_driver = {
>   
>   module_i2c_driver(da9121_regulator_driver);
>   
> +MODULE_DESCRIPTION("Dialog Semiconductor DA9121/DA9122/DA9220/DA9217/DA9130/DA9131/DA9132 regulator driver");
>   MODULE_LICENSE("GPL v2");
> diff --git a/drivers/regulator/max20411-regulator.c b/drivers/regulator/max20411-regulator.c
> index 8c09dc71b16d..6614e767072f 100644
> --- a/drivers/regulator/max20411-regulator.c
> +++ b/drivers/regulator/max20411-regulator.c
> @@ -161,4 +161,5 @@ static struct i2c_driver max20411_i2c_driver = {
>   };
>   module_i2c_driver(max20411_i2c_driver);
>   
> +MODULE_DESCRIPTION("Maxim MAX20411 High-Efficiency Single Step-Down Converter driver");
>   MODULE_LICENSE("GPL");
> diff --git a/drivers/regulator/mtk-dvfsrc-regulator.c b/drivers/regulator/mtk-dvfsrc-regulator.c
> index f1280d45265d..1941aad5e247 100644
> --- a/drivers/regulator/mtk-dvfsrc-regulator.c
> +++ b/drivers/regulator/mtk-dvfsrc-regulator.c
> @@ -211,4 +211,5 @@ static void __exit mtk_dvfsrc_regulator_exit(void)
>   module_exit(mtk_dvfsrc_regulator_exit);
>   
>   MODULE_AUTHOR("Arvin wang <arvin.wang@mediatek.com>");
> +MODULE_DESCRIPTION("MediaTek DVFSRC regulator driver");

Can you please drop this one?
I have a series floating that is removing this driver entirely and replacing it
with a refactored one. Though, it has the same issue, so I'll have to send a v6.

Anyway, v5 is there:

https://lore.kernel.org/r/20240424095416.1105639-1-angelogioacchino.delregno@collabora.com


>   MODULE_LICENSE("GPL v2");
> diff --git a/drivers/regulator/rt4831-regulator.c b/drivers/regulator/rt4831-regulator.c
> index 97e6f7e2a0ba..7d1ba0c82271 100644
> --- a/drivers/regulator/rt4831-regulator.c
> +++ b/drivers/regulator/rt4831-regulator.c
> @@ -202,4 +202,5 @@ static struct platform_driver rt4831_regulator_driver = {
>   module_platform_driver(rt4831_regulator_driver);
>   
>   MODULE_AUTHOR("ChiYuan Huang <cy_huang@richtek.com>");
> +MODULE_DESCRIPTION("Richtek RT4831 DSV RegulatorsRichtek RT4831 DSV Regulators driver");

Also, there's a typo here :-)

After dropping mtk-dvfsrc-regulator changes and after fixing the typo:

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>



