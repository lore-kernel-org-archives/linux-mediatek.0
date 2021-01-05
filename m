Return-Path: <SRS0=qO9d=GI=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,USER_AGENT_SANE_2
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8C350C433E0
	for <linux-mediatek@archiver.kernel.org>; Tue,  5 Jan 2021 07:35:27 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4E6E42065D
	for <linux-mediatek@archiver.kernel.org>; Tue,  5 Jan 2021 07:35:27 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 4E6E42065D
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Date:To:From:
	Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=ENQtT7aUK8+dIl6vPG3FJo3XPisKiH23KuTmg6VtP2g=; b=X671FaDmNC05/eD8XCXJ8AEbX
	S7zWjDCviOQKIsqlFsIV3HYLQt2SpSB2jEt5xBauCawKgTAmaVvPPz3UGGWGM3CwyLMNNCMG/pKxZ
	Ta6oObdhV2Yr1YF6hBMVhhwd27sYaZYhl29aYNVmGHaeoOwepomUvk9omH/D9sc+/SfsdwntwhAqK
	w7c0UklJQ5uwVBFTJCfEh3MviM/8AYwj+mRG20Qa8rNOi4lZXa5mgaJHYqIhrC72LQSwWr2gtKccW
	BJ30qE7pqhxKF/NYehxwG/OUzkrP0IlhJBOF/CC2qbyTXFCUEWI3fXfKx4FB47a3uvBr/uxzmr8io
	oFQ8x1hkg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kwgs5-0001gG-R1; Tue, 05 Jan 2021 07:35:13 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kwgs0-0001ez-Ml; Tue, 05 Jan 2021 07:35:10 +0000
X-UUID: 771cb64da95b422699df07208ff2abb1-20210104
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID;
 bh=iNJ8pMFepiraeDCLGRX8PhqklWQesO7XeNlg6qJmjj0=; 
 b=lH+5NPmAaoiplE2yO8HyiAHykaEhlZuVh9S7hkDfCq/Fduj4jBzKmaMy9qQB9IQCFiH0xj2BaR+HbpvY+l68jV/HWCWDrpjCDsV7e3UiFU0YVi0aBO5dxjvL2MuBf0NTPEnep5tWlzGNFZ9z2Ml30moMH0ZdQdwWhrrTTB7umTk=;
X-UUID: 771cb64da95b422699df07208ff2abb1-20210104
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw01.mediatek.com
 (envelope-from <qii.wang@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 453397153; Mon, 04 Jan 2021 23:35:03 -0800
Received: from MTKMBS31N1.mediatek.inc (172.27.4.69) by
 MTKMBS62N1.mediatek.inc (172.29.193.41) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Mon, 4 Jan 2021 23:25:01 -0800
Received: from MTKCAS36.mediatek.inc (172.27.4.186) by MTKMBS31N1.mediatek.inc
 (172.27.4.69) with Microsoft SMTP Server (TLS) id 15.0.1497.2;
 Tue, 5 Jan 2021 15:24:57 +0800
Received: from [10.17.3.153] (10.17.3.153) by MTKCAS36.mediatek.inc
 (172.27.4.170) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Tue, 5 Jan 2021 15:24:56 +0800
Message-ID: <1609831496.23685.7.camel@mhfsdcap03>
Subject: Re: i2c: mediatek: Fix apdma and i2c hand-shake timeout
From: Qii Wang <qii.wang@mediatek.com>
To: Wolfram Sang <wsa@the-dreams.de>
Date: Tue, 5 Jan 2021 15:24:56 +0800
In-Reply-To: <20210104183202.GD935@ninjato>
References: <1608812767-3254-1-git-send-email-qii.wang@mediatek.com>
 <20210104182959.GC935@ninjato> <20210104183202.GD935@ninjato>
X-Mailer: Evolution 3.10.4-0ubuntu2 
MIME-Version: 1.0
X-TM-SNTS-SMTP: 8622BB2201912994D94D12F5823443A0F8E2910C300CEAE4236ECE2AE31BE4892000:8
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210105_023508_942197_DCE68B11 
X-CRM114-Status: GOOD (  14.22  )
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
Cc: srv_heupstream@mediatek.com, leilk.liu@mediatek.com,
 linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org,
 linux-i2c@vger.kernel.org, matthias.bgg@gmail.com,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Mon, 2021-01-04 at 19:32 +0100, Wolfram Sang wrote:
> On Mon, Jan 04, 2021 at 07:29:59PM +0100, Wolfram Sang wrote:
> > On Thu, Dec 24, 2020 at 08:26:07PM +0800, qii.wang@mediatek.com wrote:
> > > From: Qii Wang <qii.wang@mediatek.com>
> > > 
> > > With the apdma remove hand-shake signal, it requirs special
> > > operation timing to reset i2c manually, otherwise the interrupt
> > > will not be triggered, i2c transmission will be timeout.
> > > 
> > > Signed-off-by: Qii Wang <qii.wang@mediatek.com>
> > 
> > Applied to for-current, thanks!
> 
> Any Fixes:-Tag we could add?
> 

Could you help me add:
	Fixes: 8426fe70cfa4("i2c: mediatek: Add apdma sync in i2c driver")
Thanks
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
