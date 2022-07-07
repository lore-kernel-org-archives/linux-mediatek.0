Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 69BB8C43334
	for <linux-mediatek@archiver.kernel.org>; Thu,  7 Jul 2022 10:09:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:References:Cc:To:From:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=U5N9NRe+aarCaMPvgWomO4spTpGm8g7FmpQ6Wwxj0Ec=; b=xoT9Mx1gVJVrgygbVCgBqCJx/c
	oD/YE9iAVgmRwbnq993EeKhyv9p+D2dw9nnXUkbMJwbPpCe7h7V8XD2Aeg1TbwsANsRZ6VyGOkGMS
	RCvYXqjiTAVyliLXOQaCZjxh+okLfg9F0yu2Lw6xKH9EpVoWajKhxBmW7yDxH/xXOOzlYTjSag8AE
	pwRAz6TIBGfd4rJyH6SSOFLEn1E2V0byjFG/z5aOlC2ycCNNYijIaorw7t0KFEpUSLdoQrOMwM5HQ
	yyRxMaHFQxpO91wWm6kK3vdAT8jvDeqkjNBJoPs20ca3Gp9jb9bo2WWkj0TosBN+FQ7DlYGVFl+Vg
	M3UJqrQg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o9ORn-00FWGB-VF; Thu, 07 Jul 2022 10:09:23 +0000
Received: from mail-wm1-x32b.google.com ([2a00:1450:4864:20::32b])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o9ORc-00FWCs-VT; Thu, 07 Jul 2022 10:09:14 +0000
Received: by mail-wm1-x32b.google.com with SMTP id h14-20020a1ccc0e000000b0039eff745c53so10404781wmb.5;
        Thu, 07 Jul 2022 03:09:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=message-id:date:mime-version:user-agent:subject:content-language
         :from:to:cc:references:in-reply-to:content-transfer-encoding;
        bh=U5N9NRe+aarCaMPvgWomO4spTpGm8g7FmpQ6Wwxj0Ec=;
        b=A4uxkAtMfuXZg8gnB/LkNTJPBjzYjXrBAu1Q9OmTfLske6rnBlRW99zlg+T3wf9Njb
         wmyupiAck9Arjv7wjo08zJIwD28JQ1A1zJKEZqDG032fPLLAYwOWHcSlkMz62KOt5zyB
         aklySu8q9v4uYNLygt0tZq2fUd9kC7nR3NRpzdwsgoEBcMcey1Jm7HnTt/jZRvUJGU4g
         crxxxa5/BfuIBuEuhuZat1pQEV7yml4TiLL0Pwuf8eL3Cga/Q516cFt3vZRtlPn4uxgL
         RYbA307x6uxTbMDXR7lXrAUWZNqf13aY8T6izpLPoETZ8qiwasptSIc8J5cdnXbAZQy9
         EEMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:from:to:cc:references:in-reply-to
         :content-transfer-encoding;
        bh=U5N9NRe+aarCaMPvgWomO4spTpGm8g7FmpQ6Wwxj0Ec=;
        b=g4IIlauUpf0Y7oDd+ydFJT0w5YJ9E/jEfwL/VRYELT/V8ParICX6pVkBpDDyzFkArI
         vY1/IpRK6+DVWUR86ehDlUexO0jyIoUutqw2RSt3C0hXxzCqPNcs1D8Znnh8ssCrA8If
         dI5l6hpzGRNx9A84AvkR8u0t4fiAB20rZ4/FsWAKVTTF0O/Hk7Px890GjrxDu11me1nY
         KBGVrOv9u10axFuAprQkcnajsU4N/yeqUBqA7VjebTDJXa1rfZgC4t09gBfUyunEpxyv
         KxO9Qhlk4QmcigFhG5aKiPZXuFIk6XjpOefAQsBViPahM+9eAyCyUZLZ8mXaTMUO3zIM
         kgCg==
X-Gm-Message-State: AJIora+iPfQonDbVLzFh+Z9G1UIc/pduGHqH8LJRnlDnJIimrfbtSAa4
	hvIC7E/wKKTAFO+j24EU2xg=
X-Google-Smtp-Source: AGRyM1uOUlKx7fBRdBFHJa8xYeDNvkh9UirCJO4JvVwjt0+70qyCMuYlvn/y0H472lwD8+AcArb4Ug==
X-Received: by 2002:a05:600c:2049:b0:3a0:536b:c01b with SMTP id p9-20020a05600c204900b003a0536bc01bmr3589496wmg.151.1657188539215;
        Thu, 07 Jul 2022 03:08:59 -0700 (PDT)
Received: from [192.168.2.177] ([207.188.167.132])
        by smtp.gmail.com with ESMTPSA id v7-20020adfa1c7000000b0021d6924b777sm11754085wrv.115.2022.07.07.03.08.57
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 07 Jul 2022 03:08:58 -0700 (PDT)
Message-ID: <a0b81490-619b-6e80-472d-8e83ee4a1b86@gmail.com>
Date: Thu, 7 Jul 2022 12:08:57 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH 0/2] Add mt8186 mutex support for mdp3
Content-Language: en-US
From: Matthias Brugger <matthias.bgg@gmail.com>
To: Allen-KH Cheng <allen-kh.cheng@mediatek.com>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
 Chun-Kuang Hu <chunkuang.hu@kernel.org>,
 Philipp Zabel <p.zabel@pengutronix.de>
Cc: Project_Global_Chrome_Upstream_Group@mediatek.com,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org
References: <20220705122627.2273-1-allen-kh.cheng@mediatek.com>
 <8b70f376-5f83-a713-c5de-ed5bba68c937@gmail.com>
In-Reply-To: <8b70f376-5f83-a713-c5de-ed5bba68c937@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220707_030913_053971_BC2C6E7A 
X-CRM114-Status: GOOD (  14.50  )
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



On 06/07/2022 16:17, Matthias Brugger wrote:
> 
> 
> On 05/07/2022 14:26, Allen-KH Cheng wrote:
>> This series are based on matthias.bgg/linux.git, for-next and provide
>> mt8186 mutex support for Media Data Path 3 (MDP3).
>>
>> Allen-KH Cheng (2):
>>    dt-bindings: soc: mediatek: add mdp3 mutex support for mt8186
>>    soc: mediatek: mutex: add mt8186 mutex mod settings for mdp3
> 
> Whole series applied to v5.19-next/soc
> 

We would need clarification if the HW block for MDP3 mutex is different from the 
one used for the disp mutex. It does not seem so. In this case we can just add a 
node on the corresponding address in the DTS.

Regards,
Matthias

> Thanks
> 
>>
>>   .../bindings/soc/mediatek/mediatek,mutex.yaml |  1 +
>>   drivers/soc/mediatek/mtk-mutex.c              | 23 +++++++++++++++++++
>>   include/linux/soc/mediatek/mtk-mutex.h        |  2 ++
>>   3 files changed, 26 insertions(+)
>>

