Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 121D2C44506
	for <linux-mediatek@archiver.kernel.org>; Wed, 21 Jan 2026 18:44:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=g0WcciRBfyEFDZIxX9I62PodZ8FghniZQg3bI5H+tDc=; b=TF2yuPc2Q6JDp+YKpGKW8TjKW1
	kkyI9heQL42mZHoRiMAGv+7nFtguU9dK8Kp3mOwRuPRjj/s7FbB4tacUlAMH71l/z4X6bEHS+AeFc
	U6WcffSCwPt4ClVJyZa/dhPEDnlNkELincI283CXtv87Imhdnb4r+u75pjuqcVG7cTxEHYzTo6rD3
	ftTBarWT20Q+RfGEtK21UmJMHI9ZV898rI4Dar6kv0lliB8wD9D3sh5CcetBDkwf6oiNLWA7HXrb4
	b7az7thIoAN1n3F892/Xpq8NKbzRN8Vo0klDgomhkY6rTc/8KwKKaoHyqe1qGTzJZC+2dvaV5SznM
	iwdm+cQg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vidCH-00000005wTy-0Wxv;
	Wed, 21 Jan 2026 18:44:53 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vidCF-00000005wSh-0EDK;
	Wed, 21 Jan 2026 18:44:52 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id A51A14412B;
	Wed, 21 Jan 2026 18:44:50 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 49FF1C4CEF1;
	Wed, 21 Jan 2026 18:44:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1769021090;
	bh=DFfruDUN0GCaBJxNrq8hR1q+b44uiIfw8LCXXTbIN78=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=beoogyAianYQ4cEs9nVCQWnpaQVBpKTAoci6sihl7+xqJdmzLbuKK657djX4EvbD1
	 IlBx7EPOXMKE3nzSGuM76osQNJfk+7gtHtifPWnRuLtFMdB9De1HrBQVgoiNf1/vCy
	 2wGkbWwK2hgxVBNQGhwKdeXWRSgW140drEq4TDfv9h2hVd8JkpBjIvokIlgSrX2mZT
	 k6w7IIPNMVZTz21hEb8pIXZrQ1pC88stCoio3FQfEbfKhZ0sxKhHFd4GJ9uCy2/7ym
	 aCwDgsYUlIZH9MXq6E1rz7f2d56ouI3+CGShdPtoiQu2QuNFHDuX2A7jalbdOZilYx
	 LMI55VtzFai0A==
Date: Wed, 21 Jan 2026 12:44:48 -0600
From: Rob Herring <robh@kernel.org>
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: linux-mediatek@lists.infradead.org, krzk+dt@kernel.org,
	conor+dt@kernel.org, mturquette@baylibre.com, sboyd@kernel.org,
	matthias.bgg@gmail.com, ulf.hansson@linaro.org,
	linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-pm@vger.kernel.org, kernel@collabora.com
Subject: Re: [PATCH 5/5] arm64: dts: mediatek: mt7622: Add missing power
 domain to afe
Message-ID: <20260121184448.GC3842411-robh@kernel.org>
References: <20260113110012.36984-1-angelogioacchino.delregno@collabora.com>
 <20260113110012.36984-6-angelogioacchino.delregno@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260113110012.36984-6-angelogioacchino.delregno@collabora.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260121_104451_123941_4F9C5D40 
X-CRM114-Status: GOOD (  10.65  )
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

On Tue, Jan 13, 2026 at 12:00:12PM +0100, AngeloGioacchino Del Regno wrote:
> Add the missing MT7622_POWER_DOMAIN_AUDIO to the audio controller
> node to fix a dtbs_check warning and to make sure that the AFE is
> indeed powered on when needed.
> 
> Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
> ---
>  arch/arm64/boot/dts/mediatek/mt7622.dtsi | 1 +
>  1 file changed, 1 insertion(+)

Acked-by: Rob Herring (Arm) <robh@kernel.org>

