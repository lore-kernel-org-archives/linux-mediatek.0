Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AFAB7C531D2
	for <linux-mediatek@archiver.kernel.org>; Thu, 23 Jul 2026 13:57:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=OsxGZV+ydZ8Mln3TnDoaV+aAQjZss0X2i95kSATV6n0=; b=JRGOYYrX1SArZItnsHTL8GEfIh
	OV/P9IaYj72EdsGctkxaK+DzQZLqkEcJJZed6dvvPKfiRCyRhnp5qYQqBT+ZOml0fnPWV3HOhqKFK
	5a9eknFyQCFL2o3Ym+XU+bO/RO3NtXUrYqpQxfpkTevNRjoWq7qm+QK3LNJzMKVBeMhSkggRyW/cm
	8ceQpjrTUSWJD+CiqkatNNkAdO+p2FtP6OAkrmepIFGgmf9kF1H0YOzKvP9cSE4/Rp75IKyAaTczL
	N9YqgZMaGLtyCQBSdCWx+p8goaag0oIhkMe40l6Ii4YUNvLKs1evu6b3lo2leSoi9F6wTf8O1FLfk
	DYKM5YyA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wmtvu-0000000ER0u-1KZ3;
	Thu, 23 Jul 2026 13:57:54 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wmtvs-0000000ER0f-49Pw
	for linux-mediatek@lists.infradead.org;
	Thu, 23 Jul 2026 13:57:53 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id BCCE643A86;
	Thu, 23 Jul 2026 13:57:52 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5C6521F000E9;
	Thu, 23 Jul 2026 13:57:47 +0000 (UTC)
Date: Thu, 23 Jul 2026 15:57:42 +0200
From: Manivannan Sadhasivam <mani@kernel.org>
To: Peter Wang =?utf-8?B?KOeOi+S/oeWPiyk=?= <peter.wang@mediatek.com>
Cc: "shengchao.guo@oss.qualcomm.com" <shengchao.guo@oss.qualcomm.com>, 
	CC Chou =?utf-8?B?KOWRqOW/l+adsCk=?= <cc.chou@mediatek.com>, "jejb@linux.ibm.com" <jejb@linux.ibm.com>, 
	"bvanassche@acm.org" <bvanassche@acm.org>, "linux-scsi@vger.kernel.org" <linux-scsi@vger.kernel.org>, 
	Eddie Huang =?utf-8?B?KOm7g+aZuuWCkSk=?= <eddie.huang@mediatek.com>, 
	"linux-mediatek@lists.infradead.org" <linux-mediatek@lists.infradead.org>, 
	Chaotian Jing =?utf-8?B?KOS6leacneWkqSk=?= <Chaotian.Jing@mediatek.com>, "alim.akhtar@samsung.com" <alim.akhtar@samsung.com>, 
	Naomi Chu =?utf-8?B?KOacseipoOeUsCk=?= <Naomi.Chu@mediatek.com>, 
	Alice Chao =?utf-8?B?KOi2meePruWdhyk=?= <Alice.Chao@mediatek.com>, Ed Tsai =?utf-8?B?KOiUoeWul+i7kik=?= <Ed.Tsai@mediatek.com>, 
	wsd_upstream <wsd_upstream@mediatek.com>, "avri.altman@wdc.com" <avri.altman@wdc.com>, 
	"martin.petersen@oracle.com" <martin.petersen@oracle.com>, 
	Chun-Hung Wu =?utf-8?B?KOW3q+mnv+Wujyk=?= <Chun-hung.Wu@mediatek.com>, Tun-yu Yu =?utf-8?B?KOa4uOaVpuiBvyk=?= <Tun-yu.Yu@mediatek.com>
Subject: Re: [PATCH v1] ufs: core: Remove unnecessary block I/O quiesce for
 clock scaling
Message-ID: <ddce244mxh7obbfh2td23ogm4rx36s2dr7jg7bc5pq5ae4373s@qgwr2f27dppn>
References: <20260604133503.2049288-1-peter.wang@mediatek.com>
 <al8YkXydXJQZrl_Y@QCOM-aGQu4IUr3Y>
 <29b5f4368a63847b84b87e36a1e358f5991b694c.camel@mediatek.com>
 <amAqHFOgPQQY-3rI@QCOM-aGQu4IUr3Y>
 <yyocxatyi7bitvehm2fgltxpayomt3d6r5zyr2ugbehkvsowcz@cg4if4zdqgbu>
 <7c55a405dcc3a0a80931263bf1807c815e78efea.camel@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <7c55a405dcc3a0a80931263bf1807c815e78efea.camel@mediatek.com>
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
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Thu, Jul 23, 2026 at 01:22:57PM +0000, Peter Wang (王信友) wrote:
> On Thu, 2026-07-23 at 14:39 +0200, Manivannan Sadhasivam wrote:
> > Qcom Host Controllers doesn't support scaling clocks when the traffic
> > is
> > ongoing. So this patch certainly cannot work on our platforms.
> > 
> > If you want to pursue, you should limit this change to MediaTek
> > platforms. But
> > nevertheless, this patch should be reverted as it breaks UFS on all
> > Qcom
> > platforms.
> > 
> > - Mani
> > 
> 
> Hi Mani,
> 
> This patch is based on the JEDEC specification. As all SoCs 
> should follow this spec, I have not applied it solely to 
> MediaTek's platform. However, I think reverting it is okay. 
> I will consider how to revise it later.
> 

What you quoted in the commit message is true for power mode change (gear, lane
etc...), but clock scaling involves scaling up/down the HCI clock inputs as
well, which is not covered by the JEDEC spec and is vendor specific. And this is
where the discrepancy lives.

Qcom UFS HCI also allows power mode change with in-flight traffic, but scaling
the clocks is not supported. I'm not sure about other vendors here.

- Mani

-- 
மணிவண்ணன் சதாசிவம்

