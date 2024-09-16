Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3850DC3ABB2
	for <linux-mediatek@archiver.kernel.org>; Mon, 16 Sep 2024 17:12:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=wDmKI0hptFm/NKvCZoGXYQBg1gPn6MbbFnWzygvJU1s=; b=RWCImaX/gwHBk1lKDj6fBqDZp4
	YdwK1o40BQH2+DLqFrVbt7sAE01/8+dMo7m4um5LZ+ZO0NYe0s0Or6IMw7zZYdnvVDelwOSICFXD9
	Csi9oC6ukGTKTAXY3HnIL8hB5S8b0SIST7CFszM2LbNlaNWHPPEXXia4PDFpzzFZ9f7/BXnaQaNvC
	EKWnjkKQBVfxkhavs5w9x3xHTrHqkM0jsZjB8xl9T/oTJ/h0ikYoMutLp5eKGWhcqcIdFPqXlbvAk
	Uv1HKpQTz6GbhQ+TyG68zJU/uWQQumePkwpqB0681QOhTlPBO1UmPFd/6RoaZQpVfE9SmbNL2shwu
	WK06TmhA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1sqFGs-00000004Ymo-3Sha;
	Mon, 16 Sep 2024 17:12:18 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1sqFFm-00000004Yde-0TEI;
	Mon, 16 Sep 2024 17:11:12 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id A83C65C5C6C;
	Mon, 16 Sep 2024 17:11:05 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DECC5C4CEC4;
	Mon, 16 Sep 2024 17:11:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1726506669;
	bh=At1Pr7PthC5cR3eEm4LyYtKE8cs9rEAJIqeU0f1G/fc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=gpq59S3gZdEPOMG+cSrM2MZyeEgLgRN00IshBx+pgdBrAHOEdij6WUJlapjW7nfRy
	 S8j3B+V4QSvhZjy4haX6D1fs+l5Q6ZEOQS/o/8/YqDIT0uTUMX4WVzqbH365RyZmhL
	 RIeWbNwmnhXeaQFUzKc0DQs/E5DNljCxJlFgw35aSLuEpV+JvXwZoZF0ElB+3ODHOG
	 L43MbAlf4pLUsccqgxId18XQdg7yawyEEZM4jwhqPjQAZLSAGD3n6DZOIK/IALKzjz
	 2BuPwLHzeyZja8n/AB50Vt93p4imZxtA/kKdoMEjl2iWDVBQ4lR74fvmEnM7PpbtKA
	 T0ag2z9rV9Ujg==
Date: Mon, 16 Sep 2024 12:11:07 -0500
From: Rob Herring <robh@kernel.org>
To: Rohit Agarwal <rohiagar@chromium.org>
Cc: chunkuang.hu@kernel.org, krzk+dt@kernel.org, ck.hu@mediatek.com,
	linux-mediatek@lists.infradead.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	kernel test robot <lkp@intel.com>
Subject: Re: [PATCH] dt-bindings: display: mediatek: dpi: Add power domain
 for MT8195 DP_INTF
Message-ID: <20240916171107.GA605353-robh@kernel.org>
References: <20240911071722.558960-1-rohiagar@chromium.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240911071722.558960-1-rohiagar@chromium.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240916_101110_241232_2DB93827 
X-CRM114-Status: GOOD (  14.57  )
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

On Wed, Sep 11, 2024 at 07:17:21AM +0000, Rohit Agarwal wrote:
> Add power domain binding for MT8195 DP_INTF that resolves the following
> error and many more similar ones:
> 
> arch/arm64/boot/dts/mediatek/mt8195-cherry-dojo-r1.dtb: dp-intf@1c113000:
> power-domains: False schema does not allow [[55, 18]]
> 
> Reported-by: kernel test robot <lkp@intel.com>
> Closes: https://lore.kernel.org/oe-kbuild-all/202409102119.AYvaTjUi-lkp@intel.com/

Fixes?

> Signed-off-by: Rohit Agarwal <rohiagar@chromium.org>
> ---
>  .../devicetree/bindings/display/mediatek/mediatek,dpi.yaml       | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/Documentation/devicetree/bindings/display/mediatek/mediatek,dpi.yaml b/Documentation/devicetree/bindings/display/mediatek/mediatek,dpi.yaml
> index 3a82aec9021c..07acc8a76bfc 100644
> --- a/Documentation/devicetree/bindings/display/mediatek/mediatek,dpi.yaml
> +++ b/Documentation/devicetree/bindings/display/mediatek/mediatek,dpi.yaml
> @@ -89,6 +89,7 @@ allOf:
>                  - mediatek,mt6795-dpi
>                  - mediatek,mt8173-dpi
>                  - mediatek,mt8186-dpi
> +                - mediatek,mt8195-dp-intf

mt8183 is also missing. There's a patch[1] to fix it, but it's wrong 
given the recent changes. It would be best to fix both in one 
patch/series as 2 separate patches will have conflicts.

Rob


[1] https://lore.kernel.org/all/20240912144430.3161717-2-treapking@chromium.org/

