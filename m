Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 69EC1C0015E
	for <linux-mediatek@archiver.kernel.org>; Tue, 15 Aug 2023 19:19:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=HP5r8l+N/G++84rGRD6TPetR/Ye7KhL9+cTCQpuI0nU=; b=TPUbZnxi5yvEopkkg6J9tfxqLd
	w2o0G3a5Ll3v4C8dd0Nkqk1gI0zsTMhKzvxzDyMAy5A0CISdJNlg1ougPfRcbKuA0PRN2+QNwAb30
	iRz2MTNiccVioe4OuuagSxCZsW1gAUzXgCJTi9Qi8touwePciXP+vRkQqUrfUfCaFLZTxeMjArLSz
	d7zjeG74Nz7ADgfTRhMWH4Qw8zuLbBU6DYL+pBefISP73ynRNzY6RbDHX0r5boEl83GzOy2tjKDD2
	BbuwvQxfKGxzXx+JtZtbR5AechjhvEjboX7rb4QQbj7bW2gigSpjXvCM55wnfrm0QM2Iwtv+0ibGV
	Emyk7jog==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qVzZy-002Inl-2r;
	Tue, 15 Aug 2023 19:19:46 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qVzZx-002InR-2H
	for linux-mediatek@bombadil.infradead.org;
	Tue, 15 Aug 2023 19:19:45 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=HP5r8l+N/G++84rGRD6TPetR/Ye7KhL9+cTCQpuI0nU=; b=cFNVG/Ywn30VGqGAORpcF2hl7P
	OSh7/VJnezRg3FnqmGuR7qlRmfjysCjvkrtwGGzmYvj5rEB25UplmlP8iwRguCf6QmLQgiJ62xYDa
	N93OaJf6G/q4TPQWwUxRF4xnCbwCdDgEjb3kXnMSY/E03LJGsP/6cvt75mKl5NU4a5k7pZoWP1LMU
	tZKu6awjXyn7bZbB6PECBVi2LWeH6QeIwM0UXKn+zN0Vf3vu61GwhLXDRhl4kazuVkR8qsYeOPqto
	5u+BYdXOGFZ1C8Itkr5jEYBC73LxB+Fu8mjvLXBG9ZfzIVKitJFV4hGJVIrjH8hhoXCejoqw3Tkfj
	evcWrsOA==;
Received: from mail-ej1-x632.google.com ([2a00:1450:4864:20::632])
	by desiato.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qVzZs-00C2cI-0a
	for linux-mediatek@lists.infradead.org;
	Tue, 15 Aug 2023 19:19:44 +0000
Received: by mail-ej1-x632.google.com with SMTP id a640c23a62f3a-99c1d03e124so708266966b.2
        for <linux-mediatek@lists.infradead.org>; Tue, 15 Aug 2023 12:19:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1692127177; x=1692731977;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=HP5r8l+N/G++84rGRD6TPetR/Ye7KhL9+cTCQpuI0nU=;
        b=lUhNrtoERba3aorZadoUgJp9sCu3IbGKVivMwNrWnTG0yELOzp3fLhGA5srP0IpIxm
         KBoGNzrF/crrZmebYELgHIEkxozcxxtEo3/rzUVJl78TFfL5q+sms/p0Ih6sWJ+yxmH0
         WmIOggw4UWG9gVNckTrS8LMy+qNRpFpYXwv9toqdR3AU/V2kkKYXc6ipFkHJi+GnN+YA
         3BOow5pnOGq74dIyo5z54P1Hbl7aOhsUNecfcx1JoHcYimBY7saJsaYLgWe7FBtoj7V3
         IkqlbQA1sRa6r/wQa1WAPvD9lQm9WsBzLRoXl7pXOnic75zxJubcIxMOafFzX2CF3F8z
         DkFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1692127177; x=1692731977;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=HP5r8l+N/G++84rGRD6TPetR/Ye7KhL9+cTCQpuI0nU=;
        b=KorRrsg00lU/FpapVilQyAeuwcoNJklWQ2SYHCSF4Cey3R1Q6AbhHoOaTJTCYu54QU
         oQ5yV/4P10TaldBB7artRpb2TGhQll6YJGiydn0sWhQVzwPOqXmiuocOAbKTKbDUayx4
         WiLFcX+ZKDFNmm/8ln0zT0hsbTr19LcxUWo6sqXye6FHxlxmlIiLrY/rnXHUjfraNhr6
         P9W/pv3GtIo/SXyLC6ZfYpnLxIbXjZoCSc2unnbjWUj890ZAKRD+U+HvYlxVtNTF8Ri2
         XvdpkEPL2j4yDMCmIoykGF3SiV1ukPNBIQKdw7usyXWQtrgbB783xdvvctaUpOmJA2wR
         263A==
X-Gm-Message-State: AOJu0YxALR67Ehh3foe06973azlX4n/sqDm6skOEyUkB1ySJiJ73051w
	yxdlLCAk2qEZySKLmPn8e/wbfA==
X-Google-Smtp-Source: AGHT+IEamhO+Jl+q7/ydr+FDFDZuF0BIJhDmzs5q+uIy0rMFYS3cNVnuKTzqQrGnKGFA2D7kUp1BAQ==
X-Received: by 2002:a17:906:2215:b0:99c:47a:8bd5 with SMTP id s21-20020a170906221500b0099c047a8bd5mr11216606ejs.65.1692127177101;
        Tue, 15 Aug 2023 12:19:37 -0700 (PDT)
Received: from [192.168.1.20] ([178.197.214.188])
        by smtp.gmail.com with ESMTPSA id ov10-20020a170906fc0a00b00993cc1242d4sm7360694ejb.151.2023.08.15.12.19.34
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 15 Aug 2023 12:19:36 -0700 (PDT)
Message-ID: <fb85c288-2ea9-3343-ff19-cd58940b44ec@linaro.org>
Date: Tue, 15 Aug 2023 21:19:34 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.14.0
Subject: Re: [PATCH 0/4] Add a property to override the quad mode
Content-Language: en-US
To: Hsin-Yi Wang <hsinyi@chromium.org>, Michael Walle <michael@walle.cc>
Cc: Tudor Ambarus <tudor.ambarus@linaro.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>, Matthias Brugger
 <matthias.bgg@gmail.com>, Bjorn Andersson <andersson@kernel.org>,
 Pratyush Yadav <pratyush@kernel.org>,
 "Miquel Raynal )" <miquel.raynal@bootlin.com>,
 "Richard Weinberger )" <richard@nod.at>,
 "Vignesh Raghavendra )" <vigneshr@ti.com>, Rob Herring <robh+dt@kernel.org>,
 linux-mtd@lists.infradead.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 cros-qcom-dts-watchers@chromium.org, Andy Gross <agross@kernel.org>,
 Konrad Dybcio <konrad.dybcio@linaro.org>
References: <20230815154412.713846-1-hsinyi@chromium.org>
 <202A0C36-D1F6-4BB4-BDEC-F36A76B757A2@walle.cc>
 <CAJMQK-iw7ikyHKPPC8+hnpXuRq-_nq_N+21BKgWxD2nx=vAeJA@mail.gmail.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <CAJMQK-iw7ikyHKPPC8+hnpXuRq-_nq_N+21BKgWxD2nx=vAeJA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230815_201940_487274_9D1787B5 
X-CRM114-Status: GOOD (  16.48  )
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

On 15/08/2023 19:21, Hsin-Yi Wang wrote:
> On Tue, Aug 15, 2023 at 11:59 PM Michael Walle <michael@walle.cc> wrote:
>>
>> Hi,
>>
>>> On gigadevice gd25lq64c, the quad mode is enabled after BFPT is parsed.
>>> According to datasheet[1], Quad enable (QE) bit needs to be set to 0 to
>>> use write protection (WP) pin. It also recommends setting default value of
>>> QE to 0 to avoid a potential short issue.
>>
>> So you are using either dual or single io mode. Why can't you use the device tree property spi-{tx,rx}-bus-width?
> 
> I tried setting spi-tx-bus-width and spi-rx-bus-width to either 0 or 1
> and WP still doesn't work.
> For this chip, quad_enable will be set to spi_nor_sr2_bit1_quad_enable
> (QER flag is BFPT_DWORD15_QER_SR2_BIT1_BUGGY)[1]
> 
> spi_nor_write_sr_and_check() calls
> spi_nor_write_16bit_sr_and_check()[2] and the function sets QE bit if
> quad_enable is not NULL.
> 
> [1] https://elixir.bootlin.com/linux/latest/source/drivers/mtd/spi-nor/sfdp.c#L575
> [2] https://elixir.bootlin.com/linux/latest/source/drivers/mtd/spi-nor/core.c#L879
> 
> Setting spi-{tx,rx}-bus-width still falls to this function and cases.

with tx/rx bus width = 2, how quad mode is still possible? IOW, why do
you need new property? You wrote here about driver, but I ask about
bindings.

Best regards,
Krzysztof


