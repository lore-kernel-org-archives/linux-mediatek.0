Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BE2F7C77B6E
	for <linux-mediatek@archiver.kernel.org>; Thu, 13 Apr 2023 13:28:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=iMlK8J5bKP7a7P5AUbI05aBpvuXS7JQTDM0MPaiIBGc=; b=gmKLKASq0LgEkDNEutezTNjnJd
	If8Ioyzb7GwYMclnKNKhw8pQYAJA31K4k0fHi8y6G/25rzmJDNnrGWlF5ZNuFdrQWm3lTkoMSMMrJ
	ts+X64jKf+nByD0UshIbBv+rL/Kwmzh44RXljbUgwuIhDvd1QI8MDNKtlPJzy15oabyRtMtMCw5Pj
	CaDfItTyA2CDjudpHUWYGzugVWXa01VaYN9Ihiy5sTNtBNfHO9dSI7+J64L+0JwHFAQ67cU4o8Eie
	wLVPwRONvlLfxztNeJpza46hLv4DA1DRtASelCmgNtCVTC5Yrknw3u8vqkCklsUQocDyZOfkt7636
	s/he9hRQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pmwzo-006GnZ-2w;
	Thu, 13 Apr 2023 13:28:16 +0000
Received: from madras.collabora.co.uk ([2a00:1098:0:82:1000:25:2eeb:e5ab])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pmwzk-006Glw-0G;
	Thu, 13 Apr 2023 13:28:13 +0000
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id DEB69660320D;
	Thu, 13 Apr 2023 14:28:09 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1681392490;
	bh=+UG3Aw14GYP+bIieZzqkjahGDQmJ0qqctQ+IhQ5UFyw=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=J2kxdD2xHzBaVwm8Mtqf6na1JY/jbb8pDkvRQr7ty+sFTF3ik3OQ1uhF7Kvtgx2ji
	 W9PpW/sIGytndJZZy4ZEZ11prmhTAel6CnhBZJZk1NwebDx/60F+XqfKfeYGVxIjbp
	 7VMJ5W8qit1UbsnI1B16Y0CmEWpYkGRbofcAYovhti4PBusixVEOs8CpnxWj1/ecyv
	 qwriiqyHfOP15yNIYeSxwzEND5UrmCwcd4ErdTnlf/QPU+tabslpHrMg4T8NKZwoTi
	 OPttLYaoEIn96VDE9NKjTLcubeZL+BEdaIcBn17gtIA9gBT0VOqwX9KnSwpAe8XgBf
	 9Qxw1x0VCg5oQ==
Message-ID: <22bb4f8f-8f4b-6efb-74ab-b33eabc1fbb9@collabora.com>
Date: Thu, 13 Apr 2023 15:28:07 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.1
Subject: Re: [PATCH v2] ARM:unwind:fix unwind abort for uleb128 case
Content-Language: en-US
To: Haibo Li <haibo.li@mediatek.com>, Russell King <linux@armlinux.org.uk>,
 Linus Walleij <linus.walleij@linaro.org>, amergnat@baylibre.com,
 linux-kernel@vger.kernel.org
Cc: Matthias Brugger <matthias.bgg@gmail.com>, xiaoming.yu@mediatek.com,
 Russell King <rmk+kernel@armlinux.org.uk>,
 Alex Sverdlin <alexander.sverdlin@nokia.com>,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 ardb@kernel.org, catalin.marinas@arm.com, a.anurag@samsung.com
References: <20230413073429.40050-1-haibo.li@mediatek.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <20230413073429.40050-1-haibo.li@mediatek.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230413_062812_254616_CE50D7C4 
X-CRM114-Status: GOOD (  24.80  )
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

Il 13/04/23 09:34, Haibo Li ha scritto:
> When unwind instruction is 0xb2,the subsequent instructions
> are uleb128 bytes.
> For now,it uses only the first uleb128 byte in code.
> 
> For vsp increments of 0x204~0x400,use one uleb128 byte like below:
> 0xc06a00e4 <unwind_test_work>: 0x80b27fac
>    Compact model index: 0
>    0xb2 0x7f vsp = vsp + 1024
>    0xac      pop {r4, r5, r6, r7, r8, r14}
> 
> For vsp increments larger than 0x400,use two uleb128 bytes like below:
> 0xc06a00e4 <unwind_test_work>: @0xc0cc9e0c
>    Compact model index: 1
>    0xb2 0x81 0x01 vsp = vsp + 1032
>    0xac      pop {r4, r5, r6, r7, r8, r14}
> The unwind works well since the decoded uleb128 byte is also 0x81.
> 
> For vsp increments larger than 0x600,use two uleb128 bytes like below:
> 0xc06a00e4 <unwind_test_work>: @0xc0cc9e0c
>    Compact model index: 1
>    0xb2 0x81 0x02 vsp = vsp + 1544
>    0xac      pop {r4, r5, r6, r7, r8, r14}
> In this case,the decoded uleb128 result is 0x101(vsp=0x204+(0x101<<2)).
> While the uleb128 used in code is 0x81(vsp=0x204+(0x81<<2)).
> The unwind aborts at this frame since it gets incorrect vsp.
> 
> To fix this,add uleb128 decode to cover all the above case.
> 
> Signed-off-by: Haibo Li <haibo.li@mediatek.com>
> ---
> v2:
> - As Linus Walleij and Alexandre Mergnat suggested,add comments for unwind_decode_uleb128
> - As Alexandre Mergnat suggested,change variables declaration in Alphabetical order
> ---
>   arch/arm/kernel/unwind.c | 25 ++++++++++++++++++++++++-
>   1 file changed, 24 insertions(+), 1 deletion(-)
> 
> diff --git a/arch/arm/kernel/unwind.c b/arch/arm/kernel/unwind.c
> index 53be7ea6181b..f37e55fcf81d 100644
> --- a/arch/arm/kernel/unwind.c
> +++ b/arch/arm/kernel/unwind.c
> @@ -308,6 +308,29 @@ static int unwind_exec_pop_subset_r0_to_r3(struct unwind_ctrl_block *ctrl,
>   	return URC_OK;
>   }
>   
> +static unsigned long unwind_decode_uleb128(struct unwind_ctrl_block *ctrl)
> +{
> +	unsigned long bytes = 0;
> +	unsigned long insn;
> +	unsigned long result = 0;
> +
> +	/* unwind_get_byte() will advance ctrl one instruction at a time,
> +	 * we loop until we get an instruction byte where bit 7 is not set.
> +	 * Note:It decodes max 4 bytes to output 28bits data.
> +	 * 28bits data(0xfffffff) covers vsp increments of 1073742336.
> +	 * It is sufficent for unwinding stack.
> +	 */

/*
  * unwind_get_byte() will advance `ctrl` one instruction at a time, so
  * loop until we get an instruction byte where bit 7 is not set.
  *
  * Note: This decodes a maximum of 4 bytes to output 28 bits data where
  * max is 0xfffffff: that will cover a vsp increment of 1073742336, hence
  * it is sufficient for unwinding the stack.
  */

> +	do {
> +		insn = unwind_get_byte(ctrl);
> +		result |= (insn & 0x7f) << (bytes * 7);
> +		bytes++;

also, I would do ...

	} while (!!(insn & 0x80) && bytes != sizeof(result));

...compressing the code and not creating any human readability concern.

after which, you can get my

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>



