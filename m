Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 999D5C021BC
	for <linux-mediatek@archiver.kernel.org>; Tue, 25 Feb 2025 09:37:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=S591plOfEwfaOHN3Xnpi7xyHchggR3YCpZ+xHYAC31Y=; b=Z8Z6yDxIy+sBoKvOvz7p8xx1kg
	jnbaEwkx1kT5F+hXR00hEqk+awJwqy800RFNY4FdpRtv33KGh+XSicILas14KAOO73KYbf7mCXVeg
	DGq1yq0p4XsxOvivJfP6Q5x5lcF66kmQUUk8wOw36SuDbG1fDbgPcXWq2os8Lx1whI5milMNQGtoU
	7XX65YnzU+czdQRjqDGpOjJCIM+a31eKi1FKL1qg7r9lp8uWxz0hDjoNy6rbpXgHusuEuWHCSig63
	yvLIbAI8BJtT0J8y54CKGv0ESWdB/B03tlfmttBZiMYdq+amyYF/gO9QVQcJdR8fvQfRs75mcRJH9
	zHpWjlMw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tmrNi-0000000GcKq-2xzI;
	Tue, 25 Feb 2025 09:37:38 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tmqsh-0000000GVZg-2shb
	for linux-mediatek@lists.infradead.org;
	Tue, 25 Feb 2025 09:05:38 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1740474333;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=S591plOfEwfaOHN3Xnpi7xyHchggR3YCpZ+xHYAC31Y=;
	b=JBZICcGtgIaGT2NEayXsTfcbb9ZtlutP8JW/GpdJNce9O/ThZc4x+XuW9jxYBz3gryB8J1
	MoOt1MMVM1C1cwzpzFiXP8Il2QqJK7/WUCus26nkT28sdXEE8V7oHDsB1Hq0vH5wMvHO2E
	q9snZt+Ayh5ExzIv+AlghkzjVSzca8U=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-121-ELR9J8E2Mbm1tRqyCIlOsQ-1; Tue, 25 Feb 2025 04:05:30 -0500
X-MC-Unique: ELR9J8E2Mbm1tRqyCIlOsQ-1
X-Mimecast-MFC-AGG-ID: ELR9J8E2Mbm1tRqyCIlOsQ_1740474330
Received: by mail-wr1-f71.google.com with SMTP id ffacd0b85a97d-38f2f438fb6so6519454f8f.1
        for <linux-mediatek@lists.infradead.org>; Tue, 25 Feb 2025 01:05:30 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740474330; x=1741079130;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=S591plOfEwfaOHN3Xnpi7xyHchggR3YCpZ+xHYAC31Y=;
        b=rcCaTE+Z2hYqipBsG64OtAgcHSwq4CcMuP21aJ0SGc1Uzwr6EhGB9Fhd9W5tYRKjSK
         UJnsFxWUorhffKZF/KFPB6goIWgpbfzPQGPRNhUmWL2P3npSLJKh/ouq5U0AMfZF7Jia
         j1xRJ6OzzfDjhC9s4f8MEfWzqFIL/fzEuoDdYXn9zhJCjlCIXafcz0yWP5ByEB1rD2QD
         n2LPGRADf5pLukqB1fAsG2GBzLwkvccsjaLU7m93G/hbMGzp4fW8RmN8LQpIIHJqCMhp
         D++iv34bIFX19M5q+nnD+hN9fYhbmEOdrFBwnGpKbqMKMc66XwnO6xAAGD06Mb8tjeTz
         N3OQ==
X-Forwarded-Encrypted: i=1; AJvYcCWMDs9vrWtFqhBxmKlxbx24lp9CAxSASHr7n/mLxdaVntZA1XFiZUupTgBoKY9+xniZoMFYJnlK+HK481tgEg==@lists.infradead.org
X-Gm-Message-State: AOJu0Yz/T0PgI77vLx6LSBLWwAxHNG54ZUlJt6ugJ1OIYKezNYWYyqOH
	xCscAJdAI10obzFW1ztu86E2GlvCoYNk2sdQqWOKR8IIvjgDhHfDGYl90siWyh/UWtUgJHmmRPP
	c57XgQOMmgsR+4LL0HVLM556/O7Cr4RCZYNZb31phpp/SrqOPLZQHDjMzZ6p+BMpr3sMUHA==
X-Gm-Gg: ASbGncuLp3iXPPAy7voM23FUvp1sxriwKQYO7SkaAfUtotblQQ39dRX/v2+jGdvFAO6
	AuFYroKz/k7xUP7t6/ulS5pJmkUJsEaT86OtcbitQkDYBi5OOAyzsuGBMMqV9ak1Q5k6HnFgu4r
	R3k7om8qYNUAx8UHY5unMF1c9rnxa2zQarafr1gjr0RVBEBo+gUs4l6UBRhF/grvOOc4rEw6XWz
	yKPUCpDb8P8ROk2ZOcnkvGF1632/IsqIPD6P9Z+NFUIvpVGvZ3Cf3g0y7YfHmcJ2wWYrVX/7wYN
	SbNHahGwvC3x0XMyTwA0Qe1vCJaUs0U7CZl6c/BJ9KY=
X-Received: by 2002:a05:6000:1373:b0:38f:43c8:f766 with SMTP id ffacd0b85a97d-390cc60bb96mr1820184f8f.31.1740474329760;
        Tue, 25 Feb 2025 01:05:29 -0800 (PST)
X-Google-Smtp-Source: AGHT+IG2nbkYE5xIsvX6L4EeMqJ6/+oXvSP9U6WXPFvJdl0X9vmutLnfED9guiz2H/dEmk1Doe3+9w==
X-Received: by 2002:a05:6000:1373:b0:38f:43c8:f766 with SMTP id ffacd0b85a97d-390cc60bb96mr1820153f8f.31.1740474329454;
        Tue, 25 Feb 2025 01:05:29 -0800 (PST)
Received: from [192.168.88.253] (146-241-59-53.dyn.eolo.it. [146.241.59.53])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-390cd86cc26sm1620849f8f.30.2025.02.25.01.05.28
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 25 Feb 2025 01:05:29 -0800 (PST)
Message-ID: <0c50738e-2469-4404-8a9c-a5221c4412b7@redhat.com>
Date: Tue, 25 Feb 2025 10:05:27 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net-next 2/8] net: phy: move PHY package related code from
 phy.h to phy_package.c
To: Heiner Kallweit <hkallweit1@gmail.com>, Andrew Lunn <andrew@lunn.ch>
Cc: Russell King - ARM Linux <linux@armlinux.org.uk>,
 Jakub Kicinski <kuba@kernel.org>, Eric Dumazet <edumazet@google.com>,
 David Miller <davem@davemloft.net>, Daniel Golle <daniel@makrotopia.org>,
 Qingfang Deng <dqfext@gmail.com>, SkyLake Huang
 <SkyLake.Huang@mediatek.com>, Matthias Brugger <matthias.bgg@gmail.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Richard Cochran <richardcochran@gmail.com>,
 "netdev@vger.kernel.org" <netdev@vger.kernel.org>,
 "linux-arm-kernel@lists.infradead.org"
 <linux-arm-kernel@lists.infradead.org>, linux-mediatek@lists.infradead.org,
 linux-arm-msm@vger.kernel.org
References: <c02c50ab-da01-4cfa-af72-4bed109fa8e2@gmail.com>
 <ea0f203b-ee9a-4769-a27a-8dfa6a11ff01@gmail.com>
 <e8ced800-6ee3-4ee6-9b6c-228f04c15f41@lunn.ch>
 <944941ec-d897-4306-9cd8-e39de833749c@gmail.com>
From: Paolo Abeni <pabeni@redhat.com>
In-Reply-To: <944941ec-d897-4306-9cd8-e39de833749c@gmail.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: GCn2bgWHmoQ-V3Dpi72R-DavJPgADBZjzv9-kA72eNc_1740474330
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250225_010535_801246_43CCF432 
X-CRM114-Status: GOOD (  15.91  )
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

On 2/21/25 8:21 AM, Heiner Kallweit wrote:
> On 21.02.2025 02:56, Andrew Lunn wrote:
>> On Wed, Feb 19, 2025 at 10:03:50PM +0100, Heiner Kallweit wrote:
>>> Move PHY package related inline functions from phy.h to phy_package.c.
>>> While doing so remove locked versions phy_package_read() and
>>> phy_package_write() which have no user.
>>
>> What combination of builtin and modules have you tried? Code like this
>> is often in the header because we get linker errors in some
>> configurations. It might be worth checking the versions of the
>> original patches from Christian to see if there was such issues.
>>
> The PHY package functions are used by PHY drivers only, all of them
> have a Kconfig dependency on PHYLIB. I don't see a scenario where we
> could have the problem you're mentioning. But right, the PHY package
> function declarations are a candidate for a new header file not to
> be used outside drivers/net/phy.

IMHO it's easy that some corner case will pass unnoticed until some
build breakage is reported. I suggest to keep such functions in a
(private) header from the start.

Thanks,

Paolo


