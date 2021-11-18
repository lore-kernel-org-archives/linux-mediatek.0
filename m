Return-Path: <SRS0=mmGE=QF=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B8745C433F5
	for <linux-mediatek@archiver.kernel.org>; Thu, 18 Nov 2021 20:44:38 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 701CC6112E
	for <linux-mediatek@archiver.kernel.org>; Thu, 18 Nov 2021 20:44:38 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 701CC6112E
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:
	List-Owner; bh=7KvzTY3AMGo3OPa/NtpLjjGPabmikY95aWhqaPE2C9k=; b=TD7j8ngY8ONoO1
	yYkdj7SsR9WWG7Wu7mRRxvvopC8Gx14IFla/u11XGYr4s5SG2uuNxVH0npRHdArZUQexzS5iJRF2H
	NW0BTLI6wciuAxrgWxRZKRZV2w8yONi5HU/YmfkHyvxT6Cc0Vp8q+Qj6SOzGv3aj4+kkDJUyS9lyv
	elVQ+G7v7KevkwtYpF9ZqLgHkRonowjTFY0RESvLEH2LJr+nrSZ2pufwI4QkToPXc8fRU/eA1lQAe
	2PRoSFZvAt6JRKPMtsrAzIc1rPqIeOmbrk1bkQL4yYOEhWbj20P4oSTJiXf8A1d+as/ROxa+ypTlh
	H4EIEt31INGAeQFIQmRw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mnoGh-008rlG-C0; Thu, 18 Nov 2021 20:44:27 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mnoGd-008rk7-C5; Thu, 18 Nov 2021 20:44:24 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id 475F96128C;
 Thu, 18 Nov 2021 20:44:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1637268262;
 bh=sVeugOXOThpr87Zi3LpkKeS4dLNuxTnnYlOPOREQuJ0=;
 h=Date:From:To:Cc:Subject:In-Reply-To:From;
 b=Jb8casGJHw1GPw52ROWvElXI1Y3Ol4NorSB8tY4VFUWAsxhMhJw1eGg8yeeDOl3HL
 1gEwn+J/Nwj3oOgX2oyUA2qOkyE/QgPMADTRcCzD9yMiYgcjYUYDgq+dL2TdYrZkrO
 DdUxiQel6roOXC65gdhkzxUJk9jgL+XYK9S7+j+2lkQ1K/Kzq9TxQ0cGLh3BqCmPU8
 SJQVIITH1U7ML7B0BhEONKb9SbGnIRmDeuojCtWd98bXE7wmEYbfbkzXsfTzGIULyP
 C+fXuO7dL5eKt7rtZyOn/GSS+MoJ67VMC4nYz5UwIajXf0XXzbE3KqP5TeTFwOTboQ
 1i0TF1Z0kO7nA==
Date: Thu, 18 Nov 2021 14:44:21 -0600
From: Bjorn Helgaas <helgaas@kernel.org>
To: Naveen Naidu <naveennaidu479@gmail.com>
Cc: bhelgaas@google.com, Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kw@linux.com>,
 linux-hyperv@vger.kernel.org, Heiko Stuebner <heiko@sntech.de>,
 linux-pci@vger.kernel.org, Shawn Lin <shawn.lin@rock-chips.com>,
 Binghui Wang <wangbinghui@hisilicon.com>,
 Kuppuswamy Sathyanarayanan <sathyanarayanan.kuppuswamy@linux.intel.com>,
 Oliver O'Halloran <oohall@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Russell Currey <ruscur@russell.cc>,
 Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>,
 Toan Le <toan@os.amperecomputing.com>,
 "K. Y. Srinivasan" <kys@microsoft.com>,
 Nirmal Patel <nirmal.patel@linux.intel.com>,
 Marek Vasut <marek.vasut+renesas@gmail.com>,
 Rob Herring <robh@kernel.org>, Wei Liu <wei.liu@kernel.org>,
 linux-samsung-soc@vger.kernel.org, Marc Zyngier <maz@kernel.org>,
 Joyce Ooi <joyce.ooi@intel.com>, Dexuan Cui <decui@microsoft.com>,
 Kishon Vijay Abraham I <kishon@ti.com>,
 Jianjun Wang <jianjun.wang@mediatek.com>,
 linux-rockchip@lists.infradead.org,
 "maintainer:BROADCOM IPROC ARM ARCHITECTURE"
 <bcm-kernel-feedback-list@broadcom.com>, 
 Jonathan Derrick <jonathan.derrick@linux.dev>,
 Xiaowei Song <songxiaowei@hisilicon.com>,
 linux-kernel-mentees@lists.linuxfoundation.org,
 Robert Richter <rric@kernel.org>, Sean V Kelley <sean.v.kelley@intel.com>,
 Ray Jui <rjui@broadcom.com>, Haiyang Zhang <haiyangz@microsoft.com>,
 Ryder Lee <ryder.lee@mediatek.com>, linux-mediatek@lists.infradead.org,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Stephen Hemminger <sthemmin@microsoft.com>,
 linux-arm-kernel@lists.infradead.org, Qiuxu Zhuo <qiuxu.zhuo@intel.com>,
 Scott Branden <sbranden@broadcom.com>, linuxppc-dev@lists.ozlabs.org,
 Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
 linux-kernel@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
 Lukas Wunner <lukas@wunner.de>, Jingoo Han <jingoohan1@gmail.com>,
 Shawn Guo <shawn.guo@linaro.org>,
 Pali =?iso-8859-1?Q?Roh=E1r?= <pali@kernel.org>
Subject: Re: [PATCH v4 00/25] Unify PCI error response checking
Message-ID: <20211118204421.GA1881943@bhelgaas>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <cover.1637243717.git.naveennaidu479@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211118_124423_477152_5601D91E 
X-CRM114-Status: GOOD (  14.27  )
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

On Thu, Nov 18, 2021 at 07:33:10PM +0530, Naveen Naidu wrote:
> An MMIO read from a PCI device that doesn't exist or doesn't respond
> causes a PCI error.  There's no real data to return to satisfy the 
> CPU read, so most hardware fabricates ~0 data.
> 
> This patch series adds PCI_ERROR_RESPONSE definition and other helper
> definition PCI_SET_ERROR_RESPONSE and PCI_POSSIBLE_ERROR and uses it
> where appropriate to make these checks consistent and easier to find.
> 
> This helps unify PCI error response checking and make error check
> consistent and easier to find.
> 
> This series also ensures that the error response fabrication now happens
> in the PCI_OP_READ and PCI_USER_READ_CONFIG. This removes the
> responsibility from controller drivers to do the error response setting. 

Applied to pci/error for v5.17.  Thanks, this is really nice work.
Somehow small changes like these add up to something much greater than
one would expect.

This touches many native controller drivers but in trivial ways, so I
plan to merge this branch after the usual native controller stuff from
Lorenzo.

I tweaked the commit logs to clarify that this series is all about
*config* reads, not MMIO reads.  MMIO reads have similar issues, and
we can use PCI_ERROR_RESPONSE, etc., there, too, but that's not what
this series does.

Bjorn

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
