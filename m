Return-Path: <SRS0=iNWv=42=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.3 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,UNPARSEABLE_RELAY,USER_AGENT_SANE_2 autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D171BC10DCE
	for <linux-mediatek@archiver.kernel.org>; Mon,  9 Mar 2020 03:36:07 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A585020665
	for <linux-mediatek@archiver.kernel.org>; Mon,  9 Mar 2020 03:36:07 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="gvKlcKGq";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="AB2oTMhh"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org A585020665
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=+Ep9u/+8ZN4yjVVlOoOnzAhKmX3P91bKPJV8XYFW2NQ=; b=gvKlcKGqfhPIF6
	ycZePwKjC69tTpz01piwfGC8dixWmsbUw3LI+qodQw5VT8/sl97zW80Z1cR8IP+hvNqH9PVS4J6cW
	yzpwoIn7T8kfZCU3dcZzBNYaWmAS/kojP4/sgpv3dPUrw5B54KbvkMiHVRqS5qKnP0L1kPQcrNHmQ
	qw7SJ4G4cTZBP1KqP+bNY6vMzNw24m1XOZBy4GW4NORMGti/fYtnIcdN6JfoAEQBVyWkjP5r8wHry
	m4WF2xI2VsXcjuZT3++RbfLt2eFD8qFmHGPRe8EGDfB4qF/2skyzsjOOJyczxhcJrAQ/iITCx56Y5
	XPZibZqzm/RWP9wLbciw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jB9Cv-00084f-TY; Mon, 09 Mar 2020 03:35:57 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jB9Ct-00083d-L2; Mon, 09 Mar 2020 03:35:57 +0000
X-UUID: 7d1e5005fd2c4a6393e834ca6484086a-20200308
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID;
 bh=NPplXrKgtKtz1x0Ix8YmImoSvkv1+1IC9efSsIgz5rA=; 
 b=AB2oTMhhsGwn7IAr4Qzok/BmldTZg5IS9JmZN2xCjI5wr/ORouceMWiyafGUawfICQvU95eYdBUDW/qbTz6nxSeSEz3QFGN7yysqmtAjGFoGAZvA/zTOtd9ld+v+4Gd8/bt7HxL6+7CNpjsWsr7/Yab57m4v1KKZhDyoidVVKTY=;
X-UUID: 7d1e5005fd2c4a6393e834ca6484086a-20200308
Received: from mtkcas67.mediatek.inc [(172.29.193.45)] by mailgw01.mediatek.com
 (envelope-from <sam.shih@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLS)
 with ESMTP id 1619119128; Sun, 08 Mar 2020 19:35:45 -0800
Received: from MTKMBS06N2.mediatek.inc (172.21.101.130) by
 MTKMBS62N1.mediatek.inc (172.29.193.41) with Microsoft SMTP Server (TLS) id
 15.0.1395.4; Sun, 8 Mar 2020 20:35:46 -0700
Received: from mtkcas07.mediatek.inc (172.21.101.84) by
 mtkmbs06n2.mediatek.inc (172.21.101.130) with Microsoft SMTP Server (TLS) id
 15.0.1395.4; Mon, 9 Mar 2020 11:35:41 +0800
Received: from [172.21.84.99] (172.21.84.99) by mtkcas07.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1395.4 via Frontend
 Transport; Mon, 9 Mar 2020 11:35:38 +0800
Message-ID: <1583724941.15393.8.camel@mtksdccf07>
Subject: Re: [PATCH v2 1/1] pwm: mediatek: add longer period support
From: Sam Shih <sam.shih@mediatek.com>
To: Matthias Brugger <matthias.bgg@gmail.com>, Uwe
 =?ISO-8859-1?Q?Kleine-K=F6nig?= <u.kleine-koenig@pengutronix.de>
Date: Mon, 9 Mar 2020 11:35:41 +0800
In-Reply-To: <20200308201811.hlac57s3h4p4cgev@pengutronix.de>
References: <1583230755-25986-1-git-send-email-sam.shih@mediatek.com>
 <1583230755-25986-2-git-send-email-sam.shih@mediatek.com>
 <1a3a523e-62ff-e380-c67b-12f742d348ea@gmail.com>
 <20200308201811.hlac57s3h4p4cgev@pengutronix.de>
X-Mailer: Evolution 3.2.3-0ubuntu6 
MIME-Version: 1.0
X-TM-SNTS-SMTP: BF9287628D924EBECDF23B1AA8716029622345E5AC47F06F0882C90E7795C30A2000:8
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200308_203555_701682_ED606157 
X-CRM114-Status: GOOD (  11.47  )
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
Cc: linux-pwm@vger.kernel.org, linux-kernel@vger.kernel.org, Thierry
 Reding <thierry.reding@gmail.com>, linux-mediatek@lists.infradead.org,
 John Crispin <john@phrozen.org>, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="iso-8859-15"
Content-Transfer-Encoding: quoted-printable
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Hello,

On Sun, 2020-03-08 at 21:18 +0100, Uwe Kleine-K=F6nig wrote:
> Hello,
> =

> On Sat, Mar 07, 2020 at 10:28:36PM +0100, Matthias Brugger wrote:
> > On 03/03/2020 11:19, Sam Shih wrote:
> > > The pwm clock source could be divided by 1625 with PWM_CON
> > > BIT(3) setting in mediatek hardware.
> > > =

> > > This patch add support for longer pwm period configuration,
> > > which allowing blinking LEDs via pwm interface.
> > =

> > Is this a fix? In this case please provide a Fixes tag with the commit =
ID which
> > introduced the bug.
> =

> I'd say it qualifies as a fix if without it a request with a long period
> returns success but isn't properly implemented. Otherwise it's only a
> new feature.
> =


It's only a new feature.

Without this patch, pwm_mediatek_config return -EINVAL when receive a
long period request.

I will send v3 to reply Uwe's comment.


Best Regards,
Sam Shih

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
