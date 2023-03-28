Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 605FDC76195
	for <linux-mediatek@archiver.kernel.org>; Tue, 28 Mar 2023 11:49:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=d/r365YzR4z2GUjbK/bi1SZFXqHlnLKc6PIvPNZ2lRc=; b=famPuUorigt+UM8b/VfDPYYwzQ
	/nJxdJQIIoPLMrzva/6HyPzfXi/jh78Ga771j9fDFvF9uHDvT38dDsvVAeVGaXBboxC4Z2vJkDDmV
	loqz4ZRBabAAA40SE/n32QOFaDX63UXa2eos7VdElvwBIcgBmeDZOP9VGDUHm52pO9McOhtO6JKs+
	PP6FRz9GbR8eQgXYDO/miy7Et9lboK8rtVYnzcn1YR50MMUuKtmbk2J2fVX5tF6zeud/9ELVKg76W
	JdmGb8fKMHRUEvt3DD4KnmlknT6p8WIncCOgUdMr7TKBPiGzLDKd9pV4zI7CngPHCZJ9h1eyWd6LX
	dR0F6kGw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1ph7pp-00EDmk-1A;
	Tue, 28 Mar 2023 11:49:53 +0000
Received: from mail-wm1-x332.google.com ([2a00:1450:4864:20::332])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1ph7pk-00EDkn-2Y;
	Tue, 28 Mar 2023 11:49:50 +0000
Received: by mail-wm1-x332.google.com with SMTP id o24-20020a05600c511800b003ef59905f26so7207086wms.2;
        Tue, 28 Mar 2023 04:49:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1680004187;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=d/r365YzR4z2GUjbK/bi1SZFXqHlnLKc6PIvPNZ2lRc=;
        b=iO58f6tcmkzPWSbg7kupiEHtiApSvwACv57rpe3rm8RiJ8ouJG59UwXU2DToee2okr
         IUcYWKye6jJmJYfvu8eeByd1gtdC96vRX3/BCxhGs4KBB4vGDv0S0sCZHvk0eYBn69ov
         DcIjL4WpuncS0QlGPlBdg+C1Br3J70PkHveOmrnjimVIIMLw9HqmvqulopAjRdWAmEza
         AyVJoxGQYq5mBYBpvZVkYVsLfS8aBpjvkPZanvSjSmzb6xDTVCLb1so2EId6nM29koss
         74FFqqK2KtSZzXaFwagq5m/p/yrL+kpn7s0ykdfZInmR9zV5ehKdmn0DDBgYgvfVxhbf
         V/hg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680004187;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=d/r365YzR4z2GUjbK/bi1SZFXqHlnLKc6PIvPNZ2lRc=;
        b=PaolrkWekcR9ezG+EP+hYH0VNLbl45ZhAF0OqNa94IFhP1Z5hLtcikcOSBl5Z56knP
         LNR0tkgdZ5tlykyCE0qBvqTlAgJEsEBLIGb9XBOFtcdI01I8IG8gfqugIegpEOcv7nQx
         +mnY2oLgfhpspQkjp5YKnFDCtC8ZqVomJuERYEcoSfrmluLp27fnM6fA82MD61S05olY
         WYOQjqfFCP5a3mvYgRBNti1OhpyICdte4CUzsOVO6+e0XOsDxnjhdb5BpfWQbD9a2yTp
         Obrn8vz9Ih0/FtuwmwWh3/OBntToNaUlxjlk476qZchz7khho/om5ro4blBPwuaD8lia
         mItQ==
X-Gm-Message-State: AO0yUKWLCNCkqd/fvTtlEP60QizlzVgb2dwbcmLRBEc7dDWqm21Hda7W
	aDplkwAs+y1Wy/AMQwyQKUM=
X-Google-Smtp-Source: AK7set+zTszhDgDoSbIPu4QLbK7SYfkBZiuqVsVMkXIAf2QkJVEAEbWd1vEqziskOOvC8WeShKxd4A==
X-Received: by 2002:a05:600c:3795:b0:3ed:a82d:dffb with SMTP id o21-20020a05600c379500b003eda82ddffbmr11330072wmr.40.1680004187137;
        Tue, 28 Mar 2023 04:49:47 -0700 (PDT)
Received: from skbuf ([188.27.184.189])
        by smtp.gmail.com with ESMTPSA id u15-20020a05600c210f00b003ed2433aa4asm17097652wml.41.2023.03.28.04.49.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 28 Mar 2023 04:49:46 -0700 (PDT)
Date: Tue, 28 Mar 2023 14:49:43 +0300
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
Message-ID: <20230328114943.4mibmn2icutcio4m@skbuf>
References: <20230318141010.513424-1-netdev@kapio-technology.com>
 <20230318141010.513424-3-netdev@kapio-technology.com>
 <20230327115206.jk5q5l753aoelwus@skbuf>
 <87355qb48h.fsf@kapio-technology.com>
 <20230327160009.bdswnalizdv2u77z@skbuf>
 <87pm8tooe1.fsf@kapio-technology.com>
 <20230327225933.plm5raegywbe7g2a@skbuf>
 <87ileljfwo.fsf@kapio-technology.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <87ileljfwo.fsf@kapio-technology.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230328_044948_843951_9559C1D9 
X-CRM114-Status: GOOD (  24.12  )
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

On Tue, Mar 28, 2023 at 01:04:23PM +0200, Hans Schultz wrote:
> On Tue, Mar 28, 2023 at 01:59, Vladimir Oltean <olteanv@gmail.com> wrote:
> >
> > which idea is that, again?
> 
> So I cannot us the offloaded flag as it is added by DSA in the common
> case when using 'bridge fdb replace ... dynamic'.

Why not? I find it reasonable that the software bridge does not age out
a dynamic FDB entry that is offloaded to hardware... the hardware should
do that ("dynamic" being the key). At least, I find it more reasonable
than the current behavior, where the bridge notifies dynamic FDB entries
to switchdev, but doesn't say they're dynamic, and switchdev treats them
as static, so they don't roam from one bridge port to another until
software sees a packet with that MAC DA, and they have the potential of
blocking traffic because of that.

If for some reason you do think that behavior is useful and still want
to keep it (I'm not sure I would), I would consider extending struct
switchdev_notifier_fdb_info with a "bool pls_dont_age_out", and I would
make dsa_fdb_offload_notify() set this to true if the driver did
actually install the dynamic FDB entry as dynamic in the ATU.

> 
> The idea is then to use the ext_learn flag instead, which is not aged by
> the bridge. To do this the driver (mv88e6xxx) will send a
> SWITCHDEV_FDB_ADD_TO_BRIDGE switchdev event when the new dynamic flag is
> true. The function sending this event will then be named
> mv88e6xxx_add_fdb_synth_learned() in
> drivers/net/dsa/mv88e6xxx/switchdev.c, replacing the
> mv88e6xxx_set_fdb_offloaded() function but in most part the same
> content, just another event type.

Basically you're suggesting that the hardware driver, after receiving a
SWITCHDEV_FDB_ADD_TO_DEVICE and responding to it with SWITCHDEV_FDB_OFFLOADED,
emits a SWITCHDEV_FDB_ADD_TO_BRIDGE which takes over that software
bridge FDB entry, with the advantage that the new one already has the
semantics of not being aged out by the software bridge.

hmmm... I'd say that the flow should work even with a single notifier
emitted from the driver side, which would be SWITCHDEV_FDB_OFFLOADED,
perhaps annotated with some qualifiers that would inform the bridge a
certain behavior is required. Although, as mentioned, I think that in
principle, "pls_dont_age_out" should be unnecessary, because it just
papers over the issue that switchdev drivers treat static and dynamic
FDB entries just the same, and "pls_dont_age_out" would be the
differentiator for an issue that should have been solved elsewhere, as
it could lead to other problems of its own.

Basically we're designing around a workaround to a problem to which
we're turning a blind eye. These are my 2c.

