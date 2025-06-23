Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 71B48C7115B
	for <linux-mediatek@archiver.kernel.org>; Mon, 23 Jun 2025 15:45:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Qc4U+rv+d6CBJCgHmWMcyCCqOFoG24tZK58kLCoTP0g=; b=uakOlYrKSbgRLlN0L3Q0xSvaXl
	gTowVcOi2s+HS+QEpWqh45HlTrW9JkVsX0rVV9Wd7XrAtJrxI2ZEC0f6ff06g7lI+/mIDYgevxDs2
	73+c/EhskzEwwsOEcF3th0d2uzargIGJ7AmcMaCPtymiNCxYKbUNH9v1nS3+rMTgH2L4jxIWxSOg9
	4VsZzWSPuR+Z6kjsl0aQjSt6ivmfCNasp8NHd1X3oOzfR1sL9yoEofDnfBRMEAHrZfXRe6UvN4adi
	FJ3Om5y7/i5P3BEO51O3hmFGGuIsggYbmAZTTNFw66TCAz5yw9aZFqxjBhVqE9sw+oKtMviDCGLDC
	c7L5pQzg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uTjMn-00000003I9b-1xww;
	Mon, 23 Jun 2025 15:45:53 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uTg69-00000002e2d-3gb4;
	Mon, 23 Jun 2025 12:16:30 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id D8501113E;
	Mon, 23 Jun 2025 05:16:08 -0700 (PDT)
Received: from bogus (e133711.arm.com [10.1.196.55])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id C3C8E3F58B;
	Mon, 23 Jun 2025 05:16:24 -0700 (PDT)
Date: Mon, 23 Jun 2025 13:16:21 +0100
From: Sudeep Holla <sudeep.holla@arm.com>
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
	matthias.bgg@gmail.com, cristian.marussi@arm.com,
	Sudeep Holla <sudeep.holla@arm.com>, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org, arm-scmi@vger.kernel.org,
	kernel@collabora.com
Subject: Re: [PATCH v1 2/2] firmware: arm_scmi: Add MediaTek TinySYS SCMI
 Protocol support
Message-ID: <20250623-free-puzzling-wrasse-0fdb7e@sudeepholla>
References: <20250623120136.109311-1-angelogioacchino.delregno@collabora.com>
 <20250623120136.109311-3-angelogioacchino.delregno@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250623120136.109311-3-angelogioacchino.delregno@collabora.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250623_051629_959859_87C6127E 
X-CRM114-Status: UNSURE (   9.18  )
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
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Mon, Jun 23, 2025 at 02:01:36PM +0200, AngeloGioacchino Del Regno wrote:
> Add a driver for the SCMI protocol extensions for MediaTek TinySYS.
> This is used to communicate with various remote processors in some
> MediaTek SoCs, which mainly handle power management related tasks.
> 

Please provide the detailed documentation for this vendor protocol/extension.
Refer drivers/firmware/arm_scmi/vendors/imx/imx95.rst for example.
It is hard to do any useful review without the detailed documentation.

-- 
Regards,
Sudeep

