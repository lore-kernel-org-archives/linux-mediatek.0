Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8E371C19F2C
	for <linux-mediatek@archiver.kernel.org>; Thu,  4 Aug 2022 07:25:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=tnOwkKfhBzXFppIxRkEPpyNln0liXtEqX58YRBpJcr8=; b=09Gw1XP3uHMXOWiVDEZorMHvef
	zOOA7i5Vw3Y8j2/DG/Q0w0Qk89VZhhnCNchnEskTHEo8NcH/n8DYJl52ZdFQaXYzuRzvcKStG/T8k
	r2sTAITa+roaPHEYunoC/Bi6X+QUmuZ/ci/sFwITF7yyutep7vnIQx3sj2hl6PVTYLcFJSaFgrjpP
	QS/SPKj6GgJBssxyzk48xCc2e70yDCk8k/JhsP4TYyVLZLzAKqfIcuaPi2anOKIdFbHD8kz9EBotA
	RNcBozv+WnPJwp7yiff0MSV2a5aJROi8F1N9rCgKNta92jBQ8Ux3ph0C5tbzpGn3dyzI1gSg9XsOC
	W7Hg4H9g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oJVEk-0044Ux-VI; Thu, 04 Aug 2022 07:25:42 +0000
Received: from mail-lj1-x22f.google.com ([2a00:1450:4864:20::22f])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oJVEi-0044SU-ME
	for linux-mediatek@lists.infradead.org; Thu, 04 Aug 2022 07:25:42 +0000
Received: by mail-lj1-x22f.google.com with SMTP id x25so875264ljm.5
        for <linux-mediatek@lists.infradead.org>; Thu, 04 Aug 2022 00:25:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=tnOwkKfhBzXFppIxRkEPpyNln0liXtEqX58YRBpJcr8=;
        b=KaBX5C27LU2/hiVV41fSRkEObVVMYRvfYHSIbaXVoHOpgKYVOS4QKSU78WR0R5+b9a
         OF+nzgrQ97gospGyxLfTDJvji0fJzMtG6v4s0CH5S0dGTdF4c3VSDpo87ozuZDrlXGfz
         hFrmYFfZti4EdlIVJ+ij29gERCwU0TCakfaI/YHBdE6kYhTw8npkUQEKxbQDKaJeEx95
         bJpHQLNv9DmZlIrF7IrpiHo0n/gntGbQRSL8spUyRFeDqhZm8czbKSHvH0Hr658EMLX+
         dkaJNTlUaQ+wg7SgajA3tBtf5O+v82Xjx9mcAtSZXmxRtH7D7I20Q63MYjC0Lw0TfrxF
         KNGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=tnOwkKfhBzXFppIxRkEPpyNln0liXtEqX58YRBpJcr8=;
        b=7R3cPTu1ewpzJfthc0YsCebOrVQ0JJ9HY2us+bJG8QAxNci6Y+i0dy5InL7u/yCWdi
         jdfB9pmFE+ZDLZTj5EWs+8soMM1hR5skdZooCbBfMBuA5pQXygHZB9ynckYg02fgK4Uc
         Ns9zeGlHGkM4U3xGXwecOIPgaZBTGvqCkUALn8Iq+KGw3Bzz6Kc4t7U1bn663TUhoyIO
         IeI4QP2wUO8Kh6nNDvxHDnxKDR5pq4h7DTXSiGRh1moG/xynd/rNZNTsM9og1GurnQ40
         HPBPwM3W5JKEE55lvY3sObNz/RYpbFG8wTNL+lF0iCFsXkptJ7A9O8ff6Ui9P27H+uSV
         /dJQ==
X-Gm-Message-State: ACgBeo0c5wQaX9ZESnUQWKD+hwyyMY9NgyqVeSRxTONH/RIKqSvwof6+
	bJ0HfVNhzxi29QiCsmcNkLG3xQ==
X-Google-Smtp-Source: AA6agR76ryk0wDxrVOrzMuTszxXgfwzTdW7WwyPRIhNvuxMuIMxK8DVdk/uToJEoH+F0vEOAkYdCdw==
X-Received: by 2002:a2e:9e43:0:b0:25d:d8e9:7b15 with SMTP id g3-20020a2e9e43000000b0025dd8e97b15mr163697ljk.234.1659597935350;
        Thu, 04 Aug 2022 00:25:35 -0700 (PDT)
Received: from [192.168.1.6] ([77.222.167.48])
        by smtp.gmail.com with ESMTPSA id bi36-20020a05651c232400b0025e5ff004a0sm17514ljb.100.2022.08.04.00.25.31
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 04 Aug 2022 00:25:34 -0700 (PDT)
Message-ID: <1d6b475b-412d-da94-8505-0fd6f8f6a2c9@linaro.org>
Date: Thu, 4 Aug 2022 09:25:30 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.12.0
Subject: Re: [PATCH v2] pmic: add mt6366 regulator document
Content-Language: en-US
To: Rex-BC Chen <rex-bc.chen@mediatek.com>,
 =?UTF-8?B?WmhpeW9uZyBUYW8gKOmZtuW/l+WLhyk=?= <Zhiyong.Tao@mediatek.com>,
 "lee.jones@linaro.org" <lee.jones@linaro.org>,
 "robh+dt@kernel.org" <robh+dt@kernel.org>,
 "matthias.bgg@gmail.com" <matthias.bgg@gmail.com>,
 "lgirdwood@gmail.com" <lgirdwood@gmail.com>,
 "broonie@kernel.org" <broonie@kernel.org>,
 =?UTF-8?B?RWRkaWUgSHVhbmcgKOm7g+aZuuWCkSk=?= <eddie.huang@mediatek.com>,
 "a.zummo@towertech.it" <a.zummo@towertech.it>,
 "alexandre.belloni@bootlin.com" <alexandre.belloni@bootlin.com>,
 "fshao@chromium.org" <fshao@chromium.org>
Cc: =?UTF-8?B?U2VuIENodSAo5YKo5qOuKQ==?= <Sen.Chu@mediatek.com>,
 =?UTF-8?B?SHVpIExpdSAo5YiY6L6JKQ==?= <Hui.Liu@mediatek.com>,
 =?UTF-8?B?QWxsZW4tS0ggQ2hlbmcgKOeoi+WGoOWLsyk=?=
 <Allen-KH.Cheng@mediatek.com>,
 =?UTF-8?B?SHNpbi1Ic2l1bmcgV2FuZyAo546L5L+h6ZuEKQ==?=
 <Hsin-Hsiung.Wang@mediatek.com>, Sean Wang <Sean.Wang@mediatek.com>,
 =?UTF-8?B?TWFjcGF1bCBMaW4gKOael+aZuuaWjCk=?= <Macpaul.Lin@mediatek.com>,
 =?UTF-8?B?V2VuIFN1ICjomIflhqDmlocp?= <Wen.Su@mediatek.com>,
 "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "linux-rtc@vger.kernel.org" <linux-rtc@vger.kernel.org>,
 Project_Global_Chrome_Upstream_Group
 <Project_Global_Chrome_Upstream_Group@mediatek.com>,
 "linux-arm-kernel@lists.infradead.org"
 <linux-arm-kernel@lists.infradead.org>,
 "linux-mediatek@lists.infradead.org" <linux-mediatek@lists.infradead.org>,
 zhiyong tao <zhiyong.tao@mediatk.com>
References: <20220728062749.18701-1-zhiyong.tao@mediatek.com>
 <20220728062749.18701-2-zhiyong.tao@mediatek.com>
 <03a13ed4-e7cd-6f7d-f8f7-9b1e6193e202@linaro.org>
 <3d97d4c46467909739b8b69662412fe162dbe613.camel@mediatek.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <3d97d4c46467909739b8b69662412fe162dbe613.camel@mediatek.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220804_002540_850227_E422C96D 
X-CRM114-Status: GOOD (  19.58  )
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

On 03/08/2022 11:50, Rex-BC Chen wrote:
> On Thu, 2022-07-28 at 18:46 +0800, Krzysztof Kozlowski wrote:
>> On 28/07/2022 08:27, Zhiyong Tao wrote:
>>> From: zhiyong tao <zhiyong.tao@mediatek.com>
>>>
>>> Add mt6366 regulator document
>>
>> As usual with Mediatek your emails fail to properly pass modern SMTP
>> checks and you end up in spam.
>>
>> I reported it months ago to folks in Mediatek. No improvements since
>> that time.
>>
>> I stopped checking my spam folder for Mediatek stuff and all will be
>> ignored. I will also stop complaining about it - just ignore
>> Mediatek.
>>
>> Fix your systems, instead of putting additional effort on community
>> and
>> on reviewers.
>>
> 
> Hello Krzysztof,
> 
> I am Rex from MediaTek chrome project team.
> We noticed your complain of our upstream mail.
> 
> First of all, sorry for the inconvenience.
> We really want to fix this SPAM issue.
> 
> From our side, we can make sure mails for kernel upstream from MediaTek
> is clear and these mails pass the verification of DMARC/DKIM/SPF.
> Therefore, to identify the root cause, could you please provide us some
> mails that seen as SPAM from MediaTek?
> It's more useful if you can use the form of attachment. In that case,
> we can analyze whole mails including mail headers.
> 
> We really appreciate your big support, and we hope we can fix this
> issue to reduce the inconvenience for reviewing series from MediaTek.
> If you can spare some time to help us for this, it would very helpful!!
> 
> Our IT also adjust the DKIM setting today. If the situation of this
> issue it much better, please also let us know.
> 

Hi,

Since few days there were no @mediatek.com emails in my spam folder,
either because nothing was sent to me, or they passed spam filters.

If this is the result of some changes, then it seems working. Thank you.

I'll let you now when I find something new in the spam.

Best regards,
Krzysztof

