Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4B3EAC7EE29
	for <linux-mediatek@archiver.kernel.org>; Thu,  8 Jun 2023 08:54:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=adTcZBz9OWDd0YL3dj8Mz3hmg8bus1P++ghuh8zcc84=; b=IMEj7oE/3CosVeU6Fnxga9ls00
	9t6hdi6A1bvCcWMuaE0STBl89lYQyEkJ/nzaFZGIJFznaJx5h2m3CjhMENGm7QKABlWXoJPeXXw+p
	blSoHEYXUA5LasgtdVwPBI2MoSjz1G4d7HK/obOrNHprC12NjDdkpIzd2JNB3uceFtz9ZoQaDIBr2
	fDu8YCXNM32Du1GOjYYJaaM6suz8AoXRA0YRtKUIQDvkBvTBjzE87N8kuGZdPgKaUlT+87XLZwjqC
	r5StXl9u9fCF/CE4V/Tc1Hm9zMHc55uSCLDtW57NWrKsNacn7bxhBGf4V3FZGxMPrkO3Jbn9Nrdfl
	lMwkTnpA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q7BP2-008bkx-2U;
	Thu, 08 Jun 2023 08:53:56 +0000
Received: from madras.collabora.co.uk ([2a00:1098:0:82:1000:25:2eeb:e5ab])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1q7BOz-008bjj-0S;
	Thu, 08 Jun 2023 08:53:54 +0000
Received: from [IPV6:2001:b07:2ed:14ed:a962:cd4d:a84:1eab] (unknown [IPv6:2001:b07:2ed:14ed:a962:cd4d:a84:1eab])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id 9C8D66606F17;
	Thu,  8 Jun 2023 09:53:50 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1686214431;
	bh=96X6k5oqBvIX1dBppWoB2S5z/C5qU+MMBXm3vBPWtl0=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=U3ly+JKpH51mwz8/4HmOI/6l6O91KLGeLtbNFx5lDpKMqv7TQ1mITadLrC40Su0BQ
	 QeRZtJIOhqTf/qwTJm/cqhT5+Cs1sp0y/uUMpZqu0LsaPGIDH0oVMkYtrTQ0THqqWS
	 8/31HkQESvhMEK2XMNloIwjBBUbQzCgQa1fvDLhbn32ipbD0dqkUJM6HsEuAteAkib
	 WYfcG5cleEOcK2/o+RH6gjQqsF0Qjo4AfOZPwUgeWGsX/7LccV0RiClCGDyabE/rd2
	 VzzDqxDow1OjcBisJ9WaIL7Pvhpi33MgY5E+SdEhBPyilu9EIz8kimWqBEhVTMnaIg
	 kYcYMRlXm2qDw==
Message-ID: <38e5ffa2-93bd-ce70-ec00-6d61bad969c7@collabora.com>
Date: Thu, 8 Jun 2023 10:53:47 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.2
Subject: Re: [PATCH v2 4/5] clk: mediatek: mt8183: Add CLK_VDEC_ACTIVE to vdec
Content-Language: en-US
To: Chen-Yu Tsai <wenst@chromium.org>,
 =?UTF-8?B?TsOtY29sYXMgRi4gUi4gQS4gUHJhZG8=?= <nfraprado@collabora.com>
Cc: Matthias Brugger <matthias.bgg@gmail.com>,
 Hans Verkuil <hverkuil-cisco@xs4all.nl>, kernel@collabora.com,
 Conor Dooley <conor+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Michael Turquette <mturquette@baylibre.com>,
 Miles Chen <miles.chen@mediatek.com>, Rob Herring <robh+dt@kernel.org>,
 Stephen Boyd <sboyd@kernel.org>, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-clk@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org
References: <20230607205714.510012-1-nfraprado@collabora.com>
 <20230607205714.510012-5-nfraprado@collabora.com>
 <CAGXv+5EgP+0fTDhdpnYDCVQAWtWqwKp=Xxh-pHc1137wHoywRQ@mail.gmail.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <CAGXv+5EgP+0fTDhdpnYDCVQAWtWqwKp=Xxh-pHc1137wHoywRQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230608_015353_318580_48FB5346 
X-CRM114-Status: GOOD (  20.09  )
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

Il 08/06/23 09:43, Chen-Yu Tsai ha scritto:
> On Thu, Jun 8, 2023 at 4:57 AM Nícolas F. R. A. Prado
> <nfraprado@collabora.com> wrote:
>>
>> Add the CLK_VDEC_ACTIVE clock to the vdec clock driver. This clock is
>> enabled by the VPU once it starts decoding.
>>
>> Signed-off-by: Nícolas F. R. A. Prado <nfraprado@collabora.com>
>>
>> ---
>>
>> Changes in v2:
>> - Added CLK_IGNORE_UNUSED flag
>>
>>   drivers/clk/mediatek/clk-mt8183-vdec.c | 5 +++++
>>   include/dt-bindings/clock/mt8183-clk.h | 3 ++-
>>   2 files changed, 7 insertions(+), 1 deletion(-)
>>
>> diff --git a/drivers/clk/mediatek/clk-mt8183-vdec.c b/drivers/clk/mediatek/clk-mt8183-vdec.c
>> index 513b7956cbea..03c4f1acfdb8 100644
>> --- a/drivers/clk/mediatek/clk-mt8183-vdec.c
>> +++ b/drivers/clk/mediatek/clk-mt8183-vdec.c
>> @@ -27,6 +27,10 @@ static const struct mtk_gate_regs vdec1_cg_regs = {
>>          GATE_MTK(_id, _name, _parent, &vdec0_cg_regs, _shift,   \
>>                  &mtk_clk_gate_ops_setclr_inv)
>>
>> +#define GATE_VDEC0(_id, _name, _parent, _shift)                \
>> +       GATE_MTK_FLAGS(_id, _name, _parent, &vdec0_cg_regs, _shift,     \
>> +               &mtk_clk_gate_ops_setclr, CLK_IGNORE_UNUSED)
> 
> I think what you want is a read-only gate clock only used for reading back
> the status. The ops would only have .is_enabled.

Technically, you're right... but I would delay the introduction of a RO GATE_MTK
clock for later, as it's not worth adding that for just one clock driver usage.

We're checking if the same can be applied to other SoCs as well - if it can,
then it would make sense to do that (small, yes), work... the point here is to
enable MT8183 decoders ASAP to enable decoder tests in KernelCI, along with
all of the other MediaTek Chromebooks.

Though, if you think that it is a good idea to add a RO gate right now, I don't
have any strong opinions against that.

Cheers,
Angelo

