Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 00F57C47088
	for <linux-mediatek@archiver.kernel.org>; Mon, 28 Nov 2022 20:42:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=R2QDZwY4CCKZmNIQN3jmma88d1GFVM4ZLSSSQWOn36o=; b=vE9vkFXRXTCxiUpx7gY1iL/Rkl
	ejN3EEFOl9CAXbMDb34ch3OdViCMVrsctMHiYIXHwPEyrl7+8p3UwI54ixVFXOVXicuUntiE3a4iL
	JrtYvZCxR9NkDtXRiD76UaOH+WDcHiu7hGUSuP/iY+5/l4mEJn3o6SoSiXS4nFT/4hlQr+hbO8a1R
	zzMYrPpOQ4mZwRu70KhTvrQW3d8dDpOThkvT29wtj4aVvMrK/Cdbq1WP7pmaxkCEajfBtW0Qftla4
	lWkclJ+WTayy3fYg7bc5iQ/Rjnkf0gRyCee024/oF9vXVniXgqlThpcpC9e5/tc/oovrlQvRg4+E6
	Ap2sURYA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ozkwx-004Kei-Gz; Mon, 28 Nov 2022 20:41:59 +0000
Received: from mail-pj1-x1031.google.com ([2607:f8b0:4864:20::1031])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ozkwu-004KdR-JS; Mon, 28 Nov 2022 20:41:57 +0000
Received: by mail-pj1-x1031.google.com with SMTP id l22-20020a17090a3f1600b00212fbbcfb78so15222030pjc.3;
        Mon, 28 Nov 2022 12:41:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=R2QDZwY4CCKZmNIQN3jmma88d1GFVM4ZLSSSQWOn36o=;
        b=Xy/8UNSRDI14S5r0lI5NHz5yMWMIJomnO930/oPO687du/EgM4z7agC56GWFp4O2qd
         894TaMTpkf7AIDl+6B5wbhBferQc3OIZE17EJmwuFtR4qwWMP3nHVgrQTKz28IJSZ0l4
         QFoYTH/uNeqfRC9SBaL6yeY3/pFrUs5ZWrKQbHH1QFc02LF+zzKLh5/i/9Z69TJtZxfN
         wUzRpH9wIHaTQ6NbNYWEkpLCoWyAA3Bp0G4Blp3p95lja+aRWblqWIHmKEXWfUrXXFKM
         Z17lk7nwvD40Ov3BUauew6xx8oYbb4SEsvyII0+w8v19OSAdQR/OqD2xMlgrSfeq4rmn
         l3gA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=R2QDZwY4CCKZmNIQN3jmma88d1GFVM4ZLSSSQWOn36o=;
        b=w2JNxt7+5H1krEIevy0dIKsdzHd0kg24MR7PQp1+YIxpnb1FlgxRuWVymMHH8nvHYk
         HT8l4HNneGWnL/IKrX8W2k99Vcc4Kwr34LfTCdFPu4tx8z02fdpfPmc6/t7qlHrLhy0w
         QOqYe/3uu00dGbMQkxxm59+v68xXZyIYmyzFhNdje85v8szusjzkXU1YDLlC0YTqTd2D
         t9EQPqPEg/hY7rJwvc6bfqD3F0zAjX3qOIHKF4Av2jD2Yj2OrAJcL2MWQhdjAvsz15le
         AU60I/WQHTQmguVSuHQf92AtUye1532cx0SvI+nOFo48xjg/nlEkJ/zcEcdSkxok02/O
         9peg==
X-Gm-Message-State: ANoB5pnkBDJm2C10nJzreran/gipncbvqcivDrLAhdPlpVX2SnoulIu1
	Ow8wGno/Dd/+WGMfbpzd8oc=
X-Google-Smtp-Source: AA0mqf5T65D0cVowEV40u2H0G66KM/pmPVf8ZDlEgTcIAnihxpqbp3I/1QWdQBCby8PMC2lmxJK3Aw==
X-Received: by 2002:a17:902:7793:b0:189:24b3:c86 with SMTP id o19-20020a170902779300b0018924b30c86mr34062307pll.84.1669668113599;
        Mon, 28 Nov 2022 12:41:53 -0800 (PST)
Received: from [10.67.48.245] ([192.19.223.252])
        by smtp.googlemail.com with ESMTPSA id w20-20020a17090a529400b00218b32f6a9esm8101579pjh.18.2022.11.28.12.41.42
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 28 Nov 2022 12:41:53 -0800 (PST)
Message-ID: <1b36a516-6c67-3ae0-ed9d-34dc85df3ae9@gmail.com>
Date: Mon, 28 Nov 2022 12:41:40 -0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [PATCH v3 net-next 03/10] dt-bindings: net: dsa: utilize base
 definitions for standard dsa switches
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
 George McCollister <george.mccollister@gmail.com>,
 Rob Herring <robh@kernel.org>
References: <20221127224734.885526-1-colin.foster@in-advantage.com>
 <20221127224734.885526-4-colin.foster@in-advantage.com>
From: Florian Fainelli <f.fainelli@gmail.com>
In-Reply-To: <20221127224734.885526-4-colin.foster@in-advantage.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221128_124156_668106_FE2ED387 
X-CRM114-Status: GOOD (  11.34  )
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
> DSA switches can fall into one of two categories: switches where all ports
> follow standard '(ethernet-)?port' properties, and switches that have
> additional properties for the ports.
> 
> The scenario where DSA ports are all standardized can be handled by
> swtiches with a reference to 'dsa.yaml#'.
> 
> The scenario where DSA ports require additional properties can reference
> the new '$dsa.yaml#/$defs/base'. This will allow switches to reference
> these base defitions of the DSA switch, but add additional properties under
> the port nodes.
> 
> Suggested-by: Rob Herring <robh@kernel.org>
> Signed-off-by: Colin Foster <colin.foster@in-advantage.com>

Reviewed-by: Florian Fainelli <f.fainelli@gmail.com>
-- 
Florian


