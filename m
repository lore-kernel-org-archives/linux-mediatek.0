Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4693BC88E41
	for <linux-mediatek@archiver.kernel.org>; Fri, 11 Sep 2026 03:01:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=GgvtkYeJ7+6IrGYwWBRX0B9aKmCQvEgKBdWATeTAwDs=; b=WvSQCdDLM2g2m9SUii6C2j2VeT
	qAs79k71Kg7w4u9AntCgxaatxeTPTOXX6xrR79VKWCSGXzHrc+MlsYjoG/2CLQQJeG1PIbEJYCMoj
	FS4QizKfAM8bcgudTC/ScwmYdRuGjTgNi4isrWJyQIwTYwBdzC1QTuZLaAzDbEUaBEZWoXTZibDLA
	fP4HnL35yGW1lnXNL+pDJeQOmwFljy321tA2LcHVkyVkY/JYn3cAboJU8icI0lHZCnoTRQd9WF/Ik
	exWQcOdPrZlw83ypMVmQ0FQV9xSxbM70A5vjE5jaAYnYxp4ub5BT++rqGuGtdjBQKP9HP2ip+Pvc1
	xTAQOKAQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4rVa-0000000FkDI-0dDq;
	Fri, 11 Sep 2026 03:00:58 +0000
Received: from mail-pf1-x42c.google.com ([2607:f8b0:4864:20::42c])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4rVX-0000000FkCS-1iKS
	for linux-mediatek@lists.infradead.org;
	Fri, 11 Sep 2026 03:00:57 +0000
Received: by mail-pf1-x42c.google.com with SMTP id d2e1a72fcca58-86b32af25f6so399951b3a.2
        for <linux-mediatek@lists.infradead.org>; Thu, 10 Sep 2026 20:00:54 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1789095654; cv=none;
        d=google.com; s=arc-20260327;
        b=Di+B6bn9fPBgIqryWYk06NsiR1u7pVMvvKGWG0jjbjxMJigKS5ZlJDlT30mOUFTLzz
         geZZMdNk68eDYQpX9l7Jc70a59ZpdyKpszXk6KjJ2LrhhWRvbVVl2UcQy8qCliLvO1v4
         fKBvv2VWD5ppd4Y8Z1KDAdlB0aowXgjHHhfO7X2a7o1M5VgK70k1oKGhm/DXVCRXRceV
         Rbeh8faVl9vm42X4AwKVmwTi48WR451lmndIdwhoCSTkXBKt97mw94g5Ntd1DWjdVbzs
         DIMwgHJqTmSmtm0PCwUAnCX/Czhgb7EtZUiMNMb+3ikx1WFAe3cdcl3HLy0Ru8uzV4pp
         P0eA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=GgvtkYeJ7+6IrGYwWBRX0B9aKmCQvEgKBdWATeTAwDs=;
        fh=5rsYRIsvn+Lvyv3jRUg6SiHIxd3EXGBZlCzvyHPTgig=;
        b=suIZfHmpHGdzEHVyMWetOyXMXJ8x3/yUXHStiJGtlAwY1ti/qNwCXowcp8YG7diIa9
         wIZtmnLhZ7Q4w5so4CfQa//alOytcwNHcl6KAGPDiOn+rTnO4RFI0nWvCU/gqxrtdIIk
         pGIOJn3Y10v8e1Zes1w7rxLblrYv0BAXhJso/JHIomVg9DVYXogs3HOtwUn/jLVbDhL2
         QznDHXaln54dLdLgPeT8zw+JIIleQR0HqPDF0scRzzncimV4z6boZzT1+3lRIyeO/ihA
         n3S7+6EkFfdrF1dyQ1V8XQVRY9Y04FrLxN9e8CnTZsI48oPkK1AT5cHfNFe28d7pxZeR
         IQhw==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789095654; x=1789700454; darn=lists.infradead.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=GgvtkYeJ7+6IrGYwWBRX0B9aKmCQvEgKBdWATeTAwDs=;
        b=Alf6uNm4PM6p3A1D5giTn5epwxBlcS5cztzN4f37y2rr46n4RfV0GKpKGXsxrQkIWd
         cN2EmArxZfjgDppxzGImiWJBCJw2uvADCdPWLFztAg8MBpL4nju+2kn6yEjoPhb5McxB
         BTS5gjUqTNt6fExUudBSWNs7dPefoG9myC51laI9uFK3q4etT/jzXJY1iF5bWfJbtmjE
         pg9RPmQm3wJNIAciH9zjFck+y8CLQi+MUyNKicOQyccauGGE4S+ZkbNd8sIccq18ciPS
         l0dM7dTAiibcmamR3/lgjPOjl1NxVcOGDhEf6F+NzeZUvvxFAyKobnY/qAVXafNIxKzV
         cLfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789095654; x=1789700454;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=GgvtkYeJ7+6IrGYwWBRX0B9aKmCQvEgKBdWATeTAwDs=;
        b=IGG3S+L3Cyp6Nj0lvueq4A0SvNTOHkP0UCccF2ieyjYR6x7FdTe2a1ovmBfQJkbkkS
         i49Zop0SHzSWpzR5Cnvbkwqe+aVtKzH6c7+EPVC1mp4PXS0j8HNLpbxLlCqvgKSMrfhk
         wIZ6u7NKwOsXi6zeJnBS1oZg7owOUfBcpPbVkcKdvMpszT6wFijas6s6QpOBBgHHU+df
         nJnUL6UJkf7Qus0fP/WR797DG8bUDeDR06qRryqPWmj7gJZ0+bm8qIC8kztolHri7dfL
         6FjFDeBDgPkH8mb8386aAU8vIswqhF/nuAW2rf9uT7TpunDDLMyT1kw2vmJhIQvRTo+l
         GBtQ==
X-Forwarded-Encrypted: i=1; AKwUvBy3mDU6QKXsNqlv/EoRE4mCfB8rq5hU5M7tsGP4wB1+W+ayxz6pTrqmnBKjoKn68ZYDgOYBL8G+gmZ8dUzAQg==@lists.infradead.org
X-Gm-Message-State: AFuF++lDNehJc//gqSPVS0gDXw/FUI0lhGq72v2d+KNjwnca/hhnHCFI
	jFwDXstsRy/5uW/RStl9f/8dfmL+tpM18fKoPKgzLmri9oHScno4ZbcKpwchCEoIzisEQve1oXK
	glxFMYs18MrC8qnU7d18iGYp2Y7rVtbA=
X-Gm-Gg: AYBFou0S/o5Q3utH5iajfL5sELZqs5TcxcC8Mu5+WY+YQLjE/OI9AWxwOy3deevi49P
	rhEc+PYSF8yndkI/fCK7qDw+ly5Vd+ybJCX4lF6shgbinEw4Cr+MqD1kyEB4ny9fS6UYZSQr9aX
	TmBsDiskPm10QNM/yk3xH8nHFf7c8x/GnpVqU3gANvBsx0RgqR7jXice9plstaxswbfjngeXIWa
	1xPoaNCoAO2zEitHntBtaHXBRIowJjkqHM1CjMsUZ23DfN30BkO+yjQYlIwdJbiB7ORGvFoOnej
	it0riVs9G0DGp9OuwOBXfkGFn56kOxKlee4eLB1nUq0h9NQXNZRSJps96xPPWWDPnz8S/Mb4YD1
	+Kw55L/Kp0jnO9D0XkhC51mK0sgdNdN7+oM350cnMYSAqMXmhVgXivYGCn0IIvkFLuwk=
X-Received: by 2002:a05:6a00:3cd5:b0:857:72f8:dc99 with SMTP id
 d2e1a72fcca58-86b328e7f63mr3298126b3a.26.1789095651223; Thu, 10 Sep 2026
 20:00:51 -0700 (PDT)
MIME-Version: 1.0
References: <20260910114338.142682-1-phucduc.bui@gmail.com> <2a553332-735e-4372-8d75-2ed7d095bfc0@sirena.org.uk>
In-Reply-To: <2a553332-735e-4372-8d75-2ed7d095bfc0@sirena.org.uk>
From: Bui Duc Phuc <phucduc.bui@gmail.com>
Date: Fri, 11 Sep 2026 10:00:39 +0700
X-Gm-Features: AcwNN1WPfGjfjTJ3UBeJ1SZL5IZMV3aP3IQW-IHMbnVy8yqXjU0IzHMcAxwIYp0
Message-ID: <CAABR9nGdsKvay_3Cd_Lm0DjU6MiFL0zaC+ftpgQGaX3YtVe+DQ@mail.gmail.com>
Subject: Re: [PATCH 1/2] ASoC: mediatek: common: Propagate control and DAPM errors
To: Mark Brown <broonie@kernel.org>
Cc: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
	Liam Girdwood <lgirdwood@gmail.com>, Matthias Brugger <matthias.bgg@gmail.com>, 
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, 
	Cezary Rojewski <cezary.rojewski@intel.com>, Cyril Chao <Cyril.Chao@mediatek.com>, 
	Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>, Darren Ye <darren.ye@mediatek.com>, 
	linux-sound@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260910_200055_478757_74042FFC 
X-CRM114-Status: GOOD (  12.42  )
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

Hi Mark,

Thank you for your review.

>
> mt8365-afe-pcm.c has:
>
>     {"HW_GAIN1_IN_CH1", "CONNSYS_I2S_CH1", "Hostless FM DL"},
>
> missing a Switch from the control.  I suspect there's other errors; this
> really needs to be tested before it can be applied.  Given the general
> quality of the driver here and the lack of anything constructive we're
> doing with the errors changes like this have high risk and low reward
> unless we're actually running the code.

I agree that these changes should ideally be tested on real hardware.
Unfortunately, I don't currently have any MTK boards available for
testing.

If these changes cannot be properly tested, I'm also fine with
dropping this patch.

On a related note: do MediaTek or other hardware vendors typically
provide development boards to independent upstream contributors for
testing purposes? It would make it much easier for contributors like
me to properly validate changes like this one.

Best regards,
Phuc

