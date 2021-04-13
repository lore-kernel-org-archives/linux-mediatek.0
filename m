Return-Path: <SRS0=dZqu=JK=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A8DA1C433ED
	for <linux-mediatek@archiver.kernel.org>; Tue, 13 Apr 2021 10:49:25 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7415760E0B
	for <linux-mediatek@archiver.kernel.org>; Tue, 13 Apr 2021 10:49:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 7415760E0B
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=arm.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=YWaptcwjeqZTl2HgKVQx7ol+uBYZ47B6ffJa5YyPKtg=; b=mpufSQsvhKuR02aGFRRfwI28Y
	Nv2P3gzaAhi27Em/t23S4r6tcJuU4x17XiePzxJsSRdiLzV7AcUVXVh6yp9C5Ofp+Il0oX17FeDTu
	XFKtIBMZaYOnrt2OCN7mF9TBgNMnyHNoa1v0ob74oN0qegpagrbZaqJFIFi2F9vEYRUJY4qouMIpp
	iJ3N3UKdoGg3eSMhvACIsRVEdNPsKEGX7eZoXWmPsSjJqdSz2xc1jl3ieCD8mi919TxGN6czofRl3
	GVpUxU3SQ8t7wYPak1fec05WBfDinWNuUMPqNrs1/Jq8zwNyCI3Q9h7EM5hLI4r2+/PS+2WBV4ClK
	m/V1EgHeA==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lWGbU-008uU4-2n; Tue, 13 Apr 2021 10:49:08 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lWGbA-008uMI-Ot; Tue, 13 Apr 2021 10:48:48 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
 MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender
 :Reply-To:Content-Type:Content-ID:Content-Description;
 bh=WReUkdmqpuoYczukUKIcUDZcV1D+LuM2IvK1hkG5nro=; b=go8K5yoe0J3BBaBuV/a+hUdC77
 74DcgZ9J83n4L8lfqP4WNxRlFSc4Ly2hD9LTHvK3Xi6DyCY86k3vRzcaARJBwYpa+M4eeKJdWZqfw
 hJ06wuHxKt+zZdoos3JJ37l6QYqdRkw6u8Yj+aLu9OgAdbD2KjSNjRUjtcxseZVIaFNXnoloptNNj
 pXrnQYorHbSMb7ih3Pcv+akXFO9re5jNhS70taRC4rTvH15yoAqctCHNtyQFsRtVRR3shnR846nVI
 WQeSs2ZL9RPoWtUYe70Wr/dWK/R4UvSXQ3D2sQfN2tsLeXMn989Qpyd8vtz27Ms5kiIQ6SKwEzNOC
 eJwdJvxg==;
Received: from foss.arm.com ([217.140.110.172])
 by bombadil.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
 id 1lWGb8-006w9P-3m; Tue, 13 Apr 2021 10:48:47 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 72B3A106F;
 Tue, 13 Apr 2021 03:48:39 -0700 (PDT)
Received: from e123427-lin.arm.com (unknown [10.57.59.108])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id D4F813F73B;
 Tue, 13 Apr 2021 03:48:37 -0700 (PDT)
From: Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>
To: Qiheng Lin <linqiheng@huawei.com>, Ryder Lee <ryder.lee@mediatek.com>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Bjorn Helgaas <bhelgaas@google.com>, Philipp Zabel <p.zabel@pengutronix.de>
Cc: Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>,
 linux-mediatek@lists.infradead.org, Hulk Robot <hulkci@huawei.com>,
 kernel-janitors@vger.kernel.org, linux-pci@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH -next] PCI: mediatek: Add missing MODULE_DEVICE_TABLE
Date: Tue, 13 Apr 2021 11:48:33 +0100
Message-Id: <161831089975.6369.2070015191943714889.b4-ty@arm.com>
X-Mailer: git-send-email 2.26.1
In-Reply-To: <20210331085938.3115-1-linqiheng@huawei.com>
References: <20210331085938.3115-1-linqiheng@huawei.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210413_034846_215047_12610523 
X-CRM114-Status: UNSURE (   7.04  )
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

On Wed, 31 Mar 2021 16:59:38 +0800, Qiheng Lin wrote:
> This patch adds missing MODULE_DEVICE_TABLE definition which generates
> correct modalias for automatic loading of this driver when it is built
> as an external module.

Applied to pci/mediatek, thanks!

[1/1] PCI: mediatek: Add missing MODULE_DEVICE_TABLE
      https://git.kernel.org/lpieralisi/pci/c/87db343f80

Thanks,
Lorenzo

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
