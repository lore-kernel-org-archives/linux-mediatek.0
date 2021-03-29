Return-Path: <SRS0=9jr7=I3=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 16A4DC433E0
	for <linux-mediatek@archiver.kernel.org>; Mon, 29 Mar 2021 23:00:12 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A916161987
	for <linux-mediatek@archiver.kernel.org>; Mon, 29 Mar 2021 23:00:11 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org A916161987
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=arm.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=JiqGUXXgS/YvrytEOSJe44Fnn62u+11B/iH3sJtFWkA=; b=qnRbdPApVpxHnzeTXfPfrbQB7
	VKO66YK8FYrZs7+4MGPdcKy2HXjRfUNyvRrGlaKleCjTYUvwHD6F58nUg08syWtPXMcP1TkDNCPKS
	nZwXPp9CUV8PmjN0h7teeTxIDqS3UYg6ka4hO/FSoXeEzVP5lKsjxFoW4Y4nEMEc2AtdOnpEvP37S
	wXsixP9f1eOtrZVduLymZpc1Iw1BfhIdxkyV0HELysBsg7OrsfwGqM4Q8307HLMyxJfUf3zA+r3Bn
	0L3WULQId7qBsguvP2lW16Az9+I42gYCihIXKEp6rdnBUiKi7jEaO6hpriGTjmuJOyLmJC9DOu006
	okVTvlB+A==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lR0rQ-001o05-7F; Mon, 29 Mar 2021 22:59:52 +0000
Received: from foss.arm.com ([217.140.110.172])
 by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
 id 1lQtQH-000j0I-JR
 for linux-mediatek@lists.infradead.org; Mon, 29 Mar 2021 15:03:25 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 07590142F;
 Mon, 29 Mar 2021 08:03:13 -0700 (PDT)
Received: from e123427-lin.arm.com (unknown [10.57.51.224])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 22AF73F694;
 Mon, 29 Mar 2021 08:03:12 -0700 (PDT)
From: Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>
To: Bjorn Helgaas <bhelgaas@google.com>,
	Ryder Lee <ryder.lee@mediatek.com>
Cc: Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>, linux-pci@vger.kernel.org,
 linux-mediatek@lists.infradead.org
Subject: Re: [PATCH v3] PCI: mediatek: Configure FC and FTS for functions
 other than 0
Date: Mon, 29 Mar 2021 16:03:04 +0100
Message-Id: <161703017046.25709.10524533647443450444.b4-ty@arm.com>
X-Mailer: git-send-email 2.26.1
In-Reply-To: <c529dbfc066f4bda9b87edbdbf771f207e69b84e.1604510053.git.ryder.lee@mediatek.com>
References: <c529dbfc066f4bda9b87edbdbf771f207e69b84e.1604510053.git.ryder.lee@mediatek.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210329_160323_883906_50BB8833 
X-CRM114-Status: UNSURE (   5.22  )
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

On Thu, 5 Nov 2020 04:58:33 +0800, Ryder Lee wrote:
> PCI_FUNC(port->slot << 3)" is always 0, so previously
> mtk_pcie_startup_port() only configured FC credits and FTs for
> function 0.
> 
> Compute "func" correctly so we also configure functions other than
> 0. This affects MT2701 and MT7623.

Applied to pci/mediatek, thanks!

[1/1] PCI: mediatek: Configure FC and FTS for functions other than 0
      https://git.kernel.org/lpieralisi/pci/c/31ec9c2746

Thanks,
Lorenzo

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
