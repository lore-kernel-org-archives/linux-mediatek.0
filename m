Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8E479C433EF
	for <linux-mediatek@archiver.kernel.org>; Mon, 29 Nov 2021 12:11:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=dSaTJGyKwKPgoXh24cxHnmXVTX68pxBdCplbYelJbf8=; b=jJvirKsQxBs2Dn
	QD8pubYyZiO/joxjdfE9rtFhXeUO6CgOC9ec07FL0bmtV9myBHVJjCL7KfpX/snNDw9PAXZ7X4BZ8
	mcYTRmu/BhtrDidZqmjzcRyuIeFtC7uguj/ik0qqHEoA6Jei6mzbQn35mybZFNb/Y+OSNl74wOe6h
	+IcC4Gt53zhGkcQbArL16PkGPOb8aCOxqaGQoMnqQpqC5vrbj50IHf+x5nR/61K7MgyuOsBXhMV6b
	6F0x22ElLtmPc66/YecGVTn6jslYHlU2PQqFEKviaX5OCl8+1zfx5gwMflQG4RGwYSs6Zpbxu/KHh
	mKOqeqx/J5Oz7JpWRQNw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mrfV6-000dWK-I0; Mon, 29 Nov 2021 12:11:16 +0000
Received: from foss.arm.com ([217.140.110.172])
 by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mrfUs-000dUC-OV; Mon, 29 Nov 2021 12:11:04 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 83BEC1042;
 Mon, 29 Nov 2021 04:11:01 -0800 (PST)
Received: from e123427-lin.arm.com (unknown [10.57.34.225])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 82DDC3F694;
 Mon, 29 Nov 2021 04:10:59 -0800 (PST)
From: Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>
To: Jianjun Wang <jianjun.wang@mediatek.com>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 =?UTF-8?q?Krzysztof=20Wilczy=C5=84ski?= <kw@linux.com>,
 Ryder Lee <ryder.lee@mediatek.com>, Bjorn Helgaas <bhelgaas@google.com>,
 Rob Herring <robh+dt@kernel.org>
Cc: Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-mediatek@lists.infradead.org, Ryan-JH.Yu@mediatek.com,
 qizhong.cheng@mediatek.com, Tzung-Bi Shih <tzungbi@google.com>,
 linux-pci@vger.kernel.org
Subject: Re: [PATCH v3] PCI: mediatek-gen3: Disable DVFSRC voltage request
Date: Mon, 29 Nov 2021 12:10:50 +0000
Message-Id: <163818783058.10689.5907894274885753855.b4-ty@arm.com>
X-Mailer: git-send-email 2.31.0
In-Reply-To: <20211015063602.29058-1-jianjun.wang@mediatek.com>
References: <20211015063602.29058-1-jianjun.wang@mediatek.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211129_041102_861532_88943E4D 
X-CRM114-Status: UNSURE (   8.42  )
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

On Fri, 15 Oct 2021 14:36:02 +0800, Jianjun Wang wrote:
> When the DVFSRC (dynamic voltage and frequency scaling resource collector)
> feature is not implemented, the PCIe hardware will assert a voltage request
> signal when exit from the L1 PM Substates to request a specific Vcore
> voltage, but cannot receive the voltage ready signal, which will cause
> the link to fail to exit the L1 PM Substates.
> 
> Disable DVFSRC voltage request by default, we need to find a common way to
> enable it in the future.
> 
> [...]

Applied to pci/mediatek-gen3, thanks!

[1/1] PCI: mediatek-gen3: Disable DVFSRC voltage request
      https://git.kernel.org/lpieralisi/pci/c/ab344fd43f

Thanks,
Lorenzo

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
