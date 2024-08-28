Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4798FC54FB3
	for <linux-mediatek@archiver.kernel.org>; Wed, 28 Aug 2024 13:13:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=EEKIHCsXjQpkv8u502Z4wz78Kj7zxngnN7Dcy4Ztsak=; b=bmC9abrIE+2/9YKMXb8d2vgFgH
	aF/ZhJ28/q4KmliO91gbPnwcsthrvi5KIUCI51mfCQTMS/+BJ6CcT5MKWBpIPyeHrYP+KEAu+T4PT
	RcL+lhnOH9WoleOIFEjoKhaMHhNihwrRKaKgX17U4n4m+zyQRBqPe3xT4uRJeUDwPqJq9x0rw2Nfz
	402SJn//t65CbX9kMv9voSVK3T97UbF2NoIfHeTjxLA/LDrjjIKgvh0SHej318OrIQo/5NjZ6JnBW
	fRYVNNuiAseltHbJSPNiR1GrsM4tRdQ3uzu7uhOqR1aR5cIW10IqG2IAxxf4ktwzfHq8vukxY9pLh
	+2NU7SLA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sjIUk-0000000FUBQ-0gTC;
	Wed, 28 Aug 2024 13:13:54 +0000
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sjITO-0000000FTvd-46An;
	Wed, 28 Aug 2024 13:12:32 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 31088A401E4;
	Wed, 28 Aug 2024 13:12:22 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9B061C515AF;
	Wed, 28 Aug 2024 13:06:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1724850377;
	bh=EAdjClXapxDjpgnzaErsxac7Ms6f3DmQPAtiSikh0mc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=rqhDxg7OLfyXhZJg0/6GI7L1rn3nyBCEOpEGcoT2jrkx0uP1NuGUz2vUSz7/2ibPR
	 Ptl++7k3/8sp8CaT4JREMDaXXKGht7roD/tgfXKeETkGjblPM2dcrOOVdRqJXVLgki
	 RaLDMoyhCFMe6v36FH+576lIHTDV9XWY52FjTFNgKfz28UZwRR4OCM3CzmNZWXqWPc
	 MKFWpnoLOwxrkY6r5F/mn58yKtBkpxQKI96rssqDvKMxobXI3jssuYuberTXok3vlr
	 6JF2JjO8zp+qkmx+h6VcdIU9yri0fg/P39bBAONkKLFfZ0AMSRHtC3r7dHnCyXCgXj
	 mFY/AjrUg421A==
Date: Wed, 28 Aug 2024 18:36:13 +0530
From: Vinod Koul <vkoul@kernel.org>
To: Amit Vadhavana <av2082000@gmail.com>
Cc: Dan Carpenter <dan.carpenter@linaro.org>, dmaengine@vger.kernel.org,
	linux-kernel@vger.kernel.org, ricardo@marliere.net,
	linux-kernel-mentees@lists.linux.dev, skhan@linuxfoundation.org,
	olivierdautricourt@gmail.com, sr@denx.de,
	ludovic.desroches@microchip.com, florian.fainelli@broadcom.com,
	bcm-kernel-feedback-list@broadcom.com, rjui@broadcom.com,
	sbranden@broadcom.com, wangzhou1@hisilicon.com, haijie1@huawei.com,
	fenghua.yu@intel.com, dave.jiang@intel.com, zhoubinbin@loongson.cn,
	sean.wang@mediatek.com, matthias.bgg@gmail.com,
	angelogioacchino.delregno@collabora.com, afaerber@suse.de,
	manivannan.sadhasivam@linaro.org, Basavaraj.Natikar@amd.com,
	linus.walleij@linaro.org, ldewangan@nvidia.com,
	jonathanh@nvidia.com, thierry.reding@gmail.com,
	laurent.pinchart@ideasonboard.com, michal.simek@amd.com,
	Frank.Li@nxp.com, n.shubin@yadro.com, yajun.deng@linux.dev,
	quic_jjohnson@quicinc.com, lizetao1@huawei.com, pliem@maxlinear.com,
	konrad.dybcio@linaro.org, kees@kernel.org, gustavoars@kernel.org,
	bryan.odonoghue@linaro.org, linux@treblig.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rpi-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	linux-actions@lists.infradead.org, linux-arm-msm@vger.kernel.org,
	linux-tegra@vger.kernel.org
Subject: Re: [PATCH V2] dmaengine: Fix spelling mistakes
Message-ID: <Zs8gxcOa8/ja5wDW@vaman>
References: <20240817080408.8010-1-av2082000@gmail.com>
 <b155a6e9-9fe1-4990-8ba7-e1ff24cca041@stanley.mountain>
 <CAPMW_rLPN1uLNR=j+A7U03AHX5m_LSpd1EnQoCpXixX+0e4ApQ@mail.gmail.com>
 <070cc3e2-d0db-4d50-9a64-6a16d88b30df@stanley.mountain>
 <CAPMW_rJi46_2Ho6KNS9NK0kbfc3ujrx-EJ3586wf0u7vq2kUog@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAPMW_rJi46_2Ho6KNS9NK0kbfc3ujrx-EJ3586wf0u7vq2kUog@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240828_061231_104337_DF889421 
X-CRM114-Status: UNSURE (   9.01  )
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

On 27-08-24, 21:47, Amit Vadhavana wrote:

> Hi All,
> 
> I wanted to follow up on the DMA patch that I submitted on 17 Aug.
> Kees Cook has already reviewed it. Have you all had a chance to review
> it as well?
> Please let me know if any additional changes or updates are needed.

Oddly enough, I dont see that in my list, can you please repost

-- 
~Vinod

