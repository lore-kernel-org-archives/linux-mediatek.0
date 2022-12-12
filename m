Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CF0B7C4332F
	for <linux-mediatek@archiver.kernel.org>; Mon, 12 Dec 2022 18:48:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=tDsiZVcT6LKv7qv4YhKSrW1h5gXitQdAoJlA0RCwOu8=; b=q5z7S31KJB5xLgptHzVQhO71c/
	iDo9fTRDoJ805j6kVCDfSqRWKgCCbl5Nwi+F6pboe/+AvA3ApRcoqDCQercW6mvFPwo7KQH4hSmQG
	zMbO/qW7H8ck1JRRK8YeffUDgViMBNQ8ihYP+A+FULmqzjJaDfQGuq1WtMy2bDfuqjX9VEbX0kk0+
	LFWY5AietZlaxxd8Kha3PXxVuuala/gqvgTMdUuq/PdZwwFEZoHDOLwN+EGMnLjh/vsb5pFfZ018/
	odFqbpIGpCVKJrrSnEuvk0yWDi+1abKTI+bGHjYCFjIFv/SaTmRqrQNTCGn/pF3EQgICB2EiaFnIg
	jKP0ieeg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p4nr7-003teL-0o; Mon, 12 Dec 2022 18:48:49 +0000
Received: from mail-ed1-x52c.google.com ([2a00:1450:4864:20::52c])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p4nr4-003tYW-G0; Mon, 12 Dec 2022 18:48:47 +0000
Received: by mail-ed1-x52c.google.com with SMTP id i15so14299018edf.2;
        Mon, 12 Dec 2022 10:48:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=tDsiZVcT6LKv7qv4YhKSrW1h5gXitQdAoJlA0RCwOu8=;
        b=HP/Xkt3w9LogTnaJ422r+uFe6+l3afLWuFBe+9OVrnLwVPm5ZQBnuzS+iWXyFqhx6b
         FDABNAclChq/qR7zEfj65N5HOHRPV7SE+pVuUcvPV4LSgvi+DMYGnUUNsIRkk+bOFcPd
         sMHot19nZZWPzZOE46VY5fw6NSvrXQJTNrhyul+Bw1rTDg4MV4B3GeG+lPD736Ykq3nN
         uZl8SXRjxFoGtU82QjK8zmTaA2+cljVEmTyrdjedNeJGPxuIVFWa+3pFmrwL7ypbRU1P
         07LVxnLtufZ2rf8G1shkghekIwBssniWsTxiwnYm+6Y2sOvyenhus6gQurGgkGk5d1HW
         WtVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=tDsiZVcT6LKv7qv4YhKSrW1h5gXitQdAoJlA0RCwOu8=;
        b=G1r2zCZomlRnWS9hdv6JJTzE8wDl3oo4Rhw1poYcQrGWtIzCs70q8GvJY9n/ned01W
         qsZ1LrG7vyKff7r9TE+5tU9VILoGgWjdWNu/IaEUMoCFd28h2Ca4QmdrjVsYY5KgKB2g
         ffQfhnuSG2VNyIRTro+VjuabSLDn7xv8VWMNsTpDpHSPyUARZoC1yQbjmXpifhXhc+fy
         l7mFeeaW/yMl1pjCgVo7SUM+Qo8zcBCkfDeL+Hsjm761zlNEyHFvwSABZgWlbDcwRduG
         luWmekiZ+5dKMGn46cmpu+5qUvb1LPlPn9PnD5kQHJnb5WsbAaL5/ExZHBhWWqfi842j
         4QIw==
X-Gm-Message-State: ANoB5pn9IMYF2graNAEayf7ofYOgZt6qK/FsAM7f+VKrOBorHPre4LVa
	PZ6Iq5W9iYN7SUZU5+caRgI=
X-Google-Smtp-Source: AA0mqf5Qocjl8+YpMT20fwcLZCQ4QL1cX+13/KOp6puSW8LFCIkKbdkD+FctF1YbdtV8nHiMimPtQQ==
X-Received: by 2002:a05:6402:3901:b0:468:3d69:ac89 with SMTP id fe1-20020a056402390100b004683d69ac89mr17524046edb.20.1670870924925;
        Mon, 12 Dec 2022 10:48:44 -0800 (PST)
Received: from skbuf ([188.27.185.63])
        by smtp.gmail.com with ESMTPSA id n13-20020a05640204cd00b004677b1b1a70sm4053373edw.61.2022.12.12.10.48.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 Dec 2022 10:48:44 -0800 (PST)
Date: Mon, 12 Dec 2022 20:48:41 +0200
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
Subject: Re: [PATCH v5 net-next 04/10] dt-bindings: net: dsa: utilize base
 definitions for standard dsa switches
Message-ID: <20221212184841.siswunoxmkyek2hb@skbuf>
References: <20221210033033.662553-1-colin.foster@in-advantage.com>
 <20221210033033.662553-5-colin.foster@in-advantage.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20221210033033.662553-5-colin.foster@in-advantage.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221212_104846_554440_8B019102 
X-CRM114-Status: GOOD (  12.89  )
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

On Fri, Dec 09, 2022 at 07:30:27PM -0800, Colin Foster wrote:
> DSA switches can fall into one of two categories: switches where all ports
> follow standard '(ethernet-)?port' properties, and switches that have
> additional properties for the ports.
> 
> The scenario where DSA ports are all standardized can be handled by
> switches with a reference to the new 'dsa.yaml#/$defs/ethernet-ports'.
> 
> The scenario where DSA ports require additional properties can reference
> '$dsa.yaml#' directly. This will allow switches to reference these standard
> definitions of the DSA switch, but add additional properties under the port
> nodes.
> 
> Suggested-by: Rob Herring <robh@kernel.org>
> Signed-off-by: Colin Foster <colin.foster@in-advantage.com>
> Reviewed-by: Linus Walleij <linus.walleij@linaro.org>
> Reviewed-by: Florian Fainelli <f.fainelli@gmail.com>
> Reviewed-by: Rob Herring <robh@kernel.org>
> Acked-by: Alvin Šipraga <alsi@bang-olufsen.dk> # realtek
> Acked-by: Arınç ÜNAL <arinc.unal@arinc9.com>
> ---

Reviewed-by: Vladimir Oltean <olteanv@gmail.com>

