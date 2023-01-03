Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B1133C46467
	for <linux-mediatek@archiver.kernel.org>; Tue,  3 Jan 2023 16:50:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ZtSxpSjX58ynpD01H51Yz32AIwKbxvwZO/htBdjgQhU=; b=UXvejQ7ULXzoU/0sg//PoKx57Z
	4mCFOiqeo9KosL2m3PN5c8SFUEAVBvCyMXAZiKD1UpAyqwilSRR3i86eoTqCJuUZnjsPQmZh7e2oo
	AP1zPXwvfm/oU8IDJ61LbOeurPMTFLdvYJSjzeilo4ncjI3f1iMAlNpO2zcH06VmbRR9ZiLxfWDfz
	+2yUzsByTKTYVRCR2/WdzOalzkfmcRnHv74UWCpWSu/LBROLg7ZxREo+mMFnMREWvLA6mweqYqHJ5
	V+sVgUI6aPvxP0sExGQyXBCw+MkfXcMrZr6RSI/beHAEi+ZaPrsn3AhmHMCftTZj+bwW7QCA7lBQS
	IQKXVcgA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pCkUv-0036Op-HI; Tue, 03 Jan 2023 16:50:45 +0000
Received: from mail-ej1-x635.google.com ([2a00:1450:4864:20::635])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pChlF-001iMR-Nn; Tue, 03 Jan 2023 13:55:28 +0000
Received: by mail-ej1-x635.google.com with SMTP id ud5so73805048ejc.4;
        Tue, 03 Jan 2023 05:55:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=ZtSxpSjX58ynpD01H51Yz32AIwKbxvwZO/htBdjgQhU=;
        b=NWvGHpwyDNWGPavMB83+2pIXyyjvNcMRZF7kNLcgZILW4LhyNZhueL9uCOFlYStAxX
         a5yChIeoLzAIk75K/SD7/Q6RmenE2Ie3nRtEN1YwUjEWUgzoUm2e/lc/WYLuV5BWrpnp
         cukx7TMS1vciDJqH1yho4Vd4gsunpPcGLS7+7LMwEGfoGhxODaGxVm0lEzbfSDbY+6dF
         jnVgQSrvead51nVPKMBVSmc70iMkIiVExjJBBARX1qoID8wQuJ9q+LgJBdmfU3gbAR/s
         hJ/j3B9j3VMqYr3OZ9z7yLXQAbMamIg0fWWnu4h56ZEfkZesTprxp3knCWqYs5GHsFAx
         d18A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ZtSxpSjX58ynpD01H51Yz32AIwKbxvwZO/htBdjgQhU=;
        b=a7lrpc7VzBdFwJe4CcCjT2cTQ4sdtlMRRZ2KlHybQhGrFgcM0byZu3p5FuUF3fc1e/
         ihFl9W+8vWh8tD1AYudiUB7M/I3lDbIqip6McJ+bP87vv3GHgorhk+80xaGkClY/6AWc
         3zC7ocUEOg7BIlUqzgHz74MxWn2dY1M6S8sRgKnmlsCCxiVM7IwhrtlijW//WxWpN49e
         SuF784wK2WWWAH37tZXe+3YzJXDmCt3dmRXNXCCMf7Y+FyxHQ/0+NvTzfFSlg+SQpzGF
         EQb2z8ZCfR4fv3YODKeTs/DBdzPD/xcAtJNquyP/heSDeA/8JVYEwUIC7ip7DO2OSy0g
         mrAA==
X-Gm-Message-State: AFqh2kop964i6dqIQgM6L5AUz36gp/dccAef5d/k3gF9kybtgdbio/fg
	5UCk6iHAyHb6Fb8GW7L0cTE=
X-Google-Smtp-Source: AMrXdXul+Qhor0TFBD82nysJpNI3VhxWK05SAKn9RHHdHtJl9+gmsiDFWAngpR8gHsFYoJeQk44dqA==
X-Received: by 2002:a17:907:7d8f:b0:7b5:911c:9b12 with SMTP id oz15-20020a1709077d8f00b007b5911c9b12mr46938748ejc.1.1672754122626;
        Tue, 03 Jan 2023 05:55:22 -0800 (PST)
Received: from skbuf ([188.26.185.118])
        by smtp.gmail.com with ESMTPSA id j18-20020a1709066dd200b0080345493023sm13998125ejt.167.2023.01.03.05.55.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Jan 2023 05:55:22 -0800 (PST)
Date: Tue, 3 Jan 2023 15:55:19 +0200
From: Vladimir Oltean <olteanv@gmail.com>
To: Michael Walle <michael@walle.cc>
Cc: Heiner Kallweit <hkallweit1@gmail.com>,
	Russell King <linux@armlinux.org.uk>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Jose Abreu <Jose.Abreu@synopsys.com>,
	Sergey Shtylyov <s.shtylyov@omp.ru>, Wei Fang <wei.fang@nxp.com>,
	Shenwei Wang <shenwei.wang@nxp.com>,
	Clark Wang <xiaoning.wang@nxp.com>,
	NXP Linux Team <linux-imx@nxp.com>,
	Sean Wang <sean.wang@mediatek.com>,
	Landen Chao <Landen.Chao@mediatek.com>,
	DENG Qingfang <dqfext@gmail.com>,
	Florian Fainelli <f.fainelli@gmail.com>,
	Matthias Brugger <matthias.bgg@gmail.com>, netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org, Andrew Lunn <andrew@lunn.ch>,
	Geert Uytterhoeven <geert+renesas@glider.be>
Subject: Re: [PATCH RFC net-next v2 08/12] net: ethernet: freescale: xgmac:
 Separate C22 and C45 transactions for xgmac
Message-ID: <20230103135519.oai43rj3waigqi54@skbuf>
References: <20221227-v6-2-rc1-c45-seperation-v2-0-ddb37710e5a7@walle.cc>
 <20221227-v6-2-rc1-c45-seperation-v2-8-ddb37710e5a7@walle.cc>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20221227-v6-2-rc1-c45-seperation-v2-8-ddb37710e5a7@walle.cc>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230103_055526_124538_BD0A807C 
X-CRM114-Status: GOOD (  19.57  )
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

Commit message can be: "net/fsl: xgmac_mdio: Separate C22 and C45 transactions".

On Wed, Dec 28, 2022 at 12:07:24AM +0100, Michael Walle wrote:
> From: Andrew Lunn <andrew@lunn.ch>
> 
> The xgmac MDIO bus driver can perform both C22 and C45 transfers.
> Create separate functions for each and register the C45 versions using
> the new API calls where appropriate.
> 
> Signed-off-by: Andrew Lunn <andrew@lunn.ch>
> Signed-off-by: Michael Walle <michael@walle.cc>
> ---
> v2:
>  - [al] Move the masking of regnum into the variable declarations
>  - [al] Remove a couple of blank lines

Tested-by: Vladimir Oltean <vladimir.oltean@nxp.com>

>  
> -/*
> - * Reads from register regnum in the PHY for device dev, returning the value.
> +/* Reads from register regnum in the PHY for device dev, returning the value.
>   * Clears miimcom first.  All PHY configuration has to be done through the
>   * TSEC1 MIIM regs.
>   */

I have some reservations regarding the utility of the comments in this
driver. It's surely not worth duplicating them between C22 and C45.
It might also be more productive to just delete them, because:

 - miimcom is a register accessed by fsl_pq_mdio.c, not by xgmac_mdio.c
 - "device dev" doesn't really refer to anything (maybe "dev_addr").
 - I don't understand what is meant by the comment "All PHY configuration
   has to be done through the TSEC1 MIIM regs". Or rather said, I think I
   understand, but it is irrelevant to the driver for 2 reasons:
    * TSEC devices use the fsl_pq_mdio.c driver, not this one
    * It doesn't matter to this driver whose TSEC registers are used for
      MDIO access. The driver just works with the registers it's given,
      which is a concern for the device tree.
 - barring the above, the rest just describes the MDIO bus API, which is
   superfluous

