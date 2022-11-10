Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AABD5C433FE
	for <linux-mediatek@archiver.kernel.org>; Thu, 10 Nov 2022 13:12:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=VpyhbGYLbgqQGq84zDVWwGbjefm7SUvj9DOXzK2A1TU=; b=wZNy/IoS0ckJXL0TCfnCHiuAFY
	xvHP55go2rnE9I9IQXmBrzQcWPEsUDUp6hMS8cTZmNdxGUy5AOdXlQWv86VftV57fwscYcH8xVRFu
	+RDpUr1KeL4cuLkcEPt9Mu0y6bPai/2O/u6HxjK4F/GGXNb+L38jQYnVOXG7zK6SBdxEK6V5leuk3
	P5w/6QEXLiI1JGBX7IWdE37O9CBpxpa6ExTmeKP+zCya/xHZvA+stMRjFaFV2/nn+7jvnVAY0jujU
	DXwsoNEaFf4Zf7SSXuCgZv3QJmh3ZJsi7mKNA0F3b0yUosY0VTQI/q7xh1l5uWajyYmL5U9zfOuRb
	GJ76xyeA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ot7Lz-005wVh-05; Thu, 10 Nov 2022 13:12:23 +0000
Received: from mail-wm1-x335.google.com ([2a00:1450:4864:20::335])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ot7Lm-005wPI-5Z; Thu, 10 Nov 2022 13:12:11 +0000
Received: by mail-wm1-x335.google.com with SMTP id r203-20020a1c44d4000000b003cfa97c05cdso1642671wma.4;
        Thu, 10 Nov 2022 05:12:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=VpyhbGYLbgqQGq84zDVWwGbjefm7SUvj9DOXzK2A1TU=;
        b=GHpriBMOXDvxvsugPbxR5FDEgGCUeAbYXuJ84U68kvkH74Cel95enwLZfFymDlsBaa
         zqqULN8YDsOhxTxoGbSM1Z+noOnr9D/oABkpXkxLHwMZyqnq6c00QKTjk3n3Ndu7l9XA
         ccw4xcfiBWQGR1Cbm1JULkcCG6VN6ESFbltpm8/2XvB2cxZikH8bJc2vZSf1fDHkpQF+
         XsVOD63wVvX5JElC7bwKyd57nkpmhNG8sBsU9Lli43eOU29NQVU2sbMoKR/sAUj7BBsH
         Md7T/Njj4G34P8GBPFZnYNfBgh87isM3RC+Tp6Ad11DZHkyuu4q4FubblOaZSFKs2Kf7
         bOzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=VpyhbGYLbgqQGq84zDVWwGbjefm7SUvj9DOXzK2A1TU=;
        b=6UxcSgu/0/gvcOx0FyA0Mz1XME0nnn2EcCiSwbh9yzWvK4eD37xOWXZ3FttSTPvXep
         DBVqrRdKfTujbI2vNerpc3PiBHXEnf/E0kPfA6P/xlrljvdyPqXM7GUHIWDSW1xiOTUJ
         9fR9NT6XtyuSC4BnQ8hn0Qtqs2+DJ7NuJjPrjFgBnH7Wfemoox0tkJmbDayTnOnVGzWy
         JV5R6fDZIxV8qIFjUBfqA2fke2BaKqMAuUcyNh9gfsG0ummbUIehh7r+zhu4p3pYTvZi
         pvxzUl9Xz/XbZPk2lfkhKIZIbtyO5PRCYSmljuZ44WJn4nPUBYnRzBHebLdNiYFpXDus
         fQAQ==
X-Gm-Message-State: ACrzQf275Vbb3nJpLELXeQTUb1nOSWHK8JPVB0JsXTTC27+qE2FyR8L4
	YKPSOpOsvHhbpNGeeOkFH0M=
X-Google-Smtp-Source: AMsMyM51TiWHud25bbxeDq7lKiBIwAVbUfDhjw64VUwKMxy4sQuEHhWs+GPnR0/ficWwxEYJhbBqwQ==
X-Received: by 2002:a7b:c455:0:b0:3cf:6817:297d with SMTP id l21-20020a7bc455000000b003cf6817297dmr42433341wmi.152.1668085924859;
        Thu, 10 Nov 2022 05:12:04 -0800 (PST)
Received: from [192.168.1.131] ([207.188.167.132])
        by smtp.gmail.com with ESMTPSA id j13-20020adfea4d000000b0023bb7e4b8b1sm16058508wrn.82.2022.11.10.05.12.02
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 10 Nov 2022 05:12:03 -0800 (PST)
Message-ID: <aa7cab9c-8fe2-b42e-84ba-1aeb79d50190@gmail.com>
Date: Thu, 10 Nov 2022 14:12:01 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.1
Subject: Re: [PATCH v28 05/11] soc: mediatek: refine code to use
 mtk_mmsys_update_bits API
Content-Language: en-US
To: =?UTF-8?B?TsOtY29sYXMgRi4gUi4gQS4gUHJhZG8=?= <nfraprado@collabora.com>
Cc: "Nancy.Lin" <nancy.lin@mediatek.com>, Rob Herring <robh+dt@kernel.org>,
 Chun-Kuang Hu <chunkuang.hu@kernel.org>,
 Philipp Zabel <p.zabel@pengutronix.de>, wim@linux-watchdog.org,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 linux@roeck-us.net, David Airlie <airlied@linux.ie>,
 Daniel Vetter <daniel@ffwll.ch>, Nathan Chancellor <nathan@kernel.org>,
 Nick Desaulniers <ndesaulniers@google.com>,
 "jason-jh . lin" <jason-jh.lin@mediatek.com>,
 Yongqiang Niu <yongqiang.niu@mediatek.com>, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, dri-devel@lists.freedesktop.org,
 llvm@lists.linux.dev, singo.chang@mediatek.com,
 Project_Global_Chrome_Upstream_Group@mediatek.com
References: <20221107072243.15748-1-nancy.lin@mediatek.com>
 <20221107072243.15748-6-nancy.lin@mediatek.com>
 <58d55016-afc7-e560-32cf-8228794b5752@gmail.com>
 <20221108194351.u63k4mqzq3bkhpl7@notapiano>
From: Matthias Brugger <matthias.bgg@gmail.com>
In-Reply-To: <20221108194351.u63k4mqzq3bkhpl7@notapiano>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221110_051210_249683_F8DB80F0 
X-CRM114-Status: GOOD (  26.84  )
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



On 08/11/2022 20:43, Nícolas F. R. A. Prado wrote:
> On Tue, Nov 08, 2022 at 06:37:19PM +0100, Matthias Brugger wrote:
>>
>>
>> On 07/11/2022 08:22, Nancy.Lin wrote:
>>> Simplify code for update  mmsys reg.
>>>
>>> Signed-off-by: Nancy.Lin <nancy.lin@mediatek.com>
>>> Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
>>> Reviewed-by: CK Hu <ck.hu@mediatek.com>
>>> Tested-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
>>> Tested-by: Bo-Chen Chen <rex-bc.chen@mediatek.com>
>>> Reviewed-by: Nícolas F. R. A. Prado <nfraprado@collabora.com>
>>> ---
>>>    drivers/soc/mediatek/mtk-mmsys.c | 45 ++++++++++++--------------------
>>>    1 file changed, 16 insertions(+), 29 deletions(-)
>>>
>>> diff --git a/drivers/soc/mediatek/mtk-mmsys.c b/drivers/soc/mediatek/mtk-mmsys.c
>>> index 9a327eb5d9d7..73c8bd27e6ae 100644
>>> --- a/drivers/soc/mediatek/mtk-mmsys.c
>>> +++ b/drivers/soc/mediatek/mtk-mmsys.c
>>> @@ -99,22 +99,27 @@ struct mtk_mmsys {
>>>    	struct reset_controller_dev rcdev;
>>>    };
>>> +static void mtk_mmsys_update_bits(struct mtk_mmsys *mmsys, u32 offset, u32 mask, u32 val)
>>> +{
>>> +	u32 tmp;
>>> +
>>> +	tmp = readl_relaxed(mmsys->regs + offset);
>>> +	tmp = (tmp & ~mask) | (val & mask);
>>
>> I'm not sure about the change in the implementation of
>> mtk_mmsys_update_bits(). Nicolas tried to explain it to me on IRC but I
>> wasn't totally convincing. As we have to go for at least another round of
>> this patches, I'd like to get a clear understanding while it is needed that
>> val bits are set to 1 in the mask.
> 
> The point here was to make sure that mtk_mmsys_update_bits() didn't allow
> setting bits outside of the mask, since that's never what you want: the entire
> point of having a mask is to specify the bits that should be updated (and the
> ones that should be kept unchanged). So for example if you had
> 
> mask = 0x0ff0
> val  = 0x00ff
> 
> the previous implementation would happily overwrite the 4 least significant bits
> on the destination register, despite them not being present in the mask, which
> is wrong.
> 
> This wrong behavior could easily lead to hard to trace bugs as soon as a badly
> formatted/wrong val is passed and an unrelated bit updated due to the mask being
> ignored.
> 
> For reference, _regmap_update_bits() does the same masking of the value [1].
> 
> That said, given that this function already existed and was just being moved,
> it would've been cleaner to make this change in a separate commit.
> 

Would have been better, but we can leave it as it.

Regards,
Matthias

> [1] https://elixir.bootlin.com/linux/latest/source/drivers/base/regmap/regmap.c#L3122
> 
> Thanks,
> Nícolas
> 
>>
>> Regards,
>> Matthias
>>
>>> +	writel_relaxed(tmp, mmsys->regs + offset);
>>> +}
> [..]
>>> -static void mtk_mmsys_update_bits(struct mtk_mmsys *mmsys, u32 offset, u32 mask, u32 val)
>>> -{
>>> -	u32 tmp;
>>> -
>>> -	tmp = readl_relaxed(mmsys->regs + offset);
>>> -	tmp = (tmp & ~mask) | val;
>>> -	writel_relaxed(tmp, mmsys->regs + offset);
>>> -}
>>> -
> [..]

