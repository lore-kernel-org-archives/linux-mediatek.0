Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6FF6CC433FE
	for <linux-mediatek@archiver.kernel.org>; Tue, 17 May 2022 07:48:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=W2q4moIdBTwS56ns5Siv+Z/Fi/DHllXuw6Hq0VtRVR4=; b=KcFAPLTDY7a1En
	MmWRIe9qB4JGH7dcrZ46kWz+EVbdS8JlBBbjuYI794je32cgxMYaQ/QoGAiGm9fFB115vLPERWJ0l
	Fo91ozvYAY8zIEBX3Q39liJV8tiCHKhP9JeTPO5RgiBIUW+54qyBXvqpO9kazwcH70q3ydM0eGzdN
	Z83Cp4ISTgKTzPQS63i0491A4nl+5fL86265IOOfMZmat0l98RQuX9RjN0iG1eOffubdzucUG4Jc5
	4P9xS7v7568ZKBG7CbyBSa9pwHZFJMqaUewEBaTzAd3KF+M1UKD8IO9wNYtzB2mxLJDmPLu3bBkHb
	iRamYT6aeM3kfKQ9X2QA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nqrwf-00CFtz-RU; Tue, 17 May 2022 07:48:41 +0000
Received: from bhuna.collabora.co.uk ([46.235.227.227])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nqrwU-00CFr0-KQ; Tue, 17 May 2022 07:48:32 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (Authenticated sender: kholk11) with ESMTPSA id 8ADA31F441AA
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1652773709;
 bh=ExwtYhF6lW41/VV+VosOgNIh/aIBIehqgDlrAU2wlqI=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=llZKudObnwhLoG7831KnTVNHUlFkO6VQxYU9MnYi/2Tjfen3kZxHbcg1jUNBXi4pj
 ZvSVeei11j1tJRXPCE+7+OiaXsX6oJltMp9hOe7+IdhXSq5wEMNyqXZ9n27mUGVdt/
 bc9qtEwgeUDzl25M0osEVwNOPGNMWKqCHgLq8bWLrXHAArODExKHdDGEfqSrj2ww49
 8+6KF54m8/pVVdmMj6qrGSQ4vr9r3bMqUYe9AKeM+knvnoVz2hKlmDY4/Fd3TRIZR4
 t3wfLguv3KsdglOl37QL0PxAZLh5OTajsNe9q61Zr4mxkF4SceWzvo6ZZNjt6bywSm
 c2GwOyoe+yIWg==
Message-ID: <b3e34db8-4e79-f6e3-35b8-e32891f2c85b@collabora.com>
Date: Tue, 17 May 2022 09:48:25 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.0
Subject: Re: [PATCH 4/5] dt-bindings: arm: mediatek: Add clock driver bindings
 for MT6795
Content-Language: en-US
To: Rob Herring <robh@kernel.org>
Cc: krzysztof.kozlowski+dt@linaro.org, matthias.bgg@gmail.com,
 mturquette@baylibre.com, sboyd@kernel.org, p.zabel@pengutronix.de,
 y.oudjana@protonmail.com, jason-jh.lin@mediatek.com, ck.hu@mediatek.com,
 fparent@baylibre.com, rex-bc.chen@mediatek.com, tinghan.shen@mediatek.com,
 chun-jie.chen@mediatek.com, weiyi.lu@mediatek.com, ikjn@chromium.org,
 miles.chen@mediatek.com, sam.shih@mediatek.com, wenst@chromium.org,
 bgolaszewski@baylibre.com, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, linux-clk@vger.kernel.org,
 konrad.dybcio@somainline.org, marijn.suijten@somainline.org,
 martin.botka@somainline.org, ~postmarketos/upstreaming@lists.sr.ht,
 phone-devel@vger.kernel.org, paul.bouchara@somainline.org,
 kernel@collabora.com
References: <20220513165050.500831-1-angelogioacchino.delregno@collabora.com>
 <20220513165050.500831-5-angelogioacchino.delregno@collabora.com>
 <20220516172819.GA2938099-robh@kernel.org>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <20220516172819.GA2938099-robh@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220517_004830_849837_05BC45CD 
X-CRM114-Status: GOOD (  18.29  )
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

Il 16/05/22 19:28, Rob Herring ha scritto:
> On Fri, May 13, 2022 at 06:50:49PM +0200, AngeloGioacchino Del Regno wrote:
>> Add the bindings for the clock drivers of the MediaTek Helio X10
>> MT6795 SoC.
>>
>> Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
>> ---
>>   .../arm/mediatek/mediatek,mt6795-clock.yaml   | 67 +++++++++++++++++
>>   .../mediatek/mediatek,mt6795-sys-clock.yaml   | 73 +++++++++++++++++++
>>   2 files changed, 140 insertions(+)
>>   create mode 100644 Documentation/devicetree/bindings/arm/mediatek/mediatek,mt6795-clock.yaml
>>   create mode 100644 Documentation/devicetree/bindings/arm/mediatek/mediatek,mt6795-sys-clock.yaml
>>
>> diff --git a/Documentation/devicetree/bindings/arm/mediatek/mediatek,mt6795-clock.yaml b/Documentation/devicetree/bindings/arm/mediatek/mediatek,mt6795-clock.yaml
>> new file mode 100644
>> index 000000000000..b7d96d0ed867
>> --- /dev/null
>> +++ b/Documentation/devicetree/bindings/arm/mediatek/mediatek,mt6795-clock.yaml
>> @@ -0,0 +1,67 @@
>> +# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
>> +%YAML 1.2
>> +---
>> +$id: "http://devicetree.org/schemas/arm/mediatek/mediatek,mt6795-clock.yaml#"
>> +$schema: "http://devicetree.org/meta-schemas/core.yaml#"
>> +
>> +title: MediaTek Functional Clock Controller for MT6795
>> +
>> +maintainers:
>> +  - AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
>> +  - Chun-Jie Chen <chun-jie.chen@mediatek.com>
>> +
>> +description: |
>> +  The clock architecture in MediaTek like below
>> +  PLLs -->
>> +          dividers -->
>> +                      muxes
>> +                           -->
>> +                              clock gate
>> +
>> +  The devices provide clock gate control in different IP blocks.
>> +
>> +properties:
>> +  compatible:
>> +    items:
> 
> Don't need 'items' if only 1 item.
> 
>> +      - enum:
>> +          - mediatek,mt6795-mfgcfg
>> +          - mediatek,mt6795-vdecsys
>> +          - mediatek,mt6795-vencsys
> 
> blank line.
> 
>> +  reg:
>> +    maxItems: 1
>> +
>> +  '#clock-cells':
>> +    const: 1
>> +
>> +required:
>> +  - compatible
>> +  - reg
> 
> Why is #clock-cells optional?
> 

I've used one of the other mediatek,mt(something)-(sys-)clock.yaml as a base
for these ones, giving for granted that they were correct, but now that you're
pointing that out... effectively, I should've checked if the ones that are
already merged in were correct *before* using these as a base for mine.

Thanks for your review: I'll send a v2 soon... and I will also separately
send some fixes for the existing ones, as your review comments also apply
to these ones.

Regards,
Angelo


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
