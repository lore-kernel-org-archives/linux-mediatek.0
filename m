Return-Path: <SRS0=BnLp=IJ=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.2 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,
	NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C025CC433DB
	for <linux-mediatek@archiver.kernel.org>; Thu, 11 Mar 2021 03:21:34 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 443A564FA1
	for <linux-mediatek@archiver.kernel.org>; Thu, 11 Mar 2021 03:21:34 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 443A564FA1
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:To:Subject:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=WsmmpPKtbm0iwSlogP2+uxprrB7lEPoT5uefOJwbP2k=; b=gdXUPoelsobmROOoNZSWBP9MI
	T6bCraIbsHlZH0SRPyIXGGwKYlOXDB9c2ezJuLjuzPHfn+6JZsyAy4eP1oEbMcDLM0Kc0eFowc/5I
	WXq79RUMhky/QoP6yyevnisBSlLwgZzNkMUPEc6SrQ1XpozSyiYq3sZxiZ07pmhlapaEiqWKWEh6L
	vJ/bLr/iGp7ty0f3p2rQ7cowBaK240AnF0mZwVMjFJ3ZouJFqXW1jABulumdBGudJLzoU2NtmjP25
	tNO2M3pdekflXJYbxh+Kl/HSdpQjE4vIEPyM0ArjDqPNsOuBSCNb/vbofnHkY+/07JYpnpjC86ShU
	cgZRxTztw==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lKBt7-008ICq-2W; Thu, 11 Mar 2021 03:21:25 +0000
Received: from mail-pj1-x102e.google.com ([2607:f8b0:4864:20::102e])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lKBt3-008IC0-PZ; Thu, 11 Mar 2021 03:21:23 +0000
Received: by mail-pj1-x102e.google.com with SMTP id bt4so2753503pjb.5;
 Wed, 10 Mar 2021 19:21:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:references:from:message-id:date:user-agent:mime-version
 :in-reply-to:content-language:content-transfer-encoding;
 bh=Ivcy7Ra48iIN4fx9xpDqQ0r9uvJj0RhC3xsJ+4+M9iU=;
 b=hYxB/u6+hGcYGbqzJPZ4n+/YI9KIHDNbEmLn8g+mdbX+cCoWaGweefCTDixi2LzIhS
 0JvxCVfQO1M5ROnGAZ5hGSPutHS465fxaAXVosQn6JdE9A8vE3Nq4KdZ+SBqjW3oMESa
 bt9oWgULGfJ825ReLVN2CZSWltXvVe+3FxIY+4RZ4KMG5zJzKWGz87XOT22ejroq0WmZ
 QCPMxFyy4piD0WzUSC5td3xRyCjt9D4nU8SQY0nGj58WFFVr0s8t0ac+bWDwpZlFJzky
 d+C6x3YJ8WRlk/2DuWBgsJc3EBvRBop9NdCmAufc4sIAY1ANG6McLtnv8gw4TTKHR+ON
 yFDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=Ivcy7Ra48iIN4fx9xpDqQ0r9uvJj0RhC3xsJ+4+M9iU=;
 b=e3lJ0Znq9cVpSvkkcSfpD64aXbVQeBCN4H05ZwTP1icvhnBBxEWHK40RJq4stvs8G5
 pE9fTW+c5bN6h9J7u2aI+156p1m5Z5LRV1ie6Ig5AxQ/XIhLa62F9J9Us3jpAMRIEsTO
 kMkOotu7XiNvXDwC7ptoe5jfMB12lbkGR62XlbF+CzhwRN5dCSpVNRbtpjpi7YxX1HXT
 STm9C1Xt0THWGpqd5XD2re/LIt9hKJXd23ih/m1V9l1qi0NoWdiYIL7Vw7YPYmqlzHVz
 iMMS1Db69+16ZfID34FpsK1JrHe1li3w8jxtEGxe9Rk/m01lDima9F32o5ZQvbciJlpM
 tBTA==
X-Gm-Message-State: AOAM530QaImU5PtkTL9SZ1UDt1lIU81xolmO5Bv56/giu92w7SIn9Kyu
 hY7UnjRYaBvf7jGK3ZWN8N0=
X-Google-Smtp-Source: ABdhPJyj+GyJRKG6iL6Nx3uSY7ZT0SWl2tNgBCpdqHyf/QQZBu1QJgB57lu9L31MorFZqGua4kz9eQ==
X-Received: by 2002:a17:90a:a584:: with SMTP id
 b4mr6724628pjq.186.1615432880340; 
 Wed, 10 Mar 2021 19:21:20 -0800 (PST)
Received: from [10.230.29.30] ([192.19.223.252])
 by smtp.gmail.com with ESMTPSA id y16sm778432pgl.58.2021.03.10.19.21.18
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 10 Mar 2021 19:21:19 -0800 (PST)
Subject: Re: [PATCH net] net: dsa: mt7530: setup core clock even in TRGMII mode
To: Ilya Lipnitskiy <ilya.lipnitskiy@gmail.com>,
 Sean Wang <sean.wang@mediatek.com>, Landen Chao <Landen.Chao@mediatek.com>,
 Andrew Lunn <andrew@lunn.ch>, Vivien Didelot <vivien.didelot@gmail.com>,
 Vladimir Oltean <olteanv@gmail.com>, "David S. Miller"
 <davem@davemloft.net>, Jakub Kicinski <kuba@kernel.org>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Philipp Zabel <p.zabel@pengutronix.de>, Russell King
 <linux@armlinux.org.uk>, netdev@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 linux-kernel@vger.kernel.org
References: <20210311012108.7190-1-ilya.lipnitskiy@gmail.com>
From: Florian Fainelli <f.fainelli@gmail.com>
Message-ID: <79be95b7-0c56-f831-2f3f-5a41006d0037@gmail.com>
Date: Wed, 10 Mar 2021 19:21:17 -0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Firefox/78.0 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <20210311012108.7190-1-ilya.lipnitskiy@gmail.com>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210311_032121_923606_710B65B2 
X-CRM114-Status: GOOD (  10.15  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org



On 3/10/2021 5:21 PM, Ilya Lipnitskiy wrote:
> A recent change to MIPS ralink reset logic made it so mt7530 actually
> resets the switch on platforms such as mt7621 (where bit 2 is the reset
> line for the switch). That exposed an issue where the switch would not
> function properly in TRGMII mode after a reset.
> 
> Reconfigure core clock in TRGMII mode to fix the issue.
> 
> Tested on Ubiquiti ER-X (MT7621) with TRGMII mode enabled.
> 
> Fixes: 3f9ef7785a9c ("MIPS: ralink: manage low reset lines")
> Signed-off-by: Ilya Lipnitskiy <ilya.lipnitskiy@gmail.com>

Reviewed-by: Florian Fainelli <f.fainelli@gmail.com>
-- 
Florian

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
