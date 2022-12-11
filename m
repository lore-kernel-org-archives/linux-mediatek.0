Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DE2E3C4332F
	for <linux-mediatek@archiver.kernel.org>; Sun, 11 Dec 2022 22:58:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=M33qCD7Tm8dDEgZk34tGAUKV2pp9BjLWodh2i56ini8=; b=c5D0qYlrHbxtbYi7sipxrVK302
	DGyXcKAk1VaEUVRaXc7EaAzZGJtKkr1lPf6K3njh7+Q1gPPhAyOWQvxm8JkpxLbbMucn221I025v8
	xxc94XX4vAoIFT8Svcwqg1pfduNnKemUNxUJWUl0Qr0AZGkdHgqZwnTntkFs9DmDudZkXEpq9WhbV
	/hYEP2S1afwT5KpbNXaKxr3lnyzuuTmFtW9L4aI0MuGHWdBOBVYHKkkIvheMYiv2TJ89Zqteg6vVb
	tkaofptw/ROgLjhxFN89hDhs5mY5ZfwitWLlH7cxd+QLMAhG8v5MaDQ5lxZG6TYsAay9etkchfFUo
	v5i8y1Dw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p4VHM-0053Me-SE; Sun, 11 Dec 2022 22:58:40 +0000
Received: from mail-ej1-x635.google.com ([2a00:1450:4864:20::635])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p4VHF-0053Hm-Bm; Sun, 11 Dec 2022 22:58:39 +0000
Received: by mail-ej1-x635.google.com with SMTP id t17so23832944eju.1;
        Sun, 11 Dec 2022 14:58:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=M33qCD7Tm8dDEgZk34tGAUKV2pp9BjLWodh2i56ini8=;
        b=YM/EYtHkM9CzZbVfnNVz3ugqNlk3HA3Qywye8HmZNtAVcbE8mI+jSfGVkYqFn/uidC
         GmaGFF3VGDlrfL7HwRPrWg2gx8OfTYa7KZJUQq0fNQzLNVIs3k7nkPn79sp8pYm5u5gN
         uJnxyNLtDSmRjf7Kp6IngeT2ofr0NQPEy3JC76VutmwpVNpmowA5+12MeB6WYVxMWD4n
         AdO/pAa1/8xPsrWuuzD+Os91s3wQpBwmiEDec3mfzWaNdFQaxgZ7KTUsVyMpIxo4snfp
         HM7ez7UKZKgsBcF+H5s+8TCro4smINVZnBLSR44U/xI5lmqrEyhvy2FlFmn3XJqCVDtp
         KY9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=M33qCD7Tm8dDEgZk34tGAUKV2pp9BjLWodh2i56ini8=;
        b=m3qD6ERngRcQMCvtlY4LCZh5082jcIVAaHgtSNGWd0JIC51hTJSuqLp6w4tOWtbEvT
         VAqK9IQwZsr+ym02PDwT1hMEE0ONqH9tohEJXNWrE0Irq++zNmJedboqnFDyOwkx+T/l
         O3AZGU9XmUCCOGIiWi0uWo4wOEsatBfBDHqeDNhdescmKiqvrgP0JiWIJi/oA1j0lLNa
         lvYKUn3hWKio4j1tai5ksS4e7ZV5UhdGoqWVEYFdBUgEjqvYcJPv1WZNiu5Z1ssraeag
         pX++Abp552HJOg4PjQUmeF6Si+r9CNFDnQnnqqw8+Ay83JGUAam6DB5V/1N1+GiXh8Ev
         iuZA==
X-Gm-Message-State: ANoB5pniFFKitBWqej2hrjIh1sqhj2fO+4eCCqDOcUpS+Wdvr9F+YDK3
	5V+GB+8jaUL2b7NfGK74KxvqGPMYrEA=
X-Google-Smtp-Source: AA0mqf7p50+L95OeIEuBxlGylcnhYmtBdgeQFosfuZf9XnCV73/tM0sQHCcFFJhDfhxd79fyjh6MQw==
X-Received: by 2002:a17:906:150d:b0:7c1:65f5:7b92 with SMTP id b13-20020a170906150d00b007c165f57b92mr4674347ejd.48.1670799506624;
        Sun, 11 Dec 2022 14:58:26 -0800 (PST)
Received: from skbuf ([188.27.185.175])
        by smtp.gmail.com with ESMTPSA id f12-20020a170906390c00b007c0aa8eaf47sm2504998eje.116.2022.12.11.14.58.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 11 Dec 2022 14:58:26 -0800 (PST)
Date: Mon, 12 Dec 2022 00:58:23 +0200
From: Vladimir Oltean <olteanv@gmail.com>
To: Kurt Kanzenbach <kurt@linutronix.de>
Cc: Colin Foster <colin.foster@in-advantage.com>,
	linux-renesas-soc@vger.kernel.org,
	linux-mediatek@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org, netdev@vger.kernel.org,
	John Crispin <john@phrozen.org>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Claudiu Manoil <claudiu.manoil@nxp.com>,
	Marek Vasut <marex@denx.de>, Sean Wang <sean.wang@mediatek.com>,
	DENG Qingfang <dqfext@gmail.com>,
	Landen Chao <Landen.Chao@mediatek.com>,
	=?utf-8?B?bsOnIMOcTkFM?= <arinc.unal@arinc9.com>,
	Vivien Didelot <vivien.didelot@gmail.com>,
	=?utf-8?B?Q2zDqW1lbnQgTMOpZ2Vy?= <clement.leger@bootlin.com>,
	Alvin =?utf-8?Q?=C5=A0ipraga?= <alsi@bang-olufsen.dk>,
	Linus Walleij <linus.walleij@linaro.org>,
	UNGLinuxDriver@microchip.com,
	Woojung Huh <woojung.huh@microchip.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Rob Herring <robh+dt@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Eric Dumazet <edumazet@google.com>,
	"David S. Miller" <davem@davemloft.net>,
	Florian Fainelli <f.fainelli@gmail.com>,
	Andrew Lunn <andrew@lunn.ch>,
	George McCollister <george.mccollister@gmail.com>
Subject: Re: [PATCH v5 net-next 01/10] dt-bindings: dsa: sync with maintainers
Message-ID: <20221211225823.nde77nlfriok4q6x@skbuf>
References: <20221210033033.662553-1-colin.foster@in-advantage.com>
 <20221210033033.662553-2-colin.foster@in-advantage.com>
 <87o7sbh896.fsf@kurt>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <87o7sbh896.fsf@kurt>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221211_145837_631930_503D77C6 
X-CRM114-Status: GOOD (  14.76  )
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

On Sat, Dec 10, 2022 at 11:18:29AM +0100, Kurt Kanzenbach wrote:
> You can update the hellcreek binding as well. Thanks.
> 
> diff --git a/Documentation/devicetree/bindings/net/dsa/hirschmann,hellcreek.yaml b/Documentation/devicetree/bindings/net/dsa/hirschmann,hellcreek.yaml
> index 73b774eadd0b..1d7dab31457d 100644
> --- a/Documentation/devicetree/bindings/net/dsa/hirschmann,hellcreek.yaml
> +++ b/Documentation/devicetree/bindings/net/dsa/hirschmann,hellcreek.yaml
> @@ -12,7 +12,7 @@ allOf:
>  maintainers:
>    - Andrew Lunn <andrew@lunn.ch>
>    - Florian Fainelli <f.fainelli@gmail.com>
> -  - Vivien Didelot <vivien.didelot@gmail.com>
> +  - Vladimir Oltean <olteanv@gmail.com>
>    - Kurt Kanzenbach <kurt@linutronix.de>
>  
>  description:

Good observation. If there are no other comments on this patch series
(which otherwise looks reasonable to me), I suppose that could be
accomplished via a parallel patch as well? The diff you're proposing
does not seem to conflict with something else that Colin is touching in
this patch set.

