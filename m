Return-Path: <SRS0=qDs2=CS=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,URIBL_BLOCKED,USER_AGENT_SANE_2
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AE839C433E2
	for <linux-mediatek@archiver.kernel.org>; Wed,  9 Sep 2020 08:37:45 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 622AE215A4
	for <linux-mediatek@archiver.kernel.org>; Wed,  9 Sep 2020 08:37:45 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="eihN2494";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="k1hGMFTL"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 622AE215A4
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Date:To:From:
	Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=QqijOcfodTT9MCfFK9Ksv4syqEVSdydNNq3P9lcQG14=; b=eihN2494Uy27aPC/ViHd4F9KW
	kxM1ubw9NW+72lNtMEKER/07k6itgQstqRJ9k74vOcTF4TvM3SKySslYav0fE5dxp7z0IKkyrXKUF
	WdUB98q8e/gaME/rI5qnRJOtF4JK5oYj5IB3a8tzwKjcQr6y4XRWFAYwl72Ysv5hvegQzRw5O3vlk
	URukGa2DkQgcoWNlfyurbY77C6WjrcEgrRcXgZ/qqTizCOs/cl1JDzHaZgJCKXy04QdY++3uxE5gQ
	na972tgd8So4jtnejU8zbRxG6hz2aGJOvEjugB3W0WSeXRQjJHRTmZrvB2Zu6mQcyGLU/qKNXg0BI
	ayQ1HmXfA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kFvbh-0006Pg-HF; Wed, 09 Sep 2020 08:37:33 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kFvbb-0006NY-Ko; Wed, 09 Sep 2020 08:37:28 +0000
X-UUID: c99eabd73795473fb8a7ada020533783-20200909
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID;
 bh=O9832d5FtUtC0eZGVaybBrxYrKTO7MoaDi7iQnm05WU=; 
 b=k1hGMFTLir+241+Tvglv5fPlEX+OkEuhISLgylnQrzYg8zukRBPHWtafFn4RaARtsYQ/WBw93bTAPRBXuZ9SyVwhUFRnPp9xlU8L4EQ5rEAmn35yl5cbownQofWxm5U3him4Isv2pCRHH75+al4L61uxnFQSLemR75uVtQuCTf8=;
X-UUID: c99eabd73795473fb8a7ada020533783-20200909
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw01.mediatek.com
 (envelope-from <neal.liu@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 582153705; Wed, 09 Sep 2020 00:37:16 -0800
Received: from MTKMBS01N1.mediatek.inc (172.21.101.68) by
 MTKMBS62N1.mediatek.inc (172.29.193.41) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Wed, 9 Sep 2020 01:37:14 -0700
Received: from MTKCAS06.mediatek.inc (172.21.101.30) by
 mtkmbs01n1.mediatek.inc (172.21.101.68) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Wed, 9 Sep 2020 16:37:06 +0800
Received: from [172.21.77.33] (172.21.77.33) by MTKCAS06.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Wed, 9 Sep 2020 16:37:06 +0800
Message-ID: <1599640627.6370.3.camel@mtkswgap22>
Subject: Re: [PATCH v7] Add MediaTek MT6779 devapc driver
From: Neal Liu <neal.liu@mediatek.com>
To: Rob Herring <robh+dt@kernel.org>, Matthias Brugger
 <matthias.bgg@gmail.com>, Chun-Kuang Hu <chunkuang.hu@kernel.org>
Date: Wed, 9 Sep 2020 16:37:07 +0800
In-Reply-To: <1599028813.32069.1.camel@mtkswgap22>
References: <1598497593-15781-1-git-send-email-neal.liu@mediatek.com>
 <1599028813.32069.1.camel@mtkswgap22>
X-Mailer: Evolution 3.2.3-0ubuntu6 
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200909_043727_844485_36789355 
X-CRM114-Status: GOOD (  21.19  )
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
Cc: "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 wsd_upstream <wsd_upstream@mediatek.com>, lkml <linux-kernel@vger.kernel.org>,
 "linux-mediatek@lists.infradead.org" <linux-mediatek@lists.infradead.org>,
 Neal Liu <neal.liu@mediatek.com>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Hi Rob, Matthias, Chun-Kuang,

Please kindly let me know your comments about this patch set.
Thanks

-Neal

On Wed, 2020-09-02 at 14:40 +0800, Neal Liu wrote:
> Hi Rob, Matthias, Chun-Kuang,
> 
> Gentle ping for this patch set.
> Thanks
> 
> -Neal
> 
> On Thu, 2020-08-27 at 11:06 +0800, Neal Liu wrote:
> > These patch series introduce a MediaTek MT6779 devapc driver.
> > 
> > MediaTek bus fabric provides TrustZone security support and data protection to prevent slaves from being accessed by unexpected masters.
> > The security violation is logged and sent to the processor for further analysis or countermeasures.
> > 
> > Any occurrence of security violation would raise an interrupt, and it will be handled by mtk-devapc driver.
> > The violation information is printed in order to find the murderer.
> > 
> > changes since v6:
> > - remove unnecessary mask/unmask module irq during ISR.
> > 
> > changes since v5:
> > - remove redundant write reg operation.
> > - use static variable of vio_dbgs instead.
> > - add stop_devapc() if driver is removed.
> > 
> > changes since v4:
> > - refactor data structure.
> > - merge two simple functions into one.
> > - refactor register setting to prevent too many function call overhead.
> > 
> > changes since v3:
> > - revise violation handling flow to make it more easily to understand
> >   hardware behavior.
> > - add more comments to understand how hardware works.
> > 
> > changes since v2:
> > - pass platform info through DT data.
> > - remove unnecessary function.
> > - remove slave_type because it always equals to 1 in current support SoC.
> > - use vio_idx_num instread of list all devices' index.
> > - add more comments to describe hardware behavior.
> > 
> > changes since v1:
> > - move SoC specific part to DT data.
> > - remove unnecessary boundary check.
> > - remove unnecessary data type declaration.
> > - use read_poll_timeout() instread of for loop polling.
> > - revise coding style elegantly.
> > 
> > 
> > *** BLURB HERE ***
> > 
> > Neal Liu (2):
> >   dt-bindings: devapc: add bindings for mtk-devapc
> >   soc: mediatek: add mt6779 devapc driver
> > 
> >  .../bindings/soc/mediatek/devapc.yaml         |  58 ++++
> >  drivers/soc/mediatek/Kconfig                  |   9 +
> >  drivers/soc/mediatek/Makefile                 |   1 +
> >  drivers/soc/mediatek/mtk-devapc.c             | 305 ++++++++++++++++++
> >  4 files changed, 373 insertions(+)
> >  create mode 100644 Documentation/devicetree/bindings/soc/mediatek/devapc.yaml
> >  create mode 100644 drivers/soc/mediatek/mtk-devapc.c
> > 
> 
> 

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
