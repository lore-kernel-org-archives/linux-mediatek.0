Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AC32CD3E18D
	for <linux-mediatek@archiver.kernel.org>; Fri, 18 Oct 2024 22:46:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=lVDDMatjVQo0bJ2yjgjIZgyTQvFvorLOAFdMcArZv8U=; b=mVQxAQnznBWX/700un1yzT+NSt
	nO8k615XCgxc6cYJ7LAbBLOSLOybsYkiFLA+w3RMDieDhIsBHWnlbhB0u7GmvkyQqWOmJVAWYO6nW
	CHv//HKXxin20Sq9KaZFi/ozAEVtyiV9tKC24IXjRfzxKKPbWM4cGr5i1AkgRBO1oVuQwt8gETSRg
	vEK98zVyzUs5RpTnHYecwIISHo7gHYJBjHpLhDjjp8B7bORuuVpRmksgJJOY+VnJE60R+9uS8PwjS
	DTh3gvaNV4XJAJT3CVXbw8KmTkVS+HAA6c2b2KL8ZzszB2S+E441XV7ZUGYofjHTQP3P9N1CLkwlS
	O6Aa3nvQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t1vjy-00000002ChZ-2YRz;
	Fri, 18 Oct 2024 22:46:38 +0000
Received: from nyc.source.kernel.org ([147.75.193.91])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t1viU-00000002CaR-1kgo;
	Fri, 18 Oct 2024 22:45:08 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 9C1A9A44BD2;
	Fri, 18 Oct 2024 22:44:56 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 41383C4CEC3;
	Fri, 18 Oct 2024 22:45:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1729291505;
	bh=yucMMFbBngW7rNMpBtKpCuJNeeP2d7/ic+xFnd1C0WI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=DTmfFDeZ3bGoVHhmD9SeYLeIwNc6mET1F2a/4CpWi6yQHDZk6Fn+GGiuMwJ7lLqx0
	 g5876ZyZpALt5xlzfdXheu4DyhQ9OsnFs1RNmXufcA5q4KVUjlDRoMN2h7+AAqxtHR
	 O9LLAeKgJ3JwuSTXP+dCHqvdOHax32Hxt4X6uAqIe4t7W9FX5lUVEAffy2yjKHC0mm
	 NgpNjh5D1+gJRsKo5LtsMPb8ClZNLNmfpYAYTD94G5ebJaYAK//UMsUgqUGtuTzj7A
	 tYF2O6X4gDms7f3gc+uNUAJgXIWa4Xzcm4LLoaQk+/ogKqQDBnFxhe/pWinlJLq1GN
	 3FCW/tfpv1oeQ==
Date: Fri, 18 Oct 2024 15:45:02 -0700
From: Nathan Chancellor <nathan@kernel.org>
To: Arnd Bergmann <arnd@kernel.org>
Cc: Tiffany Lin <tiffany.lin@mediatek.com>,
	Andrew-CT Chen <andrew-ct.chen@mediatek.com>,
	Yunfei Dong <yunfei.dong@mediatek.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Arnd Bergmann <arnd@arndb.de>,
	Nick Desaulniers <ndesaulniers@google.com>,
	Bill Wendling <morbo@google.com>,
	Justin Stitt <justinstitt@google.com>,
	Hans Verkuil <hverkuil@xs4all.nl>,
	Sebastian Fricke <sebastian.fricke@collabora.com>,
	Benjamin Gaignard <benjamin.gaignard@collabora.com>,
	linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org, llvm@lists.linux.dev
Subject: Re: [PATCH] media: mediatek: vcodec: mark
 vdec_vp9_slice_map_counts_eob_coef noinline
Message-ID: <20241018224502.GC2635543@thelio-3990X>
References: <20241018151448.3694052-1-arnd@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241018151448.3694052-1-arnd@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241018_154506_593106_EDDB279B 
X-CRM114-Status: GOOD (  26.47  )
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

On Fri, Oct 18, 2024 at 03:14:42PM +0000, Arnd Bergmann wrote:
> From: Arnd Bergmann <arnd@arndb.de>
> 
> With KASAN enabled, clang fails to optimize the inline version of
> vdec_vp9_slice_map_counts_eob_coef() properly, leading to kilobytes
> of temporary values spilled to the stack:
> 
> drivers/media/platform/mediatek/vcodec/decoder/vdec/vdec_vp9_req_lat_if.c:1526:12: error: stack frame size (2160) exceeds limit (2048) in 'vdec_vp9_slice_update_prob' [-Werror,-Wframe-larger-than]
> 
> This seems to affect all versions of clang including the latest (clang-20),
> but the degree of stack overhead is different per release.
> 
> Marking the function as noinline_for_stack is harmless here and avoids
> the problem completely.
> 
> Signed-off-by: Arnd Bergmann <arnd@arndb.de>
> ---
> I have not come to a conclusion on how exactly clang fails to do this
> right, but can provide the .config and/or preprocessed source files
> and command line if we think this should be fixed in clang.

I think this might be related to the issue I reported to upstream LLVM,
as a regression within the past couple of weeks:

https://github.com/llvm/llvm-project/issues/111903

If this is a reasonable workaround, it might be worth doing but I will
probably wait until after the LLVM Developers Meeting next week to ping
the thread to have a better chance of visibility. If we want to work
around this in the kernel, we should Cc stable, as this warning is
present there too.

> ---
>  .../mediatek/vcodec/decoder/vdec/vdec_vp9_req_lat_if.c         | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/media/platform/mediatek/vcodec/decoder/vdec/vdec_vp9_req_lat_if.c b/drivers/media/platform/mediatek/vcodec/decoder/vdec/vdec_vp9_req_lat_if.c
> index eea709d93820..47c302745c1d 100644
> --- a/drivers/media/platform/mediatek/vcodec/decoder/vdec/vdec_vp9_req_lat_if.c
> +++ b/drivers/media/platform/mediatek/vcodec/decoder/vdec/vdec_vp9_req_lat_if.c
> @@ -1188,7 +1188,8 @@ static int vdec_vp9_slice_setup_lat(struct vdec_vp9_slice_instance *instance,
>  	return ret;
>  }
>  
> -static
> +/* clang stack usage explodes if this is inlined */
> +static noinline_for_stack
>  void vdec_vp9_slice_map_counts_eob_coef(unsigned int i, unsigned int j, unsigned int k,
>  					struct vdec_vp9_slice_frame_counts *counts,
>  					struct v4l2_vp9_frame_symbol_counts *counts_helper)
> -- 
> 2.39.5
> 

