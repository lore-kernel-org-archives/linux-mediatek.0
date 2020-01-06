Return-Path: <SRS0=+t0h=23=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,USER_AGENT_SANE_2 autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9F9F2C00523
	for <linux-mediatek@archiver.kernel.org>; Mon,  6 Jan 2020 02:26:14 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 6F9A7206E6
	for <linux-mediatek@archiver.kernel.org>; Mon,  6 Jan 2020 02:26:14 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="lGuZMd4H";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="oMePjRk6"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 6F9A7206E6
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ClqDOJElZxdkCN+zFgwq9a9cL3WDZdJ6rd15WK2iptM=; b=lGuZMd4HzCCm4n
	04ArszwyooRzbQxEPoAQIPlgzPsjeEjOqUEzRBjaCyNb3P2enO4kxKrdbbQaLVHTg2RUstyoJvNeW
	DLGZx5T2oIg9b9FIrjy3nZrbcOf/dY2W65RmtuGS/KKZadoPESAj3sXIwCakKToUqIivNeBXjIAWj
	CP4ggRnI/ZysfgFbo/wPlZqBai7I5Q4Ny/hOfhRwjPuRRs9cUlktsgXWlASyCFdYcquZjU5qFldSw
	fSsInozZc3a3RCdZkaFNOdGGpUvqwa2q38wt0hpGKDbuhW/G3JJXw9r8hqKMkmRgXzDbKKwEQj5UP
	NLp853kusB7nHjpCz7Iw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1ioI5l-0007aq-9r; Mon, 06 Jan 2020 02:26:05 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1ioI5Z-0007RG-BQ; Mon, 06 Jan 2020 02:25:54 +0000
X-UUID: e72dd8d4ce6d403a932a538e7bd89b52-20200105
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID;
 bh=90we2HNJ1wSvFgeVfDv+pQLV73/5FIpxbNt+xxqxkIg=; 
 b=oMePjRk6ZHKZP/k5PhqascXLGAnBk8Mx1nsIYFdo30HT/gcHI1XAGXBE+g/YF+A64qn359k5ORjHsKl+FKoCFTCECwmkd+qTC5pKekcOd7QNVTECeoIIBfQR91wzR5MkS1CJg1TehaESXeB1gAwZ8pMd19O/uO7dvPS45cUpF/k=;
X-UUID: e72dd8d4ce6d403a932a538e7bd89b52-20200105
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw02.mediatek.com
 (envelope-from <stanley.chu@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLS)
 with ESMTP id 1990732423; Sun, 05 Jan 2020 18:25:50 -0800
Received: from MTKMBS31N1.mediatek.inc (172.27.4.69) by
 MTKMBS62N1.mediatek.inc (172.29.193.41) with Microsoft SMTP Server (TLS) id
 15.0.1395.4; Sun, 5 Jan 2020 18:26:19 -0800
Received: from mtkcas09.mediatek.inc (172.21.101.178) by
 MTKMBS31N1.mediatek.inc (172.27.4.69) with Microsoft SMTP Server (TLS) id
 15.0.1395.4; Mon, 6 Jan 2020 10:25:12 +0800
Received: from [172.21.77.33] (172.21.77.33) by mtkcas09.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1395.4 via Frontend
 Transport; Mon, 6 Jan 2020 10:26:12 +0800
Message-ID: <1578277539.17435.5.camel@mtkswgap22>
Subject: Re: [PATCH v2 1/2] phy: mediatek: Fix Kconfig indentation
From: Stanley Chu <stanley.chu@mediatek.com>
To: Chunfeng Yun <chunfeng.yun@mediatek.com>
Date: Mon, 6 Jan 2020 10:25:39 +0800
In-Reply-To: <1578276653.21256.12.camel@mhfsdcap03>
References: <20200103164710.4829-1-krzk@kernel.org>
 <1578276653.21256.12.camel@mhfsdcap03>
X-Mailer: Evolution 3.2.3-0ubuntu6 
MIME-Version: 1.0
X-TM-SNTS-SMTP: 366D91C7E258C65393D58DF059721550643DFB395D1DB2ED4FF626D1C1DF7C892000:8
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200105_182553_400504_E0B1D544 
X-CRM114-Status: UNSURE (   7.65  )
X-CRM114-Notice: Please train this message.
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
Cc: Florian Fainelli <f.fainelli@gmail.com>, linux-kernel@vger.kernel.org,
 Maxime Ripard <mripard@kernel.org>, Kishon Vijay Abraham I <kishon@ti.com>,
 linux-mediatek@lists.infradead.org, Krzysztof Kozlowski <krzk@kernel.org>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Mon, 2020-01-06 at 10:10 +0800, Chunfeng Yun wrote:
> On Fri, 2020-01-03 at 17:47 +0100, Krzysztof Kozlowski wrote:
> > Adjust indentation from spaces to tab (+optional two spaces) as in
> > coding style.
> > 
> > Signed-off-by: Krzysztof Kozlowski <krzk@kernel.org>
> > 
> > ---
> > 

Reviewed-by: Stanley Chu <stanley.chu@mediatek.com>

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
