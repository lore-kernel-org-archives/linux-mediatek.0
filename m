Return-Path: <SRS0=VOwE=NP=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 08454C4338F
	for <linux-mediatek@archiver.kernel.org>; Tue, 24 Aug 2021 23:54:00 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 93BEC60E77
	for <linux-mediatek@archiver.kernel.org>; Tue, 24 Aug 2021 23:53:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 93BEC60E77
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=VQdNzVYcd6mMnIefXR5W1XBPUkIXyLIAhfxA7m3sQN8=; b=eYD8BVuWnTAzKP
	4YYn3ShIw1IPyoOgJyYRavYheliHQcJwKiA4rAh2iH0e/ptjeCcS91sK5/M6SlGLs2faeF06rVL9R
	JOdLPNfHASTq3/XDl/yGIEhc54ftMlk9pncSm8po0Lq7CrPOnIPUbk0YF+Hp+gEAWSLET0ZvMoRAx
	RCvFhMOPwyVvDxPbCvgg7gwqnNzpXTpvEC1uA5Yu66KRTKDgw7IMOuvMEeX9XYhW/FTu8qTG5spjs
	V2Z8/6iGn6l7PcrF4PFzs+RCq66fHwPIP/l28TlPuNeDSWUctXySjNKnGDMSXk3/C7doie5XP2UQb
	TRJpx7pPvruSVZYeuPlw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mIgEi-004uxs-Pw; Tue, 24 Aug 2021 23:53:44 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mIgEW-004uwv-0W; Tue, 24 Aug 2021 23:53:33 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id 5548960E73;
 Tue, 24 Aug 2021 23:53:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1629849210;
 bh=5PrZ337fz2o/HBYemiPOBpaodeXb86aUnW/V5+872+4=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=HCVTxTNFiHnYBIvv3ZvBYfk71jCvU4q1oueHNUrAVa7/9rKO4ZsC27+BBt1Zg/FUi
 i8olo7oyDfBARkZsTuweM41K6w0JVy0hf2q3pwBW5zBCdXmA7yRcJljNaheF6+kE1O
 c8jzcNsVSHEmTdpbNnHw86L8gcH74JDINVu53TUkRBiibuyboSIPvBztFhSr7VJouo
 m0xKlASWFNYyp4HMxs2zDo1/H7iCYLc2FHRSvolbi439/JYgMzPzOC2J9ipvSlCCfw
 pRWIG98Bp/sk5h6cKjnaG1wnpmrS8hEajiVffaOIEsF06IDNvPExdmdgX7ZLh/XONN
 cihFgtsR1KRtQ==
Date: Tue, 24 Aug 2021 16:53:29 -0700
From: Jakub Kicinski <kuba@kernel.org>
To: Andrew Lunn <andrew@lunn.ch>, DENG Qingfang <dqfext@gmail.com>
Cc: Heiner Kallweit <hkallweit1@gmail.com>, Russell King
 <linux@armlinux.org.uk>, "David S. Miller" <davem@davemloft.net>, Matthias
 Brugger <matthias.bgg@gmail.com>, "open list:ETHERNET PHY LIBRARY"
 <netdev@vger.kernel.org>, open list <linux-kernel@vger.kernel.org>,
 "moderated list:ARM/Mediatek SoC support"
 <linux-arm-kernel@lists.infradead.org>, "moderated list:ARM/Mediatek SoC
 support" <linux-mediatek@lists.infradead.org>
Subject: Re: [PATCH net] net: phy: mediatek: add the missing suspend/resume
 callbacks
Message-ID: <20210824165329.7318588d@kicinski-fedora-pc1c0hjn.dhcp.thefacebook.com>
In-Reply-To: <YSOb2P43svWca9IJ@lunn.ch>
References: <20210823044422.164184-1-dqfext@gmail.com>
 <YSOb2P43svWca9IJ@lunn.ch>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210824_165332_118513_7C806D8E 
X-CRM114-Status: UNSURE (   8.44  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Mon, 23 Aug 2021 15:00:08 +0200 Andrew Lunn wrote:
> On Mon, Aug 23, 2021 at 12:44:21PM +0800, DENG Qingfang wrote:
> > Without suspend/resume callbacks, the PHY cannot be powered down/up
> > administratively.
> > 
> > Fixes: e40d2cca0189 ("net: phy: add MediaTek Gigabit Ethernet PHY driver")
> > Signed-off-by: DENG Qingfang <dqfext@gmail.com>  
> 
> Reviewed-by: Andrew Lunn <andrew@lunn.ch>

Applied, thanks!

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
