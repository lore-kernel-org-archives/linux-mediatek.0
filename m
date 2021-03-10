Return-Path: <SRS0=oSKo=II=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-20.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,
	UNPARSEABLE_RELAY,URIBL_BLOCKED,USER_AGENT_SANE_2 autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 390DDC433DB
	for <linux-mediatek@archiver.kernel.org>; Wed, 10 Mar 2021 03:23:08 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C6D9964FEF
	for <linux-mediatek@archiver.kernel.org>; Wed, 10 Mar 2021 03:23:07 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org C6D9964FEF
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Date:CC:To:From:
	Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=gJ5HgWDlucvaZXjnwzF9LzeNqau5H350WN2K4z9Xokg=; b=F41+4GYwuKb67a0FokFjfzaaT
	ElBUFV4abNIRpkboCZqmWMG8L54iFgu8hpAmwXmEntbByBdFBM6LrAvNIcLtWUenCFAwDza5j8/DW
	QFjG8FAjQbC1CM/gnMUZkDk7uyyf3ALXCW9wkrxh+hT8A4IDmbK38HwwzIXwoei7cpVdctT47cdLW
	k2D7nlbjdNUJ8t6PYE8zNSteS0A1Z75eXASv1BMQDRQeVzhVxQbzk3HEleIf9I9DKQIQIktqXBUWU
	CKxJs3E7UhJeXKI/w6LTCgyLkTDHJImVERMxqJQIRHC5tCTcqP6LYAo2HPP7UtgAJPSXhuVpdV/qr
	j5+NOZXOQ==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lJpR3-005uUZ-Ei; Wed, 10 Mar 2021 03:22:57 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lJpQl-005uSY-JX; Wed, 10 Mar 2021 03:22:55 +0000
X-UUID: cb79de1540d04c70a5953286af1bddda-20210309
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID;
 bh=Qm4ADIUSz0BkSqAidhclsvS24ql8ww8Akt6F39qDx7Y=; 
 b=k8jmv59Xxttoo3Xq9BzBcIiGwxoBdDTD5pywoctCwZI4ZZeIP1/WYTfyETDPNJziD4mHQglqt8rFjK24G3nQ0/O7vXKpuG2F3h9g7nX2CULTKt8/rohWbNY+V13Q7gf2BRRE/Z63lvFtkhH0rAW2TTjr7pOdAR7TnC0LLS49yB0=;
X-UUID: cb79de1540d04c70a5953286af1bddda-20210309
Received: from mtkcas67.mediatek.inc [(172.29.193.45)] by mailgw02.mediatek.com
 (envelope-from <chunfeng.yun@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1866153952; Tue, 09 Mar 2021 19:21:21 -0800
Received: from MTKMBS32N1.mediatek.inc (172.27.4.71) by
 MTKMBS62DR.mediatek.inc (172.29.94.18) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Tue, 9 Mar 2021 19:21:20 -0800
Received: from MTKCAS32.mediatek.inc (172.27.4.184) by MTKMBS32N1.mediatek.inc
 (172.27.4.71) with Microsoft SMTP Server (TLS) id 15.0.1497.2;
 Wed, 10 Mar 2021 11:21:15 +0800
Received: from [10.17.3.153] (10.17.3.153) by MTKCAS32.mediatek.inc
 (172.27.4.170) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Wed, 10 Mar 2021 11:21:11 +0800
Message-ID: <1615346469.26498.1.camel@mhfsdcap03>
Subject: Re: [PATCH v4 01/12] dt-bindings: usb: fix yamllint check warning
From: Chunfeng Yun <chunfeng.yun@mediatek.com>
To: Rob Herring <robh@kernel.org>
CC: Vinod Koul <vkoul@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>, 
 Kishon Vijay Abraham I <kishon@ti.com>, Greg Kroah-Hartman
 <gregkh@linuxfoundation.org>, Chun-Kuang Hu <chunkuang.hu@kernel.org>,
 Philipp Zabel <p.zabel@pengutronix.de>,
 <linux-arm-kernel@lists.infradead.org>, <linux-mediatek@lists.infradead.org>, 
 <linux-kernel@vger.kernel.org>, <devicetree@vger.kernel.org>,
 <linux-usb@vger.kernel.org>
Date: Wed, 10 Mar 2021 11:21:09 +0800
In-Reply-To: <20210310022811.GA1612587@robh.at.kernel.org>
References: <20210308053745.25697-1-chunfeng.yun@mediatek.com>
 <20210310022811.GA1612587@robh.at.kernel.org>
X-Mailer: Evolution 3.10.4-0ubuntu2 
MIME-Version: 1.0
X-TM-SNTS-SMTP: 03113CCC20566CE8672CF41E43EC90724E1ED108A9BDF8A6453CB766C18F9BDB2000:8
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210310_032252_273282_283A8460 
X-CRM114-Status: GOOD (  19.01  )
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

On Tue, 2021-03-09 at 19:28 -0700, Rob Herring wrote:
> On Mon, Mar 08, 2021 at 01:37:34PM +0800, Chunfeng Yun wrote:
> > Fix warning: "missing starting space in comment"
> 
> What tree is this in because I don't see it.
The patch is based kernel 5.12-rc1, also happens on
git://git.kernel.org/pub/scm/linux/kernel/git/gregkh/usb.git usb-next


> 
> > 
> > Signed-off-by: Chunfeng Yun <chunfeng.yun@mediatek.com>
> > ---
> > v2~v4: no changes
> > ---
> >  Documentation/devicetree/bindings/usb/usb-device.yaml | 6 +++---
> >  1 file changed, 3 insertions(+), 3 deletions(-)
> > 
> > diff --git a/Documentation/devicetree/bindings/usb/usb-device.yaml b/Documentation/devicetree/bindings/usb/usb-device.yaml
> > index d4c99809ee9a..b77960a7a37b 100644
> > --- a/Documentation/devicetree/bindings/usb/usb-device.yaml
> > +++ b/Documentation/devicetree/bindings/usb/usb-device.yaml
> > @@ -82,9 +82,9 @@ required:
> >  additionalProperties: true
> >  
> >  examples:
> > -  #hub connected to port 1
> > -  #device connected to port 2
> > -  #device connected to port 3
> > +  # hub connected to port 1
> > +  # device connected to port 2
> > +  # device connected to port 3
> >    #    interface 0 of configuration 1
> >    #    interface 0 of configuration 2
> >    - |
> > -- 
> > 2.18.0

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
