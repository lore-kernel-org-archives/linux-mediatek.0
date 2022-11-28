Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B2E0FC433FE
	for <linux-mediatek@archiver.kernel.org>; Mon, 28 Nov 2022 20:47:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=+a308E9n0+BsJ+GD+yH9OTTarCe7rpTnFkBE4bloDA4=; b=oyuUTufeLtjOg70/vs9OJoPWjI
	h+wTV1PI1QCcXq27EMM3o0+GI/NjZ+PDrMf7ZOWzAIEBvXON52JUc4HLJLNwoOfsSn7ah4Op5vuq2
	6GgaSdKOq5Iredpkdfc+o9rnQbckMbkWIcZ9kyUakrUcv1iiiKBhkYZRNGQqt1nLt7KQmtStLfRl8
	hzJeSHGNHo2Yz7ecOfWBJo752gX8CyhRn8a/G5VOTAmCU714tzry6qVEDvJvBvCU0Wo9UVGYmBWoD
	n3kwM9UeUQP4RD+UxzY3JtDljQKTJn5t7si7aLrBXyDO2xuP/VZTPrMiOJ6mP5T9OSp7dRZ/iuW6P
	M3sB6OIg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ozl2I-004MWa-Ta; Mon, 28 Nov 2022 20:47:30 +0000
Received: from mail-pl1-x62b.google.com ([2607:f8b0:4864:20::62b])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ozl2G-004MVt-K1; Mon, 28 Nov 2022 20:47:29 +0000
Received: by mail-pl1-x62b.google.com with SMTP id w23so11351099ply.12;
        Mon, 28 Nov 2022 12:47:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=+a308E9n0+BsJ+GD+yH9OTTarCe7rpTnFkBE4bloDA4=;
        b=KiOS99RBN/UCbLYsrhj0wGDMNNpqML3eSh3NkVw79KVu/q2xbFsucge1Fx8Vajm+p0
         c+2z4unDH7Z4To9kAqmpgp2UA0PfpjjCnKNmCvpdScnjACHKayTBbRrFVgkwb4FxBZF7
         0z7AwARUOAvjkl3FApNj1r+Sk0+FVTkVcxsgG3/Z1/1f+n8xRXc21D3ONcYzfo+YAhS7
         4WUrruMY+5sLtfKwwDLJq6BthKWl6iRCYJIJCAcZi1koLvwqoqArp5aDX3GGFFwZtbRM
         PWUfXplz1KHNY6q3Wi1sxKyiXzEF17s8ok52iwmUQvGKwrdoJ04xxScEihmBbTEIeXh9
         7i+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=+a308E9n0+BsJ+GD+yH9OTTarCe7rpTnFkBE4bloDA4=;
        b=eZumXFNcZuNx7SQ7QJkoyQ4FlMXeFY+eMLE9cUh6yfWsaiV65gBteE9eBYNb5rnDXM
         TW7Itxt8t/lIaTomHo7eF7YZMCVtiHkYlxwTVdnKrcdLVZS1Wzut1iMw+3NOvs0TrLz0
         bG4Tv6B9czn9R2lJh4q7C6mPpEBBBxhzFNuuPT4Pbv3F2q2OYT+lStXJ4cq1Q4afGdzy
         6AEuva0SguY8UgOMPwTK1FrUpwsjSIHcryolc22Bh5xNYe/jKWjrtoqccs7CcVLdCN9T
         hQq1G+1xivsyDM+tzjl1kiQ9Pq22L3tJRJHwv8SYWHYx91Z46ijZl72oA7UlZFL8nX9I
         2A+Q==
X-Gm-Message-State: ANoB5pm7a0lVO1VXyt+C+FknR2bk/AA+0GydNF2ergQoxnnr49OpXYCz
	Di32IFVIi5FVnS84zOP7vHk=
X-Google-Smtp-Source: AA0mqf5KR5J4KA6OryCqEhwhS5fiBTncCvtZXnlE1zasZUm34SA+YWcLNxdEIn+euwoZ//iuHt8gJA==
X-Received: by 2002:a17:90a:de93:b0:219:4139:7589 with SMTP id n19-20020a17090ade9300b0021941397589mr4432484pjv.188.1669668447924;
        Mon, 28 Nov 2022 12:47:27 -0800 (PST)
Received: from [10.67.48.245] ([192.19.223.252])
        by smtp.googlemail.com with ESMTPSA id s6-20020a170902ea0600b0017f36638010sm9184618plg.276.2022.11.28.12.47.17
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 28 Nov 2022 12:47:27 -0800 (PST)
Message-ID: <515a94f2-95b3-3c00-58d7-488deb16b64b@gmail.com>
Date: Mon, 28 Nov 2022 12:47:15 -0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [PATCH v3 net-next 09/10] dt-bindings: net: add generic
 ethernet-switch-port binding
Content-Language: en-US
To: Colin Foster <colin.foster@in-advantage.com>,
 linux-renesas-soc@vger.kernel.org, linux-mediatek@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 devicetree@vger.kernel.org, netdev@vger.kernel.org
Cc: John Crispin <john@phrozen.org>,
 Alexandre Belloni <alexandre.belloni@bootlin.com>,
 Claudiu Manoil <claudiu.manoil@nxp.com>, Marek Vasut <marex@denx.de>,
 Sean Wang <sean.wang@mediatek.com>, DENG Qingfang <dqfext@gmail.com>,
 Landen Chao <Landen.Chao@mediatek.com>, =?UTF-8?B?bsOnIMOcTkFM?=
 <arinc.unal@arinc9.com>, Vivien Didelot <vivien.didelot@gmail.com>,
 =?UTF-8?B?Q2zDqW1lbnQgTMOpZ2Vy?= <clement.leger@bootlin.com>,
 =?UTF-8?Q?Alvin_=c5=a0ipraga?= <alsi@bang-olufsen.dk>,
 Linus Walleij <linus.walleij@linaro.org>, UNGLinuxDriver@microchip.com,
 Woojung Huh <woojung.huh@microchip.com>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Kurt Kanzenbach <kurt@linutronix.de>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Rob Herring <robh+dt@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 Jakub Kicinski <kuba@kernel.org>, Eric Dumazet <edumazet@google.com>,
 "David S. Miller" <davem@davemloft.net>, Vladimir Oltean
 <olteanv@gmail.com>, Andrew Lunn <andrew@lunn.ch>,
 George McCollister <george.mccollister@gmail.com>
References: <20221127224734.885526-1-colin.foster@in-advantage.com>
 <20221127224734.885526-10-colin.foster@in-advantage.com>
From: Florian Fainelli <f.fainelli@gmail.com>
In-Reply-To: <20221127224734.885526-10-colin.foster@in-advantage.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221128_124728_705719_B0795DCB 
X-CRM114-Status: UNSURE (   9.37  )
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

On 11/27/22 14:47, Colin Foster wrote:
> The dsa-port.yaml binding had several references that can be common to all
> ethernet ports, not just dsa-specific ones. Break out the generic bindings
> to ethernet-switch-port.yaml they can be used by non-dsa drivers.
> 
> Signed-off-by: Colin Foster <colin.foster@in-advantage.com>
> Suggested-by: Vladimir Oltean <olteanv@gmail.com>

Reviewed-by: Florian Fainelli <f.fainelli@gmail.com>
-- 
Florian


