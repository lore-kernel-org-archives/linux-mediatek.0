Return-Path: <SRS0=qM2e=I6=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A573EC433ED
	for <linux-mediatek@archiver.kernel.org>; Thu,  1 Apr 2021 11:28:20 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4482E6108F
	for <linux-mediatek@archiver.kernel.org>; Thu,  1 Apr 2021 11:28:20 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 4482E6108F
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=arm.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=AOtxlpevJ6dqiMuxGr+5gBqWDBIwwlMfBl70gYSatmc=; b=pLnT/vwryEO49mpCRserFxbsW
	Qjc+tUOrOsfMTeYG5yszgVA68mBJdmR6V/qiEg7ivfsOFc/HwsJbd8E5zLoZEST1G8WcmZ22aV0Bv
	c7nM3VOa0pS7q66ld0pdsm01M7yDTC20oIm5bb/QZrUH4zz7yIVyVSk8HEqZFC4+U6VjkZLE4JTYO
	UapbFUvpgThMSdqu4eKmhqtl6MORN5LlUt2pJErWhjxoo+pJ3buIKWQBN442wP0uzSMmGwsNQF6Jb
	j6eRwzg2JRxQGxvy6mrmTUHXJVk+gFpaaBdCCRyL1hQBkB2RjEw306UggUXuyaCZ+Ugq1rmShNsZz
	BqDItvWGQ==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lRvUd-009R2x-3C; Thu, 01 Apr 2021 11:28:07 +0000
Received: from foss.arm.com ([217.140.110.172])
 by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
 id 1lRvUS-009R1y-Ii; Thu, 01 Apr 2021 11:27:58 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id C4AD3D6E;
 Thu,  1 Apr 2021 04:27:53 -0700 (PDT)
Received: from e123427-lin.arm.com (unknown [10.57.56.129])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 1D3193F694;
 Thu,  1 Apr 2021 04:27:49 -0700 (PDT)
From: Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>
To: Bjorn Helgaas <bhelgaas@google.com>,
	Marc Zyngier <maz@kernel.org>
Cc: Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>,
 Frank Wunderlich <frank-w@public-files.de>,
 Michal Simek <michal.simek@xilinx.com>,
 "K. Y. Srinivasan" <kys@microsoft.com>, linux-pci@vger.kernel.org,
 Thierry Reding <thierry.reding@gmail.com>, linux-tegra@vger.kernel.org,
 Rob Herring <robh@kernel.org>, Jonathan Hunter <jonathanh@nvidia.com>,
 Bharat Kumar Gogada <bharatku@xilinx.com>,
 Paul Walmsley <paul.walmsley@sifive.com>,
 Thierry Reding <treding@nvidia.com>,
 Marek Vasut <marek.vasut+renesas@gmail.com>, Wei Liu <wei.liu@kernel.org>,
 Stephen Hemminger <sthemmin@microsoft.com>,
 Ryder Lee <ryder.lee@mediatek.com>, linux-mediatek@lists.infradead.org,
 Haiyang Zhang <haiyangz@microsoft.com>, linux-hyperv@vger.kernel.org,
 Will Deacon <will@kernel.org>, kernel-team@android.com,
 Michael Kelley <mikelley@microsoft.com>, linux-kernel@vger.kernel.org,
 Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
 linux-renesas-soc@vger.kernel.org, Thomas Gleixner <tglx@linutronix.de>,
 linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v3 00/14] PCI/MSI: Getting rid of msi_controller,
 and other cleanups
Date: Thu,  1 Apr 2021 12:27:42 +0100
Message-Id: <161727636757.32506.11592578621890085687.b4-ty@arm.com>
X-Mailer: git-send-email 2.26.1
In-Reply-To: <20210330151145.997953-1-maz@kernel.org>
References: <20210330151145.997953-1-maz@kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210401_122756_967780_FCC5F754 
X-CRM114-Status: GOOD (  13.28  )
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

On Tue, 30 Mar 2021 16:11:31 +0100, Marc Zyngier wrote:
> This is a respin of the series described at [1].
> 
> * From v2 [2]:
>   - Fixed the Xilinx driver, thanks to Bharat for testing it
>   - Dropped the no_msi attribute, and solely rely on msi_domain, which
>     has the same effect for the only platform that was using it.
>   - Fixed compilation on architectures that do not select the generic
>     MSI support
> 
> [...]

I have applied it to pci/msi and should be moved into -next shortly
for further testing/visibility, thanks a lot for putting it together.

[01/14] PCI: tegra: Convert to MSI domains
        https://git.kernel.org/lpieralisi/pci/c/973a28677e
[02/14] PCI: rcar: Don't allocate extra memory for the MSI capture address
        https://git.kernel.org/lpieralisi/pci/c/c244dc15dc
[03/14] PCI: rcar: Convert to MSI domains
        https://git.kernel.org/lpieralisi/pci/c/516286287d
[04/14] PCI: xilinx: Don't allocate extra memory for the MSI capture address
        https://git.kernel.org/lpieralisi/pci/c/cc8cf90738
[05/14] PCI: xilinx: Convert to MSI domains
        https://git.kernel.org/lpieralisi/pci/c/b66873599e
[06/14] PCI: hv: Drop msi_controller structure
        https://git.kernel.org/lpieralisi/pci/c/65b131816a
[07/14] PCI/MSI: Drop use of msi_controller from core code
        https://git.kernel.org/lpieralisi/pci/c/54729d2a7a
[08/14] PCI/MSI: Kill msi_controller structure
        https://git.kernel.org/lpieralisi/pci/c/27278a3fac
[09/14] PCI/MSI: Kill default_teardown_msi_irqs()
        https://git.kernel.org/lpieralisi/pci/c/f68f571db9
[10/14] PCI/MSI: Let PCI host bridges declare their reliance on MSI domains
        https://git.kernel.org/lpieralisi/pci/c/419150a4ff
[11/14] PCI/MSI: Make pci_host_common_probe() declare its reliance on MSI domains
        https://git.kernel.org/lpieralisi/pci/c/98be0634c8
[12/14] PCI: mediatek: Advertise lack of built-in MSI handling
        https://git.kernel.org/lpieralisi/pci/c/77cbd88c90
[13/14] PCI/MSI: Document the various ways of ending up with NO_MSI
        https://git.kernel.org/lpieralisi/pci/c/44ec480daf
[14/14] PCI: Refactor HT advertising of NO_MSI flag
        https://git.kernel.org/lpieralisi/pci/c/18d56e5afe

Thanks,
Lorenzo

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
