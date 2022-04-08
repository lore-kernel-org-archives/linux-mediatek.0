Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4A0D4C433EF
	for <linux-mediatek@archiver.kernel.org>; Fri,  8 Apr 2022 11:49:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=X2O3C8PXqjnzW6FSRxsNRpX7r8JTGZ+TzO8l9qtyrnE=; b=yoQE36cWvIL1Ln
	3PRp8vRbsx7XdIYCjWwhhiYfww0ytxvAeHEZG3kiQMm3lZGQoBlzaoarOEDFG7ypM2l9AHSdhYB2a
	k0AmRrI0sAwB4m4nvzPztaf0ZC5XWqOhqEO8jW01BjSHRSfa8eUZlKlsLtypFjtvEHpp0j3WWU/Tp
	HoKGi1GkRPIm0Pdy5OKEt1AgwMDD8xYqz5YPt7zpWCjnTb/bR4yoRljn3A1pJpGqt6C/3wztXjAZ3
	obEnGENkZtcAHgUnDuHCUEQAFff3bYfChh5+fo2LwLcMeqg8ArGHixAkOx3PswHjDlPTVJJrXOnh9
	M71FOS66kbie2j9WiPBw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ncn7B-00Gkfn-57; Fri, 08 Apr 2022 11:49:21 +0000
Received: from mail-ed1-x529.google.com ([2a00:1450:4864:20::529])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1ncn6w-00GkZc-8u
 for linux-mediatek@lists.infradead.org; Fri, 08 Apr 2022 11:49:07 +0000
Received: by mail-ed1-x529.google.com with SMTP id x24so4783990edl.2
 for <linux-mediatek@lists.infradead.org>; Fri, 08 Apr 2022 04:49:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language:to
 :cc:references:from:in-reply-to:content-transfer-encoding;
 bh=he3gdObBOBoinobd6bETaG2orN7yh1mXFF6rOA4GggQ=;
 b=igbEum0h0bneYqp5ZVIe0c5/1vrQ8x3yXTwOQUhN7ejBCzqIjtSNqheea8HI9IA+ir
 5kxQ9j7xw4bALYjvc3IBxdahLmf2fjsOu76cSDshPwgLul0h0dOiUL6Tjhd1oZnnKUfP
 TwNn0dICJHXo44ixZj7h5/GyKe1TwRYUOxC8cUP8EPzh/IU+sjMBkYlyj+OTaPmo+0eP
 EF5nm02LnOvVJu08CDR1lGSBn70cfah1rM8JqWihYZppDCNQ+hPS9jHPkVVseEFszO49
 lOX5NhIkE04pAoRtUlQLBStMVVULzaSIcetB3l1xg0hho8kjIZhXmJ9DPzQT1Hhbtn86
 bfiw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=he3gdObBOBoinobd6bETaG2orN7yh1mXFF6rOA4GggQ=;
 b=yoLFAwbMRummMh03yPHO2O9vywPyqmqUtNQg+n0F1nwsipiGfnDH1CrGSag3V/LVwo
 TJIEIANl96Kr+ldPCCU3kSICYu6aTlriwLYm5o2F4M8oQWP5x62YARMJg/tH0BbCFOS9
 9L1L3FaQ7dXwfWyQdYLn70zFwYWVLdkbTFcKE//dkJyRX49CwwSCKwqqyToclp9Hycjf
 sjLpeyULJnZt7x14DpBe8TXFkHolQ5pLP5jn6LiksIm6r8UfgVF9gGFwqqbCoNfeFMGA
 Qgz9GLj0BUr6xrX5Hwqq1yaf7DeJgsvIdo6zIUER5uanDAeUCbJKBjVYlc0A0ODSsJ4V
 2zlA==
X-Gm-Message-State: AOAM530WDaNvVWBDrdmot714QzfynG6dATWmFLJFB16pyssXcuxDjJRl
 bLmHW+30J/whvR1OqaceYMz18w==
X-Google-Smtp-Source: ABdhPJxdwi31EfPDB0YNNE36knwLNszHrlfTbQLlYH+xudC85hES0Ah3kL8bq7rqTOWxg1QWmV1wpQ==
X-Received: by 2002:a05:6402:202a:b0:41c:d9b0:e519 with SMTP id
 ay10-20020a056402202a00b0041cd9b0e519mr18716253edb.361.1649418542587; 
 Fri, 08 Apr 2022 04:49:02 -0700 (PDT)
Received: from [192.168.0.188] (xdsl-188-155-201-27.adslplus.ch.
 [188.155.201.27]) by smtp.gmail.com with ESMTPSA id
 k26-20020a056402049a00b004197b0867e0sm10349194edv.42.2022.04.08.04.49.01
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 08 Apr 2022 04:49:02 -0700 (PDT)
Message-ID: <0ef8f2c3-fd16-041b-3304-b167a2a36ff9@linaro.org>
Date: Fri, 8 Apr 2022 13:49:00 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [PATCH V2 01/15] dt-bindings: cpufreq: mediatek: Add MediaTek CCI
 property
Content-Language: en-US
To: Rex-BC Chen <rex-bc.chen@mediatek.com>, rafael@kernel.org,
 viresh.kumar@linaro.org, robh+dt@kernel.org, krzk+dt@kernel.org
Cc: matthias.bgg@gmail.com, jia-wei.chang@mediatek.com,
 roger.lu@mediatek.com, hsinyi@google.com, linux-pm@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 Project_Global_Chrome_Upstream_Group@mediatek.com
References: <20220408045908.21671-1-rex-bc.chen@mediatek.com>
 <20220408045908.21671-2-rex-bc.chen@mediatek.com>
 <a171f33c-cda1-8602-ac67-93076b676578@linaro.org>
 <8d466903d42dbc823f4d0a245378d983ab904435.camel@mediatek.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <8d466903d42dbc823f4d0a245378d983ab904435.camel@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220408_044906_400655_B0DD73F0 
X-CRM114-Status: GOOD (  13.72  )
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

On 08/04/2022 12:24, Rex-BC Chen wrote:
>>
>> You need to describe the type. I am a bit confused whether this is a
>> cci
>> (so cci-control-port property?) or an interconnect (so interconnect
>> property)... It does not look like a generic property, so you need
>> vendor prefix.
> 
> Hello Krzysztof,
> 
> Thanks for your review.
> 
> Yes, this cci is not arm's cci (cci-control-port property), and it's
> mediatek's cci. I will revise this name to "mtk-cci" in next version.

Vendor is "mediatek" and comma comes after it. See devicetree spec
paragraph 2.3.1.

> 
>>
>>> +       For details, please refer to
>>> +       Documentation/devicetree/bindings/devfreq/mtk-cci.yaml
>>
>> Such file does not exist.
> 
> This mediatek cci is still upstreaming in this patch:
> message-id:20220408052150.22536-2-johnson.wang@mediatek.com
> 
> Do you have suggestion that I should put this reference?

> Or I just remove it and describe the mediatek cci in detail?

It's ok, but you need to keep path/filename updated.


Best regards,
Krzysztof

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
