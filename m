Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B9DEDC433EF
	for <linux-mediatek@archiver.kernel.org>; Mon, 13 Jun 2022 12:38:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=XcSEIgKP2PU4o7LNa8Y8IijvXvkMC43eaCBieHNHVpA=; b=eysHfn1wFL3V6a
	IUF2jYQCFelX+Op5O4vDg2E823bADJEz+QdWypzvqeXWw9PIKqfM1FCFBMNtDQIF9ks0oIIyTOz+K
	U5AMhDtg3F8rrIjOLlBLaEJ7IpCJiZIlFiyHDOoJTTgKuYK0AkMNMfsUVlcVSU2CunnVEmHnfONnJ
	Uur0ftxjFxzCmWwsCEKzT0iJRBl8O755lc3zxCz+wjTA/ndQ1wYwPj0h+oG2uJ2u19c2/uDRBpVax
	NLmqLCD94RGmsG7XG7yHDXLk6v61NCgFz9QMRkjCn+wJFso+0h9wRnGftDGaFPmRX8aUDh2IfcWFj
	HLZTbrmtPF5Ko+wiu/Fg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o0jKO-003ZU4-Jp; Mon, 13 Jun 2022 12:37:56 +0000
Received: from madras.collabora.co.uk ([2a00:1098:0:82:1000:25:2eeb:e5ab])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o0jJv-003ZE6-3l; Mon, 13 Jun 2022 12:37:28 +0000
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id 8D92866015D8;
	Mon, 13 Jun 2022 13:37:22 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1655123843;
	bh=SN+r3+C8txifAec4wsuKPre5ESL3Qr6tJo6VOZZTPok=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=QcnCpgdKPGIs5XF/cGQZGajDsXPaLCx4/cUDwJ3hkKxnxba7UOwoo+ZESoepdSREa
	 DHNY065sHf4gj09AlGRWZW/yAW3NiAGGX1zoTAypT7WkGxBgDuF3ubaZgD+uRACUMe
	 u9jun8TWs8F+CEZmmdemRxwibE+NPeNn+OuaseKeGHtCPkW4ws5ExS7+WQqSCgUTas
	 XTnxGHCjEqE9DmbzUWjbOotVtFo+A553TYfNifOMqUiJoHs5OlaYNL5LX/s1siMSwQ
	 T0wqYCXfc8jkOKFFuCBHOHRUxRvCuXwW2nb0WCiXs4wQ1uNHiFzVslzFJwcQzu10Np
	 LhoBxki8cfVkQ==
Message-ID: <d3f718fa-c773-4bc7-506b-d109bf72aa3b@collabora.com>
Date: Mon, 13 Jun 2022 14:37:19 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Subject: Re: [PATCH v2 2/3] firmware: mediatek: Use meaningful names for mbox
Content-Language: en-US
To: Tinghan Shen <tinghan.shen@mediatek.com>, Rob Herring
 <robh+dt@kernel.org>, Krzysztof Kozlowski
 <krzysztof.kozlowski+dt@linaro.org>,
 Matthias Brugger <matthias.bgg@gmail.com>, Mark Brown <broonie@kernel.org>,
 YC Hung <yc.hung@mediatek.com>, Curtis Malainey <cujomalainey@chromium.org>,
 Allen-KH Cheng <allen-kh.cheng@mediatek.com>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org,
 Project_Global_Chrome_Upstream_Group@mediatek.com
References: <20220609083101.24195-1-tinghan.shen@mediatek.com>
 <20220609083101.24195-3-tinghan.shen@mediatek.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <20220609083101.24195-3-tinghan.shen@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220613_053727_356438_07865C24 
X-CRM114-Status: GOOD (  21.03  )
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

Il 09/06/22 10:31, Tinghan Shen ha scritto:
> Rename mbox according to action instead of 'mbox0' and 'mbox1'
> 
> Signed-off-by: Tinghan Shen <tinghan.shen@mediatek.com>
> ---
>   drivers/firmware/mtk-adsp-ipc.c | 6 +++++-
>   1 file changed, 5 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/firmware/mtk-adsp-ipc.c b/drivers/firmware/mtk-adsp-ipc.c
> index cb255a99170c..3de94765d659 100644
> --- a/drivers/firmware/mtk-adsp-ipc.c
> +++ b/drivers/firmware/mtk-adsp-ipc.c
> @@ -83,7 +83,11 @@ static int mtk_adsp_ipc_probe(struct platform_device *pdev)
>   		return -ENOMEM;
>   
>   	for (i = 0; i < MTK_ADSP_MBOX_NUM; i++) {
> -		chan_name = kasprintf(GFP_KERNEL, "mbox%d", i);
> +		if (i < MTK_ADSP_MBOX_NUM / 2)
> +			chan_name = kasprintf(GFP_KERNEL, "rep");
> +		else
> +			chan_name = kasprintf(GFP_KERNEL, "req");
> +
>   		if (!chan_name) {
>   			ret = -ENOMEM;
>   			goto out;

At this point, just call them "reply" and "request", as that simply provides a
perfectly clear explanation.

Besides, I'm sorry but I really don't like this code, it's really too much
fragile and will have to be changed entirely if a third mbox is introduced.

I can suggest a cooler way:

static const char * const adsp_mbox_ch_names[MTK_ADSP_MBOX_NUM] = { "rep", "req" };

for (i = 0; i < ARRAY_SIZE(adsp_mbox_ch_names); i++) {
	/* we can delete chan_name and also avoid a kfree if we do... */

	.... code ....

	adsp_chan->ch = mbox_request_channel_byname(cl, adsp_mbox_ch_names[i]);

	... etc etc ...
}

Cheers,
Angelo

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
