Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E70E6C433EF
	for <linux-mediatek@archiver.kernel.org>; Mon, 23 May 2022 10:49:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=YNpnbwTZN2MUVaN4Qgxev8de7N+TXuxURczNNF2Qs2M=; b=cU88CVxPUuIUN0
	lKtFXl+h4ZLiljMMiyzNs+h+rFnsiChbFjgu+d6g/q9xqzNXocKw8rnAh83WoqL8lwHGrjEDv8lbH
	OjtJnWt57v1johBX2MpN3+jFf5pg4kbgWr78DVQC2wxNINBZKfxit8XKPeRrZiGIFc5xMhsUtEarz
	4CNauJOcpZ8kd5CYVxaK+plD1CgfZOtG09wLyPIfRWA3neGiqZia+acpLM4FaWG/AFyezucGsBh82
	TANWvFUTLVzb/xpXWOPWnA6g3EJBtuqdwZMkXKzXs1zj7cQH/+xULCbHxUJ1BaOnT2VsZIVOoYVOM
	9EH97lOg03q/ZMSIk5lA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nt5co-003P5C-TS; Mon, 23 May 2022 10:49:22 +0000
Received: from bhuna.collabora.co.uk ([46.235.227.227])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nt4Vz-002uB7-Np; Mon, 23 May 2022 09:38:17 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (Authenticated sender: kholk11) with ESMTPSA id 6A2F11F41D24
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1653298694;
 bh=+mM48zHrs1vI2jvIxwtcOKf64dJhB2TyhpCjZ7uDCtM=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=iST7cAMPBLCjzsMh4n4atbAlZTFPjGXPOe8rZ5qUNBhXeplo0jn6hLuuDtisSlPY4
 YsOVkJL1PmOxWNYBs+S4e2IGd34M1NWLm3Feooc8JA5axyPU978spk+Y+yhqhr2AH3
 0s1MmghNKKAx5IPVPM+79b61jMHtsFYDHV1oSygaOh+DpFbc48SQh8lkIPKD1V0oCy
 8ouPBcCLu1ghmosi6rBOT8OEoMpf15Yu4OeIq1+KhaaC+goYXJDQoSm3vmF6cLTl7l
 eYU+pD0KMMLQ+srUloQc5maKkMNGLLze2Qq1JAbjVH1v3ZW/twqNSC7oMOXLqAVkAs
 tf54CFmE3Yptw==
Message-ID: <0a1c4797-cfdf-1b45-62f0-18ecf78ed335@collabora.com>
Date: Mon, 23 May 2022 11:38:11 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.0
Subject: Re: [PATCH v3 2/4] soc: mediatek: svs: add support for mt8186
Content-Language: en-US
To: Tim Chang <jia-wei.chang@mediatek.com>, Rob Herring <robh+dt@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Philipp Zabel <p.zabel@pengutronix.de>, Roger Lu <roger.lu@mediatek.com>,
 Kevin Hilman <khilman@kernel.org>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org,
 Project_Global_Chrome_Upstream_Group@mediatek.com, hsinyi@google.com
References: <20220523084034.26802-1-jia-wei.chang@mediatek.com>
 <20220523084034.26802-3-jia-wei.chang@mediatek.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <20220523084034.26802-3-jia-wei.chang@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220523_023815_958806_4F5CA9D6 
X-CRM114-Status: GOOD (  15.02  )
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Il 23/05/22 10:40, Tim Chang ha scritto:
> From: Jia-Wei Chang <jia-wei.chang@mediatek.com>
> 
> MT8186 svs has a number of banks which used as optimization of opp
> voltage table for corresponding dvfs drivers.
> MT8186 svs big core uses 2-line high bank and low bank to optimize the
> voltage of opp table for higher and lower frequency respectively.
> 
> Signed-off-by: Jia-Wei Chang <jia-wei.chang@mediatek.com>
> Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
> ---
>   drivers/soc/mediatek/mtk-svs.c | 351 ++++++++++++++++++++++++++++++++-
>   1 file changed, 344 insertions(+), 7 deletions(-)
> 
> diff --git a/drivers/soc/mediatek/mtk-svs.c b/drivers/soc/mediatek/mtk-svs.c
> index 606a00a2e57d..656d0361ff7d 100644
> --- a/drivers/soc/mediatek/mtk-svs.c
> +++ b/drivers/soc/mediatek/mtk-svs.c

..snip..

> @@ -2245,6 +2569,16 @@ static const struct svs_platform_data svs_mt8192_platform_data = {
>   	.bank_max = ARRAY_SIZE(svs_mt8192_banks),
>   };
>   
> +static const struct svs_platform_data svs_mt8186_platform_data = {
> +	.name = "mt8186-svs",
> +	.banks = svs_mt8186_banks,
> +	.efuse_parsing = svs_mt8186_efuse_parsing,
> +	.probe = svs_mt8186_platform_probe,
> +	.irqflags = IRQF_TRIGGER_HIGH,

I know I gave you my R-b tag earlier, but I've just noticed that: please remove
irqflags, as this kind of flags are specified in devicetree and it is not
necessary to specify them here.

Thanks,
Angelo

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
