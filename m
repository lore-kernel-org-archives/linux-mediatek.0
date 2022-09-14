Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DC3FCC6FA8B
	for <linux-mediatek@archiver.kernel.org>; Wed, 14 Sep 2022 15:07:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=DHDk+ujBwhDBhgTz7mEiQ8aG+EOFTq+3XFCnw+r6W5g=; b=TEFOZTYDaOBfj5MOZvhLz6+FMe
	p4IDh37MdVmtkEKeWW5M6UpEu5wligvlWbC2g6121rKXQPHrRJ8hUvX4ZY1QekCIqhAKMu1ieEDwu
	6Hoyur8nRUiqKsNPG+vdemah6ygYX4/TKsBLvo8e7bAcu4LVG6+MiCLcuGjuy9FV8IQ68IYVR4d7E
	xptNSvv7vTEP9KVZh2tJK7pKvF3MkajK/QnN/alZYCcxSD6fMIopcKl5a81DKQJM6fSSmkzZ8GxIf
	z7tK3lcOigVKMJwKbcM5r9nQKZ+6DYIPnDLtXVpyz2GCVhW+YWPQL54v355kDz2YJy7AbOcR5rmI2
	ETgHxyyw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oYTya-003GyZ-7o; Wed, 14 Sep 2022 15:06:56 +0000
Received: from mail-ot1-f51.google.com ([209.85.210.51])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oYTyW-003Gt8-K0; Wed, 14 Sep 2022 15:06:54 +0000
Received: by mail-ot1-f51.google.com with SMTP id e35-20020a9d01a6000000b0065798eb8754so1442132ote.2;
        Wed, 14 Sep 2022 08:06:50 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date;
        bh=DHDk+ujBwhDBhgTz7mEiQ8aG+EOFTq+3XFCnw+r6W5g=;
        b=3G/NOlm6UkBIm2UQ2jFCiWu1/cDgCIwX5AYmw2mSuMbIwthx83Y3J3NqnGfInSKOEL
         B3oFijIcv6tdbwAe0yMAZ8JU1zuq2jPHVTjIAc4k8fPo+EAyIXiVMz2v5xZ/4ub/pAZ3
         Ni+VF0KuU/J6OSMqxUibqm3UcxU6fDMMcKgnNY03nviLM0kKgt+Cbtl7fNnuLisVyrTI
         Pm2SXdPShQK/QxTAvIfQP/ddD48qyLMmg2Jzyzn2KLlqW5DkeQamyFQmIesNfCRe0IJk
         ARlXwKZsc6Ub6LYzOiB1e0vy2A9+IO11ZiqTgXXswt8fqkLexPYSuO/u8nfYq3xI/wIL
         CgLQ==
X-Gm-Message-State: ACgBeo2VyryswNQCzymJh2bborPTClieEmcCgW46trV+WqIBN0vC8Z5E
	HRqAEycpPeKUqaSDJQEJvg==
X-Google-Smtp-Source: AA6agR792Z7UA4vog+YncnU/+uNb0qn6XVDArhATm/jBKo9QXacFuu0opFQm/3EpAA4itn5bYq/LIg==
X-Received: by 2002:a05:6830:2645:b0:638:99dc:e5e0 with SMTP id f5-20020a056830264500b0063899dce5e0mr15510808otu.80.1663168010178;
        Wed, 14 Sep 2022 08:06:50 -0700 (PDT)
Received: from robh.at.kernel.org (66-90-144-107.dyn.grandenetworks.net. [66.90.144.107])
        by smtp.gmail.com with ESMTPSA id p15-20020a0568301d4f00b006393ea22c1csm7399789oth.16.2022.09.14.08.06.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Sep 2022 08:06:49 -0700 (PDT)
Received: (nullmailer pid 2226063 invoked by uid 1000);
	Wed, 14 Sep 2022 15:06:48 -0000
Date: Wed, 14 Sep 2022 10:06:48 -0500
From: Rob Herring <robh@kernel.org>
To: =?utf-8?B?QXLEsW7DpyDDnE5BTA==?= <arinc.unal@arinc9.com>
Cc: Sergio Paracuellos <sergio.paracuellos@gmail.com>, linux-mediatek@lists.infradead.org, Thomas Bogendoerfer <tsbogend@alpha.franken.de>, linux-arm-kernel@lists.infradead.org, Jakub Kicinski <kuba@kernel.org>, Sean Wang <sean.wang@mediatek.com>, erkin.bozoglu@xeront.com, Vivien Didelot <vivien.didelot@gmail.com>, Florian Fainelli <f.fainelli@gmail.com>, Rob Herring <robh+dt@kernel.org>, Landen Chao <Landen.Chao@mediatek.com>, netdev@vger.kernel.org, DENG Qingfang <dqfext@gmail.com>, Paolo Abeni <pabeni@redhat.com>, Andrew Lunn <andrew@lunn.ch>, Vladimir Oltean <olteanv@gmail.com>, devicetree@vger.kernel.org, Matthias Brugger <matthias.bgg@gmail.com>, "David S . Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-mips@vger.kernel.org, Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 01/10] dt-bindings: net: drop old mediatek bindings
Message-ID: <20220914150648.GA2225972-robh@kernel.org>
References: <20220914085451.11723-1-arinc.unal@arinc9.com>
 <20220914085451.11723-2-arinc.unal@arinc9.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20220914085451.11723-2-arinc.unal@arinc9.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220914_080652_727742_4C308BF6 
X-CRM114-Status: UNSURE (   9.51  )
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

On Wed, 14 Sep 2022 11:54:42 +0300, Arınç ÜNAL wrote:
> Remove these old mediatek bindings which are not used.
> 
> Signed-off-by: Arınç ÜNAL <arinc.unal@arinc9.com>
> ---
>  .../bindings/net/mediatek,mt7620-gsw.txt      | 24 --------
>  .../bindings/net/ralink,rt2880-net.txt        | 59 -------------------
>  .../bindings/net/ralink,rt3050-esw.txt        | 30 ----------
>  3 files changed, 113 deletions(-)
>  delete mode 100644 Documentation/devicetree/bindings/net/mediatek,mt7620-gsw.txt
>  delete mode 100644 Documentation/devicetree/bindings/net/ralink,rt2880-net.txt
>  delete mode 100644 Documentation/devicetree/bindings/net/ralink,rt3050-esw.txt
> 

Acked-by: Rob Herring <robh@kernel.org>

