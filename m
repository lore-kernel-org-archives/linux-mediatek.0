Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 45215C433F5
	for <linux-mediatek@archiver.kernel.org>; Wed, 29 Dec 2021 14:25:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:Subject:From:References:Cc:To:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=/HXxPU0Ot40vD/rlwJsY2Rft9kyK69pmkG1Aq/pbAiM=; b=O67RE8N0P4/hEk
	XXWcvUeC6nNuiTgc3T9l2aFfMzlGo98oQp1jMtjnXOWEO2V9uD2BeLSWl7w71pgwNnVtnuWRv+Zkr
	+YavNkzF2NuyFqsM0tkEigIUQwJu121FhKqF62C+L9ChD4poMc3V/FTUI8nKul+ya9xzKTWS8bkei
	qtxmnHOcJ62jNtfWpGRebvTUyrLDfLOdHmxrqfPpyyBWRweFV4T2ChMX4IXJPgjm6t6lpDaxarHWu
	Ma5vFQqFAf4DXG+A+lMiqj9Z6X12O05tq4IM7v7r2yMm/+XNH6bEJIdVe1vxwaYo6n4/ShwR1CVPV
	3Mi4P5F7MQTHeQ2dXJhQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1n2Ztd-002xCj-Pu; Wed, 29 Dec 2021 14:25:41 +0000
Received: from mail-wr1-x429.google.com ([2a00:1450:4864:20::429])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1n2ZtR-002xAM-Cf; Wed, 29 Dec 2021 14:25:30 +0000
Received: by mail-wr1-x429.google.com with SMTP id q16so44790833wrg.7;
 Wed, 29 Dec 2021 06:25:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=message-id:date:mime-version:user-agent:content-language:to:cc
 :references:from:subject:in-reply-to:content-transfer-encoding;
 bh=pjYlN3fQUyrH1Y9l7SaP7OpdaDMi9fBO087bmleGSU4=;
 b=GSevx4zkS/+CEXR2sk7lq4+NtIdwxyoKz9q3GYUNVIVl3l8gbxqoytPK22pk48b6mg
 AIpyTkdwFB0yYaIP/Q8TtWjRHRVZrjipQxTKmXV5+PypzaROMykKjfQ/IOvZiIkpiyU3
 q96AgIQuXqMrhbOF/bdUrJ7H+iyh1ZoGdFfn4XMg14YveEMckhjcF3jrGTagYezvcR30
 VEMss+0o+ZBg7BUF3fGr/GA8AqrLy42P09fpBaxLWKDMsIW+d2dQq7UmtZoCt4XWU5pz
 l7nhPCccebnqFZNUuWUOYiNJYnSEzFNt8vWouIaDAsDkRlzUkjFSdqRcMA6+MmrJu3JE
 DJTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent
 :content-language:to:cc:references:from:subject:in-reply-to
 :content-transfer-encoding;
 bh=pjYlN3fQUyrH1Y9l7SaP7OpdaDMi9fBO087bmleGSU4=;
 b=ZLSM0KhW4V49mFL5Ydz9DXFSRhmEqLdJChbFe+aUYRqw3AUiUBJvL8vHdL+MDEJ1tZ
 geo0KfNiLx2TJVtKJl7XOaBjdBfiosamYM9kEQiPdU5PGlZlXad2+wCMkM2j/7NGA8AI
 NTg01dxZGnemX3UgW2RwUS+8Yta8p0B/Y9kp4uwMdWO321GxSK/lCe42tvsztNRF9Xeu
 cys0RytOBNhoF/mF0StDUImlFBLybvzLTXpM5B9bP2BUjduMbd5W0b21NY1G7cPXfir8
 BSJmt9uhYBqaRaT9YDMoK/LAHoZn06PdtrqtS+Y8dXvTm+RuzTGIABKhhQdhSBPJpta/
 ifog==
X-Gm-Message-State: AOAM533Kls++qjckiZu2AKETAnZvLQgv8yQEogLBGS9QMi3wrAx/TdJt
 IxGRvVZxtwfZFCT3Y10K8b8=
X-Google-Smtp-Source: ABdhPJzRBdhVxtUXyHCJ8VRyq/aXdrpUZj7KVHcKANKeZLNwqwpB+e7BrOt6XxS6LvatplTbKaNPBA==
X-Received: by 2002:a05:6000:2c8:: with SMTP id
 o8mr20891999wry.84.1640787927628; 
 Wed, 29 Dec 2021 06:25:27 -0800 (PST)
Received: from [192.168.2.177] ([207.188.161.251])
 by smtp.gmail.com with ESMTPSA id l2sm21664851wrs.43.2021.12.29.06.25.26
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 29 Dec 2021 06:25:27 -0800 (PST)
Message-ID: <363ed3cd-2a08-26a0-31e3-2ee4d01f71c3@gmail.com>
Date: Wed, 29 Dec 2021 15:25:26 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.0
Content-Language: en-US
To: miles.chen@mediatek.com
Cc: airlied@linux.ie, chunkuang.hu@kernel.org, daniel@ffwll.ch,
 dri-devel@lists.freedesktop.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org,
 p.zabel@pengutronix.de
References: <fcaccc97-e920-08eb-ec3f-4c4b11ea8925@gmail.com>
 <20211229030405.4338-1-miles.chen@mediatek.com>
From: Matthias Brugger <matthias.bgg@gmail.com>
Subject: Re: [PATCH] drm/mediatek: Fix unused-but-set variable warning
In-Reply-To: <20211229030405.4338-1-miles.chen@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211229_062529_470907_EDF579CD 
X-CRM114-Status: GOOD (  22.17  )
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



On 29/12/2021 04:04, miles.chen@mediatek.com wrote:
> Hi,
> 
> On 28/12/2021 10:25, Miles Chen wrote:
>> Fix unused-but-set variable warning:
>>> drivers/gpu/drm/mediatek/mtk_cec.c:85:6: warning: variable 'tmp' set but not used [-Wunused-but-set-variable]
>>>
>>
>> Actually we ignore the value passed to mtk_cec_mask. In case of
>> mtk_cec_mask(cec, CEC_CKGEN, 0 | CEC_32K_PDN, PDN | CEC_32K_PDN);
>>
>>
>> We are not setting CEC_32K_PDN. I wonder which side effect will it have to set
>> that bit.
> 
> I am confused about "not setting CEC_32K_PDN" part,
> in case mtk_cec_mask(cec, CEC_CKGEN, 0 | CEC_32K_PDN, PDN | CEC_32K_PDN);
> CEC_32K_PDN (BIT(19)) is set.
> 
> for exmaple:
> CEC_32K_PDN is BIT(19)
> PDN is BIT(16)
> say tmp = 0xffffffff;

You mean reading the register returns 0xffffffff, correct?

> 
> mask = PDN | CEC_32K_PDN;

mask = 0x48000

> val = 0 | CEC_32K_PDN;

val = 0x40000

> 
> tmp = fff6ffff, mask = 90000
> val = 80000, tmp = fffeffff
> 
> u32 tmp = readl(cec->regs + offset) & ~mask; // tmp = fff6ffff

tmp = 0xffffffff & ~(0x48000) // tmp = 0xffb7ffff

> tmp |= val & mask; // tmp = fffeffff

tmp |= 0x40000 & 0x48000 // tmp = 0xff7fffff

> writel(val, cec->regs + offset); // val = 80000, tmp = fffeffff

val = 0x40000, tmp = 0xff7fffff

> 
> in both val and tmp case, CEC_32K_PDN is set.
> 

You are right, in both cases the bit is set, but the funciton does not do what 
it is supposed to do.

With you fix:
With the mask we define bits that
a) are set to zero if not present in val
b) set to one, when part of val, independent of what the value was in the 
register read.

mtk_cec_mask(cec, CEC_CKGEN, 0 | CEC_32K_PDN, PDN | CEC_32K_PDN);


Will set CEC_32K_PDN to one and clear PDN in the register.

mtk_cec_mask(cec, RX_GEN_WD, 0, HDMI_PORD_INT_32K_CLR | RX_INT_32K_CLR |
  HDMI_HTPLG_INT_32K_CLR | HDMI_PORD_INT_32K_EN |
  RX_INT_32K_EN | HDMI_HTPLG_INT_32K_EN);

Will just clear all bits of the mask.

Without your patch, we will just write the val to the register and don't care 
what the register value was before that.

We should somehow mention that in the commit message, as it's not only about a 
not used variable, it actually has an influence on the value we write(-back) to 
the register.

Regards,
Matthias

>> Anyway, if it's the right thing to do, we should add:
>>
>> Fixes: 8f83f26891e1 ("drm/mediatek: Add HDMI support")
> 
> I will add the Fixes tag, thanks.
> 

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
