Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 11631C433FE
	for <linux-mediatek@archiver.kernel.org>; Thu, 10 Nov 2022 13:10:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=yL0cVte9a939MoGJNQP240RI8HAcw+DjA5CbWcF3nS8=; b=1T71xRCFqpvUw35Y+LokJpZPps
	sQ5OLtH7ROR3kUs3v6gYj5PZrFodWOe6HK0cczRMt1+ZA6vl9/BMzgFKqzTWTFZHnWt9fcLyZaJoH
	6xoshyfG84POI2I/oO2EhWwBv/5dn/mwjyyxQCIwW9OLBLa6PU9Q1CfAUTJRR6y6Y1CiJZ8uuswKy
	OrIhX4kYHSWvg2O7txtA+AVdwS909oscmTEJ/Xq1WO+8Vx7BBeloxT/M6hMOvwckp6PNS4stUl0av
	jkyT1An5BWQzrGsfHwLMG49mh0VHJ+FB2TuTSG/cSAKrp4nvanMgdSgIdQzzlqTXQ09c+dgdUpir2
	YEwF9AsQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ot7KK-005vsa-4S; Thu, 10 Nov 2022 13:10:40 +0000
Received: from mail-wm1-x330.google.com ([2a00:1450:4864:20::330])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ot7KH-005vqK-Hj; Thu, 10 Nov 2022 13:10:39 +0000
Received: by mail-wm1-x330.google.com with SMTP id m7-20020a05600c090700b003cf8a105d9eso1103100wmp.5;
        Thu, 10 Nov 2022 05:10:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=yL0cVte9a939MoGJNQP240RI8HAcw+DjA5CbWcF3nS8=;
        b=kpAM4pLTdK+DDmTEcqYBEUujLnIVhP1g1eiHVMXQDqrYLsplAgE7ndh/HXd8ICRR/0
         7tLu7r9tovvtWxpkdIh+QCgxviJZUNgRf7ewNk6bTk+lc8Pm+efI4ZcepphVTd0yuPKZ
         Igt0Sl1RK3X57dWmllmDDePFjby9hnxHiuhODPFCWoct6i7TQz5Dv6RohFKL6SufUrBu
         QGjuCQ0TOyTCVqKtPLDY0OeefQ37a8uWTAvfNXLIQ5BjF+wpbyIEOKhk2sQ1Xuhv9rfo
         cJea/2l1QIGuiXHOetWojjSIB/PvgJ7owrxTQD98qWAMgoYxcisXxFZlOADaCcpAznIL
         4VlA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=yL0cVte9a939MoGJNQP240RI8HAcw+DjA5CbWcF3nS8=;
        b=aVKUsFIjqGY1iTpS1ZzxfJ1keoxVUMf8tNCWNshHGw32AxRPJtf4Ofux4NERgxZqBf
         Jtre07mAubQpU9b439ZjmyqScaBS6u6vmOKisYGLh4qbdrjjVRTZwCCC0S3z1rzten2B
         PSrsXbTTwyWZ4b0WG2fjkIPZtcGytu419NJwtj5E9teSPsU/8urTnoGZRvHQex4QZLy0
         RMFdandSe0Xnt+mkLn4NiS+B+KsyO68DVOuLoaj65tVGZo3TvLeBfwfUnK02X809kJ4r
         ZI4WFW0yqXE8FaBVOhib2MxP4DntHPx231OsxWdpQCNDrOM7v5fXfQ+7BjvPUmv9pHrD
         Evig==
X-Gm-Message-State: ACrzQf082PPvh4pfWkNwis9Bhd9Lb8cVLRzpIMQhSpgXIIqsliVHDk7O
	NAynrKS8eWF7OEdHxqYeXpA=
X-Google-Smtp-Source: AMsMyM7whgHr0D/H8u9zXHEPDlzgmZkPEGOPT28zO0gppit6MnpSV8QY1AQRSIhHxQKMzTjPvvbxqA==
X-Received: by 2002:a05:600c:4ed0:b0:3cf:7fb1:e1ec with SMTP id g16-20020a05600c4ed000b003cf7fb1e1ecmr33337961wmq.181.1668085833736;
        Thu, 10 Nov 2022 05:10:33 -0800 (PST)
Received: from [192.168.1.131] ([207.188.167.132])
        by smtp.gmail.com with ESMTPSA id r8-20020a05600c2f0800b003c701c12a17sm4928259wmn.12.2022.11.10.05.10.31
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 10 Nov 2022 05:10:32 -0800 (PST)
Message-ID: <fd6c1299-4ac9-6d51-247f-3a7b7e39052b@gmail.com>
Date: Thu, 10 Nov 2022 14:10:30 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.1
Subject: Re: [PATCH v28 01/11] dt-bindings: arm: mediatek: mmsys: add vdosys1
 compatible for MT8195
Content-Language: en-US
To: =?UTF-8?B?SmFzb24tSkggTGluICjmnpfnnb/npaUp?= <Jason-JH.Lin@mediatek.com>,
 "robh+dt@kernel.org" <robh+dt@kernel.org>,
 "chunkuang.hu@kernel.org" <chunkuang.hu@kernel.org>,
 "linux@roeck-us.net" <linux@roeck-us.net>,
 =?UTF-8?B?TmFuY3kgTGluICjmnpfmrKPonqIp?= <Nancy.Lin@mediatek.com>,
 "p.zabel@pengutronix.de" <p.zabel@pengutronix.de>,
 "wim@linux-watchdog.org" <wim@linux-watchdog.org>,
 "angelogioacchino.delregno@collabora.com"
 <angelogioacchino.delregno@collabora.com>,
 "nfraprado@collabora.com" <nfraprado@collabora.com>
Cc: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 =?UTF-8?B?WW9uZ3FpYW5nIE5pdSAo54mb5rC45by6KQ==?=
 <yongqiang.niu@mediatek.com>, =?UTF-8?B?U2luZ28gQ2hhbmcgKOW8teiIiOWciyk=?=
 <Singo.Chang@mediatek.com>, "nathan@kernel.org" <nathan@kernel.org>,
 "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 "linux-mediatek@lists.infradead.org" <linux-mediatek@lists.infradead.org>,
 "daniel@ffwll.ch" <daniel@ffwll.ch>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 Project_Global_Chrome_Upstream_Group
 <Project_Global_Chrome_Upstream_Group@mediatek.com>,
 "linux-arm-kernel@lists.infradead.org"
 <linux-arm-kernel@lists.infradead.org>, "airlied@linux.ie"
 <airlied@linux.ie>, "llvm@lists.linux.dev" <llvm@lists.linux.dev>,
 "ndesaulniers@google.com" <ndesaulniers@google.com>
References: <20221107072243.15748-1-nancy.lin@mediatek.com>
 <20221107072243.15748-2-nancy.lin@mediatek.com>
 <c6297a1c-e282-4a18-f16c-fa2df08b440a@gmail.com>
 <f6d7eaa0b7e2a3ed6567692616ebc1304500806c.camel@mediatek.com>
From: Matthias Brugger <matthias.bgg@gmail.com>
In-Reply-To: <f6d7eaa0b7e2a3ed6567692616ebc1304500806c.camel@mediatek.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221110_051037_625348_9423E1C3 
X-CRM114-Status: GOOD (  23.11  )
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



On 09/11/2022 06:10, Jason-JH Lin (林睿祥) wrote:
> On Tue, 2022-11-08 at 18:46 +0100, Matthias Brugger wrote:
>> 
>> On 07/11/2022 08:22, Nancy.Lin wrote:
>> > Add vdosys1 mmsys compatible for MT8195 platform.
>> > 
>> > For MT8195, VDOSYS0 and VDOSYS1 are 2 display HW pipelines binding
>> > to
>> > 2 different power domains, different clock drivers and different
>> > mediatek-drm drivers.
>> > 
>> > Signed-off-by: Nancy.Lin <nancy.lin@mediatek.com>
>> > Reviewed-by: Nícolas F. R. A. Prado <nfraprado@collabora.com>
>> > ---
>> >   .../devicetree/bindings/arm/mediatek/mediatek,mmsys.yaml      | 4
>> > +++-
>> >   1 file changed, 3 insertions(+), 1 deletion(-)
>> > 
>> > diff --git
>> > a/Documentation/devicetree/bindings/arm/mediatek/mediatek,mmsys.yam
>> > l
>> > b/Documentation/devicetree/bindings/arm/mediatek/mediatek,mmsys.yam
>> > l
>> > index 0711f1834fbd..aaabe2196185 100644
>> > ---
>> > a/Documentation/devicetree/bindings/arm/mediatek/mediatek,mmsys.yam
>> > l
>> > +++
>> > b/Documentation/devicetree/bindings/arm/mediatek/mediatek,mmsys.yam
>> > l
>> > @@ -48,7 +48,9 @@ properties:
>> >             - const: syscon
>> >   
>> >         - items:
>> > -          - const: mediatek,mt8195-vdosys0
>> > +          - enum:
>> > +              - mediatek,mt8195-vdosys0
>> > +              - mediatek,mt8195-vdosys1
>> >             - const: mediatek,mt8195-mmsys
>> >             - const: syscon
>> >   
>> 
>> I think we had that several times already:
>> 
> https://lore.kernel.org/all/6bbe9527-ae48-30e0-fb45-519223a744d7@linaro.org/
>> 
>> We will something like this, but please check that this does not give
>> any 
>> errors/warnings:
>> 
>> diff --git
>> a/Documentation/devicetree/bindings/arm/mediatek/mediatek,mmsys.yaml 
>> b/Documentation/devicetree/bindings/arm/mediatek/mediatek,mmsys.yaml
>> index eb451bec23d3d..8e9c4f4d7c389 100644
>> ---
>> a/Documentation/devicetree/bindings/arm/mediatek/mediatek,mmsys.yaml
>> +++
>> b/Documentation/devicetree/bindings/arm/mediatek/mediatek,mmsys.yaml
>> @@ -32,13 +32,22 @@ properties:
>>                 - mediatek,mt8183-mmsys
>>                 - mediatek,mt8186-mmsys
>>                 - mediatek,mt8192-mmsys
>> -              - mediatek,mt8195-mmsys
>>                 - mediatek,mt8365-mmsys
>>             - const: syscon
>>         - items:
>>             - const: mediatek,mt7623-mmsys
>>             - const: mediatek,mt2701-mmsys
>>             - const: syscon
>> +      - items:
>> +          - const: mediatek,mt8195-vdosys0
>> +          - const: syscon
>> +      - items:
>> +          - const: mediatek,mt8195-vdosys1
>> +          - const: syscon
>> +      - items:
>> +          - const: mediatek,mt8195-mmsys
>> +          - const: syscon
>> +      deprecated: true
>> 
>>     reg:
>>       maxItems: 1
> 
> Hi Matthias,
> 
> As the vdosys0 previous reviewed patch:
> 
> https://patchwork.kernel.org/project/linux-mediatek/patch/20220927152704.12018-2-jason-jh.lin@mediatek.com/
> Should I modify the vdosys0 items format like your example?
> 
> Or should vdosys1 add items format like vdosys0's previous patch?
>      - items:
>          - const: mediatek,mt8195-vdosys1
>          - const: mediatek,mt8195-mmsys
>          - const: syscon
> 

No, vdosys1 must not have mediatek,mt8195-mmsys fallback.

Regards,
Matthias

> Regards,
> Jason-JH.Lin
> 
> 
> 
> ************* MEDIATEK Confidentiality Notice
>   ********************
> The information contained in this e-mail message (including any
> attachments) may be confidential, proprietary, privileged, or otherwise
> exempt from disclosure under applicable laws. It is intended to be
> conveyed only to the designated recipient(s). Any use, dissemination,
> distribution, printing, retaining or copying of this e-mail (including its
> attachments) by unintended recipient(s) is strictly prohibited and may
> be unlawful. If you are not an intended recipient of this e-mail, or believe
>   
> that you have received this e-mail in error, please notify the sender
> immediately (by replying to this e-mail), delete any and all copies of
> this e-mail (including any attachments) from your system, and do not
> disclose the content of this e-mail to any other person. Thank you!

