Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5BA84C48286
	for <linux-mediatek@archiver.kernel.org>; Sun,  4 Feb 2024 20:55:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=5r8gZWB9PZBWbuM0o6LwBJ5QkUd6Z8cYpWt9Zy+KEwE=; b=2rse4U6Op+RHrnv2yyTFx6YPtr
	MiZy8Gts0pJILq0GKzQEo+SEjN3VQf+6clDTvzQTnEBfgpKZQ1bziIv6iLPJ4BJmSE6/77HOYzhy6
	OanG4Sgl0QDlB0Mm7+YK/86CVqizcFRlEOHeradOtZkEF2foB7SwzOGg3mFhrdxmUzDZmjCuybf7V
	x6vpzE6NW5MJK7kNQSQSGqXO5Za+/SpgLF6WmbGiVRij4qxh9N+1CwbiXLSVF+3ve7oNrTEwhdv8w
	8Hxm8KsMv9Idcw3ead6Ynt3JttmcWUvPVpFoAMrOFXLzdeNTQo9+OCj8wG06wbxtQWtUEWa5AiMiY
	dUmZzTgA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rWjWv-00000001RTZ-0LmF;
	Sun, 04 Feb 2024 20:55:57 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rWjWr-00000001RSg-2ZhC;
	Sun, 04 Feb 2024 20:55:55 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 73F1660F16;
	Sun,  4 Feb 2024 20:55:52 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2495DC433C7;
	Sun,  4 Feb 2024 20:55:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1707080152;
	bh=nP25hJvCpMad5PlXLZIYw/Vb97I4Hz7shBB0Jia5HHc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=WeVbqBWFFSYNvQZJAL+NQMcCXY6OwMBTTE+Q0NLY7n4AfnQOdXkGtZ6QLR+TdOvg7
	 So+KSD+O4OYvex427MVujDNT+Nu77npRgycQ4IZu4JYgBNpdjM9U7+oTmWd2ge0VQQ
	 0Cqjxcgd2J3x23LqZdBLVuOhdl69Yr4jKOPevXxG+EGAa0EkOQWYFqK0+xwa76gLRA
	 n2Q4d8Jc+6lcIEfOiEy3fJtAP60haS0FrWxYfndFik7Z3/wUttXh3Rr6CYNvFShnbB
	 VTB992+rERfbjt+b/wna+D6GvlFjJ75tXtGa921WcrznHj4NqQ1RRonAN0T5m3mvHo
	 eJwyRTe+X3zkQ==
Date: Sun, 4 Feb 2024 13:55:49 -0700
From: Nathan Chancellor <nathan@kernel.org>
To: =?iso-8859-1?Q?N=EDcolas_F=2E_R=2E_A=2E?= Prado <nfraprado@collabora.com>
Cc: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Sami Tolvanen <samitolvanen@google.com>,
	Ricardo Ribalda <ribalda@chromium.org>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Nick Desaulniers <ndesaulniers@google.com>,
	Bill Wendling <morbo@google.com>,
	Justin Stitt <justinstitt@google.com>, Mike Isely <isely@pobox.com>,
	Tiffany Lin <tiffany.lin@mediatek.com>,
	Andrew-CT Chen <andrew-ct.chen@mediatek.com>,
	Yunfei Dong <yunfei.dong@mediatek.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
	llvm@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Subject: Re: [PATCH 3/3] media: mediatek: vcodedc: Fix
 Wcast-function-type-strict warnings
Message-ID: <20240204205549.GA2892810@dev-fedora.aadp>
References: <20240128-fix-clang-warnings-v1-0-1d946013a421@chromium.org>
 <20240128-fix-clang-warnings-v1-3-1d946013a421@chromium.org>
 <20240201221654.GC2240065@dev-arch.thelio-3990X>
 <CABCJKudd3SUy3Qor7Tc0zyJsSAWy0PavbbBFALuWEpBa32pBCQ@mail.gmail.com>
 <5658ec37-868f-454d-a149-467e6de139cd@collabora.com>
 <12d0c580-788d-4466-af8a-feb5ab3c6677@notapiano>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <12d0c580-788d-4466-af8a-feb5ab3c6677@notapiano>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240204_125553_765161_6846EBF0 
X-CRM114-Status: GOOD (  30.86  )
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

On Fri, Feb 02, 2024 at 03:15:46PM -0500, Nícolas F. R. A. Prado wrote:
> On Fri, Feb 02, 2024 at 01:58:05PM +0100, AngeloGioacchino Del Regno wrote:
> > Il 01/02/24 23:25, Sami Tolvanen ha scritto:
> > > On Thu, Feb 1, 2024 at 10:17 PM Nathan Chancellor <nathan@kernel.org> wrote:
> > > > 
> > > > On Sun, Jan 28, 2024 at 02:12:22AM +0000, Ricardo Ribalda wrote:
> > > > > Building with LLVM=1 throws the following warning:
> > > > > drivers/media/platform/mediatek/vcodec/common/mtk_vcodec_fw_vpu.c:38:32: warning: cast from 'mtk_vcodec_ipi_handler' (aka 'void (*)(void *, unsigned int, void *)') to 'ipi_handler_t' (aka 'void (*)(const void *, unsigned int, void *)') converts to incompatible function type [-Wcast-function-type-strict]
> > > > > 
> > > > > Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
> > > > 
> > > > I am not positive because I don't have any hardware to test this driver
> > > > but I suspect this patch is just hiding the warning without actually
> > > > addressing the issue that it is pointing out.
> > > 
> > > Agreed, this won't fix the issue. The correct solution is to drop the
> > > cast and change the handler type to match the pointer type (i.e. use
> > > const void* for the first argument).
> > > 
> > 
> > Even though I agree that the correct solution is to change the handler's type,
> > I think that having a test on the actual hardware done is still valuable.
> > 
> > We scheduled a job on KernelCI to test this commit on our integration kernel,
> > you'll get results for ChromeOS' tast decoders (MT8195 only) and Fluster tests
> > on MT8183/8186/8192/8195.
> > 
> > 
> > The results should be available in a couple of hours here, relative to
> > commit `49955a84129dbe1f94fedf729690efcf28513828` on our tree:
> > https://chromeos.kernelci.org/job/collabora-chromeos-kernel/branch/for-kernelci/
> > 
> > P.S.: If they don't, feel free to ping me or Nicolas (added to the loop) about it.
> 
> Hi,
> 
> the results are available at 
> 
> https://chromeos.kernelci.org/test/job/collabora-chromeos-kernel/branch/for-kernelci/kernel/v6.8-rc2-3109-g49955a84129d/
> 
> (You need to type "decoder" into the search bar to limit the results to only the
> decoder tests)
> 
> The only regressions I see are due to infrastructure error or broken test
> unrelated to this change (v4l2-decoder-conformance-h264-frext test on
> MT8195-Tomato, and cros-tast-decoder-v4l2-sl-h264 test on MT8183-Juniper)
> 
> Otherwise, all platforms (MT8183/8186/8192/8195) and video codecs
> (VP8/VP9/H264/H265/AV1) seem unaffected.
> 
> Note that these are GCC builds.

Thank you for running the tests to make sure this series does not
regress anything. If possible, it would be good to try and build with
LLVM and enable kernel Control Flow Integrity (kCFI, CONFIG_CFI_CLANG)
to see if my theory that this is currently broken is correct. I have
prebuilt LLVM toolchains on kernel.org but if it is too much of a
hassle, I would not worry about it.

https://mirrors.edge.kernel.org/pub/tools/llvm/

Cheers,
Nathan

