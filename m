Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 88326C77B60
	for <linux-mediatek@archiver.kernel.org>; Fri, 31 Mar 2023 09:37:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=2I7yU40CH1KTIPKs6kPsl2SefiwR2YueS62dP0NZHu0=; b=MXq3rxpp7Rf0a4HDqXdJnTZXxo
	9TBx0CkoWi+MAyeiAqC+0wj/YGYd9Kgh8o+e6Ys18W+Ddact8a11LN0lKWe2Ubh7YD1y7NQZqHEZG
	7mpScAWrG0gNkfoDdTdPaG3NgTIIuLMXXoV5phJcnXMFCGCx0HPVwNNgTminYxuMIvyDLzDVuZOzz
	pBYaijs/ImTAsvJzKeZwGywUWJzHhTpq4kIeaYpLueOHllyO8eMbHMVtV8+f7WDW6jo8KJFxhJah9
	0QNY5hxdlJDbpWc2tXiwvEIphW0gwr16Dip6EC2HuVBvaDGZtIAlUqsqBhidsnMU8gyErpcatxm0T
	KspfH/dQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1piBCY-006iHg-14;
	Fri, 31 Mar 2023 09:37:42 +0000
Received: from mail-ed1-x533.google.com ([2a00:1450:4864:20::533])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1piBCU-006iFq-0S;
	Fri, 31 Mar 2023 09:37:40 +0000
Received: by mail-ed1-x533.google.com with SMTP id eg48so87153338edb.13;
        Fri, 31 Mar 2023 02:37:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1680255456;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=2I7yU40CH1KTIPKs6kPsl2SefiwR2YueS62dP0NZHu0=;
        b=CULtuAu+grWGSjin+B2q5K4vYLYkcVUEPT39QZYv//yLch8kj4X27vymmyL6jBA+6i
         ACX6DSEhIpF/wfIzCNgePEz4Vh8s7ay58GscTeT85T1s0GBwPwzwrUMGQt5B18kY6yGt
         6pnNAfBEPK90KIPsAWjhQtATM+vY7j2qnuCzy28AkPwgdA0wZiMdDFqUAjg5x0HOdywP
         RCbkrkVCOApLgALXeDU7BFWqM8Jw0onrurgD9v1FxXo9Pjel8PvrWFWJbC8sy/v87HQY
         6igVRZ6GHH31atrxF93yu5HzZFuCVxemH5qtqiMhRdt4LWTplUbroNn5PAMAJQxsMd+q
         tVxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680255456;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2I7yU40CH1KTIPKs6kPsl2SefiwR2YueS62dP0NZHu0=;
        b=qGaZ3+l5lul4x5o2bJgdNIlK6/F38A6bEiS/+UbPmg4T8DzcDTJAxi/kTGnJf0aMEY
         pYTTgRFSLudaDhCmqkwe6toDozZv4cx+LQ81896EiA1QACfgP2q68m4IjpbfwxA8MYS1
         +bxpN7PdK5Qf7kRkQV4/mMBjS9c/3R9Zs0Upn/ufBWRBHut9O2Sko9m85o88UgzDfpZv
         sSEWjZ/iKVJgFmoP/H6LCXMnoVvLE3cUx9yaEFPB+hulA7vLb6e6k9ssA09/vBKz0YCV
         o/s4GRY4TsMWk5v1sHBPnnR57w2zknDDJp2+QnCCK60mV70ff8H0pwMWpmZT1N1aIJrx
         TPrw==
X-Gm-Message-State: AAQBX9em+8D2hoGGfbqbRXNMZzSJoNJPFT8DDNVystpu/0fK7PFOmYK6
	KznZ09G5d/uu4qQ5CODmOFV21ulZsQ1jA3jI
X-Google-Smtp-Source: AKy350bof3uST/s/9pKcj0ktKgjrdn5KxhempDvqC74UkFxrzYGgGnwAeOmC2i4gm38HAAfyNcINBg==
X-Received: by 2002:a17:906:f190:b0:931:a321:7640 with SMTP id gs16-20020a170906f19000b00931a3217640mr29388052ejb.74.1680255455987;
        Fri, 31 Mar 2023 02:37:35 -0700 (PDT)
Received: from skbuf ([188.27.184.189])
        by smtp.gmail.com with ESMTPSA id gx20-20020a1709068a5400b00931faf03db0sm790309ejc.27.2023.03.31.02.37.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 31 Mar 2023 02:37:35 -0700 (PDT)
Date: Fri, 31 Mar 2023 12:37:32 +0300
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
Message-ID: <20230331093732.s6loozkdhehewlm4@skbuf>
References: <20230318141010.513424-1-netdev@kapio-technology.com>
 <20230318141010.513424-7-netdev@kapio-technology.com>
 <ZBgdAo8mxwnl+pEE@shredder>
 <87a5zzh65p.fsf@kapio-technology.com>
 <ZCMYbRqd+qZaiHfu@shredder>
 <874jq22h2u.fsf@kapio-technology.com>
 <20230330192714.oqosvifrftirshej@skbuf>
 <871ql5mjjp.fsf@kapio-technology.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <871ql5mjjp.fsf@kapio-technology.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230331_023738_217392_B9EDDEC5 
X-CRM114-Status: GOOD (  22.03  )
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

On Fri, Mar 31, 2023 at 10:06:34AM +0200, Hans Schultz wrote:
> The memory problems are of course on the embedded target. In that case I
> think it would be a very good idea to do something to design the system
> better, so that it frees memory between the subtests.

People like Martin Blumenstingl have managed to deploy and run the
networking kselftests on OpenWRT, which typically runs on very
resource-constrained embedded devices.
https://lore.kernel.org/netdev/CAFBinCDX5XRyMyOd-+c_Zkn6dawtBpQ9DaPkA4FDC5agL-t8CA@mail.gmail.com/
https://lore.kernel.org/netdev/20220707135532.1783925-1-martin.blumenstingl@googlemail.com/

Considering that, you'll have to come with a much more concrete description
of why the system should be "designed better" and "free memory between
subtests" (what memory?!) before you could run it on your target system.

Either that, or at least take into serious consideration the fact that you
may be hung up on doing something which isn't necessary for the end goal.

I simply have no clue what you're talking about. It's as if we're talking
about completely different things.

> If all tests are always run on the bridge only, I think they don't make
> much sense as these patchsets are directed towards switchcores.

Is this supposed to mean something, or is it just a random thought you
had, that you believed it would be good to share with us?

The tools/testing/selftests/net/forwarding/lib.sh central framework has
the NETIF_TYPE and NETIF_CREATE variables, which indicate that by default,
veth interfaces are created. When running a bridge selftest with veth as
bridge ports, indeed software bridging should take place, and those
selftests should work fine. In Linux, the software behavior represents a
model for the offload behavior, since offloads are 100% transparent to
the user most of the time.

Below in lib.sh, there is a line which sources "$relative_path/forwarding.config",
a file which can contain customizations of the default variables used by
the framework. Even though it isn't strictly necessary to put the
customized bash variables in a forwarding.config file, it is more
convenient to do this than to specify them as environment variables.

If you "cd tools/testing/selftests/drivers/net/dsa/", you will find
precisely such a forwarding.config file there, which contains the line
"NETIF_CREATE=no", which means that when you run the symlinked sub-group
of forwarding tests relevant to DSA from this folder, the expectation is
that the bridge ports are not veth interfaces created for the test, but
rather, physical ports.

So, by running the command I posted in the earlier email, you actually
run it on the physical DSA user port interfaces, and it should pass
there too. This is based on the equivalency principle between the
software and the hardware data paths that I was talking about.

If you're actively and repeatedly making an effort to work with your eyes
closed, and then build strawmen around the fact that you don't see, then
you're not going to get very friendly reactions from people, me included,
who explain things to you that pertain to your due diligence. This is
because these people know the things that they're explaining to you out
of their own due diligence, and, as a result, are not easily fooled by
your childish excuses.

