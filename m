Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6A2D8CEFC5D
	for <linux-mediatek@archiver.kernel.org>; Wed,  9 Oct 2024 10:18:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=UDR43C5WdkhS1tDBLCfjlt4o2mAFTyqPTkEf7zO+TBQ=; b=SdSKMZkbpCa7oYvgshDYdIrHwi
	IZOk+Xm5g1eJSnIJYtDGn+E2o1ElnOSaUYXM/B9pLvZrzMhoLgBGPnuha+2Nx/jy3kmIXAbntNsNQ
	aMWF9i4NxNtUn7VcjFWcBh5fisJylitLII/GiEX6luRtDOZaY3AEyOnD5H7Nf2r6rs9JHwg+QS0fH
	4as5Cv10hWrULvVob+01+Mqo5ef4uI4EMb9hjt/dkQs9E+kBLvg7eD7cKbVKzfe8mT0Dgtu5giU5/
	R1o7iQls5sxxqOMkv5Va/qYRVL/BZC7EHhiF+OU3bLPV0k2r6+z26qhrCsjWvXpZqTPlXFKxz1lSI
	a5tYbyvg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1syTlw-00000008qjT-1niQ;
	Wed, 09 Oct 2024 10:18:24 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1syTjY-00000008qBL-36wu;
	Wed, 09 Oct 2024 10:15:57 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 73F2A5C5EDD;
	Wed,  9 Oct 2024 10:15:51 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 38614C4CEC5;
	Wed,  9 Oct 2024 10:15:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1728468955;
	bh=oJArf3enTGWI4lzclyQMV/yzQ9goQcfcnoHHYndnucI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=bQlbSrVhseLPe3QZ/N+IXeO8Y7LGIQ0puUnCn5fIioS+vHeFwut1BjP9AtsBj76HT
	 vvtr/r+nT/TJsWT7daiR3gHLG39/0BFEZI6in7YM8Kl5yO+JxSHWqsUMfMpM2Ubpvk
	 XGyukpAgZEPtsF4aIfJuwCXSaHvCHClIFF73ldWmEV16eWieDTaWmx+WtLx8gGG7/T
	 hT88HZNNYZQvbkyF+9jCusNSkJRYhTgfgSHioxsFItQ4yJG4wC+Ol/7Axpp6FxerW1
	 tookHvRe+TK9t1Yu2+JmrN2FyK3yaMrkUQ7GzDXVUEWK6biV7YJ3mz35n2Pet+jY4f
	 LygVL/7SlXTNA==
Date: Wed, 9 Oct 2024 11:15:49 +0100
From: Lee Jones <lee@kernel.org>
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
	matthias.bgg@gmail.com, eddie.huang@mediatek.com,
	sean.wang@mediatek.com, alexandre.belloni@bootlin.com,
	sen.chu@mediatek.com, macpaul.lin@mediatek.com,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org, linux-rtc@vger.kernel.org,
	kernel@collabora.com
Subject: Re: [PATCH v1 1/3] dt-bindings: mfd: mediatek: mt6397: Add
 start-year property to RTC
Message-ID: <20241009101549.GB276481@google.com>
References: <20240923100010.97470-1-angelogioacchino.delregno@collabora.com>
 <20240923100010.97470-2-angelogioacchino.delregno@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20240923100010.97470-2-angelogioacchino.delregno@collabora.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241009_031556_845689_83A14CF8 
X-CRM114-Status: GOOD (  13.00  )
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

On Mon, 23 Sep 2024, AngeloGioacchino Del Regno wrote:

> Enable evaluating the start-year property to allow shifting the
> RTC's HW range.
> 
> Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
> ---
>  Documentation/devicetree/bindings/mfd/mediatek,mt6397.yaml | 2 ++

No such file.

>  1 file changed, 2 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/mfd/mediatek,mt6397.yaml b/Documentation/devicetree/bindings/mfd/mediatek,mt6397.yaml
> index 953358bc997a..a83cc35f51f1 100644
> --- a/Documentation/devicetree/bindings/mfd/mediatek,mt6397.yaml
> +++ b/Documentation/devicetree/bindings/mfd/mediatek,mt6397.yaml
> @@ -71,6 +71,8 @@ properties:
>                    - mediatek,mt6366-rtc
>                - const: mediatek,mt6358-rtc
>  
> +      start-year: true
> +
>      required:
>        - compatible
>  
> -- 
> 2.46.0
> 

-- 
Lee Jones [李琼斯]

