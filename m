Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 15B89C6379F
	for <linux-mediatek@archiver.kernel.org>; Thu, 19 Jan 2023 18:22:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=yGqWDYNV/zj4CViB/rzlzxmbjJcNm5WbqvSrrqvqKqA=; b=ph5Q54pcNFXnLZknEsvM5c/rOM
	htn3+T5JqZ6Rx7DhSgRYArJ6djPcQTnIZKt7tyddhgWvpY+50/tF9xvVCoiVqQVZLyYsPVD4C/e6A
	TO/l2xrrtG/U6VA407cLOheXaRFIKcas7Zr9H1yjy6hKTKAyynEa1wzXdEEbYpvCuju36TP816Ywr
	NcVRE0pb15i3yBPAa7n8k6jAJvtXuRQO+Ie8KrY193Ex6EZ8r/JKMlNvfEkajtGlvKvCxCTFo8kFp
	mg/NUfbjhtPBfb0eCnVXrFMbwePlchVysv+iXasmNs+2aPeFybdUbBlRuElU1ScL5nfcD5QnCSrWn
	6rCTSirA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pIZXq-006Wxm-Jr; Thu, 19 Jan 2023 18:21:50 +0000
Received: from mail-wm1-x330.google.com ([2a00:1450:4864:20::330])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pIZXc-006WsZ-9N; Thu, 19 Jan 2023 18:21:40 +0000
Received: by mail-wm1-x330.google.com with SMTP id m15so2226246wms.4;
        Thu, 19 Jan 2023 10:21:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=yGqWDYNV/zj4CViB/rzlzxmbjJcNm5WbqvSrrqvqKqA=;
        b=WgVoJRGiHYIj0ItSxqG3rKEtsX6JMplwgQC2tynjIBdZDikc0itBbnmglgZoxQxTrK
         J8FskCoDTDzVgCwKWuuVQhpGpb1zkZJ4sMT8FqviHJvkWe1SD9iAAiguEH5AzS1v4Jiw
         H1S8lqRBgpPBCkO4TRhlGdg9xWoW0gDehzaO4iXjdZ+wi4W7kiI1jhuCrWHx/rxZ3Xx1
         p5W8GGVWgcs+uUNk4/9nZyrKa11czvnkP57PXuADpFFiPh6gND2qndPe1j1SW21beZnD
         2eT/GDrgQ+00qJyMC23whBB+3tgNCX72iob5avRKzHHIrIPlzyzz3zUtrlt5AHRVRQli
         KBRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=yGqWDYNV/zj4CViB/rzlzxmbjJcNm5WbqvSrrqvqKqA=;
        b=S4L7FknWcfZUOvVO5tDCyZ9zsxJjEFdgiHg/ukZ+kLxFAP+/QS41BtP5Q617DKEV+X
         FtC5GBui03/lc2YWTAhaCRezUttQg8Z0EgUfvyIfuttWwWp/0UZOkUeCC4JnWqjbnBaE
         aWgJc00wMr8m0EW5m0OUklgyWjZaVfLrLef9jdmXd2NF28WGtQQXy//rOfsBE8m1AzOZ
         kbjPqpoxOf8gxPR4X290RsvHCtI1Bt9NGuhA5h9XatTUygblY9bwWMkzE8/+FF70rgYB
         +lAjo091Y+Pzs4jyxBm4qukbqx5o6SMHQbbwAf8er+3+Om9/ezxyTEBo9AYP2ux6uVsE
         t7Vw==
X-Gm-Message-State: AFqh2kpyrN/MH1nrpXdbJ8gLhXDcQchZARmwiVwwF5yLBiUkVRk1t/nO
	Kj9VWzqAI7RPVZhj1aYIbEw=
X-Google-Smtp-Source: AMrXdXsmDmS7q48LKnqE9ktFXgp6/WhmL/HhhbELcw0kvq1rsbIbBxTPAXFGPqF32dmnGf6uBDssig==
X-Received: by 2002:a05:600c:3488:b0:3cf:68f8:790b with SMTP id a8-20020a05600c348800b003cf68f8790bmr7497484wmq.11.1674152493172;
        Thu, 19 Jan 2023 10:21:33 -0800 (PST)
Received: from [192.168.2.177] ([207.188.167.132])
        by smtp.gmail.com with ESMTPSA id q10-20020a05600c46ca00b003d1f3e9df3csm5782098wmo.7.2023.01.19.10.21.31
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 19 Jan 2023 10:21:32 -0800 (PST)
Message-ID: <6fe3fe94-d2a8-1fed-241f-16999ef22fd3@gmail.com>
Date: Thu, 19 Jan 2023 19:21:30 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.1
Subject: Re: [PATCH v7 4/7] dt-bindings: pinctrl: add bindings for Mediatek
 MT8365 SoC
Content-Language: en-US
To: Linus Walleij <linus.walleij@linaro.org>,
 =?UTF-8?Q?Bernhard_Rosenkr=c3=a4nzer?= <bero@baylibre.com>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-gpio@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, linux-usb@vger.kernel.org,
 robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org, tglx@linutronix.de,
 maz@kernel.org, lee@kernel.org, chunfeng.yun@mediatek.com,
 gregkh@linuxfoundation.org, angelogioacchino.delregno@collabora.com,
 allen-kh.cheng@mediatek.com, nfraprado@collabora.com,
 sean.wang@mediatek.com, zhiyong.tao@mediatek.com
References: <20230101220149.3035048-1-bero@baylibre.com>
 <20230101220149.3035048-5-bero@baylibre.com>
 <CACRpkdY-VqM_mzgJ=n9fEtFJD64EBie1EQF+8Bk5iLE68mCnSA@mail.gmail.com>
From: Matthias Brugger <matthias.bgg@gmail.com>
In-Reply-To: <CACRpkdY-VqM_mzgJ=n9fEtFJD64EBie1EQF+8Bk5iLE68mCnSA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230119_102136_396432_F89994DB 
X-CRM114-Status: UNSURE (   9.69  )
X-CRM114-Notice: Please train this message.
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



On 09/01/2023 14:35, Linus Walleij wrote:
> On Sun, Jan 1, 2023 at 11:01 PM Bernhard Rosenkränzer <bero@baylibre.com> wrote:
> 
>> Add devicetree bindings for Mediatek MT8365 pinctrl driver.
>>
>> Signed-off-by: Bernhard Rosenkränzer <bero@baylibre.com>
> 
> Looks good to me, do you want me to just apply this one patch to the
> pin control tree?
> 

Yes please.

Regards,
Matthias

