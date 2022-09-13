Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 75A99ECAAD8
	for <linux-mediatek@archiver.kernel.org>; Tue, 13 Sep 2022 15:58:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=A1Eig4ob2xruzFnrOgNkfvNevJMOsIOAHzq6wGFNTHg=; b=OL8AGPjmqnn9T8b9vDA7OySDzH
	isNBOprjIGT6lQsctNpKM0SwxIcU5ZiKNNxv7T6pVnsODHH9R8CSkc6V+9/oQw8syD3SkVaLw0SVx
	Hqypr8mkyKHvxrg7Mt4ZYBUWY4vm/+2N4Lw07rKQ5+x3Wmaxk+6/TkQB7mA2opj3rmJ9tCpddIXPR
	QLKQp8gEm3syk+9tcJQp/UspXU6YZ/7RLlh2GBFr3fUBhqFimdZ3ew1pe7vz7vUU7ZFVUMeOzNetp
	aYxdwjCO1Kfi0BwDJC3kaYynN4PYwIYT0stV6kNreFq2C4YjEbqqEJ+I1vwCH+PXU39lt8HJJXjE2
	clOoIDKw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oY8IK-00CuY8-RR; Tue, 13 Sep 2022 15:57:53 +0000
Received: from mail-wr1-x433.google.com ([2a00:1450:4864:20::433])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oY8Gf-00CsoX-DD; Tue, 13 Sep 2022 15:56:11 +0000
Received: by mail-wr1-x433.google.com with SMTP id t14so21516496wrx.8;
        Tue, 13 Sep 2022 08:56:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date;
        bh=A1Eig4ob2xruzFnrOgNkfvNevJMOsIOAHzq6wGFNTHg=;
        b=jnqG/3Xw42Vw3hCx2tkA1LUWA4X73P8JBwCXnUdjcxmH8K3BrrtIM6OMZP+btxOVPz
         kKgq37YjjtNc8PDz/BUigJobIHgg7/5eL7X9bT6YMTugqrRNy/NSTU6vOmAfrHCHrnuf
         NhF2jtGgPfuP2T39ncunefBsR0J+A78NnBBM3KBODOF6GK8W4UQoEuKaLG6jscSeHzIm
         A+JiQjmcgbKRzh7owhNRLHav15OTGXq/GHgRSpDcMN/G8pDwHGDJD6yRbm7m+BWjl/5R
         My+9qSZcL9XtCSLrVracdZpj5HHr25rBEFGxOv+0Y6Qm+r8u8IBwm8Fkm7CEBNSeGDqz
         retQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date;
        bh=A1Eig4ob2xruzFnrOgNkfvNevJMOsIOAHzq6wGFNTHg=;
        b=fTn7mjmWwJrYJke3HeDd2MVuiFFLgpVZXhObFP9Ft+M0wCGb8xzYOHvB+nQ3FNI6GD
         juL4I93TLu3SiotWVEMgvgPHG2B3P2mR3iEIwwy25gGaILPa7P40dL/rAykuq6BOkkpD
         IhSnjMUieBEQ6LdFA4+eXvqWMcLhwOBUuqaJJTpgAOE7lsZRsh+KwXx3HH7gpcLaSfcn
         2rSInhNv54fBmQeyBx37v0jNblNnBIbY/f6f2nRJhMRrGUpLFYAPRKtGJwV7FpPM3/46
         KbsJwnnPzTpO9AbEqtyNJ61fjlmo2ruWBEIP8d0b+jqJdLf664UYqFgUhy889gOmkGsO
         YrLA==
X-Gm-Message-State: ACgBeo2LH8bNm8TdzUYZ/6upkt9g8df/ErqhUgDyx48mWI92WFx/YeYE
	ZjAfIWAPn/Hw9ogim99IhMutLm+88rQ=
X-Google-Smtp-Source: AA6agR5MXcQhvZeL2lOM1tkCMzp/EfuKffz9Zr/BO5VivjLo3NQ+7pEPi4PF8Ub2szW7vpiCx0FbIA==
X-Received: by 2002:a05:6000:1acb:b0:226:f39d:1a1f with SMTP id i11-20020a0560001acb00b00226f39d1a1fmr18413148wry.607.1663084564686;
        Tue, 13 Sep 2022 08:56:04 -0700 (PDT)
Received: from [192.168.0.30] ([47.62.125.55])
        by smtp.gmail.com with ESMTPSA id v8-20020a05600c12c800b003a844885f88sm13138699wmd.22.2022.09.13.08.56.01
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 13 Sep 2022 08:56:02 -0700 (PDT)
Message-ID: <96cd0c78-a76d-e32c-8f05-32e127df3fb0@gmail.com>
Date: Tue, 13 Sep 2022 17:56:00 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.1
Subject: Re: [PATCH 00/10] ASoC: mediatek: Set i2s clock sharing from machine
 drivers
Content-Language: en-US
To: Mark Brown <broonie@kernel.org>,
 =?UTF-8?B?TsOtY29sYXMgRi4gUi4gQS4gUHJhZG8=?= <nfraprado@collabora.com>
Cc: Rob Herring <robh+dt@kernel.org>, Chunxu Li <chunxu.li@mediatek.com>,
 Akihiko Odaki <akihiko.odaki@gmail.com>, Jiaxin Yu <jiaxin.yu@mediatek.com>,
 kernel@collabora.com,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Tzung-Bi Shih <tzungbi@google.com>, linux-kernel@vger.kernel.org,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 devicetree@vger.kernel.org, Dan Carpenter <dan.carpenter@oracle.com>,
 linux-arm-kernel@lists.infradead.org, alsa-devel@alsa-project.org,
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
 linux-mediatek@lists.infradead.org,
 Rikard Falkeborn <rikard.falkeborn@gmail.com>,
 Liam Girdwood <lgirdwood@gmail.com>, Miaoqian Lin <linmq006@gmail.com>
References: <20220908161154.648557-1-nfraprado@collabora.com>
 <166276355052.332114.1969052042106279493.b4-ty@kernel.org>
From: Matthias Brugger <matthias.bgg@gmail.com>
In-Reply-To: <166276355052.332114.1969052042106279493.b4-ty@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220913_085609_515543_84B7522B 
X-CRM114-Status: GOOD (  24.29  )
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



On 10/09/2022 00:45, Mark Brown wrote:
> On Thu, 8 Sep 2022 12:11:44 -0400, Nícolas F. R. A. Prado wrote:
>> The i2s ports on MediaTek SoCs only support a single data lane. In order
>> to achieve full-duplex operation thus two i2s ports, one for input and
>> one for output, need to be used together and sharing a single clock from
>> one of the ports.
>>
>> This clock sharing setting was previously read by the sound platform
>> driver from the devicetree, but given that the input/output pairing is
>> closely related to which codecs are connected to which ports, the
>> machine sound driver can infer and set it, so that no DT property is
>> required.
>>
>> [...]
> 
> Applied to
> 
>     https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git for-next
> 
> Thanks!
> 
> [01/10] ASoC: mediatek: mt8192: Allow setting shared clocks from machine driver
>          commit: 8ae4fcfd5b11b5c33154732fcad99ad0f5843ce2
> [02/10] ASoC: mediatek: mt8192-mt6359: Make i2s9 share the clock from i2s8
>          commit: 3ffb9fa3963964a730c34f48e502ac0625efc145
> [03/10] ASoC: mediatek: mt8192: Remove clock share parsing from DT
>          commit: 9ccd51ce396a46d9d4d0c87aa6a82dd26a2f281a
> [04/10] ASoC: mediatek: mt8183: Allow setting shared clocks from machine driver
>          commit: fea84890e5c1fb65ae8e25b2f9b86363af1f45f2
> [05/10] ASoC: mediatek: mt8183: Configure shared clocks
>          commit: 4583392a135cc30409f5a6ceebb8374e550b03e0
> [06/10] ASoC: mediatek: mt8183: Remove clock share parsing from DT
>          commit: cbebe67859a0e8d51e578fdd9f927f8ef2504ba4
> [07/10] arm64: dts: mediatek: kukui: Remove i2s-share properties
>          commit: b3821f7839c2ec322926d16557aff29f4be1f4dc

DTS should go through my branch. We can see if there are any merge conflicts in 
linux-next and fix them somehow or you drop the patch and I take it through my 
tree. As you like.

Regards,
Matthias

> [08/10] ASoC: mediatek: mt8186: Allow setting shared clocks from machine driver
>          commit: 4132a778e806f77c2bd01a9a34b07edc9dd99d76
> [09/10] ASoC: mediatek: mt8186: Configure shared clocks
>          commit: 9986bdaee4776c5d595933cace9d54c6bc084e91
> [10/10] ASoC: mediatek: mt8186: Remove clock share parsing from DT
>          commit: 62da80c6a124dd68b12c4d2197ecc74b79823571
> 
> All being well this means that it will be integrated into the linux-next
> tree (usually sometime in the next 24 hours) and sent to Linus during
> the next merge window (or sooner if it is a bug fix), however if
> problems are discovered then the patch may be dropped or reverted.
> 
> You may get further e-mails resulting from automated or manual testing
> and review of the tree, please engage with people reporting problems and
> send followup patches addressing any issues that are reported if needed.
> 
> If any updates are required or you are submitting further changes they
> should be sent as incremental updates against current git, existing
> patches will not be replaced.
> 
> Please add any relevant lists and maintainers to the CCs when replying
> to this mail.
> 
> Thanks,
> Mark

