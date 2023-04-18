Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DBBAEC6FD18
	for <linux-mediatek@archiver.kernel.org>; Tue, 18 Apr 2023 12:25:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Ev5WXTYPPIhAR/I8OdIpkj/pJQ+EM34lzeYbEC9ASSY=; b=kglRfiOmBM4r8nWiME1YsbKkDE
	5uZ6LMN8R6KyIZ+WulMYQ0AKVJH7ZbW0/1QQqlgtl33QFS7gU5zUZuEpGkRqD/3/EjkcoSZpu+oEW
	kKiWWMO1cYEJ9KDCG6Xe5XcMfM3g91J2pdP8ovrLZPZx0UNnHJyUCOTmLHPwhh5lUpcX5ABFz/Eml
	Db+CtBO+n5NlWVG+GNrDtJzc/AkJILmKXP571ljdLJVc2Q948kdunv/exNf4bUK9HdpXCXm9QfV8x
	NRcHOw+Cq7RSjx82LbJ4+Xot7mCnCOAeS6v49j+Q0uxEF+m0Nsj9k/WRAIZsdyCWy0s7sP20KevL5
	hwkJgR/Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pokOb-0027Mx-2y;
	Tue, 18 Apr 2023 12:25:17 +0000
Received: from mail-ej1-x62e.google.com ([2a00:1450:4864:20::62e])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pokOY-0027LJ-2y
	for linux-mediatek@lists.infradead.org;
	Tue, 18 Apr 2023 12:25:16 +0000
Received: by mail-ej1-x62e.google.com with SMTP id fy21so29681558ejb.9
        for <linux-mediatek@lists.infradead.org>; Tue, 18 Apr 2023 05:25:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1681820713; x=1684412713;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Ev5WXTYPPIhAR/I8OdIpkj/pJQ+EM34lzeYbEC9ASSY=;
        b=dt8agR7ooelnrNDzOe7AF25AFlJM3MwAKrXaOdy4Ey9KJNUCXogUfbKpjMSPn1pcuB
         5Uv9nZRzQhygdFKEXC+jXG3NFBKjc2yT2CykBzR29oCJqOgy5TAnvSkbn1gZnp++AccP
         RI+5h1MwMjofbgIAdFtw38DAZ3rbO/ybPgyPEVsxAkMaATLt99maVNUTfaztdMnbM0EG
         MVJIdFT28y1VdNXKVrokaGOwzGTHFVpa713Mw6xLcH91X6YP6gs/8kOotNPZsz7JNCDC
         aupQp44QwVMxGwT/Sru0q4r6T+3UO8eC8I0RfM3bYb4UhcMH/04LPUo4r0JkjLPOT5PN
         NRoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1681820713; x=1684412713;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Ev5WXTYPPIhAR/I8OdIpkj/pJQ+EM34lzeYbEC9ASSY=;
        b=Qj2FSYuFxF4lFwDYM4mlwhZ0CfoWjxhMUBXXWq6z7fIsGJZvlUN9K3EgL9qSqMr0Xn
         PxkPcNMJ/+KPsH9ddL3y/x5wAVlvEnUXRSKNtZKbIfm0VwJTKN3d67/9c1/ir57Tjljf
         JQbKn1/RaiWBBIj63dIIJXsPDpJ7sAjuyNyN1EpAEdjPUHYFhgZjsFyzMHok/MMid/Ar
         XYKEDbHmi0YksvXfm2jqQQpuI+d3WE+MaODCNPDiVVG7HtMWbgo7PNIpozY3K2/i9dTD
         27xxK9LvNHOAS6rXzSJFPZg89IFX2OsrN2TvgrlOOzCECoK2RwxOyOuzkgHz2eHooya5
         HiPQ==
X-Gm-Message-State: AAQBX9f28lxfAeWhjoQfDMaJxiM5OboUhgCgBUkSnxeLhRrohk+F+SNY
	NeON5aZdHjcwkgKVRtymLjx8rw==
X-Google-Smtp-Source: AKy350Z4tmX0U06wZCE6q5FdRMkDP7l+18lb+7cM4mckgyRf2TzhX9qVRGvgKAwF8u1OYfdAGS6qVg==
X-Received: by 2002:a17:906:ae56:b0:932:1af9:7386 with SMTP id lf22-20020a170906ae5600b009321af97386mr10454741ejb.27.1681820713510;
        Tue, 18 Apr 2023 05:25:13 -0700 (PDT)
Received: from ?IPV6:2a02:810d:15c0:828:a276:7d35:5226:1c77? ([2a02:810d:15c0:828:a276:7d35:5226:1c77])
        by smtp.gmail.com with ESMTPSA id oz8-20020a1709077d8800b009532427b35asm577349ejc.7.2023.04.18.05.25.12
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 18 Apr 2023 05:25:13 -0700 (PDT)
Message-ID: <47f27da1-8ed1-327e-74d7-ad4e3f12e3d6@linaro.org>
Date: Tue, 18 Apr 2023 14:25:11 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: [PATCH 7/7] ASoC: dt-bindings: mediatek,mt8188-afe: add audio
 properties
Content-Language: en-US
To: =?UTF-8?B?VHJldm9yIFd1ICjlkLPmlofoia8p?= <Trevor.Wu@mediatek.com>,
 "robh+dt@kernel.org" <robh+dt@kernel.org>,
 "broonie@kernel.org" <broonie@kernel.org>, "tiwai@suse.com"
 <tiwai@suse.com>, "lgirdwood@gmail.com" <lgirdwood@gmail.com>,
 "krzysztof.kozlowski+dt@linaro.org" <krzysztof.kozlowski+dt@linaro.org>,
 "matthias.bgg@gmail.com" <matthias.bgg@gmail.com>,
 "perex@perex.cz" <perex@perex.cz>,
 "angelogioacchino.delregno@collabora.com"
 <angelogioacchino.delregno@collabora.com>
Cc: "linux-arm-kernel@lists.infradead.org"
 <linux-arm-kernel@lists.infradead.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "linux-mediatek@lists.infradead.org" <linux-mediatek@lists.infradead.org>,
 "alsa-devel@alsa-project.org" <alsa-devel@alsa-project.org>,
 "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>
References: <20230413104713.7174-1-trevor.wu@mediatek.com>
 <20230413104713.7174-8-trevor.wu@mediatek.com>
 <310e8979-de96-dda8-6c95-0e6033d8b403@linaro.org>
 <b9daeea6d823b8e84db0ca0df0e04d3716a6b944.camel@mediatek.com>
 <382bc15e-f4e3-3a9f-9dbc-4d46ac1d76d6@collabora.com>
 <3fe703c1279bf4d25a890b63c23a4bc97abd4198.camel@mediatek.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <3fe703c1279bf4d25a890b63c23a4bc97abd4198.camel@mediatek.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230418_052514_965551_4573F8DD 
X-CRM114-Status: GOOD (  19.06  )
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

On 18/04/2023 12:23, Trevor Wu (吳文良) wrote:
>> Actually, doing that is borderline-ok... there's no devicetree for
>> MT8188
>> upstream, so that's not breaking anything at all.
>> In any case, I agree that you should generally avoid doing that but I
>> think
>> that in this specific case it's fine; I'm not a devicetree maintainer
>> though.
>>
>> P.S.: Trevor, next time please make reviewers aware of the fact that
>> no 8188
>>        devicetree is present upstream!
>>
> Got it. Thanks.
> 
> 
> Hi krzysztof,
> 
> Because there is no upstream mt8188 DTS, should I move the new clock to
> the end of clock list?

What is the reason to add them in the middle? So far there was no
argument, so always add at the end. If you have an argument, let's
discuss it.

> 
> If I move "apll1_d4" to the end of the list at binding file, when I
> upstream the devicetree node existing clocks and clock-names properties
> , should I follow the sequence defined in dt-bindings

If you do not follow the sequence of bindings, you upstream incorrect
DTS which does not follow ABI and fails the tests. Therefore yes, use
the same order as your bindings define.

> or can I have a
> new sequence based on the clock type or alphabet?

Sorry, I don't know what is the order of clock type and alphabet. If you
mean anything else than bindings, then no, because how is it supposed to
work then?

Best regards,
Krzysztof


