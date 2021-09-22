Return-Path: <SRS0=6VVk=OM=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,USER_AGENT_SANE_2
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D7BD6C433F5
	for <linux-mediatek@archiver.kernel.org>; Wed, 22 Sep 2021 06:12:33 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8AAAF60F48
	for <linux-mediatek@archiver.kernel.org>; Wed, 22 Sep 2021 06:12:33 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 8AAAF60F48
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:CC:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=9O7H72ZlFt3Vk2he+YRo4egKi7495o2K1VCXxqLeXDE=; b=QDYjYjVc/k+OHZ
	pqyZDnYO+qHnXEyoqpwSTC13alya5DLo00DcVqSSu/HYaqVcAm8repjOu2nZSL0Kf6FcZ2IGtBMvL
	+jNXDoVRT0yJ0QT0EF+LEJTKUX/vI2ApsXLZZigzJm/L1kTx93Kn7QNEeSVTN1j4FZuX5ku4Xv/3r
	tMPrWdV5cJMzEX0QgHarWNs67r/DDLuaTGcjY8Fq9i33yXbUVm4DTItojJ9si4CoV53fxAkZKyQbe
	h8zJdzE4Hjte2cXkVblZN0NlCMStes/TlWnaISesOwOJ4R3ys0Xlyr6EGxgEurR/GktCvr0Mva3LF
	I2d5qmKVibjSC+7EaUiA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mSvUR-0070Xe-NA; Wed, 22 Sep 2021 06:12:19 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mSvUE-0070WV-Am; Wed, 22 Sep 2021 06:12:09 +0000
X-UUID: 9828273cdddd481e955bb94f7ea6c322-20210921
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID;
 bh=b7TgjdaX90/kAMrw3hlB4boxdIs0VONZSRH+hU5Jk6c=; 
 b=l1j2ZcdGx/96BEIjtoj5Fw62k9jzPBlK2XC0CmoeLaYoAXEE2yyDH0NPJP1An7F6jMZlfODanh/077ULVt1UB++cryvTph7jfuM/sKng7tEUAhYVlkBrBk9P0qEoyATbyLguIWzSjXprs849OcaQtmAWtE0W8bTF08iTuDsdVAg=;
X-UUID: 9828273cdddd481e955bb94f7ea6c322-20210921
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw01.mediatek.com
 (envelope-from <jianjun.wang@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1496785153; Tue, 21 Sep 2021 23:12:00 -0700
Received: from mtkmbs10n1.mediatek.inc (172.21.101.34) by
 MTKMBS62N2.mediatek.inc (172.29.193.42) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Tue, 21 Sep 2021 23:02:55 -0700
Received: from MTKCAS06.mediatek.inc (172.21.101.30) by
 mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.2.792.15; Wed, 22 Sep 2021 14:02:54 +0800
Received: from mhfsdcap04 (10.17.3.154) by MTKCAS06.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Wed, 22 Sep 2021 14:02:53 +0800
Message-ID: <1942744399e4817f778f43528b22b82b1d422b4a.camel@mediatek.com>
Subject: Re: [PATCH] PCI: mediatek-gen3: Disable DVFSRC voltage request
From: Jianjun Wang <jianjun.wang@mediatek.com>
To: Bjorn Helgaas <bhelgaas@google.com>, Lorenzo Pieralisi
 <lorenzo.pieralisi@arm.com>, Rob Herring <robh+dt@kernel.org>, "Krzysztof
 Wilczyski" <kw@linux.com>, Tzung-Bi Shih <tzungbi@google.com>
CC: Ryder Lee <ryder.lee@mediatek.com>, Matthias Brugger
 <matthias.bgg@gmail.com>, <linux-pci@vger.kernel.org>,
 <linux-mediatek@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
 <linux-arm-kernel@lists.infradead.org>, <qizhong.cheng@mediatek.com>,
 <Ryan-JH.Yu@mediatek.com>
Date: Wed, 22 Sep 2021 14:02:55 +0800
In-Reply-To: <53b79201135690800f3c97d861af9567b6f2a40d.camel@mediatek.com>
References: <20210819125939.21253-1-jianjun.wang@mediatek.com>
 <YR8go1l0Xnvvqn5E@google.com>
 <53b79201135690800f3c97d861af9567b6f2a40d.camel@mediatek.com>
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.2 
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210921_231207_819244_FF245C15 
X-CRM114-Status: GOOD (  12.86  )
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

Hi Bjorn, Lorenzo,

Just gentle ping for this patch, please kindly let me know your
comments about this patch.

Thanks.

On Thu, 2021-09-02 at 10:27 +0800, Jianjun Wang wrote:
> Hi Maintainers,
> 
> Just gentle ping for this patch, if there is anything I need to
> modify,
> please kindly let me know.
> 
> Thanks.
> 
> On Fri, 2021-08-20 at 11:25 +0800, Tzung-Bi Shih wrote:
> > On Thu, Aug 19, 2021 at 08:59:39PM +0800, Jianjun Wang wrote:
> > > Signed-off-by: Jianjun Wang <jianjun.wang@mediatek.com>
> > 
> > Reviewed-by: Tzung-Bi Shih <tzungbi@google.com>
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
