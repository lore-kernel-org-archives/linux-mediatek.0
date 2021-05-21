Return-Path: <SRS0=Gsgc=KQ=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7A76AC4707A
	for <linux-mediatek@archiver.kernel.org>; Fri, 21 May 2021 18:06:45 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3CE7D613D6
	for <linux-mediatek@archiver.kernel.org>; Fri, 21 May 2021 18:06:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 3CE7D613D6
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linuxfoundation.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=dpTd9ynIcbXfQBCMs3hPw0Ev+xkZQxWUx0OY913RmVs=; b=ZzRLt/pLus3lQmpdiySazc81yQ
	p3cnr6ETlhrZhCIygL+wDUcdEU4mq+QOK+xUO9lb+zljaPO+aZMYtAqY87ylBow1xQaUWdt5quqJk
	MmGn0CG1jDaxULU/2Rykfto0x1hIEcftHxlNoPb582uD/i21Jgt/hsCrSbaFBBhnVgcwrIrVretH2
	rB+YMd+BAemNg2+2pdj5NE8j781HYZ81wwbGSy7xlb9XDGNELOppNw/yk5A5CRL4rzFOmY3X2W0/y
	f6OXy9m8NNC3jpc6OuYo01eyYAUGk5mbLi/cz2srffky8xabD2fmVopu/QiH6hUGrv51x/E6CL53j
	D9X8uJcw==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1lk9Xb-000erd-Rg; Fri, 21 May 2021 18:06:31 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1lk9XO-000eps-G5; Fri, 21 May 2021 18:06:18 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=In-Reply-To:Content-Type:MIME-Version
 :References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description;
 bh=55jK2hW3Q1UDg4CxhHuVx3ZhYtkWghRVoTKNLFgwR6k=; b=lMOjZ4H7/R0NOUPZp1idTYI2pr
 QCHzCx4XEmmtSoQ9wpDxy9F7rJYUog/BH2bI3K22qd87UV4b7M7YVXryVgG2ge9LljfW5rFZ87KXa
 Phai2Z4/zbJKd7NGT3marS0xAcKW+e6hgzkOQqfboxTlujz0LH0ftuPn9JhaFNRImTGZyCV+mD5le
 WpZwpHaZ0mpYBPV9W2960m7VmvxmhLxTYM+7QAeqsNZrAN/r2guOqE/Y+J15rOCeTqTMC2pEcq43M
 v71G/Di3ZWS0e5pUL5qmP9Om2l4xnca2o9mxLIY207P1UUpywaSEEi7oxHE83lJsHr31hmg0aVYf7
 eWIMLjKQ==;
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lk9XM-00HLJN-09; Fri, 21 May 2021 18:06:17 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id 15A51613CB;
 Fri, 21 May 2021 18:06:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
 s=korg; t=1621620375;
 bh=PGlP4iraJhEmtFARuI90AqejPX1/fQS9paNMLEY2w+Q=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=iz450FZH/5bpTdyYLCWpyUOLw72CFhgN2ndPP3/YgWcYOR8Jkfl95UxlVx/K+Av6g
 f5ijoFD/NawtnO+gJA2BAiHN2iZROdpHLjIyjMrHUXwB+/hR6E53cP3Qk/wowOSo+B
 a4bUrLbrIfYkcP4jIqjDPr38Ofe7e4S+HAie+dPE=
Date: Fri, 21 May 2021 20:06:13 +0200
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Thierry Reding <treding@nvidia.com>
Cc: Chunfeng Yun <chunfeng.yun@mediatek.com>,
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Paul Cercueil <paul@crapouillou.net>,
 Lee Jones <lee.jones@linaro.org>, linux-usb@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org
Subject: Re: [PATCH v2 3/3] Revert "usb: common: usb-conn-gpio: Make VBUS
 supply optional"
Message-ID: <YKf2ldQhJCVbR3N8@kroah.com>
References: <1621406386-18838-1-git-send-email-chunfeng.yun@mediatek.com>
 <1621406386-18838-3-git-send-email-chunfeng.yun@mediatek.com>
 <YKezl0nlWFQhLyf/@orome.fritz.box>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <YKezl0nlWFQhLyf/@orome.fritz.box>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210521_110616_086386_95C86916 
X-CRM114-Status: GOOD (  27.27  )
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

On Fri, May 21, 2021 at 03:20:23PM +0200, Thierry Reding wrote:
> On Wed, May 19, 2021 at 02:39:46PM +0800, Chunfeng Yun wrote:
> > Vbus is already an optional supply, if the vbus-supply is not
> > provided in DTS, will use a dummy regulator,
> 
> That statement is not entirely correct. The dummy regulator is
> substituted only if the supply is in fact not optional. The idea behind
> that is to allow DTS files that don't specify all required regulators to
> get away with it, based on the assumption that the supply is one of
> those always-on supplies that are often not described in DTS.
> 
> > the warning log is as below:
> > "supply vbus not found, using dummy regulator"
> 
> And the reason why we get that warning is to point out that the DTS has
> a bug and that it should be fixed (by adding a proper regulator to take
> the place of the dummy).
> 
> > This reverts commit 4ddf1ac79e5f082451cd549283d2eb7559ab6ca9.
> 
> But if you read the description of that commit, the purpose of that
> patch was in fact to make the supply completely optional in the case
> where we already have the VBUS supply specified for the USB port that
> the connector is parented to.
> 
> So in that case the DTS doesn't have the bug because the VBUS supply is
> already specified for the USB port and therefore it doesn't have to be
> specified in the USB connector again. In fact, specifying it twice can
> lead to a situation where the USB port may not be able to switch the
> VBUS supply on or off because the setting might conflict with that of
> the USB connector.
> 
> So unless there's a real reason why this is needed, I don't think this
> should be applied.

I've dropped this from my tree now, thanks.

greg k-h

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
