Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F0E47C433F5
	for <linux-mediatek@archiver.kernel.org>; Mon,  6 Dec 2021 11:36:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=FEh0ccbVJYIfA1L8J08G8UYv8EvStto3Y/XV2cKCxXU=; b=YjzbbntqhObd82
	IVvcoD2Ol3EarwPrIAixY5isesxPajj9KCmgnAkIAfHcYvSJa9N7gZKbw5ux5MIAxo2cq2OjKTBan
	Cm9PY5XGWU5QFaOPQS6YYYrDAymhy6mjXcgoAtwUpVSqaU4pBY3Fe3kcp1/SQZoEiYDTO25rzYoKS
	N+Awz3arZQAaejnC1iMJdOYJ0qxBMYDdheJpXvS7h0eBP/jmcgj2e4M3Ie2HNx7a+xqOD+hpTsrK4
	TIcyTJFHRoughSjAww1ciIYReDIKUlrOoaCDWAollhgjFdrqNKMBBXE5nFUPx/fVzQwhBtQFoEv+v
	aUjkeNtgHRRE3I2wfYiA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1muCHz-003alX-3j; Mon, 06 Dec 2021 11:36:11 +0000
Received: from foss.arm.com ([217.140.110.172])
 by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
 id 1muCHl-003aiX-So; Mon, 06 Dec 2021 11:35:59 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 89CE21042;
 Mon,  6 Dec 2021 03:35:51 -0800 (PST)
Received: from e123427-lin.arm.com (unknown [10.57.33.247])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id C4F2E3F73D;
 Mon,  6 Dec 2021 03:35:48 -0800 (PST)
From: Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>
To: =?UTF-8?q?Krzysztof=20Wilczyi=C5=84ski?= <kw@linux.com>,
 Bjorn Helgaas <bhelgaas@google.com>,
 Jianjun Wang <jianjun.wang@mediatek.com>,
 Ryder Lee <ryder.lee@mediatek.com>,
 qizhong cheng <qizhong.cheng@mediatek.com>
Cc: Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>,
 linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org,
 linux-pci@vger.kernel.org, Chuanjia Liu <chuanjia.liu@mediatek.com>,
 linux-arm-kernel@lists.infradead.org, Jiey Yang <ot_jiey.yang@mediatek.com>
Subject: Re: [PATCH] PCI: mediatek: Delay 100ms to wait power and clock to
 become stable
Date: Mon,  6 Dec 2021 11:35:42 +0000
Message-Id: <163879053288.15266.2451470623160398574.b4-ty@arm.com>
X-Mailer: git-send-email 2.31.0
In-Reply-To: <20211104062144.31453-1-qizhong.cheng@mediatek.com>
References: <20211104062144.31453-1-qizhong.cheng@mediatek.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211206_033558_017684_58F6099A 
X-CRM114-Status: UNSURE (   3.76  )
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

On Thu, 4 Nov 2021 14:21:44 +0800, qizhong cheng wrote:
> Described in PCIe CEM specification setctions 2.2 (PERST# Signal) and
> 2.2.1 (Initial Power-Up (G3 to S0)). The deassertion of PERST# should
> be delayed 100ms (TPVPERL) for the power and clock to become stable.
> 
> 

Applied to pci/mediatek, thanks!

[1/1] PCI: mediatek: Delay 100ms to wait power and clock to become stable
      https://git.kernel.org/lpieralisi/pci/c/1fa610f217

Thanks,
Lorenzo

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
