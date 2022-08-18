Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 92AEBC00140
	for <linux-mediatek@archiver.kernel.org>; Thu, 18 Aug 2022 14:33:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=wZWNoQ9jd+6KChF/G6GSiaIJiZ5G1cdiC7iDuKt3ngk=; b=JcxuYoE/mFjY8rhQbw05iac1XW
	R2ilgc7qU44C78vU42TzUFVnZcx+62SIPUvGYmrX+hh1pyaRL/yNQkcOC0/hLahZVRgmdvFcjNe8o
	dnPq4TlK1fGtylNYbGPh2N5szocb5xKWpn787coZAqpcrpBw1H5iy+TM9CSvckz5AbsMrgDvcLV2u
	QDST/oX3PTYpFAarhFHsM1AVQTqgKhYzglCcujMO/yrTyHMl+JvMW6gO0LYwhc3R+rtxYkDGf+uoo
	hxreT1BidsV/q4h5oykOjNwS4KwPZTjt/ZcXW8l1eLipZDCd96I6QLY9Pn1onj4qHLjrv5+w/7p8X
	65sLkddA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oOgZn-0065X2-Ql; Thu, 18 Aug 2022 14:32:52 +0000
Received: from mail-lj1-x230.google.com ([2a00:1450:4864:20::230])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oOgC4-005s9X-47
	for linux-mediatek@lists.infradead.org; Thu, 18 Aug 2022 14:08:22 +0000
Received: by mail-lj1-x230.google.com with SMTP id q16so1249546ljp.7
        for <linux-mediatek@lists.infradead.org>; Thu, 18 Aug 2022 07:08:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc;
        bh=wZWNoQ9jd+6KChF/G6GSiaIJiZ5G1cdiC7iDuKt3ngk=;
        b=HreSCQJ90vEq7WkznNLaMC0IwyxoaF+IfY3cbQy/wkbPnMAjP0JrAJjwuhoqx1fadt
         uiNqJYxUlx4ualcpm853nUFXy0FuqI3+uxTfsbZGURUY7MNUt1/33mybDV/Sct2Ue2/9
         44er/C4IewcSggLnCX+yiLk5qBdQDEgbgxNGzYUblO5d2pjFvEb+hmL+YwprHJEH+y19
         uh8Py0MZ/ws3AzlzpU+bHr1ORP5MvtSaohDChaLlyVRq0Ap4Ej3vrlvliPtNS2Xu9Q3i
         H6ZvYpN71ghNWnAORAOgwfKgZhkKBMlmzQ5WVASLEOQOSvIjjeAMQPlHTfOlua8KaXQQ
         X5Aw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc;
        bh=wZWNoQ9jd+6KChF/G6GSiaIJiZ5G1cdiC7iDuKt3ngk=;
        b=SJkO1LXVjNUhssTU+uRk7oZ3eNHpBtSW866j1y7DLWV06agh3RnuBm6mpfbOo1TrOV
         J9i1NXvBibgMNf3Yxqyaoe3fdlYaT+XKoUYQcOQuTlegRgzYT3BNyuMPnnX3ucK/HtlJ
         69z66wATVCCFvJGQLy81EyoeuruZYbyS+i/PGlhgqSljkds4PwIlLFtk9K7i7+7gETKO
         EBXGdoQkhQ4TMCO4Tadyz7xwFQtMrmCg/5oMZvRTRFS5AUVBrUrC6rfRRE+bU7ArAmlR
         qN6hrzz4A12fiJXiikROA0jDJynCZcjWNX8O6rfQu3qSbGKfAKP0i0+uZ31Mgo8YTuyE
         gdlQ==
X-Gm-Message-State: ACgBeo2irNpD10TQRLvByRU5gereTqscS9goNk3bvJuxu3HC7a3w63lP
	Chgn4SySVEhOIfOgT+yPWudspg==
X-Google-Smtp-Source: AA6agR59qSIqkgbq9ojwDm4Du9sO6w1tJlH1W4lPC5yGAGaKd/MzRdSsesks158T6ARTDgpH3PMJVg==
X-Received: by 2002:a2e:a99b:0:b0:261:b1a1:4ee9 with SMTP id x27-20020a2ea99b000000b00261b1a14ee9mr1009801ljq.366.1660831697519;
        Thu, 18 Aug 2022 07:08:17 -0700 (PDT)
Received: from ?IPV6:2001:14bb:ae:539c:53ab:2635:d4f2:d6d5? (d15l54z9nf469l8226z-4.rev.dnainternet.fi. [2001:14bb:ae:539c:53ab:2635:d4f2:d6d5])
        by smtp.gmail.com with ESMTPSA id z24-20020ac25df8000000b0048b16d0b7b7sm232318lfq.135.2022.08.18.07.08.15
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 18 Aug 2022 07:08:16 -0700 (PDT)
Message-ID: <3b4fd920-1f9e-de43-b436-85d73cf12f8c@linaro.org>
Date: Thu, 18 Aug 2022 17:08:14 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.12.0
Subject: Re: [PATCH v9,2/7] dt-bindings: thermal: Add dt-binding document for
 LVTS thermal controllers
Content-Language: en-US
To: Balsam CHIHI <bchihi@baylibre.com>
Cc: rafael@kernel.org, rui.zhang@intel.com, daniel.lezcano@linaro.org,
 amitk@kernel.org, linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org,
 khilman@baylibre.com, mka@chromium.org, robh+dt@kernel.org,
 krzk+dt@kernel.org, matthias.bgg@gmail.com, p.zabel@pengutronix.de,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, james.lo@mediatek.com,
 fan.chen@mediatek.com, louis.yu@mediatek.com, rex-bc.chen@mediatek.com,
 abailon@baylibre.com
References: <20220817080757.352021-1-bchihi@baylibre.com>
 <20220817080757.352021-3-bchihi@baylibre.com>
 <18164de9-ad28-939c-a802-69647fc65a37@linaro.org>
 <CAGuA+op3tFL6M=H2rzAB4DJn+7ve4W5vUuRc+zBrq7zQY2CX7w@mail.gmail.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <CAGuA+op3tFL6M=H2rzAB4DJn+7ve4W5vUuRc+zBrq7zQY2CX7w@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220818_070820_205696_FCAB9047 
X-CRM114-Status: GOOD (  10.95  )
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

On 18/08/2022 17:04, Balsam CHIHI wrote:
> Hi Krzysztof,
> 
> Thank you for the reviews.
> Would you please explain the meaning of "Rebase your patchset on
> decent kernel tree. You seem to use something a bit old"?
> It is rebased on top of linux-6.0.0-rc1.
> Am I missing something?

You Cc-ed me based on old maintainers entry, so either you did not use
scripts/get_maintainer.pl or you used that tool on some old kernel If
you used that tool on decent kernel, you would get different email
address. That's why I asked.

Best regards,
Krzysztof

