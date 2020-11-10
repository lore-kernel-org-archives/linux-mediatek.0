Return-Path: <SRS0=XLXJ=EQ=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,URIBL_BLOCKED,USER_AGENT_SANE_2
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D1981C2D0A3
	for <linux-mediatek@archiver.kernel.org>; Tue, 10 Nov 2020 01:41:40 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D90CE2065D
	for <linux-mediatek@archiver.kernel.org>; Tue, 10 Nov 2020 01:41:39 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="IrSO9NjT";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="nO8dGzUI"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org D90CE2065D
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Date:To:From:
	Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=Se5jH11exu0hInTPpn2ie2lbK7b4niqq9nNgEpdT0yA=; b=IrSO9NjT8Oyj+LBgex91wLneX
	H4znBBbCNJkCHkJWN3G1enopJRdZ+0cAe4vTS54IeN7ArUm8prBn3rJgqEGkiZfGQsjz7Fwxv96Lx
	ePiwKFHqJhp2HoP+LQpLOJ0wjLTHbFpgSuYJN64uRt9NJO/c+SZFdu9uAQV+1W88lIQL2W5N32bJf
	Rf3icbXy795/atd+raHu54l5hXukKGQkE6VPHw/2Iq7oQFU7kLLy6ySsxxbSdevyzxgai/zuZPTD6
	NvTsU0D3smC314BvpcRxM1iLj92/9TjHme/GedHfHIMXrQ9ZQPBGrgoJEFQrYl33x9R3OtBR9vvGs
	fZEqfzCFA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kcIf5-000159-Jp; Tue, 10 Nov 2020 01:41:31 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kcIf2-00014h-1x; Tue, 10 Nov 2020 01:41:30 +0000
X-UUID: 24adb10d01dd499e9cbd66a89eb7ab55-20201109
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID;
 bh=YjSSNPs9DIKiggA5+V9fbL6MfaunwhMceWHthl8AyvQ=; 
 b=nO8dGzUIDG+QXsinumgcurz/T7wPsQvr1oPc1A7nF2uGE/ORDVrKMr2cPaXTjHVcwXG+f0QJzH/z4yRyz3kSnOATU5ipjC41YTEp5qhOTcaDXEMhpNWle2fifa5iqlrB8JIuxFI+6nZB366Js0YYH18fbyORUb0kY9ga/Rg25VI=;
X-UUID: 24adb10d01dd499e9cbd66a89eb7ab55-20201109
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw02.mediatek.com
 (envelope-from <weiyi.lu@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1079026870; Mon, 09 Nov 2020 17:41:21 -0800
Received: from MTKMBS07N2.mediatek.inc (172.21.101.141) by
 MTKMBS62N2.mediatek.inc (172.29.193.42) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Mon, 9 Nov 2020 17:38:41 -0800
Received: from MTKCAS06.mediatek.inc (172.21.101.30) by
 mtkmbs07n2.mediatek.inc (172.21.101.141) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Tue, 10 Nov 2020 09:38:41 +0800
Received: from [172.21.77.4] (172.21.77.4) by MTKCAS06.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Tue, 10 Nov 2020 09:38:40 +0800
Message-ID: <1604972321.16474.9.camel@mtksdaap41>
Subject: Re: [PATCH] clk: mediatek: fix mtk_clk_register_mux() as static
 function
From: Weiyi Lu <weiyi.lu@mediatek.com>
To: Greg KH <gregkh@linuxfoundation.org>
Date: Tue, 10 Nov 2020 09:38:41 +0800
In-Reply-To: <20201109102035.GA1238638@kroah.com>
References: <1604914627-9203-1-git-send-email-weiyi.lu@mediatek.com>
 <20201109102035.GA1238638@kroah.com>
X-Mailer: Evolution 3.10.4-0ubuntu2 
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201109_204128_641659_8E4027BB 
X-CRM114-Status: GOOD (  14.41  )
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
Cc: srv_heupstream@mediatek.com, Stephen Boyd <sboyd@kernel.org>,
 linux-kernel@vger.kernel.org, stable@vger.kernel.org,
 linux-mediatek@lists.infradead.org, Matthias Brugger <matthias.bgg@gmail.com>,
 Owen Chen <owen.chen@mediatek.com>, linux-clk@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Mon, 2020-11-09 at 11:20 +0100, Greg KH wrote:
> On Mon, Nov 09, 2020 at 05:37:07PM +0800, Weiyi Lu wrote:
> > mtk_clk_register_mux() should be a static function
> > 
> > Fixes: a3ae549917f16 ("clk: mediatek: Add new clkmux register API")
> > Cc: <stable@vger.kernel.org>
> 
> Why is this for stable trees?

Hi Greg,

My Mistake. Indeed, this is not a bug fix for stable tree.
And there are simple questions.
Will I be allowed to keep the fixes tag in this patch to indicate the
mistakes we made in previous commit if it's not a bug fix for stable
tree?
And all I need to do now is to remove stable tree from cc list. Is it
correct?

Many thanks.

> 

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
