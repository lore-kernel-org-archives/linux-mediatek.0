Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0958EC46467
	for <linux-mediatek@archiver.kernel.org>; Tue,  3 Jan 2023 15:35:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=kE4qqRxLpxxCedBuUJYA+jounttnp3G/CGQUAy2owUc=; b=cgdsI6pF204USUH/LzF38AnlxQ
	vPU4OV5L71BlrkpNvJrurqX/fybclgRtzMozynt7wgMHBRvUxrR9wjQxYeWWCVHRjY5V8e5xywwnE
	4XpdMpAdIiKKkpOkJVsAt6/qfy/PT/cXoXizL/JX6JQ7AYEP6JUW+fnwCKGzOixfgwdE7woAsbOcx
	T+Bp92X8Ue+WB5x8Nce4B/FaElzNWYwvycYPcIYe0npE5G9RHtbZcyrUDs0JVDr/eCDfXF6einuoZ
	Eg71BWUr7Stl3Oc4U5r0MWhBt+44Mlp4WJetuD50mfVqfUo+F+nrBYvTgeE+SDSV+BNcR39QpKKwJ
	cw36eOfQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pCjJz-002UYL-O8; Tue, 03 Jan 2023 15:35:24 +0000
Received: from mail-lf1-x12a.google.com ([2a00:1450:4864:20::12a])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pCfSr-000xnp-KE
	for linux-mediatek@lists.infradead.org; Tue, 03 Jan 2023 11:28:21 +0000
Received: by mail-lf1-x12a.google.com with SMTP id b3so45258577lfv.2
        for <linux-mediatek@lists.infradead.org>; Tue, 03 Jan 2023 03:28:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=kE4qqRxLpxxCedBuUJYA+jounttnp3G/CGQUAy2owUc=;
        b=Ill95URu0ok8mTKcTGS2lBtZw4eZqXOgHuXYKVuUbo61K1thYXNo+Ruh9Glym7puZ0
         zX+XPzU9HkF5NtDV9G9rXGtsfzmAOJikoXWin/OvNxtIq8uqfGhYmtrAPSEAsiU7V1Y5
         oLVnULMbddELmoYJH5P78lCIHYZt6Xd4d5rGEnQ+jRQhTspmocjmECdaqb2f976PdL2z
         TzHa+su9MOIZrwYWj4CqUurmPyIyctOCVXkevmsCzEw1W+ZEN/+9kvMz0UXZ0GelNyM3
         ylERXrH6lkJrnMQzYqxWIvb8GHGOvWjgDwWntvVljGUDLd3hptx9gakn71TA3mAo2Yrd
         L9gA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=kE4qqRxLpxxCedBuUJYA+jounttnp3G/CGQUAy2owUc=;
        b=GOyixlJA/wW2YCf5jsDrb6tboJU32GnhdOLYt5hMUZvpUy5n868uue9IIjLQHX1ilq
         lHX49rsGkfa5lIe4dH/3sU0ZS7S6Yj0HIS9RnB1UK5flYNAPlobQtEiZjZgArQqpeFLR
         Z0Q1JG4RmA2fJ6cKF+TyfJ55Q48H2ci9AEHXiDjYdsFAJJ6gWGZDPkHnsgw3yevZ7VFi
         uh72Dy0UN6pj5/BkB7ZsqNKwH87IgNgXs5Vku9TSCE40tgzcEWZBPyzs9XDKBude9uud
         KNkcATxb5t+6/kkTI9rhNoubTcLRk3K+XwrNng9AUzJvi71Qmsr6RM5Ityk4v6bkd0Ta
         LJDw==
X-Gm-Message-State: AFqh2ko7QNF1kIlypSdkvS79YZHYYirJ5oOOIk6h4GNfnxJ8OsMMkejl
	Gtbm+w9YkSTjxjmrle2kDSqIpsRyMS4f5/RH
X-Google-Smtp-Source: AMrXdXvivJCiSvdg7M62GVqjA581ZqA/tb1WZnOzpgmcCBvtTZ9QkS3notudi/QiV+FIM4Pn1tKE8Q==
X-Received: by 2002:a05:6512:3601:b0:4b7:13b:259d with SMTP id f1-20020a056512360100b004b7013b259dmr10839992lfs.48.1672745293524;
        Tue, 03 Jan 2023 03:28:13 -0800 (PST)
Received: from [192.168.0.20] (088156142067.dynamic-2-waw-k-3-2-0.vectranet.pl. [88.156.142.67])
        by smtp.gmail.com with ESMTPSA id o10-20020ac24e8a000000b004b4fefacd89sm4798236lfr.139.2023.01.03.03.28.11
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 03 Jan 2023 03:28:13 -0800 (PST)
Message-ID: <30423568-df03-1d72-81fe-3a4b33214e5c@linaro.org>
Date: Tue, 3 Jan 2023 12:28:11 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.1
Subject: Re: [RFC PATCH 3/4] dt-bindings: panel: Introduce dual-link LVDS
 panel
Content-Language: en-US
To: Aradhya Bhatia <a-bhatia1@ti.com>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Tomi Valkeinen <tomba@kernel.org>, Jyri Sarha <jyri.sarha@iki.fi>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Thierry Reding <thierry.reding@gmail.com>, Sam Ravnborg <sam@ravnborg.org>,
 Maxime Ripard <maxime@cerno.tech>, Liam Girdwood <lgirdwood@gmail.com>,
 Mark Brown <broonie@kernel.org>,
 Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
 Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt
 <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Matthias Brugger <matthias.bgg@gmail.com>, Guo Ren <guoren@kernel.org>
Cc: DRI Development List <dri-devel@lists.freedesktop.org>,
 Devicetree List <devicetree@vger.kernel.org>,
 Linux Kernel List <linux-kernel@vger.kernel.org>,
 Linux RISC-V List <linux-riscv@lists.infradead.org>,
 Linux ARM Kernel List <linux-arm-kernel@lists.infradead.org>,
 Linux Mediatek List <linux-mediatek@lists.infradead.org>,
 Linux C-SKY Arch List <linux-csky@vger.kernel.org>,
 Nishanth Menon <nm@ti.com>, Vignesh Raghavendra <vigneshr@ti.com>,
 Rahul T R <r-ravikumar@ti.com>, Devarsh Thakkar <devarsht@ti.com>,
 Jai Luthra <j-luthra@ti.com>, Jayesh Choudhary <j-choudhary@ti.com>
References: <20230103064615.5311-1-a-bhatia1@ti.com>
 <20230103064615.5311-4-a-bhatia1@ti.com>
 <85837957-f6d2-4722-7693-98c6cf932096@linaro.org>
 <32d66fb7-6c63-0985-222f-0bd3c36c165d@ti.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <32d66fb7-6c63-0985-222f-0bd3c36c165d@ti.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230103_032817_784165_C0305400 
X-CRM114-Status: GOOD (  19.88  )
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

On 03/01/2023 12:02, Aradhya Bhatia wrote:
> But this is throwing an error. I am confused what else could be done.
> Can you please suggest what might be a more accurate check here?
> 
>>
>>> +              required:
>>> +                - dual-lvds-odd-pixels
>>> +        then:
>>> +          properties:
>>> +            port@1:
>>> +              properties:
>>> +                dual-lvds-even-pixels: true
>>> +                dual-lvds-odd-pixels: false
>>
>> Why do you need this? Your oneOf before already solves it.
> 
> I agree with your comment here. It makes sense to only have
> 
> 	dual-lvds-even-pixels: true
> 
> and have the oneOf condition take care of the other. But, I just tested
> this and it was unable to pick-up this intentionally-added error.
> 
> I added 'dual-lvds-odd-pixels' property to both the nodes, and
> dt_binding_check passes successfully (which it should have not.)
> 
> Instead, if I only keep this,
> 
> 	dual-lvds-odd-pixels: false
> 
> then the dt_binding_check detects the error as it should.
> 
> Regardless, I am curious why the first method doesn't work. Will try to
> explore more on that.

The check for presence of properties is only against required:, but you
added there properties. Like this:

https://elixir.bootlin.com/linux/v5.17-rc2/source/Documentation/devicetree/bindings/mfd/samsung,s5m8767.yaml#L155


Other way is to drop your both oneOf and entire allOf from ports and use:

oneOf:
  - properties:
      ports:
        $ref: /schemas/graph.yaml#/properties/ports
        properties:
          port@0:
            required:
              - dual-lvds-odd-pixels
          port@1:
            required:
              - dual-lvds-even-pixels
  - properties:
      ports:
        $ref: /schemas/graph.yaml#/properties/ports
        properties:
          port@1:
            required:
              - dual-lvds-odd-pixels
          port@0:
            required:
              - dual-lvds-even-pixels


Best regards,
Krzysztof


