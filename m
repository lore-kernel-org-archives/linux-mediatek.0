Return-Path: <SRS0=uRRy=DF=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,URIBL_BLOCKED,USER_AGENT_SANE_2
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 287A4C2D0A8
	for <linux-mediatek@archiver.kernel.org>; Mon, 28 Sep 2020 03:32:23 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id AE1DD239A1
	for <linux-mediatek@archiver.kernel.org>; Mon, 28 Sep 2020 03:32:22 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="loyr2hur";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="GRiY7BdV"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org AE1DD239A1
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Date:To:From:
	Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=r4V9IBkm0vA9AonmbNVPRW6W9UuMtSOVxZLkVJQNk8s=; b=loyr2hurXStyT5KGX5ZaO6j+G
	3UINWrCfBB4bRfWnCrN91F33PDLm33mXBKQk2ff3PbLAdo2wUtoiv3IxiLOgztUgIof40ctaCMEAH
	3HrPQDHEOI5qFcooEuxdug6+8/X9U2TY6h52sHbqAko8TO3aHOGIyr84Ll4dcyRM2+4hutoWcvykc
	5sZucbEr/9NXzQrTX5KJ2Uw+He1EAPpZ55dNuJW/IQ+daET7+6ybzFWfUbjV57qyqpIXz0OP6qSQ0
	ocmYGUAiO0aDu1F8WvWRDuaZFOU8KYXV8rgM64rOStPrb8UI5Aaiv+Ddgsfxuc+n8/M0IUHbTa8qC
	t2ozLOqyg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kMjte-000604-3B; Mon, 28 Sep 2020 03:32:14 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kMjtZ-0005ym-FZ; Mon, 28 Sep 2020 03:32:11 +0000
X-UUID: 330b6645c4cb484fb62165e4adad48c7-20200927
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID;
 bh=agUedE9PsMXuVeno9bFALFYE9PxOrPom7M+8kFzGWYA=; 
 b=GRiY7BdVQdwHOAQzibc9oZE06JufBhSXtL9aA66cGOxzdpuwcpBYZa2k4lJCTrcPIWCAETzbFx2wp2lYrnoHgLCUbPyW9OJIeTFOtgrKCKfd9UsRg+RqhjsRVIFqvDFGsTm8YIOfi0qiayG8prUez9EjYQJm3d6P83RoI8VR5og=;
X-UUID: 330b6645c4cb484fb62165e4adad48c7-20200927
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw02.mediatek.com
 (envelope-from <chuanjia.liu@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1597844233; Sun, 27 Sep 2020 19:32:00 -0800
Received: from MTKMBS31N1.mediatek.inc (172.27.4.69) by
 MTKMBS62N1.mediatek.inc (172.29.193.41) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Sun, 27 Sep 2020 20:28:26 -0700
Received: from MTKCAS36.mediatek.inc (172.27.4.186) by MTKMBS31N1.mediatek.inc
 (172.27.4.69) with Microsoft SMTP Server (TLS) id 15.0.1497.2;
 Mon, 28 Sep 2020 11:28:23 +0800
Received: from [10.17.3.153] (10.17.3.153) by MTKCAS36.mediatek.inc
 (172.27.4.170) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Mon, 28 Sep 2020 11:28:23 +0800
Message-ID: <1601263551.21671.1.camel@mhfsdcap03>
Subject: Re: Aw: [PATCH v6 0/4] Spilt PCIe node to comply with hardware design
From: Chuanjia Liu <chuanjia.liu@mediatek.com>
To: Frank Wunderlich <frank-w@public-files.de>
Date: Mon, 28 Sep 2020 11:25:51 +0800
In-Reply-To: <trinity-a791b919-956f-4cde-a496-919d4f3f2ba9-1600083556775@3c-app-gmx-bap20>
References: <20200914112659.7091-1-chuanjia.liu@mediatek.com>
 <trinity-a791b919-956f-4cde-a496-919d4f3f2ba9-1600083556775@3c-app-gmx-bap20>
X-Mailer: Evolution 3.10.4-0ubuntu2 
MIME-Version: 1.0
X-TM-SNTS-SMTP: FCAC36D56FCFFF84C336092A77EF8DD389128F98161ACBA993639780B59DBAF42000:8
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200927_233209_714438_88CE4B16 
X-CRM114-Status: GOOD (  10.48  )
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
 linux-pci@vger.kernel.org, Ryder Lee <ryder.lee@mediatek.com>,
 Matthias Brugger <matthias.bgg@gmail.com>, Rob Herring <robh+dt@kernel.org>,
 linux-mediatek@lists.infradead.org, yong.wu@mediatek.com,
 Bjorn Helgaas <bhelgaas@google.com>, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Mon, 2020-09-14 at 13:39 +0200, Frank Wunderlich wrote:
> > Betreff: [PATCH v6 0/4] Spilt PCIe node to comply with hardware design
> 
> just if you need to make another version (as it is only the cover-letter) you can fix the typo in subject ;)

Thanks for your reminding, I will change it in the next version.
> 
> regards Frank
> 

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
