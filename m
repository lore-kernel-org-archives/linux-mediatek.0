Return-Path: <SRS0=xI6Y=LQ=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 90A64C2B9F4
	for <linux-mediatek@archiver.kernel.org>; Tue, 22 Jun 2021 10:19:17 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5A61B613B4
	for <linux-mediatek@archiver.kernel.org>; Tue, 22 Jun 2021 10:19:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 5A61B613B4
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=arm.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=HBnJjj+cEie8wv0WWP0ulKWTRc+3OlSTUvkXkOGkZrQ=; b=cCEyF58J/mfrv5
	Zdd+E7ee0jmK33YS3rNTkvHCQhgJbAjoDWHcS4akLxhOZVBFD21TqlTJWUfbvKnXMwM1p6to/uyQk
	wbiK/JZnuTOLMmtBe8jIQvTsuXgn63f3guBWD04ObknUOoaBsbU40I6Mdl6+w3mDeX8n57Y68mjuZ
	RHUE7J8HWVEbhebYyR+FOHsgyfSAP1blvR22rCdPW8km7mGeDk8J8we0tyeCb8czfoQZMen8lb8L5
	VSfv0L7NM6YLiE2L0SbVruC2AykWk7QExI3bKTPV+9qZi+qZDqRxSazlLIq1yVlii7m5bHko/xTG2
	QwUUj9LJH0v4vfx804Rw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1lvdUn-006bX3-4n; Tue, 22 Jun 2021 10:19:05 +0000
Received: from foss.arm.com ([217.140.110.172])
 by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
 id 1lvdUQ-006bNJ-SU; Tue, 22 Jun 2021 10:18:44 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id D343411D4;
 Tue, 22 Jun 2021 03:18:40 -0700 (PDT)
Received: from e123427-lin.arm.com (unknown [10.57.45.237])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 805353F694;
 Tue, 22 Jun 2021 03:18:38 -0700 (PDT)
From: Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>
To: bhelgaas@google.com, matthias.bgg@gmail.com, robh@kernel.org,
 ryder.lee@mediatek.com, Zou Wei <zou_wei@huawei.com>,
 jianjun.wang@mediatek.com
Cc: Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>,
 linux-kernel@vger.kernel.org, linux-pci@vger.kernel.org,
 linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH -next] PCI: mediatek-gen3: Add missing MODULE_DEVICE_TABLE
Date: Tue, 22 Jun 2021 11:18:32 +0100
Message-Id: <162435709386.20190.12221073740280351625.b4-ty@arm.com>
X-Mailer: git-send-email 2.26.1
In-Reply-To: <1620717091-108691-1-git-send-email-zou_wei@huawei.com>
References: <1620717091-108691-1-git-send-email-zou_wei@huawei.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210622_031843_044689_E937989B 
X-CRM114-Status: UNSURE (   6.70  )
X-CRM114-Notice: Please train this message.
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

On Tue, 11 May 2021 15:11:31 +0800, Zou Wei wrote:
> This patch adds missing MODULE_DEVICE_TABLE definition which generates
> correct modalias for automatic loading of this driver when it is built
> as an external module.

Applied to pci/mediatek-gen3, thanks!

[1/1] PCI: mediatek-gen3: Add missing MODULE_DEVICE_TABLE
      https://git.kernel.org/lpieralisi/pci/c/3a2e476dc5

Thanks,
Lorenzo

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
