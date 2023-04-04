Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C3429C761A6
	for <linux-mediatek@archiver.kernel.org>; Tue,  4 Apr 2023 16:48:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=oaSx5e17w+eQ0F1AcVamtGRazPQo+5R7R3fJynml9qc=; b=D8gqm57N4wpVPF79Jne/h8l4eJ
	KAuWDVO+GkHILnYxtSvSlI30qe8LXCcY4YHYTx+Q0B+wMXtxWfHfD4UCP8tCeMfm9CyLnx1HRCiNQ
	9bkIN0zCm0xs6AWPhEPZNLtMGljki3JpbywEjGsB0eCrw6Ncjs4Tbvttl1mt2NJcku+OJEmYrflOS
	2Bm33oKnx7q93vjUHc54TPXVMsmVvltpilXddWeNrVTgtRWog0ATRcafKrEoo0yl0QJrbUj8xOlm+
	80oP/iTlKyl6QjSgnmIrCMfdTBzos53QuDmi5hCtjlyGhr329WoMQH+Dzd5Oe1M/yhOHiCBh0zw+0
	7Ug05osw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pjjp7-002GSf-2I;
	Tue, 04 Apr 2023 16:47:57 +0000
Received: from mail-wr1-x42b.google.com ([2a00:1450:4864:20::42b])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pjjp4-002GRS-0c
	for linux-mediatek@lists.infradead.org;
	Tue, 04 Apr 2023 16:47:56 +0000
Received: by mail-wr1-x42b.google.com with SMTP id e18so33492631wra.9
        for <linux-mediatek@lists.infradead.org>; Tue, 04 Apr 2023 09:47:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20210112.gappssmtp.com; s=20210112; t=1680626872;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=oaSx5e17w+eQ0F1AcVamtGRazPQo+5R7R3fJynml9qc=;
        b=tXneM2QAmpdWlmTsBeLyjMu9Q84z6jecvcZAoyME6dDKBB2jydUY+P5ujDvC32T7+/
         eJY7OEJd2z+JSRf5f6iO8cSUl1fDdciHwnQrOvzfF3ZgE3nOIhSClDIEFRDEsUMq3aXz
         MuOQ+YXH1xiQk2p7rk2FjgYTJH3QD0Ale7JLzRF+yKdHAp26XgBtpjVFUcQ+yXDhtUBE
         n8rzQXqd1GqJupYRjonljWsrCRXXS/27vGYF0S4NORJ1HqkJCzoqHRtz6936GlCGLsRe
         Zrqkzchqxif7b2GAdPJuNzECRJjMXEUjJWC/TujfdJaZUz4IyFztSmBA/nUjJb8VuhRt
         RJLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680626872;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=oaSx5e17w+eQ0F1AcVamtGRazPQo+5R7R3fJynml9qc=;
        b=iK3jKejCYsMi8+KgkpcxgYsPGrnMemhlP/jZxVVvLk8AWnUwoN7naIEWpo7V7VRlp1
         65aK5zilze3mAzFs77XK+HgskUJfydzyDevqSnLtFZrsalSZkx9QLLI9yG7BCALeNTT0
         UFMN1iYiCWmpWl7py8Z4l+xw+Tn//0CBQraZZAfFbBhaMKBvNdxGNtfHiQXR/BxaGHOH
         EhSBL267wAvB9HFYMCE/YfaU6iah9SQDYdjD6F6Q2yyDbL9SEPNliXurdJZIrqQ9pmmc
         G/p67ETm7t4zBiH8CbgFhd3HO6mcai4S9hI0CiXO8k5df8afX5EGld/1Js4aFnPqwFWl
         GHDg==
X-Gm-Message-State: AAQBX9c1dcJIRJ9Q13asrIrClzK1EPyLldb/H5cfJ1wU2RJz2Zpz56OK
	3GwKnGCocQXi9x+8YzcFzLKjCQ==
X-Google-Smtp-Source: AKy350aJ5L9eW/Z1AJZ2Yf0nBavJ/tgFyF3nmBDpng8tle57odq3CevaTl03dHgs+C2a1jOqYBCw4g==
X-Received: by 2002:a5d:67cf:0:b0:2e6:3804:5be with SMTP id n15-20020a5d67cf000000b002e6380405bemr2262083wrw.59.1680626871679;
        Tue, 04 Apr 2023 09:47:51 -0700 (PDT)
Received: from [192.168.1.172] (158.22.5.93.rev.sfr.net. [93.5.22.158])
        by smtp.gmail.com with ESMTPSA id e2-20020a5d5002000000b002cfe0ab1246sm12718073wrt.20.2023.04.04.09.47.50
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 04 Apr 2023 09:47:51 -0700 (PDT)
Message-ID: <9f1e06a1-c954-1e20-8649-4f85515f0ece@baylibre.com>
Date: Tue, 4 Apr 2023 18:47:50 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Subject: Re: [PATCH v2 0/2] Cleanup Mediatek pinctrl device tree binding
Content-Language: en-US
To: Linus Walleij <linus.walleij@linaro.org>
Cc: Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Zhiyong Tao <zhiyong.tao@mediatek.com>,
 =?UTF-8?Q?Bernhard_Rosenkr=c3=a4nzer?= <bero@baylibre.com>,
 linux-gpio@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
References: <20230327-cleanup-pinctrl-binding-v2-0-f21fbcc3016e@baylibre.com>
 <CACRpkdYndXqTXrTakwv1mbvJBs-tG+pjOpLLCgS9crE0aBj0jA@mail.gmail.com>
From: Alexandre Mergnat <amergnat@baylibre.com>
In-Reply-To: <CACRpkdYndXqTXrTakwv1mbvJBs-tG+pjOpLLCgS9crE0aBj0jA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230404_094754_235834_D2480F70 
X-CRM114-Status: GOOD (  17.42  )
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

Hi Linus,

On 04/04/2023 15:56, Linus Walleij wrote:
> On Fri, Mar 31, 2023 at 7:39 PM Alexandre Mergnat <amergnat@baylibre.com> wrote:
>
>> Deprecate properties which shall not exist, leaked upstream from downstream
>> kernels, there's no reason to use them. Here the deprecated properties and
>> the generic properties which will replace them:
>>
>> - mediatek,drive-strength-adv => drive-strength-microamp
>> - mediatek,pull-up-adv        => bias-pull-up
>> - mediatek,pull-down-adv      => bias-pull-down
>>
>> Thanks AngeloGioacchino Del Regno to reported it. [1]
>>
>> [1]: https://lore.kernel.org/all/6e08d78f-ef4c-b228-f7d2-d63767ea87b8@collabora.com/
>>
>> Signed-off-by: Alexandre Mergnat <amergnat@baylibre.com>
>> ---
>> Changes in v2:
>> - Change the bias-pull enum values to match with other Mediatek SoC.
>>    That allows to use MTK generic define and be compliant with the MTK
>>    common pinctrl driver.
>> - Link to v1: https://lore.kernel.org/r/20230327-cleanup-pinctrl-binding-v1-0-b695e32e4f2e@baylibre.com
> These patches does not apply to my devel branch:
> https://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-pinctrl.git/log/?h=devel
>
> Can you please rebase and resend?
>
> If you have several conflicting patches that need to be applied to the
> pinctrl tree, then collect them all in a series so I can apply them all
> at once. Thanks!

It's done here: 
https://lore.kernel.org/all/20230327-cleanup-pinctrl-binding-v3-0-6f56d5c7a8de@baylibre.com/

I also added the patch which modify the pinctrl from the other serie:
https://lore.kernel.org/all/CACRpkdYSpMD-V0QNGwtiKCA4KAedYfmFpvdCHWhjST9uTricTg@mail.gmail.com/


Regards,
Alex



