Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D6DB6C7618D
	for <linux-mediatek@archiver.kernel.org>; Thu,  6 Apr 2023 15:22:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=W8yHOaVQ4mahqDoWUZZ0X3+twLrUdiCW/OQNIgPHkpM=; b=iByfZW0dALj/qP5AK4xUEZ+f17
	SS2Tfmu9RDgT6cQ5fSMI8FxAaZD6gCXWAaz8d/0ZvoLfAoXESLHpF++5ZfWyGKig1dbj6yj6OX7Y0
	UwVzoQnx/tXnQFSmGTZmvGBmhcIc9gSES9UDN7t0CNss1Vu4Lrcx/SvdgLohykiJ9BkFixOLfhOOP
	nJ2l6o7z6rMVKLrxFDhufE3iaGz+GlCkQZWKpH01+vNLgj2zt87QsLMC5b3N/bGjBImtZJC+K+CSi
	z0FhLX/1gK91b2ohXhwQqj2uoOfkNua3PptLgQMQC9HIbtgVfmX0wXN3AEX2AJPmtlhwui5bjTfp7
	QWDvX2Rw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pkRRD-007nS6-07;
	Thu, 06 Apr 2023 15:22:11 +0000
Received: from mail-ej1-x62b.google.com ([2a00:1450:4864:20::62b])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pkRR9-007nPs-0U;
	Thu, 06 Apr 2023 15:22:08 +0000
Received: by mail-ej1-x62b.google.com with SMTP id qb20so2261101ejc.6;
        Thu, 06 Apr 2023 08:22:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1680794523;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=W8yHOaVQ4mahqDoWUZZ0X3+twLrUdiCW/OQNIgPHkpM=;
        b=oZwLocsV6/myf95tPXquC5P3/ayH6gAbBmWdKPVSUnZn6kRTeDqScnnIn5GIxlwbz8
         nJZGvjOLRNAUgjKN8PXwWDCRcZdQQt4RZRHWNK89ycCHgppu7C7O4ozWDeJaf41K61Uh
         XCHSLNMP4ONIQjVBXkMf3l59MTq8pFp/jjC78wzeOS3zutEYhIVWmg4bj8p5L5DGPRsg
         0AOgBoukthw2oMSbXy0UwTa90FzkZqEBtvZJoMFgwYe2I8IudvnqJLxGrI48c+S2ONUQ
         rMDe4Q+9Kvi+Z/zD00KMVwCpG6F+iLyt51C8aFhkLH0FITM+kp655rE19bJGxaKHTUQ5
         YXNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680794523;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=W8yHOaVQ4mahqDoWUZZ0X3+twLrUdiCW/OQNIgPHkpM=;
        b=5U9nEaLL0/dRY4AqZ3TEzdWYlaiWOK9QJLTtcQ4QvHco+/AXaL8wPFCLlNh2eth3k9
         jvWcsNL0pueC7RndtRgELZYvn721vYUuDNPU66wyURj3AcaxJpudMtgX/Pj0KYAIlb2S
         Ot+1UEkR9Iml1ADyNO7mmbBwsNsFkPY5b8MxNVKhHrBTDPsCFhTpur1ww1ZVaqCttf6q
         nKmN3hMT9ZumhHo0H6M2VWxLGYRWMyV/P6JtycQphk3awGna/3uS87rHSVZJHEt6oWuL
         9YFr+VmW+9g0DU6tHLGKooURMExP6ZEYSU4QkEoFyTcbHNTpidRZO6HnJ8Jmoj5HvnOu
         GFJg==
X-Gm-Message-State: AAQBX9eExy+A2kazJT370+XolGvseJQ+GCufVPZfmeOoInnTBEeLHe8p
	quLQdg/OzzgbyZuLVtibM6U=
X-Google-Smtp-Source: AKy350YlpYZ/5WyZfEsJM9r0STUEnAAOWTh66kJerlTJdTbxs18L9N8B47hs1vImrQMlTMzWf6mr9A==
X-Received: by 2002:a17:907:a413:b0:92f:43a2:bf7d with SMTP id sg19-20020a170907a41300b0092f43a2bf7dmr7965899ejc.73.1680794522609;
        Thu, 06 Apr 2023 08:22:02 -0700 (PDT)
Received: from skbuf ([188.27.184.189])
        by smtp.gmail.com with ESMTPSA id dd20-20020a1709069b9400b009475bf82935sm937459ejc.31.2023.04.06.08.22.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 06 Apr 2023 08:22:02 -0700 (PDT)
Date: Thu, 6 Apr 2023 18:21:59 +0300
From: Vladimir Oltean <olteanv@gmail.com>
To: Hans Schultz <netdev@kapio-technology.com>
Cc: davem@davemloft.net, kuba@kernel.org, netdev@vger.kernel.org,
	Florian Fainelli <f.fainelli@gmail.com>,
	Andrew Lunn <andrew@lunn.ch>, Eric Dumazet <edumazet@google.com>,
	Paolo Abeni <pabeni@redhat.com>,
	Kurt Kanzenbach <kurt@linutronix.de>,
	Hauke Mehrtens <hauke@hauke-m.de>,
	Woojung Huh <woojung.huh@microchip.com>,
	"maintainer:MICROCHIP KSZ SERIES ETHERNET SWITCH DRIVER" <UNGLinuxDriver@microchip.com>,
	Sean Wang <sean.wang@mediatek.com>,
	Landen Chao <Landen.Chao@mediatek.com>,
	DENG Qingfang <dqfext@gmail.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Claudiu Manoil <claudiu.manoil@nxp.com>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	=?utf-8?B?Q2zDqW1lbnQgTMOpZ2Vy?= <clement.leger@bootlin.com>,
	Jiri Pirko <jiri@resnulli.us>, Ivan Vecera <ivecera@redhat.com>,
	Roopa Prabhu <roopa@nvidia.com>,
	Nikolay Aleksandrov <razor@blackwall.org>,
	Shuah Khan <shuah@kernel.org>,
	Christian Marangi <ansuelsmth@gmail.com>,
	Ido Schimmel <idosch@nvidia.com>,
	open list <linux-kernel@vger.kernel.org>,
	"moderated list:ARM/Mediatek SoC support" <linux-arm-kernel@lists.infradead.org>,
	"moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>,
	"open list:RENESAS RZ/N1 A5PSW SWITCH DRIVER" <linux-renesas-soc@vger.kernel.org>,
	"moderated list:ETHERNET BRIDGE" <bridge@lists.linux-foundation.org>,
	"open list:KERNEL SELFTEST FRAMEWORK" <linux-kselftest@vger.kernel.org>
Subject: Re: [PATCH v2 net-next 2/6] net: dsa: propagate flags down towards
 drivers
Message-ID: <20230406152159.zfg6kxuimulnpops@skbuf>
References: <20230327225933.plm5raegywbe7g2a@skbuf>
 <87ileljfwo.fsf@kapio-technology.com>
 <20230328114943.4mibmn2icutcio4m@skbuf>
 <87cz4slkx5.fsf@kapio-technology.com>
 <20230330124326.v5mqg7do25tz6izk@skbuf>
 <87wn2yxunb.fsf@kapio-technology.com>
 <20230330130936.hxme34qrqwolvpsh@skbuf>
 <875yaimgro.fsf@kapio-technology.com>
 <20230330150752.gdquw5kudtrqgzyz@skbuf>
 <87o7o1ox9h.fsf@kapio-technology.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <87o7o1ox9h.fsf@kapio-technology.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230406_082207_189057_51D99349 
X-CRM114-Status: GOOD (  13.05  )
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

On Thu, Apr 06, 2023 at 05:17:46PM +0200, Hans Schultz wrote:
> On Thu, Mar 30, 2023 at 18:07, Vladimir Oltean <olteanv@gmail.com> wrote:
> > As a bug fix, stop reporting to switchdev those FDB entries with
> > BR_FDB_ADDED_BY_USER && !BR_FDB_STATIC. Then, after "net" is merged into
> > "net-next" next Thursday (the ship has sailed for today), add "bool static"
> 
> It is probably too late today (now I have a Debian based VM that can do
> the selftests), but with this bug fix I have 1) not submitted bug fixes
> before and 2) it probably needs an appropriate explanation, where I
> don't know the problem well enough for general switchcores to submit
> with a suitable text.

Do you want me to try to submit this change as a bug fix?

