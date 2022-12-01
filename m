Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2821DC4332F
	for <linux-mediatek@archiver.kernel.org>; Thu,  1 Dec 2022 22:32:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=F07P6a/Id33CTcYtj1QCwp4RFu2lFYRJBzRNDlUTKzo=; b=EVmXx5N3wUaZNtUDu0WL1Tuz9m
	egNDZSLqaWC9tDldcLEnfHonXmRJq/eEVsJV27n1PU9m6h/0HxSRJP+pUQPr7lv1cecgYeqiFZbj2
	M8YkK6kvsOn+n89JFazUS2NmQNCBJJi+H0dsFA9YRuQc44Ry1/kmT97EUV3BLxnOdxia/zJaEj130
	KlPmv8kio5Oglyk8Iz/V4gj9SDUw/PrthNj0RNRf6Y/unA8XUKNT3RC4hNDveuL90HoWQqPipbZxk
	dSbtKBmo5A4u1empK9eWKGPUzd0TrqJzS0TxTdim75uCqjVz3yFSg0X+U1a6oT9el7uBwmMIW6S+P
	7xVsXjJw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p0s6X-00BOTe-8m; Thu, 01 Dec 2022 22:32:29 +0000
Received: from mail-ot1-f52.google.com ([209.85.210.52])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p0rxE-00BNJS-Gv; Thu, 01 Dec 2022 22:22:53 +0000
Received: by mail-ot1-f52.google.com with SMTP id m7-20020a9d6447000000b0066da0504b5eso1863324otl.13;
        Thu, 01 Dec 2022 14:22:52 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=F07P6a/Id33CTcYtj1QCwp4RFu2lFYRJBzRNDlUTKzo=;
        b=tbWAsIneFKYbBsb4D4T2PpUWX6LxIsJ/25wUvSdJk8G/zbC11dgyEGEb0Ctcq3thfA
         Kz2eX1o+mszRDyvgQp2/WFxWTxVRxhCLo4EKS2EVzQLfc+JFULKJJ3f4zCFVkHW9zNXx
         nq28wfRCRVnpSvtmY+4XbL/v6gphndIIFpf5VninNQzW3h5GtsmGE55XBTl5jhxO9rRJ
         w68b3Hvdc32lcpdKolnPjywDsSoBl6m9cZ9M2139fz+G3DdaOCEHsxjUy3csap7686eH
         Mwz86CTfDAXDMRVXzMm8PFMwpgXZBaoWtlrTCJ3IvnpdVjfHIfbf/WBE7UjQ/4lXvm3O
         OYTA==
X-Gm-Message-State: ANoB5pmjIfQkmJv8zLNzQqnf/Jg9OGvE4OIuu7Yk9lk+qclC5oNXkU08
	GqAmMmSTiwX82hrrXK+e0A==
X-Google-Smtp-Source: AA0mqf4n7wg2fqdZVJhfDsF8YXv6rxBcsnnPoHmh1X60/W19nHTako7iT34gJHJ0FBsF+pOjEubToA==
X-Received: by 2002:a05:6830:57:b0:66d:de4e:9e9c with SMTP id d23-20020a056830005700b0066dde4e9e9cmr29635794otp.176.1669933371714;
        Thu, 01 Dec 2022 14:22:51 -0800 (PST)
Received: from robh_at_kernel.org (66-90-144-107.dyn.grandenetworks.net. [66.90.144.107])
        by smtp.gmail.com with ESMTPSA id t14-20020a0568080b2e00b0035a6003bb81sm2345682oij.0.2022.12.01.14.22.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 01 Dec 2022 14:22:51 -0800 (PST)
Received: (nullmailer pid 1551805 invoked by uid 1000);
	Thu, 01 Dec 2022 22:22:49 -0000
Date: Thu, 1 Dec 2022 16:22:49 -0600
From: Rob Herring <robh@kernel.org>
To: Colin Foster <colin.foster@in-advantage.com>
Cc: Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Vladimir Oltean <olteanv@gmail.com>, 
	Kurt Kanzenbach <kurt@linutronix.de>, Claudiu Manoil <claudiu.manoil@nxp.com>, 
	Andrew Lunn <andrew@lunn.ch>, =?UTF-8?B?bsOnIMOcTkFM?= <arinc.unal@arinc9.com>, 
	linux-renesas-soc@vger.kernel.org, Marek Vasut <marex@denx.de>, 
	Alexandre Belloni <alexandre.belloni@bootlin.com>, linux-mediatek@lists.infradead.org, 
	linux-kernel@vger.kernel.org, =?UTF-8?B?Q2zDqW1lbnQgTMOpZ2Vy?= <clement.leger@bootlin.com>, 
	Rob Herring <robh+dt@kernel.org>, Vivien Didelot <vivien.didelot@gmail.com>, 
	UNGLinuxDriver@microchip.com, Jakub Kicinski <kuba@kernel.org>, 
	DENG Qingfang <dqfext@gmail.com>, =?UTF-8?Q?Alvin_=C5=A0ipraga?= <alsi@bang-olufsen.dk>, 
	linux-arm-kernel@lists.infradead.org, 
	Linus Walleij <linus.walleij@linaro.org>, netdev@vger.kernel.org, 
	"David S. Miller" <davem@davemloft.net>, Landen Chao <Landen.Chao@mediatek.com>, 
	Florian Fainelli <f.fainelli@gmail.com>, Sean Wang <sean.wang@mediatek.com>, 
	devicetree@vger.kernel.org, George McCollister <george.mccollister@gmail.com>, 
	", John Crispin" <john@phrozen.org>, Matthias Brugger <matthias.bgg@gmail.com>, 
	Paolo Abeni <pabeni@redhat.com>, Woojung Huh <woojung.huh@microchip.com>, 
	Eric Dumazet <edumazet@google.com>
Subject: Re: [PATCH v3 net-next 01/10] dt-bindings: net: dsa: sf2: fix
 brcm,use-bcm-hdr documentation
Message-ID: <166993336761.1551697.12498585251946226273.robh@kernel.org>
References: <20221127224734.885526-1-colin.foster@in-advantage.com>
 <20221127224734.885526-2-colin.foster@in-advantage.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20221127224734.885526-2-colin.foster@in-advantage.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221201_142252_579082_FD2F86B0 
X-CRM114-Status: GOOD (  12.72  )
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


On Sun, 27 Nov 2022 14:47:25 -0800, Colin Foster wrote:
> The property use-bcm-hdr was documented as an entry under the ports node
> for the bcm_sf2 DSA switch. This property is actually evaluated for each
> port. Correct the documentation to match the actual behavior and properly
> reference dsa-port.yaml for additional properties of the node.
> 
> Suggested-by: Rob Herring <robh@kernel.org>
> Signed-off-by: Colin Foster <colin.foster@in-advantage.com>
> ---
> 
> v3
>   * New patch
> 
> ---
>  .../devicetree/bindings/net/dsa/brcm,sf2.yaml     | 15 ++++++++++-----
>  1 file changed, 10 insertions(+), 5 deletions(-)
> 

Reviewed-by: Rob Herring <robh@kernel.org>

