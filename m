Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2D662C00140
	for <linux-mediatek@archiver.kernel.org>; Fri, 12 Aug 2022 10:57:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=mChUjQTtXHpc2A+QlFmH2j/MWN0EZMkc2lSHpOXeQrA=; b=riWDN9WAuq0FfnDZTTHWqn6Dtq
	sEzy3IopzG0McjCeuiWaVrZJdkUb6R+MEwxUj5XIRE8l0xXX8ysUSbrxZYByDoHXV81JvCjcMXGyk
	pUTfybO+4ofpumB/iqX0Lgqxxq1pFbNYk3ANK9S7VSiaBJ1tWTK5RBAr2+ZVymexR0twt7ku/sMKl
	uClEM8SGN3kV4WryXPtHuIBT4WN80qyHskyBMzmADf4DzAP7aN5K9LjqUbiXUh6Ofy+B1jPvii5te
	gBeg/dpg08nhS7I1/OHl8gJpTVLRH2VG6+MvUFJL4mBDhuX9FxeZfX8hVqsGpN4G+krJd8F13Ztwu
	/ihpuWZQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oMSLe-005M8P-Dn; Fri, 12 Aug 2022 10:57:02 +0000
Received: from mail-lf1-x12e.google.com ([2a00:1450:4864:20::12e])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oMSLa-005Lzc-V7
	for linux-mediatek@lists.infradead.org; Fri, 12 Aug 2022 10:57:00 +0000
Received: by mail-lf1-x12e.google.com with SMTP id u1so858614lfq.4
        for <linux-mediatek@lists.infradead.org>; Fri, 12 Aug 2022 03:56:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc;
        bh=mChUjQTtXHpc2A+QlFmH2j/MWN0EZMkc2lSHpOXeQrA=;
        b=Y9ftosvW+/lXOfo2DHn/iOKLY+DKnzGTJ/du2uR/xcqHW5eEuf/MhEfhmLloPHjwCO
         oBbJry4O8PjVfaJ5FODDfz5T+LNbcxuJs5Gd0cZfk1nKVp8go/D2FeOtJU+2sXQ3rJLv
         NDSu+WYXb0U/rhC1Ph+3m/FOizpJlCkHFVx5wsNrFRYQ3UkbZpmeNGHh8sIoAnLenkh+
         vndZxXrtL+c/XXlsiLfZSyuiYiQ0KKvZJLZJgwiuvEr8HjkHJSwgAJa2LemBKUlEWxtd
         xISOy5mUZ7ESoOE8vzF8bHvZ0mY+jnuLvpJC3CsD/hI21t4DKdjdnRBgIcmxkgPQcgQU
         a5IQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc;
        bh=mChUjQTtXHpc2A+QlFmH2j/MWN0EZMkc2lSHpOXeQrA=;
        b=lrnBlvCSQjr3MOnWk9IjD7FKmzOrBoxvPiRDRFKWW4BPAJe0sR9f6OsqX2UM4z9sfp
         pXksmMpdolBuHA/HxKG1pC8LPEpY/44/35wO+VvimKWnN6+FxZ80OaPBmc/Oe5HQ3Z5B
         hDTEJ6KiIReWVsUBx82QbsBy2Jn3RaD+Pdf+InKsq0KzIvVl++FasTICoTqzKhnmRVn8
         TLq4+LsewLw+6hHVlVdxmhQU1A6DLa4Id1WWaAfNXTge1ONqPrnB/GMbInZ4gjHodEzn
         gksfSSoMG2OfdUryJG9mOfhm+uitqdV39ffpyNQv7ZlgZX6uFRJM9Z1BqAMqVS/nNWK4
         TrAA==
X-Gm-Message-State: ACgBeo3b6Acl3kw0TLp6M6pjIweRX7Xetfgz+49TmJcgcmk9opaenqax
	53P/4xKygJMxKaAzgIjZoJQR6g==
X-Google-Smtp-Source: AA6agR4c+dqcuuneKDezG2XNuToIgmi+wQmcMT9vCnGaJvx1lSq90f0pUvfTgcx6kKuGrwL9SZQRYA==
X-Received: by 2002:a05:6512:3fa8:b0:48c:ffd1:625d with SMTP id x40-20020a0565123fa800b0048cffd1625dmr998883lfa.251.1660301817252;
        Fri, 12 Aug 2022 03:56:57 -0700 (PDT)
Received: from [192.168.1.39] ([83.146.140.105])
        by smtp.gmail.com with ESMTPSA id f7-20020a056512360700b0048b0f2dc35asm178317lfs.75.2022.08.12.03.56.52
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 12 Aug 2022 03:56:56 -0700 (PDT)
Message-ID: <3a26be5c-04c5-cd67-1154-dfd7d99fb5d0@linaro.org>
Date: Fri, 12 Aug 2022 13:56:50 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.12.0
Subject: Re: [PATCH v3 0/1] Mediatek MT6366 Regulator patch
Content-Language: en-US
To: Zhiyong Tao <zhiyong.tao@mediatek.com>, lee.jones@linaro.org,
 robh+dt@kernel.org, matthias.bgg@gmail.com, lgirdwood@gmail.com,
 broonie@kernel.org, eddie.huang@mediatek.com, a.zummo@towertech.it,
 alexandre.belloni@bootlin.com, fshao@chromium.org
Cc: sen.chu@mediatek.com, hui.liu@mediatek.com, allen-kh.cheng@mediatek.com,
 hsin-hsiung.wang@mediatek.com, sean.wang@mediatek.com,
 macpaul.lin@mediatek.com, wen.su@mediatek.com, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-rtc@vger.kernel.org,
 Project_Global_Chrome_Upstream_Group@mediatek.com,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org
References: <20220812092901.6429-1-zhiyong.tao@mediatek.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20220812092901.6429-1-zhiyong.tao@mediatek.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220812_035659_046079_9598C11B 
X-CRM114-Status: UNSURE (   6.85  )
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

On 12/08/2022 12:29, Zhiyong Tao wrote:
> Add mt6366 binding documentation
> 
> Changes in patch v3:
> 1)change patch title

Where is the driver?

Don't ignore feedback:
https://lore.kernel.org/all/YuJsDI8rqkHuysIT@sirena.org.uk/

Best regards,
Krzysztof

