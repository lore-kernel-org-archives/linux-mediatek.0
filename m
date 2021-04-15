Return-Path: <SRS0=QSA9=JM=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.7 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D9162C433B4
	for <linux-mediatek@archiver.kernel.org>; Thu, 15 Apr 2021 09:49:56 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 552E66101B
	for <linux-mediatek@archiver.kernel.org>; Thu, 15 Apr 2021 09:49:56 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 552E66101B
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=IYd+60rJfBiVgKPW6nxZykSpc3JDa+fcDTjAHRAhPQM=; b=Ao39GSbBhLbkHdyWjWCOuOLD5
	MXM206seBlW6LUbqG69GaBDCQWzp04cp9H/lyNx1t1MuxqaDbvbvYI1EHxf8zAm4zHQWJqP7IRnne
	kRLyEOPfjKfmgCQEvjRBAYNN6EMbj6VJ5MCuwMIyZwzmjrtYMix4dvyHxAV7MfJt7s/C/0zCN8s6T
	vHv+THWck04ojYtpFcYeI++vCOUcH9nP/rYyVxUGjZVoZQ1cpKCEwH8UYf9Pe2JdtVPXqbfAW28Kk
	l7Y7iQYb33HSwxWiu55UGOYRIElDSBWEhBx1lqobXsnij5cZn7TixZALDTkypZiqQII0Chj3j89hF
	jL9zV9Dyw==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lWyd5-00FcHd-Vw; Thu, 15 Apr 2021 09:49:44 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lWycd-00FcDA-VW
 for linux-mediatek@desiato.infradead.org; Thu, 15 Apr 2021 09:49:16 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
 Content-Type:MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:
 To:From:Sender:Reply-To:Content-ID:Content-Description;
 bh=MLJSeXjPoZhwM9OSDgG8lC1iJnB13aPm/yKl+/yfCV4=; b=pnYFhqh9qbrpRFJ52tUpn/RnTf
 ZdTJBkxtAbgc6bDu93HtgTsAtvEUxC9vW95v00HRhPZv3+mboDIDlzb/PwNrj9UwTstovcpVmYDQ9
 dhk3O108KNaXGJ9DNwDfYTye/PvXhycCXGsY140xrcOqKw305+3vvwpR6NjlXTe8dT0JFUagpL45k
 aV/h0/Smf5kGRvNDPSEsOw0ablylT7sJG8IYkLz0eAjBhNe7fHQKilbf0Mdu0KSmq+cvpBqJwiZcc
 jOgY9X+IAY+NRNjd+UAMbfp1bg9/Wa2c73r1WPr2V47SBHehWvkapdboobTqeaSdbexMTRB7I4/br
 mFeNDBEg==;
Received: from mail-pg1-x52e.google.com ([2607:f8b0:4864:20::52e])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lWycb-008RYn-EM
 for linux-mediatek@lists.infradead.org; Thu, 15 Apr 2021 09:49:14 +0000
Received: by mail-pg1-x52e.google.com with SMTP id w10so16545503pgh.5
 for <linux-mediatek@lists.infradead.org>; Thu, 15 Apr 2021 02:49:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-disposition:content-transfer-encoding;
 bh=MLJSeXjPoZhwM9OSDgG8lC1iJnB13aPm/yKl+/yfCV4=;
 b=pRp6PcDwdUPowwS48+n5Vcn7b/Qu7Q0Bq2YvCP3A8ZlqeThBV3w1DUWLE2e8USg8pm
 p56e0NTf8FPp/4keeaxSxU8itqoXcygZWccJHjzPYw6twkrPCaCeIa7t8UWAaOi13xiX
 Ve6vDa0hTMEKVIEsbLjuxRulV/n9kQ+m5aOD6Vkf6r2/Bwusr+eQ/S2dwwn2oMFwp3Lc
 2GkmtQYNPNgQcVe/+isx2vnEXxpY4KB3qC1LUVEX/QDmUFhh3+H3Qlnrawi6wO8qPSXX
 n9LXQW/2cwdJBiHYuTEtqQ1QFQjXIxdEl7Z+WptTF8OVwNjIWlQO0gCPwfl0HQmBLn9z
 KTxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-disposition
 :content-transfer-encoding;
 bh=MLJSeXjPoZhwM9OSDgG8lC1iJnB13aPm/yKl+/yfCV4=;
 b=WS+EdFryMapoNNl2VsUnVEjYY41uOa3E7FkFx+vB5d11qf6sYjjYXCk53WiFbplQ/o
 wJtsbypQVtUtsg7VjxrylslGdgGZI2YEr0SUKXDACYp4gGiCDBH95MSBWti7Ua6DA76Y
 JzUww2bTbBJBEa+7w3uhXGg+8qYhLwGofjgSxxWd1SlIQ/R9tp+uiJFlLBdsLXIvZoGk
 p1IGQHCJxZyxWNk2F9M4/ft4UeVNskgZMeMTJfrLnvg88benn+BaaDXOMrbgEquVAZ1I
 5VETqyH08xyyF0X36D9St8DnXZ8i1xHR2odY4VsHKQVCSp8Rhk/nu3/vorA+U7RCJCLs
 XjqA==
X-Gm-Message-State: AOAM531r6eTvwWVPVwZsUJECEdZgssq/yOzoUsBxQhYH5iGen3KCEEEf
 0cAyWWSx28LcE1JmcGuXPh4=
X-Google-Smtp-Source: ABdhPJz/296Ukvru+pRPqrOVz6BD93FwhsGWGwnliuGvZd2ixls4Ij1dvumbp8/IpFDe3RglPXeWtw==
X-Received: by 2002:a62:7d07:0:b029:21b:d1bc:f6c8 with SMTP id
 y7-20020a627d070000b029021bd1bcf6c8mr2278450pfc.45.1618480152634; 
 Thu, 15 Apr 2021 02:49:12 -0700 (PDT)
Received: from localhost.localdomain ([138.197.212.246])
 by smtp.gmail.com with ESMTPSA id g10sm1581765pfj.137.2021.04.15.02.49.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 15 Apr 2021 02:49:11 -0700 (PDT)
From: DENG Qingfang <dqfext@gmail.com>
To: Russell King - ARM Linux admin <linux@armlinux.org.uk>
Cc: =?iso-8859-1?Q?Ren=E9?= van Dorst <opensource@vdorst.com>,
 "David S. Miller" <davem@davemloft.net>, Andrew Lunn <andrew@lunn.ch>,
 Florian Fainelli <f.fainelli@gmail.com>,
 Heiner Kallweit <hkallweit1@gmail.com>, Jakub Kicinski <kuba@kernel.org>,
 Landen Chao <Landen.Chao@mediatek.com>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Sean Wang <sean.wang@mediatek.com>,
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
Date: Thu, 15 Apr 2021 17:49:02 +0800
Message-Id: <20210415094902.2946-1-dqfext@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210413131259.GP1463@shell.armlinux.org.uk>
References: <20210412034237.2473017-1-dqfext@gmail.com>
 <20210412034237.2473017-2-dqfext@gmail.com>
 <20210412070449.Horde.wg9CWXW8V9o0P-heKYtQpVh@www.vdorst.com>
 <20210412150836.929610-1-dqfext@gmail.com>
 <20210413035920.1422364-1-dqfext@gmail.com>
 <20210413131259.GP1463@shell.armlinux.org.uk>
MIME-Version: 1.0
Content-Disposition: inline
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210415_024913_525882_4F8C8EF4 
X-CRM114-Status: GOOD (  18.73  )
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

On Tue, Apr 13, 2021 at 02:12:59PM +0100, Russell King - ARM Linux admin wrote:
> On Tue, Apr 13, 2021 at 11:59:20AM +0800, DENG Qingfang wrote:
> > Within 12 hours, I got some spontaneous link down/ups when EEE is enabled:
> > 
> > [16334.236233] mt7530 mdio-bus:1f wan: Link is Down
> > [16334.241340] br-lan: port 3(wan) entered disabled state
> > [16337.355988] mt7530 mdio-bus:1f wan: Link is Up - 1Gbps/Full - flow control rx/tx
> > [16337.363468] br-lan: port 3(wan) entered blocking state
> > [16337.368638] br-lan: port 3(wan) entered forwarding state
> > 
> > The cable is a 30m Cat.6 and never has such issue when EEE is disabled.
> > Perhaps WAKEUP_TIME_1000/100 or some PHY registers need to be fine-tuned,
> > but for now I think it should be disabled by default.
> 
> Experience with Atheros AR8035 which has a very similar issue would
> suggest that before resorting to the blunt hammer of disabling
> SmartEEE, one should definitely experiment with the 1G Tw settings.
> 
> Using 24us for 1G speeds on AR8035 helps a great deal, whereas the PHY
> defaults to 17us for 1G and 23us for 100M.

I set the 1G Tw to maximum 255us and still got the link issue..

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
