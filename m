Return-Path: <SRS0=Gkfw=YL=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.3 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6C63DCA9EA0
	for <linux-mediatek@archiver.kernel.org>; Fri, 18 Oct 2019 12:14:57 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3B29421925
	for <linux-mediatek@archiver.kernel.org>; Fri, 18 Oct 2019 12:14:57 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="LVom5Q4Y"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 3B29421925
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=arm.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=D/ltN1Fe0b02HmAnebF5D2X3hitxrpeoE3lD58rEhAs=; b=LVom5Q4YgX52pn
	DXks5k3yJnPMuStM4c2ZBP35X8VaJ1XexP6fhFvBSZEKQUPOX+7xvyhsE8e4HiXaWQgqPnCf01ky9
	F+5stqGwIT2ivaRHKmgdwYO6Yl+PeB/+gtOGyWJ5aYo/psoSb21HTkFCUOXFCR+MGPKXZZTrTr+qI
	uY4jteAe7gT9GIq02048MwFIqjV7HPIVkzSXRr3Gc25ox4LzI5hDufI5LEkzpLmZAz3VQsI8p2KQd
	Fwl1nJaCQSiWOLKFd/7hMVI0/kCM6icd8ZFTcROMpceNvkN0thvxQ0NbbU0sxVSLQ/EUonuotGZUw
	++mxowui8IwI6S/J3s/g==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1iLR9c-0005P1-EW; Fri, 18 Oct 2019 12:14:48 +0000
Received: from [217.140.110.172] (helo=foss.arm.com)
 by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
 id 1iLR9S-0005GI-CZ; Fri, 18 Oct 2019 12:14:39 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 67A0FCA3;
 Fri, 18 Oct 2019 05:14:26 -0700 (PDT)
Received: from localhost (unknown [10.37.6.20])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id BE2E53F6C4;
 Fri, 18 Oct 2019 05:14:25 -0700 (PDT)
Date: Fri, 18 Oct 2019 13:14:24 +0100
From: Andrew Murray <andrew.murray@arm.com>
To: Christoph Hellwig <hch@infradead.org>
Subject: Re: [PATCH v2 01/25] resource: Add a resource_list_get_entry_of_type
 helper
Message-ID: <20191018121424.GF47056@e119886-lin.cambridge.arm.com>
References: <20191016200647.32050-1-robh@kernel.org>
 <20191016200647.32050-2-robh@kernel.org>
 <20191017072519.GA19517@infradead.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20191017072519.GA19517@infradead.org>
User-Agent: Mutt/1.10.1+81 (426a6c1) (2018-08-26)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20191018_051438_472619_D4A9D47A 
X-CRM114-Status: GOOD (  12.17  )
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
Cc: Heiko Stuebner <heiko@sntech.de>,
 Karthikeyan Mitran <m.karthikeyan@mobiveil.co.in>, linux-pci@vger.kernel.org,
 Linus Walleij <linus.walleij@linaro.org>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Toan Le <toan@os.amperecomputing.com>, Will Deacon <will@kernel.org>,
 Rob Herring <robh@kernel.org>, Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>,
 Michal Simek <michal.simek@xilinx.com>, linux-rockchip@lists.infradead.org,
 bcm-kernel-feedback-list@broadcom.com, Shawn Lin <shawn.lin@rock-chips.com>,
 Ray Jui <rjui@broadcom.com>, Hou Zhiqiang <Zhiqiang.Hou@nxp.com>,
 Ryder Lee <ryder.lee@mediatek.com>, linux-mediatek@lists.infradead.org,
 Bjorn Helgaas <bhelgaas@google.com>, linux-arm-kernel@lists.infradead.org,
 Scott Branden <sbranden@broadcom.com>, Jingoo Han <jingoohan1@gmail.com>,
 rfi@lists.rocketboards.org, linux-renesas-soc@vger.kernel.org,
 Tom Joseph <tjoseph@cadence.com>, Simon Horman <horms@verge.net.au>,
 Srinath Mannam <srinath.mannam@broadcom.com>,
 Gustavo Pimentel <gustavo.pimentel@synopsys.com>,
 Ley Foon Tan <lftan@altera.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Thu, Oct 17, 2019 at 12:25:19AM -0700, Christoph Hellwig wrote:
> On Wed, Oct 16, 2019 at 03:06:23PM -0500, Rob Herring wrote:
> > +static inline struct resource_entry *resource_list_get_entry_of_type(struct list_head *list,
> > +							      unsigned long type)
> 
> This adds a way too long line.
> 
> Part of that is that the name just seems way too long as well, any
> good shorter name?  resourse_list_first_type?

I think it's really helpful to use the word 'first' in there somewhere,
it makes it a little clearer on what happens if there are multiple of
the same type of resource.

Thanks,

Andrew Murray

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
