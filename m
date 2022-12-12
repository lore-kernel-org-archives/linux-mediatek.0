Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 26338C00145
	for <linux-mediatek@archiver.kernel.org>; Mon, 12 Dec 2022 18:46:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=LIqnjaezngtLNEp7isLzPA2shfRnfoXIJoBf7CQ93rI=; b=nOljF594BvzI8+307yzx8tVj6O
	FvXOAURJbbUnC1dDvd23sfNGhdAhQgAp/v8eyluFLWiDkeB7WhANONxpup+Rfxp7vBP2yYEf5Csfr
	7+W08zRLBQyTETyd4jMifI/hWlqLeUc/AvGxzDpXUNBZFY6vFzc91d2M81bC+D56iXn2LVNw9UlnX
	DiT37cOrjwNI8N1K3S+Kbvx5PHNTvPIAk3+aV8biAMaq8IlqqO4O20+1EmZy6p60tPDhEKTTAAlM4
	dhvr1gD7kJJA9BoZp3zSJIRu8Y22knXAoNSiP/ZJ50/YjfXub7m40LQgTGGSCd7XTfrzjfK5TkLtk
	FuV/HxUg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p4nok-003rRk-Bu; Mon, 12 Dec 2022 18:46:22 +0000
Received: from mail-ed1-x534.google.com ([2a00:1450:4864:20::534])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p4noh-003rJF-Jk; Mon, 12 Dec 2022 18:46:20 +0000
Received: by mail-ed1-x534.google.com with SMTP id c17so14231411edj.13;
        Mon, 12 Dec 2022 10:46:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=LIqnjaezngtLNEp7isLzPA2shfRnfoXIJoBf7CQ93rI=;
        b=H8uWIP4eO1YxQwxoLb4ulLb1Xl2vq8gtcgHk7otP2Mh5hIp+8F1jyt4VNVIPnpjKYb
         ex9nMsCcDfnFTip94C35t/M2MeStVjExWFDjCVzf7evIq8y1Q7xyRu6jN0eVOJR4k21q
         EZK6dmfOWIYDGTFrQNijxRPmeh/oWF0xphbrVm+j53kccYsMtkGeU9W3h+LfQ4DwAiC3
         xFam0IPCI8gmSJRuXEyr5FBdZHqxl/vul3a1Ei5Ln98IGzEpiC0p7Rdhxt6hOoBfdzWN
         w0fPzdPPK9jLva12as1gic8LWTpAGtrlhEBEZV6lSK+ixjMXQNTA7n8d9Sz/gCsrJjou
         wUpw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=LIqnjaezngtLNEp7isLzPA2shfRnfoXIJoBf7CQ93rI=;
        b=b/GcbXz4A59q3qNbkIn2ROP5W9gMLPKfLZvsISFrm9XWjH1UghO6Dv8ZZ2pK7KALpU
         xvbqlMVjiwQfzEEKwSIMv76ChaEAl0QnHZY1lwwNdc/ywYv3DaF60CbH2ONP61oasg5B
         REQpJv8D06b9pRgfOCOoYTy8C9WBBZSVdnYADE1O1I/EId8N28FEzAEHBaTuOKlgLaod
         VUhxup/avtqBNZORp+lx8XdTGO13HC/s8bwyR0kjRJKEZAMtcvYRk4npZeItCUt+P4Ve
         yJuCUoIRYdnBD17TIWlYc0zSTIslxFdwsRQ61dDCXejzPj/Ajt5a2gasC16zWXubMOtY
         ZQtw==
X-Gm-Message-State: ANoB5pmnSLOun7YnK3rCD2TPlmXj9mvMMINom8yzIs21aIH1ggRJZjlg
	FSQjhd6VIBMivO2nv/H1yvg=
X-Google-Smtp-Source: AA0mqf5qcPywMWUxBv1Oz1+GiwzWTko+mCdn6kipC6jyixD652tjVTc3o34OIe6BDffAtWUTbjTCww==
X-Received: by 2002:a05:6402:7ca:b0:46b:aa:8564 with SMTP id u10-20020a05640207ca00b0046b00aa8564mr12728933edy.30.1670870775491;
        Mon, 12 Dec 2022 10:46:15 -0800 (PST)
Received: from skbuf ([188.27.185.63])
        by smtp.gmail.com with ESMTPSA id d4-20020a056402516400b0046b00a9eeb5sm4090784ede.49.2022.12.12.10.46.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 Dec 2022 10:46:15 -0800 (PST)
Date: Mon, 12 Dec 2022 20:46:12 +0200
From: Vladimir Oltean <olteanv@gmail.com>
To: Colin Foster <colin.foster@in-advantage.com>
Cc: linux-renesas-soc@vger.kernel.org, linux-mediatek@lists.infradead.org,
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
	Kurt Kanzenbach <kurt@linutronix.de>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Rob Herring <robh+dt@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Eric Dumazet <edumazet@google.com>,
	"David S. Miller" <davem@davemloft.net>,
	Florian Fainelli <f.fainelli@gmail.com>,
	Andrew Lunn <andrew@lunn.ch>,
	George McCollister <george.mccollister@gmail.com>,
	Rob Herring <robh@kernel.org>
Subject: Re: [PATCH v5 net-next 02/10] dt-bindings: net: dsa: sf2: fix
 brcm,use-bcm-hdr documentation
Message-ID: <20221212184612.dyjlhxucybn6jh7m@skbuf>
References: <20221210033033.662553-1-colin.foster@in-advantage.com>
 <20221210033033.662553-3-colin.foster@in-advantage.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20221210033033.662553-3-colin.foster@in-advantage.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221212_104619_664758_1F7B1683 
X-CRM114-Status: GOOD (  10.85  )
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

On Fri, Dec 09, 2022 at 07:30:25PM -0800, Colin Foster wrote:
> The property use-bcm-hdr was documented as an entry under the ports node
> for the bcm_sf2 DSA switch. This property is actually evaluated for each
> port. Correct the documentation to match the actual behavior and properly
> reference dsa-port.yaml for additional properties of the node.
> 
> Suggested-by: Rob Herring <robh@kernel.org>
> Signed-off-by: Colin Foster <colin.foster@in-advantage.com>
> Acked-by: Florian Fainelli <f.fainelli@gmail.com>
> Reviewed-by: Rob Herring <robh@kernel.org>
> ---

Reviewed-by: Vladimir Oltean <olteanv@gmail.com>

