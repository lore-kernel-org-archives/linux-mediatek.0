Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 83A48C4828E
	for <linux-mediatek@archiver.kernel.org>; Fri,  2 Feb 2024 20:16:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Hhzeo8rAvRyzYcn317P7NCBm1eQEdUq6ocdrocwHP6U=; b=HhXGG+BMoAyEVlOx4VPiC643OP
	HkMoxxNPNGDJI4nBxyOudOLoaB2W29aILspcguvuwgOvN3x7KeU4sQW5wVrg7Y9WRCtNMYME9GvaO
	bkbQ4sP+1P4lybJ4v7lnd6fG0XK0d0t8IXIAHgR4M4iIis/PgXN1Xekv+7LFJlCA+3dJA8aPBZvFD
	Wn4XsEVv4fYozZh7biprkrdD/NC0xdjTESjQ+JEw70Knq0Uchw8UORq/tgVqptclfCK28novAKU+O
	wNv0x9ZS6/HW5Gr90BtZExJKQk8FrBPsYKY1VcbXj5IkrqyHHl+aGmUXWVqo8jJXwp6D1AhiOLFDL
	jBajOE0A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rVzxT-0000000DLsE-35fQ;
	Fri, 02 Feb 2024 20:16:19 +0000
Received: from madrid.collaboradmins.com ([2a00:1098:ed:100::25])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rVzxM-0000000DLjj-2u06;
	Fri, 02 Feb 2024 20:16:15 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1706904952;
	bh=8Eb6CVHvUmhvVTdSdy4hQhQ0gw+ENbyLq6EVTtPrF6M=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=KkX+zAQg4u9JHou4hpFsyJsuIDcEANiaR6FAwe35n3VMT6eVe1/MIDXqyfhTT2amZ
	 MX+22V8TjVaTtpClvaVdJe2woQReq6niv/Y90ZJPYrayU0wjcZBkFtNiYC/2gzHb+Y
	 yM6MPs695fy5HK73hFkBAl39e+5E2KwqNGLaXToYi6lQ96Lg0OeGCw3sqx2Jj0G5pT
	 13+NmiSKIKcDJIEtZA6E6t7X/g5IK6SK2emqULcluGJMALPVCq6gMiQ2To1JnOnkT/
	 yW6m1aimWyrCmokUHMJChEfXmqT4fTni6TQQm4NP0a98uk47zDex8iXOCXAJ1XqTlP
	 JsIpiaTiVtKzw==
Received: from notapiano (zone.collabora.co.uk [167.235.23.81])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: nfraprado)
	by madrid.collaboradmins.com (Postfix) with ESMTPSA id 0B5703782098;
	Fri,  2 Feb 2024 20:15:48 +0000 (UTC)
Date: Fri, 2 Feb 2024 15:15:46 -0500
From: =?utf-8?B?TsOtY29sYXMgRi4gUi4gQS4=?= Prado <nfraprado@collabora.com>
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: Sami Tolvanen <samitolvanen@google.com>,
	Nathan Chancellor <nathan@kernel.org>,
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
Message-ID: <12d0c580-788d-4466-af8a-feb5ab3c6677@notapiano>
References: <20240128-fix-clang-warnings-v1-0-1d946013a421@chromium.org>
 <20240128-fix-clang-warnings-v1-3-1d946013a421@chromium.org>
 <20240201221654.GC2240065@dev-arch.thelio-3990X>
 <CABCJKudd3SUy3Qor7Tc0zyJsSAWy0PavbbBFALuWEpBa32pBCQ@mail.gmail.com>
 <5658ec37-868f-454d-a149-467e6de139cd@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <5658ec37-868f-454d-a149-467e6de139cd@collabora.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240202_121613_059905_1ED4DA82 
X-CRM114-Status: GOOD (  25.16  )
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

On Fri, Feb 02, 2024 at 01:58:05PM +0100, AngeloGioacchino Del Regno wrote:
> Il 01/02/24 23:25, Sami Tolvanen ha scritto:
> > On Thu, Feb 1, 2024 at 10:17 PM Nathan Chancellor <nathan@kernel.org> wrote:
> > > 
> > > On Sun, Jan 28, 2024 at 02:12:22AM +0000, Ricardo Ribalda wrote:
> > > > Building with LLVM=1 throws the following warning:
> > > > drivers/media/platform/mediatek/vcodec/common/mtk_vcodec_fw_vpu.c:38:32: warning: cast from 'mtk_vcodec_ipi_handler' (aka 'void (*)(void *, unsigned int, void *)') to 'ipi_handler_t' (aka 'void (*)(const void *, unsigned int, void *)') converts to incompatible function type [-Wcast-function-type-strict]
> > > > 
> > > > Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
> > > 
> > > I am not positive because I don't have any hardware to test this driver
> > > but I suspect this patch is just hiding the warning without actually
> > > addressing the issue that it is pointing out.
> > 
> > Agreed, this won't fix the issue. The correct solution is to drop the
> > cast and change the handler type to match the pointer type (i.e. use
> > const void* for the first argument).
> > 
> 
> Even though I agree that the correct solution is to change the handler's type,
> I think that having a test on the actual hardware done is still valuable.
> 
> We scheduled a job on KernelCI to test this commit on our integration kernel,
> you'll get results for ChromeOS' tast decoders (MT8195 only) and Fluster tests
> on MT8183/8186/8192/8195.
> 
> 
> The results should be available in a couple of hours here, relative to
> commit `49955a84129dbe1f94fedf729690efcf28513828` on our tree:
> https://chromeos.kernelci.org/job/collabora-chromeos-kernel/branch/for-kernelci/
> 
> P.S.: If they don't, feel free to ping me or Nicolas (added to the loop) about it.

Hi,

the results are available at 

https://chromeos.kernelci.org/test/job/collabora-chromeos-kernel/branch/for-kernelci/kernel/v6.8-rc2-3109-g49955a84129d/

(You need to type "decoder" into the search bar to limit the results to only the
decoder tests)

The only regressions I see are due to infrastructure error or broken test
unrelated to this change (v4l2-decoder-conformance-h264-frext test on
MT8195-Tomato, and cros-tast-decoder-v4l2-sl-h264 test on MT8183-Juniper)

Otherwise, all platforms (MT8183/8186/8192/8195) and video codecs
(VP8/VP9/H264/H265/AV1) seem unaffected.

Note that these are GCC builds.

Thanks,
Nícolas

