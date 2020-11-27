Return-Path: <SRS0=3jAl=FB=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.2 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,
	NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 130A4C63798
	for <linux-mediatek@archiver.kernel.org>; Fri, 27 Nov 2020 13:45:50 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 97D672224B
	for <linux-mediatek@archiver.kernel.org>; Fri, 27 Nov 2020 13:45:49 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="xRnLXrVG";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="GA7fGSjs"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 97D672224B
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Type:
	Content-Transfer-Encoding:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=ifk3XJmgNd5QTJd5vOAWtfZpKrugJp73jnO9AVpxbT8=; b=xRnLXrVGxM7B8IA5vP/F9Lw11
	NucLScgzsYLQO/fKPfUTf4vFqesmfWIPMUSFv/JZyiPTev0GsnNlhjERwZLDhPQAx4TJGrS08eN62
	vHDg8p92Q7fi1sbpLDvWU0hJL2xYsky0+Fk5bhfhUCYtrl5qARt4OhJLpzfmri19ca6CHTQmQNNMV
	RfcOz8bF9JpXUv/FZXCD5jPjuQ6/vKL59TPzmoqhU0bM6U1okB408RU35XTQZpvdRgvQ5VW7oHGvm
	XjuF302w56a0QQn4EKONYe5+nmNkqFL+npRX60WVR6KRo4pi+wwHRj2/gw1y1bXzXU6oZR0ZKqNbJ
	pItVU44cQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kie4H-0006xq-Dd; Fri, 27 Nov 2020 13:45:45 +0000
Received: from mail-wr1-x444.google.com ([2a00:1450:4864:20::444])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kid5A-0004UM-OO; Fri, 27 Nov 2020 12:42:47 +0000
Received: by mail-wr1-x444.google.com with SMTP id 64so5423700wra.11;
 Fri, 27 Nov 2020 04:42:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=V+UYY93bQCO8HGvd/dOd/Rhtb0qsy0CmlK8sEYhElKA=;
 b=GA7fGSjs3q6PrvswwEX9lGKUTiREVTe9Yob+iavzXSR3VV4fxkwC9WDdbzG66uqDRu
 xV6AuGIOcIwOg8jYnj5QxOkncmsnxfCMenoYtVL+fKxDeLfPt+Mm5FnknXfNAF81ipi1
 /AYi415kQ9YupGtZYCymGwtDYtgfOcCLtSdSEjQzKuPyewgDdxcUl6mugZnZrEJT6A7L
 lxqnE+D3cPfOBRrPh+ik/CUZYkEeNvrSfpSPDmfo97txrh9isM3zJNrkhgm3NQJsnl9o
 ZgYzIFjNbNINeW5ZhWqBE5qgGelIUm/hTyAN3u/i7J5F7n8OhsrjLgNK0KUt3JAxLSk+
 f93w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=V+UYY93bQCO8HGvd/dOd/Rhtb0qsy0CmlK8sEYhElKA=;
 b=faaz1Z8FjQETvawhaY3+b4mf2yz10A6rU4E/VF/C21ODR2axOdGnltZLMsn7V6Tnuu
 vnEAe1mNMxgjrno5ex+fCpwQGF+D+O5HjKERzRxMGVpN3lvGO6Z+am6ptiR8RSUM0fZ5
 X9rUQnFJLX6rKz48RL90qEglUyzWTCgOY5ePSX7HjMID1rL1Mm8/d7wRsZs1GAtBfrYB
 mte7g0J/VoLlECBwgsOVq2jLYbsUT9BZfjQ0SW1DGEqXWYKfWjFNqiDNqGtGPFoy04jk
 P02pCLsa+DGU96xZq49mA3bY9jm73/dz2Ra1quN6Rzg8XrNHCK7iGVgGcO3SGMrA6wqq
 aleQ==
X-Gm-Message-State: AOAM533rbt/yUh3X8MXVicQCXgm48L13OrUfF18amSLC/GT8HIc9ylJ7
 Xt8gevmom6yHS7HNJ9MG1Sk=
X-Google-Smtp-Source: ABdhPJxYnDUaWz2GemI+sa/5eWMlJkVIio89EdsiU4JRnbiE02Bpz4xHERnzKBCs2dycUYuHqPQcSQ==
X-Received: by 2002:a5d:4a07:: with SMTP id m7mr10130310wrq.316.1606480955830; 
 Fri, 27 Nov 2020 04:42:35 -0800 (PST)
Received: from ziggy.stardust ([213.195.126.134])
 by smtp.gmail.com with ESMTPSA id o134sm1707856wme.6.2020.11.27.04.42.34
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 27 Nov 2020 04:42:35 -0800 (PST)
Subject: Re: [PATCH v3] arm64: dts: mediatek: Add mt8192 power domains
 controller
To: Enric Balletbo Serra <eballetbo@gmail.com>,
 Weiyi Lu <weiyi.lu@mediatek.com>
References: <1605782884-19741-1-git-send-email-weiyi.lu@mediatek.com>
 <CAFqH_522NuGY9c-_XWhHxoa3QkrdoM92qTOLxgM8PpOU=-ttbw@mail.gmail.com>
 <1605791419.19819.4.camel@mtksdaap41>
 <CAFqH_51m5Pg9ny4HWt1iwf8wtsGSdShpDCVaGwac=v9BBDj2vg@mail.gmail.com>
From: Matthias Brugger <matthias.bgg@gmail.com>
Message-ID: <1f25cc3f-324a-0020-7bf2-e5a915291522@gmail.com>
Date: Fri, 27 Nov 2020 13:42:33 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.5.0
MIME-Version: 1.0
In-Reply-To: <CAFqH_51m5Pg9ny4HWt1iwf8wtsGSdShpDCVaGwac=v9BBDj2vg@mail.gmail.com>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201127_074236_921236_031D5E96 
X-CRM114-Status: GOOD (  17.95  )
X-BeenThere: linux-mediatek@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-mediatek.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mediatek>, 
 <mailto:linux-mediatek-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mediatek/>
List-Post: <mailto:linux-mediatek@lists.infradead.org>
List-Help: <mailto:linux-mediatek-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mediatek>, 
 <mailto:linux-mediatek-request@lists.infradead.org?subject=subscribe>
Cc: Rob Herring <robh@kernel.org>, Nicolas Boichat <drinkcat@chromium.org>,
 srv_heupstream <srv_heupstream@mediatek.com>,
 "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 linux-kernel <linux-kernel@vger.kernel.org>,
 "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org



On 19/11/2020 15:13, Enric Balletbo Serra wrote:
> Hi Weiyi,
> 
> Missatge de Weiyi Lu <weiyi.lu@mediatek.com> del dia dj., 19 de nov.
> 2020 a les 14:10:
>>
>> On Thu, 2020-11-19 at 13:13 +0100, Enric Balletbo Serra wrote:
>>> Hi Weiyi,
>>>
>>> Thank you for the patch
>>>
>>> Missatge de Weiyi Lu <weiyi.lu@mediatek.com> del dia dj., 19 de nov.
>>> 2020 a les 11:48:
>>>>
>>>> Add power domains controller node for SoC mt8192
>>>>
>>>> Signed-off-by: Weiyi Lu <weiyi.lu@mediatek.com>
>>>> ---
[...]
>>>> +                       /* System Power Manager */
>>>> +                       spm: power-controller {
>>>> +                               compatible = "mediatek,mt8192-power-controller";
>>>> +                               #address-cells = <1>;
>>>> +                               #size-cells = <0>;
>>>> +                               #power-domain-cells = <1>;
>>>> +
>>>> +                               /* power domain of the SoC */
>>>> +                               audio@MT8192_POWER_DOMAIN_AUDIO {
>>>
>>> If you run the dt_bindings_check it should return some errors, as all
>>> these node names should be 'power-domain@'. Which is a bit annoying
>>> because then you will get a bunch of errors like this:
>>>
>>> [    1.969110] debugfs: Directory 'power-domain' with parent
>>> 'pm_genpd' already present!
>>> [    1.976997] debugfs: Directory 'power-domain' with parent
>>> 'pm_genpd' already present!
>>> [    1.984828] debugfs: Directory 'power-domain' with parent
>>> 'pm_genpd' already present!
>>> [    1.992657] debugfs: Directory 'power-domain' with parent
>>> 'pm_genpd' already present!
>>> [    2.000685] debugfs: Directory 'power-domain' with parent
>>> 'pm_genpd' already present!
>>> [    2.008566] debugfs: Directory 'power-domain' with parent
>>> 'pm_genpd' already present!
>>> [    2.016395] debugfs: Directory 'power-domain' with parent
>>> 'pm_genpd' already present!
>>> [    2.024221] debugfs: Directory 'power-domain' with parent
>>> 'pm_genpd' already present!
>>> [    2.032049] debugfs: Directory 'power-domain' with parent
>>> 'pm_genpd' already present!
>>> [    2.039874] debugfs: Directory 'power-domain' with parent
>>> 'pm_genpd' already present!
>>> [    2.047699] debugfs: Directory 'power-domain' with parent
>>> 'pm_genpd' already present!
>>> [    2.055524] debugfs: Directory 'power-domain' with parent
>>> 'pm_genpd' already present!
>>> [    2.063352] debugfs: Directory 'power-domain' with parent
>>> 'pm_genpd' already present!
>>> [    2.071176] debugfs: Directory 'power-domain' with parent
>>> 'pm_genpd' already present!
>>>
>>> But that's another problem that should be handled in debugfs system.
>>>
>>
>> Indeed...so I chose to use different name in dts to avoid problems in
>> debugfs. It does violate the naming rules.
>>
> 
> But your binding will not pass (or trigger warnings) the dtb check
> then. Rob was clear that names should be generic. Proper fix is fix
> debugfs not the binding.
> 

By the way, is anybody working on this debugfs issue?

Regards,
Matthias

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
