Return-Path: <SRS0=yJvo=FI=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F38A7C4361A
	for <linux-mediatek@archiver.kernel.org>; Fri,  4 Dec 2020 13:54:04 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id ACA5822A83
	for <linux-mediatek@archiver.kernel.org>; Fri,  4 Dec 2020 13:54:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org ACA5822A83
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=rqD55q9CSriq+OazQZzAbePyCUCwJiYZDUqtIIrWYog=; b=Yz+gFTs1CQWewSdf0kkq3yHTU
	bxJ55z8KMX+aYDwEtKpONMWG8z7Dyr9h5WgSRWWVUxzs/fsksQvTZX6y9oilimAfFXbU7xnUPj6rv
	Kvp0AcNjN6cXg2U8QhSfw2SacZFd39++8dJqDAovYgfghd+jbIlrMisSw31djeGhHcJ7H3Dez0kvt
	xpWGyzB7QzwCSq+AraaTunJ/mx88LcmxjSCLYuYBMZfoHa3iSh/kXKA6/dFHNwesOcg8W3PvMnVLo
	FZWACCA0UMjyj/5rPdsI8XqWooT01lDNgAWPhZG7arHx5fKxm+mT1i3tNJ7BofHuQxHruizEZXJDG
	RBEMmXCRA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1klBX1-0000KC-96; Fri, 04 Dec 2020 13:53:55 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1klBWx-0000JK-CY; Fri, 04 Dec 2020 13:53:52 +0000
X-Gm-Message-State: AOAM531HC9D4M7s8xcPs/37jkIxg/SQ7GEcwN7IZubG1DBTu9+pP8aPk
 l8DSDxYQvWQ2uJdoU3414GDAq/ChaLk+DwoamKg=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1607090030;
 bh=kAyij9+4RX0y0DZNsysqqpS1CMViaFGNvc5aF6KEUiQ=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=fNBgfc8cplNLpBDM+NibHgduG0XDO8cs7v9dphCQ7WINUnYGSjM1eVnHfn3vUcwqp
 soJLV/DyUpPVzgQ73ov0qNLMrNgb9csscWZ8J0x7TUhSWs7ShxJwa/Iv18wagSshot
 DNJgdJLrS9QxdTj7mjtl9DruPxFIJOrdWhonVDyaq6Ak7PHc+bxJr2KBw/2yyWHhJt
 w02nx+87/T4ClDvQE9b1dyvFHedLX+rwZ8k+CICSsiJfQVf3JobbVERK0jjtQ1xvOK
 AXUUSuFPGuSgfJdq4Y+3JQNPGjuRieaEsVQNEsBjwXY+89cqoS/LGZv+yljyCoG1Bd
 ZQRvCvPjYXDPw==
X-Google-Smtp-Source: ABdhPJyEkwJM1qhY4HUoSSRjTOLYZ7XOJZyRjgIIVnOtMvJEUNP3hofxY3AfejJTYvYN3Qv/dNvHa5aCwDT6HzFYVE8=
X-Received: by 2002:a9d:6317:: with SMTP id q23mr3706573otk.251.1607090029623; 
 Fri, 04 Dec 2020 05:53:49 -0800 (PST)
MIME-Version: 1.0
References: <20201203225418.1477560-1-arnd@kernel.org>
 <1607046425.7284.17.camel@mhfsdcap03>
In-Reply-To: <1607046425.7284.17.camel@mhfsdcap03>
From: Arnd Bergmann <arnd@kernel.org>
Date: Fri, 4 Dec 2020 14:53:33 +0100
X-Gmail-Original-Message-ID: <CAK8P3a3tbXLD-0UBCkYX+s1AR=edbT085AcMmU8iPO1o-TMF=Q@mail.gmail.com>
Message-ID: <CAK8P3a3tbXLD-0UBCkYX+s1AR=edbT085AcMmU8iPO1o-TMF=Q@mail.gmail.com>
Subject: Re: [PATCH] phy: mediatek: allow compile-testing the hdmi phy
To: Chunfeng Yun <chunfeng.yun@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201204_085351_537586_2E87DE83 
X-CRM114-Status: GOOD (  10.91  )
X-BeenThere: linux-mediatek@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-mediatek.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mediatek>, 
 <mailto:linux-mediatek-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mediatek/>
List-Post: <mailto:linux-mediatek@lists.infradead.org>
List-Help: <mailto:linux-mediatek-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mediatek>, 
 <mailto:linux-mediatek-request@lists.infradead.org?subject=subscribe>
Cc: Chun-Kuang Hu <chunkuang.hu@kernel.org>,
 Florian Fainelli <f.fainelli@gmail.com>, Arnd Bergmann <arnd@arndb.de>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Krzysztof Kozlowski <krzk@kernel.org>, Kishon Vijay Abraham I <kishon@ti.com>,
 CK Hu <ck.hu@mediatek.com>, Vinod Koul <vkoul@kernel.org>,
 "moderated list:ARM/Mediatek SoC..." <linux-mediatek@lists.infradead.org>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Fri, Dec 4, 2020 at 2:47 AM Chunfeng Yun <chunfeng.yun@mediatek.com> wrote:

> > diff --git a/drivers/phy/mediatek/Kconfig b/drivers/phy/mediatek/Kconfig
> > index 65ed26e40c9f..29a85b2738f8 100644
> > --- a/drivers/phy/mediatek/Kconfig
> > +++ b/drivers/phy/mediatek/Kconfig
> > @@ -40,7 +40,9 @@ config PHY_MTK_XSPHY
> >
> >  config PHY_MTK_HDMI
> >       tristate "MediaTek HDMI-PHY Driver"
> > -     depends on ARCH_MEDIATEK && OF
> > +     depends on ARCH_MEDIATEK || COMPILE_TEST
> > +     depends on COMMON_CLK
> Seems no need add COMMON_CLK here

My mistake, I had squashed two build fixes for the same driver but
forgot to update the changelog with the other output. This is what
happens without CONFIG_COMMON_CLK:

arm-linux-gnueabi-ld: drivers/phy/mediatek/phy-mtk-hdmi.o: in function
`mtk_hdmi_phy_probe':
phy-mtk-hdmi.c:(.text+0xd8): undefined reference to `__clk_get_name'
arm-linux-gnueabi-ld: phy-mtk-hdmi.c:(.text+0x12c): undefined
reference to `devm_clk_register'
arm-linux-gnueabi-ld: phy-mtk-hdmi.c:(.text+0x250): undefined
reference to `of_clk_add_provider'
arm-linux-gnueabi-ld: phy-mtk-hdmi.c:(.text+0x298): undefined
reference to `of_clk_src_simple_get'

I'll resend with that added in.

       Arnd

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
