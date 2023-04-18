Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 43380C77B75
	for <linux-mediatek@archiver.kernel.org>; Tue, 18 Apr 2023 11:56:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=T9oSeZGJaO3G9BEkK1S2Mgd4sINffRf+WgKyKKehfmI=; b=EWQj4NlvEQMaRiKS20h/668Eom
	RMfDvzLgfnI/YhBujxpVTo9x4oyBJBjShUf05082I9wxntf9pfoNLTPx18GX1TOQNDx8wGmgPmahb
	HBOIu+a5XT+yeLq4Nvm4mGqdBwJgtmkPcVhSpIc5NU1lSFFAAQkEK1ufN/hSTPIaUxsY2X7m+vOqF
	6p1St8P4yV1EYLZTeuXbfKyevGEAjHZKK4X0TLBe/pKadUQp/CeM4RIPh5ll6N099X1GnhxJ0v/Nv
	coycb9GVEskwFXxV09f1iyIxPkAk7/+AFAnLi9z8y8mtjza/lLhOKKnHWyEewDHOVP3he6HYaOL/F
	uNp4bKXA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pojwz-0022N4-1y;
	Tue, 18 Apr 2023 11:56:45 +0000
Received: from mail-wm1-x32d.google.com ([2a00:1450:4864:20::32d])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pojww-0022MD-2c;
	Tue, 18 Apr 2023 11:56:43 +0000
Received: by mail-wm1-x32d.google.com with SMTP id n43-20020a05600c502b00b003f17466a9c1so2900993wmr.2;
        Tue, 18 Apr 2023 04:56:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1681819000; x=1684411000;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=T9oSeZGJaO3G9BEkK1S2Mgd4sINffRf+WgKyKKehfmI=;
        b=EXHJXEGXy79uUSSwalxffycq7KWxOyLGcigWWbEvbe4A/tHuCrJx3bi9fyVr30xbvt
         2ohr0yYvurqh89V5/02Q1Lxqa1lcYhqwJT9gY2OkB9rEfs9TqLQHFDOXD5xueuIZKLIi
         0enhdobg6t6Pn+69lbxkw5PDTNIKBWJC2ntey0mtiKfSW2kKhayCaxskZc6WC/vPvrhO
         bC1syUexCP1omtV1npNjjcM6CzulU+hIVBIJEb6WXUrn9tqFidigErpnMAl0gPt0EZ8e
         vjD7hAefkxeTGZK7t8fEssZ0/C8eTQFa8cG8kZc3cSanJT3q9kEr34rQ5C6FT2zXaJ4j
         khRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1681819000; x=1684411000;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=T9oSeZGJaO3G9BEkK1S2Mgd4sINffRf+WgKyKKehfmI=;
        b=hpxrdodoBm/ALHsJ+9GFXQX1teRfv/z2kjLF1Se4PrV55gjmLRJARIn9bD11LjQ0YM
         6QD2rU9NdQlYuohTnTQe24iUqAgEMC5VDvPtZGXd2pfuZkWmzkrsS6krKlXAZDCgxGj8
         PahgWUATZ7273Wl1cRNbIpz35jZE7OneDuQjSKuFo8UbbdKc5LmD+YFVscFCQTs3rMEi
         SB7zk3SbQm8wfVUgmUYcJGjGxBhHsYtbeyeS/lpK/f9aTqsh2LMyQHSfoNMWZTifK6y7
         YDWD9RVZqYv8Vg5ROZ1Su0t3a5ZvEsYCfVqSFuIKmHOQ5v9Cbp4p52zBnkXnFyuK5juj
         79kQ==
X-Gm-Message-State: AAQBX9dK/Nul4YvTiduLPyYLKW5GU6ERRuyJIiN9/xMl4d46SllWBR+q
	MBspjpXZqbFvLUtNDJ7sDR7F5uGkMY5ZYQ==
X-Google-Smtp-Source: AKy350bbx0bJ/4L8a44U/aCtvaM2RV9kN1tMXWOPsHUuu0HTywAsjz+gzSejmnkzvEnhtHbDS3+jEw==
X-Received: by 2002:a05:600c:b47:b0:3f1:6cdf:93ac with SMTP id k7-20020a05600c0b4700b003f16cdf93acmr7012569wmr.17.1681819000111;
        Tue, 18 Apr 2023 04:56:40 -0700 (PDT)
Received: from [192.168.2.177] ([207.188.167.132])
        by smtp.gmail.com with ESMTPSA id v3-20020a1cf703000000b003f04646838esm14855802wmh.39.2023.04.18.04.56.37
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 18 Apr 2023 04:56:39 -0700 (PDT)
Message-ID: <1e55328e-aaa2-78e3-ddc8-c2717f6283f5@gmail.com>
Date: Tue, 18 Apr 2023 13:56:36 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.1
Subject: Re: [PATCH 01/27] dt-bindings: pwm: Add compatible for MediaTek
 MT6795
Content-Language: en-US
To: =?UTF-8?Q?Uwe_Kleine-K=c3=b6nig?= <u.kleine-koenig@pengutronix.de>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: p.zabel@pengutronix.de, airlied@gmail.com, daniel@ffwll.ch,
 robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org,
 jassisinghbrar@gmail.com, chunfeng.yun@mediatek.com, vkoul@kernel.org,
 kishon@kernel.org, thierry.reding@gmail.com, chunkuang.hu@kernel.org,
 ck.hu@mediatek.com, jitao.shi@mediatek.com, xinlei.lee@mediatek.com,
 houlong.wei@mediatek.com, dri-devel@lists.freedesktop.org,
 linux-mediatek@lists.infradead.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-phy@lists.infradead.org, linux-pwm@vger.kernel.org,
 kernel@collabora.com, phone-devel@vger.kernel.org,
 ~postmarketos/upstreaming@lists.sr.ht
References: <20230412112739.160376-1-angelogioacchino.delregno@collabora.com>
 <20230412112739.160376-2-angelogioacchino.delregno@collabora.com>
 <20230414054345.ip3ug53ivr3elbpy@pengutronix.de>
From: Matthias Brugger <matthias.bgg@gmail.com>
In-Reply-To: <20230414054345.ip3ug53ivr3elbpy@pengutronix.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230418_045642_844608_6F6CC647 
X-CRM114-Status: GOOD (  11.34  )
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



On 14/04/2023 07:43, Uwe Kleine-König wrote:
> Hello,
> 
> On Wed, Apr 12, 2023 at 01:27:13PM +0200, AngeloGioacchino Del Regno wrote:
>> Add a compatible string for MediaTek Helio X10 MT6795's display PWM
>> block: this is the same as MT8173.
>>
>> Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
> 
> Acked-by: Uwe Kleine-König <u.kleine-koenig@pengutronix.de>
> 
> I assume this patch will go in together with the other patches in this
> series via an ARM tree? (I.e. not via pwm.)
> 

That's totally fine, I'll take this patch through my tree once everything is ready.

Regards,
Matthias

