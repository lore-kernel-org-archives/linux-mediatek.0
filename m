Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 60E23C433F5
	for <linux-mediatek@archiver.kernel.org>; Sat,  2 Apr 2022 11:31:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=CM/D1qCFYr+BclECU5DtRgaCjwqqjN15yN22UK4QSVY=; b=nlL7ozL4F0/e3b
	KlGUrm9p9DFnbK3xUwhjD2cqXs+80nqkRCELl304z9VfJ+bKq7OH4x4zEucnnDjBSeGYD5lK+FtFv
	PTFh9vQ48jl6lHpt+VrcnCs1nVDYnLqwlL7vbrEuJ7ooC3nAnqaKpgZg0WKSJ+F0rVsEkwRB5Qiu4
	oFWXwOZg2nHYiO+6JpcGF6I9PAEelhwOr+9CDQ9aWoTG7bY1ZKi1cm3Wg7/vHZCpGCJa+QQsLMH+6
	O4rNonzQaonhzxrw2gybVJHS1QVGRwYlHS+HivxpmtPKiYsjYWP3CyQDaYeKbcy94pfAxtQUbweHK
	VeB9MXpp3GxIR868v/PQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nabys-008bmC-BH; Sat, 02 Apr 2022 11:31:46 +0000
Received: from ams.source.kernel.org ([145.40.68.75])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nabyh-008bj5-Bb; Sat, 02 Apr 2022 11:31:36 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 570CFB8072F;
 Sat,  2 Apr 2022 11:31:33 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 22C65C340EC;
 Sat,  2 Apr 2022 11:31:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1648899092;
 bh=hHiaN9oQ8ExvCLuAqHVX8GhGvr0JDcc8KoNUT7YzQeQ=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=XKuIRDL43MpBpxr/RptIaKZKJR6EGeGWNkYtaNMCtIGwGXVqzA5i57XwxM54tVZ2N
 SjEfIUs8wDBMf81/FJiWI633TR1Bqh5IbwxY44eD1obDH5wSpDPvoGug1iLEbJ9zl9
 dF1SrQrFYf4IhpClRUs2MejERVXmb/nr9GW+YaBI2kfjIx6xNg5XE/DEuHkTwCKDZb
 O2itFS38dngcTS/XWun70RifGDQFMBuryMyU/DyVxwpJ040NeR7+L9eAfaXo8lFnrU
 4E+xDrArOnbh4T5cLQkNUSgcuoNZyvBWF1OM+aRt90V9CuznkyCNGqjf2JwyKD3IEg
 jiimG0s8JPYjw==
Message-ID: <ac0e3336-f9eb-def9-68ea-ab49e2c467a1@kernel.org>
Date: Sat, 2 Apr 2022 13:31:22 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [PATCH 1/3] dt-bindings: devfreq: mediatek: add mtk cci devfreq
 dt-bindings
Content-Language: en-US
To: Jia-Wei Chang <jia-wei.chang@mediatek.com>,
 MyungJoo Ham <myungjoo.ham@samsung.com>,
 Kyungmin Park <kyungmin.park@samsung.com>,
 Chanwoo Choi <cw00.choi@samsung.com>, Rob Herring <robh+dt@kernel.org>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>
Cc: linux-pm@vger.kernel.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 linux-kernel@vger.kernel.org, fan.chen@mediatek.com, louis.yu@mediatek.com,
 roger.lu@mediatek.com, Allen-yy.Lin@mediatek.com,
 Project_Global_Chrome_Upstream_Group@mediatek.com, hsinyi@google.com,
 Jia-Wei Chang <jia-wei.chang@mediatek.corp-partner.google.com>
References: <20220307122513.11822-1-jia-wei.chang@mediatek.com>
 <20220307122513.11822-2-jia-wei.chang@mediatek.com>
 <bf418e08-2e32-5e61-abd8-abb0d8f5c080@canonical.com>
 <13482b1b4244df5c0c0a4d6a60cdb2a7ba88500a.camel@mediatek.com>
 <aa34eccf-ef08-4a8f-7a6c-7fbd05bd54b6@kernel.org>
 <126e0905c2eb9f22a0be46dd7aa8ac891622346d.camel@mediatek.com>
From: Krzysztof Kozlowski <krzk@kernel.org>
In-Reply-To: <126e0905c2eb9f22a0be46dd7aa8ac891622346d.camel@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220402_043135_596978_A9316190 
X-CRM114-Status: GOOD (  15.96  )
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

On 01/04/2022 15:39, Jia-Wei Chang wrote:
>>>>
>>>>> +
>>>>> +  operating-points-v2:
>>>>> +    description:
>>>>> +      For details, please refer to
>>>>> +      Documentation/devicetree/bindings/opp/opp-v2.yaml
>>>>> +
>>>>> +  opp-table: true
>>>>
>>>> Same comments as your CPU freq bindings apply.
>>>
>>> mtk-cci-devfreq is a new driver and its arch is same as mediatek-
>>> cpufreq so that the properties of mtk-cci are refer to mediatek-
>>> cpufreq 
>>> bindings.
>>> operating-point-v2 is used to determine the voltage and frequency
>>> of
>>> dvfs which is further utilized by mtk-cci-devfreq.
>>
>> "operating-point-v2" is understood, but the same as in cpufreq
>> bindings,
>> I am questioning why do you have "opp-table: true". It's a bit
>> confusing, so maybe I miss something?
> 
> Yes, you're correct.
> "opp-table: true" should be removed.
> I messed it up.

No, I think I was wrong. The opp-table pretty frequently is embedded in
the the device node itself. The operating-points-v2 references it.

You don't use it in the example, but it might be a valid usage, so it
can stay. Sorry for the confusion, it passed some time since I looked at
OPP bindings.


Best regards,
Krzysztof

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
