Return-Path: <SRS0=cyKo=BC=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	URIBL_BLOCKED,USER_AGENT_SANE_2 autolearn=unavailable autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id ED645C433EB
	for <linux-mediatek@archiver.kernel.org>; Thu, 23 Jul 2020 06:14:55 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B9F0222D01
	for <linux-mediatek@archiver.kernel.org>; Thu, 23 Jul 2020 06:14:55 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="W3jiXE4U";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="c0Fsw8o9"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org B9F0222D01
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Date:To:From:
	Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=iaIvm5qOLrGjFKHKMRY6nTBe0GzjjJmU7NSZuphumaY=; b=W3jiXE4UFTdcynjzvTcXAXFZc
	z4agGp8ophR66QjPVl8HQyu//J1UP6DuCaZvaO/tsgNz+lyB5rx9H3QdnDtgx+pDP+8FchbyleylB
	m/rvT4CvD2OfAHXFkhP6CS5s1N0Z/YbHgZ+92Mly7Xm8EDAAEYvHA8I89BtipGtr0OUHKyu6Reaq+
	pMhuV8J2/fjJP6KEXJ9WEEvGft+uJIUCfMDUw0oC/o9kX86mSFPCXlquDywSdHMVRnZKtRNuoYXvT
	7iFRzwxPyGKAKvRRGnpQ8R84Qt2jxSC6vVvEW9aRuLRdTlNlQ0HS6rnCbmtmutfPGUcNv8XhuOAJG
	NKX9CIbcA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jyUVB-0004Fy-PF; Thu, 23 Jul 2020 06:14:45 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jyUV9-0004FR-FP; Thu, 23 Jul 2020 06:14:44 +0000
X-UUID: ade1af08cb7d45f09f4aa133f2cc09c1-20200722
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID;
 bh=iZ9yK+S9kB96ZqeDW7h02ziiSCDTyDczQRrti5SX7zw=; 
 b=c0Fsw8o9Y0LitexrQ6u+NAbfciXPCIQX5XkggI8FYKFGoHi8AbUUdIwAOxjySwXhw5FrTgv3bakJNJ2kChDblIOfiz37jVs4j1he+7eUf8Uogwlj5w7Z0BtwC2Ai5AhM2BUPYbyoGw89cPZgeAoXD5UJd8YdHEP58Hx9WhJEb0s=;
X-UUID: ade1af08cb7d45f09f4aa133f2cc09c1-20200722
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw02.mediatek.com
 (envelope-from <qii.wang@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLS)
 with ESMTP id 1705184496; Wed, 22 Jul 2020 22:14:37 -0800
Received: from MTKMBS31DR.mediatek.inc (172.27.6.102) by
 MTKMBS62DR.mediatek.inc (172.29.94.18) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Wed, 22 Jul 2020 23:04:35 -0700
Received: from MTKCAS36.mediatek.inc (172.27.4.186) by MTKMBS31DR.mediatek.inc
 (172.27.6.102) with Microsoft SMTP Server (TLS) id 15.0.1497.2;
 Thu, 23 Jul 2020 14:04:34 +0800
Received: from [10.17.3.153] (10.17.3.153) by MTKCAS36.mediatek.inc
 (172.27.4.170) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Thu, 23 Jul 2020 14:04:33 +0800
Message-ID: <1595484205.16079.28.camel@mhfsdcap03>
Subject: Re: [PATCH 2/4] i2c: mediatek: Support DMA mask range over 33-bits
From: Qii Wang <qii.wang@mediatek.com>
To: Yingjoe Chen <yingjoe.chen@mediatek.com>
Date: Thu, 23 Jul 2020 14:03:25 +0800
In-Reply-To: <1595467461.7332.3.camel@mtksdaap41>
References: <1595421106-10017-1-git-send-email-qii.wang@mediatek.com>
 <1595421106-10017-3-git-send-email-qii.wang@mediatek.com>
 <1595467461.7332.3.camel@mtksdaap41>
X-Mailer: Evolution 3.10.4-0ubuntu2 
MIME-Version: 1.0
X-TM-SNTS-SMTP: 0187662DA839AB3AB988161E5738441024327E1EEDC636DD4CFA77ABBB887D0E2000:8
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200723_021443_668894_DC1FC83B 
X-CRM114-Status: GOOD (  15.85  )
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
Cc: qiangming.xia@mediatek.com, devicetree@vger.kernel.org,
 srv_heupstream@mediatek.com, wsa@the-dreams.de, leilk.liu@mediatek.com,
 linux-kernel@vger.kernel.org, robh+dt@kernel.org,
 linux-mediatek@lists.infradead.org, linux-i2c@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Thu, 2020-07-23 at 09:24 +0800, Yingjoe Chen wrote:
> On Wed, 2020-07-22 at 20:31 +0800, Qii Wang wrote:
> > Replace 'support_33bits with 'dma_max_support' for DMA mask
> > operation, and replace 'mtk_i2c_set_4g_mode' with 'upper_32_bits'.
> 
> This doesn't explain why we need this patch. How about:
> 
> Newer MTK chip support more than 8GB of dram. Replace support_33bits
> with more general dma_max_support.
> 

ok, Thanks for your comments.

> 
> > 
> > Signed-off-by: Qii Wang <qii.wang@mediatek.com>
> > ---
> >  drivers/i2c/busses/i2c-mt65xx.c | 37 +++++++++++++++++--------------------
> >  1 file changed, 17 insertions(+), 20 deletions(-)
> > 
> > diff --git a/drivers/i2c/busses/i2c-mt65xx.c b/drivers/i2c/busses/i2c-mt65xx.c
> > index e6b984a..e475877 100644
> > --- a/drivers/i2c/busses/i2c-mt65xx.c
> > +++ b/drivers/i2c/busses/i2c-mt65xx.c
> > @@ -209,6 +209,7 @@ struct mtk_i2c_compatible {
> >  	unsigned char dma_sync: 1;
> >  	unsigned char ltiming_adjust: 1;
> >  	unsigned char apdma_sync: 1;
> > +	unsigned char max_dma_support;
> 
> support_33bits is no longer used. Please remove it.
> 
> Joe.C
> 

ok.

> 

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
