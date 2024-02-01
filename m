Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 218B2C4828D
	for <linux-mediatek@archiver.kernel.org>; Thu,  1 Feb 2024 22:17:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=p4ydCgF+Mk00WqOspH++OZqGjJ8Vg8zSdb74qHGVtoE=; b=0PszF+uCVwaUaBZI9h2EgLiyni
	NIjFZ/CjJ27I29zYQhsOSBNaFmwLgv8cXYg4/YW8oc8ukElHHzRy9VsJYn3sK5mnyaUYLhb2KjDz3
	Ag+ke7kq/z0ai/6Ytp+/Iy6j7ckAGTkPxUVBVDReq+fr/9rL4aH6tTLYCOgLtY95sE2KonvpE9z1m
	uaK0t9xp7030baKQk8Q8MMnmH9C3S9Lno1TkIsvU+EATH/rKuqwgknBkoH5j2XJ3gdS4JAAfzUNxP
	tpPXuOY1jRe2eQYyrr636k1pBXk7Oyi1CFllhZw+orY82cHD47D+8CZs+yuOxWCsCqTKDEMY05xTk
	QYfKHK4A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rVfMk-00000009Vra-2nVi;
	Thu, 01 Feb 2024 22:17:02 +0000
Received: from sin.source.kernel.org ([2604:1380:40e1:4800::1])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rVfMh-00000009Vqg-00nv;
	Thu, 01 Feb 2024 22:17:00 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id 569A7CE28A8;
	Thu,  1 Feb 2024 22:16:57 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id ACE52C433C7;
	Thu,  1 Feb 2024 22:16:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1706825816;
	bh=cuWu+ZnwEeDB3jYUYTTRe0UH9c6SmZiHQzhLc1hdnYM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=iJwm95iredNZf01FKKqw1K8Cve6weFz5cAOoDZKVoWe3PpexUzoGPjJafD2pGbkGw
	 eSEIrmo/GHdvyOSQ8oqaYHJagePer7h4jeWCFcLzrdSiR+NZQtF7X69fr3fBc2bo9d
	 kulDLY8Kb43B7O9lIfuaOA8dxbgBM141x3/9YfJtOJ2uDaMN1G13Dk//xj7FQkbrEQ
	 PXKTFsXVU0Tcv4J3fY2V5w4Lglh/CMUI8bgD307AaufIO7S6Stan4GILuEx+9xRapX
	 742IhYAMMkBEGPl9+wv/uNc3ltlBirIMVY5YaxuoWdmIcNDXOjJeSG1SzUHPwX0Smm
	 BVgzx6ULRUBhQ==
Date: Thu, 1 Feb 2024 15:16:54 -0700
From: Nathan Chancellor <nathan@kernel.org>
To: Ricardo Ribalda <ribalda@chromium.org>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>,
	Nick Desaulniers <ndesaulniers@google.com>,
	Bill Wendling <morbo@google.com>,
	Justin Stitt <justinstitt@google.com>, Mike Isely <isely@pobox.com>,
	Tiffany Lin <tiffany.lin@mediatek.com>,
	Andrew-CT Chen <andrew-ct.chen@mediatek.com>,
	Yunfei Dong <yunfei.dong@mediatek.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
	llvm@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Subject: Re: [PATCH 3/3] media: mediatek: vcodedc: Fix
 Wcast-function-type-strict warnings
Message-ID: <20240201221654.GC2240065@dev-arch.thelio-3990X>
References: <20240128-fix-clang-warnings-v1-0-1d946013a421@chromium.org>
 <20240128-fix-clang-warnings-v1-3-1d946013a421@chromium.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240128-fix-clang-warnings-v1-3-1d946013a421@chromium.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240201_141659_389486_6EB8AC07 
X-CRM114-Status: GOOD (  23.99  )
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

On Sun, Jan 28, 2024 at 02:12:22AM +0000, Ricardo Ribalda wrote:
> Building with LLVM=1 throws the following warning:
> drivers/media/platform/mediatek/vcodec/common/mtk_vcodec_fw_vpu.c:38:32: warning: cast from 'mtk_vcodec_ipi_handler' (aka 'void (*)(void *, unsigned int, void *)') to 'ipi_handler_t' (aka 'void (*)(const void *, unsigned int, void *)') converts to incompatible function type [-Wcast-function-type-strict]
> 
> Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>

I am not positive because I don't have any hardware to test this driver
but I suspect this patch is just hiding the warning without actually
addressing the issue that it is pointing out. If handler is called
through vpu_ipi_register() indirectly (which it obviously is if it is
being passed down), there will be a CFI failure because the type of
mtk_vcodec_ipi_handler is not the same as ipi_handler_t, as the comment
mentions.

Has this seen testing on real hardware with kCFI?

> ---
>  drivers/media/platform/mediatek/vcodec/common/mtk_vcodec_fw_vpu.c | 6 ++++--
>  1 file changed, 4 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/media/platform/mediatek/vcodec/common/mtk_vcodec_fw_vpu.c b/drivers/media/platform/mediatek/vcodec/common/mtk_vcodec_fw_vpu.c
> index 9f6e4b59455d..781a0359afdc 100644
> --- a/drivers/media/platform/mediatek/vcodec/common/mtk_vcodec_fw_vpu.c
> +++ b/drivers/media/platform/mediatek/vcodec/common/mtk_vcodec_fw_vpu.c
> @@ -33,9 +33,11 @@ static int mtk_vcodec_vpu_set_ipi_register(struct mtk_vcodec_fw *fw, int id,
>  	 * The handler we receive takes a void * as its first argument. We
>  	 * cannot change this because it needs to be passed down to the rproc
>  	 * subsystem when SCP is used. VPU takes a const argument, which is
> -	 * more constrained, so the conversion below is safe.
> +	 * more constrained, so the conversion below is safe. We use the void
> +	 * casting, to convince clang with -Wcast-function-type-sctrict that
> +	 * this is safe.
>  	 */
> -	ipi_handler_t handler_const = (ipi_handler_t)handler;
> +	ipi_handler_t handler_const = (ipi_handler_t)((void *)handler);
>  
>  	return vpu_ipi_register(fw->pdev, id, handler_const, name, priv);
>  }
> 
> -- 
> 2.43.0.429.g432eaa2c6b-goog
> 

