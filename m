Return-Path: <SRS0=r4MK=J3=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 048AEC433B4
	for <linux-mediatek@archiver.kernel.org>; Fri, 30 Apr 2021 12:38:06 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4EE1061449
	for <linux-mediatek@archiver.kernel.org>; Fri, 30 Apr 2021 12:38:05 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 4EE1061449
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=public-files.de
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:References:In-Reply-To:Date:Subject:Cc:To:From:
	Message-ID:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=u62k+iadpkaoHwOukOhckZCIB99WVUaA9OZNGk6hC+Y=; b=iIs3rv4WpTE9luXErI2lBcGwe
	eBm/5nTfKXkbzLOmHa0wCb6aeXHIopnCeyU0Rt7bbjdCInqTB/OQaOPcyMgmd7qOo9oTmEWWRXZpg
	iMf80z0c6yt87cLCYWte5lcPR0hdkpfQa3sGQrF+A1HRzaqoX3AYCov/5rPYIfmD0UANnRxdK83rT
	qO8RDf/M9ejfncz/HikVor+2dzqOk32wN2TI+4E1X3T7rNwdxLBxK6mdX5KGzmu00fm1QJ6oDce7I
	nATLljudPHEOTEvN0VA/ttTc1lWd919esluF7zgXJLaTnw4uH9lErVxYhoJWMdEgXD/QAzGnVtQfH
	62DjAQEUw==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lcSP4-007oD2-HY; Fri, 30 Apr 2021 12:37:54 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lcSP2-007oCv-NC
 for linux-mediatek@desiato.infradead.org; Fri, 30 Apr 2021 12:37:53 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=References:In-Reply-To:Date:
 Content-Type:Subject:Cc:To:From:Message-ID:MIME-Version:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description;
 bh=FKFDSDa2dqHO8MKUwCf6kWqfZhjjaDYclELtSgD0qWQ=; b=EfPooKA0nGGgUrZKLSheCndT/d
 7/nFuXDjzueKhRNRP5uExVzxBo2BGl8Gv04sO8+8+4120c58RvSj3Dfr4/rcraI0C+YC4v5xbeD4B
 mTEOFLnQZ3PYPgzYwdmDc3KtBu23p+/H1LGgNYB58FjjHo0pULs+jDsk19j//K5X1SGITT4XDf0Dh
 0brZ87hfztoatSMyrOfSUthoGx2REq8CkBD1jQvJEz18/Q1IsRwnUlO66dy31CBjk+33pUw5slQUN
 +xZnP4zDONLFer3pJmx/kB207Kxx0kUaSYiKs+bDu5E9ftWoivyEjSmuDnEDu+74a350f+sCWH4n9
 tM3mzQLQ==;
Received: from mout.gmx.net ([212.227.17.21])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lcSOz-001MvQ-So
 for linux-mediatek@lists.infradead.org; Fri, 30 Apr 2021 12:37:51 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
 s=badeba3b8450; t=1619786236;
 bh=aWA0qZW6OIJpsght0sPtlyAsUnhdMUN05yqm1M8XjsQ=;
 h=X-UI-Sender-Class:From:To:Cc:Subject:Date:In-Reply-To:References;
 b=g13+7uC+M2sTr28mFWdno+u9YNLBBvuAxHyhLqURCyV631eiTuzCxC50heLLwvlmZ
 pgUKvHQYRW6d8nmkZ3OfmJNEm5syhOy4tUDmbTuP7Ldbo02DgRB4dbP0GuR4qx06ou
 XetKgIDOAEjC8VCEsDvnnNyPs3WISEjzrlHJMuvg=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from [157.180.225.50] ([157.180.225.50]) by web-mail.gmx.net
 (3c-app-gmx-bap03.server.lan [172.19.172.73]) (via HTTP); Fri, 30 Apr 2021
 14:37:16 +0200
MIME-Version: 1.0
Message-ID: <trinity-843c99ce-952a-434e-95e4-4ece3ba6b9bd-1619786236765@3c-app-gmx-bap03>
From: Frank Wunderlich <frank-w@public-files.de>
To: Andrew Lunn <andrew@lunn.ch>
Cc: DENG Qingfang <dqfext@gmail.com>, David Miller <davem@davemloft.net>,
 f.fainelli@gmail.com, hkallweit1@gmail.com, kuba@kernel.org,
 Landen.Chao@mediatek.com, matthias.bgg@gmail.com, linux@armlinux.org.uk,
 sean.wang@mediatek.com, vivien.didelot@gmail.com, olteanv@gmail.com,
 robh+dt@kernel.org, linus.walleij@linaro.org, gregkh@linuxfoundation.org,
 sergio.paracuellos@gmail.com, linux-kernel@vger.kernel.org,
 linux-mediatek@lists.infradead.org, linux-staging@lists.linux.dev,
 devicetree@vger.kernel.org, netdev@vger.kernel.org,
 weijie.gao@mediatek.com, gch981213@gmail.com, opensource@vdorst.com,
 tglx@linutronix.de, maz@kernel.org
Subject: Aw: Re: [PATCH net-next 0/4] MT7530 interrupt support
Date: Fri, 30 Apr 2021 14:37:16 +0200
Importance: normal
Sensitivity: Normal
In-Reply-To: <YIv28APpOP9tnuO+@lunn.ch>
References: <20210429062130.29403-1-dqfext@gmail.com>
 <20210429.170815.956010543291313915.davem@davemloft.net>
 <20210430023839.246447-1-dqfext@gmail.com> <YIv28APpOP9tnuO+@lunn.ch>
X-UI-Message-Type: mail
X-Priority: 3
X-Provags-ID: V03:K1:ylYnjWFNykRWOKSx3UIDDPiFuY/keJ+N0BZCO5sR80bsR6BBg02Q7LKHjtxineS3ctVz8
 sKaSAYh8o0agfbR2GR5smR5BnugCP1hWi/3SsM3xO/F1/R+7J/y6IP1o4QgzsineKPNdp0LU+TX4
 jJQ9bqN1WylsDcDM7n63ojCcDg0IRCUOy62U1wsSaHKK7OrTS+bs77EVP30nb68bPCRdIEzuQ1un
 KQZ4kyxNx2g15X3fGyAhb2XEIUXdpOrJQrQHTR+CCGpZ17u4HJL+b9P12g0coHlVgizLCzZAUZy4
 w4=
X-UI-Out-Filterresults: notjunk:1;V03:K0:zbwz7g5Ns4I=:rTQz1sgb1ya6Byjhnt47jG
 TDzlj/YX2nWyScSkr4eWxd0MAAevy3Zk2kWZhtyInMwNXQOY53v6Trz1pK7GmjEhMfbcS0gf4
 PV28WlwT6EdY1LS/2W4fJ7YVdvMpLKLH8dzPv2hFnfKzKjCydHLzBEQaO9QujQNuTi4KL6NuN
 Bb6zbFxR4mEzehanDp5ErAh+SxaCcsC/I9avKkSTiemAgYoC1ZUmKl+p1NqAa9I2oFoeZkJxV
 gUhg9tecgwq3Lc/Yh69hQt5CtugbbC34BVwyIw0klB2tAaWi4GqeIEy5K9OkrLLa1fcWZ5ru1
 9i51QvmVQ2oBBgGNiXqPz0yb1ybve10MGpTQOgAVSU+KcMjv2jyOJevrMrzHU5zgS+PTcJXuz
 yZC12UqX0mjetuotnLhUboWGfnUW0eoBvssVJUNgKBA56802cLwBjM/24wM8TWwCKg/8Zde+U
 RMj99LAGYCTE12lX7y4nCE/F7tHCKghnQTqIEdvKVloDIJybWwnRiZJbUpJC7BbWRQJLQZVJY
 YtUCtg1asMEptdUwjFtxQL7bZk/88dJSetCX+5TxQuLOkmYzLDMz2Ynvwfd5BoTJUwyQ/uoiT
 U/N1Bv/wjCZJJFysR7/eW+a3FKUiVoB5wZedu5+DsDD3iGJePZ41IQNqfXuQ4gcjbDTJx/pdW
 ych1QqWvel1+yRuWjEPRjRpymj4/Oh2owYa+WnTWh2rAlEiHvcLb2nA7LaRWKcHOUWfYQMIZI
 vQHG7uSHKKTz1OiHCBs09Go7K23U9AxMaviVaky/MANc7PJn9UAa1WH8QUhEAl3N+n2lwUiFP
 pBMCYv78cII6ke6dm5phsO0gNZIqkigcAmP13jOiE+zsr5GOdV4p+UhV0n3karEKIwhmzb+F/
 dzcqdyvdwSYweBTXanMAe0Yo/r06mjZspbOftVuxWZVk/VqBZgd3rZcjpX1nGC7HA7Y05/Y2Z
 sFe6Otyc0hQ==
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210430_053750_246416_A0A33850 
X-CRM114-Status: UNSURE (   8.52  )
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

Hi,

i prepare rename of musb-driver to musb_mtk.ko as this is also not the best name.

if this module does only handle mt753x i would suggest

phy_mt753x.{c,ko}

regards Frank


> Gesendet: Freitag, 30. April 2021 um 14:24 Uhr
> Von: "Andrew Lunn" <andrew@lunn.ch>

> mediatek_phy.c gets you into trouble with the generic PHY drivers.
> Most Ethernet PHY drivers have the model number in the file name. Does
> the PHY have its own name/numbering, or is it always considered part
> of the switch?  If the PHY has an identity of its own, use
> that. Otherwise maybe mediatek75xx.c?


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
