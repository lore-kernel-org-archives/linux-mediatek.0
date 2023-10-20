Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5FA14C001DF
	for <linux-mediatek@archiver.kernel.org>; Fri, 20 Oct 2023 07:52:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=c2O1BYlrL4l4P5iA7OPb6AoicxknOfSlzEKMKELc+H8=; b=EC5Qs0GQ/7rTZRwGwxLP6N9q/F
	JhnuecGfmSuYeIWbI/H39SWskRu4ACCUjzZi3qzm4pAv5W3quy0VAqoAqfzC5SMxz0+CwVFVQMRMr
	gajZKs+nAgkQoikE0kz0kSksCNTqTxukx0HYRITktDLbetQKy0+bNNvtG/XQzDVABRT6GCi8bZ7WQ
	BzffMW3o1hdpIVzi3FtcurVCiwqsU/MxhAQch+xB+xCKv1SojIR6OBYIHcHXJQm+LywYguEOlVr0d
	TkVm2uCKuidYIjMvvkBbiYz+NZssVtht6SQTAY1Z/AgvhbBX2QEBJRBuNth2vdusEh+UM+GAxekTe
	Z4/O5cng==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qtkJP-001Tlz-1M;
	Fri, 20 Oct 2023 07:52:51 +0000
Received: from madras.collabora.co.uk ([46.235.227.172])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qtkJM-001Tkt-0m;
	Fri, 20 Oct 2023 07:52:50 +0000
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id 7E974660734D;
	Fri, 20 Oct 2023 08:52:43 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1697788364;
	bh=s6xNo054UbCmvOigN/xb7evicnVwrAIzmcYcO9sC4HE=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=b0IaizazmmKSDzATXVjDiDjuLemdxVvtGRYn996pLgephr1lWEZqMVrNYJChj0LB0
	 FauAoQ/w+XXMFfhniM08Wdipt1DJGI8CjuK8HKX4auu2pQPGkP6XFh71QTWwJ265ea
	 Pl+MzL4qicK0k06YStkLzIrJrzuoRyXwDRr9x98atSPXnEkBFuwgom1IUCh2VD/wd1
	 0SPkkJu1+JyJUEmSdlmeiEoIc6mbaEySint/40eTGZ1pV+YIlZORnCkwddrNkWjfu7
	 3HY7ix3DucBa2WtvafdSdN0mIEiLsff+e6tWZjgkd1bXwBKaYQ87tiuEuVxXsraVdQ
	 BWYTqmEsPmXOA==
Message-ID: <0572689f-c127-4603-b21a-303f4f20f7d7@collabora.com>
Date: Fri, 20 Oct 2023 09:52:40 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] clk: mediatek: mt8186: Change I2C 4/5/6 ap clocks parent
 to infra
To: Chen-Yu Tsai <wenst@chromium.org>
Cc: sboyd@kernel.org, mturquette@baylibre.com, matthias.bgg@gmail.com,
 u.kleine-koenig@pengutronix.de, chun-jie.chen@mediatek.com,
 miles.chen@mediatek.com, linux-clk@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org
References: <20231019124914.13545-1-angelogioacchino.delregno@collabora.com>
 <CAGXv+5H0rUajeU-i8nYyV2xWFQTnzqxioZCCyyP_RZXKqmcugQ@mail.gmail.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <CAGXv+5H0rUajeU-i8nYyV2xWFQTnzqxioZCCyyP_RZXKqmcugQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231020_005248_628399_B72BC2E3 
X-CRM114-Status: GOOD (  15.08  )
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

Il 20/10/23 07:06, Chen-Yu Tsai ha scritto:
> On Thu, Oct 19, 2023 at 8:49 PM AngeloGioacchino Del Regno
> <angelogioacchino.delregno@collabora.com> wrote:
>>
>> Fix the parenting of clocks imp_iic_wrap_ap_clock_i2c{4-6}, as those
>> are effectively parented to infra_ao_i2c{4-6} and not to the I2C_AP.
>> This permits the correct (and full) enablement and disablement of the
>> I2C4, I2C5 and I2C6 bus clocks, satisfying the whole clock tree of
>> those.
>>
>> As an example, when requesting to enable imp_iic_wrap_ap_clock_i2c4:
>>
>> Before: infra_ao_i2c_ap -> imp_iic_wrap_ap_clock_i2c4
>> After:  infra_ao_i2c_ap -> infra_ao_i2c4 -> imp_iic_wrap_ap_clock_i2c4
>>
>> Fixes: 66cd0b4b0ce5 ("clk: mediatek: Add MT8186 imp i2c wrapper clock support")
>> Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
> 
> I'm curious about what led to discovering this error?
> 

I had lockups during boot when probing I2C, so some research led me to
discover that the clock tree wasn't fully satisfied... :-)

Cheers,
Angelo

> ChenYu
> 
>> ---
>>   drivers/clk/mediatek/clk-mt8186-imp_iic_wrap.c | 6 +++---
>>   drivers/clk/mediatek/clk-mt8186-infra_ao.c     | 6 +++---
>>   2 files changed, 6 insertions(+), 6 deletions(-)
>>
>> diff --git a/drivers/clk/mediatek/clk-mt8186-imp_iic_wrap.c b/drivers/clk/mediatek/clk-mt8186-imp_iic_wrap.c
>> index 640ccb553274..871b8ff4c287 100644
>> --- a/drivers/clk/mediatek/clk-mt8186-imp_iic_wrap.c
>> +++ b/drivers/clk/mediatek/clk-mt8186-imp_iic_wrap.c
>> @@ -29,11 +29,11 @@ static const struct mtk_gate imp_iic_wrap_clks[] = {
>>          GATE_IMP_IIC_WRAP(CLK_IMP_IIC_WRAP_AP_CLOCK_I2C3,
>>                  "imp_iic_wrap_ap_clock_i2c3", "infra_ao_i2c_ap", 3),
>>          GATE_IMP_IIC_WRAP(CLK_IMP_IIC_WRAP_AP_CLOCK_I2C4,
>> -               "imp_iic_wrap_ap_clock_i2c4", "infra_ao_i2c_ap", 4),
>> +               "imp_iic_wrap_ap_clock_i2c4", "infra_ao_i2c4", 4),
>>          GATE_IMP_IIC_WRAP(CLK_IMP_IIC_WRAP_AP_CLOCK_I2C5,
>> -               "imp_iic_wrap_ap_clock_i2c5", "infra_ao_i2c_ap", 5),
>> +               "imp_iic_wrap_ap_clock_i2c5", "infra_ao_i2c5", 5),
>>          GATE_IMP_IIC_WRAP(CLK_IMP_IIC_WRAP_AP_CLOCK_I2C6,
>> -               "imp_iic_wrap_ap_clock_i2c6", "infra_ao_i2c_ap", 6),
>> +               "imp_iic_wrap_ap_clock_i2c6", "infra_ao_i2c6", 6),
>>          GATE_IMP_IIC_WRAP(CLK_IMP_IIC_WRAP_AP_CLOCK_I2C7,
>>                  "imp_iic_wrap_ap_clock_i2c7", "infra_ao_i2c_ap", 7),
>>          GATE_IMP_IIC_WRAP(CLK_IMP_IIC_WRAP_AP_CLOCK_I2C8,
>> diff --git a/drivers/clk/mediatek/clk-mt8186-infra_ao.c b/drivers/clk/mediatek/clk-mt8186-infra_ao.c
>> index 837304cd0ed7..c490f1a310f8 100644
>> --- a/drivers/clk/mediatek/clk-mt8186-infra_ao.c
>> +++ b/drivers/clk/mediatek/clk-mt8186-infra_ao.c
>> @@ -132,7 +132,7 @@ static const struct mtk_gate infra_ao_clks[] = {
>>          GATE_INFRA_AO2(CLK_INFRA_AO_AUDIO_26M_BCLK, "infra_ao_audio26m", "clk26m", 4),
>>          GATE_INFRA_AO2(CLK_INFRA_AO_SSUSB_TOP_P1_HCLK, "infra_ao_ssusb_p1_hclk", "top_axi", 5),
>>          GATE_INFRA_AO2(CLK_INFRA_AO_SPI1, "infra_ao_spi1", "top_spi", 6),
>> -       GATE_INFRA_AO2(CLK_INFRA_AO_I2C4, "infra_ao_i2c4", "top_i2c", 7),
>> +       GATE_INFRA_AO2(CLK_INFRA_AO_I2C4, "infra_ao_i2c4", "infra_ao_i2c_ap", 7),
>>          GATE_INFRA_AO2(CLK_INFRA_AO_MODEM_TEMP_SHARE, "infra_ao_mdtemp", "clk26m", 8),
>>          GATE_INFRA_AO2(CLK_INFRA_AO_SPI2, "infra_ao_spi2", "top_spi", 9),
>>          GATE_INFRA_AO2(CLK_INFRA_AO_SPI3, "infra_ao_spi3", "top_spi", 10),
>> @@ -145,7 +145,7 @@ static const struct mtk_gate infra_ao_clks[] = {
>>          GATE_INFRA_AO2_FLAGS(CLK_INFRA_AO_SSPM, "infra_ao_sspm", "top_sspm", 15, CLK_IS_CRITICAL),
>>          GATE_INFRA_AO2(CLK_INFRA_AO_SSUSB_TOP_P1_SYS,
>>                         "infra_ao_ssusb_p1_sys", "top_ssusb_1p", 16),
>> -       GATE_INFRA_AO2(CLK_INFRA_AO_I2C5, "infra_ao_i2c5", "top_i2c", 18),
>> +       GATE_INFRA_AO2(CLK_INFRA_AO_I2C5, "infra_ao_i2c5", "infra_ao_i2c_ap", 18),
>>          GATE_INFRA_AO2(CLK_INFRA_AO_I2C5_ARBITER, "infra_ao_i2c5a", "top_i2c", 19),
>>          GATE_INFRA_AO2(CLK_INFRA_AO_I2C5_IMM, "infra_ao_i2c5_imm", "top_i2c", 20),
>>          GATE_INFRA_AO2(CLK_INFRA_AO_I2C1_ARBITER, "infra_ao_i2c1a", "top_i2c", 21),
>> @@ -167,7 +167,7 @@ static const struct mtk_gate infra_ao_clks[] = {
>>                               CLK_IS_CRITICAL),
>>          GATE_INFRA_AO3_FLAGS(CLK_INFRA_AO_SSPM_32K_SELF, "infra_ao_sspm_32k", "clk32k", 4,
>>                               CLK_IS_CRITICAL),
>> -       GATE_INFRA_AO3(CLK_INFRA_AO_I2C6, "infra_ao_i2c6", "top_i2c", 6),
>> +       GATE_INFRA_AO3(CLK_INFRA_AO_I2C6, "infra_ao_i2c6", "infra_ao_i2c_ap", 6),
>>          GATE_INFRA_AO3(CLK_INFRA_AO_AP_MSDC0, "infra_ao_ap_msdc0", "top_axi", 7),
>>          GATE_INFRA_AO3(CLK_INFRA_AO_MD_MSDC0, "infra_ao_md_msdc0", "top_axi", 8),
>>          GATE_INFRA_AO3(CLK_INFRA_AO_MSDC0_SRC, "infra_ao_msdc0_clk", "top_msdc50_0", 9),
>> --
>> 2.42.0
>>


