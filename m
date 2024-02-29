Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2CD9AC48BF6
	for <linux-mediatek@archiver.kernel.org>; Thu, 29 Feb 2024 16:20:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=S/AJuI1oSfPQ0LA9yvudELzVMUIIFfUVRY1Cw8WuV1Y=; b=m/ie/fDTT36MSXm3eHXotSWRp5
	RbojPwRr8vwBkJxf4m8pkrUK7xCXOa25wvp3J4CHds7UX2KdL3OyfHCmf7CTfISbTO2sm7n5AH3wt
	ASnAwVLzYD/0ArPbjCzZzQG/Q3RGk4jJ5bNCDTym7DIzEsje74mFc3/YY2A3qROUz8zdOnm5om5x3
	EmTIxpRZtX03nUXRlf+lpKzY6cFQp/NR8RHTNnboa230jK8di3xR4cYwQi8EaOSkhjWGqFi0hDexg
	tCaEuH/w6rPrhAgQrLHcIs3sNUQ1s+62BiJyzm2eKeSs5jBuJo0lWmGzCwTYhPjq6658yvLkbfwjR
	yxuxeHMg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rfj90-0000000EGDp-3voY;
	Thu, 29 Feb 2024 16:20:26 +0000
Received: from madrid.collaboradmins.com ([2a00:1098:ed:100::25])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rfj8x-0000000EGAX-2dIE;
	Thu, 29 Feb 2024 16:20:25 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1709223618;
	bh=EG0AQMhvajtRtj7h37GNmIv5kRJfqZmGy40sXuFridE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=v87BRxfSazLj7SyYlAEei17Nshjcn1N/7j/le0FQKvKyn9t1w2mlSvIJyECKconh2
	 RjSMpnq374Gzpm1BbKC5mPYhUibBC5OlBVlKG61EMd9gx+u2koByF3KXndn6DJKiFe
	 p4rrd6vMfCPyd0zQHf7DItjKcA74Frp1INQEkAyQe+wnB/gdQ3fTel4zHvpDDHzLG2
	 tH1uHCZvZEO5+gJftGYLxRSYWlgJWmm1EvWF/1UYJ3I/yS0jA8UEiML7QyNm6K6+Bf
	 n19mw1ODQiItTyfDgpJUfsS1JagKYT/E+qDprAGxuyAHFnrarbAXXkeY14zyaPwSso
	 +MIfSuYq3vpdQ==
Received: from notapiano (zone.collabora.co.uk [167.235.23.81])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: nfraprado)
	by madrid.collaboradmins.com (Postfix) with ESMTPSA id 643CC3782066;
	Thu, 29 Feb 2024 16:20:15 +0000 (UTC)
Date: Thu, 29 Feb 2024 11:20:13 -0500
From: =?utf-8?B?TsOtY29sYXMgRi4gUi4gQS4=?= Prado <nfraprado@collabora.com>
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: linux-pci@vger.kernel.org, ryder.lee@mediatek.com,
	jianjun.wang@mediatek.com, lpieralisi@kernel.org, kw@linux.com,
	robh@kernel.org, bhelgaas@google.com, p.zabel@pengutronix.de,
	matthias.bgg@gmail.com, linux-mediatek@lists.infradead.org,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	kernel@collabora.com, wenst@chromium.org
Subject: Re: [PATCH v2] PCI: mediatek-gen3: Assert MAC reset only if PHY
 reset also present
Message-ID: <27b54e13-35da-44cd-9f02-a48a84c63e79@notapiano>
References: <20240229092449.580971-1-angelogioacchino.delregno@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20240229092449.580971-1-angelogioacchino.delregno@collabora.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240229_082023_819998_B1AF4D68 
X-CRM114-Status: GOOD (  13.35  )
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

On Thu, Feb 29, 2024 at 10:24:49AM +0100, AngeloGioacchino Del Regno wrote:
> Some SoCs have two PCI-Express controllers: in the case of MT8195,
> one of them is using a dedicated PHY, but the other uses a combo PHY
> that is shared with USB and in that case the PHY cannot be reset
> from the PCIe driver, or USB functionality will be unable to resume.
> 
> Resetting the PCIe MAC without also resetting the PHY will result in
> a full system lockup at PCIe resume time and the only option to
> resume operation is to hard reboot the system (with a PMIC cut-off).
> 
> To resolve this issue, check if we've got both a PHY and a MAC reset
> and, if not, never assert resets at PM suspend time: in that case,
> the link is still getting powered down as both the clocks and the
> power domains will go down anyway.
> 
> Fixes: d537dc125f07 ("PCI: mediatek-gen3: Add system PM support")
> Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>

With this applied resume finally works on MT8195-Tomato! And I no longer see the
errors I mentioned in [1]. So,

Tested-by: Nícolas F. R. A. Prado <nfraprado@collabora.com>

Thanks,
Nícolas

[1] https://lore.kernel.org/all/d8cfb804-e47a-471c-8bc0-e974ee045655@notapiano/

