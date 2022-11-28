Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0D6F4C4321E
	for <linux-mediatek@archiver.kernel.org>; Mon, 28 Nov 2022 20:41:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=4x2cz+pUzL04s2YSBAxT7mnqCl4qRr39+TaQ3gkx5oI=; b=N3XC39Xs1VkOqw3BSZV1i3rpug
	QTAF1h2+UICr7+n4j5cDAhyRcshNdOxrKbH4JCpQganZLNDZBkNPwCXtdjF6FMa8gcf66UJDh9JRx
	aQ9vAV0V84CBgTaf3RkZWYblouNY06ePNpvDtgeq3PyGun1HAISzCpSLAm2NneqU7rYuOu7T6T6+X
	NK47izPyhsKhM/HvDyj881WqbczkDdRuN6CbjIOQ27QZrND4EUL5bmTLDPfvgzdesNm/cwNqEmhZA
	URhf9kV1Z7QxgERZVohNx3+0Pg9Dcy94WUBhS3/R9XCl2cZfytLNuA86YDomzTk2SAdu05ICmA9S1
	MgjqBD+w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ozkwP-004KXz-EK; Mon, 28 Nov 2022 20:41:25 +0000
Received: from mail-pj1-x1032.google.com ([2607:f8b0:4864:20::1032])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ozkwM-004KWh-Ad; Mon, 28 Nov 2022 20:41:23 +0000
Received: by mail-pj1-x1032.google.com with SMTP id hd14-20020a17090b458e00b0021909875bccso7092088pjb.1;
        Mon, 28 Nov 2022 12:41:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=4x2cz+pUzL04s2YSBAxT7mnqCl4qRr39+TaQ3gkx5oI=;
        b=iidy2FUOryjm0jjaNj2NymgdPB5HRgqMNmCGJQLaotAJ3yjn1YbQFvvXO0RizYfjTQ
         3ItqJt2G/ptOW3oQ2OsVdEB765CmmChan0XipIbiPtXEPeWsxjyVToTzhJ3zXcTdZa7M
         xQHPzbzXcXkYNG9b+NgcFHVXgxRrvEpiw30VtTUb5B3/hMyOgHzmHWETeLZEy4HMKb8P
         woIfEeWzLmxRo9ElND+n11UPs2P1yd+da9VnCTaiiP/BckvrSegV/plN9W1Dys0WikLP
         JYNldVYC3SP3csLffBukhjbHOOUqnu3ENvxYYBAoUJOX42XVf019M+S4VVklLYRGwNbk
         PbQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=4x2cz+pUzL04s2YSBAxT7mnqCl4qRr39+TaQ3gkx5oI=;
        b=StomPpO63UWAgQqnHwsBUPZ8yW2vLXbAnl3kDpqojxXgoGHE+8miPGceY0i4M7V+jh
         T7DhKmaHwzbp29brnY21V9elaQQko2OokrXMzG/dtSle53ULkE6E2B20QOmOmSxpO8Jq
         yXvKc+nQyOrxKgm/diautaQIwPDAMYzBg7k4lfZP7sJTD7H1Gv4Qku7OQZ/LL+1O7dJZ
         hlc8ri22keLjeVP8yuUUj8qgyU2Lme7Id3BWoBTfp7AJ6/LTGC9QrbXjxZbXdX6poQ1H
         94YIf8ilG1TZUmDeOufEDU1qNot/twNWlaG/o6bcfEw7JgIAlnL13sdLvOcjeUCI082t
         yAcQ==
X-Gm-Message-State: ANoB5pnNNzg66pdaERs7Eq41MktHwQL4iQnTMBbybQE3ZuLM54Br9LaO
	vSr1zV1K5qB8tG26n+W70Hs=
X-Google-Smtp-Source: AA0mqf6ssz6JOkao1UdO0ZcUpDH1YQsSUV4r2p30DFnhEHqRbNvtup+TOhbAedXIcdbTRibkC7VCtQ==
X-Received: by 2002:a17:903:22c4:b0:171:5092:4d12 with SMTP id y4-20020a17090322c400b0017150924d12mr34420239plg.107.1669668078666;
        Mon, 28 Nov 2022 12:41:18 -0800 (PST)
Received: from [10.67.48.245] ([192.19.223.252])
        by smtp.googlemail.com with ESMTPSA id c5-20020a170903234500b001885041d7b8sm2435267plh.293.2022.11.28.12.41.08
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 28 Nov 2022 12:41:18 -0800 (PST)
Message-ID: <a25a1d87-2fb8-6ddc-f208-27db3db0e4e6@gmail.com>
Date: Mon, 28 Nov 2022 12:41:06 -0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [PATCH v3 net-next 02/10] dt-bindings: net: dsa: qca8k: remove
 address-cells and size-cells from switch node
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
 <20221127224734.885526-3-colin.foster@in-advantage.com>
From: Florian Fainelli <f.fainelli@gmail.com>
In-Reply-To: <20221127224734.885526-3-colin.foster@in-advantage.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221128_124122_396139_9C950182 
X-CRM114-Status: UNSURE (   9.36  )
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
> The children of the switch node don't have a unit address, and therefore
> should not need the #address-cells or #size-cells entries. Fix the example
> schemas accordingly.
> 
> Suggested-by: Vladimir Oltean <olteanv@gmail.com>
> Signed-off-by: Colin Foster <colin.foster@in-advantage.com>

Reviewed-by: Florian Fainelli <f.fainelli@gmail.com>
-- 
Florian


