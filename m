Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CF914C433F5
	for <linux-mediatek@archiver.kernel.org>; Wed,  4 May 2022 15:47:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=OtRncvJ2oHudDouKUnB0aQq30phlqNx1ZTxaK+BEJ8M=; b=hg+HnYMcEgPPgo
	uY4sAItL4l2q92LAq2gsBFo/HqM/zKdFpuBVQE93ylFSepqUWsYsUZ2sYFxookwVLqOpGFTOFlNJW
	3ACwyDsWc0XNjtnbklL11hRTMFRZ4/1okvtTebfR3bdgSSdNtAw/07c2UaQ0zqL60XLcPMbkPi6SH
	Ggm1hijDMelyddJQgy72SM6WC1As23bPm9evSA7WJwnriAbFXR8iFsNXXfadeU253aDpwrx7I846c
	woV8753qnmYadB0suF0hEvOpBW1MnaEQQd8HK2p2pZcKNSfp8dqk8jxaJ/adTZmlsTqREi7473tFJ
	YXAMqXyULwzcEpRENsOg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nmHDt-00BVKz-US; Wed, 04 May 2022 15:47:29 +0000
Received: from mail-ej1-x62f.google.com ([2a00:1450:4864:20::62f])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nmHDq-00BVJ9-NH; Wed, 04 May 2022 15:47:28 +0000
Received: by mail-ej1-x62f.google.com with SMTP id y3so3648828ejo.12;
 Wed, 04 May 2022 08:47:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=TqM11B6n/7I4zpUs+ecH9iPi5qiIZecTmzEvJnM7wU0=;
 b=bSkNvN6Pr0ZvSu4SsAwum52J8rN9eabMzdmB8P0U2GTCvGWXaPNftMyHxDWI3IGj70
 fBTwXRdfHaMCWAr4BbTw9WRr5DDhPiMcLvcQM3v6DsuPIXFLTQ3tE1vN1E0BTQCTfobz
 S/RfYHceQFtTiLLrMqXmZ7IvbrinJ6GAu2zaYMhzgKGQQADxcSvKZxpPhX2mPQKSpsdj
 XcfhBm4uB5VVfkzeVLrYD3azxjvH1JYgCLFWWrxAlhnyUYrD8KgDFtrs5KmIiGpPNkb3
 v6tvtHeOARnIGvXz18jMVC173P1pT6cuLuY+o5ORR7bVmCdAbAlqLN9Y+l4Csmh1AWJp
 kt7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=TqM11B6n/7I4zpUs+ecH9iPi5qiIZecTmzEvJnM7wU0=;
 b=Km+2LGqHcqXa/QkY07bCWS26Uc9FyJ3BIUMXM8gbhPpx27wUGzh5U2OcJBX4BnZ7Yu
 Wa8C/61j4RywOl5V+3z1X4GPLT195Zo6kYn0yhfwkn0MSHMP43NyYLaSRF8ITutSzFmg
 ltaahoXxugtTzq1FhW9xIPJsgV9GszAPd5CccZasXRM+s6QIwUoqmyjLItCTpkCa67t8
 EeuZwx+3W/eXdwQUMnVc381lQU9J7Ay0llWJ7G/7J8GGopZ3zw92T75UPXPn9x+mXt8X
 BSXVSHEsLl+lzKjIcPw7GX5/U5aCzZ7/Y3heWRJQWLLEfSa4U7MMlWNAE/qM2vff2n0m
 sk2A==
X-Gm-Message-State: AOAM530TcyOq/Y94Bj/PRmdWewsL0iz6YhTiA7GcNAASfW2k06yNINRk
 v20QQDQmRqCn7teM64fAt4Y=
X-Google-Smtp-Source: ABdhPJyGEcz4aR+WhVvTIsoabj98eWOZrMv6CT4IGXSZM1VRBB9wbW/hJn0VXJoJH/dyxMRBM4lC1Q==
X-Received: by 2002:a17:906:ad9:b0:6f3:da10:1389 with SMTP id
 z25-20020a1709060ad900b006f3da101389mr20710873ejf.32.1651679242735; 
 Wed, 04 May 2022 08:47:22 -0700 (PDT)
Received: from skbuf ([188.25.160.86]) by smtp.gmail.com with ESMTPSA id
 b13-20020aa7df8d000000b0042617ba638asm9388190edy.20.2022.05.04.08.47.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 04 May 2022 08:47:22 -0700 (PDT)
Date: Wed, 4 May 2022 18:47:20 +0300
From: Vladimir Oltean <olteanv@gmail.com>
To: Frank Wunderlich <frank-w@public-files.de>
Cc: Frank Wunderlich <linux@fw-web.de>, linux-mediatek@lists.infradead.org,
 linux-rockchip@lists.infradead.org, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Heiko Stuebner <heiko@sntech.de>, Sean Wang <sean.wang@mediatek.com>,
 Landen Chao <Landen.Chao@mediatek.com>,
 DENG Qingfang <dqfext@gmail.com>, Andrew Lunn <andrew@lunn.ch>,
 Vivien Didelot <vivien.didelot@gmail.com>,
 Florian Fainelli <f.fainelli@gmail.com>,
 "David S. Miller" <davem@davemloft.net>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Peter Geis <pgwipeout@gmail.com>, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 netdev@vger.kernel.org
Subject: Re: [RFC v2 4/4] arm64: dts: rockchip: Add mt7531 dsa node to
 BPI-R2-Pro board
Message-ID: <20220504154720.62cwrz7frjkjbb7u@skbuf>
References: <20220430130347.15190-1-linux@fw-web.de>
 <20220430130347.15190-5-linux@fw-web.de>
 <20220504152450.cs2afa4hwkqp5b5m@skbuf>
 <trinity-9f557027-8e00-4a4a-bc19-bc576e163f7b-1651678399970@3c-app-gmx-bs42>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <trinity-9f557027-8e00-4a4a-bc19-bc576e163f7b-1651678399970@3c-app-gmx-bs42>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220504_084726_815803_F3889568 
X-CRM114-Status: GOOD (  16.11  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Wed, May 04, 2022 at 05:33:20PM +0200, Frank Wunderlich wrote:
> Hi,
> 
> thanks for review
> 
> > Gesendet: Mittwoch, 04. Mai 2022 um 17:24 Uhr
> > Von: "Vladimir Oltean" <olteanv@gmail.com>
> 
> > > +&mdio0 {
> > > +	#address-cells = <1>;
> > > +	#size-cells = <0>;
> > > +
> > > +	switch@0 {
> >
> > I think the preferable names are the newer "ethernet-switch@0",
> > "ethernet-ports", "ethernet-port@0".
> >
> > Otherwise
> >
> > Reviewed-by: Vladimir Oltean <olteanv@gmail.com>
> 
> current device-tree nodes using "switch" and "ports"
> 
> see discussioon here about make it fixed to "ports" property instead of PatternProperties including optional "ethernet-"
> 
> https://patchwork.kernel.org/project/linux-mediatek/patch/20220502153238.85090-1-linux@fw-web.de/#24843155

Hmm, I don't get why Krzysztof said to just keep what is used in
existing device trees. The schema validator should describe what is
valid, and since the mt7530 driver does not care one way or another
(some drivers do explicitly parse the "ports"/"ethernet-ports" node),
then whatever is valid for the DSA core is also valid for the mt7530
bindings. And "ethernet-ports" is valid too, so I think it should be
accepted by mediatek.yaml...

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
