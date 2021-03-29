Return-Path: <SRS0=9jr7=I3=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,USER_AGENT_SANE_2 autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DFC76C433C1
	for <linux-mediatek@archiver.kernel.org>; Mon, 29 Mar 2021 19:00:52 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8243E6195D
	for <linux-mediatek@archiver.kernel.org>; Mon, 29 Mar 2021 19:00:52 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 8243E6195D
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Date:CC:To:From:
	Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=uOmqhWEZkJe4xLKWZiX6jUYHNcQCRsfCNwj/jr6Vscg=; b=cemDDaVVIEzweNKzi4DZsdAOv
	2LQrshKOZg5CMjAKFFWWcGqNy6yoITFlsGxJE88tUZkL9QF4XAVcFtpmkeKOd9zgd5wbwamqtQfis
	cXe/0uzLrera1IKHeW/3HZ+bfh5dD9VBeBfwvylG5/Bu0A+bYe5J2uk7G7veS8Jq/JrPeRrkVVZ82
	TjpYOWtqFbXxox/Q1Ledz0YZSyTW33hz7qcfLld1yhtEwLdtSZRlXO/dNPES076sC+qfAMPR7B06O
	d6/ZF4tT3X48ldg0oLikDGSOR47h8rJIseDya99PeDfkHDW0jnirbzPG1AhCkDDZwoLCny6b7u0YX
	HkH4vl3oQ==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lQx7M-0019km-Mj; Mon, 29 Mar 2021 19:00:06 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lQpzY-000cCE-NW; Mon, 29 Mar 2021 11:23:35 +0000
X-UUID: f858e9dbb6d64833a9494e18fa9778e2-20210329
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID;
 bh=e+j3HOJYkEgb4OFdcu6vsVJWYgl5xZHQHq7OrdvlVdk=; 
 b=bQyxinlJkp+bNFUeNRxbwP6AMy/JfzSasVFZEu4L++mYvloTIzaswaaEMvlBsM7a0vBCCytDzTO+ccgb+es1nV+TL+rweKL6q1dtJlsC1mxVQ7XaiSFo2ex8IQJNKiWa9LSNxk2EYO4NWS1xnhzJfHkAtMa8msOyyjZt4ZgOSjM=;
X-UUID: f858e9dbb6d64833a9494e18fa9778e2-20210329
Received: from mtkcas68.mediatek.inc [(172.29.94.19)] by mailgw02.mediatek.com
 (envelope-from <zhiyong.tao@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1383721489; Mon, 29 Mar 2021 03:23:23 -0800
Received: from MTKMBS31N1.mediatek.inc (172.27.4.69) by
 MTKMBS62DR.mediatek.inc (172.29.94.18) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Mon, 29 Mar 2021 04:23:21 -0700
Received: from MTKCAS32.mediatek.inc (172.27.4.184) by MTKMBS31N1.mediatek.inc
 (172.27.4.69) with Microsoft SMTP Server (TLS) id 15.0.1497.2;
 Mon, 29 Mar 2021 19:23:17 +0800
Received: from [10.17.3.153] (10.17.3.153) by MTKCAS32.mediatek.inc
 (172.27.4.170) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Mon, 29 Mar 2021 19:23:16 +0800
Message-ID: <1617016996.10316.5.camel@mhfsdcap03>
Subject: Re: [PATCH Resend 0/6] Mediatek pinctrl patch on mt8195
From: zhiyong tao <zhiyong.tao@mediatek.com>
To: Andy Shevchenko <andy.shevchenko@gmail.com>
CC: Rob Herring <robh+dt@kernel.org>, Linus Walleij
 <linus.walleij@linaro.org>, Mark Rutland <mark.rutland@arm.com>, "Matthias
 Brugger" <matthias.bgg@gmail.com>, <sean.wang@kernel.org>, srv_heupstream
 <srv_heupstream@mediatek.com>, <hui.liu@mediatek.com>, Eddie Huang
 <eddie.huang@mediatek.com>, <jg_poxu@mediatek.com>,
 <biao.huang@mediatek.com>, <hongzhou.yang@mediatek.com>,
 <erin.lo@mediatek.com>, Sean Wang <sean.wang@mediatek.com>,
 <seiya.wang@mediatek.com>, Sj Huang <sj.huang@mediatek.com>, devicetree
 <devicetree@vger.kernel.org>, Linux Kernel Mailing List
 <linux-kernel@vger.kernel.org>, linux-arm Mailing List
 <linux-arm-kernel@lists.infradead.org>, "moderated list:ARM/Mediatek SoC
 support" <linux-mediatek@lists.infradead.org>, "open list:GPIO SUBSYSTEM"
 <linux-gpio@vger.kernel.org>
Date: Mon, 29 Mar 2021 19:23:16 +0800
In-Reply-To: <CAHp75Vcms=dAXcACraU4BHENee6j+CTwQtMVtURdnMHVAmTXkw@mail.gmail.com>
References: <20210329080611.9312-1-zhiyong.tao@mediatek.com>
 <CAHp75Vcms=dAXcACraU4BHENee6j+CTwQtMVtURdnMHVAmTXkw@mail.gmail.com>
X-Mailer: Evolution 3.10.4-0ubuntu2 
MIME-Version: 1.0
X-TM-SNTS-SMTP: 9B1EC72129735A46A7FFA3D75144C8A618421BEB0AA235F01220821420B777472000:8
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210329_122333_298143_15907853 
X-CRM114-Status: GOOD (  17.22  )
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

On Mon, 2021-03-29 at 13:47 +0300, Andy Shevchenko wrote:
> On Mon, Mar 29, 2021 at 11:09 AM Zhiyong Tao <zhiyong.tao@mediatek.com> wrote:
> >
> > This series includes 6 patches:
> > 1.add pinctrl file on mt8195.
> > 2.add pinctrl binding document on mt8195.
> > 3.add pinctrl device node on mt8195.
> > 4.add pinctrl driver on MT8195.
> > 5.add pinctrl drive for I2C related pins on MT8195.
> > 6.add pinctrl rsel setting on MT8195.
> 
> You submitted the same version of the series twice, but it confuses people.
> Now you have to properly send the series only one time with the
> correct version added and changelog explains the changes done between
> the versions.
> 
> 

==> Hi, Andy,
There are no change between the two version.
Because we get the refused mail from
"linux-arm-kernel@lists.infradead.org".
The error mail:
Delivery has failed to these recipients or groups:
linux-arm-kernel@lists.infradead.org
A problem occurred while delivering this message to this email address.
Try sending this message again. If the problem continues, please contact
your helpdesk.
The following organization rejected your message: desiato.infradead.org
[90.155.92.199].

We will send v0 version  and add v0 version in every patch next time.

Thanks.

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
