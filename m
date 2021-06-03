Return-Path: <SRS0=bWHh=K5=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BBB01C47082
	for <linux-mediatek@archiver.kernel.org>; Thu,  3 Jun 2021 16:53:31 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8EFC6613F1
	for <linux-mediatek@archiver.kernel.org>; Thu,  3 Jun 2021 16:53:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 8EFC6613F1
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=arm.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=fJcd7hzclk2KnYjKDXBHEvGzvo47uzayoq2FQ8jgbUc=; b=ugkIuDOgOxFgiW
	ivGw4Nx/5c1Qm6goSmuWXI5NjwT6BQavWAQlz4OYqvFFpST7ElG0Hcq0PoYTJCV3nhaQgrcNJJrsz
	kqXGYsqhyIpQVhIG8rbicq/DGfqGKZPbJQ++Pqst27p5xU3/iqoRdHw9kh8NniG2r+S8hPvnTzud/
	tPYq5Ej1KY8TY/ykCjIS91+cCuSfjnWdIX7d23ewdUn0BikUdZB/0FgMgXKxo4z3IbHdM6FyfIlB0
	Xvmnysjj+PKopc051uW8MGQmK2mWgBbZyF+dOtAj1ZsNBPTRFbyjsmb+Tv7nYw8EmDwX55V1qGcTn
	PeELnJJP1mvBeOBc93Tw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1loqal-009eAx-06; Thu, 03 Jun 2021 16:53:11 +0000
Received: from foss.arm.com ([217.140.110.172])
 by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
 id 1loqUf-009bbI-1x; Thu, 03 Jun 2021 16:46:54 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id E004F11B3;
 Thu,  3 Jun 2021 09:46:51 -0700 (PDT)
Received: from e123427-lin.arm.com (unknown [10.57.39.253])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 60D3E3F73D;
 Thu,  3 Jun 2021 09:46:50 -0700 (PDT)
From: Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>
To: linux-mediatek <linux-mediatek@lists.infradead.org>,
 Bjorn Helgaas <bhelgaas@google.com>,
 linux-arm-kernel <linux-arm-kernel@lists.infradead.org>,
 Zhen Lei <thunder.leizhen@huawei.com>, Ryder Lee <ryder.lee@mediatek.com>,
 Rob Herring <robh@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>,
 linux-pci <linux-pci@vger.kernel.org>,
 Jianjun Wang <jianjun.wang@mediatek.com>
Cc: Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>
Subject: Re: [PATCH 1/1] PCI: mediatek: Remove redundant error printing in
 mtk_pcie_subsys_powerup()
Date: Thu,  3 Jun 2021 17:46:45 +0100
Message-Id: <162273879476.3130.11393537705815421285.b4-ty@arm.com>
X-Mailer: git-send-email 2.26.1
In-Reply-To: <20210511122453.6052-1-thunder.leizhen@huawei.com>
References: <20210511122453.6052-1-thunder.leizhen@huawei.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210603_094653_184184_703A9A4B 
X-CRM114-Status: UNSURE (   7.93  )
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

On Tue, 11 May 2021 20:24:53 +0800, Zhen Lei wrote:
> When devm_ioremap_resource() fails, a clear enough error message will be
> printed by its subfunction __devm_ioremap_resource(). The error
> information contains the device name, failure cause, and possibly resource
> information.
> 
> Therefore, remove the error printing here to simplify code and reduce the
> binary size.

Applied to pci/mediatek, thanks!

[1/1] PCI: mediatek: Remove redundant error printing in mtk_pcie_subsys_powerup()
      https://git.kernel.org/lpieralisi/pci/c/28bba1e220

Thanks,
Lorenzo

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
