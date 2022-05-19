Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9901BC433EF
	for <linux-mediatek@archiver.kernel.org>; Thu, 19 May 2022 08:05:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ZeitI92R/nlm/fvwAAKA0EITRbsjX+3N11R9oH4y9Ls=; b=BU5LU8LfuttdXV
	E2oogRqDtc/kjd8qV3ZjOqQG8IxlswFddPxFzX+tF1bfVL0VrjrxQobLv/y3GfmT9KiyXHa1DMvFU
	AHysg9DaL4Q7t6dqyOnbnW+jUhJuq+EvXu7CFkc1YEXi2e07Slwsh2CNenvIXps0iw2cRAt1eOZeN
	qNmJYv2ioVzIKLq97ZMkAsO89fusFUIBtd91Gk7PyTDOfPqoXltmMTp4peJvTxvQARqwOR9RGFEEs
	IdFQ8CZF8t3JGTNA0V+nX+MHCfjVvYXjJmPKVojOHUjdpnthIubj/c7H3Xzd0n0WVYFIH4LDgqYfU
	1JTjBE7pZ87gtL4jqV3g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nrbA1-005hKd-Mu; Thu, 19 May 2022 08:05:29 +0000
Received: from bhuna.collabora.co.uk ([46.235.227.227])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nrb9p-005hGm-O8; Thu, 19 May 2022 08:05:19 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (Authenticated sender: kholk11) with ESMTPSA id 0C01E1F456AC
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1652947512;
 bh=t6QxwZ2dfHcmowUe8JtLrXuccxRC4l5JaUwmCWL0OXk=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=j/dFS++lN3Wf6JrFAXAei7VSv1X2EEacpBGKjDjzFae/P2rOLvwho8z6N/ii7Xgxj
 rXCNH9I6Hh8IFSqDxoTH6mRzpLBAgqes02TPZsBqCH9WnqJDEiSWCFHbGRKOUvYrep
 DmQGDL/GOjk/FV160DHM5v2vYat+VzAgi2HLRUIXR1b9ZUBa7A6lL8nMzJU1l3wGUF
 9qBwv/GrBMSmszsBImyvpi/RRrXZAREOlRlvEh1GcrEYEolGba7/5GMWUcTXCK2fjN
 2QfYbsFNbYBtfSPaBuzH5kyTGh+59QXRRJtjct4oa3VmAlmiVLmNFR8mGmkbkqRjia
 sJ3rVD0peeRXw==
Message-ID: <7e60b63c-2bf7-a77e-fe0f-a891efa77a47@collabora.com>
Date: Thu, 19 May 2022 10:05:07 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.0
Subject: Re: [PATCH v2 6/7] clk: mediatek: Export required symbols to compile
 clk drivers as module
Content-Language: en-US
To: Miles Chen <miles.chen@mediatek.com>
Cc: bgolaszewski@baylibre.com, chun-jie.chen@mediatek.com,
 ck.hu@mediatek.com, devicetree@vger.kernel.org, fparent@baylibre.com,
 ikjn@chromium.org, jason-jh.lin@mediatek.com, kernel@collabora.com,
 konrad.dybcio@somainline.org, krzysztof.kozlowski+dt@linaro.org,
 linux-arm-kernel@lists.infradead.org, linux-clk@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org,
 marijn.suijten@somainline.org, martin.botka@somainline.org,
 matthias.bgg@gmail.com, mturquette@baylibre.com, p.zabel@pengutronix.de,
 paul.bouchara@somainline.org, phone-devel@vger.kernel.org,
 rex-bc.chen@mediatek.com, robh+dt@kernel.org, sam.shih@mediatek.com,
 sboyd@kernel.org, tinghan.shen@mediatek.com, weiyi.lu@mediatek.com,
 wenst@chromium.org, y.oudjana@protonmail.com,
 ~postmarketos/upstreaming@lists.sr.ht
References: <20220518111652.223727-7-angelogioacchino.delregno@collabora.com>
 <20220519044153.11078-1-miles.chen@mediatek.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <20220519044153.11078-1-miles.chen@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220519_010518_048985_57F1CC57 
X-CRM114-Status: GOOD (  15.15  )
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

Il 19/05/22 06:41, Miles Chen ha scritto:
> 
> Hi Angelo,
> 
>> In order to compile the clock drivers for various MediaTek SoCs as
>> modules, it is necessary to export a few functions from the MediaTek
>> specific clocks (and reset) libraries.
>>
>> Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
>> ---
>> drivers/clk/mediatek/clk-apmixed.c | 1 +
>> drivers/clk/mediatek/clk-cpumux.c  | 2 ++
>> drivers/clk/mediatek/clk-mtk.c     | 2 ++
>> drivers/clk/mediatek/reset.c       | 1 +
>> 4 files changed, 6 insertions(+)
>>
>> diff --git a/drivers/clk/mediatek/clk-apmixed.c b/drivers/clk/mediatek/clk-apmixed.c
>> index 6b0ab0a346e8..f126da693a7f 100644
>> --- a/drivers/clk/mediatek/clk-apmixed.c
>> +++ b/drivers/clk/mediatek/clk-apmixed.c
>> @@ -98,5 +98,6 @@ struct clk_hw *mtk_clk_register_ref2usb_tx(const char *name,
>>
>> 	return &tx->hw;
>> }
>> +EXPORT_SYMBOL_GPL(mtk_clk_register_ref2usb_tx);
>>
>> MODULE_LICENSE("GPL");
>> diff --git a/drivers/clk/mediatek/clk-cpumux.c b/drivers/clk/mediatek/clk-cpumux.c
>> index 2b5d48591738..25618eff6f2a 100644
>> --- a/drivers/clk/mediatek/clk-cpumux.c
>> +++ b/drivers/clk/mediatek/clk-cpumux.c
>> @@ -150,6 +150,7 @@ int mtk_clk_register_cpumuxes(struct device_node *node,
>>
>> 	return PTR_ERR(hw);
>> }
>> +EXPORT_SYMBOL_GPL(mtk_clk_register_cpumuxes);
>>
>> void mtk_clk_unregister_cpumuxes(const struct mtk_composite *clks, int num,
>> 				 struct clk_hw_onecell_data *clk_data)
>> @@ -166,5 +167,6 @@ void mtk_clk_unregister_cpumuxes(const struct mtk_composite *clks, int num,
>> 		clk_data->hws[mux->id] = ERR_PTR(-ENOENT);
>> 	}
>> }
>> +EXPORT_SYMBOL_GPL(mtk_clk_unregister_cpumuxes);
>>
>> MODULE_LICENSE("GPL");
>> diff --git a/drivers/clk/mediatek/clk-mtk.c b/drivers/clk/mediatek/clk-mtk.c
>> index 05a188c62119..41e60a7e8ff9 100644
>> --- a/drivers/clk/mediatek/clk-mtk.c
>> +++ b/drivers/clk/mediatek/clk-mtk.c
>> @@ -459,6 +459,7 @@ int mtk_clk_simple_probe(struct platform_device *pdev)
>> 	mtk_free_clk_data(clk_data);
>> 	return r;
>> }
>> +EXPORT_SYMBOL_GPL(mtk_clk_simple_probe);
>>
>> int mtk_clk_simple_remove(struct platform_device *pdev)
>> {
>> @@ -472,5 +473,6 @@ int mtk_clk_simple_remove(struct platform_device *pdev)
>>
>> 	return 0;
>> }
>> +EXPORT_SYMBOL_GPL(mtk_clk_simple_remove);
> 
> Thanks, I need this too. I am preparing a patch to use mtk_clk_simple_remove/mtk_clk_simple_probe
> for MT6779 clks first and maybe I can apply this to all MediaTek clk drivers.
> 
> Reviewed-by: Miles Chen <miles.chen@mediatek.com>

Hello Miles,

thanks for telling me, because my next step would have been exactly what
you're doing, for all MediaTek clk drivers... otherwise we'd be doing
redundant work going afterwards.

Regards,
Angelo

> 
> thanks,
> Miles
>>
>> MODULE_LICENSE("GPL");
>> diff --git a/drivers/clk/mediatek/reset.c b/drivers/clk/mediatek/reset.c
>> index 179505549a7c..290ceda84ce4 100644
>> --- a/drivers/clk/mediatek/reset.c
>> +++ b/drivers/clk/mediatek/reset.c
>> @@ -228,5 +228,6 @@ int mtk_register_reset_controller_with_dev(struct device *dev,
>>
>> 	return 0;
>> }
>> +EXPORT_SYMBOL_GPL(mtk_register_reset_controller_with_dev);
>>
>> MODULE_LICENSE("GPL");
>> -- 
>> 2.35.1
>>
>>


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
