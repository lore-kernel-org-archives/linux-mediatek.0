Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6893BC636CD
	for <linux-mediatek@archiver.kernel.org>; Tue, 31 Jan 2023 08:33:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=DqXy7fTBvNM2u5MEHqeap/HvV+T3KMcyiZIUQQgAtlk=; b=plKUKfv49KrAQNIQNVutA6khp6
	hlc2IO2+pxkMWmK4L7ut1tMTAmgPEU/g2MjHZ4a6IIDwe4DIh370WtrjG8aOQiJ8xfx+jY2Ow3yml
	pPwWMTeGDUENJnEVm2dqF8KVkQJk8eZOF/+JF3hh2UNj5X57HWyObgpXrtx4swrcOU+76+JfDYwkj
	JNpLV+yu/x/Z7YynGEY1av7gBH/Ly6iqDKmB4KK+mCq2R8hEdM0VcGiUTr6LXx4nC/cXQwcDsTcQy
	UY2W0ND1I8OpqRfffhwtMmxB27YGPTUXvCpb29w451z+LoOEtFKT6Z483LCw5Y3f3Gs9EVTmm0qjU
	EeGvVJXQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pMm4v-006juq-S9; Tue, 31 Jan 2023 08:33:21 +0000
Received: from madras.collabora.co.uk ([2a00:1098:0:82:1000:25:2eeb:e5ab])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pMm4j-006joq-NH; Tue, 31 Jan 2023 08:33:11 +0000
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id F017D6602EB0;
	Tue, 31 Jan 2023 08:33:04 +0000 (GMT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1675153985;
	bh=8znNGnB3SZ5cMbqV4jYJqOpR3KhVL1tOkUowpw7M7lI=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=QR6WyMzjxsw8hGag04dgpgrY88QAtxbgvKqMCA7HAk5/4CKFfp3XFXPD4poTOry+3
	 kBlxjC3qHq4r1EpXxJOqwqVrvjZgrZwfsxGxHCvi35GTktfsQ0wAVMvwta6LxYJMfL
	 HRMov1gkLvu5WQVPQciv3i2IVl3rf/RWWY4urQh44lcU9nlfByExrMz0WTXabdqwol
	 Ic4rI7pwy+xUhCSP2vSF8dWVY/NFCfFKwiadqRcJMmhGpamv+dpcGJZQGId6BMJiWN
	 uMF9XVf16eOTtJsqqg+/WRNQPbSM8RAsO+7Bwt0hTkiqqnoCao81C7FyczQNSfx/b2
	 NFp+/csgiCgew==
Message-ID: <d3d913f3-d898-26c5-7c05-01b67826e662@collabora.com>
Date: Tue, 31 Jan 2023 09:33:01 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.1
Subject: Re: [PATCH v6 3/4] clk: mediatek: remove MT8195 vppsys/0/1
 simple_probe
To: Stephen Boyd <sboyd@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Michael Turquette <mturquette@baylibre.com>, Moudy Ho
 <moudy.ho@mediatek.com>, Rob Herring <robh+dt@kernel.org>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 linux-clk@vger.kernel.org, Project_Global_Chrome_Upstream_Group@mediatek.com
References: <20230118031509.29834-1-moudy.ho@mediatek.com>
 <20230118031509.29834-4-moudy.ho@mediatek.com>
 <fe49e8b642c4c33fee37e97d957c37a3.sboyd@kernel.org>
Content-Language: en-US
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <fe49e8b642c4c33fee37e97d957c37a3.sboyd@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230131_003310_001391_0A223EE8 
X-CRM114-Status: GOOD (  13.77  )
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

Il 30/01/23 20:36, Stephen Boyd ha scritto:
> Quoting Moudy Ho (2023-01-17 19:15:08)
>> diff --git a/drivers/clk/mediatek/clk-mt8195-vpp0.c b/drivers/clk/mediatek/clk-mt8195-vpp0.c
>> index bf2939c3a023..6d5800f69f6c 100644
>> --- a/drivers/clk/mediatek/clk-mt8195-vpp0.c
>> +++ b/drivers/clk/mediatek/clk-mt8195-vpp0.c
>> @@ -86,26 +86,54 @@ static const struct mtk_gate vpp0_clks[] = {
>>          GATE_VPP0_2(CLK_VPP0_WARP1_MDP_DL_ASYNC, "vpp0_warp1_mdp_dl_async", "top_wpe_vpp", 3),
>>   };
>>   
>> -static const struct mtk_clk_desc vpp0_desc = {
>> -       .clks = vpp0_clks,
>> -       .num_clks = ARRAY_SIZE(vpp0_clks),
>> -};
>> +static int clk_mt8195_vpp0_probe(struct platform_device *pdev)
>> +{
>> +       struct device *dev = &pdev->dev;
>> +       struct device_node *node = dev->parent->of_node;
>> +       struct clk_onecell_data *clk_data;
>> +       int r;
>>   
>> -static const struct of_device_id of_match_clk_mt8195_vpp0[] = {
>> -       {
>> -               .compatible = "mediatek,mt8195-vppsys0",
>> -               .data = &vpp0_desc,
>> -       }, {
>> -               /* sentinel */
>> -       }
>> -};
>> +       clk_data = mtk_alloc_clk_data(CLK_VPP0_NR_CLK);
>> +       if (!clk_data)
>> +               return -ENOMEM;
>> +
>> +       r = mtk_clk_register_gates(node, vpp0_clks, ARRAY_SIZE(vpp0_clks), clk_data);
> 
> This API is wrecked by a patch from AngeloGioacchino. Can you resend, or
> tell me which device should be used here?

mtk_clk_register_gates(&pdev->dev, node, vpp0_clks, ......);


...with that change, for this patch:

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>

P.S.: Next cleanup round will introduce mtk_clk_pdev_simple_probe()

Cheers,
Angelo

