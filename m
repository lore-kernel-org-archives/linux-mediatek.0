Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3DD81C4332F
	for <linux-mediatek@archiver.kernel.org>; Mon, 12 Dec 2022 18:53:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=p+03j9/sd25fW/ec3sxUeYgGDz5Ls8XeZVp5FCHHr5Q=; b=zQvKroL9YxlTICwzoFVBh4DIO1
	jEcEP7dQ5Dl2kyfB+74j1o82dSbtOfDAXtwgbxAqOfwZh2XEmPAqe5MXi3+Q7VW8lKHc4d+9Cu5zq
	PPLszGT2tKWB4FWHl1Xq7EIR0YHa91oP9yuPM4X75WKywf3KfpzxkQrfzN4+pg3dPSnHjOTCZjvBQ
	jMdTHxKRiqUuY+3sQz8ubZWoJIQa5/t6mqk5RAr9g/2BSPLaKeQJ5R2V5cfvcaB0iRYFKj+vRw/Bu
	L7k31N6RD7pJeeWD/dbcRgeFS+HVJ4El6gg4MlAnYOllTgMa25x3CSjqKoQJ/4fA1+2lpf000pnb2
	zwyOkUaA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p4nvj-003ysr-3X; Mon, 12 Dec 2022 18:53:35 +0000
Received: from mail-ed1-x52d.google.com ([2a00:1450:4864:20::52d])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p4nvf-003yET-Bb; Mon, 12 Dec 2022 18:53:34 +0000
Received: by mail-ed1-x52d.google.com with SMTP id c17so14267731edj.13;
        Mon, 12 Dec 2022 10:53:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=p+03j9/sd25fW/ec3sxUeYgGDz5Ls8XeZVp5FCHHr5Q=;
        b=BWcWBOXe1HRCMC3Fw1CdgGd5KDFTli7aBgvPSZ2iL1vdE23e+HBNIEht76Dl3Vu49a
         H1aTVkdOfaGJZbmFCjTCIbJEGN8K5TrikTmcDtzUkrAnOpx+EvDnuuf0atplLZzb/gkJ
         tl/o1rrBvXa3cNZrB3lVrCJLQ9t3uUYDrjvdzzNRrZzGxD71DupYJ2G3uaB+xywi2bMS
         SymVx+rZ2yveg+aWawWEfFbauV/9tMijXetnXadNbdw1+j+JRnx53hQSViQNRF+wPTWH
         sCMb7FnQSqPCFaMsgFazoBQb2lGbXH9Y7GX4hm1l+qrxt8gtMK8obZoqmE5uUMXZy5Pb
         NC+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=p+03j9/sd25fW/ec3sxUeYgGDz5Ls8XeZVp5FCHHr5Q=;
        b=jiw9uFXyXqEs61st3Sd7I+3FIeH1QPoHnp+4ute9WT/9AD0mcC30bPznQd87nq9hKE
         jw2o4LtajJdTMc8BzNjefkcI0qSpalknvDdqvwY8Fv1e6jNLHN6oDkfAq9IGkAA5i9em
         cWh0Jd6JmIWNfCZDV8b+gObPTT6Bxm6P3b0jydDWy/fJv9uqP3tM792NEd9D3RHoZWAR
         siXRwixLO+wQbVYxu+Tl13xNFfIgkwY1LI3Y1c2Avt76v/fspukbrShtM32ENk+SjdG2
         VkzPReJQtHV57bmSq5DpVPjTIXQPkbJLHIuouyp1onO5aGgR84c8r69KVUGTV2hMm7oB
         YUAA==
X-Gm-Message-State: ANoB5pkVwKOUbZs/MV6J4Swej7Mo4CL95nyOUFEioWA0RQn53R5ntV/b
	s4zRFzma0VlYBHNOykLpD+A=
X-Google-Smtp-Source: AA0mqf5FnmsDemXIdm+4STqH3yMbqsw4AXvCXkOqCGK5r0GwQiBqI9JkDVuMyUc3iZDk+BBzsj42fg==
X-Received: by 2002:a05:6402:5483:b0:467:7b2e:8863 with SMTP id fg3-20020a056402548300b004677b2e8863mr14625809edb.12.1670871210764;
        Mon, 12 Dec 2022 10:53:30 -0800 (PST)
Received: from skbuf ([188.27.185.63])
        by smtp.gmail.com with ESMTPSA id o11-20020a50fd8b000000b00461aca1c7b6sm4151006edt.6.2022.12.12.10.53.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 Dec 2022 10:53:30 -0800 (PST)
Date: Mon, 12 Dec 2022 20:53:27 +0200
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
Subject: Re: [PATCH v5 net-next 07/10] dt-bindings: net: dsa:
 mediatek,mt7530: remove unnecessary dsa-port reference
Message-ID: <20221212185327.kbkydi5gcrjgzwas@skbuf>
References: <20221210033033.662553-1-colin.foster@in-advantage.com>
 <20221210033033.662553-1-colin.foster@in-advantage.com>
 <20221210033033.662553-8-colin.foster@in-advantage.com>
 <20221210033033.662553-8-colin.foster@in-advantage.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20221210033033.662553-8-colin.foster@in-advantage.com>
 <20221210033033.662553-8-colin.foster@in-advantage.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221212_105331_436925_61EB127E 
X-CRM114-Status: UNSURE (   9.69  )
X-CRM114-Notice: Please train this message.
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

On Fri, Dec 09, 2022 at 07:30:30PM -0800, Colin Foster wrote:
> dsa.yaml contains a reference to dsa-port.yaml, so a duplicate reference to
> the binding isn't necessary. Remove this unnecessary reference.
> 
> Signed-off-by: Colin Foster <colin.foster@in-advantage.com>
> Suggested-by: Vladimir Oltean <olteanv@gmail.com>
> Reviewed-by: Arınç ÜNAL <arinc.unal@arinc9.com>
> Reviewed-by: Florian Fainelli <f.fainelli@gmail.com>
> Reviewed-by: Rob Herring <robh@kernel.org>
> ---

Reviewed-by: Vladimir Oltean <olteanv@gmail.com>

