Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F20D2C433F5
	for <linux-mediatek@archiver.kernel.org>; Fri, 29 Apr 2022 09:31:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:CC:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=8JcMwQK/0xgBsnX0cZU9thzEpp5CZ8N/9y2ntw/h/Zs=; b=iRHDo5bUdvsLfH
	pBJpydROFn6JptZC3rP2M3X4Yu5Pwt4F4joTj7kB+Pux8Q36h9FwvFW55/lAzAviLZK4UpoyVVYys
	OS1ouJiJosReUeXReC9Wa75IhfA7G+PYTK4SEYqT8jjbsKikW7IOV+99Twsz/9CltcQGs8Mp4iVBP
	27raf1EPfHi2s8yTq3LPjDNAwI142mgzD5LiptjOvlxPQleVPUXpwhCL/15/uqS7cPYgLGIAYhSwF
	5CazKnpJqC3G6aBRXAiLirCcO0XyA4BQQ7ZqFa0QiCO534QOLOKknYJgqKxIZLuk+9OMPwjMAaHuX
	CEjRr4Vl1zQwzDDhE85g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nkMyc-00ANxO-GZ; Fri, 29 Apr 2022 09:31:50 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nkMya-00ANw5-4k; Fri, 29 Apr 2022 09:31:49 +0000
X-UUID: 625482b7eebc436f9e5111ae7198af1a-20220429
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID;
 bh=1Gp1s89norgnb3eJVYA1NL5DsVP0bbpwmbnLivDEyOc=; 
 b=K0LptRuSZ807V0a0Q+NnMW+Y5Q+lkQ3j3BvJ6dDWu6oexL6dgyi1ROKt+w9TXt3rPT3QqnuW5GZ/dhHBAParH6ufZ373Tg8yFvbMmF4E6Kdrj1x/cBsaNhGUg3p1QFmLtSMuffk0ZNunO9tQ4Mv2w13xemeC+nrs/qfD68aBWBc=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.4, REQID:2b854293-d3b2-4205-96d7-ad22b1bd9ab6, OB:0,
 LO
 B:0,IP:0,URL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,RULE:Release_Ham,ACTI
 ON:release,TS:0
X-CID-META: VersionHash:faefae9, CLOUDID:5dec2c2f-6199-437e-8ab4-9920b4bc5b76,
 C
 OID:IGNORED,Recheck:0,SF:nil,TC:nil,Content:0,EDM:-3,File:nil,QS:0,BEC:nil
X-UUID: 625482b7eebc436f9e5111ae7198af1a-20220429
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw02.mediatek.com
 (envelope-from <jiaxin.yu@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 2144910437; Fri, 29 Apr 2022 02:31:43 -0700
Received: from mtkmbs07n1.mediatek.inc (172.21.101.16) by
 MTKMBS62N2.mediatek.inc (172.29.193.42) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Fri, 29 Apr 2022 02:21:41 -0700
Received: from mtkcas10.mediatek.inc (172.21.101.39) by
 mtkmbs07n1.mediatek.inc (172.21.101.16) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Fri, 29 Apr 2022 17:21:39 +0800
Received: from mhfsdcap04 (10.17.3.154) by mtkcas10.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Fri, 29 Apr 2022 17:21:38 +0800
Message-ID: <990e0f5b27203d99c502d3cb2fcacc0b9767b848.camel@mediatek.com>
Subject: Re: [v4 00/18] ASoC: mediatek: Add support for MT8186 SoC
From: Jiaxin Yu <jiaxin.yu@mediatek.com>
To: Mark Brown <broonie@kernel.org>
CC: <robh+dt@kernel.org>, <angelogioacchino.delregno@collabora.com>,
 <aaronyu@google.com>, <matthias.bgg@gmail.com>, <trevor.wu@mediatek.com>,
 <tzungbi@google.com>, <julianbraha@gmail.com>, <alsa-devel@alsa-project.org>, 
 <devicetree@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
 <linux-mediatek@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
 <Project_Global_Chrome_Upstream_Group@mediatek.com>
Date: Fri, 29 Apr 2022 17:21:38 +0800
In-Reply-To: <YmqGXCg97X6Vqvs+@sirena.org.uk>
References: <20220428093355.16172-1-jiaxin.yu@mediatek.com>
 <YmqGXCg97X6Vqvs+@sirena.org.uk>
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.2 
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220429_023148_226451_CDD21831 
X-CRM114-Status: GOOD (  12.54  )
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

On Thu, 2022-04-28 at 13:19 +0100, Mark Brown wrote:
> On Thu, Apr 28, 2022 at 05:33:37PM +0800, Jiaxin Yu wrote:
> > This series of patches adds support for Mediatek AFE of MT8186 Soc.
> > Patches are based on broonie tree "for-next" branch.
> 
> This looks mostly good from a framework point of view - I did notice
> a
> few minor issues which I commented on (some of the control things are
> repeated in other patches) but the overwhelming bulk of the code
> looks
> good.
Hi Mark,

Thank you very much for your review. I will check the codes with your
comments carefully.

Best Regards
Jiaxin.Yu
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
