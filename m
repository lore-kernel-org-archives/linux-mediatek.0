Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 47BF0C27C6E
	for <linux-mediatek@archiver.kernel.org>; Mon, 17 Jun 2024 08:05:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=RhK0l1wiP2QqjV41iED4AMmcoD6qMZOANZydgxIA9xw=; b=JUHav5SIaHZ5/SSRoudx/FtWqS
	mWpfkvsIZr80b/FLGy2nGE5SEzC/wtGn+ph5SZbz55tfmFbMplrAIu6/6+MUfZoY739spHcrVw2zG
	XTP81m1hnP54NecVRRe5XSFZklyUssrhTBKdsxxXCAbo42riuBiTNBgdTTGo6qxBL+qulTVY6E/7Y
	oub42BeX4KEjDcLLNx793HMHeWJl7dsfMFmg7OF27N8RpahjDghhMWCaSEOgE2Nq3o0R76c5NufBf
	LmnRWbBoaybzKgJUMN1XnxABywYkJJ+zU5EzlQcvDfQn/pbcSChnJbqkXBIJztWt8Rd3+nrzIZkRd
	pwJJJ3Yg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sJ7N6-00000009mwB-3ydf;
	Mon, 17 Jun 2024 08:05:48 +0000
Received: from mail-wm1-x32f.google.com ([2a00:1450:4864:20::32f])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sJ7N1-00000009msd-2q8B
	for linux-mediatek@lists.infradead.org;
	Mon, 17 Jun 2024 08:05:45 +0000
Received: by mail-wm1-x32f.google.com with SMTP id 5b1f17b1804b1-421820fc26dso31967605e9.2
        for <linux-mediatek@lists.infradead.org>; Mon, 17 Jun 2024 01:05:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1718611540; x=1719216340; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=RhK0l1wiP2QqjV41iED4AMmcoD6qMZOANZydgxIA9xw=;
        b=Q/Cc5M/KNeniIV4/mmtz1PUGtWjCtER85EpqiudC9+plcXgO+Jl46K1fFRtTSO7eL5
         T8gFiXqm9k5ptemke9NEzviFYSyjJcVfdp67MydqFvLQHwiyNBGqyklq2gT3Ni+9/UyO
         qUCkFlDj9jhcufxysomlZT1rHF3lDuLlddIgpjpLP7704lCqSkzhX2BdTXXDahhEN5ta
         nqyCGO2znJVXouDwTwIye7hCQerYyexrKSVfb5OXUF7lOC15of21Uoob6nJHUQgPPyLs
         fuwP5ZJq4twgo2M9OEZh2FmblxCGf2SnWzHcQZAEwBUwV/M0E6r1/kvD7FlMZhQmYmAg
         Wd2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718611540; x=1719216340;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=RhK0l1wiP2QqjV41iED4AMmcoD6qMZOANZydgxIA9xw=;
        b=slJQlF+vxMuDr5cIQnlr1yGhdoGFHMQxsSw+kdLZpvN5GAOpFgLSH3lIAvssrnF9pa
         vrdWdtPT1lEMUHsNnrVzmi6bwVEJoVl3PF1ElTBzRPwJQR0ec8g5xrklEj9306+Op1H0
         7H7MhV9JHQrCuH242geUYwvWsN7zipUrAxQNcPPT1AntkWAHMdqJ4y6eEapB8DUfWD3w
         hrnKpT74THeIkQ1SfkAqjKyxxzDX0WPdUSshKQvhoW5a7eiGZqqb7KZOzG643gdxrTWI
         KYA6SjVvtEogK3049WnJCQvtzroKX/A4VSvc1YDdLbkPxVby3HVFjIrcQsRLAWiQb92o
         OxQQ==
X-Forwarded-Encrypted: i=1; AJvYcCWEjh8vGirCDzmHsCpOTwpuh98XHoK1EOHQG26Z96siS+5AwTNeUvrZp/m5igjthe38uDVIHLfKDkZcRsqgS8ANjT3WutjMb+8eo3kGdtnTTwoA
X-Gm-Message-State: AOJu0YylIuoux0eDQcSadISVJE8Kx8U5sqF5xJwB7wLr4r8sNLGx9fcK
	vTq1U2IM5sAA0vtfHd7xamOkH+qN6BDmMsrFGa5wuFDd4AAn+OxtTk4MeN2zbKc=
X-Google-Smtp-Source: AGHT+IGAPWtrsBoKqiT6NA7h3nhAEtNjGh3ZlArWedHKrxD1LJKsjTkfQ0ARrSXU5FBmgRUnhtV3jg==
X-Received: by 2002:a05:600c:468d:b0:421:2ddf:aec4 with SMTP id 5b1f17b1804b1-42304844f6dmr74278975e9.30.1718611539796;
        Mon, 17 Jun 2024 01:05:39 -0700 (PDT)
Received: from [192.168.1.172] ([93.5.22.158])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-42286fe9263sm187819725e9.15.2024.06.17.01.05.38
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 17 Jun 2024 01:05:39 -0700 (PDT)
Message-ID: <85e9451d-2cd0-457f-a246-017433757fff@baylibre.com>
Date: Mon, 17 Jun 2024 10:05:37 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RESEND v5 00/16] Add audio support for the MediaTek Genio
 350-evk board
To: Mark Brown <broonie@kernel.org>
Cc: Liam Girdwood <lgirdwood@gmail.com>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>, Matthias Brugger
 <matthias.bgg@gmail.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Lee Jones <lee@kernel.org>, Flora Fu <flora.fu@mediatek.com>,
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
 Sumit Semwal <sumit.semwal@linaro.org>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 linux-sound@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, linux-media@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 Nicolas Belin <nbelin@baylibre.com>
References: <20240226-audio-i350-v5-0-54827318b453@baylibre.com>
 <ZmwODkYov79VHznK@finisterre.sirena.org.uk>
Content-Language: en-US
From: Alexandre Mergnat <amergnat@baylibre.com>
In-Reply-To: <ZmwODkYov79VHznK@finisterre.sirena.org.uk>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240617_010543_881462_AD7EB6BC 
X-CRM114-Status: GOOD (  10.26  )
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



On 14/06/2024 11:31, Mark Brown wrote:
> On Fri, Jun 14, 2024 at 09:27:43AM +0200, Alexandre Mergnat wrote:
>> This serie aim to add the following audio support for the Genio 350-evk:
>> - Playback
>>    - 2ch Headset Jack (Earphone)
>>    - 1ch Line-out Jack (Speaker)
>>    - 8ch HDMI Tx
> 
> I seem to remember you had review comments that needed addressing from
> AngeloGioacchino, why resend without addressing those?

I don't see any comment:
https://lore.kernel.org/lkml/20240226-audio-i350-v5-0-e7e2569df481@baylibre.com/

-- 
Regards,
Alexandre

