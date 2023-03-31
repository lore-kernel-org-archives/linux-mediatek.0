Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4F8D8C6FD18
	for <linux-mediatek@archiver.kernel.org>; Fri, 31 Mar 2023 08:03:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=iJs46k5iSvARUHDNxGvakUJPuPLOnnDLYQjzwiJ4Ftk=; b=EBCKp2OQ2a2PHaVobjCgbgVfwA
	1NKIejkuNpjIDtkIHwM4Y6NEksKf/m6DHnbX2Q6zNSc+au+DMERAQgTnbLqLW34If04NXC04nuHM1
	fWg4DHzSsAuOXpNJCDxiIpq7uNgqJ05zhRm/pWdL93WoPX8QJzvhdO8pYELz6etRnbIOmyBqIkbtG
	6I2/rhJ45JtFivjylj+SraD+aWLlFgXQDwnyrQ037jbqH7wyItRQzMK2Y9/uXk7x6SjDjCNg0eRTi
	uhaXb0cRedqwMRe0WlYpmrUHZdqR5FyLr+XAeHE+WEax1iDPYQv0+EWHumy65huqPrA1lXWYyfQvp
	v6JBqTew==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pi9ir-006GtR-2B;
	Fri, 31 Mar 2023 08:02:57 +0000
Received: from mail.8bytes.org ([85.214.250.239])
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pi9ih-006Gqm-1B;
	Fri, 31 Mar 2023 08:02:49 +0000
Received: from 8bytes.org (p200300c27714bc0086ad4f9d2505dd0d.dip0.t-ipconnect.de [IPv6:2003:c2:7714:bc00:86ad:4f9d:2505:dd0d])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.8bytes.org (Postfix) with ESMTPSA id 9A614244F13;
	Fri, 31 Mar 2023 10:02:41 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=8bytes.org;
	s=default; t=1680249762;
	bh=HhNt/vf0jJLpApM2a8CXLarqNpXt1SlWBho4pzL7iyM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=56hwbbzU761AwpD69MbRihRBiQQoeH3NTg9qiGBW/D1DgCtMhCKCMziSN01J6Fl23
	 9b/Y/GwSZua/dgn1MSocXyeo1/UcKyQXn5j4RP9Qm0j+OfOxsoozYaKimJUZkIEcQM
	 +itRz2SSFAKa6ogBGBHGgoFjSu4bU72jbWccFF5ripuFT7iy4Uqc0fuHd7DqXPSy7x
	 JIa4qAuvo2+TkcWE118aA8aflUW5dL2BYZfy0qNo0AnLAjjKB4WgnUHxiGtcL5dSMz
	 472kWknwpAKwJ/JTnvJkTfJwXlLOb6oPujqeJ5F4cWmgmHb655GjNVqk/rPJOliKgD
	 ZRe0kVywMiYIA==
Date: Fri, 31 Mar 2023 10:02:40 +0200
From: Joerg Roedel <joro@8bytes.org>
To: Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <u.kleine-koenig@pengutronix.de>
Cc: Will Deacon <will@kernel.org>, Lu Baolu <baolu.lu@linux.intel.com>,
	Vladimir Oltean <vladimir.oltean@nxp.com>,
	Sai Prakash Ranjan <quic_saipraka@quicinc.com>,
	Jon Nettleton <jon@solid-run.com>, Hector Martin <marcan@marcan.st>,
	Sven Peter <sven@svenpeter.dev>, Jason Gunthorpe <jgg@ziepe.ca>,
	Shameer Kolothum <shameerali.kolothum.thodi@huawei.com>,
	Yicong Yang <yangyicong@hisilicon.com>,
	Nicolin Chen <nicolinc@nvidia.com>, Rob Clark <robdclark@gmail.com>,
	Andy Gross <agross@kernel.org>,
	Bjorn Andersson <andersson@kernel.org>,
	Yong Wu <yong.wu@mediatek.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	Orson Zhai <orsonzhai@gmail.com>,
	Baolin Wang <baolin.wang@linux.alibaba.com>,
	Chunyan Zhang <zhang.lyra@gmail.com>,
	Robin Murphy <robin.murphy@arm.com>,
	linux-arm-kernel@lists.infradead.org, iommu@lists.linux.dev,
	kernel@pengutronix.de, Alyssa Rosenzweig <alyssa@rosenzweig.io>,
	asahi@lists.linux.dev, linux-arm-msm@vger.kernel.org,
	Konrad Dybcio <konrad.dybcio@linaro.org>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	linux-mediatek@lists.infradead.org
Subject: Re: [PATCH 00/10] iommu: Convert to platform remove callback
 returning void
Message-ID: <ZCaToJfq6CSsgpB+@8bytes.org>
References: <20230321084125.337021-1-u.kleine-koenig@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20230321084125.337021-1-u.kleine-koenig@pengutronix.de>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230331_010247_658028_766D09D8 
X-CRM114-Status: UNSURE (   5.71  )
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

On Tue, Mar 21, 2023 at 09:41:15AM +0100, Uwe Kleine-König wrote:
> Uwe Kleine-König (10):
>   iommu/arm-smmu: Drop if with an always false condition
>   iommu/apple-dart: Convert to platform remove callback returning void
>   iommu/arm-smmu-v3: Convert to platform remove callback returning void
>   iommu/arm-smmu: Convert to platform remove callback returning void
>   iommu/ipmmu-vmsa: Convert to platform remove callback returning void
>   iommu/msm: Convert to platform remove callback returning void
>   iommu/mtk: Convert to platform remove callback returning void
>   iommu/mtk_iommu_v1: Convert to platform remove callback returning void
>   iommu/omap: Convert to platform remove callback returning void
>   iommu/sprd: Convert to platform remove callback returning void

Applied, thanks.

