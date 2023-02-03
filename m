Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 77086C61DA4
	for <linux-mediatek@archiver.kernel.org>; Fri,  3 Feb 2023 21:52:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=bipQcfxxgHejuf8Mvmt0Oehiv6b0QTtaEvVKGh1al5w=; b=gtcfETpnjYpRj3cBszlvDU1UzF
	4aExf0LNB4GV+z4U47nzoq6nRMmmxCyNE0xGD+snKW+RxqEoZMYjSRE9AfvIg8xK28L5VxOu4Mu6j
	OPEOUdsQTwGwzF/RP1RX54muGlhqg0+H4qiksO6+Md/odPDgm7LYKlrvtH6GT+hr5XPH6kccpBkpl
	3DTM1iZgwZKFlRrZz7DDbtss40bl4UWioJtyUMNTjyOt81M8u4txXRlI2LXKZKZ4ZlAETUfck/DHj
	KkRr8kBtrU6fkQToXndKJVn1XPGiU8YNcDyAgh//7qvY0YO5D7OZMZAYTkRPd05Oop23LYMKLXKaN
	ZiavI6QQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pO3yX-003hI2-0o; Fri, 03 Feb 2023 21:52:05 +0000
Received: from mail-wm1-x32f.google.com ([2a00:1450:4864:20::32f])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pO3yQ-003hG8-Ad; Fri, 03 Feb 2023 21:52:02 +0000
Received: by mail-wm1-x32f.google.com with SMTP id bg13-20020a05600c3c8d00b003d9712b29d2so6961303wmb.2;
        Fri, 03 Feb 2023 13:51:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=bipQcfxxgHejuf8Mvmt0Oehiv6b0QTtaEvVKGh1al5w=;
        b=UR5pGoQIBPoQMoUsfVzez1iVL+03ECJZOFeQMeWqSw9ysZHfIhjz2/GoLPtPORKdyD
         kjZrF0rjAPYHRSzwTCFQPLB/YkVNouPkxo2nyZhf2D+StDGMANC6Vdr4RKbqe94lZp/G
         IEQZrV/DVZwGMHDgG9Tmd7NNP6C9jfqQSKr+GPeExRZ9TBaItLV4EywgkwP0YKpZQ4Ic
         GOfmhuDO3nMqIppGygCMi8347qW7BGuFkuqDGhwpAHfEAi2NQWo3TaSzec7CZiT1FHgN
         Alln5Qoy891T/2dVSBCAogFDypj9DM+RKhM2sW35fb63qBLK6wOoWDyLlocQ04/B0nAk
         ZS3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=bipQcfxxgHejuf8Mvmt0Oehiv6b0QTtaEvVKGh1al5w=;
        b=7LfoI+x3I4cueUBaufXVHFKtmViMPVagcXooEMTk4nLPwNXcFBf7oiz0GC0bENJVuK
         tV++j5WBxF1JAPGg5sSDORjlj04O3ZPv9obXK1iKV2JdURFOf9axArRHC8+lGG9tTJxp
         lOd1GV14VZeecTJ1FyBm0cTa/KV9ULnmLDHe7OwQOY6DpzfC7NFfFo5ic2Dft/k45RLO
         /Iqfn4EopXqTHHG+Ag0qioKKED4H3RXCiwb3qWE7hFELt2pixiXIbJBLeOh0e7X1Fir4
         c44LIDX0sEgE1XbAaiedh1B60547j6hRVS+Ke8ThVU6K0ZPEeqFOVG2Aqxut3na/VJOu
         RDiQ==
X-Gm-Message-State: AO0yUKXKtMds6uZkTtJDqkrYAnLqcMv1/wCdZ28BR5YgS4BmIYUBBDzZ
	2h/m4wWtpmZW41196Qo00Ns=
X-Google-Smtp-Source: AK7set9qtv0vcegLPmhzyEhGngSRE68XavVQ16mxDVL3f7zdabhOU9eMvM9mXSjnxhEqd4oMKvNpLA==
X-Received: by 2002:a05:600c:2110:b0:3dc:5093:3457 with SMTP id u16-20020a05600c211000b003dc50933457mr10778847wml.10.1675461113943;
        Fri, 03 Feb 2023 13:51:53 -0800 (PST)
Received: from skbuf ([188.26.57.116])
        by smtp.gmail.com with ESMTPSA id a6-20020a05600c068600b003dc3d9fb09asm3615409wmn.47.2023.02.03.13.51.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 03 Feb 2023 13:51:53 -0800 (PST)
Date: Fri, 3 Feb 2023 23:51:50 +0200
From: Vladimir Oltean <olteanv@gmail.com>
To: Daniel Golle <daniel@makrotopia.org>
Cc: netdev@vger.kernel.org, linux-mediatek@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	Russell King <linux@armlinux.org.uk>,
	Heiner Kallweit <hkallweit1@gmail.com>,
	Lorenzo Bianconi <lorenzo@kernel.org>,
	Mark Lee <Mark-MC.Lee@mediatek.com>,
	John Crispin <john@phrozen.org>, Felix Fietkau <nbd@nbd.name>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	DENG Qingfang <dqfext@gmail.com>,
	Landen Chao <Landen.Chao@mediatek.com>,
	Sean Wang <sean.wang@mediatek.com>, Paolo Abeni <pabeni@redhat.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Eric Dumazet <edumazet@google.com>,
	"David S. Miller" <davem@davemloft.net>,
	Florian Fainelli <f.fainelli@gmail.com>,
	Andrew Lunn <andrew@lunn.ch>, Jianhui Zhao <zhaojh329@gmail.com>,
	=?utf-8?B?QmrDuHJu?= Mork <bjorn@mork.no>
Subject: Re: [PATCH 1/9] net: ethernet: mtk_eth_soc: add support for MT7981
 SoC
Message-ID: <20230203215150.k2txv7trkwgmz6vr@skbuf>
References: <cover.1675407169.git.daniel@makrotopia.org>
 <301fa3e888d686283090d58a060579d8c2a5bebb.1675407169.git.daniel@makrotopia.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <301fa3e888d686283090d58a060579d8c2a5bebb.1675407169.git.daniel@makrotopia.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230203_135158_389069_BAC91B79 
X-CRM114-Status: UNSURE (   8.29  )
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

On Fri, Feb 03, 2023 at 07:00:21AM +0000, Daniel Golle wrote:
> The MediaTek MT7981 SoC comes two 1G/2.5G SGMII, just like MT7986.

comes /with/ two 1G/2.5G SGMII /ports/

