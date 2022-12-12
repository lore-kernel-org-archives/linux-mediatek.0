Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EF2BAC4332F
	for <linux-mediatek@archiver.kernel.org>; Mon, 12 Dec 2022 10:56:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=0ueHMi2mIOmzpz327lFnzb2ZBYr+ALhB5gftG35Fae8=; b=kdy7ICnccjpzebmq9OHX74fgB4
	DgW6GkEJnjp1Nz3O2xmaug7h3bazUdHbd1M9hM3Ww6wokeClQZ3zUc26paHB9Oxpyb0HGBp0UOb/1
	QtFm+Mp+WdGzJ7uOdC4ecIumUSv50gh6LDsUSUZV1Mp7h6mAK62BZrnjrGq3teHy6C4ycVvVtWpAk
	0P/FTMZQ8E/1awrxMrjvd55NCxwqV1yb+x5EBDCVtj4LkC7lu7iHyM3iuEFSS3yGo9HHPrEX/SAMq
	SOSCJkKNluxUzmYEttBJRlig4n6FebOZYhwyBRRIrdFs/foucLEpCt1LjgECb1OezS9fzvAnqWr11
	gZOqEFYQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p4gUC-00Dk13-Sw; Mon, 12 Dec 2022 10:56:40 +0000
Received: from mail-ej1-x62d.google.com ([2a00:1450:4864:20::62d])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p4gTL-00Di4B-2X; Mon, 12 Dec 2022 10:55:48 +0000
Received: by mail-ej1-x62d.google.com with SMTP id qk9so26962558ejc.3;
        Mon, 12 Dec 2022 02:55:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=0ueHMi2mIOmzpz327lFnzb2ZBYr+ALhB5gftG35Fae8=;
        b=a0j4vd2PYcbV5vGVf5kujUaxiBQ0GBPWAizLVh3tEou21Qq8DVGG1dvLL6RoMI4io8
         N5GS1jAeVsS6EXOVKRRMUT6eIyehLYnH77sN9PDfB6dPjswcIM2k0eai/zlvXFyztve3
         wJ0yAfUe0DhSkBSTlCPba8CCLgaw0M8e4NhBXC9OxHWCWi4GE4Yi6vwkB9jBu+Lh+Uwk
         dRVhtIBp/1N8UdfX7L8w5XgLdJjX65MWejcnf0YXuo803ATTuhibwgcjEpNtjWOLfqDA
         FfE4aX21QmTqW8awDBY60YryZa6/kyI3RphpZSV6CcRCkfTM3df8YjnH/CA0RAR9FM/H
         bQ5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0ueHMi2mIOmzpz327lFnzb2ZBYr+ALhB5gftG35Fae8=;
        b=YdrDO4lQwp3HhpgbunOPPov2Ke7As16ErADhG9is0mh0E6XTlDHuMbxot/vS679GV4
         mjdhae7xsA7l+Bl4in45516zeuEsl2SncuIWjfSaDTs42IFs8cyIxf7QKfP1Qjw0UNxi
         FLgxL+H58oGqS10s6qU0Y8kPl596ks9+Cfmx0dB+KfnkFnrYCDQaOyzMDFQNLx4ziJb1
         Vkk4WqxlawXuWwveUS8s4SCgAh+az8PG44MqvYOLNMk4GKYzbMCj9ekQB39snIsWTQT6
         36FL7CbjMA+HpwOw3da4KUuO+VvLIhlbaPhpANyydDAQ3Jb4k2odIUFPk/6+j1soJehv
         IDRQ==
X-Gm-Message-State: ANoB5pltcDElAbyfrTZEKhSrIEjqL7pjqJfHOiLhpwCpq8CiF3jgO/by
	QdkcnJTGFIrSaAtBAcxwza4=
X-Google-Smtp-Source: AA0mqf4xwN0tcH6tlYgdq8vREyR2Z4T8Do7BCzqe/UwSecrAbQSclnTtoDopcOUTqjX6offYOSW+Xg==
X-Received: by 2002:a17:906:2a85:b0:7b2:7181:2489 with SMTP id l5-20020a1709062a8500b007b271812489mr16709516eje.13.1670842542364;
        Mon, 12 Dec 2022 02:55:42 -0800 (PST)
Received: from skbuf ([188.27.185.63])
        by smtp.gmail.com with ESMTPSA id u17-20020a170906409100b007c0b6e1c7fdsm3114024ejj.104.2022.12.12.02.55.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 Dec 2022 02:55:41 -0800 (PST)
Date: Mon, 12 Dec 2022 12:55:38 +0200
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
	George McCollister <george.mccollister@gmail.com>
Subject: Re: [PATCH v5 net-next 01/10] dt-bindings: dsa: sync with maintainers
Message-ID: <20221212105538.ijybw4v26tozjspr@skbuf>
References: <20221210033033.662553-1-colin.foster@in-advantage.com>
 <20221210033033.662553-2-colin.foster@in-advantage.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20221210033033.662553-2-colin.foster@in-advantage.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221212_025547_197695_250923DB 
X-CRM114-Status: GOOD (  10.02  )
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

On Fri, Dec 09, 2022 at 07:30:24PM -0800, Colin Foster wrote:
> The MAINTAINERS file has Andrew Lunn, Florian Fainelli, and Vladimir Oltean
> listed as the maintainers for generic dsa bindings. Update dsa.yaml and
> dsa-port.yaml accordingly.
> 
> Signed-off-by: Colin Foster <colin.foster@in-advantage.com>
> Suggested-by: Vladimir Oltean <olteanv@gmail.com>
> 
> ---

Reviewed-by: Vladimir Oltean <olteanv@gmail.com>

