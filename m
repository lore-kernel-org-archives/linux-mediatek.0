Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F3AB0C433EF
	for <linux-mediatek@archiver.kernel.org>; Wed,  4 May 2022 15:21:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=EVlO8aeNRCoKyr+BFBzrT0kCxE/6KOYCebj3QaOmRUY=; b=jRuMEvVr1wszor
	EQjl49PJpVW0ANyKAIF9MklraoAbz3t6euk1SiFbK32YTZ0zDctlHz0w3mjPA9y1DlR93p5zX9hsd
	JTf1Di6p9q+wFs/hbUZUddjbxmcirngkm9JHO0QKUz8g3KHq9Z7BHm3LUh87rf1NUkGkhSd3IhsEa
	dQK6iii5pTnZlfXkUYiMYy8PcT/QINXJhwVd7Z8PLLWRxODSZiJam/NRo8Wvc3qD6/QZ6jGaucd+i
	EqU5r0Co+BrayP3gP6niBK0rNAcQRje5NuToJJGucmMXjpie/ynWh5Y3Qv7UuHLrQ2ODaJSLcybkE
	hlasOEz+DyDeCE1Yxn3A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nmGp5-00BPoN-2m; Wed, 04 May 2022 15:21:51 +0000
Received: from mail-ed1-x536.google.com ([2a00:1450:4864:20::536])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nmGp2-00BPlW-Sb; Wed, 04 May 2022 15:21:50 +0000
Received: by mail-ed1-x536.google.com with SMTP id ba17so2092552edb.5;
 Wed, 04 May 2022 08:21:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=dcuxN/s/TF+UjXWXLcTcHKDiCpnRwTqpk9ocbRhIwGc=;
 b=KQwyzQb52bLg7yCZAC5vdmlTels11FH3BMnN3OsEVle/iBZbpXoBYEg9dt73Jly5on
 OY/6ku75FiXnmJCWsVbtf+Y+JNchz/f9Hj8TSyx3f3bGAEmcvPDbqfTSLlh64M3Xzqi3
 k5UsA+LdWdlRO5jhTCbKWyL96+rAn95UOIqPTVjsZD9nFiWk1GKrYWcRZMEnGcUIx0ZT
 +JUrRUAE04pKlXizrcb3R+WRNQUljSjiADIHPd/So+K7oqChNITFem+GylwzGphH43g0
 QjhqByqYAeOpPtdkBxqHUOdxpSfuhe7JSpsmkno5SwxUZ2D4yLOmY1eWyV17RgozbWxV
 WmCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=dcuxN/s/TF+UjXWXLcTcHKDiCpnRwTqpk9ocbRhIwGc=;
 b=z5YD+3wLDg0kjIUq6dUz40KwWfLS3m258EoZHWDJkM9XiVBYLc3ab2sWrYEkccAki/
 DIw1TnEeOYf/SHLiZtkvWTzuWsDJGfkq4llEuvAWbZb/Rmfnk/uTgFjU6w+iwSOKP9sV
 csgB5F2sCNhLE3PLZfBRqwCpyZp+OinZfltjrVPS04dho6kmsrXo/kcfLZuhvkheObGR
 NuWm60jXX8LQHKjGKC3TqWXGSEfD11Vcn2yugau4oVvQBdQyK0b0jvfqODAJ7UOyqnqi
 IvbwM3faj9tATxqiTfB1L7auQ8b9gqUZK15RMMJKJZChQ4fwoM0w9PvRy1vKtZ6iWxBp
 k94Q==
X-Gm-Message-State: AOAM530fgoe3SdFbzxOS/tlxCWCOBR1uZjrrIg0fCsXG5LqLyLPkLflm
 60BoDAttN3tNC9iqkpXdfQI=
X-Google-Smtp-Source: ABdhPJzVqI1eVM2qoHGN5broejw/H+cnupEB+0ZS0oE2wsW33FaVBX9JMvjSWqGf4SyjU4PBLBhDMw==
X-Received: by 2002:a05:6402:190a:b0:427:efb7:bd81 with SMTP id
 e10-20020a056402190a00b00427efb7bd81mr7535993edz.63.1651677707090; 
 Wed, 04 May 2022 08:21:47 -0700 (PDT)
Received: from skbuf ([188.25.160.86]) by smtp.gmail.com with ESMTPSA id
 zp1-20020a17090684e100b006f3ef214df0sm5802549ejb.86.2022.05.04.08.21.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 04 May 2022 08:21:46 -0700 (PDT)
Date: Wed, 4 May 2022 18:21:44 +0300
From: Vladimir Oltean <olteanv@gmail.com>
To: Frank Wunderlich <linux@fw-web.de>
Subject: Re: [RFC v2 2/4] net: dsa: mt7530: rework mt753[01]_setup
Message-ID: <20220504152144.zqxme7xflv54exaw@skbuf>
References: <20220430130347.15190-1-linux@fw-web.de>
 <20220430130347.15190-3-linux@fw-web.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220430130347.15190-3-linux@fw-web.de>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220504_082148_958630_E6FBA11E 
X-CRM114-Status: UNSURE (   9.50  )
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
Cc: Andrew Lunn <andrew@lunn.ch>, Landen Chao <Landen.Chao@mediatek.com>,
 Florian Fainelli <f.fainelli@gmail.com>, DENG Qingfang <dqfext@gmail.com>,
 Heiko Stuebner <heiko@sntech.de>, netdev@vger.kernel.org,
 Sean Wang <sean.wang@mediatek.com>, linux-kernel@vger.kernel.org,
 "David S. Miller" <davem@davemloft.net>, linux-rockchip@lists.infradead.org,
 devicetree@vger.kernel.org, Rob Herring <robh+dt@kernel.org>,
 linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Matthias Brugger <matthias.bgg@gmail.com>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, Vivien Didelot <vivien.didelot@gmail.com>,
 Peter Geis <pgwipeout@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Sat, Apr 30, 2022 at 03:03:45PM +0200, Frank Wunderlich wrote:
> From: Frank Wunderlich <frank-w@public-files.de>
> 
> Enumerate available cpu-ports instead of using hardcoded constant.
> 
> Suggested-by: Vladimir Oltean <olteanv@gmail.com>
> Signed-off-by: Frank Wunderlich <frank-w@public-files.de>
> ---

Reviewed-by: Vladimir Oltean <olteanv@gmail.com>

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
