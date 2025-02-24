Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AA9BAC021B5
	for <linux-mediatek@archiver.kernel.org>; Mon, 24 Feb 2025 13:20:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=k/zBjsZQTLhBnhqIaIhHUuRmEg89TnatJo/+jGRcKh4=; b=DzQ0W0m+SVgdGu3PEdBvImk2Mb
	Ebabkd+MWxApHH1YhuQCnxvdNLkEN9zIwsk0OwnicVdWIlm77EuTQ7R65ZtzxIP7CcoIWnmI+tHBi
	EcYFUoSXd2fp7Rjimgt5FWHj/itzpMW6RSvPIczGR2WYXTnJYRSh+jFvYaF1K9vioN7XvI8TW/wlq
	T46Z7PiSOhXSWeH+91cUQVxZ54qH8gsBFPrV9Yf2ik5e64cdwMtINczX11hkSqKB1HSVusIwWFV2L
	EH4pZHWVsrQgUCk/RqMq+sHOy5FCX48qMBslVJ2xBARDAmwLzDhozK11sHRcgRIxoVm5hmYWw+Ilj
	ne7drghA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tmYNV-0000000DrhP-3X8h;
	Mon, 24 Feb 2025 13:20:09 +0000
Received: from mail-pl1-x62f.google.com ([2607:f8b0:4864:20::62f])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tmYM1-0000000DraN-3Fnf
	for linux-mediatek@lists.infradead.org;
	Mon, 24 Feb 2025 13:18:39 +0000
Received: by mail-pl1-x62f.google.com with SMTP id d9443c01a7336-220e6028214so92857215ad.0
        for <linux-mediatek@lists.infradead.org>; Mon, 24 Feb 2025 05:18:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1740403117; x=1741007917; darn=lists.infradead.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=k/zBjsZQTLhBnhqIaIhHUuRmEg89TnatJo/+jGRcKh4=;
        b=JuSIrC1RlovKo6CsoYOOw9A9AWUuK54q+RcsgtRfF8kWskiLUmRraUouFJykRaHVod
         yyc66j5JmpZM8pFpJQmC7XRR5ov1cBj9OmDjwZveJXOcm3s9BKDPA8DdGJrq/h60x3ff
         HZ4DfinIoFSQ6YsOFej/8ZR0AurxZJgufeHLkafOgQMyqZqfbA68uSZ9F56xwvq8aGZg
         9I8fneoz2yIf4BO3KCie911hUrSEWeQes5LMFE0Vi1Ga7541FT8lMwheQctOuj6Lbdgo
         GcZcQkPZtQRJuTtUGh7VfohTAb4zN0vMK0n6JOgDE5thI5oUaXRu/O3Hwtd5MdMhasIr
         yFiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740403117; x=1741007917;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=k/zBjsZQTLhBnhqIaIhHUuRmEg89TnatJo/+jGRcKh4=;
        b=VH/v5sN+Q57gW1HSscCm71/y6FaCiphGLGjRl0/YCJubBW8nBthq10MSf9lInOk2fV
         N5R/CyC//Z+i0QT15Oxy2wRiM9MWBsvetemT/yUc/SJ5/wqN1uMuxMJs24ZotTM2m8jR
         JahpV1z8W5+7WTG2wF1BM/YgBjslsxU/CW5HZerctKoAFplnBvr+TD4iMnIvJGs1y7B7
         rLhwxZttV2lHpqZ3qMPlfrRP/XOlkCB0sSculBuuqxFWWjBy1hlzhdhg3FW9r4riuexs
         vtzLIDA5bRWVqFVJkVT+djn54F5JU7V1NzndZfDChgN6j6TIJZqWsbSzVjo580zh/Hig
         50JQ==
X-Forwarded-Encrypted: i=1; AJvYcCWSaSTTdVZRqc7cC7PyBMu82qyxSQDTVTqa6k7tizg4JA43Xj/cRV80kEb6ItPPw6B1twlZhX4SaWBvwqsdLg==@lists.infradead.org
X-Gm-Message-State: AOJu0YzeODA63ZtCnZCoBJLhPaIbOkPX6jV3mIRTD7r2kb+2VQeIFmJb
	Y66tlJtEqd0unDXqIn9E1kgQXTO4bTjHE+BWjXY18kQLEsai6RcDZR2jvwEI5Q==
X-Gm-Gg: ASbGnctGyx3Dv8Rf/+f0BrSiksX/VMiAnEmoo3JzTv3NkqbRDXtrnzHArN2ZAj19vAb
	hEA0Bz8bm6TzE1NCK82KgqCPKPclsBDjN3+P0ieBAwS7eLCGa2QKYVtYPDfPZ92JwKc2HMOQgJX
	sPL+SPxN/hxDRj1bXydbDTTheqDkoYiVxfDRnYbbj0SMNrdUZE/ERGlL7X5I5buhKuiFdltxQog
	CBLXiPnQyno0aMzNl/O+23kxO8Dt4cCyXtI7OKpefkE2EWl/AETUPUf6iFJuSeZKLn8HgDVXY0S
	eF2AyADt/K4ZMaA9djgYgJ9OOsBD0OFyTJdh
X-Google-Smtp-Source: AGHT+IGabpVbV+NHEQQXp8goqoKQe7jD7WPvleiiGHZZp7DZfPzcQ3EsMcTqWh3vQp+USwIPD1O+RA==
X-Received: by 2002:a05:6a21:7882:b0:1ee:cd18:d400 with SMTP id adf61e73a8af0-1eef3c883ecmr24664532637.11.1740403116989;
        Mon, 24 Feb 2025 05:18:36 -0800 (PST)
Received: from thinkpad ([36.255.17.202])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7325b03f169sm18621755b3a.63.2025.02.24.05.18.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 24 Feb 2025 05:18:36 -0800 (PST)
Date: Mon, 24 Feb 2025 18:48:31 +0530
From: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To: Lorenzo Bianconi <lorenzo@kernel.org>
Cc: Ryder Lee <ryder.lee@mediatek.com>,
	Jianjun Wang <jianjun.wang@mediatek.com>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kw@linux.com>,
	Rob Herring <robh@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	linux-pci@vger.kernel.org, linux-mediatek@lists.infradead.org,
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kwilczynski@kernel.org>
Subject: Re: [PATCH v3 2/2] PCI: mediatek-gen3: Configure PBUS_CSR registers
 for EN7581 SoC
Message-ID: <20250224131831.jqut4hpvv7tf7vzy@thinkpad>
References: <20250222-en7581-pcie-pbus-csr-v3-0-e0cca1f4d394@kernel.org>
 <20250222-en7581-pcie-pbus-csr-v3-2-e0cca1f4d394@kernel.org>
 <20250224055216.o23dzwimrghbr2ow@thinkpad>
 <Z7xEZPpWLQjTMnIz@lore-desk>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <Z7xEZPpWLQjTMnIz@lore-desk>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250224_051837_819961_19C98BA1 
X-CRM114-Status: GOOD (  16.45  )
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

On Mon, Feb 24, 2025 at 11:05:24AM +0100, Lorenzo Bianconi wrote:
> > On Sat, Feb 22, 2025 at 11:43:45AM +0100, Lorenzo Bianconi wrote:
> 
> [...]
> 
> > > +
> > > +	entry = resource_list_first_type(&host->windows, IORESOURCE_MEM);
> > > +	if (!entry)
> > > +		return -EINVAL;
> > 
> > -ENODEV or -ENOMEM
> 
> ack, I will fix it in v4
> 
> > 
> > > +
> > > +	addr = entry->res->start - entry->offset;
> > > +	err = regmap_write(pbus_regmap, args[0], lower_32_bits(addr));
> > > +	if (err)
> > 
> > MMIO write is not supposed to fail.
> 
> ack, I will fix it in v4
> 
> > 
> > > +		return err;
> > > +
> > > +	size = lower_32_bits(resource_size(entry->res));
> > > +	mask = size ? GENMASK(31, __fls(size)) : 0;
> > 
> > Size of MEM region could be 0?
> 
> I added this check since we consider just lower_32_bits().
> Do you think we should remove it?
> 

Yes please.

> > 
> > > +	err = regmap_write(pbus_regmap, args[1], mask);
> > > +	if (err)
> > 
> > MMIO write is not supposed to fail.
> 
> ack, I will fix it in v4
> 
> BTW I will remove your Reviwed-by tag since the patch has changed
> with respect to the one you added it. Please let me know if you
> prepfer to keep it.
> 

Sure, fine with me.

- Mani

-- 
மணிவண்ணன் சதாசிவம்

