Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 71124C7618D
	for <linux-mediatek@archiver.kernel.org>; Thu,  6 Apr 2023 15:25:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=cOMO4X0KkT1wLKp3ZzLuqJYBOcq707+YpxHq0zavOgw=; b=uRzLs58AeLSYpHkstJQUQDQ/H/
	WOGIvAlozuL0OyXtR9xVAb7iaIhrpFCWehJBTDtXi+GqtX1s97LKk+PWdKEQVVVNezKTT2OCZbIXg
	mjuKVq00enDn6GeWIyrRoYO7nrqxBWBTl0sTWjs8E+7sMjm28PH9njzLkoVYG0i4F+2iQQQkFG/HP
	zsnpRPy5V2Turo27l4WtPOPpOuQfGoK17+QkwfszlNw9B5mU4/sAvmGFnVsRsKBNOBoLoADs0laay
	LSA2MxYqhFG37iwtpFSlXGfIzaGK/6FZbqKIxt8OjU+zFHKaO6G2ntQHHezmU5SOzJV3OuIdMKw7N
	GhmOO6pg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pkRTo-007nxI-1x;
	Thu, 06 Apr 2023 15:24:52 +0000
Received: from mail-ed1-x535.google.com ([2a00:1450:4864:20::535])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pkRTl-007nw3-0a;
	Thu, 06 Apr 2023 15:24:50 +0000
Received: by mail-ed1-x535.google.com with SMTP id 4fb4d7f45d1cf-5027d3f4cd7so1378537a12.0;
        Thu, 06 Apr 2023 08:24:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1680794686;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=cOMO4X0KkT1wLKp3ZzLuqJYBOcq707+YpxHq0zavOgw=;
        b=mOLwUplHv9h7ct3oUi+VgdSBSfJfcHSz4omCFqbZjtcuXZHY1U4ilN33bGUgNEML1d
         Hjq7TbyKj4CJpjX2aYIhMpGOdWYEmKO/C293HsORhRG+hHjWFl30PxsM/93zkWlpk8lC
         R93xYEJiKmwfBwiccG8Qtkg09sf55JI7q8wuLs0blN9F/xMZYbUWJXHcGoXFlX6ATnp3
         2NOgQ3U7nnw2BBVkH+GM4uOAnLsCSM/U2wL9x/JpWe9suZa+OawzhG/gpICCvUkNwGR9
         3mDNsEgVogbvJdbZt8mKUnYQEY2TV3tWC5PUAfU/wajZEWpW4OikShq4SToCCxH61U6/
         zqdA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680794686;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=cOMO4X0KkT1wLKp3ZzLuqJYBOcq707+YpxHq0zavOgw=;
        b=cPb3W04Bz+Lt+u9rCByiOvRjfoCu9xdN2fyvtkRzj0au/eo3VwIMNoe/FxqfIvEoM9
         y6/8OC2Khh6GphkkglPUShCivv4m7F6pZAibiBlvZIljJjHxSQGbKY5KCdHpE/4qX6k0
         O9i3blo/pZb02EPTTCI2Q6UQsqTMUuWH/B9pqcvKG6sHmxNHU7GK6+O80952oRT+1jlR
         O+XMXWHemSQtCQhJLxJaHFZVxyAkqrVW/kJovxnDP+YLBvnLIpSB/qROeFwygiNdHalR
         Iw0BaN1ODpScDd1hU3XcUwikXOs6SrCU2Vs0BETmCwh/qb1Q4/eLebsC0lIb1lyesWTY
         NQhw==
X-Gm-Message-State: AAQBX9dp8VtBpP4OEfJAZeDmxnTjNmbJGa68NMHP4d+EZhvB9I907qI/
	I4FufJwpxkDfTZsDxaxaPGI=
X-Google-Smtp-Source: AKy350bMKcJuUrKHxCynmrWlEri+wOd6BUJcWjnjfAUKYwzm18cdb+f7ZMxFTWEmAIFudRqwzqdrSg==
X-Received: by 2002:aa7:da06:0:b0:502:8f49:2552 with SMTP id r6-20020aa7da06000000b005028f492552mr5597291eds.27.1680794686523;
        Thu, 06 Apr 2023 08:24:46 -0700 (PDT)
Received: from skbuf ([188.27.184.189])
        by smtp.gmail.com with ESMTPSA id b15-20020a50cccf000000b004c10b4f9ebesm878829edj.15.2023.04.06.08.24.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 06 Apr 2023 08:24:46 -0700 (PDT)
Date: Thu, 6 Apr 2023 18:24:43 +0300
From: Vladimir Oltean <olteanv@gmail.com>
To: Hans Schultz <netdev@kapio-technology.com>
Cc: Ido Schimmel <idosch@nvidia.com>, davem@davemloft.net, kuba@kernel.org,
	netdev@vger.kernel.org, Florian Fainelli <f.fainelli@gmail.com>,
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
	open list <linux-kernel@vger.kernel.org>,
	"moderated list:ARM/Mediatek SoC support" <linux-arm-kernel@lists.infradead.org>,
	"moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>,
	"open list:RENESAS RZ/N1 A5PSW SWITCH DRIVER" <linux-renesas-soc@vger.kernel.org>,
	"moderated list:ETHERNET BRIDGE" <bridge@lists.linux-foundation.org>,
	"open list:KERNEL SELFTEST FRAMEWORK" <linux-kselftest@vger.kernel.org>
Subject: Re: [PATCH v2 net-next 6/6] selftests: forwarding: add dynamic FDB
 test
Message-ID: <20230406152443.b3ps4x7e4kz4aes2@skbuf>
References: <20230318141010.513424-1-netdev@kapio-technology.com>
 <20230318141010.513424-7-netdev@kapio-technology.com>
 <ZBgdAo8mxwnl+pEE@shredder>
 <87a5zzh65p.fsf@kapio-technology.com>
 <ZCMYbRqd+qZaiHfu@shredder>
 <874jq22h2u.fsf@kapio-technology.com>
 <20230330192714.oqosvifrftirshej@skbuf>
 <871ql5mjjp.fsf@kapio-technology.com>
 <20230331093732.s6loozkdhehewlm4@skbuf>
 <87tty1nlb4.fsf@kapio-technology.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <87tty1nlb4.fsf@kapio-technology.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230406_082449_238285_6AA0F31B 
X-CRM114-Status: GOOD (  11.26  )
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

On Fri, Mar 31, 2023 at 02:43:11PM +0200, Hans Schultz wrote:
> I will as long as the system is as it is with these selftests, just run
> single subtests at a time on target, but if I have new phy problems like
> the one you have seen I have had before, then testing on target becomes
> off limits.

Please open a dedicated communication channel (separate email thread on
netdev@vger.kernel.org) with the appropriate maintainers for the PHY
code that is failing for you in To:, and you will get the help that you
need to resolve that and to be able to test on the target board.

