Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CA77FC4332F
	for <linux-mediatek@archiver.kernel.org>; Fri,  8 Apr 2022 14:31:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=/x3evjXoOG/ee6gGMHYRdXaWDqG0qPRnDB+BxG6POeA=; b=Ty7Hsos6IEM7eS
	BERSgNcLhPn6wkYUrtsNFpagxo0HJrjWX/GS+4DP+7WyJ4Oz9wBHFoHEXWGCEz/tqO7Ov6wd7QjMp
	EEKKUWKv9Woh20StwFpMCgVYBVv77DuJv64AeXEM1Ineh7/0VUgCYZXuZ5Jwi3eYmxGq9GLNRSCfV
	a5mHXD6+mEVXCQIfnbVYsuQVBEXmK9I9J9zuHlyquZXkGYV4ZCSCtp4/YORGPRhIaRJxLXtebOMOK
	TEBlpH9shigwrBc2CpNnQXKhUiKltcjQF7OOoDghu72QNovs1oki5zbItrA0Xs5uYs4l5kVJx1LE5
	kQsyq7CU+Eqz49qvCnEg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ncpdf-00Hahc-Lj; Fri, 08 Apr 2022 14:31:03 +0000
Received: from foss.arm.com ([217.140.110.172])
 by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
 id 1ncpdU-00HafC-S5; Fri, 08 Apr 2022 14:30:54 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id AF470113E;
 Fri,  8 Apr 2022 07:30:51 -0700 (PDT)
Received: from e123427-lin.arm.com (unknown [10.57.11.200])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 9A5843F73B;
 Fri,  8 Apr 2022 07:30:48 -0700 (PDT)
From: Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>
To: linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 Rob Herring <robh@kernel.org>, linux-kernel@vger.kernel.org,
 Chuanjia Liu <chuanjia.liu@mediatek.com>,
 Jianjun Wang <jianjun.wang@mediatek.com>, linux-pci@vger.kernel.org,
 Miaoqian Lin <linmq006@gmail.com>, Bjorn Helgaas <bhelgaas@google.com>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 =?UTF-8?q?Krzysztof=20Wilczy=C5=84ski?= <kw@linux.com>,
 Ryder Lee <ryder.lee@mediatek.com>
Cc: Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>
Subject: Re: [PATCH] PCI: mediatek: Fix refcount leak in
 mtk_pcie_subsys_powerup
Date: Fri,  8 Apr 2022 15:30:48 +0100
Message-Id: <164942823614.23463.14514504733320823500.b4-ty@arm.com>
X-Mailer: git-send-email 2.31.0
In-Reply-To: <20220309091953.5630-1-linmq006@gmail.com>
References: <20220309091953.5630-1-linmq006@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220408_073052_988990_2045645E 
X-CRM114-Status: UNSURE (   7.22  )
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

On Wed, 9 Mar 2022 09:19:52 +0000, Miaoqian Lin wrote:
> The of_find_compatible_node() function returns a node pointer with
> refcount incremented, We should use of_node_put() on it when done
> Add the missing of_node_put() to release the refcount.
> 
> 

Applied to pci/mediatek, thanks!

[1/1] PCI: mediatek: Fix refcount leak in mtk_pcie_subsys_powerup
      https://git.kernel.org/lpieralisi/pci/c/214e0d8fe4

Thanks,
Lorenzo

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
