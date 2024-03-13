Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A28B0C54791
	for <linux-mediatek@archiver.kernel.org>; Wed, 13 Mar 2024 17:12:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=DfCyEn4BBkDtIZTeeb4WXSUMa8UuweDcHmhz18/rnUY=; b=cjAuyF7Gu7oTKAgn1SQt2uIew4
	1OXplMZx1VygV+t5oPLdD88m7RGGS+dmIwnOIOS+3XcO7KXgK/UGkfX44jAnxdt2CcCClc5/BMnAj
	vXVCjPm9BYAsoheUOwfGf17ku+h4Z0DPCQMLtg5eBMObNBEar9yj5L0pc5Gjm4QpEEAC3Z1MJI4YT
	uxUmUxkXKCdIXt1P1egrgBzeh2/mGOuUCavNb7YBhsy/2/dfd4tyMoBat+tF9Fdd42h8PUmyer8ig
	j1pJDkDz6kofq+aenMPSRNXDV/+7J3UxSrqm6VcAo0sTkSaxN1MvvShaewaiKgAcDywEdFKQhDF3W
	A2muA2aw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rkS97-0000000Axcc-1NFm;
	Wed, 13 Mar 2024 17:12:05 +0000
Received: from mail-wm1-x335.google.com ([2a00:1450:4864:20::335])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rkS93-0000000AxYr-15Af
	for linux-mediatek@lists.infradead.org;
	Wed, 13 Mar 2024 17:12:03 +0000
Received: by mail-wm1-x335.google.com with SMTP id 5b1f17b1804b1-413ef6985bfso500455e9.3
        for <linux-mediatek@lists.infradead.org>; Wed, 13 Mar 2024 10:11:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1710349913; x=1710954713; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=DfCyEn4BBkDtIZTeeb4WXSUMa8UuweDcHmhz18/rnUY=;
        b=z36/o8ElmHShRQqzz0I1WW9bg52OboyEKEJTlFZxyk3julfMtnN5Jj6n1N7z29t+0j
         WjGsD2o7eieOdKrlvLOXSMFbo4MJg4fTqM3S0NNKU0/d11nIBRnGSMOpi+cR81X5z0QN
         V/+dkw6/FK6AAKK1hSUqCgYwLJRUkqORDJHoD+CC/gDJItJP7vxIjadolGtVOtcqbqP5
         fs0S2f6AUB7ELHatwGQQ6qEeQ+zuC4HLf6oCoymCimyds62C0doyG2s0XgK+QOq4ZDHI
         rvjrupk7O9PmJNjk6Mhe3NTBOi2d/P6ItOWtG0G79V2F6mQsVCXf5ag0y8DOjRpPthhv
         wAJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710349913; x=1710954713;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=DfCyEn4BBkDtIZTeeb4WXSUMa8UuweDcHmhz18/rnUY=;
        b=dFS9/ZGD0aZDIwJHHrrVAwEMYqqTZ6B/8uGmEtKBG2rLSQDf0cf2t8UyzH8egfuZCN
         muq8yVJxvpvo4LvU36tJM2/CLBtnfakV8sn0786/OSWODxybG6vN4xIZUGqauIvRFENy
         JzRD4pr++gvlYYO1SOzVOSF1DKAhMm9ILq1jjSgCsIbaLtNV32uHfbtsy3y1HOIqYcWz
         +S5oSOoH6PZwL5+nawNcW9ekTvlho4a4bUaLgrgSrHTakcTtc740lMcMwXX5hgGzP0rB
         SnUqz5fvG9Xfh0itXvU12S1uDiUh9+aBwT1FslZqVgZnxhCuVVlxrYRYkAbnKrhaPxGJ
         RRbg==
X-Forwarded-Encrypted: i=1; AJvYcCX0Zfdlwo9mipxWWB+HZYsOmxENdyW6l/m2BwV97yE93Kkff3ztyvABl5MXbrnzOjEt36Q3Pu+UaytLUEJcmYaEg0tSwQ+ctZikNFLoAySLfgb8
X-Gm-Message-State: AOJu0YzAFCzy53lOulHJwHgull9GrdwmdJetlEH5QTanyCf2pIGiijTT
	jHyAwVAEM+sv2Lj9HuRiKchaDhIJaSRbmfE3k9166uY0lMVcnoLiFw4ZsknIQdA=
X-Google-Smtp-Source: AGHT+IFz1KXw55V676KHOL/rzoBQjJ9Rihc/CWALu4Z7kIN17vZX/My8C/6xcsm62UiChBonG2y1pw==
X-Received: by 2002:a05:600c:450c:b0:413:1285:6e40 with SMTP id t12-20020a05600c450c00b0041312856e40mr442329wmo.20.1710349912671;
        Wed, 13 Mar 2024 10:11:52 -0700 (PDT)
Received: from [192.168.1.172] ([93.5.22.158])
        by smtp.gmail.com with ESMTPSA id ay23-20020a05600c1e1700b00412ff941abasm2920026wmb.21.2024.03.13.10.11.50
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 13 Mar 2024 10:11:52 -0700 (PDT)
Message-ID: <ef4da1f6-d3c5-4484-8df5-1a04df4453a0@baylibre.com>
Date: Wed, 13 Mar 2024 18:11:50 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 12/18] ASoC: codecs: mt6357: add MT6357 codec
Content-Language: en-US
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
 linux-sound@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, linux-media@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org,
 Nicolas Belin <nbelin@baylibre.com>
References: <20240226-audio-i350-v1-0-4fa1cea1667f@baylibre.com>
 <20240226-audio-i350-v1-12-4fa1cea1667f@baylibre.com>
 <9891855d-2284-42e4-9d3a-35ba406540e8@sirena.org.uk>
From: Alexandre Mergnat <amergnat@baylibre.com>
In-Reply-To: <9891855d-2284-42e4-9d3a-35ba406540e8@sirena.org.uk>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240313_101201_841822_2D1D5D73 
X-CRM114-Status: UNSURE (   9.80  )
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



On 26/02/2024 17:09, Mark Brown wrote:
>> index 000000000000..13e95c227114
>> --- /dev/null
>> +++ b/sound/soc/codecs/mt6357.c
>> @@ -0,0 +1,1805 @@
>> +// SPDX-License-Identifier: GPL-2.0
>> +/*
>> + * MT6357 ALSA SoC audio codec driver
>> + *
> Please use a C++ comment for the whole comment to make it clearer that
> this is intentional.

If I do that, the checkpatch raise a warning:

WARNING: Improper SPDX comment style for 
'sound/soc/mediatek/mt8365/mt8365-afe-clk.c', please use '//' instead
#22: FILE: sound/soc/mediatek/mt8365/mt8365-afe-clk.c:1:
+/* SPDX-License-Identifier: GPL-2.0

WARNING: Missing or malformed SPDX-License-Identifier tag in line 1
#22: FILE: sound/soc/mediatek/mt8365/mt8365-afe-clk.c:1:
+/* SPDX-License-Identifier: GPL-2.0

even if I put:
/* SPDX-License-Identifier: GPL-2.0 */

IMO, the checkpatch tool should be fixed/update first.

-- 
Regards,
Alexandre

