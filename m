Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7F17CC54EE9
	for <linux-mediatek@archiver.kernel.org>; Tue, 13 Sep 2022 15:57:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=UXdtqi6HBBB/B8fCTaBiJara3bZ6zFCee1eqkkfM+Lc=; b=lxFt1F1gDYgCa3Bt+KF+mDN8Tv
	OBlGt+YmlyYt4dlOxsLeq5rMZOTIgPcxCfSuTn8VJAoY+l0zp71AWJvmRkjqSkQGKSUqm+glq79Jh
	ELYXOAFQ1VcUgNJGeV2FZ3w+yFgtTFhVOytwxIGczLqsWI3nMKsHQt54fPRac2quVqT6/U1N4XFyn
	goF/TVV31IZmoUzOngJwJys9EBv3Ht4VD+sVCeIjuJnuoTUV9C+5BsnV1PMf9+YQy9qpvdNMWcTLs
	JqlxAzWrr95xbM9wCbM1F8B9+p7S9LNfn20MD+3C31yvFnCxROOvUHuqTROriEilcId3g4o/iGzeB
	a0zb+42A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oY8HS-00Ctds-IP; Tue, 13 Sep 2022 15:56:58 +0000
Received: from sender4-op-o14.zoho.com ([136.143.188.14])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oY8GQ-00CsYq-Gj; Tue, 13 Sep 2022 15:55:55 +0000
ARC-Seal: i=1; a=rsa-sha256; t=1663084516; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=ZNzr5cS4PoJX7wrZG10Q6TWliR6BgVKQGmJuJp6wuGoslH4+TGng3s7jrnaGjRAjmw8Cqce1vIQesxOOuRys2c0xIjKoLqD8VIMI/z+Vvyk5fPOiUOmyaF0lNPgGlxgta20Z8p6bP6V72G/cE7GGwKAkmtO2rsN821TMmut9+Po=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1663084516; h=Content-Type:Content-Transfer-Encoding:Cc:Date:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:To; 
	bh=UXdtqi6HBBB/B8fCTaBiJara3bZ6zFCee1eqkkfM+Lc=; 
	b=hcfi3ncwg7YEepO9spUIwS0TzNYzpTjD7lhEM6GdDYCcD3xuGxEiCg/BISASXeVTIno+/zSHDRLI2e1tOD+E1WstQ2nY0p8hxcHU++1J9mBqwvpjZp+q7XJqOKNDL4d4uA3KtqXh6FT8hfVyDsBcZmh/Q4eke3eKPE8LxGDjt88=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=arinc9.com;
	spf=pass  smtp.mailfrom=arinc.unal@arinc9.com;
	dmarc=pass header.from=<arinc.unal@arinc9.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1663084516;
	s=zmail; d=arinc9.com; i=arinc.unal@arinc9.com;
	h=Message-ID:Date:Date:MIME-Version:Subject:Subject:To:To:Cc:Cc:References:From:From:In-Reply-To:Content-Type:Content-Transfer-Encoding:Message-Id:Reply-To;
	bh=UXdtqi6HBBB/B8fCTaBiJara3bZ6zFCee1eqkkfM+Lc=;
	b=Rbar/MDmOBryUQ8XdW0t8OZeH1xMp9m57JRXhs5Ql7oy9JFxA4Gmtr6nBPgfJo8M
	dMRrOpaoHgxk3W5qOgIb02mEPXxdKfV9OAZXuzxB2cL/BF2Btq526hRzzuSrGruYGDd
	Tg1ed8yk6TOc5UguU++CudJuGlqe87qZvKo9iTAk=
Received: from [10.10.10.3] (37.120.152.236 [37.120.152.236]) by mx.zohomail.com
	with SMTPS id 1663084512771268.36068470563725; Tue, 13 Sep 2022 08:55:12 -0700 (PDT)
Message-ID: <68902e34-8ef4-994b-8e89-d42b55aeaaec@arinc9.com>
Date: Tue, 13 Sep 2022 18:55:05 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH net-next 1/3] dt-bindings: net: dsa: mt7530: replace label
 = "cpu" with proper checks
Content-Language: en-US
To: Vladimir Oltean <vladimir.oltean@nxp.com>, netdev@vger.kernel.org
Cc: Andrew Lunn <andrew@lunn.ch>, Vivien Didelot <vivien.didelot@gmail.com>,
 Florian Fainelli <f.fainelli@gmail.com>, Vladimir Oltean
 <olteanv@gmail.com>, "David S. Miller" <davem@davemloft.net>,
 Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 George McCollister <george.mccollister@gmail.com>,
 Kurt Kanzenbach <kurt@linutronix.de>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Woojung Huh <woojung.huh@microchip.com>, UNGLinuxDriver@microchip.com,
 Linus Walleij <linus.walleij@linaro.org>,
 =?UTF-8?Q?Alvin_=c5=a0ipraga?= <alsi@bang-olufsen.dk>,
 =?UTF-8?B?Q2zDqW1lbnQgTMOpZ2Vy?= <clement.leger@bootlin.com>,
 Landen Chao <Landen.Chao@mediatek.com>, DENG Qingfang <dqfext@gmail.com>,
 Sean Wang <sean.wang@mediatek.com>, Marek Vasut <marex@denx.de>,
 John Crispin <john@phrozen.org>, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, linux-renesas-soc@vger.kernel.org
References: <20220912175058.280386-1-vladimir.oltean@nxp.com>
 <20220912175058.280386-2-vladimir.oltean@nxp.com>
From: =?UTF-8?B?QXLEsW7DpyDDnE5BTA==?= <arinc.unal@arinc9.com>
In-Reply-To: <20220912175058.280386-2-vladimir.oltean@nxp.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ZohoMailClient: External
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220913_085554_646910_A3E92071 
X-CRM114-Status: GOOD (  13.54  )
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

On 12.09.2022 20:50, Vladimir Oltean wrote:
> The fact that some DSA device trees use 'label = "cpu"' for the CPU port
> is nothing but blind cargo cult copying. The 'label' property was never
> part of the DSA DT bindings for anything except the user ports, where it
> provided a hint as to what name the created netdevs should use.
> 
> DSA does use the "cpu" port label to identify a CPU port in dsa_port_parse(),
> but this is only for non-OF code paths (platform data).
> 
> The proper way to identify a CPU port is to look at whether the
> 'ethernet' phandle is present.
> 
> Signed-off-by: Vladimir Oltean <vladimir.oltean@nxp.com>

I realised "dt-bindings: net: dsa: mt7530:" prefix is used here instead 
of the usual "dt-bindings: net: dsa: mediatek,mt7530:". Does this matter?

Arınç

