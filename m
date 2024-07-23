Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 32350C3DA49
	for <linux-mediatek@archiver.kernel.org>; Tue, 23 Jul 2024 15:10:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=upD3xZYHA/4UxbOnLe78dlaBSpWCNhrejTEqH4d7C8s=; b=fcdmwkZc8DkIGA/bxy/Ur9MYWJ
	Su8wAA5JXqs/1r6/FBohIH5AT3GCg2qfFx6Akx83Lczj2XFRolQA0h/T3ewZ58rYEPYwCfqGZByxk
	eagTFvVZx1/JMHrKHs74jHFqU+Swz77i7INnZ6iaQDTBvsWIZCc3hy+P/w1akXe4LC1MEN9hyyQao
	8KTiVBdq2pZhnDYoPB5okLd9z55QoJX2Up9S/pQtxjnj+kZXx0kuOcuLfJx042HnOOSNqOgpuFsMe
	qcjEWovaLT9OQoKmuKiI5Myg69qJFSQ2lbFcDPD/eKImsnjCMGHssX74NPB74cEF1VGuCPI4/fNg2
	9WnPPOfw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sWH9n-0000000CqNq-3jjl;
	Tue, 23 Jul 2024 15:10:27 +0000
Received: from madrid.collaboradmins.com ([2a00:1098:ed:100::25])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sWH95-0000000CqB8-02O7;
	Tue, 23 Jul 2024 15:09:45 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1721747381;
	bh=IFA0f0H2+BKUdtT7ASlZ9IlkMsU/NNr/hRsLL9ngWBo=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=MNVOINArCTbTOujGas+WJjwodQFIc0zvFc7Xy9rkyRHfS/9IIdjtqmjybqodXl00x
	 Ltx/jB5BV16CLDad5v65fBk5etR9p6Vd5crB1mE0JLLPww6itC/j+tR9gPNC+swjfj
	 mDG1VdZPTHxWWO0pA963vZKiujzOPpfDogzGJUqZUlSn1F5ugkIqm98J5i+jYUKKTl
	 CEfp2di0KcDEXGXcDvnnTQ3yJnHrht0JEg3LK1L5AvLXvBwL140CUT4Kb0/mjgSW/G
	 vd2fuMg/lzLE1x9UWulYLDW4imSkDITqR8nNnsDJY9UbePOpzGKShjj2QKGe/pWqA4
	 fwAHLs51ueOKw==
Received: from [100.113.186.2] (cola.collaboradmins.com [195.201.22.229])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madrid.collaboradmins.com (Postfix) with ESMTPSA id 22C4137804D4;
	Tue, 23 Jul 2024 15:09:41 +0000 (UTC)
Message-ID: <0e278e57-139b-4074-ab3a-d35cef79e7f8@collabora.com>
Date: Tue, 23 Jul 2024 17:09:40 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] clk: mediatek: reset: Remove unused
 mtk_register_reset_controller()
To: Fei Shao <fshao@chromium.org>
Cc: sboyd@kernel.org, matthias.bgg@gmail.com, mturquette@baylibre.com,
 p.zabel@pengutronix.de, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 linux-clk@vger.kernel.org, kernel@collabora.com
References: <20240718082528.220750-1-angelogioacchino.delregno@collabora.com>
 <CAC=S1nhmuGfaQrK-3TZzY3-c1_cDbB5g_Zp2nXOzg6zQZ-j4Lw@mail.gmail.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <CAC=S1nhmuGfaQrK-3TZzY3-c1_cDbB5g_Zp2nXOzg6zQZ-j4Lw@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240723_080943_204695_A7CCD0DF 
X-CRM114-Status: GOOD (  17.69  )
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

Il 18/07/24 11:41, Fei Shao ha scritto:
> On Thu, Jul 18, 2024 at 4:26 PM AngeloGioacchino Del Regno
> <angelogioacchino.delregno@collabora.com> wrote:
>>
>> Now that all clock controllers have been migrated to the new
>> mtk_register_reset_controller_with_dev() function, the one taking
>> struct device node is now unused: remove it.
>>
>> Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
>> ---
>>   drivers/clk/mediatek/reset.c | 59 ------------------------------------
>>   drivers/clk/mediatek/reset.h | 10 ------
>>   2 files changed, 69 deletions(-)
>>
>> diff --git a/drivers/clk/mediatek/reset.c b/drivers/clk/mediatek/reset.c
>> index 290ceda84ce4..069f9e909cb0 100644
>> --- a/drivers/clk/mediatek/reset.c
>> +++ b/drivers/clk/mediatek/reset.c
>> @@ -110,65 +110,6 @@ static int reset_xlate(struct reset_controller_dev *rcdev,
>>          return data->desc->rst_idx_map[reset_spec->args[0]];
>>   }
>>
>> -int mtk_register_reset_controller(struct device_node *np,
>> -                                 const struct mtk_clk_rst_desc *desc)
>> -{
>> -       struct regmap *regmap;
>> -       const struct reset_control_ops *rcops = NULL;
>> -       struct mtk_clk_rst_data *data;
>> -       int ret;
>> -
>> -       if (!desc) {
>> -               pr_err("mtk clock reset desc is NULL\n");
>> -               return -EINVAL;
>> -       }
>> -
>> -       switch (desc->version) {
>> -       case MTK_RST_SIMPLE:
>> -               rcops = &mtk_reset_ops;
>> -               break;
>> -       case MTK_RST_SET_CLR:
>> -               rcops = &mtk_reset_ops_set_clr;
>> -               break;
>> -       default:
>> -               pr_err("Unknown reset version %d\n", desc->version);
>> -               return -EINVAL;
>> -       }
>> -
>> -       regmap = device_node_to_regmap(np);
>> -       if (IS_ERR(regmap)) {
>> -               pr_err("Cannot find regmap for %pOF: %pe\n", np, regmap);
>> -               return -EINVAL;
>> -       }
>> -
>> -       data = kzalloc(sizeof(*data), GFP_KERNEL);
>> -       if (!data)
>> -               return -ENOMEM;
>> -
>> -       data->desc = desc;
>> -       data->regmap = regmap;
>> -       data->rcdev.owner = THIS_MODULE;
>> -       data->rcdev.ops = rcops;
>> -       data->rcdev.of_node = np;
>> -
>> -       if (data->desc->rst_idx_map_nr > 0) {
>> -               data->rcdev.of_reset_n_cells = 1;
>> -               data->rcdev.nr_resets = desc->rst_idx_map_nr;
>> -               data->rcdev.of_xlate = reset_xlate;
>> -       } else {
>> -               data->rcdev.nr_resets = desc->rst_bank_nr * RST_NR_PER_BANK;
>> -       }
>> -
>> -       ret = reset_controller_register(&data->rcdev);
>> -       if (ret) {
>> -               pr_err("could not register reset controller: %d\n", ret);
>> -               kfree(data);
>> -               return ret;
>> -       }
>> -
>> -       return 0;
>> -}
>> -
>>   int mtk_register_reset_controller_with_dev(struct device *dev,
>>                                             const struct mtk_clk_rst_desc *desc)
> 
> I guess that means the "_with_dev" suffix here becomes redundant and
> therefore can be removed.
> Do you want to update it all together?
> 

Makes sense to add another commit that performs the rename... yeah.

Cheers,
Angelo

> Regards,
> Fei
> 
> 
>>   {
>> diff --git a/drivers/clk/mediatek/reset.h b/drivers/clk/mediatek/reset.h
>> index 6a58a3d59165..562ffd290a22 100644
>> --- a/drivers/clk/mediatek/reset.h
>> +++ b/drivers/clk/mediatek/reset.h
>> @@ -59,16 +59,6 @@ struct mtk_clk_rst_data {
>>          const struct mtk_clk_rst_desc *desc;
>>   };
>>
>> -/**
>> - * mtk_register_reset_controller - Register MediaTek clock reset controller
>> - * @np: Pointer to device node.
>> - * @desc: Constant pointer to description of clock reset.
>> - *
>> - * Return: 0 on success and errorno otherwise.
>> - */
>> -int mtk_register_reset_controller(struct device_node *np,
>> -                                 const struct mtk_clk_rst_desc *desc);
>> -
>>   /**
>>    * mtk_register_reset_controller - Register mediatek clock reset controller with device
>>    * @np: Pointer to device.
>> --
>> 2.45.2
>>
>>



