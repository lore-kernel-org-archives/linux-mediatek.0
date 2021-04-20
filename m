Return-Path: <SRS0=wye3=JR=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8EEE9C433B4
	for <linux-mediatek@archiver.kernel.org>; Tue, 20 Apr 2021 09:13:39 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2A8216127C
	for <linux-mediatek@archiver.kernel.org>; Tue, 20 Apr 2021 09:13:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 2A8216127C
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=arm.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=Ni43i5wBue/Q0qXatRMhw1uZYL+qSTGI/QufSxiOSac=; b=CGlE7tjylQkEvln2N11bp38VH
	JhKG26Lj/0oxMTogQ8hoBFvzUgYKH9ddJSyBej42iXD8afcUNkZNV5EZjBMOya+nAYCCHCW3gqwTg
	zDxQGWsywNf95uWm3L6107Cp6RYNW3hR18/AULGBsIymQ3JgrJbBJvEDUbDmxANvOMwz3OfNHN1UY
	zpm7FF93uFIcUReUI8TbVUT3QHI2MKZENobqfdS5a94cDIxIPD9OpwPx94BdNPU5XMJ1/zZ35Gjdc
	08UG4lxkskU1CjyDn4YPybbGKTQhljBMDWRcNqjMhgS0lNp8GOHKeIbEUzLMlZoXdRGMoZE2W7/1R
	VWsN9xInA==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lYmRi-00BgjA-Su; Tue, 20 Apr 2021 09:13:27 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lYmRM-00BgbZ-7F; Tue, 20 Apr 2021 09:13:04 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
 MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender
 :Reply-To:Content-Type:Content-ID:Content-Description;
 bh=6VVgIcUGlc4ZrmSppTjfa6rFXrmE0vJ0YBvw8AbBO9o=; b=OwGUbTKVXrinrrXB7N5ZmTJXj5
 8UHj3OjumbZlZ57Q7E8nPH0PpoEQiRZf4bxFAkEx1rDJJKb03afVS0SQViOdYKBskSwudwcFQxWwp
 w+llq6DL2PC2r2pVxFqPNVuPNRriv6WCDvpWPvIWkgW5TExw3deUEGZ9Fk4jq+OfuqWRUPv00UZLF
 yPVVE4In/J8Q+/j1qLkkx3gWwqBKjjhnVx7EJmgrxfkwKiKlFj7IWrGF04ErkvU1wVk9h2Tsd7nkr
 /kTh52wlMSghynlsw/w32c0T2/2h/TVaRKtX6tRN//SwTu73u0dUKIAJs1GrIKx0lgSop/K2yuPII
 nRMfCTsw==;
Received: from foss.arm.com ([217.140.110.172])
 by bombadil.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
 id 1lYmRG-00Bxjh-Au; Tue, 20 Apr 2021 09:13:02 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 944B51435;
 Tue, 20 Apr 2021 02:12:55 -0700 (PDT)
Received: from e123427-lin.arm.com (unknown [10.57.58.245])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id B35EB3F85F;
 Tue, 20 Apr 2021 02:12:52 -0700 (PDT)
From: Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>
To: Bjorn Helgaas <bhelgaas@google.com>, Ryder Lee <ryder.lee@mediatek.com>,
 Jianjun Wang <jianjun.wang@mediatek.com>, Rob Herring <robh+dt@kernel.org>,
 Marc Zyngier <maz@kernel.org>
Cc: Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>,
 =?UTF-8?q?Pali=20Roh=C3=A1r?= <pali@kernel.org>, linux-pci@vger.kernel.org,
 linux-mediatek@lists.infradead.org, Philipp Zabel <p.zabel@pengutronix.de>,
 sin_jieyang@mediatek.com, chuanjia.liu@mediatek.com,
 devicetree@vger.kernel.org, Krzysztof Wilczyski <kw@linux.com>,
 linux-kernel@vger.kernel.org, drinkcat@chromium.org,
 youlin.pei@mediatek.com, Rex-BC.Chen@mediatek.com,
 qizhong.cheng@mediatek.com, linux-arm-kernel@lists.infradead.org,
 Matthias Brugger <matthias.bgg@gmail.com>, anson.chuang@mediatek.com
Subject: Re: [PATCH v10 0/7] PCI: mediatek: Add new generation controller
 support
Date: Tue, 20 Apr 2021 10:12:43 +0100
Message-Id: <161890993967.14131.8304781872037527456.b4-ty@arm.com>
X-Mailer: git-send-email 2.26.1
In-Reply-To: <20210420061723.989-1-jianjun.wang@mediatek.com>
References: <20210420061723.989-1-jianjun.wang@mediatek.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210420_021258_439714_9C960C24 
X-CRM114-Status: UNSURE (   8.44  )
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

On Tue, 20 Apr 2021 14:17:16 +0800, Jianjun Wang wrote:
> These series patches add pcie-mediatek-gen3.c and dt-bindings file to
> support new generation PCIe controller.
> 
> Changes in v10:
> 1. Fix the subject line format in commit message;
> 2. Use EXPORT_SYMBOL_GPL() to export pci_pio_to_address().
> 
> [...]

Applied to pci/mediatek, thanks!

[1/7] dt-bindings: PCI: mediatek-gen3: Add YAML schema
      https://git.kernel.org/lpieralisi/pci/c/07ca255e3d
[2/7] PCI: Export pci_pio_to_address() for module use
      https://git.kernel.org/lpieralisi/pci/c/9cc742078c
[3/7] PCI: mediatek-gen3: Add MediaTek Gen3 driver for MT8192
      https://git.kernel.org/lpieralisi/pci/c/441903d9e8
[4/7] PCI: mediatek-gen3: Add INTx support
      https://git.kernel.org/lpieralisi/pci/c/c58148e657
[5/7] PCI: mediatek-gen3: Add MSI support
      https://git.kernel.org/lpieralisi/pci/c/e0282a61f4
[6/7] PCI: mediatek-gen3: Add system PM support
      https://git.kernel.org/lpieralisi/pci/c/a7583c42f4
[7/7] MAINTAINERS: Add Jianjun Wang as MediaTek PCI co-maintainer
      https://git.kernel.org/lpieralisi/pci/c/fcf132f196

Thanks,
Lorenzo

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
