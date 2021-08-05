Return-Path: <SRS0=uG8S=M4=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.4 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 13135C4320A
	for <linux-mediatek@archiver.kernel.org>; Thu,  5 Aug 2021 15:41:21 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D224E6115C
	for <linux-mediatek@archiver.kernel.org>; Thu,  5 Aug 2021 15:41:20 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org D224E6115C
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:
	Message-ID:References:Cc:To:From:Subject:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=Aj/bJam3n5RQBDoPAsSrszs16Q+9FoAc/t5zvL/wKes=; b=Ux+KxkQgFRr3lDRGKLjoRG7xom
	oiKDScoMDf2E6krCaUwGhWBlsnBlRcB81GReyclKDxuwW86orKClHdtYu03p0lW89MBhPh8z4eqvC
	75sWJk0n23xbfT1Zeb1SpWVpLbzlQ99C0XDTgq1ziDfFkNLgPR5bujDMe75RK4X2KLVxRqdI/+WH2
	hq1ywxUtrp6u+Ovrt6/heEtVrIUkJMmEyrAu51E7dihSP7QV0c4ukP0hZMewV72JVHVJxrMNvwKY4
	JbD6fpnh85Gf9a7R7TRG5V02jRaPBthUUx9ymexXf1F+l7wQSZLNuMztF3sEgcvhF2v08ZcaXdlZg
	dUzVorpw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mBfUc-00A5Wp-Hk; Thu, 05 Aug 2021 15:41:10 +0000
Received: from mail-wr1-x431.google.com ([2a00:1450:4864:20::431])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mBfUZ-00A5VF-0O; Thu, 05 Aug 2021 15:41:09 +0000
Received: by mail-wr1-x431.google.com with SMTP id b11so7172657wrx.6;
 Thu, 05 Aug 2021 08:41:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:from:to:cc:references:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=mVQSQN7gzFUu+SQZHn++i1EQsf1unkn38HuidAPY1jk=;
 b=EnSWxeBF1ZgrkW2cs8zQj6XSQRMdMi2KJwuWBliPKMN5E5fwIQrR6W1KoP6J2MZOQp
 qtlLcHlvJqbZ9kkwlszodvYM6HSw+1S0fM/KiF1iiDgw0jzZXilEehO5hojIG31rU4RP
 u2MkbGtI/Di7NufyLVvJwiXbrjChWzgElYtWu2HrlED5EDf0exg/hnt9lJNZp5G39obB
 BmCx4i3hSxbOhjJnanOoxP75P3guSfyF4RI5AqvlYL4sPfgLVe93T7jHsW5lSeuR+3uO
 CcKh6CDjt9tfz4Y2U0d6QacHzN5zDz7e8Ed+o7RDYzsMFw7FlMt2lOY36XtW8E/Xtk9k
 JHRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:from:to:cc:references:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=mVQSQN7gzFUu+SQZHn++i1EQsf1unkn38HuidAPY1jk=;
 b=tPlYyEvvk/qEsIewB92mk2yokW39qcHpYtwllYnJZ7WXvVDAaUI3OFPWrRtfJ2Us5j
 VbCE6p0t4oPshGhZnXcM3eJ77lXeNnV2jaJ4NhcN7adKRUYPKHI2l5D9HMKjs7YsLXn3
 4z2XvVEsykVWHLJyog1iJ8shun/8UbPl1+fASpLe8ro3eaIGKsoJZntLgoUOu4xe3MMY
 CaHY8yOGnVtExGhdk/Gkwn+Pm398LskgCwh4Y19ufG9JOXQxGR4zfxZoOQk40w8+6eEi
 2SmLI6BqpoVF4V60J/fMsPrwFrpE6y10WhCIuUZ2nCCTyix2mIkin2HVSfsSV0OK+DVG
 EXNQ==
X-Gm-Message-State: AOAM532BoCUrk4Yn9ui70A4E0dSj1uvqJ4deVCZm9DCfHZmY1RP7ka98
 mGWz9ZK2HG+bx6xYU5O0JsM=
X-Google-Smtp-Source: ABdhPJxCtpqIunU/mFZBvCoYDNuqfTLTZ2pUolhGj+wx3TK++qKad7kmgUfuhNZIAOYiVXXE+6nQ4Q==
X-Received: by 2002:a5d:6789:: with SMTP id v9mr6099277wru.254.1628178065390; 
 Thu, 05 Aug 2021 08:41:05 -0700 (PDT)
Received: from ziggy.stardust (static-55-132-6-89.ipcom.comunitel.net.
 [89.6.132.55])
 by smtp.gmail.com with ESMTPSA id l4sm6504709wrw.32.2021.08.05.08.41.04
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 05 Aug 2021 08:41:04 -0700 (PDT)
Subject: Re: [v12 02/20] dt-bindings: ARM: Mediatek: Add mmsys document
 binding for MT8192
From: Matthias Brugger <matthias.bgg@gmail.com>
To: Chun-Jie Chen <chun-jie.chen@mediatek.com>,
 Stephen Boyd <sboyd@kernel.org>, Nicolas Boichat <drinkcat@chromium.org>,
 Rob Herring <robh+dt@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-mediatek@lists.infradead.org, linux-clk@vger.kernel.org,
 devicetree@vger.kernel.org, srv_heupstream@mediatek.com,
 Project_Global_Chrome_Upstream_Group@mediatek.com
References: <20210705033824.1934-1-chun-jie.chen@mediatek.com>
 <20210705033824.1934-3-chun-jie.chen@mediatek.com>
 <564fa3c8-1d85-5e98-f3f9-f83cb17e905a@gmail.com>
 <15d27282-54b2-2cfe-7f44-2df3be11dd40@gmail.com>
Message-ID: <e3210d22-7960-f8e4-c12d-d49ac5465463@gmail.com>
Date: Thu, 5 Aug 2021 17:41:04 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.12.0
MIME-Version: 1.0
In-Reply-To: <15d27282-54b2-2cfe-7f44-2df3be11dd40@gmail.com>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210805_084107_102180_E8D5F15B 
X-CRM114-Status: GOOD (  15.46  )
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

On 05/07/2021 17:45, Matthias Brugger wrote:
> On 05/07/2021 17:40, Matthias Brugger wrote:
>>
>>
>> On 05/07/2021 05:38, Chun-Jie Chen wrote:
>>> This patch adds the mmsys document binding for MT8192 SoC.
>>>
>>> Signed-off-by: Chun-Jie Chen <chun-jie.chen@mediatek.com>
>>
>> Reviewed-by: Matthias Brugger <matthias.bgg@gmail.com>
>>
> 
> Of course, that's not what we need here...
> 
> Now pushed to v5.14-tmp/dts64 until v5.14-rc1 is released.
> 

Given that the change to yaml was taken by Rob Herring I drop this patch from my
queue.

Regards,
Matthias

> Thanks!
> Matthias
> 
>>> ---
>>>  .../devicetree/bindings/arm/mediatek/mediatek,mmsys.txt          | 1 +
>>>  1 file changed, 1 insertion(+)
>>>
>>> diff --git a/Documentation/devicetree/bindings/arm/mediatek/mediatek,mmsys.txt b/Documentation/devicetree/bindings/arm/mediatek/mediatek,mmsys.txt
>>> index 78c50733985c..9712a6831fab 100644
>>> --- a/Documentation/devicetree/bindings/arm/mediatek/mediatek,mmsys.txt
>>> +++ b/Documentation/devicetree/bindings/arm/mediatek/mediatek,mmsys.txt
>>> @@ -16,6 +16,7 @@ Required Properties:
>>>  	- "mediatek,mt8167-mmsys", "syscon"
>>>  	- "mediatek,mt8173-mmsys", "syscon"
>>>  	- "mediatek,mt8183-mmsys", "syscon"
>>> +	- "mediatek,mt8192-mmsys", "syscon"
>>>  - #clock-cells: Must be 1
>>>  
>>>  For the clock control, the mmsys controller uses the common clk binding from
>>>
> 


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
