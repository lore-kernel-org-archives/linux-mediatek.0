Return-Path: <SRS0=sXDt=4Z=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.3 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 77549C10DCE
	for <linux-mediatek@archiver.kernel.org>; Sun,  8 Mar 2020 20:18:57 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4CAF02067C
	for <linux-mediatek@archiver.kernel.org>; Sun,  8 Mar 2020 20:18:57 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="kqL1TfGu"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 4CAF02067C
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=G7enmxja837hvyrQ1wBlXRVmCDv5ktFU3YfHVN08LqI=; b=kqL1TfGu87868W
	v/QhxQqeN8FWxjWmNot0+8mVZU4BGKWArd/+myolr/i9wO4b1qHze6ltGFAkj1EKpFuhx2til/8BO
	6tXWsXvEzqbZ+Ov2X4937Aj65HbYBBswuomXAKBf7md3oUUP0Wtdcmg+4eGytSehhHvKkBFW3x2Ke
	VbEYqXcplF6uUd7QZCWvDQq2Y0yfYCkRf9YOfteTClZ7t0aljI8wiqwSdFuzYmWNTZfxK8kFo1OOW
	IAUTfmwAymLr+FDVNtyd5zxm8KZl0uYVXmondQpyEy7dnFURuRQASwWX7RnQArnl/k8CavpmeeVGN
	GsxhnsGeerQ9cZwZ81bA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jB2No-0005vV-Ud; Sun, 08 Mar 2020 20:18:44 +0000
Received: from metis.ext.pengutronix.de ([2001:67c:670:201:290:27ff:fe1d:cc33])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jB2Ng-0005oX-OZ
 for linux-mediatek@lists.infradead.org; Sun, 08 Mar 2020 20:18:38 +0000
Received: from pty.hi.pengutronix.de ([2001:67c:670:100:1d::c5])
 by metis.ext.pengutronix.de with esmtps
 (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <ukl@pengutronix.de>)
 id 1jB2NU-0003GY-PR; Sun, 08 Mar 2020 21:18:24 +0100
Received: from ukl by pty.hi.pengutronix.de with local (Exim 4.89)
 (envelope-from <ukl@pengutronix.de>)
 id 1jB2NH-0006Ms-Fq; Sun, 08 Mar 2020 21:18:11 +0100
Date: Sun, 8 Mar 2020 21:18:11 +0100
From: Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <u.kleine-koenig@pengutronix.de>
To: Matthias Brugger <matthias.bgg@gmail.com>
Subject: Re: [PATCH v2 1/1] pwm: mediatek: add longer period support
Message-ID: <20200308201811.hlac57s3h4p4cgev@pengutronix.de>
References: <1583230755-25986-1-git-send-email-sam.shih@mediatek.com>
 <1583230755-25986-2-git-send-email-sam.shih@mediatek.com>
 <1a3a523e-62ff-e380-c67b-12f742d348ea@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1a3a523e-62ff-e380-c67b-12f742d348ea@gmail.com>
User-Agent: NeoMutt/20170113 (1.7.2)
X-SA-Exim-Connect-IP: 2001:67c:670:100:1d::c5
X-SA-Exim-Mail-From: ukl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de);
 SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-mediatek@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200308_131836_802004_85B65883 
X-CRM114-Status: GOOD (  11.16  )
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
Cc: linux-pwm@vger.kernel.org, Sam Shih <sam.shih@mediatek.com>,
 linux-kernel@vger.kernel.org, Thierry Reding <thierry.reding@gmail.com>,
 linux-mediatek@lists.infradead.org, John Crispin <john@phrozen.org>,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Hello,

On Sat, Mar 07, 2020 at 10:28:36PM +0100, Matthias Brugger wrote:
> On 03/03/2020 11:19, Sam Shih wrote:
> > The pwm clock source could be divided by 1625 with PWM_CON
> > BIT(3) setting in mediatek hardware.
> > =

> > This patch add support for longer pwm period configuration,
> > which allowing blinking LEDs via pwm interface.
> =

> Is this a fix? In this case please provide a Fixes tag with the commit ID=
 which
> introduced the bug.

I'd say it qualifies as a fix if without it a request with a long period
returns success but isn't properly implemented. Otherwise it's only a
new feature.

Best regards
Uwe

-- =

Pengutronix e.K.                           | Uwe Kleine-K=F6nig            |
Industrial Linux Solutions                 | https://www.pengutronix.de/ |

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
