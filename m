Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 42CE3C433F5
	for <linux-mediatek@archiver.kernel.org>; Fri, 22 Apr 2022 15:38:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=nA48dZ2WnRw96y1edx1KpyFNXEMTRKhUNIb9reAv8bM=; b=JpVlCu+gkaYVMa
	3L0kPWeMF4VL7XfcpxUBnQU0kJvn+zkOhvhA8RbAgktBWEtkpaCYlTF/vPjdRSi4M8wwghA1wbnbg
	xWpGDBNXFpC70WTiYov5rGKb7yECKxNTS+iDrmXNNLuOWALKIblJuRQaXSwAqFaLbG05rwnYdAGKt
	TTS5wDqnPj6eGc6wZFj7lKyFb2YxL0R4iH5DQNhCARteJHuAkENV/8wKlJTO+eAJagrbvgq6mt93H
	h2j4gXgCXv6UhNY3WTy1Mp/UjpsXmTyNuumucUy9HAekj1kCW6oq8OTJkh794r1x4PAcEW/SG7urt
	5BEMcbjHw47S0C/X6XUQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nhvMj-0019kR-JQ; Fri, 22 Apr 2022 15:38:37 +0000
Received: from mail-wr1-x434.google.com ([2a00:1450:4864:20::434])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nhvMW-0019gp-Rb; Fri, 22 Apr 2022 15:38:26 +0000
Received: by mail-wr1-x434.google.com with SMTP id m14so11617003wrb.6;
 Fri, 22 Apr 2022 08:38:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=QhhufdrYma19zmloa3Gp0l15zXYz5cGKva41oCbR3Xc=;
 b=VwcNRCjNTLZgGgF6a7zs6SLC8e1Xv586fn+wjvq3TTPpmV+shP9HPJi5h6yUPCbwUK
 3F9n/vsgWGU93PQyM6GTS4ITbpqdx9PXgccgj4YpPZHYLFzLu8/XqVILvxvySsen7wy9
 IYvgp25XLH4bNcDTDpL7yXmHQx+Z0SLzzc11ukpsjHjNIDV9WkKeiTYIxN06pb4XSAGU
 HyRVJO2hLsbARNvu5nbXV/j8UVKHd0Iv45Wy6sNNjD/2cIe4Jn9+YYhX11p0WHML0J/2
 9tuWnhUtj562PqPlhLfsE6UERyqEG8RV8PRExY/uOl//sbWDVh+x78lrTi9xxgNMwOD7
 CyTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=QhhufdrYma19zmloa3Gp0l15zXYz5cGKva41oCbR3Xc=;
 b=xJh+XGO/gmBTq3Fjgkxv2wZZ+HUbpox/DDrlZNGkZpaR61pA86rT4DyJdX2exHOtD4
 pzYqqlyj7OYzcht/UXnM7wIEvmyIx40ccRajYG5rdbzxNDzIIHHN1m/qf4df5lIHgJHn
 G5YNIJ5ErxqKL7b3kRo+49AmbPoTavULpQUcp2emVK0K39zt16H1X2UGjom7Y7i8Ttyo
 mFnQ6uyaey8XLuXj5Yt3gkM2y7TW0oLMEg0gDS8Kvqn5hQYocBZG++c+yHVKU7Lg0ZeT
 ro5Rn622DR2Wy6V61YGz56BrRi1EyT9zzs5dbS2FlO/ZqTpoNNOXgRo5Jo8uUF31vBv/
 BMNQ==
X-Gm-Message-State: AOAM530rCXsp7CUZr4JaJ7G2vKcsc++UC0RePYNO8Iuk+iHlzlPSUZU0
 o1Glk6t9DU/y7El01w1C/f5ahMbkkCTbEZiw
X-Google-Smtp-Source: ABdhPJzs5IwZfxCuSmdATaN96kg4oNBC54s3d8Tgbg0QBR1dz79ohwaqNoQd0Mthn411pnQJu33AOg==
X-Received: by 2002:a05:6000:136b:b0:20a:c416:e914 with SMTP id
 q11-20020a056000136b00b0020ac416e914mr4342554wrz.167.1650641900962; 
 Fri, 22 Apr 2022 08:38:20 -0700 (PDT)
Received: from [192.168.1.145] ([207.188.167.132])
 by smtp.gmail.com with ESMTPSA id
 w4-20020a7bc104000000b0038eba17a797sm4687044wmi.31.2022.04.22.08.38.19
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 22 Apr 2022 08:38:20 -0700 (PDT)
Message-ID: <ca127f7f-0620-1c03-4f39-206945b0e612@gmail.com>
Date: Fri, 22 Apr 2022 17:38:18 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH v24 0/7] soc: mediatek: SVS: introduce MTK SVS
Content-Language: en-US
To: Roger Lu <roger.lu@mediatek.com>, Kevin Hilman <khilman@kernel.org>,
 Enric Balletbo Serra <eballetbo@gmail.com>, Rob Herring
 <robh+dt@kernel.org>, Nicolas Boichat <drinkcat@google.com>,
 Stephen Boyd <sboyd@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>
Cc: Fan Chen <fan.chen@mediatek.com>, HenryC Chen <HenryC.Chen@mediatek.com>, 
 Xiaoqing Liu <Xiaoqing.Liu@mediatek.com>,
 Charles Yang <Charles.Yang@mediatek.com>, Angus Lin
 <Angus.Lin@mediatek.com>, Mark Rutland <mark.rutland@arm.com>,
 Nishanth Menon <nm@ti.com>, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org,
 Project_Global_Chrome_Upstream_Group@mediatek.com,
 Guenter Roeck <linux@roeck-us.net>,
 Jia-wei Chang <jia-wei.chang@mediatek.com>
References: <20220420102044.10832-1-roger.lu@mediatek.com>
 <7hczhbe3wn.fsf@baylibre.com>
 <3d463c8b099fdb1c9a0df9e615a8ca1d8a034120.camel@mediatek.com>
 <7hsfq6ql4v.fsf@baylibre.com>
 <d67d5f4f2ec96ade2398e7c0897dbb16bf5fb145.camel@mediatek.com>
From: Matthias Brugger <matthias.bgg@gmail.com>
In-Reply-To: <d67d5f4f2ec96ade2398e7c0897dbb16bf5fb145.camel@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220422_083824_943430_C3473876 
X-CRM114-Status: GOOD (  24.20  )
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



On 22/04/2022 04:24, Roger Lu wrote:
> Hi Kevin,
> 
> On Thu, 2022-04-21 at 12:41 -0700, Kevin Hilman wrote:
>> Hi Roger,
>>
>> Roger Lu <roger.lu@mediatek.com> writes:
>>
>>> On Wed, 2022-04-20 at 16:22 -0700, Kevin Hilman wrote:
>>
>> [...]
>>
>>>> That being said, it would be really nice to see an integration tree
>>>> where this was all tested on mainline (e.g. v5.17, or v5.18-rc)
>>>>
>>>> For example, I can apply this to v5.18-rc2 and boot on my mt8183-pumpkin
>>>> board, it fails to probe[1] because there is no CCI node in the upstream
>>>> mt8183.dtsi.
>>>>
>>>> I'm assuming this series is also not very useful without the CPUfreq
>>>> series from Rex, so being able to test this, CCI and CPUfreq together on
>>>> MT8183 on a mainline kernel would be very helpful.
>>>>
>>>> Kevin
>>>>
>>>> [1]
>>>> [    0.573332] mtk-svs 1100b000.svs: cannot find cci node
>>>> [    0.574061] mtk-svs 1100b000.svs: error -ENODEV: svs platform probe
>>>> fail
>>>
>>> Just share. I've tested this series on below two platforms and it works as
>>> expected.
>>> - mt8183-Krane (kernel-v5.10)
>>> - mt8192-Hayato (kernel-v5.4)
>>
>> Unfortunately testing on v5.4 and v5.10 with lots of other additional
>> out-of-tree patches does not give much confidence that this series works
>> with upstream, especially when I've given a few reasons why it will not
>> work uptream.
>>
>> The examples I gave above for CCI and CPUs/cluster disable are good
>> examples, but another one I forgot to mention is the dependency on Mali.
>> The SVS driver will never probe because it also depens on a "mali" node,
>> which doesn't exist upstream either (but panfrost does, and acutually
>> loads/probes fine on v5.17/v5.18) so this should be fixed to work with
>> upstream panfrost.
>>
>> IMO, in order for this to be merged upstream, it should at least have
>> some basic validation with upstream, and so far I have not even been
>> able to make it successfuly probe.  To do that, you will need to either
>> provide a list of the dependencies for testing this with mainline
>> (e.g. CCI series, CPUfreq series, any DT changes), or even better, an
>> integration tree based on recent mainline (e.g. v5.17 stable, or
>> v5.18-rc) which shows all the patches (in addition to this series) used
>> to validate this on mainline.
> 
> No problem. We'll find a machine that can be run correctly with recent mainline
> (e.g. v5.17 stable, or v5.18-rc) and add patches (CCI series + CPUfreq series +
> any DT changes) to test this SVS series. Thanks very much.
> 

Thanks Roger. I'll wait until this got tested with upstream Linux, before I will 
apply all the patches.

Regards,
Matthias

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
