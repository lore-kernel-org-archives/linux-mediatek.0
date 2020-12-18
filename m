Return-Path: <SRS0=+cmX=FW=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,URIBL_BLOCKED,
	USER_AGENT_SANE_2 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8B2E3C4361B
	for <linux-mediatek@archiver.kernel.org>; Fri, 18 Dec 2020 06:25:01 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3337F22228
	for <linux-mediatek@archiver.kernel.org>; Fri, 18 Dec 2020 06:25:01 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 3337F22228
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Date:To:From:
	Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=B9zwEy93QBx8X1KRXIU2/p3S3swpDQlLWMzozGFokLY=; b=pIZKINnkgd5SQBycyikzoYInl
	kkEc+/uLY7sUTsij7Gv9D2z911g19j9j/dbqHY6IIRAcNdpsEJyrJDkbtR//5STOOKoNXouNmtL1S
	1LFP6V08YBi/HerLw1CoorFLBf0MvBSYvYAJb2+AvXccratcZQMMD5IFoG9C8YQ+nLX6QVLXmcUvF
	QxmtsDQUnfGD5NEFY66laZIq5Sl+6Kyg7Nt/IoXkQnIDWyOkbFH+Kp8457dehSLq2TzN6uzt47hBE
	qYCNivUh8LyN5Affnp5Zv0No6uneUyaVgdaUtS5zK6UfJRd+oxKbT7thBilpci8HJf2R5KzWDXoTP
	vIXEbV8Lw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kq9C8-00079d-Mr; Fri, 18 Dec 2020 06:24:52 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kq9C4-00078p-85; Fri, 18 Dec 2020 06:24:50 +0000
X-UUID: 443d06a0635147c7b56c1a54ac2e5ca8-20201217
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID;
 bh=p5Pd9MyWjtaI8OlZ0GtWLZdI6yWJxnKdwN03SSWjjoU=; 
 b=FGmVqk5sFX9LbtvduCYTP5qrv28vEi+gNb7aZreyJimC8FBi8myU8SgVLeZaFkHHoJ4/TJRa1bTzHR0RUZcS+/lOBRkjdmw+v0vsL3r3+mtfS+Eko3cQNbuTLrjkqJdhmE+QRL+ONUSohhUAG97xIi5LLVxoWGgkZ7lqqtmejPo=;
X-UUID: 443d06a0635147c7b56c1a54ac2e5ca8-20201217
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw01.mediatek.com
 (envelope-from <stanley.chu@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 45310073; Thu, 17 Dec 2020 22:24:41 -0800
Received: from mtkmbs08n1.mediatek.inc (172.21.101.55) by
 MTKMBS62DR.mediatek.inc (172.29.94.18) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Thu, 17 Dec 2020 22:24:39 -0800
Received: from MTKCAS06.mediatek.inc (172.21.101.30) by
 mtkmbs08n1.mediatek.inc (172.21.101.55) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Fri, 18 Dec 2020 14:24:38 +0800
Received: from [172.21.77.33] (172.21.77.33) by MTKCAS06.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Fri, 18 Dec 2020 14:24:37 +0800
Message-ID: <1608272678.10163.40.camel@mtkswgap22>
Subject: Re: [PATCH v2 0/4] scsi: ufs: Cleanup and refactor clock scaling
From: Stanley Chu <stanley.chu@mediatek.com>
To: Can Guo <cang@codeaurora.org>
Date: Fri, 18 Dec 2020 14:24:38 +0800
In-Reply-To: <e939a0fd4afd1691f3e1a8182515ca64@codeaurora.org>
References: <20201216131639.4128-1-stanley.chu@mediatek.com>
 <e939a0fd4afd1691f3e1a8182515ca64@codeaurora.org>
X-Mailer: Evolution 3.2.3-0ubuntu6 
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201218_012449_088111_70E0AAA5 
X-CRM114-Status: GOOD (  19.87  )
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
Cc: jiajie.hao@mediatek.com, linux-scsi@vger.kernel.org,
 martin.petersen@oracle.com, andy.teng@mediatek.com, jejb@linux.ibm.com,
 chun-hung.wu@mediatek.com, kuohong.wang@mediatek.com,
 linux-kernel@vger.kernel.org, cc.chou@mediatek.com, avri.altman@wdc.com,
 alice.chao@mediatek.com, linux-mediatek@lists.infradead.org,
 peter.wang@mediatek.com, alim.akhtar@samsung.com, matthias.bgg@gmail.com,
 asutoshd@codeaurora.org, chaotian.jing@mediatek.com, bvanassche@acm.org,
 linux-arm-kernel@lists.infradead.org, beanhuo@micron.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Hi Can,

On Fri, 2020-12-18 at 14:20 +0800, Can Guo wrote:
> On 2020-12-16 21:16, Stanley Chu wrote:
> > Hi,
> > This series cleans up and refactors clk-scaling feature, and shall not
> > change any functionality.
> > 
> > This series is based on Can's series "Three changes related with UFS
> > clock scaling" in 5.10/scsi-fixes branch in Martin's tree.
> > 
> 
> Hi Stanley,
> 
> Thanks for noticing my changes, will you review them?
> I see customers manipulte UFS scaling related sysfs
> nodes more often than before, so we may want to fix it asap.

I have gave my review tag in all patches in this series : )

Thanks,
Stanley Chu

> 
> Regards,
> 
> Can Guo.
> 
> > However this series may not be required to be merged to 5.10. The
> > choice of base branch is simply making these patches easy to be
> > reviewed because this series is based on clk-scaling fixes by Can. If
> > this series is decided not being merged to 5.10, then I would rebase
> > it to 5.11/scsi-queue.
> > 
> > Changes since v1:
> >   - Refactor ufshcd_clk_scaling_suspend() in patch [3/4]
> >   - Change function name from ufshcd_clk_scaling_pm() to
> > ufshcd_clk_scaling_suspend() in patch [3/4]
> >   - Refine patch titles
> > 
> > Stanley Chu (4):
> >   scsi: ufs: Refactor cancelling clkscaling works
> >   scsi: ufs: Remove redundant null checking of devfreq instance
> >   scsi: ufs: Cleanup and refactor clk-scaling feature
> >   scsi: ufs: Fix build warning by incorrect function description
> > 
> >  drivers/scsi/ufs/ufshcd.c | 90 +++++++++++++++++++--------------------
> >  1 file changed, 43 insertions(+), 47 deletions(-)

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
