Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 89941C6FA82
	for <linux-mediatek@archiver.kernel.org>; Tue, 13 Sep 2022 15:19:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=+yuVgsOs/l3ubVhwqpZtpBtZF3qEpn3Qpj+L4hbpCdM=; b=iPH3lSc7WlzbnqRMp3VSMthYtt
	Q6V9iLQQkezIOIc+rMhfHMRGSkcCo6gJx3RqbqdmazjVnU3g/+3cOTf7LhQA5Sg2knk2tNlE6w+B1
	xbZcQVQbjQp3pEbktFQ1n4kcL4vHnLUeJsZjPwtPIsEUb436TmQyazmKm6xYgJlImCR2ImNPzDtw1
	y0/MICM6QghFCYOiEF5rvkNJkGSVMDH47ok1Ktii4PSqIfclgZTo/rNKyTjjYcR1E+nIbGfj2g+jC
	Q+n8mL5vZxUjozvocyPi2lZ/bbtYXasP56XnR/g7QurgRsoQPRR1/Ar2iaSgg0TCF0hSUDbLwfnJb
	fT+HEv9A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oY7gh-00CMzl-V0; Tue, 13 Sep 2022 15:19:00 +0000
Received: from madras.collabora.co.uk ([46.235.227.172])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oY7TA-00C8xg-5J; Tue, 13 Sep 2022 15:05:02 +0000
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id 30B4D6600014;
	Tue, 13 Sep 2022 16:04:55 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1663081496;
	bh=Y7SuvEzRQqxCRPnos88wzHGHgs9hmIxCXEYqOBc1xyc=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=GAzdmAduclaUF2vAhKVmAbPYWRl0wOF3ZKgFs3+tvB9U3bX/hUlS9vjl5Tx9nFPAh
	 WUf0+4/Y518oaNrpprBqsNHq0+rog3z6UOr849afpr5xmPwBNoZ0SwgnaI9e/agbTz
	 ytZ/e6dzGz3foPlWzX7TV8/EpKHG/dfV8aa4DgnIqCQRMlBKAggORDsva1qgjrL9ea
	 wwanLhBsH74dF1cODN04c15VTE/0jo8I8sbzxsS0cpBtZJhQYLG1/gYH1nS5pkxypv
	 gGPJKlzG/+0bVvXN2z/dohhG2UW2dfP9gI7v2RV69bXAkWpkx5G3XgObZYOHuTRNFv
	 dgkOjba/n/EyA==
Message-ID: <be9e629b-d6d8-7387-71d7-b597e95f12a1@collabora.com>
Date: Tue, 13 Sep 2022 17:04:52 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.0
Subject: Re: [PATCH v5 2/3] iommu/mediatek: Introduce new flag
 TF_PORT_TO_ADDR_MT8173
Content-Language: en-US
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, joro@8bytes.org
Cc: yong.wu@mediatek.com, will@kernel.org, robh+dt@kernel.org,
 krzysztof.kozlowski+dt@linaro.org, matthias.bgg@gmail.com,
 iommu@lists.linux-foundation.org, linux-mediatek@lists.infradead.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, konrad.dybcio@somainline.org,
 marijn.suijten@somainline.org, martin.botka@somainline.org,
 ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org,
 paul.bouchara@somainline.org
References: <20220913122428.374280-1-angelogioacchino.delregno@collabora.com>
 <20220913122428.374280-3-angelogioacchino.delregno@collabora.com>
 <29758c95-e77a-5105-f03e-22ea94d9a569@linaro.org>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <29758c95-e77a-5105-f03e-22ea94d9a569@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220913_080500_563355_82C3F9AF 
X-CRM114-Status: GOOD (  16.56  )
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

Il 13/09/22 16:00, Krzysztof Kozlowski ha scritto:
> On 13/09/2022 14:24, AngeloGioacchino Del Regno wrote:
>> In preparation for adding support for MT6795, add a new flag named
>> TF_PORT_TO_ADDR_MT8173 and use that instead of checking for m4u_plat
>> type in mtk_iommu_hw_init() to avoid seeing a long list of m4u_plat
>> checks there in the future.
>>
>> Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
>> Reviewed-by: Yong Wu <yong.wu@mediatek.com>
>> ---
>>   drivers/iommu/mtk_iommu.c | 6 ++++--
>>   drivers/memory/mtk-smi.c  | 1 +
>>   2 files changed, 5 insertions(+), 2 deletions(-)

..snip..

>> diff --git a/drivers/memory/mtk-smi.c b/drivers/memory/mtk-smi.c
>> index 5a9754442bc7..cd415ed1f4ca 100644
>> --- a/drivers/memory/mtk-smi.c
>> +++ b/drivers/memory/mtk-smi.c
>> @@ -462,6 +462,7 @@ static int mtk_smi_larb_sleep_ctrl_enable(struct mtk_smi_larb *larb)
>>   	if (ret) {
>>   		/* TODO: Reset this larb if it fails here. */
>>   		dev_err(larb->smi.dev, "sleep ctrl is not ready(0x%x).\n", tmp);
>> +		ret = -EAGAIN;
> 
> Doesn't look related nor explained in commit msg.

This is because it's not related.. not explained... and embarassing, as something
went wrong during the rebase.

Many thanks for pinging me about that, I'm immediately sending a new version.

Regards,
Angelo



