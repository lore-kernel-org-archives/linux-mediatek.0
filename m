Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 797ADC433EF
	for <linux-mediatek@archiver.kernel.org>; Mon, 23 May 2022 09:49:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=u20FqdH682bTKQaWX/LQvucrTE7ICMzgLCasYorkcZ0=; b=N9oN+L/UjjGnW0
	tjDAp/XxYHS/Op9r5+uv9+o8hsnLCbGQ4aeRfX0syy2AC//bgm7Ml0oXOjmAQa8zmLXqjPJSkrpku
	8xBJ6SPCv8qgsTcCJtF1ReneYePWbqiTp9YohrR8BM3FiLids8mdbSgXMcRgrAakaRg/gVk9R7/oE
	o2xu8J7qnwYh61QEe/1UpFQqh5uZsStGTc89VXD2rvd74oz2lmqSiORRqm+jdtWJiF/HQO/IOacR4
	uf89fe9kd+f/FLkmhOyb4pqNefGsvR5Q+Wcl42TURa9pgrF1DqdrAuE/hvfTZT2Om2DyQxR251aCX
	O2lkEMXxzQ/ghLVMhO+Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nt4gI-002yRR-PM; Mon, 23 May 2022 09:48:54 +0000
Received: from bhuna.collabora.co.uk ([46.235.227.227])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nt3pI-002bFf-As; Mon, 23 May 2022 08:54:10 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (Authenticated sender: kholk11) with ESMTPSA id 6B8AB1F40045
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1653296046;
 bh=5Rz9++MofB5VX7lCcC6PcfJLnooPHyGb9BzFs4NR7Ek=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=Rn7uMyAi++FEAgt9YN7b/3tJ3AyEoknlpGFy5UppiR9PQ/BDoqeBZkqbUVnUbAed6
 NjJy5gaiUIJIZZ8CArLqSbazTfkgLTogGuGIZwwlPqG8yhPt1lcgydXm+5TR23u87R
 5vo89AurSnCoWq8uiUNwHI6UMCHlh0gp+Tt+KJ3wC7QOXLFCyNK83icA7BI/WAO27q
 u+xklQ48YrIEK5V3UrEOaFQj9MPaQc2FuXxyOCfJQBEuBMRlUCIvoqsmryN+TJn7UR
 e+s01xunyBMzTCLytsLirGxbkzT+HAngUpUrFI3LjKqTGqT5/bJRLZ19dv/Nh1SoZG
 9Tt4jqO/WA/kw==
Message-ID: <56598535-5aa4-020e-25fd-295416f4d979@collabora.com>
Date: Mon, 23 May 2022 10:54:03 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.0
Subject: Re: [PATCH 1/5] Input: mtk-pmic-keys - Add kerneldoc to driver
 structures
Content-Language: en-US
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc: matthias.bgg@gmail.com, mkorpershoek@baylibre.com,
 linux-input@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20220520125132.229191-1-angelogioacchino.delregno@collabora.com>
 <20220520125132.229191-2-angelogioacchino.delregno@collabora.com>
 <YosOsgPwMGuLk9dv@google.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <YosOsgPwMGuLk9dv@google.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220523_015408_850293_89A80906 
X-CRM114-Status: GOOD (  31.66  )
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

Il 23/05/22 06:33, Dmitry Torokhov ha scritto:
> Hi AngeloGioacchino,
> 
> On Fri, May 20, 2022 at 02:51:28PM +0200, AngeloGioacchino Del Regno wrote:
>> To enhance human readability, add kerneldoc to all driver structs.
> 
> I am doubtful that this is useful. The reason is that I believe
> kerneldoc format is only useful for documenting cross-subsystem APIs.
> Kerneldoc for driver-private data and functions simply pollutes API
> docs.
> 
>>
>> Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
>> ---
>>   drivers/input/keyboard/mtk-pmic-keys.c | 30 +++++++++++++++++++++++++-
>>   1 file changed, 29 insertions(+), 1 deletion(-)
>>
>> diff --git a/drivers/input/keyboard/mtk-pmic-keys.c b/drivers/input/keyboard/mtk-pmic-keys.c
>> index c31ab4368388..8e4fa7cd16e6 100644
>> --- a/drivers/input/keyboard/mtk-pmic-keys.c
>> +++ b/drivers/input/keyboard/mtk-pmic-keys.c
>> @@ -34,6 +34,13 @@
>>   #define MTK_PMIC_HOMEKEY_INDEX	1
>>   #define MTK_PMIC_MAX_KEY_COUNT	2
>>   
>> +/**
>> + * struct mtk_pmic_keys_regs - PMIC keys per-key registers
>> + * @deb_reg:             Debounced key status register
>> + * @deb_mask:            Bitmask of this key in status register
>> + * @intsel_reg:          Interrupt selector register
>> + * @intsel_mask:         Bitmask of this key in interrupt selector
>> + */
>>   struct mtk_pmic_keys_regs {
>>   	u32 deb_reg;
>>   	u32 deb_mask;
>> @@ -50,6 +57,11 @@ struct mtk_pmic_keys_regs {
>>   	.intsel_mask		= _intsel_mask,		\
>>   }
>>   
>> +/**
>> + * struct mtk_pmic_regs - PMIC Keys registers
>> + * @keys_regs:           Specific key registers
> 
> This new description of the structure and of the keys_regs does not add
> any information for me.
> 
>> + * @pmic_rst_reg:        PMIC Keys reset register
>> + */
>>   struct mtk_pmic_regs {
>>   	const struct mtk_pmic_keys_regs keys_regs[MTK_PMIC_MAX_KEY_COUNT];
>>   	u32 pmic_rst_reg;
>> @@ -85,15 +97,31 @@ static const struct mtk_pmic_regs mt6358_regs = {
>>   	.pmic_rst_reg = MT6358_TOP_RST_MISC,
>>   };
>>   
>> +/**
>> + * struct mtk_pmic_keys_info - PMIC Keys per-key params
>> + * @keys:                Pointer to main driver structure
> 
> That is obvious from the field definition.
> 
>> + * @regs:                Register offsets/masks for this key
> 
> Ditto.
> 
>> + * @keycode:             Key code for this key
> 
> Yep.
> 
>> + * @irq:                 Keypress or press/release interrupt
>> + * @irq_r:               Key release interrupt (optional)
>> + * @wakeup:              Indicates whether to use this key as a wakeup source
>> + */
>>   struct mtk_pmic_keys_info {
>>   	struct mtk_pmic_keys *keys;
>>   	const struct mtk_pmic_keys_regs *regs;
>>   	unsigned int keycode;
>>   	int irq;
>> -	int irq_r; /* optional: release irq if different */
>> +	int irq_r;
>>   	bool wakeup:1;
>>   };
>>   
>> +/**
>> + * struct mtk_pmic_keys - Main driver structure
>> + * @input_dev:           Input device pointer
> 
> I do not find this helpful.
> 
>> + * @dev:                 Device pointer
> 
> And neither this.
> 
>> + * @regmap:              Regmap handle
> 
> Nor this.
> 
>> + * @keys:                Per-key parameters
>> + */
>>   struct mtk_pmic_keys {
>>   	struct input_dev *input_dev;
>>   	struct device *dev;
>> -- 
>> 2.35.1
>>
> 
> In the end we ended up with something that now has a chance of
> introducing warning when someone changes code, for very little benefit,
> if any at all.
> 
> For driver-private data and functions we should rely on expressive
> variable and function names and only use comments for something that
> might be unclear or requires additional qualification.
> 

Hello Dmitry,

it's been very helpful for me to see kerneldoc documentation in the various
drivers across the kernel - helped me understanding what was going on in an
easier, more immediate way, especially when looking at drivers having some
kind of "complicated" flow.
About introducing warnings when someone changes code, I believe that this
may also be helpful (for a developer) in some *corner* cases, but I agree
that this is unnecessarily tedious in some others... in the end, it's all
about personal opinions...

Of course, some of the documentation being obvious is unavoidable when it
comes to kerneldoc as you either document 'em all, or nothing.

In any case, if you really dislike having this kind of documentation, I can
drop these commits and eventually add in-line comments to some variables to
make them perfectly understandable, or I can avoid documenting at all (even
though I am strongly for documenting things clearly).

Regards,
Angelo

> Thanks.
> 

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
