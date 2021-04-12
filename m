Return-Path: <SRS0=8MWw=JJ=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.7 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_GIT autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0618DC433ED
	for <linux-mediatek@archiver.kernel.org>; Mon, 12 Apr 2021 15:09:05 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A418A6128E
	for <linux-mediatek@archiver.kernel.org>; Mon, 12 Apr 2021 15:09:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org A418A6128E
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=ir3ky8+Io0cd/1yNYdyCZzx5mI92tlu57yIgpbnvn9c=; b=KwoHW/tWIvTlzXlDP/zbXMXR3
	rN6LuI3ehdxALQIT06ORgzrJna8lB0LAEtFA8so69P71AYwFBPbNm1vlWFeACQcb+Dux8HBWqUY06
	XzBPFNGl0e/nqGbUfb3xLDfhn5UXsJ0tNup/rfI257VAbyog9oiiywQwbHouNjopzQK/Yl971Iksn
	WPfTx3H7vV9nEy5EIiX2OD90Rvz2Wh9Gfb4x8PpyyyStQULsHIokA5rOBaJcc+WTyLoq/Sy08iPNd
	uSXchWA5wljon2jJ0iF6GW0CENKnbgZlP/NYaYu+YHpBNn0CapYBRB1XZXTbYbj7dUA6G3eAvTqhd
	ckwGUadNQ==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lVyBK-0072Bt-E5; Mon, 12 Apr 2021 15:08:54 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lVyBH-0072BR-Oa
 for linux-mediatek@desiato.infradead.org; Mon, 12 Apr 2021 15:08:52 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
 Content-Type:MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:
 To:From:Sender:Reply-To:Content-ID:Content-Description;
 bh=7c5hbFDJuzW8IbaNLbCCwK5N29exubinPApJnJHDfR0=; b=le39IbnGJ81fXcP7EPrMGoLj1j
 L+EylYKre06v8DJ0kl3tnl7ffX6c+Xg8I1SnNvLomlRzNpKL6DxkfgO5rCwxmIa/FKG7XUAQApPi9
 Ry1KZYWkl4UbsWh0nY2upToy7uIhiw8m56rwtZZycDQ8NIAhJKcEfp82puy+2QDHW88LywjIyceXU
 +LV6arOeMBj4IaUOte2ekZ307QXApXYbYY/pVNE6iWzWZJalDwSDI8J5Bg4xuhgI3ZjPddPaYiP/R
 n54JSlxUN2KSNiXLH/zKGhxKgZYhLCsfVaW/A+Va7G5Hu557IkcwQHcVx3TCNN1hDIOjOeN1oxQeG
 N6M1C51g==;
Received: from mail-pg1-x52f.google.com ([2607:f8b0:4864:20::52f])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lVyBF-006KcI-Bj
 for linux-mediatek@lists.infradead.org; Mon, 12 Apr 2021 15:08:50 +0000
Received: by mail-pg1-x52f.google.com with SMTP id z16so9615089pga.1
 for <linux-mediatek@lists.infradead.org>; Mon, 12 Apr 2021 08:08:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-disposition:content-transfer-encoding;
 bh=7c5hbFDJuzW8IbaNLbCCwK5N29exubinPApJnJHDfR0=;
 b=ITLLe2DYMYPMeZVGTkOR3bOoGfykAoYj/bQy2kCNye+lBUJ4XaLgFBgV6f2/yXfdd7
 oFAVX0mQPwwymASavuDGXYqCdTXy47ZVJ/xlr9FH+qYoJ0kyvIHWC7SglHHDqrO50knq
 erVGGF9AYHklUu3pGvXTBSIB1dK/wjQF3ksPtYKoYc3UTmIXSSS5oIwQ8EYvT/rFv2Qw
 B9VpY9yz26CcM80Jg4PDwvFix5CNjmrPsjA+feH4HFT9yDVUE0HBsePWEfP2D1E6A0BC
 k9hnIqKMl0A/k7zYjwFsYK0ENESXfAjEks0+fqqa79661PTy2kc8s1fOcLNn/eQCZcR7
 09Tw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-disposition
 :content-transfer-encoding;
 bh=7c5hbFDJuzW8IbaNLbCCwK5N29exubinPApJnJHDfR0=;
 b=a7Q7wWViI9P+tuRJMXTdsbsh9RLi5w7/3w289j+vyclSaLcUr1vvOBHmGSLLcMAIaS
 UBzERUkjD/m9Qh6QkpJMGKhQxuH/cwmf6tr/CCxTX5Ap774EBwsLkDAMnYZqUSB0+24W
 KPGC76G9WD6ELwaferHWdxOBIMivWhYtwC+eWDvmdfz9+gxENTNYcJKEZjCZMtK7GnCU
 tBs+jmChCU222vKduVVS5zHl969UG0d3VvW66GCWpdjJmOPeXbQWzOCVsxmcEeCOl5iB
 inBHSPu3II6EPwrh1uXB6vGavEGZsK8ddVa8tdjrHnhRf+DuHs4SMb/myg0bnZ0qOw+H
 dlew==
X-Gm-Message-State: AOAM530vEV5ivXtUf5dWJNcXOZD7Nh7EcMm/9Bo98Qn5yv77z7KvnDI5
 7fH+H8tzynCyrhKOlOwCa3U=
X-Google-Smtp-Source: ABdhPJz7KRLv1g9bRdFHzT6lp7tQwKP2uj+NoPFEntDd1eukLWRlre8tS73iPaLZc+mPS/pqqEeSxQ==
X-Received: by 2002:aa7:91d1:0:b029:1fe:2a02:73b9 with SMTP id
 z17-20020aa791d10000b02901fe2a0273b9mr25310238pfa.2.1618240125830; 
 Mon, 12 Apr 2021 08:08:45 -0700 (PDT)
Received: from localhost.localdomain ([138.197.212.246])
 by smtp.gmail.com with ESMTPSA id k13sm8406233pji.14.2021.04.12.08.08.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 12 Apr 2021 08:08:45 -0700 (PDT)
From: DENG Qingfang <dqfext@gmail.com>
To: =?iso-8859-1?Q?Ren=E9?= van Dorst <opensource@vdorst.com>
Cc: "David S. Miller" <davem@davemloft.net>, Andrew Lunn <andrew@lunn.ch>,
 Florian Fainelli <f.fainelli@gmail.com>,
 Heiner Kallweit <hkallweit1@gmail.com>, Jakub Kicinski <kuba@kernel.org>,
 Landen Chao <Landen.Chao@mediatek.com>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Russell King <linux@armlinux.org.uk>, Sean Wang <sean.wang@mediatek.com>,
 Vivien Didelot <vivien.didelot@gmail.com>,
 Vladimir Oltean <olteanv@gmail.com>, Rob Herring <robh+dt@kernel.org>,
 Linus Walleij <linus.walleij@linaro.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Sergio Paracuellos <sergio.paracuellos@gmail.com>,
 linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org,
 linux-staging@lists.linux.dev, devicetree@vger.kernel.org,
 netdev@vger.kernel.org, Weijie Gao <weijie.gao@mediatek.com>,
 Chuanhong Guo <gch981213@gmail.com>,
 Frank Wunderlich <frank-w@public-files.de>,
 Thomas Gleixner <tglx@linutronix.de>, Marc Zyngier <maz@kernel.org>
Subject: Re: [RFC v4 net-next 1/4] net: phy: add MediaTek PHY driver
Date: Mon, 12 Apr 2021 23:08:36 +0800
Message-Id: <20210412150836.929610-1-dqfext@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210412070449.Horde.wg9CWXW8V9o0P-heKYtQpVh@www.vdorst.com>
References: <20210412034237.2473017-1-dqfext@gmail.com>
 <20210412034237.2473017-2-dqfext@gmail.com>
 <20210412070449.Horde.wg9CWXW8V9o0P-heKYtQpVh@www.vdorst.com>
MIME-Version: 1.0
Content-Disposition: inline
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210412_080849_438686_8D90CDFE 
X-CRM114-Status: GOOD (  15.21  )
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
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Mon, Apr 12, 2021 at 07:04:49AM +0000, Ren=E9 van Dorst wrote:
> Hi Qingfang,
> > +static void mtk_phy_config_init(struct phy_device *phydev)
> > +{
> > +	/* Disable EEE */
> > +	phy_write_mmd(phydev, MDIO_MMD_AN, MDIO_AN_EEE_ADV, 0);
> =

> For my EEE patch I changed this line to:
> =

> genphy_config_eee_advert(phydev);
> =

> So PHY EEE part is setup properly at boot, instead enable it manual via
> ethtool.
> This function also takes the DTS parameters "eee-broken-xxxx" in to accou=
nt
> while
i> setting-up the PHY.

Thanks, I'm now testing with it.

> =

> > +
> > +	/* Enable HW auto downshift */
> > +	phy_modify_paged(phydev, MTK_PHY_PAGE_EXTENDED, 0x14, 0, BIT(4));

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
