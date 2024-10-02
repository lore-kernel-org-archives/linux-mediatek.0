Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9C3A6CF3195
	for <linux-mediatek@archiver.kernel.org>; Wed,  2 Oct 2024 06:17:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=KcUp7Q1EE8DtPN8TqQsnPBoWtMEzkhJICn8Doke7XOY=; b=bj/TnXuj2PObgOTXGfj6/7nS6K
	NGLGNFB4swEizyyh7x/XRybv3bTgclwfPCifl02yXk8hsHH42f28joW1pofQjmrirQi5tK6OHfmqW
	nMDDS6l0labwG1eFbtQQ8B66LA+KMtA+XbjbMMAH72sN/jrMGql1NX/Jppde2roDK3E6TOkk9fD/x
	6cnbaRXfpkjd8H9dKdrjbHf+xQL8WlwhAT5HbgxTAX0xP8L8jnrCPoRyO5IX6T7SwFWfaGyJ2YKmo
	1dCDZFlJNNzFq4dXcUImDGt+g+tU5jfpJmQiV5jJ2dd/QyOqtNHEmkAsoTCEHRNzdNo8HyBOlo3IF
	vcpo0DJQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1svsg9-00000004vKc-1NtF;
	Wed, 02 Oct 2024 06:17:41 +0000
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1svset-00000004vBa-0Pie;
	Wed, 02 Oct 2024 06:16:24 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 97E4AA4373B;
	Wed,  2 Oct 2024 06:16:13 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B4B51C4CEC5;
	Wed,  2 Oct 2024 06:16:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1727849781;
	bh=5onFaWDsfjRqVLFgmX8TYa5l4emUjeqXUisKazGF7oo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=AQuUGJeROPqlnHPNwY9eeBEp5vQ3ueIGDxa8kZKc5BQOfWYhXK+CIqQzjzwACM0AV
	 PxbkpoLhl35J/bH5DNCoY9pUldZF61JuJOdcA8TfeK5bFCHZHXniQ0fD8eLsTwRZSs
	 f7PR8BTIlxeT45c8oekmOUp9lP1LDapZo9CrBHkvjyIGbZD7VYS0iuMbJ0F3y6MRnx
	 p38DGVnboFz3KHgIIL3TBhm5i0ZSQiqjRn7vQVV68dDDPrxGeHQvgD/EqDpzLPlBzN
	 jH7FpId3iAw9/XTSUVDQFDSNMOe5Cq/68jvF6XyB/8B/EGW/bG0ywZS4VuFMHhP/eO
	 9hlbqWrxnyOHA==
Date: Wed, 2 Oct 2024 08:16:18 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Fei Shao <fshao@chromium.org>
Cc: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
	Bin Liu <bin.liu@mediatek.com>, Conor Dooley <conor+dt@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>, 
	Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>, 
	Xia Jiang <xia.jiang@mediatek.com>, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, linux-media@vger.kernel.org, linux-mediatek@lists.infradead.org
Subject: Re: [PATCH v2 3/8] dt-bindings: media: mediatek,jpeg: Relax IOMMU
 max item count
Message-ID: <r22z7eehmuprvq67gxekqwsah2mcobfsyhn7xzyyh2gdtjegve@zl32uljxrilx>
References: <20241001113052.3124869-1-fshao@chromium.org>
 <20241001113052.3124869-4-fshao@chromium.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20241001113052.3124869-4-fshao@chromium.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241001_231623_228782_5B9F91CF 
X-CRM114-Status: GOOD (  16.31  )
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

On Tue, Oct 01, 2024 at 07:27:21PM +0800, Fei Shao wrote:
> On MediaTek platforms with Multimedia MMU (M4U), a multimedia hardware
> can be assigned with a local arbiter (LARB) which has a maximum of 32
> ports for MediaTek's IOMMU infrastructure. That means there can be at
> most 32 items in the iommus property in theory.
> 
> Instead of relaxing the max item count every time a newly introduced
> device tree hits the limit, bump the number to 32 as an one-time effort.
> 
> On the other hand, all existing and foreseeable JPEG decoder nodes at
> this point have at least 2 IOMMUs, so set minItems to 2 accordingly.
> 
> Signed-off-by: Fei Shao <fshao@chromium.org>
> ---
> It's not in the upstream tree yet, but the upcoming MT8188 DT will have
> 6 IOMMUs in its JPEG decoder. This patch is to pave the way for that.
> 
> Changes in v2:
> New patch.
> 

I do not see any user of this in this patchset.

Best regards,
Krzysztof


