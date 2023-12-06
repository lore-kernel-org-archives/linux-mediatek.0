Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 65241C4167B
	for <linux-mediatek@archiver.kernel.org>; Wed,  6 Dec 2023 12:09:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=yrd81zGIMcL6sMoWgoNBvb1lXE8kmP7kb3JaHTjBjiI=; b=mk/lDQ4OWbOcq4abKUQjS4kREE
	KX3kCotJpKcXgI8QkaQIqGe0IlfmbXi8oJgrFFoj1GUULmzx3gaKZthDGjJ7QZORICKWYJvgrMRRH
	WGcfbXPbLaIzlW2k2uC4TrDa0HN2m2RSibkL68DuOv1+lzpO9rRPsAP7lcWg9so5YUPm76rUInVw0
	5Myv76XKCgCAvV+X9px2L5iRxuRbt4PA7PRePb+HjNgoE38h1zDjjg8Nkg4i9lMFymZdaBweyYLF3
	rwgYGZRf9lXBlPPcbw3/X2I3HJrZvQkWodswqpUTwNXgMBighIin1cYLaxs3hXszG+51CdzQN6x8P
	nyMpW4ZA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rAqic-00ADov-0J;
	Wed, 06 Dec 2023 12:09:34 +0000
Received: from hch by bombadil.infradead.org with local (Exim 4.96 #2 (Red Hat Linux))
	id 1rAqiY-00ADob-2i;
	Wed, 06 Dec 2023 12:09:30 +0000
Date: Wed, 6 Dec 2023 04:09:30 -0800
From: Christoph Hellwig <hch@infradead.org>
To: Manivannan Sadhasivam <mani@kernel.org>
Cc: Nitin Rawat <quic_nitirawa@quicinc.com>,
	"James E.J. Bottomley" <jejb@linux.ibm.com>,
	"Martin K. Petersen" <martin.petersen@oracle.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
	linux-scsi@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org, quic_cang@quicinc.com,
	Manish Pandey <quic_mapa@quicinc.com>
Subject: Re: [PATCH V1] scsi: ufs: core: store min and max clk freq from OPP
 table
Message-ID: <ZXBkeqyoA1E3bznx@infradead.org>
References: <20231206053628.32169-1-quic_nitirawa@quicinc.com>
 <20231206075447.GA4954@thinkpad>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231206075447.GA4954@thinkpad>
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

On Wed, Dec 06, 2023 at 01:24:47PM +0530, Manivannan Sadhasivam wrote:
> But these values are used by the vendor host drivers internally for controller
> configuration. When the OPP support is enabled in devicetree, these values will

There is no such thing as a "vendor" driver.


