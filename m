Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1BBEAC6FD1D
	for <linux-mediatek@archiver.kernel.org>; Mon, 27 Mar 2023 22:59:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=vs0lU2V659xfolR59bwYcxi0Nnjs4lVJmYEM9MkDucs=; b=1t5tc7fCeWnpQHk/vHjR5AJvow
	jDSUGvklJT2lQw7jGdBXVYA8I9iXgTePnb3J+4TZGmWam2TeSgtPbxIFLMdisO9IaJTe7yiE4p5kv
	aHGSgirondzA0ziIXf/g7JieRQZbkZev1/HLQAM6w19bf3T7/Do8ccatswymgPuNibBfZpoO8tCR7
	lDmFAs1dAEZMwSQrr7qhcC1iIJ+JzHH1rpuMeBzyGeamhcjscpm2SUwdJvb+kMN7okElNLbhf2HNj
	1gL7Bmw+nkbxlVHpGSwKnF/5/fZEOitPSIkU1p3oj9Eng0I4+JvCWumtAGYQkgr0GQyEhZS2L5S7h
	Xypyd37g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pgvoX-00CcXy-2b;
	Mon, 27 Mar 2023 22:59:45 +0000
Received: from mail-ed1-x531.google.com ([2a00:1450:4864:20::531])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pgvoS-00CcVA-2S;
	Mon, 27 Mar 2023 22:59:43 +0000
Received: by mail-ed1-x531.google.com with SMTP id cn12so42536441edb.4;
        Mon, 27 Mar 2023 15:59:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1679957977;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=vs0lU2V659xfolR59bwYcxi0Nnjs4lVJmYEM9MkDucs=;
        b=kFSkbnLqBTXNziv2ifVthZxzOmPB3NbYEkyApURx8Oas8cCHPoSS+CWMJMLfkMaLxQ
         w3sBU0oRxauj492NqBP2NgItJC1pPYs7kn8NrUixuqvWmRXRZQ8HPHYwcIjs96dXvWjp
         kCc8POpRIpAim8K2sBnk1cfPBh1RbpSBOJBYwmF8yJbYD8hs5Zs0qFy7EGFZTsaQtx/u
         pwVF8TdXHKwGg54Yl6dKMbsFS4C54UWykPKT4U9BWOAjMgUl2eoKbpSU2uEIQmQwLbd0
         BYfxpA3JXHG6Y8LZgt14VH7NdJl6oasHvJPk4YHThi6kd+oe59qgKHgCPPRy1yxb4dR7
         CyOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679957977;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vs0lU2V659xfolR59bwYcxi0Nnjs4lVJmYEM9MkDucs=;
        b=MKtDq8cuaXwBRAygXoGhaG2N9yOfcR0XldiLoIHukd6RB2cDVhM40Cs6JrmgGtflMH
         dEQIagFE/LkAsIuPeWgCkhmKU9xrTCYTNELZL8MRMC3R7Nle5lF5Ui1sb0R3NddU61Lg
         8q503nFkmgx5WrLxrErHAU/bvy4DrmNkU2YgH3SvXrrLpmrluwg/Mx/9FnFw3IKlF389
         mg8hqM3qqhnxer5EdpQ+/21Gz+X0au6vRZqUhF/6daotR6VVfdWEBX4FVqZFGpX0cUvf
         /j1T9ZZIGuCWnKUPrX9IWnC4Epuao302F/mU6zKWMU4uonz6kt9U3xmwzKZMPvNzkBay
         ht6Q==
X-Gm-Message-State: AAQBX9eAbczP8+oh7t1O0F4n03BlKppKsA783iFz+OmTqzX795JyPFU1
	GCml98JwhMTu9Ba7wxm4EJM=
X-Google-Smtp-Source: AKy350b6kGzMoS+bwt1A2kOGbDUdu6Vqdtl4eu30Fw6DBeW6d1ptJzEXveDDR/mfkjoYxSRiG6GAlQ==
X-Received: by 2002:a17:906:e0c5:b0:931:4f2c:4e83 with SMTP id gl5-20020a170906e0c500b009314f2c4e83mr13534033ejb.63.1679957976838;
        Mon, 27 Mar 2023 15:59:36 -0700 (PDT)
Received: from skbuf ([188.27.184.189])
        by smtp.gmail.com with ESMTPSA id z13-20020a1709064e0d00b009351565d1f5sm10994040eju.52.2023.03.27.15.59.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Mar 2023 15:59:36 -0700 (PDT)
Date: Tue, 28 Mar 2023 01:59:33 +0300
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
Message-ID: <20230327225933.plm5raegywbe7g2a@skbuf>
References: <20230318141010.513424-1-netdev@kapio-technology.com>
 <20230318141010.513424-3-netdev@kapio-technology.com>
 <20230327115206.jk5q5l753aoelwus@skbuf>
 <87355qb48h.fsf@kapio-technology.com>
 <20230327160009.bdswnalizdv2u77z@skbuf>
 <87pm8tooe1.fsf@kapio-technology.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <87pm8tooe1.fsf@kapio-technology.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230327_155940_803378_589CA786 
X-CRM114-Status: GOOD (  22.17  )
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

On Mon, Mar 27, 2023 at 11:49:58PM +0200, Hans Schultz wrote:
> My first approach was to use the SWITCHDEV_FDB_ADD_TO_BRIDGE event
> and not the SWITCHDEV_FDB_OFFLOADED event as the first would set the
> external learned flag which is not aged out by the bridge.

Link to patch? I don't see any SWITCHDEV_FDB_ADD_TO_BRIDGE call in
either the v1:
https://lore.kernel.org/netdev/20230130173429.3577450-6-netdev@kapio-technology.com/
or the RFC:
https://lore.kernel.org/netdev/20230117185714.3058453-6-netdev@kapio-technology.com/
and the change log does not mention it either.

> I have at some point earlier asked why there would be two quite
> equivalent flags and what the difference between them are, but I didn't
> get a response.

Actually, the part which you are now posing as a question (what is the
difference?) was part of the premise of your earlier question (there is
no difference => why do we have both?).
https://lore.kernel.org/netdev/d972e76bed896b229d9df4da81ad8eb4@kapio-technology.com/

I believe that no one answered because the question was confused and it
wasn't really clear what you were asking.

> 
> Now I see the difference and that I cannot use the offloaded flag
> without changing the behaviour of the system as I actually change the
> behaviour of the offloaded flag in this version of the patch-set.
> 
> So if the idea of a 'synthetically' learned fdb entry from the driver
> using the SWITCHDEV_FDB_ADD_TO_BRIDGE event from the driver towards the
> bridge instead is accepted, I can go with that?
> (thus removing all the changes in the patch-set regarding the offloaded
> flag ofcourse)

which idea is that, again?

