Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0CE39C4345F
	for <linux-mediatek@archiver.kernel.org>; Thu, 18 Apr 2024 09:46:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=qHTQNdaixaJmXmKKuqa6bURMHudpKto3SJOTxQWsB1k=; b=MII64pR5w9PvlSDrcSThp+eZVt
	U/V0QiaB7I/UdxM20C8ZgdKGX8kaMcilf6mdrBUOGz1pKpV24mQITQ68HWtRpkkYkMeGMq7AMz/p3
	pt+tjiqREM/gPTzSRpIDBONRuwudVbUUpvbm6haSE4OQMrWbVQknieYxMzXbpYxh/f9nI8bQRZrjH
	2d9uykT5ElAwKvuUBKKeQximMXs9d6+mlY0rXKq2+0LNwOkqeoh0NCbLEEQmlpodN5EQ4myWRPdSs
	7CxnHwKyLpVDVAN3If/8PJFCcI7AMeJlK3rf4npu8QJY1DcGWqM8sjgbRPUpxKWNX2OWvAj+w2QQr
	1WUjNGyA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rxOLV-00000001giF-36Xe;
	Thu, 18 Apr 2024 09:46:21 +0000
Received: from mail-lf1-x12c.google.com ([2a00:1450:4864:20::12c])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rxOLR-00000001ggc-2ogx
	for linux-mediatek@lists.infradead.org;
	Thu, 18 Apr 2024 09:46:19 +0000
Received: by mail-lf1-x12c.google.com with SMTP id 2adb3069b0e04-518a56cdbcfso981488e87.2
        for <linux-mediatek@lists.infradead.org>; Thu, 18 Apr 2024 02:46:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1713433574; x=1714038374; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=qHTQNdaixaJmXmKKuqa6bURMHudpKto3SJOTxQWsB1k=;
        b=mi0INDg/a4Vg8G+ZqhWcM6bY0hmwVgK9Jkl8hpx/pzWKVKCrst+tycitBK3zAiPweg
         ELSJrkaFYNxUkfQYdp61DO7oplvOgfjVsPiSsuVItuzAV7l+Mo93nudNRU+kLA3Ppi4j
         Z6S0o0KlpFVUfc7b9qcJmN3Sou5cWCRn+cL2fzQEeIdfGW9A0/JsXx3M+Gk/EZ2/kV4O
         dKLrrsFRjqB+hBG5AGgmvMe0g5tqEhSUn6RkJi+l2AnjWr1DhNYHEeVmHJEwq9sf+bNE
         8cIy2liyj2NP+RTBVkXPV0sKkP1Ml73aMStG5OyAcN2tyhvEBPDMMplfO8Bm0tIy5yOY
         YlZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713433574; x=1714038374;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=qHTQNdaixaJmXmKKuqa6bURMHudpKto3SJOTxQWsB1k=;
        b=GVIn3xuyQtusTgdm9RPJg5ifD/RTdqlwQv6lBKGr70zw64/yq8clr8qNvV/RKPnEzq
         zjJI8E9hVEVIfzK3LgoLyOHazoqzMwsFowhlZHGEL/BO3sXYMvyta22bLn4xl6n8sWGW
         rk+I68qSWznaNnYJ/n+TkR/kO7jQ+/uStaT8xNCjMCxTjEgKCUU02EHZc0EQXisO/tA9
         TQGM+USB/eyW6HAekozqniVY0y09eqCgcAowCN3z/Z89u9bVyypG9aEjdv8Puv99MphU
         92gmy8MEDSEQWYqNI2G3eJrAz2BgZyYRTj4at7MQ2BIDwJeXFMKjSVdkMnWakJj6JJkI
         zPAg==
X-Forwarded-Encrypted: i=1; AJvYcCX+hijl++/Rv9SFbMBGkVZlr0c39SQXIxnv10HHX/vQouiafpJoKpCWANWKGnGzR4va2bonoaDDiVzwCK5X5pAqRuzZSTA9a6J9KFk2+DpVKEED
X-Gm-Message-State: AOJu0YwPqbveBMwjIh0kYN8hBV4uSfusSBKrDuVGOsMla+XNEabghEV7
	NpoyE3ygaLSzXDk/OoV/3+RtxDFawPDOylsgL7Y5GEiZD7iz6rBDGAniHio5p1s=
X-Google-Smtp-Source: AGHT+IFKKdpyMPlE5wECrwePw/LL4UVvAqkEhlLOtaK+0nLQSsDUk8IMg3W91iM2KaJpK31eRkk28Q==
X-Received: by 2002:a05:6512:ea5:b0:518:e7ed:3c7c with SMTP id bi37-20020a0565120ea500b00518e7ed3c7cmr1799688lfb.14.1713433573769;
        Thu, 18 Apr 2024 02:46:13 -0700 (PDT)
Received: from [192.168.1.172] ([93.5.22.158])
        by smtp.gmail.com with ESMTPSA id q10-20020a170906388a00b00a46aba003eesm647759ejd.215.2024.04.18.02.46.12
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 18 Apr 2024 02:46:13 -0700 (PDT)
Message-ID: <286945bc-f207-4373-9589-0a9b62df1b36@baylibre.com>
Date: Thu, 18 Apr 2024 11:46:11 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 12/18] dt-bindings: pwm: mediatek,pwm-disp: add
 compatible for mt8365 SoC
To: =?UTF-8?Q?Uwe_Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
Cc: Chun-Kuang Hu <chunkuang.hu@kernel.org>,
 Philipp Zabel <p.zabel@pengutronix.de>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>, Matthias Brugger
 <matthias.bgg@gmail.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Jitao Shi <jitao.shi@mediatek.com>, CK Hu <ck.hu@mediatek.com>,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd
 <sboyd@kernel.org>, Catalin Marinas <catalin.marinas@arm.com>,
 Will Deacon <will@kernel.org>, dri-devel@lists.freedesktop.org,
 linux-mediatek@lists.infradead.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-pwm@vger.kernel.org, linux-clk@vger.kernel.org
References: <20231023-display-support-v2-0-33ce8864b227@baylibre.com>
 <20231023-display-support-v2-12-33ce8864b227@baylibre.com>
 <vasuzy7cf5x6p5rnrmdrk5z54oncu2yuutupf25h5fgd5y6fpl@mnkf67agw64g>
Content-Language: en-US
From: Alexandre Mergnat <amergnat@baylibre.com>
In-Reply-To: <vasuzy7cf5x6p5rnrmdrk5z54oncu2yuutupf25h5fgd5y6fpl@mnkf67agw64g>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240418_024617_715362_C3EF2790 
X-CRM114-Status: GOOD (  14.68  )
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

Hi Uwe

On 17/04/2024 10:06, Uwe Kleine-König wrote:
> Hello,
> 
> On Tue, Apr 16, 2024 at 05:53:13PM +0200, Alexandre Mergnat wrote:
>> Add a compatible string for MediaTek Genio 350 MT8365's display PWM
>> block: this is the same as MT8183.
>>
>> Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
>> Acked-by: Uwe Kleine-König <u.kleine-koenig@pengutronix.de>
>> Signed-off-by: Alexandre Mergnat <amergnat@baylibre.com>
> 
> I already asked in reply to v1 what the merge plan is here. There are
> changes in my pwm tree to the mediatek,pwm-disp binding already. I don't
> think they conflict with this patch, but maybe it's still easier to take
> this via pwm?!

Sorry, I though the merge strategy wasn't addressed to me because I'm not a maintainer.
It's fine for me to merge it in the PWM tree.
IMO, this change [1] shouldn't conflict with this patch.

Can you add the "Acked-by: Rob Herring (Arm) <robh@kernel.org>" please if you merge this version ?

Thanks for the review and help.

[1]: 
https://git.kernel.org/pub/scm/linux/kernel/git/ukleinek/linux.git/commit/Documentation/devicetree/bindings/pwm/mediatek,pwm-disp.yaml?h=pwm/for-next&id=fb7c3d8ba039df877886fd457538d8b24ca9c84b

-- 
Regards,
Alexandre

