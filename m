Return-Path: <SRS0=pTuV=6N=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.3 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,
	USER_AGENT_SANE_2 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 92CA7C83003
	for <linux-mediatek@archiver.kernel.org>; Wed, 29 Apr 2020 04:03:33 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 57E132053B
	for <linux-mediatek@archiver.kernel.org>; Wed, 29 Apr 2020 04:03:33 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="CJ2HdUrk";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="pum+Q+O5"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 57E132053B
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=25Y5R0usw3llgSPldBGZxKWtyjAxjOSdSPR/cir5290=; b=CJ2HdUrk49QLwP
	eB6zLhu1XZorhfN5qBDD/f4t3Q9TrJC4PNnSCSuJPTpPJUI4Lt6LBt+UyL3gsemivrpXbAUBpcNgz
	+iaIdOj0TpjzMalhEbwttAz5z6Pwv16TLo26cqsqwD/WYZnPU4+b6TIK/dMoZEcw7WTcU6x92Hv7P
	RhS/bfL5hfaeH2abZOdK/6mIjd06evYp7G3WRAD0uYNxcrOj41swscS0AG5VEh8QsxPngTJiTiahV
	AlgmInIypAAKwZWkUg4p7vXO80CvESadw7TLowPl5A5lHHP/1sOgnM/LJa9d5T4y5RQeN6bGUwRrN
	D1eBlY3vtuErE4CV7+Sg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jTdwR-0000DO-Az; Wed, 29 Apr 2020 04:03:23 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jTdwH-0008WN-1U; Wed, 29 Apr 2020 04:03:15 +0000
X-UUID: 005e0d44e81b4616a6157b1a9dc4df99-20200428
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID;
 bh=OiZgzIWXliTigMWS4ngHmC2XsFCzxE9JvxbFZlR5Y5A=; 
 b=pum+Q+O5Zp2uxHclGYj9cXsT8SoFWIVRHAE44jy8rMaHtkwvzjTDHCVLKwZDxTSDb9/VXfQbXXqfMb/sFnS8IwTzQxOfFEMzLMCCbzxrLdhCmoEpAwYW4XAhWRMBQea5tVJnzld4V7EYuEZkaxp8o5jG722jRxyzcdvLg8/vvIA=;
X-UUID: 005e0d44e81b4616a6157b1a9dc4df99-20200428
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw01.mediatek.com
 (envelope-from <eastl.lee@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLS)
 with ESMTP id 1179775788; Tue, 28 Apr 2020 20:03:09 -0800
Received: from MTKMBS01N2.mediatek.inc (172.21.101.79) by
 MTKMBS62N1.mediatek.inc (172.29.193.41) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Tue, 28 Apr 2020 20:53:04 -0700
Received: from mtkcas08.mediatek.inc (172.21.101.126) by
 mtkmbs01n2.mediatek.inc (172.21.101.79) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Wed, 29 Apr 2020 11:53:03 +0800
Received: from [172.21.77.33] (172.21.77.33) by mtkcas08.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Wed, 29 Apr 2020 11:53:02 +0800
Message-ID: <1588132383.16498.2.camel@mtkswgap22>
Subject: Re: [PATCH v3 1/2] dt-bindings: dmaengine: Add MediaTek
 Command-Queue DMA controller bindings
From: EastL <EastL.Lee@mediatek.com>
To: Rob Herring <robh@kernel.org>
Date: Wed, 29 Apr 2020 11:53:03 +0800
In-Reply-To: <1588125274311004.11906.seg@mailgw02.mediatek.com>
References: <1587955977-17207-1-git-send-email-EastL.Lee@mediatek.com>
 <1587955977-17207-2-git-send-email-EastL.Lee@mediatek.com>
 <1588125274311004.11906.seg@mailgw02.mediatek.com>
X-Mailer: Evolution 3.2.3-0ubuntu6 
MIME-Version: 1.0
X-TM-SNTS-SMTP: EA5880C4AA2B61D894C249225ED43DB19CC852CE1078F1987B00AF67E97FC2DB2000:8
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200428_210313_215592_1E3A59F3 
X-CRM114-Status: GOOD (  10.92  )
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
Cc: mark.rutland@arm.com, devicetree@vger.kernel.org, wsd_upstream@mediatek.com,
 Sean Wang <sean.wang@mediatek.com>, linux-kernel@vger.kernel.org,
 dmaengine@vger.kernel.org, vkoul@kernel.org, robh+dt@kernel.org,
 linux-mediatek@lists.infradead.org, matthias.bgg@gmail.com,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Mon, 2020-04-27 at 16:32 -0500, Rob Herring wrote:
> On Mon, 27 Apr 2020 10:52:56 +0800, EastL wrote:
> > Document the devicetree bindings for MediaTek Command-Queue DMA controller
> > which could be found on MT6779 SoC or other similar Mediatek SoCs.
> > 
> > Signed-off-by: EastL <EastL.Lee@mediatek.com>
> > ---
> >  .../devicetree/bindings/dma/mtk-cqdma.yaml         | 98 ++++++++++++++++++++++
> >  1 file changed, 98 insertions(+)
> >  create mode 100644 Documentation/devicetree/bindings/dma/mtk-cqdma.yaml
> > 
> 
> My bot found errors running 'make dt_binding_check' on your patch:
> 
> /builds/robherring/linux-dt-review/Documentation/devicetree/bindings/dma/mtk-cqdma.example.dt.yaml: dma-controller@10212000: interrupts: [[0, 139, 8], [0, 140, 8], [0, 141, 8]] is too short
> /builds/robherring/linux-dt-review/Documentation/devicetree/bindings/dma/mtk-cqdma.example.dt.yaml: dma-controller@10212000: reg: [[0, 270606336, 0, 128], [0, 270606464, 0, 128], [0, 270606592, 0, 128]] is too short
> 
> See https://patchwork.ozlabs.org/patch/1277292
> 
> If you already ran 'make dt_binding_check' and didn't see the above
> error(s), then make sure dt-schema is up to date:
> 
> pip3 install git+https://github.com/devicetree-org/dt-schema.git@master --upgrade
> 
> Please check and re-submit.

OK, I'll fix it in next version.

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
