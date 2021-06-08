Return-Path: <SRS0=WQwL=LC=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.2 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=unavailable autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7142DC47082
	for <linux-mediatek@archiver.kernel.org>; Tue,  8 Jun 2021 14:47:13 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 349BC61183
	for <linux-mediatek@archiver.kernel.org>; Tue,  8 Jun 2021 14:47:13 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 349BC61183
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:
	Message-ID:Subject:From:References:Cc:To:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=fu7hMuwJiCg7l6zZjUvSM4+XiTzMxL1o0XVb4bKOUV0=; b=jJW6X5BoQ8uSfJGgJVFtYoXzs4
	05uh2JnBw04PhXaVN4yjdLw2ywIFwEuMYXiO8PDPSKVX02E1vCRRo33fxvpuWE/mGzSJIbd7gfQcG
	MsyR77kn7byEpTTjKCEmbrvASwoUTVXUVKuuIO4Lv4Y2F9IvZyVD1ASR63tzye/ebMRqyr8dHapW/
	yNQSmJ2M/ZGSpYhucA8XMA7ZCWUqnoN/V5DbTcpb0ZoM/wbq9wr600d1nUMfb7eYqf50ht4ZbvgdX
	eP3ZUnu/qbZTiDT4ImAdi9mfsLBcwnPSeaNB3InXk6ULnOXd49JITSbYrmJFu+fBGYKdy3tXMpPcU
	yj9oqd1w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1lqd0M-00907y-JN; Tue, 08 Jun 2021 14:46:58 +0000
Received: from mail-wm1-f47.google.com ([209.85.128.47])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1lqd0I-00906r-RK; Tue, 08 Jun 2021 14:46:57 +0000
Received: by mail-wm1-f47.google.com with SMTP id
 u5-20020a7bc0450000b02901480e40338bso1699905wmc.1; 
 Tue, 08 Jun 2021 07:46:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=to:cc:references:from:subject:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=WhGg1GY2JArUC9JhigDKpkZ6Xe7W1oA3+93jKzq1f38=;
 b=B4mRSioLZ6j//5zPneKMUDsP/wpDVCY3Wj2qLzdp4992p9GhKUIipAyWaUGsLm80Zw
 7lOh10qeX5l99QNrs9GjEE0SrT9dVncEr473I1EEqcy6ycFzWJZEMzhRtb5qQB1qGoXB
 n1qvMWoAU8FNr7m/0F3eLqtYp0M1FHOwPye6OgsWl4PIZXfTNb3xwWgOxJSyqSTd/M4O
 hdtLDsr2QZ0beBYVm12UCEW8zy46M+XbtSIUCmVORs4b2ycGQgGOrK2W/LPyGcGIjkWN
 dJ9dpdHl1qGnl2p3UDlMIf38FqT3dgYleFzwXRqEa71m7/zO11Hk/98O6f9f/4ECXNBA
 s7RQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:to:cc:references:from:subject:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=WhGg1GY2JArUC9JhigDKpkZ6Xe7W1oA3+93jKzq1f38=;
 b=mrOb/I7VexsEQud6UkRCX/8nYi3kIZzIJHIU65pAgoAEmqMxIgZTRBgwUCn6joFAH9
 2kvsQYfk/zf06wlWuvDcJJ6lC7MSF1p9/uUznbpznTGYrUtfjPlsMMmji3NhsLEtgzln
 Dyxhss0tKna02j4NH1Io0dYIEByQztl0bfsMcizGJz3ZR2viTA2KTUHLfapjNs4dpiAQ
 vJw16PuMwATd69BQGu0ZMs9P9/lNQw2ugfcdrFu7Kr+rn3FSNeWdG2tXKrR1vYB39AzE
 X66XIZ6tU2O04iki7eF7d/VfovD/o10jZsIxunO8UFTa3KJbGKN6N3viHUpSrUsVhuwD
 SFQA==
X-Gm-Message-State: AOAM532t2DysLPEo3c5FIfGPNqZp/LTIuCb5O5PDVp67MRiZUJF2v9OE
 ypTNb0lF7soOsD7gRAl3Cok=
X-Google-Smtp-Source: ABdhPJzQhcjeRmC8c9aR3UirCowVfXJEx+lHuSu9dvfO3W5sxgdTcQ+GcLNJJx7hbfaGgRDGOE7ieg==
X-Received: by 2002:a05:600c:1c84:: with SMTP id
 k4mr4726772wms.164.1623163551514; 
 Tue, 08 Jun 2021 07:45:51 -0700 (PDT)
Received: from ziggy.stardust ([213.195.126.134])
 by smtp.gmail.com with ESMTPSA id n10sm7990257wri.77.2021.06.08.07.45.50
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 08 Jun 2021 07:45:50 -0700 (PDT)
To: Chun-Jie Chen <chun-jie.chen@mediatek.com>, Rob Herring <robh@kernel.org>
Cc: Stephen Boyd <sboyd@kernel.org>, Nicolas Boichat <drinkcat@chromium.org>, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-mediatek@lists.infradead.org, linux-clk@vger.kernel.org,
 devicetree@vger.kernel.org, srv_heupstream@mediatek.com,
 Project_Global_Chrome_Upstream_Group@mediatek.com,
 Weiyi Lu <weiyi.lu@mediatek.com>
References: <20210524122053.17155-1-chun-jie.chen@mediatek.com>
 <20210524122053.17155-2-chun-jie.chen@mediatek.com>
 <20210602171201.GA3566462@robh.at.kernel.org>
 <66e017401ab93aa02c5d2bbf11be9589b36649ac.camel@mediatek.com>
From: Matthias Brugger <matthias.bgg@gmail.com>
Subject: Re: [PATCH v9 01/22] dt-bindings: ARM: Mediatek: Add new document
 bindings of imp i2c wrapper controller
Message-ID: <1f59ed31-4a0e-9719-bf84-1fe4cdd6c57d@gmail.com>
Date: Tue, 8 Jun 2021 16:45:49 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.2
MIME-Version: 1.0
In-Reply-To: <66e017401ab93aa02c5d2bbf11be9589b36649ac.camel@mediatek.com>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210608_074654_947900_7958B831 
X-CRM114-Status: GOOD (  22.59  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org



On 07/06/2021 07:20, Chun-Jie Chen wrote:
> On Wed, 2021-06-02 at 12:12 -0500, Rob Herring wrote:
>> On Mon, May 24, 2021 at 08:20:32PM +0800, Chun-Jie Chen wrote:
>>> This patch adds the new binding documentation of imp i2c wrapper
>>> controller
>>> for Mediatek MT8192.
>>>
>>> Signed-off-by: Weiyi Lu <weiyi.lu@mediatek.com>
>>> Signed-off-by: chun-jie.chen <chun-jie.chen@mediatek.com>
>>> ---
>>>  .../arm/mediatek/mediatek,imp_iic_wrap.yaml   | 80
>>> +++++++++++++++++++
>>>  1 file changed, 80 insertions(+)
>>>  create mode 100644
>>> Documentation/devicetree/bindings/arm/mediatek/mediatek,imp_iic_wra
>>> p.yaml
>>>
>>> diff --git
>>> a/Documentation/devicetree/bindings/arm/mediatek/mediatek,imp_iic_w
>>> rap.yaml
>>> b/Documentation/devicetree/bindings/arm/mediatek/mediatek,imp_iic_w
>>> rap.yaml
>>> new file mode 100644
>>> index 000000000000..fb6cb9e60ee2
>>> --- /dev/null
>>> +++
>>> b/Documentation/devicetree/bindings/arm/mediatek/mediatek,imp_iic_w
>>> rap.yaml
>>> @@ -0,0 +1,80 @@
>>> +# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
>>> +%YAML 1.2
>>> +---
>>> +$id: 
>>> http://devicetree.org/schemas/arm/mediatek/mediatek,imp_iic_wrap.yaml#
>>> +$schema: http://devicetree.org/meta-schemas/core.yaml#
>>> +
>>> +title: MediaTek IMP I2C Wrapper Controller
>>> +
>>> +maintainers:
>>> +  - Chun-Jie Chen <chun-jie.chen@mediatek.com>
>>> +
>>> +description:
>>> +  The Mediatek imp i2c wrapper controller provides functional
>>> configurations and clocks to the system.
>>> +
>>> +properties:
>>> +  compatible:
>>> +    items:
>>> +      - enum:
>>> +          - mediatek,mt8192-imp_iic_wrap_c
>>> +          - mediatek,mt8192-imp_iic_wrap_e
>>> +          - mediatek,mt8192-imp_iic_wrap_s
>>> +          - mediatek,mt8192-imp_iic_wrap_ws
>>> +          - mediatek,mt8192-imp_iic_wrap_w
>>> +          - mediatek,mt8192-imp_iic_wrap_n
>>
>> Looks to me like these are all the same h/w, but just have differing 
>> sets of clocks. That's not really a reason to have different 
>> compatibles. 
>>
>> If you need to know what clocks are present, you can walk the DT for 
>> all 'clocks' properties matching this clock controller instance. Or
>> use 
>> 'clock-indices' to define which ones are present.
>>
>> Rob
> 
> Some module is divided to sub-modules which are designed in different
> h/w blocks for different usage, and if we want to use the same
> compatible to present these h/w blocks, we need to move the clock data
> provided by these h/w blocks to dts, but we usually use different
> compatible to get the h/w blocks data in
> Mediatek's clock driver, so do you suggest to register clock provided
> by different h/w blocks using same compatible?
> 

The mapping of them is as following:
imp_iic_wrap_c:  11007000
imp_iic_wrap_e:  11cb1000
imp_iic_wrap_s:  11d03000
imp_iic_wrap_ws: 11d23000
imp_iic_wrap_w:  11e01000
imp_iic_wrap_n:  11f02000

Regards,
Matthias

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
