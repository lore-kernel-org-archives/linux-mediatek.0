Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 54B32C6FA82
	for <linux-mediatek@archiver.kernel.org>; Tue, 13 Sep 2022 15:51:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=6Zxhbl7LxU5qELLtcpL71bgm+csNbrX5/FOGxIAUqIw=; b=g1mCUY6n+kaWsJTbUeJfRRfVKn
	9S+1VfXN3CjPWCv2l2iUo7T89xeFTwRFsdp2hZXNM4ao9Yv8bFgsAw7LGuFqzwVSOIV0MPLhkYM92
	BJbToC+aTu2PAAJBSyPcphRmK5oLG2gxGY3/lPPpTx+ObGNP8xw9uhuCt6lpIMu/fnBiXA+fonn7+
	AyPyTjOHvj91EPcXo08dxaIKjFaN7M3BTkCtPUHEVFFWab1Lny0I+B1LPP1wdVgOHUEf7sq6pJ5GF
	WM/rOMcOvZ6FmKKhkqVj+9gjdhZb1idNiPjIR82CroTrbcZNBL/CK9pDVWYvvLDZdTcM8wwtw3fX4
	88NwgqZQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oY8CI-00Cou1-RI; Tue, 13 Sep 2022 15:51:38 +0000
Received: from mail-oa1-f46.google.com ([209.85.160.46])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oY8C2-00CohE-J4; Tue, 13 Sep 2022 15:51:23 +0000
Received: by mail-oa1-f46.google.com with SMTP id 586e51a60fabf-1274ec87ad5so33334953fac.0;
        Tue, 13 Sep 2022 08:51:18 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date;
        bh=6Zxhbl7LxU5qELLtcpL71bgm+csNbrX5/FOGxIAUqIw=;
        b=dL/2rMfA5webXUd4+Y4PCLlNTvH7bCB97EVUmOFHd0/XEGnzw7NHpG6ppc19B+HZej
         eBsGjqwkkqRNrTyvaawJoFmRaOXtGVk3bCpcsqwYtRwXUyRC1UN7VaRsl7u4m+MzmBSU
         6cD4x7HKarsmROakpmeqX8crH9p9yM5Lheg7U0e1kBkz4wFQBlAgb6JLgbkajrRWfqoF
         HYuGir0+qItlqUz/l3YGKAjgUdO3I6ASL7dalZgBAdwjIg32JBUKQ3SFp0AoAVVHdB5t
         XC98zKUAAHd5E3Hx/KYT3e22toiraTIhF2EXWXvL/t1wQL0SZd0A+yf9m/0yel69MpCM
         cVCQ==
X-Gm-Message-State: ACgBeo199QMM3Wac4tqQ+DW9MPrnxzz690WzZp793hg5/7/HwHrxHk5t
	62dWTNMN5VpfGrx1keyvlw==
X-Google-Smtp-Source: AA6agR7sudikaulOJjDjKBhjit+p3YIiP/+/9fBG0IadZMnM/tMs/qmmt53+RNlMkYVlbg91XHE0aQ==
X-Received: by 2002:a05:6870:a713:b0:127:70ba:aa86 with SMTP id g19-20020a056870a71300b0012770baaa86mr2184471oam.154.1663084278229;
        Tue, 13 Sep 2022 08:51:18 -0700 (PDT)
Received: from robh.at.kernel.org (66-90-144-107.dyn.grandenetworks.net. [66.90.144.107])
        by smtp.gmail.com with ESMTPSA id x7-20020a4a8d47000000b004728e64dc0fsm5616486ook.38.2022.09.13.08.51.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 Sep 2022 08:51:17 -0700 (PDT)
Received: (nullmailer pid 3801723 invoked by uid 1000);
	Tue, 13 Sep 2022 15:51:16 -0000
Date: Tue, 13 Sep 2022 10:51:16 -0500
From: Rob Herring <robh@kernel.org>
To: Vladimir Oltean <vladimir.oltean@nxp.com>
Cc: Sean Wang <sean.wang@mediatek.com>, Paolo Abeni <pabeni@redhat.com>, 
	Kurt Kanzenbach <kurt@linutronix.de>, DENG Qingfang <dqfext@gmail.com>, 
	=?UTF-8?B?QXLEsW7DpyDDnE5BTA==?= <arinc.unal@arinc9.com>, 
	linux-kernel@vger.kernel.org, 
	George McCollister <george.mccollister@gmail.com>, linux-arm-kernel@lists.infradead.org, 
	linux-renesas-soc@vger.kernel.org, "David S. Miller" <davem@davemloft.net>, 
	Florian Fainelli <f.fainelli@gmail.com>, Linus Walleij <linus.walleij@linaro.org>, 
	Andrew Lunn <andrew@lunn.ch>, Woojung Huh <woojung.huh@microchip.com>, 
	Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>, UNGLinuxDriver@microchip.com, 
	=?UTF-8?B?Q2zDqW1lbnQgTMOpZ2Vy?= <clement.leger@bootlin.com>, 
	devicetree@vger.kernel.org, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, linux-mediatek@lists.infradead.org, 
	Matthias Brugger <matthias.bgg@gmail.com>, Rob Herring <robh+dt@kernel.org>, 
	Landen Chao <Landen.Chao@mediatek.com>, Vladimir Oltean <olteanv@gmail.com>, 
	John Crispin <john@phrozen.org>, Vivien Didelot <vivien.didelot@gmail.com>, Marek Vasut <marex@denx.de>, 
	=?UTF-8?Q?Alvin_=C5=A0ipraga?= <alsi@bang-olufsen.dk>, netdev@vger.kernel.org
Subject: Re: [PATCH net-next 1/3] dt-bindings: net: dsa: mt7530: replace
 label = "cpu" with proper checks
Message-ID: <20220913155116.GA3801652-robh@kernel.org>
References: <20220912175058.280386-1-vladimir.oltean@nxp.com>
 <20220912175058.280386-2-vladimir.oltean@nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220912175058.280386-2-vladimir.oltean@nxp.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220913_085122_657940_5D123195 
X-CRM114-Status: GOOD (  16.05  )
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

On Mon, 12 Sep 2022 20:50:56 +0300, Vladimir Oltean wrote:
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
> ---
>  .../devicetree/bindings/net/dsa/mediatek,mt7530.yaml | 12 +++---------
>  1 file changed, 3 insertions(+), 9 deletions(-)
> 

Acked-by: Rob Herring <robh@kernel.org>

