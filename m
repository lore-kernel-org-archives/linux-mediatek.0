Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BD1D9D58067
	for <linux-mediatek@archiver.kernel.org>; Mon, 25 Nov 2024 11:32:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=QMIy+2ZGZlYbGjuPDyKFDMT/8RFkHAkPW/l+lHB1Ssg=; b=QOeZBk1TbISbcoc0qBEd/j23Iq
	NZR6v5+f21semMgdRwXBeB3FHtMvCBqJZX7Cd3eaFgLK6ouE/jGvw8XHHiEyIRcuEFy/Z+qkKfXJP
	B6vrxManTFDO1GMF1EWfsAr7/49ODTJKvTJxCKjrHp6cP0jxpyfpKuObnVbMTmTrVJ67HRqUMv9Ll
	UIsPCNrPLZ+m1J2BYGrdadBzRbvb9jEgVTTiNh6YZTZ9uyVPvjRUVj0oc8QzdJMT1N5QeJVJQQFiC
	RQeG8sktV5Jkqkli/szqCXO9veyzXBf8uksehrlxHqNg1XBzAktJngHW/vrbSEUWdwPlmpydRLCfh
	wy/t800Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tFXKF-00000007tzQ-3Ox9;
	Mon, 25 Nov 2024 11:32:19 +0000
Received: from mail-wm1-x331.google.com ([2a00:1450:4864:20::331])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tFXKD-00000007ty8-0M6q
	for linux-mediatek@lists.infradead.org;
	Mon, 25 Nov 2024 11:32:18 +0000
Received: by mail-wm1-x331.google.com with SMTP id 5b1f17b1804b1-43497839b80so12379975e9.2
        for <linux-mediatek@lists.infradead.org>; Mon, 25 Nov 2024 03:32:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1732534335; x=1733139135; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=QMIy+2ZGZlYbGjuPDyKFDMT/8RFkHAkPW/l+lHB1Ssg=;
        b=nqI+xPhtKhWBQjEroY4RClBhDefNQgmN83W0In6n++hBLxm8LpifQHfRVp41emC6Jw
         JmoDysGczJV3PbByYYVAL41fCF7X7KY+PnIA3p9Xc/ZB/9dy/AeXzkxKMZtE+Fddkmzu
         iobe/O+gFzuAzYgFEitQMJ+nKFTkyjuIz5C7qIkxCFH6CiDE49SLrUGrOriQZstIyaXI
         HtUTJk9Yl8WVBuOOhfZM3DafqkhfKSUzqHtrVe5Xz5puHfL+arE7KSyog+FuW7Ero9rd
         TcNiiOdA8O8C07ESMR60RpHp/XnVrbE+f8QD4+MF4y8jKxBWVhThWNrjxY6JamNK+UBQ
         HZlA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732534335; x=1733139135;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=QMIy+2ZGZlYbGjuPDyKFDMT/8RFkHAkPW/l+lHB1Ssg=;
        b=l1r0nV5XTXO5tNm3l7pVAo/KS3/aNN9KcXLnHYV3C93jYzsAQJrY7RZowUH/U2ElBu
         JE6dv+xvFrziK9GEPjf4zXPNBlAUUxBYlYvp8skGAnhqSVo4HwfZLAQNT2nr9tmD70An
         KvuFDsbK6vDQSMNVZYVJQwaTu3Bft/0qvO+ZBhty8+gIXobecw4o5YrAwU7GjKLn8U4/
         po1fV/o2oqbq98WPU+8Va3ZViA2eWGSaGDH8Knhnz+Ey194Do962Zbbk6BvCIz362CaF
         i8zzGxONNNVekKWSSUtmvlYPnwL8vLuluErXa3tVXANDdsunW5uJWc0VxutuNKumB8cZ
         zVlw==
X-Forwarded-Encrypted: i=1; AJvYcCWmu0W6t+5pV3c5hv4YBnsYl8Gp2dsipUlU/2uVMTd1iqb6gO4l48L6zYceHEIdvL490XBCjaIcpyu5Ho4Smw==@lists.infradead.org
X-Gm-Message-State: AOJu0Yw6EA6RAvptpiKM44e7W0Ou6rxPN+MojQQZPHqEhfO3qT0K3w63
	53D/fdsN/YIXWZT+6sJ83TZyK8W4qbf4L1EFaAsrXt4ITKAA4flg3zw6vG9Wmgw=
X-Gm-Gg: ASbGncsRP1pSzCs3aFeUm20nTIqQ27Mbf/konkAW7UEflkE9AjbWbknN92V+bQ3fnyC
	lcHxOaoKVcyNQhyS+YDH/SFxStLPgKMskSUL00PhQUZPcEHlovNj4RXa6RABTPSfw7QsiLF31fN
	lmRo/Nml5bIrqaAiOGnwd2ciGepX/N17URabSBS1YbgaXlpEui5gAJy9X1SG3R9gGuxw4GqnPkY
	TyTCurMT2mEHLOXcr0F+6I75ynoAiff7YWeJPAEz8IBmzOHt+vc0JX/jxWNpZLW1OKUbjSSQ2fg
	TWTsh3Ru0cOFgw==
X-Google-Smtp-Source: AGHT+IFS+7K0lEJaKeykwcJTAWzQZ4yXS8JJlRIPKoQmKX+XT9czJ5uZIfuXu4QgSvNX8SY83S/kkw==
X-Received: by 2002:a7b:c7da:0:b0:434:9499:9e87 with SMTP id 5b1f17b1804b1-4349499a073mr49405845e9.25.1732534335055;
        Mon, 25 Nov 2024 03:32:15 -0800 (PST)
Received: from [192.168.0.172] (88-127-185-239.subs.proxad.net. [88.127.185.239])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3825fbc3dfasm10487119f8f.76.2024.11.25.03.32.13
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 25 Nov 2024 03:32:14 -0800 (PST)
Message-ID: <dad2ecb7-e624-49c2-a7d5-0ff53b6a1686@baylibre.com>
Date: Mon, 25 Nov 2024 12:32:13 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 1/1] ASoc: mediatek: mt8365: Don't use "proxy" headers
To: Mark Brown <broonie@kernel.org>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: Nicolas Belin <nbelin@baylibre.com>, linux-sound@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, Liam Girdwood <lgirdwood@gmail.com>,
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
References: <20241031102725.2447711-1-andriy.shevchenko@linux.intel.com>
 <ZykbMlshvlwCaeGJ@smile.fi.intel.com>
 <d7bf7863-fd24-4f8e-8cd0-d84867a997bb@sirena.org.uk>
Content-Language: en-US
From: Alexandre Mergnat <amergnat@baylibre.com>
In-Reply-To: <d7bf7863-fd24-4f8e-8cd0-d84867a997bb@sirena.org.uk>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241125_033217_115567_3D056DF1 
X-CRM114-Status: UNSURE (   8.38  )
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

Hello Andy.

Actually, after test it, "linux/of_gpio.h" isn't needed at all anymore.

That mean all added include in this patch aren't required.


On 04/11/2024 22:12, Mark Brown wrote:
> On Mon, Nov 04, 2024 at 09:06:26PM +0200, Andy Shevchenko wrote:
>> On Thu, Oct 31, 2024 at 12:27:25PM +0200, Andy Shevchenko wrote:
>>> Update header inclusions to follow IWYU (Include What You Use)
>>> principle.
> 
>> Hmm... I think we are waiting for somebody to Ack / review this change?
> 
> Yes.

-- 
Regards,
Alexandre

