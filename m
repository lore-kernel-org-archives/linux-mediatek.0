Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 41134C43334
	for <linux-mediatek@archiver.kernel.org>; Mon, 27 Jun 2022 09:00:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=OJD3PXeQcR9dqZ5Y7yZVLU8WDdZSUs8hEAVEMiuij4s=; b=frGyEJI3uTRvzBrcNcfSgffz9r
	z/nGUkOe7z+V/kF8p1t8dBRe+MyXAYY6043X6XVjgk/In7OnxzWsKc8ENG+9mYlDKTE6k2k6YDzJx
	a4Wev1rKu52g9eoLlx09FbMhisA9I7f79x1BjtPVN/bdf+Ko0P01j7Y7oEaZaQMGxiGqSt8JrJkIO
	W5+kOT0ZYLdhd177orAqL/Ea8+dji57f53BQO6iFNOAC3g1gOo4dRKZwX4GfGCocXewP3wfObT+uz
	jq9g3txkcKDp/fBYItrIJlWBbt70hMGzCHf5NEn9OxMd2dz6UcKl/jt2BqiQx+DkDnDHDzVRq9fqd
	zKR+3ntw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o5kbw-00H5Zz-5k; Mon, 27 Jun 2022 09:00:48 +0000
Received: from mail-ed1-x52c.google.com ([2a00:1450:4864:20::52c])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o5kb9-00H4vt-Ls
	for linux-mediatek@lists.infradead.org; Mon, 27 Jun 2022 09:00:01 +0000
Received: by mail-ed1-x52c.google.com with SMTP id ej4so11965674edb.7
        for <linux-mediatek@lists.infradead.org>; Mon, 27 Jun 2022 01:59:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=OJD3PXeQcR9dqZ5Y7yZVLU8WDdZSUs8hEAVEMiuij4s=;
        b=mBcUp//R90f/Wq5aerXEP5Jb3KTttQ3I+AqwSlNt/W7te4T7VYw+iFp0bnSvhyclS5
         SuaYvm9L+9uEl7UZwFbpIvCpwbiuSo6BhQ8jzrn/7Nl/3EBUqzMK1KEpc09m4+VuS9Ia
         TXyP+XGJZKLTzLyq1Qyl4jyhHiiMz6S0NgesKDKGmDv1QhulRYmsCGo/BAVk5kb8NqJx
         0q8wQgaqz43l3T+r/p1tHqEviIJYRfTiSvK8M0bHYs7qgkA5hfeHpPHUKo5lyc/MC+Oh
         jLNPwkhR9c/Sh1h18sYqi0iQUaayC9xcNnwwzbcunlvd/UpaZ3A23OkZS2rDJxAtogBV
         ikMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=OJD3PXeQcR9dqZ5Y7yZVLU8WDdZSUs8hEAVEMiuij4s=;
        b=SO3ODVZJ0eC3meepjbz0WomNKSpMo17tBGAlOJuFxDnu6khMiHgqVUI3vXVO14OdNG
         aDKiVNUjUB6jwEcCIk8UXjmiJr0JsSMrfyTNck3/wn0yK6X1PFhvvI2R/KG9XAdOAZHE
         XkGHqqeRRP0T/0e+98paOkHP+1U8PQPfSKUt9mfqfryZqaPhh58AL93hOxhmnNWS6/yG
         22CpOjungR9pn9rz/u6ZmgkhMuYjxsXHnoKfR5PSYaunf3qwPlEH89SFMOWupo+bh/en
         +7DbuzusyrqI+P6JSeiHilPcwyW/JXZVLgAZSykob3XMjZ/5KXuUCN2nAdk8bLkLBpL2
         i76Q==
X-Gm-Message-State: AJIora/RHlTBJlRbrzK2Mnq2XuX10F80ET1sCm7OGILQ0KeIBxwkIo7I
	O2/2TiHbrtky3D6dTn+bNVFfIQ==
X-Google-Smtp-Source: AGRyM1vx9hW9lzNzpgqm+U8e8cip5LlD6oegAC5bL8EXEcSPE33v/USYPPy/Vv76y2er5Hvfx5q6kg==
X-Received: by 2002:a05:6402:1d50:b0:436:beac:a4e3 with SMTP id dz16-20020a0564021d5000b00436beaca4e3mr15491833edb.191.1656320398400;
        Mon, 27 Jun 2022 01:59:58 -0700 (PDT)
Received: from [192.168.0.247] (xdsl-188-155-176-92.adslplus.ch. [188.155.176.92])
        by smtp.gmail.com with ESMTPSA id o19-20020a17090611d300b007109b15c109sm4806316eja.66.2022.06.27.01.59.56
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 27 Jun 2022 01:59:58 -0700 (PDT)
Message-ID: <6fa1db53-6e4e-b6b1-2313-dee7aadad5ae@linaro.org>
Date: Mon, 27 Jun 2022 10:59:56 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Subject: Re: [PATCH v3 2/7] dt-bindings: clock: Add MediaTek Helio X10 MT6795
 clock bindings
Content-Language: en-US
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 robh+dt@kernel.org
Cc: krzysztof.kozlowski+dt@linaro.org, matthias.bgg@gmail.com,
 mturquette@baylibre.com, sboyd@kernel.org, p.zabel@pengutronix.de,
 y.oudjana@protonmail.com, jason-jh.lin@mediatek.com, ck.hu@mediatek.com,
 fparent@baylibre.com, rex-bc.chen@mediatek.com, tinghan.shen@mediatek.com,
 chun-jie.chen@mediatek.com, weiyi.lu@mediatek.com, ikjn@chromium.org,
 miles.chen@mediatek.com, sam.shih@mediatek.com, wenst@chromium.org,
 bgolaszewski@baylibre.com, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, linux-clk@vger.kernel.org,
 konrad.dybcio@somainline.org, marijn.suijten@somainline.org,
 martin.botka@somainline.org, ~postmarketos/upstreaming@lists.sr.ht,
 phone-devel@vger.kernel.org, paul.bouchara@somainline.org,
 kernel@collabora.com, Rob Herring <robh@kernel.org>
References: <20220624093525.243077-1-angelogioacchino.delregno@collabora.com>
 <20220624093525.243077-3-angelogioacchino.delregno@collabora.com>
 <de5a0e6f-411f-0c7b-ae1e-1117a4126d2d@linaro.org>
 <9554982a-c48b-e902-2d96-b317c46df698@collabora.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <9554982a-c48b-e902-2d96-b317c46df698@collabora.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220627_015959_767463_4A74247A 
X-CRM114-Status: GOOD (  13.22  )
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

On 27/06/2022 10:49, AngeloGioacchino Del Regno wrote:
> Il 25/06/22 22:30, Krzysztof Kozlowski ha scritto:
>> On 24/06/2022 11:35, AngeloGioacchino Del Regno wrote:
>>> Add the bindings for MT6795's clock controller.
>>>
>>> Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
>>> Acked-by: Rob Herring <robh@kernel.org>
>>> ---
>>>   include/dt-bindings/clock/mt6795-clk.h | 275 +++++++++++++++++++++++++
>>>   1 file changed, 275 insertions(+)
>>>   create mode 100644 include/dt-bindings/clock/mt6795-clk.h
>>>
>>> diff --git a/include/dt-bindings/clock/mt6795-clk.h b/include/dt-bindings/clock/mt6795-clk.h
>>> new file mode 100644
>>> index 000000000000..9902906ac902
>>> --- /dev/null
>>> +++ b/include/dt-bindings/clock/mt6795-clk.h
>>
>> Vendor prefix.
>>
> 
> For consistency, I'd really like to keep the filename as it is.
> 
> At least in this directory, all of the MediaTek clock bindings
> are using the format mtXXXX-clk.h... and that's not only seen
> in MediaTek, but also in Broadcom, Renesas, RockChip, HiSilicon,
> nVidia, etc.

Several new files are introduced with vendor prefix. The same as in
bindings - old bindings were without vendor, so for consistency we would
never switch to vendor one.

For consistency with Documentation/devicetree/bindings and with all new
files in binding headers, please add vendor prefix.

Best regards,
Krzysztof

