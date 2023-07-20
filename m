Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0CD2AEB64DA
	for <linux-mediatek@archiver.kernel.org>; Thu, 20 Jul 2023 12:47:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=kgx6Uzzb+2Pwbgu2HusCab5jWgEiRim3XVUDhjT5MQc=; b=dpnBiySavwW8Fm59ZKj+hE78zA
	siCROm/IARh1STbwDgSe0CpQVfY5LWCHd7fwJsoSrV98nwPoUKV9NFnX88/Q50cj58YG9xibB6ZL4
	iEfBCcec6Dr+UBj03vYnR/K010uWJ6IZw7IDhVegMPrGr2d4t5sY4ogXu/KAFXAmWlC2R7sM4yosE
	uEkIW29rh9xHOUIDRmx1EdxkRiOyg+Rp3IfxUi9TpVpbCS7g8Fhlyo21bTTxhhX0nWOO4wC6ODSyu
	qiiL+Fl4Vhi0X6NQBSMvV4+Zrm2Lia+oXCnKsN/zuA52r4U29CxRpTkXcYNDqV0femn6eR7XliRyR
	zcFf1ZjQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qMT4R-00BAfl-38;
	Thu, 20 Jul 2023 12:47:51 +0000
Received: from madras.collabora.co.uk ([2a00:1098:0:82:1000:25:2eeb:e5ab])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qMT4O-00BAen-0N;
	Thu, 20 Jul 2023 12:47:49 +0000
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id E9B41660703D;
	Thu, 20 Jul 2023 13:47:45 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1689857266;
	bh=ZgHpOz5P4a3+RUYc0FlSzSAD1mZgKKcEW/6wH6JQze4=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=kl4krZJ+/sd7l3cwiDMFKJ5bakRMFaUfX1KhVTaIRt8bS4NM3VagGYjfqxatp7/5y
	 HZMk1XhgFnlkAazOf2OOdflrkkh4AO+biZ5Ia5Us88mU2WGyEYW6tXkwTfyzyJqIKB
	 Vuc3oLvOdFe0+XoYUdHUk6idBEtovXYBHTctZ+8pAj75Ow6rJhbq07ftjgFrf6mnI5
	 Q5AbibEg3V85VC5nxOquc+oyQqSMFwSJTDHclbbHxRPLeeHqaeQqR6p7A70xm7bzac
	 wh7W890bqFnTS4KK+7yCygZHthCzCkce2BHn5n6jElCTcPJLMOWYt8I+5XxKc7Asq+
	 Fd4i3BelVSMMA==
Message-ID: <c2b8d1dc-fdbe-5ea6-89d6-6b1113fc3a55@collabora.com>
Date: Thu, 20 Jul 2023 14:47:43 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Subject: Re: [PATCH v2] media: mdp3: Fix resource leak in a
 for_each_child_of_node() loop
Content-Language: en-US
To: Lu Hongfei <luhongfei@vivo.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Hans Verkuil <hverkuil-cisco@xs4all.nl>, Moudy Ho <moudy.ho@mediatek.com>,
 Arnd Bergmann <arnd@arndb.de>, Sun Ke <sunke32@huawei.com>,
 Deepak R Varma <drv@mailo.com>,
 "linux-media@vger.kernel.org" <linux-media@vger.kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "linux-arm-kernel@lists.infradead.org"
 <linux-arm-kernel@lists.infradead.org>,
 "linux-mediatek@lists.infradead.org" <linux-mediatek@lists.infradead.org>
Cc: "opensource.kernel" <opensource.kernel@vivo.com>
References: <20230720062248.37906-1-luhongfei@vivo.com>
 <32ae3716-672f-cdc2-f246-d8336ed44a68@collabora.com>
 <30bf6cc7-615b-52c5-0c23-f8b4be890e5e@vivo.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <30bf6cc7-615b-52c5-0c23-f8b4be890e5e@vivo.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230720_054748_383064_9DA6EB10 
X-CRM114-Status: GOOD (  16.96  )
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

Il 20/07/23 14:19, Lu Hongfei ha scritto:
> On 2023/7/20 15:51, AngeloGioacchino Del Regno wrote:
>> [Some people who received this message don't often get email from
>> angelogioacchino.delregno@collabora.com. Learn why this is important
>> at https://aka.ms/LearnAboutSenderIdentification ]
>>
>> Il 20/07/23 08:23, Lu Hongfei ha scritto:
>>> for_each_child_of_node should have of_node_put()
>>> in error path avoid resource leaks.
>>>
>>> Signed-off-by: Lu Hongfei <luhongfei@vivo.com>
>>> ---
>>> Changelog:
>>> v1->v2:
>>> 1. Change the subject line of this patch to include driver name.
>>> 2. Remove the unneeded of_node_put.
>>>
>>>    drivers/media/platform/mediatek/mdp3/mtk-mdp3-comp.c | 1 +
>>>    1 file changed, 1 insertion(+)
>>>
>>> diff --git a/drivers/media/platform/mediatek/mdp3/mtk-mdp3-comp.c
>>> b/drivers/media/platform/mediatek/mdp3/mtk-mdp3-comp.c
>>> index a605e80c7dc3..40c4b79a5090 100644
>>> --- a/drivers/media/platform/mediatek/mdp3/mtk-mdp3-comp.c
>>> +++ b/drivers/media/platform/mediatek/mdp3/mtk-mdp3-comp.c
>>> @@ -1135,6 +1135,7 @@ int mdp_comp_config(struct mdp_dev *mdp)
>>>                comp = mdp_comp_create(mdp, node, id);
>>>                if (IS_ERR(comp)) {
>>>                        ret = PTR_ERR(comp);
>>> +                     of_node_put(node);
>>>                        goto err_init_comps;
>>>                }
>>>
>>
>> In case mdp_comp_sub_create() fails, we still want to decrease the
>> refcount
>> of `node`....
>>
>> ...so, just call of_node_put(node) just once, at the err_init_comps
>> label.
>>
>> err_init_comps:
>>         mdp_comp_destroy(mdp);
>>         of_node_put(node);
>>         return ret;
>>
>> Regards,
>> Angelo
> 
> mdp_comp_sub_create() executes after for_each_child_of_node loop ends.
> 
> The for_each_child_of_node loop ended, node == NULL and there is nothing
> to put.
> 
> So I don't think it's necessary to decrease the refcount of `node` again
> when
> 
> mdp_comp_sub_create() fails.
> 
> Or you could further explain the reason for doing so.
> 

You're right. My bad.

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>

