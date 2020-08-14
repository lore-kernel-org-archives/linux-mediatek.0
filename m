Return-Path: <SRS0=jsh4=BY=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,URIBL_BLOCKED,USER_AGENT_SANE_2
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6A158C433DF
	for <linux-mediatek@archiver.kernel.org>; Fri, 14 Aug 2020 01:07:38 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3516F20838
	for <linux-mediatek@archiver.kernel.org>; Fri, 14 Aug 2020 01:07:38 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="JhfwlZDI";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="m22omvMN"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 3516F20838
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Date:To:From:
	Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=/C1JztJOjTLo6r6EkkpCoNlXLbYMGkv60d3up6L553Q=; b=JhfwlZDIbzrU8LCGsUes5ecrw
	sN/OR/jpyMVTQGNJMq2NHlJcCijCVHhdfONhQG39Nj92wEwKiBffT+KdnWrulNSyqL4jG8+ialThB
	ud2I1rLytUGBxtvX68kPvBgXLSQDWqnB1buGZXjJ3fclfybblLTkF1nzeOODS4gfqjSMJpYcINb6v
	0Yl9eEiz7HEkD79MErqtmTHwJiHhetKH8JksRj7b97bUKwQA9XTij4xp/U4Re4oBnSvC+Cb/RsCd9
	A7g5QsWY8QB0U1XWjm+bOuFp+QSd09S/uDrXOtBqkuxqV1PZ5HCoPJ28QaZ+jWQtaoCCq5zCO4Bj2
	tGDDr7Jng==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1k6OBj-0002Uu-8C; Fri, 14 Aug 2020 01:07:19 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1k6OBf-0002To-Gp; Fri, 14 Aug 2020 01:07:16 +0000
X-UUID: 09fd4f86cb034988802f803c2eaa609a-20200813
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID;
 bh=Qe393WeyTwpJe6c+m7yD4MABNjEKDyOFUs589c8xpVc=; 
 b=m22omvMNlQcaTfLekQRUp2pDHJiZJKV990PLTFjzvq7GJFMhoiMxS3Df6L3t+lq1cS8+6kABz7Gb4C7alcQrKiuLXfkZ7XAiy7NI7ZcaLugjArqhbh5UyRAmkzEik7SJlkGRUU0+SqgJBRBx+kKYiDNdE+K0BIdCQcV+kiXkBlw=;
X-UUID: 09fd4f86cb034988802f803c2eaa609a-20200813
Received: from mtkcas67.mediatek.inc [(172.29.193.45)] by mailgw01.mediatek.com
 (envelope-from <wenbin.mei@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLS)
 with ESMTP id 256186170; Thu, 13 Aug 2020 17:07:07 -0800
Received: from MTKMBS31N1.mediatek.inc (172.27.4.69) by
 MTKMBS62N1.mediatek.inc (172.29.193.41) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Thu, 13 Aug 2020 18:07:03 -0700
Received: from MTKCAS32.mediatek.inc (172.27.4.184) by MTKMBS31N1.mediatek.inc
 (172.27.4.69) with Microsoft SMTP Server (TLS) id 15.0.1497.2;
 Fri, 14 Aug 2020 09:06:59 +0800
Received: from [10.17.3.153] (10.17.3.153) by MTKCAS32.mediatek.inc
 (172.27.4.170) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Fri, 14 Aug 2020 09:07:01 +0800
Message-ID: <1597367164.5891.6.camel@mhfsdcap03>
Subject: Re: [v4,0/3] mmc: mediatek: add optional reset property mmc:
 mediatek: add optional module reset property arm64: dts: mt7622: add reset
 node for mmc device Documentation/devicetree/bindings/mmc/mtk-sd.txt | 2 ++
 arch/arm64/boot/dts/mediatek/mt7622.dtsi | 2 ++ drivers/mmc/host/mtk-sd.c |
 13 +++++++++++++ 3 files changed, 17 insertions(+)
From: Wenbin Mei <wenbin.mei@mediatek.com>
To: Matthias Brugger <matthias.bgg@gmail.com>
Date: Fri, 14 Aug 2020 09:06:04 +0800
In-Reply-To: <195c7bfc-38e4-8d5e-af79-cc3f00b552a4@gmail.com>
References: <20200813090618.28009-1-wenbin.mei@mediatek.com>
 <195c7bfc-38e4-8d5e-af79-cc3f00b552a4@gmail.com>
X-Mailer: Evolution 3.10.4-0ubuntu2 
MIME-Version: 1.0
X-TM-SNTS-SMTP: 34F81C7A311781AC5641DD657E0C145749994F76CA7B06A56DF2404E414FD9C52000:8
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200813_210715_696909_F2316B1B 
X-CRM114-Status: GOOD (  14.63  )
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
Cc: devicetree@vger.kernel.org, Ulf Hansson <ulf.hansson@linaro.org>,
 srv_heupstream@mediatek.com, linux-mmc@vger.kernel.org,
 linux-kernel@vger.kernel.org, Rob Herring <robh+dt@kernel.org>,
 linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 Philipp Zabel <p.zabel@pengutronix.de>,
 Chaotian Jing <chaotian.jing@mediatek.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Sorry for the inconvenience, there is no changes between V3 and V4, V3
is wrong with my subject line, and V4 fix it.
On Thu, 2020-08-13 at 15:54 +0200, Matthias Brugger wrote:
> It would be good to provide a list of the changes, so that one can easily 
> understand what's the difference between v3 and v4. On a quick glimpse I didn't 
> see any changes.
> 
> Regards,
> Matthias
> 
> On 13/08/2020 11:06, Wenbin Mei wrote:
> > --
> > 2.18.0
> > 

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
