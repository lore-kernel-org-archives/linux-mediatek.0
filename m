Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9CC67C4332F
	for <linux-mediatek@archiver.kernel.org>; Thu, 29 Sep 2022 15:32:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=vN9B6R2lonPA9JS7ZvIotAGVWtxQa5ASwO9kPF56ZbI=; b=NjwnSm9U3w8Hng2CLMMrJX9CRU
	o8+k+09M0G3tDv41almIc4wk4nqMsw+0iPv0BD12og+GniHZuXeHCVh+cGjJwxfjVSbALbSypWdWW
	nftdTcf9sDE0CeS4/hRn4C9FRoi/xYFCZ+0XQFZ0fPWF7Ad1x4XJGfayDrf8BN+2qqFruWAWBCPtN
	pVAcDjT/0Q2C+uDS3ezFFGX6GzuHNPWHfYBGO/Z2ELKUVtJUZjAXf4VDu9a+iH6KX5WeiTAowvNMB
	M76/8mg+8CAi7GPOZzAzVHAYQnV9PGBp1BMLG03/aFc2WJdojUmOfqUIGpKmvYIhusIsqshL1Pcjj
	SmT8t5eg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1odvWH-003sgS-Qi; Thu, 29 Sep 2022 15:32:13 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1odvW6-003sd2-M8; Thu, 29 Sep 2022 15:32:03 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 31AD361950;
	Thu, 29 Sep 2022 15:32:02 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CA6FEC433C1;
	Thu, 29 Sep 2022 15:32:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1664465521;
	bh=atja4xkXu+uR+lUBfnZv2ZFe2oiFXJBckvWkbvvGdiM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=bjknexfIwz9R9IwpMjTpPtg2HUEN2U4sf2JRVvV/cSckiyxHYUXlv0reJpi/Jn4L1
	 HCR730m3yXNu5qYsZeia7arZw9+KQbizyoLds/mTE8fpXPIN4WebBrHaIVH+x9yanU
	 Zev/t9Xrg7jbqqNMLig6dMiZJfuOX4NDVpmRmQ3TaSU67CIxTQo4FHfByhaSrFiDy2
	 7MgsFoCVEjWk7teyzRjCrbibDV/dEl2hEokDaQCbUdEaaRTZdPybmvMs5EhEwzyv1w
	 Z67/0wYv+2itqT2qM2D6ZwAogCjPjqqnwi4uWBX3aFG/OSJNWSPRWS3jBz/JyRFz0E
	 ZDnKqMZLyFIEg==
Date: Thu, 29 Sep 2022 21:01:56 +0530
From: Vinod Koul <vkoul@kernel.org>
To: Colin Ian King <colin.i.king@gmail.com>
Cc: Chun-Kuang Hu <chunkuang.hu@kernel.org>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Chunfeng Yun <chunfeng.yun@mediatek.com>,
	Kishon Vijay Abraham I <kishon@ti.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	dri-devel@lists.freedesktop.org, linux-mediatek@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org, linux-phy@lists.infradead.org,
	kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] phy: phy-mtk-dp: make array driving_params static const
Message-ID: <YzW6bABCoDzTaIBD@matsya>
References: <20220929130147.97375-1-colin.i.king@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220929130147.97375-1-colin.i.king@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220929_083202_776746_E4275A41 
X-CRM114-Status: UNSURE (   6.78  )
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

On 29-09-22, 14:01, Colin Ian King wrote:
> Don't populate the read-only array driving_params on the stack but instead
> make it static const. Also makes the object code a little smaller.

Applied, thanks

-- 
~Vinod

