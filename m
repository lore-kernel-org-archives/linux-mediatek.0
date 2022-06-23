Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 16B63C43334
	for <linux-mediatek@archiver.kernel.org>; Thu, 23 Jun 2022 07:33:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=yKxoLSHNPhqqaFojW3XEcSfshDr8ESS0JZ4xHZoZs1g=; b=lC3MChQoDF9znED0Frdx45j7Q9
	sXvweRMiAs9v+tHFCFkR2hoXeqdpBApBW4Z3C5EHVYWjborK2yMSEMJha8ImZ6FuAxEsmZZFtSobu
	gEflaTBLksCM7XCX/GjDnzwBCdPs4eOUy9lK+VnYrywxSHHJ1HxSijFIcD6I1YIwZGCUnhFkgY/0t
	fxxYHMJsTXeKfJCrcDJNFnmkWUoSyihLaJpf8nt7NrP9yQmf5Oc+aI8qSCuJ4VcCfNThPnt4Bi+qk
	Hf/L4kcEB3tjUQzax8Bmhy3PxuAnhU6uAOTCDKU54gEp0VCy4uIyvQNQNX72cSxhU3EYm4qMxGyS6
	Sy8CJHuw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o4HKu-00DtCy-Tu; Thu, 23 Jun 2022 07:33:08 +0000
Received: from 8bytes.org ([81.169.241.247] helo=theia.8bytes.org)
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o4HKk-00Dt9G-8S; Thu, 23 Jun 2022 07:32:59 +0000
Received: by theia.8bytes.org (Postfix, from userid 1000)
	id 5057C447; Thu, 23 Jun 2022 09:32:52 +0200 (CEST)
Date: Thu, 23 Jun 2022 09:32:46 +0200
From: Joerg Roedel <joro@8bytes.org>
To: Matthias Brugger <matthias.bgg@gmail.com>
Cc: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	yong.wu@mediatek.com, will@kernel.org, robh+dt@kernel.org,
	krzysztof.kozlowski+dt@linaro.org, iommu@lists.linux-foundation.org,
	linux-mediatek@lists.infradead.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	krzysztof.kozlowski@linaro.org, miles.chen@mediatek.com
Subject: Re: [PATCH v4 0/5] mtk_iommu: Specify phandles to infracfg and
 pericfg
Message-ID: <YrQXHmFXMVinjDw9@8bytes.org>
References: <20220616110830.26037-1-angelogioacchino.delregno@collabora.com>
 <YrMc2EUBDIxnoWiB@8bytes.org>
 <4023cf19-601c-a2ba-85b0-450fb2df9401@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <4023cf19-601c-a2ba-85b0-450fb2df9401@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220623_003258_490642_FB5E5708 
X-CRM114-Status: UNSURE (   8.65  )
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

Hi Matthias,

On Wed, Jun 22, 2022 at 04:12:47PM +0200, Matthias Brugger wrote:
> I wanted to check if you took also 3 and 4, as these should go through my
> tree. Unfortunately you haven't pushed your tree (yet). In case you took the
> whole series, can you please drop the dts patches. I'll apply them now on my
> v5.19-next/dts64 branch.

Yes, I applied the whole series, will drop patches 3 and 4 now.

Thanks,

	Joerg

