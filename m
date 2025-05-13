Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7770CC3ABCC
	for <linux-mediatek@archiver.kernel.org>; Tue, 13 May 2025 14:30:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/NWh098gqRLftvvY4dIkjtdvgIAwUVSrP7NdWik+NTk=; b=aFRJgntDvP6YVVPnCfWsgNkoqd
	RbGi7+PsBOyE8NRuzo9lq+fPIfFNrrWNY/AiA12GXHGwFGVYOF0ztZjb6eCH94Q8jNY5easjuYa1h
	gmIDzSIJ8/aFrEXgy6Xb7Lp2+QyStggtjssctkTQRYMTeo9csO4j7hE1g2K1vcOSWcrB84VmO+slV
	f3aaoH+OWgBIIceBeRb8CMgEQawJ+t+w91/hP6w7spBowLTW6feCjtM1H08SOmCz/cp5GGfmTOl8c
	HdOmtj852np+POOaY52BXyefHTj+eGZWVD2V7PEg2ou1GRAyt1TgU/pvb9mMILll7b/h6494z7MXj
	4+pL5JYg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uEqe0-0000000Cc7Y-0qk8;
	Tue, 13 May 2025 14:30:08 +0000
Received: from mail-wm1-x333.google.com ([2a00:1450:4864:20::333])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uEqYx-0000000CbRy-2hMa
	for linux-mediatek@lists.infradead.org;
	Tue, 13 May 2025 14:24:56 +0000
Received: by mail-wm1-x333.google.com with SMTP id 5b1f17b1804b1-441c99459e9so38472585e9.3
        for <linux-mediatek@lists.infradead.org>; Tue, 13 May 2025 07:24:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1747146294; x=1747751094; darn=lists.infradead.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=/NWh098gqRLftvvY4dIkjtdvgIAwUVSrP7NdWik+NTk=;
        b=cM/7pIvjXzpY4fFZZ9QHV8u0ktzZtvybpwn6VgGTmW+igSefSfXtOnQ3YYmsL7wIDZ
         Vvvx8fCvziwjlhXj64E/flN/tJx2FLRe7fdZOc2O5Yua+HsGW8biuSf/pCNLFtQwATeR
         pTHHpp/fbbCINN/gCoARdpSCFkAk/+8I3D2o2fJwRRiaoXiwfiV9YsBL8T5WxujI+x0w
         ZSS3wWYIVsU2pbSrkv6/V+ya/D5O34cE9UNOjPjwSQlJxb2B6YYdXPqubM2aED84WE54
         NmjnlANMJif4LcmKp5mYdNz2c8nF+XzBEy821yYj0wWXWI/IGWEy2HocOLwc47uhkhKn
         fxIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747146294; x=1747751094;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=/NWh098gqRLftvvY4dIkjtdvgIAwUVSrP7NdWik+NTk=;
        b=vf/fVxZp3fkUD6KcGKJ3eFXXewsdP2cIJeORAe55ziYC8RFsjhctfKDPP7mLFodca9
         LDEVgrvQbvtfpA4eH71J2MHb5ghhnbt1WVFYqmNMV97YLXWN66OAkDCbARxbuahQ+J07
         4FnNxhlXCxXnGCJT9IixBJwqHsSoTK+dQWgDJd6V9XR2fPuGvHTbVbTBWQK8zqYdFUAs
         tVrJVG3TZhiZYdGwpBn/V1DRMq29UI6SARjZ1UqNl1gmBQgqh3qXvjnsMUUGPX36QU3q
         fLtPPpj6YqJSzeEBOomXuiAfX+VPb7M+/Z2uVFWu+Q1zgWjPPG1K7wdDjngtGPi2Seq2
         RutQ==
X-Forwarded-Encrypted: i=1; AJvYcCVqAWCpKhQFVz31MtgMeh7ztB3R//3bKjPIxoXZ6MwnCVSLakNYsqC7+q829hi4+tba+FOK6zzsV2NeBbwXTw==@lists.infradead.org
X-Gm-Message-State: AOJu0YyMBpE4/7eaGoNlYTmcPGnwozo7bVlvlzsqMQhsBOCNdS1feWcr
	Vg7frfuZus9uuuPpQpnA4FK3vzEowtpo+zGG5MdbsvnWdI9/Rmf4pGGgBbVAtuZTuzXL5Gqwk8G
	Ox8kDTw==
X-Gm-Gg: ASbGncvW7ldY9PL/yThNp+bXaZcU0SdtF6CQ1KCEfmFAgvI0VnN6hnS7+AMl5aec9mh
	PBk4HdeFx98oQoGrlKlClYqRHaoNMoGWnBvr9sRyDjwAnUlIGNaezW2yk8Btv8wbq0DcxA+U+r6
	oeIe46VBFwvfnexkr5XPVaPKhzgEQz/GCoBEW+hK4bIB5OzueSNe2o7G9BPqIJHutNbAJrD2pq4
	wn5iTWaf2G6srL5LujKi4OKtLZOnknTeZlbkf2x+ATKe/vp19ncJ7Tt+Hb3bXDULFOhQZnVzB8J
	fqOuyYG8uPhAtKK2Bg9oZrfc6ilpolXfBtV3gkjFb9QKeFT2hig2+T6dQOp2QLj3O5NES5v/aVU
	c2JVvGaF9Dlbbxg==
X-Google-Smtp-Source: AGHT+IHHlX9t4nfJ+7hHMCJoNaC1yXBW+lGGwra9RnsLEfJITmGfdfvMv/X1F4SEEmKSiUDfR77dIg==
X-Received: by 2002:a05:600c:4e44:b0:439:8c80:6af4 with SMTP id 5b1f17b1804b1-442d6d6b603mr171874205e9.19.1747146293972;
        Tue, 13 May 2025 07:24:53 -0700 (PDT)
Received: from mai.linaro.org (146725694.box.freepro.com. [130.180.211.218])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-442ed666dc7sm23697575e9.18.2025.05.13.07.24.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 May 2025 07:24:53 -0700 (PDT)
Date: Tue, 13 May 2025 16:24:51 +0200
From: Daniel Lezcano <daniel.lezcano@linaro.org>
To: Caleb James DeLisle <cjd@cjdns.fr>
Cc: linux-mips@vger.kernel.org, tglx@linutronix.de, robh@kernel.org,
	krzk+dt@kernel.org, conor+dt@kernel.org, tsbogend@alpha.franken.de,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	benjamin.larsson@genexis.eu, linux-mediatek@lists.infradead.org
Subject: Re: [PATCH v5 0/7] Add EcoNet EN751221 MIPS platform support
Message-ID: <aCNWM5Xq7wnHVCrc@mai.linaro.org>
References: <20250507134500.390547-1-cjd@cjdns.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250507134500.390547-1-cjd@cjdns.fr>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250513_072455_684957_991FAD70 
X-CRM114-Status: GOOD (  12.87  )
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

On Wed, May 07, 2025 at 01:44:53PM +0000, Caleb James DeLisle wrote:
> EcoNet MIPS SoCs are big endian machines based on 34Kc and 1004Kc
> processors. They are found in xDSL and xPON modems, and contain PCM
> (VoIP), Ethernet, USB, GPIO, I2C, SPI (Flash), UART, and PCIe.
> 
> The EcoNet MIPS SoCs are divided broadly into two families, the
> EN751221 family based on the 34Kc, and the EN751627 family based on
> the 1004Kc. Individual SoCs within a family are very similar, only
> with different peripherals.
> 
> This patchset adds basic "boots to a console" support for the EN751221
> family and adds SmartFiber XP8421-B, a low cost commercially available
> board that is useful for testing and development.
> 
> Note that Airoha (AN7523, AN7581) is similar to EcoNet in terms of
> peripherals, and for historical reasons Airoha chips are sometimes
> referred to with the EN75xx prefix. However this is a different
> platform because Airoha chips are ARM based.
> 
> This patchset is against mips-next.
> 
> v4 -> v5
> * 2/7 clocksource/drivers: Add EcoNet Timer HPT driver:
>   * Improve explanation of HPT timer in changelog
>   * Move pr_info to pr_debug per recommendation
>   * Remove pointless debug on spurious interrupt
>   * Small code-style change

Shall I pick the clocksource + bindings changes through my tree ?

-- 

 <http://www.linaro.org/> Linaro.org │ Open source software for ARM SoCs

Follow Linaro:  <http://www.facebook.com/pages/Linaro> Facebook |
<http://twitter.com/#!/linaroorg> Twitter |
<http://www.linaro.org/linaro-blog/> Blog

