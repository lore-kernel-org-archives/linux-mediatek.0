Return-Path: <SRS0=cSMM=KP=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.7 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9F350C433ED
	for <linux-mediatek@archiver.kernel.org>; Thu, 20 May 2021 02:39:01 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 148576108B
	for <linux-mediatek@archiver.kernel.org>; Thu, 20 May 2021 02:39:01 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 148576108B
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=LYCYaGuBe3yJ3MNqCwyQtFASJJiLKROBSk6pclmox+8=; b=ck6xjkeuU8rc3f+aJzzFsU1C2
	SImEUzEjw+MyFOncLRajfL+PiaYZjPxK6+3899XhVCtHYtRJLlIaReLIH9qin9TwjkCBk37egjUdt
	cnand/e/YXWDzVB57Aqwkgfh/FJYlqucqf0wrEuzyecnVgmcYNfkJfDS6RLksQiljENy9A+dWcKnP
	QkonGeWENDhpTeNvvnZZMMcI8xiHxubp6rB4yTGnsF7iy78k4081AiZw1dviNNfrSywx8wcUfcPgB
	8liXSLhn3Koqkp7RcQhtQAPTDGRSi+nrXbuJMxt5gQz9jkXQFj5M/bge8DnHaAbjMTNNTPht5Y0Ks
	ObT3vT9yw==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1ljYaD-005h7E-0F; Thu, 20 May 2021 02:38:45 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1ljYaB-005h73-WF
 for linux-mediatek@desiato.infradead.org; Thu, 20 May 2021 02:38:44 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
 Content-Type:MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:
 To:From:Sender:Reply-To:Content-ID:Content-Description;
 bh=+oDpeZ4j0Q9DFmXNX82+DBFJCZJqLdYMPzNEUa68hdk=; b=FjopWbRH8Qw/CRJrsJkIw5s402
 q4mXB5RbQRTLofCP75TB9sNmEehiFrwYOFvBeVdyqrKsij+AZS8/He/sOmXPzGDs8SXGGQvLL7W7g
 1s6ri+oQFPCH/6myPSFVLx6q8cjoUbWsYCv86ftwYvpGckdwlMzg3DmTgyUt9RMy3zbq87Ir7jlxr
 TXeSlz/HSSldIGGuT1zWqHitkD4fd4x/bVQMa9cUcYkFosMAT87sge0Dd8lf786pH058YWYbvc/pf
 RXUe2LYwB8HuEIGcM6ge1H/htKj7POAq3gNxIUklAwkVC5thBVEEkHRiPrQWlO612RwB8GCKEDO1p
 eeXQil9g==;
Received: from mail-pg1-x52c.google.com ([2607:f8b0:4864:20::52c])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1ljYa9-00FtgM-7Q
 for linux-mediatek@lists.infradead.org; Thu, 20 May 2021 02:38:42 +0000
Received: by mail-pg1-x52c.google.com with SMTP id f22so9864656pgb.9
 for <linux-mediatek@lists.infradead.org>; Wed, 19 May 2021 19:38:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-disposition:content-transfer-encoding;
 bh=+oDpeZ4j0Q9DFmXNX82+DBFJCZJqLdYMPzNEUa68hdk=;
 b=IOa8K9tVVVxrX/LEDpljs/uhegyaU7VIZuMoaAVZsjDvNrTugxJq9nCTiuCFBEeDd5
 3Y7xjzha2OTsAjBRw5pc7a6InhT3llpfUQiJemcPlQrchkqgC9UINiAob8LgJehEDr9Q
 nmFyzp/SwcJZVNkHQkt2yziclbsRlwso1ofxmByAJcS15BRIANqqokBlgpK4lHAHoquR
 AtiCPZFyfQ7TIzLWLEp3wiv9qdNxAUr4bcnq3S1LIIf+4M5+HkcigdsLrwpCn+fo0lqf
 X5ljjTEcCm6UfcJ2a7UMhZkNb9wlVPYhsg6f46u0EJfEY2QykQptftlowkzjQFtSEfhZ
 eYeg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-disposition
 :content-transfer-encoding;
 bh=+oDpeZ4j0Q9DFmXNX82+DBFJCZJqLdYMPzNEUa68hdk=;
 b=mhezs9J6VvG0yorr2mk3rHMEZ4VU59dvaiFHU23Et7BdPlSpjXhzqv7P3v5kq6dNya
 9pPOnsvpWogdLkh11zHxaykoQp2xGrocyguQ5EFyyKSp3wuTg8u1dToPWsDzHL3z8jm+
 pcZaKbjz5st2fUjWWGZDj3eam1PLw0AN3By+ZrCgcMyRa5SXCuaQbA8DjyDESAnNgfRz
 XZdAqE1AbsPXdwaMIxa7GvELi8DBaA9LrMqowZCUNdkK//oCKvDVGP091TCg6tRlvRe5
 gArXRdW6wHtYjNqxrtTEmDQhjDWqRLkHWka+xs1aDQn0FJ0PtzjpNeyFxRQZ9CsL7cTo
 4ifw==
X-Gm-Message-State: AOAM532DFMHloDf+4JMmWChv/3lc0cB/wMcOdgxMlHXwKfjdebBeSTRU
 QvQZctY+g2XWLxpPuRJL+UQ=
X-Google-Smtp-Source: ABdhPJyOZjPeKhwYF/NBTz9x78DTVIhWw9ru81FqoCQB8kQAgbM2mwi2ZnccQH72pofVtqTXdW8LxA==
X-Received: by 2002:a63:1e64:: with SMTP id p36mr2226330pgm.105.1621478319924; 
 Wed, 19 May 2021 19:38:39 -0700 (PDT)
Received: from localhost.localdomain ([138.197.212.246])
 by smtp.gmail.com with ESMTPSA id v9sm3005387pjd.26.2021.05.19.19.38.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 19 May 2021 19:38:39 -0700 (PDT)
From: DENG Qingfang <dqfext@gmail.com>
To: Andrew Lunn <andrew@lunn.ch>
Cc: "David S. Miller" <davem@davemloft.net>,
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
 =?iso-8859-1?Q?Ren=E9?= van Dorst <opensource@vdorst.com>,
 Frank Wunderlich <frank-w@public-files.de>,
 Thomas Gleixner <tglx@linutronix.de>, Marc Zyngier <maz@kernel.org>
Subject: Re: [PATCH net-next v2 1/4] net: phy: add MediaTek Gigabit Ethernet
 PHY driver
Date: Thu, 20 May 2021 10:38:28 +0800
Message-Id: <20210520023828.3261270-1-dqfext@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <YKW0acoyM+5rVp0X@lunn.ch>
References: <20210519033202.3245667-1-dqfext@gmail.com>
 <20210519033202.3245667-2-dqfext@gmail.com> <YKW0acoyM+5rVp0X@lunn.ch>
MIME-Version: 1.0
Content-Disposition: inline
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210519_193841_306907_ED3DA52B 
X-CRM114-Status: GOOD (  13.52  )
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

On Thu, May 20, 2021 at 02:59:21AM +0200, Andrew Lunn wrote:
> > +static void mtk_gephy_config_init(struct phy_device *phydev)
> > +{
> > +	/* Disable EEE */
> > +	phy_write_mmd(phydev, MDIO_MMD_AN, MDIO_AN_EEE_ADV, 0);
> 
> Is EEE broken on this PHY? Or is this just to get it into a defined
> state?

As I said in commit message, the initialization (including EEE) is
from the vendor driver.
I have also tested it with EEE enabled by default on one of my APs,
and got occasional link drops.

> 
> Otherwise
> 
> Reviewed-by: Andrew Lunn <andrew@lunn.ch>
> 
>     Andrew

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
