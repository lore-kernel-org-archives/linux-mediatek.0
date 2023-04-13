Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 04C88C77B6F
	for <linux-mediatek@archiver.kernel.org>; Thu, 13 Apr 2023 13:06:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=THCBAFRMcXe9zpyJC9Q8PtfBGHTK+dcgnrUK69wvLYY=; b=MLeoBvUOqmMVwzdB5LKtWz0Xhf
	fS5VG8LBI0th9CpbyHQ+kSjYM/8ECwCeIltZP/la96coL3D4TrnX5Q6iAryIPcVSav6CheHYQpC04
	1mUkkfvLi6JMO+hZENcMeA1Ph1rKezlHTT3Y4EKBHrfi66WuJOvH9H2h/ocK+w/Tkz8BYuvciBcpk
	UIbTx+8pgAFdO+N3I4gyw4IKvvpt3D4zhpYtsZ1gpsvjHog7PXQFiRD3bwsk9Kwn1ZjEz2pmKySHc
	p5tUZqntz1wC/12SVun+0mEhuaFPUypLJ5XK+O1B8Zx85tLEoE4ccoOsneTX0eyWahp6mUr9Ovs8I
	8hsDyNYw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pmweq-006CvW-0y;
	Thu, 13 Apr 2023 13:06:36 +0000
Received: from mail-wr1-x42e.google.com ([2a00:1450:4864:20::42e])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pmwem-006Cu5-1d
	for linux-mediatek@lists.infradead.org;
	Thu, 13 Apr 2023 13:06:33 +0000
Received: by mail-wr1-x42e.google.com with SMTP id v27so4973928wra.13
        for <linux-mediatek@lists.infradead.org>; Thu, 13 Apr 2023 06:06:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20221208.gappssmtp.com; s=20221208; t=1681391187; x=1683983187;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=THCBAFRMcXe9zpyJC9Q8PtfBGHTK+dcgnrUK69wvLYY=;
        b=qLFVUy6NlUX9Ba60wSk1wWE3TDQdKaK3W3T1Wg2aeN5q5KebQPT4240XIBJ/sfygOZ
         MvSb9gIjaYgqi+yijRN/1v8/5HkOg6dTeWeXADKL1zugJu2kSwlnUFwQWUsEiIIL9xaI
         AmFZTZeC8v04x1IEuiGvOL8iZiiP40Tq1gfOQExFneF6povFX5d4b/Zqsi41MJlbEtty
         8XAI7lzHT5i872DDJLxsoD32zTjiZ8tZIEiZqDgFBfRmEBj9u0fbWJqIMlR96D/ZiH/n
         CrZLmHYZbaCaf/OBE2nccSfm8kaTM2pnkwewOGNPF0yIuV0Q3f7niNBQR2NjFSyIAZF0
         VE6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1681391187; x=1683983187;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=THCBAFRMcXe9zpyJC9Q8PtfBGHTK+dcgnrUK69wvLYY=;
        b=Rn1j4cpdG12Jcsv/uy4EIPGR4nhp3xQzfpD6EJy3/yYnPVvpuEP3cHIrczW1Io+K9G
         epKvOWL1mgr4sCz9XtDyi0ZhzyOEum+z2/htFeesIEFVJ//9dcmEqJg0JAFz1cX+tAm4
         vA44iN2U+YjoMw1nmUbjqLxF4dFcy5md3yIsP3l68uiSl4yX6yDllct0+ikUBXp5Bvy+
         CX3db7i9RPhFURVl+kt288PtdnePTtTwv/eDraCx2kUnxWXEGCbeZ99oc1m0x8zeDWYX
         iL1QxVLwCb83cVMNUwMUJ22bMIa+Qq6JE84FCTC+aKna6ZFgdEKcoEATZ5hXYd9TRrv2
         QmRQ==
X-Gm-Message-State: AAQBX9d28b1Th+FcE0AwUW53zFazwWnhu6QBealJud2XMHemsJg9o4Tw
	VyLNsSaovOsbIgQr+LDSsr0/jg==
X-Google-Smtp-Source: AKy350ZKJm0iav7HvUz7GTFakJ+tdrOILRQV0JiioSu+p4JJYjdTdnwsKypDNL7X7cITAJ2227b7Cw==
X-Received: by 2002:a5d:6a11:0:b0:2cf:ea3a:2b9e with SMTP id m17-20020a5d6a11000000b002cfea3a2b9emr1570627wru.43.1681391187453;
        Thu, 13 Apr 2023 06:06:27 -0700 (PDT)
Received: from [10.1.3.59] (laubervilliers-658-1-213-31.w90-63.abo.wanadoo.fr. [90.63.244.31])
        by smtp.gmail.com with ESMTPSA id r12-20020adff10c000000b002cfe685bfd6sm1255020wro.108.2023.04.13.06.06.26
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 13 Apr 2023 06:06:27 -0700 (PDT)
Message-ID: <3ebf7c2b-f9fb-6c1c-308b-47f28ba04ead@baylibre.com>
Date: Thu, 13 Apr 2023 15:06:25 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: [PATCH v2 4/7] leds: leds-mt6323: Open code and drop
 MT6323_CAL_HW_DUTY macro
Content-Language: en-US
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 pavel@ucw.cz
Cc: lee@kernel.org, sean.wang@mediatek.com, robh+dt@kernel.org,
 krzysztof.kozlowski+dt@linaro.org, matthias.bgg@gmail.com,
 linux-leds@vger.kernel.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 linux-kernel@vger.kernel.org, kernel@collabora.com
References: <20230412153310.241046-1-angelogioacchino.delregno@collabora.com>
 <20230412153310.241046-5-angelogioacchino.delregno@collabora.com>
From: Alexandre Mergnat <amergnat@baylibre.com>
In-Reply-To: <20230412153310.241046-5-angelogioacchino.delregno@collabora.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230413_060632_541667_B55B4409 
X-CRM114-Status: UNSURE (   8.59  )
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

On 12/04/2023 17:33, AngeloGioacchino Del Regno wrote:
> There is only one instance of using this macro and it's anyway not
> simplifying the flow, or increasing the readability of this driver.
> 
> Drop this macro by open coding it in mt6323_led_set_blink().
> 
> No functional changes.
> 
> Signed-off-by: AngeloGioacchino Del Regno<angelogioacchino.delregno@collabora.com>

Reviewed-by: Alexandre Mergnat <amergnat@baylibre.com>

-- 
Regards,
Alexandre


