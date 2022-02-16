Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 627E4C433F5
	for <linux-mediatek@archiver.kernel.org>; Wed, 16 Feb 2022 10:19:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=AslzQ/c/r/Ghdu/kUFy0POuwlRPvP89J2vHFLM6TJzU=; b=t1SAAET1FWkQZQ
	Wv7ki9lduvHWy+ggMqnXtP4FeZwpHcy/uPr1NJR4S03VAHRDykLNFmGaH7Bh02m/Z3ziJVl9w9SZh
	9RLWWO2ev/PLqqu7QOaQEkTaVeHDX7HzQCJmMWVsTEYabw1mJ5uBiN71Z6f6CShcQaMdDCBK31crW
	DPQfwSK9mXd9nCBnkHGnOzJDJ6YrLX0d3F/0l7VKqxnwk3YQkYMkE/uwrbz2avwgv7EsnLWCneDEV
	33O11n7cjQJ7HBK0kjEpCmhMp3Rg1U5H5s2BZ90ZJEVVl2jOXr85gyMbeed78GPnmmTnqOOgiY1SE
	2C0PruRMqet2AxPMiQ6g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nKHP3-006UVX-1B; Wed, 16 Feb 2022 10:19:17 +0000
Received: from smtp-relay-internal-1.canonical.com ([185.125.188.123])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nKHP0-006USz-6o
 for linux-mediatek@lists.infradead.org; Wed, 16 Feb 2022 10:19:15 +0000
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-relay-internal-1.canonical.com (Postfix) with ESMTPS id 99CE54060C
 for <linux-mediatek@lists.infradead.org>; Wed, 16 Feb 2022 10:19:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
 s=20210705; t=1645006744;
 bh=8OOLa17szhk6+Vg3+wnuFFLqwR9SvrL1rcWwTRV4DbU=;
 h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
 In-Reply-To:Content-Type;
 b=htIqduRfNPLGakhWqjq+bjoNyrWsFizYekim73QO3lxdeOTN6BgQeSImCJTWx6q7B
 tTXwcTDO2ba2u2sTpESCJ5CToMOcph4g5MqYsyguuz2pTF8mColQbMQy/1bIqmeeEX
 Xiay8AWBi4cVKVRGXCyOhqQSb8eQWXdXjsq1oNA6JVadErIOUocx0VX6715gH4HzNJ
 mUI95nqcwTZG7NGFjsdJmp0x2joRpDp1LJjHa10gbm4rtwu3G+B6JZHUkYfWwv9P9A
 ZlfrkeB6t4uEpyq+QrNnHOH5WumViIoBBXTDqHOHXuCL+k6h7lMSRyiMdRVM9gV4Rk
 Q/wkHhGDdUayA==
Received: by mail-wm1-f69.google.com with SMTP id
 p2-20020a05600c430200b0037bb72b5865so117831wme.8
 for <linux-mediatek@lists.infradead.org>; Wed, 16 Feb 2022 02:19:04 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:to:cc:references:from:in-reply-to
 :content-transfer-encoding;
 bh=8OOLa17szhk6+Vg3+wnuFFLqwR9SvrL1rcWwTRV4DbU=;
 b=OcyfRWxkcyPizF75Nad1aYCEDPRcrUrXg0uxlQdZxV6WeFr5IVbHGvr/nmKnRr9k/S
 3iFsm+cg5ee56Cl7XqM4P2BZ2OAKO3YKwcjfGs0QFXjB3DRXAt4ILJKUhY4BXhCT3Pjs
 nqlRzkjbrUSazoJOY6XsKwBnhKEg2ZUdzPGmyhx51KhY+4XqrpPl5lO+jl6hKtepjfBu
 OdJsJd6az7L7NqR1WtfhCT0NFLDjdybC4uIoesYxIBSYNk2wgSuyw5nYVKp0LK9GZa/P
 U3sT9VUAP8rMuQUBP8fDycjgy9gPNPjEfGEAdDNYaK0zvXg621AiYNDU5Km4I6zYVX5/
 aZZw==
X-Gm-Message-State: AOAM530lnPSIFE02Ip5FBN8EQFmoitWFRR4ZcaDxWF5tN8pVuH65SY7x
 ca2XBT0K221rUEMWO6PdVycZSaR4JNZNuNOAnOiY9aAA/1PQUUT4wkRP2TmufVmh78DB9wvaOBf
 UoLNN/YOSsV9MHua5DMo7vghWVKjswiitWfg2qSGidL7zt3jSWw==
X-Received: by 2002:a05:600c:3b21:b0:37b:c3e4:2118 with SMTP id
 m33-20020a05600c3b2100b0037bc3e42118mr881928wms.66.1645006744078; 
 Wed, 16 Feb 2022 02:19:04 -0800 (PST)
X-Google-Smtp-Source: ABdhPJyf3UFTJ+JYq+/ZRJoOM/VuEU5pVmkXnms6laAM61/FvU71Sbs3F8qYgMoSzDOxd4nUeQxZAg==
X-Received: by 2002:a05:600c:3b21:b0:37b:c3e4:2118 with SMTP id
 m33-20020a05600c3b2100b0037bc3e42118mr881894wms.66.1645006743894; 
 Wed, 16 Feb 2022 02:19:03 -0800 (PST)
Received: from [192.168.0.110] (xdsl-188-155-168-84.adslplus.ch.
 [188.155.168.84])
 by smtp.gmail.com with ESMTPSA id n6sm17765250wru.114.2022.02.16.02.19.03
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 16 Feb 2022 02:19:03 -0800 (PST)
Message-ID: <06c1d3f1-3c12-815d-27d1-7ef3efb22877@canonical.com>
Date: Wed, 16 Feb 2022 11:19:02 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [v2,0/4] Convert pwm-mtk-disp.txt to mediatek,pwm-disp.yaml format
Content-Language: en-US
To: Macpaul Lin <macpaul.lin@mediatek.com>, xinlei.lee@mediatek.com,
 thierry.reding@gmail.com, u.kleine-koenig@pengutronix.de,
 lee.jones@linaro.org, robh+dt@kernel.org, matthias.bgg@gmail.com,
 jitao.shi@mediatek.com
Cc: allen-kh.cheng@mediatek.com, linux-pwm@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 Project_Global_Chrome_Upstream_Group@mediatek.com,
 Xinlei Lee <xinlei.lee@mediatek.corp-partner.google.com>
References: <1645003971-16908-1-git-send-email-xinlei.lee@mediatek.com>
 <7d54ecb2-bb7a-ab3d-9e29-fa2541ec549d@mediatek.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
In-Reply-To: <7d54ecb2-bb7a-ab3d-9e29-fa2541ec549d@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220216_021914_414545_FC9E546B 
X-CRM114-Status: GOOD (  13.50  )
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

On 16/02/2022 10:47, Macpaul Lin wrote:
> 
> 
> On 2/16/22 5:32 PM, xinlei.lee@mediatek.com wrote:
>> From: Xinlei Lee <xinlei.lee@mediatek.corp-partner.google.com>
>>
>> Changes since v1:
>> 1. Fixed formatting issues mentioned in the v1.
>> 2. Delete pwm-mtk-disp.txt.
>> 3. Add mtk_pwm dt_maintainers.
>> 4. Add "#pwm-cells" & power-domains properties.
>> 5. Make dt_checking successful.
>>
>> Xinlei Lee (4):
>>    dt-bindings: pwm: Convert pwm-mtk-disp.txt to mediatek,pwm-disp.yaml
>>      format
>>    dt-bindings: pwm: Add compatible for MediaTek MT8192
>>    dt-bindings: pwm: Add compatible for MediaTek MT8195
>>    dt-bindings: pwm: Add compatible for MediaTek MT8186
>>
>>   .../bindings/pwm/mediatek,pwm-disp.yaml       | 74 +++++++++++++++++++
>>   .../devicetree/bindings/pwm/pwm-mtk-disp.txt  | 44 -----------
>>   2 files changed, 74 insertions(+), 44 deletions(-)
>>   create mode 100755 Documentation/devicetree/bindings/pwm/mediatek,pwm-disp.yaml
>>   delete mode 100644 Documentation/devicetree/bindings/pwm/pwm-mtk-disp.txt
>>
> 
> Why did you drop [PATCH] tag in the subject of your patch series?
> Please keep it for distinguishing it from RFC/RESEND and other 
> meaningful tags next time.


I also asked for this in v1 patchset, so it's a pity my suggestion was
not listened to.

Best regards,
Krzysztof

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
