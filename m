Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7CB36C433EF
	for <linux-mediatek@archiver.kernel.org>; Fri, 15 Jul 2022 20:17:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=kUgUodRkFKUUOwUquDcWzYd3uzryMer8NNF5OFV/n3U=; b=vCD+9Q3FWOeMPVKc+uthp3c7Nm
	d7OoW/seexbNKkRVGhZTummUn86FcPd6Cv2NUqxwl3wdcBlGp2NksFPzNNkdKrE3bLpo4xIgpM3Se
	4pYRTc4NvXVs0zURXAteE7DpqRfGHadlHpyte1DtVoEprGKbVq/GHvunEhhEPEdi+t35cNCPmv/ia
	rXEc330qbQHS2TZ47Z7NpjvzWSMYNoIxIYVc7CrwNup7V8yZ7vQsP0NIwvl0CQqjPUUewKq2uHMre
	BwQnKNSSl2erN6bh97GSzJC1pHgqEsbyltZ/zZbEX8NO9b04GskUf0s0UZ5mzRvyLeQtzT4BqjRL6
	MnMVKoSg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oCRkk-00A6Cq-TY; Fri, 15 Jul 2022 20:17:34 +0000
Received: from mail-ed1-x535.google.com ([2a00:1450:4864:20::535])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oCRkZ-00A65Q-9W; Fri, 15 Jul 2022 20:17:24 +0000
Received: by mail-ed1-x535.google.com with SMTP id e15so7693617edj.2;
        Fri, 15 Jul 2022 13:17:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=kUgUodRkFKUUOwUquDcWzYd3uzryMer8NNF5OFV/n3U=;
        b=Ea7DnxFB8YW7x85iotpMK+8GfKngvKz1AKd+YQL5lC/XhwtJw1GtCZtx9xMuj9P94v
         FmOQRLwMV8EilKg8d1ysdEVfV2oK3MhX5NW58snn/aSC8gYnHxfmIj0BiYIzRtA78709
         9RDrri8Gf4l3MLaRp1P5w0GiuB/67EixbDvUwBgZp9j6qCfs5j7q8pFbfiKyEqJt9fDU
         Utj6jP+4u9OTOnT19df2FLoVo2an6o9agEPdejrPnMaspOGKbuFXxmIDFvL+ZAVg3oi2
         pkavLyuX/t7U5CPvlzyU3E0f4pGl8E++BwgL+eU0bv5K3d/H3VF0IxbhMybLAuCyxwok
         XJLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=kUgUodRkFKUUOwUquDcWzYd3uzryMer8NNF5OFV/n3U=;
        b=wqjVhmu656HyaZuXL+6n3DNSZTRNzo+jX/XK8sk6MqHXbvMEIyPRpmhhMGje1VGisE
         DRBhGuPqho1B3Fjv8RzdGTM0jfcYVxxO6kw3ddc0FTZowhFth3ZODPQXbZMbTK1dZNRb
         PsoY1Rij1Hyfonk8Y15Pa4ia9jLG/jNTLc4hyQ1/2FN4F2Apgs1CY1FJI0Aa5vZPzmN1
         Q1Mn1HB5zQ7F5dRS6+99aj7P02qGxmA70GaqST6rXO/RegiC93YkCwgO8wBhFAZiKzBR
         i0bimdlZLyLfjdcl63xn3f7CphEWprT22o/8+9U8TvipuKmVVvdr4DmkKV0ol50D8FDR
         OS1g==
X-Gm-Message-State: AJIora93JakknPNdZl3sAIWNmiieOCnyh9vs/F/O1qubovmCes27BnvZ
	WxVgNBVjAlTzX2m6Ga/oOUM=
X-Google-Smtp-Source: AGRyM1t1xV9P/w3xfqZD1QiQGwgq/xLXDMQuFjnnZzEH6CaG5uGAy6MlAs5/6lNobUF3nMAnDUSmDA==
X-Received: by 2002:a05:6402:278c:b0:43a:91cb:c43a with SMTP id b12-20020a056402278c00b0043a91cbc43amr21393953ede.188.1657916239591;
        Fri, 15 Jul 2022 13:17:19 -0700 (PDT)
Received: from skbuf ([188.25.231.115])
        by smtp.gmail.com with ESMTPSA id o7-20020aa7c507000000b0043ab81e4230sm3448457edq.50.2022.07.15.13.17.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 15 Jul 2022 13:17:18 -0700 (PDT)
Date: Fri, 15 Jul 2022 23:17:15 +0300
From: Vladimir Oltean <olteanv@gmail.com>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: Russell King <rmk+kernel@armlinux.org.uk>, Andrew Lunn <andrew@lunn.ch>,
	Heiner Kallweit <hkallweit1@gmail.com>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Alvin __ipraga <alsi@bang-olufsen.dk>,
	Claudiu Manoil <claudiu.manoil@nxp.com>,
	Daniel Scally <djrscally@gmail.com>,
	"David S. Miller" <davem@davemloft.net>,
	DENG Qingfang <dqfext@gmail.com>,
	Eric Dumazet <edumazet@google.com>,
	Florian Fainelli <f.fainelli@gmail.com>,
	George McCollister <george.mccollister@gmail.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Hauke Mehrtens <hauke@hauke-m.de>,
	Heikki Krogerus <heikki.krogerus@linux.intel.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Kurt Kanzenbach <kurt@linutronix.de>,
	Landen Chao <Landen.Chao@mediatek.com>,
	Linus Walleij <linus.walleij@linaro.org>,
	linux-acpi@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	Matthias Brugger <matthias.bgg@gmail.com>, netdev@vger.kernel.org,
	Paolo Abeni <pabeni@redhat.com>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Sean Wang <sean.wang@mediatek.com>, UNGLinuxDriver@microchip.com,
	Vivien Didelot <vivien.didelot@gmail.com>,
	Woojung Huh <woojung.huh@microchip.com>,
	Marek =?utf-8?B?QmVow7pu?= <kabel@kernel.org>
Subject: Re: [PATCH net-next 2/6] software node: allow named software node to
 be created
Message-ID: <20220715201715.foea4rifegmnti46@skbuf>
References: <YtGPO5SkMZfN8b/s@shell.armlinux.org.uk>
 <E1oCNky-006e3g-KA@rmk-PC.armlinux.org.uk>
 <YtHGwz4v7VWKhIXG@smile.fi.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <YtHGwz4v7VWKhIXG@smile.fi.intel.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220715_131723_373126_1BD28DF2 
X-CRM114-Status: GOOD (  13.15  )
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

On Fri, Jul 15, 2022 at 10:57:55PM +0300, Andy Shevchenko wrote:
> On Fri, Jul 15, 2022 at 05:01:32PM +0100, Russell King wrote:
> > From: Vladimir Oltean <vladimir.oltean@nxp.com>
> > 
> > Allow a named software node to be created, which is needed for software
> > nodes for a fixed-link specification for DSA.
> 
> In general I have no objection, but what's worrying me is a possibility to
> collide in namespace. With the current code the name is generated based on
> unique IDs, how can we make this one more robust?

Could you be more clear about the exact concern?

