Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 28BB0C433EF
	for <linux-mediatek@archiver.kernel.org>; Fri,  7 Jan 2022 10:23:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=axkL6u5i/cpNujDnLRk57teGo+oJnlMH8hKPPj+gELk=; b=nFS7Z7T4FdqBj3
	7ymEgKdPWPJnY5w/wk7946tUl9XvYPNjcwzEJ/6L9v6RNURI7yNtydoktxBQo8Qt9+Sa4/EO+v0gU
	qtxUqctiNvqljkBMOWecRo3XGi6T/m/GlBrUfiaNSTv+MnhSifaht7vSm2SjbApzYlE3KsfoeOqiv
	rA6kFhG9F3R/HnwULlzrbIm4D7rpbHUK+wfc9Lyfzl7h1wNtQf0IfDc5qg7ALr4LqXQNd1lJGoJC4
	Vhbxk6473yoPSMNlKXEmxJy9LcWHgcFuwisLYPk6ksG2Ei/ot8ocx/h4u02AqzAsKrhF98cZJHOvn
	Drm7kYb8cOFtwQD2D7nA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1n5mOz-003KCU-99; Fri, 07 Jan 2022 10:23:17 +0000
Received: from foss.arm.com ([217.140.110.172])
 by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
 id 1n5mOe-003K2l-QA; Fri, 07 Jan 2022 10:22:58 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 0E60C13D5;
 Fri,  7 Jan 2022 02:22:54 -0800 (PST)
Received: from e123427-lin.arm.com (unknown [10.57.36.216])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id E362C3F66F;
 Fri,  7 Jan 2022 02:22:51 -0800 (PST)
From: Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>
To: =?UTF-8?q?Krzysztof=20Wilczy=C5=84ski?= <kw@linux.com>,
 Jianjun Wang <jianjun.wang@mediatek.com>,
 Ryder Lee <ryder.lee@mediatek.com>, Bjorn Helgaas <bhelgaas@google.com>,
 qizhong cheng <qizhong.cheng@mediatek.com>
Cc: Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>,
 =?UTF-8?q?Pali=20Roh=C3=A1r?= <pali@kernel.org>,
 linux-arm-kernel@lists.infradead.org, chuanjia.liu@mediatek.com,
 linux-mediatek@lists.infradead.org, linux-pci@vger.kernel.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3] PCI: mediatek: Assert PERST# for 100ms for power and
 clock to stabilize
Date: Fri,  7 Jan 2022 10:22:46 +0000
Message-Id: <164155095225.6775.655179565397700923.b4-ty@arm.com>
X-Mailer: git-send-email 2.31.0
In-Reply-To: <20211227133110.14500-1-qizhong.cheng@mediatek.com>
References: <20211227133110.14500-1-qizhong.cheng@mediatek.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220107_022256_944651_64BCC572 
X-CRM114-Status: UNSURE (   4.78  )
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

On Mon, 27 Dec 2021 21:31:10 +0800, qizhong cheng wrote:
> Described in PCIe CEM specification sections 2.2 (PERST# Signal) and
> 2.2.1 (Initial Power-Up (G3 to S0)). The deassertion of PERST# should
> be delayed 100ms (TPVPERL) for the power and clock to become stable.
> 
> 

Applied to pci/mediatek, thanks!

[1/1] PCI: mediatek: Assert PERST# for 100ms for power and clock to stabilize
      https://git.kernel.org/lpieralisi/pci/c/65ace9a85f

Thanks,
Lorenzo

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
