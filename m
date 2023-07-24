Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C8160C001B0
	for <linux-mediatek@archiver.kernel.org>; Mon, 24 Jul 2023 07:25:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From
	:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=6To1AmJfKZALXGlXmCdcpZQBhgwdO8DUFybmC0BfNuI=; b=nnQySfzMMbAdOIpuCAFMtQz97p
	kYh8f6UxKlkIdJkLPRsr0O/Mt6nptbyOyV3uGaCif6iwK/a1WQffus8xNT/ILfuDdmQjRX4ZTmIob
	Rvo7xHn2vs5FOgm/UMCyv0xvuuz/sM1W9KvYBtS27q4cKAG9L3MiOSHZdabOHs50O+0A8Cbk3fzyV
	JjzDkb5x5qHUf4X2p4i193ls+IqC0Jp1Yh6i8fEmx/wi0NSu/K3/tfstM5h4gZReH60L5fvT7s3nx
	voZtIvEaqZzIwzaGiKaMA1HjGaaD6xLyQPomtqt91XrRjqyWmiXL/eIB1If0HDk+onqp1YHHWUQgG
	fdFAOQRw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qNpwP-0035tM-2A;
	Mon, 24 Jul 2023 07:25:13 +0000
Received: from mail-lf1-x135.google.com ([2a00:1450:4864:20::135])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qNpwN-0035rw-0T
	for linux-mediatek@lists.infradead.org;
	Mon, 24 Jul 2023 07:25:12 +0000
Received: by mail-lf1-x135.google.com with SMTP id 2adb3069b0e04-4fb863edcb6so5864095e87.0
        for <linux-mediatek@lists.infradead.org>; Mon, 24 Jul 2023 00:25:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1690183507; x=1690788307;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=6To1AmJfKZALXGlXmCdcpZQBhgwdO8DUFybmC0BfNuI=;
        b=I0ybHvy1YLSUttFE8O1Qh6SjnmxzSFnmFPbj/00XHoyRTeHaQiLC6TZ6ZFlHQzVzWW
         Xv8slB0FYNivzUusyeUO7ItxNy/ydzn0hVu9dRvkgmFUIFCaA7fDjv1/FOUadboyKaky
         bmwaUp/gQoVCLxIlWWsSGXbTT+zapkwh7JZRaGA1AiF7fXvCVHvrNz9rIsPwZ2BbCUc3
         55nDdbJFyfK6jGOUN+h1BkkuEeDs6Cp0PLocKbZ1UaLl6UebMz6B2yQmvFi8CuV+ugi3
         UM6Ggq16DU8nO6K03iMt9pdlowN4a3IAXpVb3oggruIEH8ieOncYGw4L4x8+2OMYos/D
         KJnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690183507; x=1690788307;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=6To1AmJfKZALXGlXmCdcpZQBhgwdO8DUFybmC0BfNuI=;
        b=d+2eSgxm53JWkzihw+pa/L3f+USuZWGoL4f1E2SXcLAByz33DPm8opWj/d5ZYv7cxA
         3u9x15f8gC7RPk6oQCHYzCoeZtKAr0xfk7HZCrPKzshtoXdrM4SQYxInI0VIzALoXLoS
         jap0gs8ePtg/cqKtb+uHbSJh3e/vLmyuEsvM2hLmyHSJiVtdRIAMMZ4pagWGa7dDf9di
         hqy8C1LWTD9Qqma2+9KHPqJ12vYH9sjZ6mJ+uv2pLbaFIFuIQCOAmrnMbH88dv1dwZOC
         itnhofpRpO7eCy0fUwJAYDX1+0uq5p+0rQugE1No0Pui57GQxflGA25NPtnb5i9CLpgf
         mLFQ==
X-Gm-Message-State: ABy/qLY9U8SWbRPzAr9hn+YJpMiOxuAbXWo9h1gGrhBC5xB6IumIt/6M
	Fl76ZIzMUq9blZga36hg9AUbcw==
X-Google-Smtp-Source: APBJJlF4c3ReKDhvLfkhVwoWeOuz74evpUCZ2CgKvSJySQdVz2fjNjGVbLZ0rhlEWgW66p+rwRWCxQ==
X-Received: by 2002:a19:7508:0:b0:4ed:cc6d:61fe with SMTP id y8-20020a197508000000b004edcc6d61femr4842985lfe.24.1690183507175;
        Mon, 24 Jul 2023 00:25:07 -0700 (PDT)
Received: from [192.168.1.20] ([178.197.223.104])
        by smtp.gmail.com with ESMTPSA id t8-20020a056402020800b0052239012c65sm303432edv.82.2023.07.24.00.25.05
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 24 Jul 2023 00:25:06 -0700 (PDT)
Message-ID: <ae570cbb-08ad-5a7c-8dc9-4ad9f41d6e7f@linaro.org>
Date: Mon, 24 Jul 2023 09:25:04 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH v2 0/7] ASoC: mediatek: Add support for MT7986 SoC
Content-Language: en-US
To: =?UTF-8?B?TWFzbyBIdWFuZyAo6buD5Yqg56u5KQ==?= <Maso.Huang@mediatek.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "robh+dt@kernel.org" <robh+dt@kernel.org>,
 "linux-mediatek@lists.infradead.org" <linux-mediatek@lists.infradead.org>,
 =?UTF-8?B?VHJldm9yIFd1ICjlkLPmlofoia8p?= <Trevor.Wu@mediatek.com>,
 "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 =?UTF-8?B?QWxsZW4tS0ggQ2hlbmcgKOeoi+WGoOWLsik=?=
 <Allen-KH.Cheng@mediatek.com>, "broonie@kernel.org" <broonie@kernel.org>,
 "renzhijie2@huawei.com" <renzhijie2@huawei.com>,
 "conor+dt@kernel.org" <conor+dt@kernel.org>, "tiwai@suse.com"
 <tiwai@suse.com>, "lgirdwood@gmail.com" <lgirdwood@gmail.com>,
 "linux-arm-kernel@lists.infradead.org"
 <linux-arm-kernel@lists.infradead.org>,
 "krzysztof.kozlowski+dt@linaro.org" <krzysztof.kozlowski+dt@linaro.org>,
 "matthias.bgg@gmail.com" <matthias.bgg@gmail.com>,
 "perex@perex.cz" <perex@perex.cz>, =?UTF-8?B?SmlheGluIFl1ICjkv57lrrbpkasp?=
 <Jiaxin.Yu@mediatek.com>,
 "angelogioacchino.delregno@collabora.com"
 <angelogioacchino.delregno@collabora.com>,
 "alsa-devel@alsa-project.org" <alsa-devel@alsa-project.org>
References: <20230626023501.11120-1-maso.huang@mediatek.com>
 <04a1a53ebd9df265da780c644a0db86952cde8db.camel@mediatek.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <04a1a53ebd9df265da780c644a0db86952cde8db.camel@mediatek.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230724_002511_191562_EEB5C4CE 
X-CRM114-Status: UNSURE (   9.42  )
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

On 24/07/2023 08:17, Maso Huang (黃加竹) wrote:
> Gentle ping :)
> 
> Hi Rob and Angelo,
> 
> Can you help to check this latest series and share your thoughts if
> any?

You got comments to fix! Implement what you were asked to do.

Best regards,
Krzysztof


