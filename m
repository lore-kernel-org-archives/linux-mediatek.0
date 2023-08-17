Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C1937C2FC0E
	for <linux-mediatek@archiver.kernel.org>; Thu, 17 Aug 2023 11:39:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=TTEZsdCY4/ROvTDegYueu3UoNKVTo+C9n4Jn+JaTP2o=; b=uKTiknn4hHz+o7kJxLkfe1WSc5
	aK1+WrA5MS6D8wie4o0hwQt5tiTOqPqB3LSqFNHCOKis3wPT4y1yjd4U5AkhgfU6y3tX421+pYWQl
	+5dscejme+kVqg/FomkOmsQO/DwyiQuJNRVsBSinrVVKakA52y1ErM9nbRt1Qwu9N5I3t8/enfOLb
	RiDyQH7bvn4hlkQ3+N525UU+iZiS7rc0TJmylFN23Ia/xxmNerZvegV3fpt1MDdFj7cgoBpRbYucK
	yw+YLhMQ/3eXb2K+T4mmvB/UOaUOdd0S+xQA21iy4+czFOZBm8VOhozPn2KD25zDVxg1XF2xFs4N0
	TMy+6fbA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qWbLa-006I0o-1a;
	Thu, 17 Aug 2023 11:39:26 +0000
Received: from mail-wm1-x330.google.com ([2a00:1450:4864:20::330])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qWbLX-006HyE-0z
	for linux-mediatek@lists.infradead.org;
	Thu, 17 Aug 2023 11:39:24 +0000
Received: by mail-wm1-x330.google.com with SMTP id 5b1f17b1804b1-3fe5c0e5747so5609585e9.0
        for <linux-mediatek@lists.infradead.org>; Thu, 17 Aug 2023 04:39:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1692272359; x=1692877159;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=TTEZsdCY4/ROvTDegYueu3UoNKVTo+C9n4Jn+JaTP2o=;
        b=oX5yPVth+PHIjocLUBndePdGLypDvYq2solc5BzuflSzikrFXb3kjbOOxCzeIXUOc2
         eMRRn1Y5UkU4Y7HoKz9ahfaZy2mVS5ClWAtrqtSr5TZ+Zxe/kyZM8J1YkzTb+9LS5T7c
         iEawd+lQth5ZCOZC1GA5tHDPx4dG/nU+F9hV4Rg4zFa/seAonVVXc7XYFbWzxdN7l/yi
         yZ2YYFXEsbbBOg2qRfFt9dPWobIgklKKF1O9yB5b/8u4n3ehRrRCpcqoojzhPe5mG2Ae
         KqeCVbtlKG4lP6k/0BhYNtRVHXy7GVEcVY2etFpfdOQmrcff1COpd+rvL+gcXg/Vg1+n
         yWjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1692272359; x=1692877159;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=TTEZsdCY4/ROvTDegYueu3UoNKVTo+C9n4Jn+JaTP2o=;
        b=GIivn7+qTj4V47edS8i+liO66ZE6XB4FhRBDiv3w/X3/Ron+WPMC3BzY3MdcngC3kE
         lGNQWlrRPYXXm9wjawyA8VlzcESKtD1f+Aw7vUbTQD4XZ3AVUrFLQ0ljSTy9WXuZUtCF
         XeFuhOwXfyhMhJLNHwJIH3IwDXZ5NVG6SZ/nnRyLUywQdUkG4f8uzbzh8piv5Zy5ZaGF
         eEzf5tFA98cWPk7Nwh/9MRhtJ9ipSTrKX7OBFPHgMzFwuy/1RxP8WXvrPvmzDIQABBtw
         j4csZRHVi2d+i7XyuN9EUqSDyv+TuINrU84L4IWt64WsKh3jWybaJS0w8EjAG3dNpAp5
         bTjA==
X-Gm-Message-State: AOJu0YyfjtBc3+7c5K+cBOhmcsJa6gJhrNIeO+l+uhLHMus6/lG8nT+S
	mFQD5fsv5+iZc14j5O0U/Ta8bA==
X-Google-Smtp-Source: AGHT+IGplJUJS6D5RdP0gSy2QTohSeSR4gSIA81af/fmBPrRIPnGjoUraXeZu9PIoTjkHGZhXLeFjw==
X-Received: by 2002:a05:600c:3c8b:b0:3fe:4c29:e626 with SMTP id bg11-20020a05600c3c8b00b003fe4c29e626mr1942612wmb.13.1692272358746;
        Thu, 17 Aug 2023 04:39:18 -0700 (PDT)
Received: from [192.168.10.46] (146725694.box.freepro.com. [130.180.211.218])
        by smtp.googlemail.com with ESMTPSA id a23-20020a05600c225700b003fe1cdbc33dsm2749722wmm.9.2023.08.17.04.39.17
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 17 Aug 2023 04:39:18 -0700 (PDT)
Message-ID: <d5393131-602f-c9ae-8ca9-1ee69479c705@linaro.org>
Date: Thu, 17 Aug 2023 13:39:17 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [PATCH v4 0/5] Add LVTS support for mt8192
Content-Language: en-US
To: Chen-Yu Tsai <wenst@chromium.org>
Cc: =?UTF-8?B?TsOtY29sYXMgRi4gUi4gQS4gUHJhZG8=?= <nfraprado@collabora.com>,
 =?UTF-8?Q?Bernhard_Rosenkr=c3=a4nzer?= <bero@baylibre.com>,
 angelogioacchino.delregno@collabora.com, rafael@kernel.org,
 amitk@kernel.org, rui.zhang@intel.com, matthias.bgg@gmail.com,
 robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org,
 rdunlap@infradead.org, ye.xingchen@zte.com.cn, p.zabel@pengutronix.de,
 linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 devicetree@vger.kernel.org, james.lo@mediatek.com, rex-bc.chen@mediatek.com,
 abailon@baylibre.com, amergnat@baylibre.com, khilman@baylibre.com
References: <20230530195132.2286163-1-bero@baylibre.com>
 <107678ff-c3d5-4c3a-ad0e-fa292a125daa@notapiano>
 <a97efd71-23e2-5ac9-8d3d-427a431353c6@linaro.org>
 <CAGXv+5EFD_yMF7q0P5rqiRWeyRqm016Or8iB0niwj26HFVp93Q@mail.gmail.com>
From: Daniel Lezcano <daniel.lezcano@linaro.org>
In-Reply-To: <CAGXv+5EFD_yMF7q0P5rqiRWeyRqm016Or8iB0niwj26HFVp93Q@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230817_043923_345215_9EBCD58F 
X-CRM114-Status: GOOD (  13.08  )
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

On 17/08/2023 10:45, Chen-Yu Tsai wrote:
> On Thu, Aug 17, 2023 at 4:49 AM Daniel Lezcano
> <daniel.lezcano@linaro.org> wrote:
>>
>>
>> Hi,
>>
>> On 16/08/2023 21:57, Nícolas F. R. A. Prado wrote:
>>
>> [ ... ]
>>
>>> Hi Daniel,
>>>
>>> just a gentle reminder. As you've just applied [1], there are no longer any
>>> concerns with this series, and it'll provide both working interrupts and
>>> reliable thermal readings on MT8192.
>>
>> There are still concerns and questions in the series for patch2 and 3.
> 
> FWIW the readout errors raised in patch 3 were fixed by
> 
> "thermal/drivers/mediatek/lvts_thermal: Make readings valid in filtered mode"
> 
> So I guess the remaining concern is on patch 2 about whether the noirq
> suspend callback should be used instead.

Yes, and the reordering of the lvts_of_match


-- 
<http://www.linaro.org/> Linaro.org │ Open source software for ARM SoCs

Follow Linaro:  <http://www.facebook.com/pages/Linaro> Facebook |
<http://twitter.com/#!/linaroorg> Twitter |
<http://www.linaro.org/linaro-blog/> Blog


