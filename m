Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 12F34C48BEB
	for <linux-mediatek@archiver.kernel.org>; Wed, 14 Feb 2024 09:03:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=H3r23hFB8Hu62aWLOB2ekBZdGWf/39jWGP2Qo+ffKWw=; b=YhZKYE/lmeeawoR1XoXcgZOKQx
	CQO6Wjvua6FWA/ep15siZDCqy+Y/twISQ3B2Cgj2CMOBF2fJdzqrRbHONlbFiZTyOBVW30HpzEIl0
	eSh+sJkJqQbu4TuJy9a7VYL6HqKep+Q7co8ARCdVHCvjWio2ZHoV+3nSfX1jbqZFSg1SuQcxfdD91
	vKGDa8y4YCUmE4OKZNH0a/5JWioDCg1ZNokh4QwM7es6MyWtlkMu9lkegjOoQcJ7tyngVuSfILb/s
	w2N6VN8c1+6Dg+PM6/ew6f00D3E0pDgIj7AiEeVIxCPO5+fEesinEGYIUzzDF9s+6p9T82SJazqVX
	kv6bqEFg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1raBB0-0000000CD1P-1mhn;
	Wed, 14 Feb 2024 09:03:34 +0000
Received: from madrid.collaboradmins.com ([46.235.227.194])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1raBAw-0000000CCzo-3FBa;
	Wed, 14 Feb 2024 09:03:32 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1707901408;
	bh=IkMSx2GMsosJsuqeMCf9O8BI8a8CA/8JrvnoKOrX2hY=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=X5rdKeXPeqAiyx6zTZSRHE9cio2suhjrDXXa3EKLg6fs5OJQQBTxzSS4xVRRG6kUi
	 aSxL96RzvvF3u+Vyol2XGDkzF78R8k/EJrtlevDmoMA0zn+pOk1En1CTs25BEfz0c+
	 JoPYq+x/n5GY4mghF7Pyj1kjwntdmBGgwix/7PAQ8uyBJj/GP5D3+5thYaKdD0JheH
	 NxNfsZoqCccbX3RoaTE3jEEs1AiSM7LFKEaBPHw/10X2oKX5eiWIdrx22jdLxBa+hK
	 UcPmIx++Zet9sP1+n2z8xElSAp85RldV5zKM4z1f0h3jxj1mdvXQEJH02010efGkmL
	 hEQhqPHsLEdPQ==
Received: from [100.113.186.2] (cola.collaboradmins.com [195.201.22.229])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madrid.collaboradmins.com (Postfix) with ESMTPSA id A26113781FD9;
	Wed, 14 Feb 2024 09:03:27 +0000 (UTC)
Message-ID: <6fea6cd3-031b-4d5a-8bba-f01f6afa12b3@collabora.com>
Date: Wed, 14 Feb 2024 10:03:26 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/2] arm64: dts: mediatek: mt8186: Add missing xhci
 clock to usb controllers
Content-Language: en-US
To: =?UTF-8?B?TsOtY29sYXMgRi4gUi4gQS4gUHJhZG8=?= <nfraprado@collabora.com>,
 Matthias Brugger <matthias.bgg@gmail.com>
Cc: Chen-Yu Tsai <wenst@chromium.org>,
 Eugen Hristev <eugen.hristev@collabora.com>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Allen-KH Cheng <allen-kh.cheng@mediatek.com>, kernel@collabora.com,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org
References: <20240213-mt8186-ssusb-domain-clk-fix-v2-0-1f981d35f3fd@collabora.com>
 <20240213-mt8186-ssusb-domain-clk-fix-v2-2-1f981d35f3fd@collabora.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <20240213-mt8186-ssusb-domain-clk-fix-v2-2-1f981d35f3fd@collabora.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240214_010330_988462_244E0B8F 
X-CRM114-Status: GOOD (  12.44  )
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

Il 13/02/24 16:02, Nícolas F. R. A. Prado ha scritto:
> The mtu3 usb controllers don't list the xhci clock, though they require
> it, and thus rely on the bootloader leaving it on in order to work.
> 
> When booting with the upstream arm64 defconfig, the usb controllers will
> defer probe until modules have loaded since they have an indirect
> dependency on CONFIG_MTK_CMDQ, which is configured as a module. However
> at the point where modules are loaded, unused clocks are also disabled,
> causing the usb controllers to probe without the xhci clock enabled and
> fail to probe:
> 
> mtu3 11201000.usb: clks of sts1 are not stable!
> mtu3 11201000.usb: device enable failed -110
> mtu3 11201000.usb: mtu3 hw init failed:-110
> mtu3 11201000.usb: failed to initialize gadget
> mtu3: probe of 11201000.usb failed with error -110
> 
> (and same for the one at 11281000)
> 
> Add the missing clock for the usb controllers so that they can
> successfully probe without relying on the bootloader state.
> 
> Fixes: f6c3e61c5486 ("arm64: dts: mediatek: mt8186: Add MTU3 nodes")
> Signed-off-by: Nícolas F. R. A. Prado <nfraprado@collabora.com>

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>


