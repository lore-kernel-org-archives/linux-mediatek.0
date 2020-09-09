Return-Path: <SRS0=qDs2=CS=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,URIBL_BLOCKED,USER_AGENT_SANE_2
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1589BC43461
	for <linux-mediatek@archiver.kernel.org>; Wed,  9 Sep 2020 03:26:48 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B73A720EDD
	for <linux-mediatek@archiver.kernel.org>; Wed,  9 Sep 2020 03:26:47 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="aeBwuICY";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="f2HMqAS5"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org B73A720EDD
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Date:To:From:
	Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=fSFkq+7Ci2kwKb5Nf+GpoxunXsrrbkD6eTFR+kX2eC4=; b=aeBwuICYn1pTH9Yp84PLnaCpn
	ZMs052ojidR9uD2t0UC0ctvwooVXsfMvlFXEed6Yh0qEFMiTuBjQGUMwEZGn6S7De4V4twkiJ8LOi
	1yQ1GkoLZzwSpTQrDa/RzzVFrH0TSLRJjLAnH3ApQEN6ANs8OC/vJaYyakstZdfP8KkPYY1rItxiT
	SR8D/XO5UVvgKcaIwlU1/x2MHt/dponEPbdjJYGXRbkeJJSwkcp22LXdapMNkxbycIYE2aydgtF72
	324QPSrqbwI0FIK3Ydmya8xjs2yfTtphOW+MMIbr8ELdXHI91StjijyloH23ODrrlnQrXtcUdeABD
	Db903DgMw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kFqkq-0003Ee-1D; Wed, 09 Sep 2020 03:26:40 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kFqkn-0003Du-H7; Wed, 09 Sep 2020 03:26:38 +0000
X-UUID: 786aed377f4a434f8268e2519fe28c74-20200908
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID;
 bh=D4akEY1UsIrLp2l32I4rH/2r4ZNkNg0urog1SmVJQy4=; 
 b=f2HMqAS5HdzGiqovALQY3IIbtKL3Vyr5hGlhiL/sOeABmvMNz2pIj3+bU7tho+cXO4lBoFbmBOtw34txCEsM8sJ8tW2XXSDq94rb477khaxWI0WbWxvCLRoWIb1t00QFAijp36TXvmdFbsrwNPHWhB2r3XOSWB79v+tKpBQQhfA=;
X-UUID: 786aed377f4a434f8268e2519fe28c74-20200908
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw02.mediatek.com
 (envelope-from <jianjun.wang@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1227567834; Tue, 08 Sep 2020 19:26:35 -0800
Received: from mtkmbs08n2.mediatek.inc (172.21.101.56) by
 MTKMBS62DR.mediatek.inc (172.29.94.18) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Tue, 8 Sep 2020 20:16:33 -0700
Received: from MTKCAS32.mediatek.inc (172.27.4.184) by mtkmbs08n2.mediatek.inc
 (172.21.101.56) with Microsoft SMTP Server (TLS) id 15.0.1497.2;
 Wed, 9 Sep 2020 11:16:31 +0800
Received: from [10.17.3.153] (10.17.3.153) by MTKCAS32.mediatek.inc
 (172.27.4.170) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Wed, 9 Sep 2020 11:16:30 +0800
Message-ID: <1599621279.2521.13.camel@mhfsdcap03>
Subject: Re: [v1,1/3] dt-bindings: Add YAML schemas for Gen3 PCIe controller
From: Jianjun Wang <jianjun.wang@mediatek.com>
To: Bjorn Helgaas <helgaas@kernel.org>
Date: Wed, 9 Sep 2020 11:14:39 +0800
In-Reply-To: <20200908200407.GA628520@bjorn-Precision-5520>
References: <20200908200407.GA628520@bjorn-Precision-5520>
X-Mailer: Evolution 3.10.4-0ubuntu2 
MIME-Version: 1.0
X-TM-SNTS-SMTP: 0EE92390ADB39B90B8C5C83EAD1CEFB6CD9D6181AF39723CDB849AC1378F8DBA2000:8
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200908_232637_752650_485C0840 
X-CRM114-Status: GOOD (  13.04  )
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
Cc: devicetree@vger.kernel.org, Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>,
 Mauro Carvalho Chehab <mchehab+huawei@kernel.org>, linux-pci@vger.kernel.org,
 Ryder Lee <ryder.lee@mediatek.com>, linux-kernel@vger.kernel.org, Matthias
 Brugger <matthias.bgg@gmail.com>, Sj Huang <sj.huang@mediatek.com>,
 Rob Herring <robh+dt@kernel.org>, linux-mediatek@lists.infradead.org,
 Philipp Zabel <p.zabel@pengutronix.de>, Bjorn Helgaas <bhelgaas@google.com>,
 davem@davemloft.net, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Tue, 2020-09-08 at 15:04 -0500, Bjorn Helgaas wrote:
> On Mon, Sep 07, 2020 at 08:08:50PM +0800, Jianjun Wang wrote:
> > Add YAML schemas documentation for Gen3 PCIe controller on
> > MediaTek SoCs.
> 
> Please mention "mediatek" in the subject line so "git log --oneline"
> is more useful.
> 
> The convention (not universally observed) seems to be something like:
> 
>   dt-bindings: PCI: <driver-name>: Add YAML schema

Thanks for your review, I will fix it in the next version.

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
