Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D6363C71133
	for <linux-mediatek@archiver.kernel.org>; Wed, 11 Jun 2025 16:14:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=3OhmJykF73g4g4DUewCzO19WAhssmAxRzm/neMwhoQQ=; b=oSwsmhmXpmyAHMvorzhPH+vzPs
	93+CyNobmCR9tln0FgtJw3ZwD1PnOrWOR6R4GPwl1XG7N0Mx8f7CyRXXe1jJcXB4dQQdinbxGASnr
	TF7I2WVU6VXh+mM19CHojhNH0UI0waMjng1pDcM2ckRmTlv3ZoqtT+oAtlpmUfqCSo2Kq78ZqSTlA
	FeFUGk418lxKbnt+I02JLdpC5ADMqLyacTe2u9tKCWnh1hl7DIbVq35nbKWI5aZhJMna2iUakM59h
	vZq4Qu2AJ8zWqz9mkyir4Cc9J1KpayALRH/PdioxJ07NXrTkobES9uZRuRYiQoi0wmLpXPmRReVwB
	gO6wOQwQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uPO5x-0000000AZO8-0pXS;
	Wed, 11 Jun 2025 16:14:33 +0000
Received: from mail-wm1-x32c.google.com ([2a00:1450:4864:20::32c])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uPL8N-00000009ulB-3wi5
	for linux-mediatek@lists.infradead.org;
	Wed, 11 Jun 2025 13:04:53 +0000
Received: by mail-wm1-x32c.google.com with SMTP id 5b1f17b1804b1-441ab63a415so69613785e9.3
        for <linux-mediatek@lists.infradead.org>; Wed, 11 Jun 2025 06:04:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1749647090; x=1750251890; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=3OhmJykF73g4g4DUewCzO19WAhssmAxRzm/neMwhoQQ=;
        b=ABj2TATG1QiA4FbLg4otifDW02s+NC+yCBKQONY7VHqx32jMaDUI7X+BR77tvGGdjM
         yx5vGDBVcD4ClDzPRsGTrR0YSBmH3t5WyONSBIE3sTOwAEM0gmUIOIR+ceyf8KGojCg0
         N5e780aL/8+ES+BIxAUGIqfbTp6kvoOlER56JLpjh8kKVdA9/tD5f68rSipZFG6AnD+E
         7r2I5+OTQZANxjBpoGAU2CODk+MbZ6t/zA9UgDUe3oXYnlnOkGB6lbXvfTBm1VrjGgos
         h5K/Fu8RoryqjlT7UWFQO6M6Pd7m6e0LnbA3uB8jCW1ZCVdD74Z2XhTnHUscU6/aV7/V
         pI9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749647090; x=1750251890;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=3OhmJykF73g4g4DUewCzO19WAhssmAxRzm/neMwhoQQ=;
        b=uWxyg6hsy43MhLFxAwuIdvzTAlXrE7UB/4p12+dKqzKsA2gMJGTC/VBs6PJcz9U2Li
         mapIYQyhKrxCWhHFJouciBOXX+leMWnTTGlSrw0qfXot5gthrdFl8xXYm8zkzDFrKd6v
         E+s24SSLwytFQ2BlOrzQlks8V3wh8VQhzfQ1si/IrAydmi2ssGgcl/cj7o0gBFLskXo4
         6o7EcLavUMCa3TOKUij5IElDkj9kRllHW59SiZLwEwFqIqqwxUAfXe6FmrY1Yw1Br/yc
         0IYK8BTYF9gWGlV/75zyG9WRQLaCB56C7RQ//pX0SiZ8MvsY5uVLvXzcNEtDDjjeNxAE
         9zJQ==
X-Forwarded-Encrypted: i=1; AJvYcCWCp3V0mpE16FovYt+BMxtPNy0lYzUPwpAdCuF92tiJePAp7o37Km/5uQIUC0MWhSC4mo/gm9YnyIxWa+KdwQ==@lists.infradead.org
X-Gm-Message-State: AOJu0YwXEM6msWINKi/+zgY6joRIZIh1zW3ahT3/OjRs/TFAdGOLFYI9
	/TXorbsUJweq1fZZcE1M+a0Rk/USBIc9K6HmI1XlfDCnus/VIsWxwtcmORmBujlxcF8=
X-Gm-Gg: ASbGncvLzFsZIfDrYe8cru7myxQOtXzWfptRZPvNkxH0f0dMMVcWpCLWvvVCWci1ifb
	4htsHpnwjHQ6AnGLUc3ou3pDkfXFt/TapUdW3PBqZ24OLQDvxJr+5fsMNJJveDFyIKn3DA1nms+
	c51cua8xbVoI6fdaKCrU4A2OPR9DA0HQM4Mn/VdvYu1Houg6UPiNDupTSa5ZT+nO+YH6JIz4VBt
	Ccqa/UH/+n9uGOrrNEW3FSLaQX/Ss2pwlhl02IzhcWRDuGAfP0ON4Mbnes97ZdtC9wMee9IjU0V
	yt0sFtnuF4RKyhr+umfCuZQukzKeJExuMMipB2nIpWhN/l94GaYHc012UaqsZkPmM+t2jAgbKM8
	T/VQQgFNbaLcVvinlYKM57od0QutbZ4IXv+qVanDI0lO4mg==
X-Google-Smtp-Source: AGHT+IFzkW8lPMC7tzTRiI6f7ckQa2Ooh8n8VNSW4sNQvkqTlYj+uMr4gzo2JsXa5wbaxyrrmtUcfg==
X-Received: by 2002:a05:6000:24c8:b0:3a4:d83a:eb4c with SMTP id ffacd0b85a97d-3a558a43cb0mr2754736f8f.57.1749647089644;
        Wed, 11 Jun 2025 06:04:49 -0700 (PDT)
Received: from [192.168.1.105] (92-184-112-57.mobile.fr.orangecustomers.net. [92.184.112.57])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a53244f516sm15211113f8f.74.2025.06.11.06.04.48
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 11 Jun 2025 06:04:49 -0700 (PDT)
Message-ID: <51e609a8-cea5-43be-9e4c-6790f7d40138@linaro.org>
Date: Wed, 11 Jun 2025 16:04:47 +0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] dmaengine: mediatek: Fix a flag reuse error in
 mtk_cqdma_tx_status()
To: Qiu-ji Chen <chenqiuji666@gmail.com>
Cc: sean.wang@mediatek.com, vkoul@kernel.org, matthias.bgg@gmail.com,
 angelogioacchino.delregno@collabora.com, dmaengine@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 linux-kernel@vger.kernel.org, baijiaju1990@gmail.com,
 stable@vger.kernel.org, kernel test robot <lkp@intel.com>
References: <20250606071709.4738-1-chenqiuji666@gmail.com>
 <ff77f70e-344d-4b8a-a27f-c8287d49339c@linaro.org>
 <CANgpojXWk1zvu32bMuGgkVGVNvPw+0NWmSUC62Sbc3WcUXAd3A@mail.gmail.com>
 <ca3ce8df-aa4f-4422-8455-29db2440d8d5@linaro.org>
 <CANgpojV51R5sKvowPiMk5MRAzJ3KZoti6mRXjD3Knfz6kk6+MA@mail.gmail.com>
Content-Language: en-US
From: Eugen Hristev <eugen.hristev@linaro.org>
In-Reply-To: <CANgpojV51R5sKvowPiMk5MRAzJ3KZoti6mRXjD3Knfz6kk6+MA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250611_060451_995079_9198CD4C 
X-CRM114-Status: GOOD (  14.25  )
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



On 6/6/25 20:48, Qiu-ji Chen wrote:
> Hello Eugen,
> 
> Thank you for discussing this with me!
> 
> In this specific code scenario, the lock acquisition order is strictly
> fixed (e.g., pc->lock is always acquired before vc->lock). This
> sequence is linear and won't interleave with other code paths in a
> conflicting nested pattern (e.g., the pc → vc sequence never coexists
> with a potential vc → pc sequence). Therefore, a standard spin_lock()
> is sufficient to safely prevent deadlocks, and explicitly declaring a
> nesting level via spin_lock_nested() is unnecessary.
> 
> Additionally, using spin_lock_nested() would require specifying an
> extra nesting subclass parameter. This adds unnecessary complexity to
> the code and could adversely affect maintainability for other
> developers working on it in the future.

Okay, this makes sense. Thanks for explaining

> 
> Best regards,
> Qiu-ji Chen
> 
>> On 6/6/25 12:14, Qiu-ji Chen wrote:
>>>> On 6/6/25 10:17, Qiu-ji Chen wrote:
>>>>> Fixed a flag reuse bug in the mtk_cqdma_tx_status() function.
>>>> If the first spin_lock_irqsave already saved the irq flags and disabled
>>>> them, would it be meaningful to actually use a simple spin_lock for the
>>>> second lock ? Or rather spin_lock_nested since there is a second nested
>>>> lock taken ?
>>>>
>>>> Eugen
>>>>
>>>
>>> Hello Eugen,
>>>
>>> Thanks for helpful suggestion. The modification has been submitted in
>>> patch v2 as discussed.
>>>
>>> Best regards,
>>> Qiu-ji Chen
>>
>> You are welcome, but in fact I suggested two alternatives. Any reason
>> you picked this one instead of the other ?


