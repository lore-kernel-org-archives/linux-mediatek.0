Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 53325C43334
	for <linux-mediatek@archiver.kernel.org>; Tue,  7 Jun 2022 08:10:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:CC:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=/0mb8bbJ0v4EKcwTpE7GaY3R9HW8SCU8ugvMkG5YCL0=; b=1ZppNBixlQRIJe
	6/yRXIVM/deXA/gXNp5zsbFtPYFjVnpZUWXXTGNuNNYy2mq+QdBVch+tNBrEzyawPXXhLf/qvVIEk
	SQudvht+oIXVzFGxXQykUbYsd/YVd8Zkb7dP7jxIqbgbuJ9d4khp0Pc26GBNSQYZj+jWRDzfIm2NY
	2pL6jZfcpVadNvDvNtGxoFhdZdbab/6BEMqBsDb8ACy2Rs5pFaS/zzzkzSYl8+dQD6L/0YZh2pKWb
	lLk+htseT8Hohq9i0/+n58024zl95Uji9hxnkk4hRO4U0KuJ8UFEo5+aoZisixwu0oFTL+vJk7/uI
	UCqGdFQqbGi7Ityx6BTQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nyUHi-005j87-5M; Tue, 07 Jun 2022 08:09:54 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nyUHe-005j5x-Pa; Tue, 07 Jun 2022 08:09:52 +0000
X-UUID: 8c6ed962bdf8428383ded7c02bae9faa-20220607
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID; bh=eyjOo83bnVLNG1FFP2k81/LHKp9QsxEv+r3PMMjrYb4=;
	b=kqMjrDL62BOcCAanZrwwpgtXEK75aK6CEDn0mlmeEm2A8l1xF5gEk+C3wc+YnkJehYNt/5pEsPlE48gBogacs/bgu2OcEezt7u2de7PjjW6Fl5u+NjORYEhV3PWBx5rmb8AILL/u3AS41fgqPvtXcrfnLTogQJvRRsPyaU1Kqpo=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.5,REQID:8cc32ca6-0cf2-42ea-9e10-cbba4211982d,OB:0,LO
	B:0,IP:0,URL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,RULE:Release_Ham,ACTI
	ON:release,TS:0
X-CID-META: VersionHash:2a19b09,CLOUDID:a92d747e-c8dc-403a-96e8-6237210dceee,C
	OID:IGNORED,Recheck:0,SF:nil,TC:nil,Content:0,EDM:-3,IP:nil,URL:0,File:nil
	,QS:0,BEC:nil
X-UUID: 8c6ed962bdf8428383ded7c02bae9faa-20220607
Received: from mtkcas67.mediatek.inc [(172.29.193.45)] by mailgw02.mediatek.com
	(envelope-from <axe.yang@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
	with ESMTP id 984478753; Tue, 07 Jun 2022 01:09:45 -0700
Received: from mtkmbs11n2.mediatek.inc (172.21.101.187) by
 MTKMBS62DR.mediatek.inc (172.29.94.18) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Tue, 7 Jun 2022 01:09:44 -0700
Received: from mtkcas11.mediatek.inc (172.21.101.40) by
 mtkmbs11n2.mediatek.inc (172.21.101.187) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.2.792.3;
 Tue, 7 Jun 2022 16:09:42 +0800
Received: from mhfsdcap04 (10.17.3.154) by mtkcas11.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Tue, 7 Jun 2022 16:09:41 +0800
Message-ID: <32b24366630e900f4295d19ca7814a10a45e53ca.camel@mediatek.com>
Subject: Re: [RESEND v12 0/3] mmc: mediatek: add support for SDIO async IRQ
From: Axe Yang <axe.yang@mediatek.com>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
CC: Ulf Hansson <ulf.hansson@linaro.org>, Rob Herring <robh+dt@kernel.org>,
	Chaotian Jing <chaotian.jing@mediatek.com>, Matthias Brugger
	<matthias.bgg@gmail.com>, Adrian Hunter <adrian.hunter@intel.com>, "Yoshihiro
 Shimoda" <yoshihiro.shimoda.uh@renesas.com>, Satya Tangirala
	<satyat@google.com>, Wolfram Sang <wsa+renesas@sang-engineering.com>, "Lucas
 Stach" <dev@lynxeye.de>, Eric Biggers <ebiggers@google.com>, Andrew Jeffery
	<andrew@aj.id.au>, Stephen Boyd <swboyd@chromium.org>, Kiwoong Kim
	<kwmad.kim@samsung.com>, Yue Hu <huyue2@yulong.com>, Tian Tao
	<tiantao6@hisilicon.com>, <angelogioacchino.delregno@collabora.com>,
	<linux-mmc@vger.kernel.org>, <devicetree@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-mediatek@lists.infradead.org>,
	<Project_Global_Chrome_Upstream_Group@mediatek.com>
Date: Tue, 7 Jun 2022 16:09:40 +0800
In-Reply-To: <YpiatZh+ZMpoAp/K@smile.fi.intel.com>
References: <20220525015140.384-1-axe.yang@mediatek.com>
	 <1d07579c0a6b8853ab72e345a0bd0be73549de8c.camel@mediatek.com>
	 <YpiatZh+ZMpoAp/K@smile.fi.intel.com>
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.2 
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220607_010950_867186_EF02F476 
X-CRM114-Status: GOOD (  11.42  )
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

On Thu, 2022-06-02 at 14:10 +0300, Andy Shevchenko wrote:
> On Thu, Jun 02, 2022 at 02:07:04PM +0800, Axe Yang wrote:
> > Hi,
> > 
> > Gentle ping for this set.
> 
> It's a merge window, so your code perhaps will be considered next
> week,
> or later.
> 

Got it, thanks.

Regards,
Axe
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
