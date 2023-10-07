Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 49441E81E14
	for <linux-mediatek@archiver.kernel.org>; Sat,  7 Oct 2023 03:43:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:In-Reply-To:Date:References:Subject:Cc:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ch7HYFsdsPWB0qoPHYsF+QHzdHk/2DhiF+E3F5mbEBM=; b=Ql+xuCCDBO9BThD4VC0kj0poAX
	QWiUnTevDxFfdfAhcKGDJkswyg8ip510j8F3rEbqYPH+nhAQssfoDrJizJh/JK8Yaj8idvGmkTTDi
	XAXMl57VdhalB23eU6DRVcHxMO78mT/z+As9hM7Y8yjxTQni9t4GtIUtG4V5Z01aRiAlDWcb6UMCm
	2J8cBrnAvbkvpj/cq3fvLDjH0nqcPX1V+J95pDyu2KNGnEj4jtnaKcFmL9DG873w9WM7+PUxf/mRe
	vj4ctnc1LUG0v0tji3a26c+k+gvPKx+MP36ykN1WgYBxDp7d77q9flSl6wiEzEx1Fj1cBU9bVqAr5
	NL+CRP/w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qoyE8-006t8y-0F;
	Sat, 07 Oct 2023 03:43:40 +0000
Received: from ams.source.kernel.org ([2604:1380:4601:e00::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qoyE4-006t8B-08;
	Sat, 07 Oct 2023 03:43:37 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by ams.source.kernel.org (Postfix) with ESMTP id E2A41B82B34;
	Sat,  7 Oct 2023 03:43:33 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2F1D1C433C8;
	Sat,  7 Oct 2023 03:43:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1696650213;
	bh=/XnJFcvVU6ZpIin+GOGN2gLHcNQTV4L7LTIlpf+1yQY=;
	h=From:To:Cc:Subject:References:Date:In-Reply-To:From;
	b=nai38z5tQi/p+Yb92wCONFYch2eSpqfHrzRMrnJ7iVeumcdV887o0orT0t+lcNxbD
	 i40XIhm1BvRGR2ZMm9DH7dxV++olEpvAkXVd2E4mYUe8BtD/3KIZunE3wZ200+FA4e
	 BVzRxvSlnUrshY2lDc56P5Hdequv+9GOndP7+nYDi1H3p7tMgPUekIdu2PwlCkjMAH
	 KJ956YKUgrVkzSVW8EgLKj7UAnqXalGPoLumnXY8f5ot1+bmNpwT0pPydbsN+uByu4
	 U3sdDb8y3JeAf6SLYC8az7syBFG43FhZ4FKz8XJST4Ym/fAmRDep1oEenb1kvF2zue
	 xGX8o2/Ru1yfg==
From: Kalle Valo <kvalo@kernel.org>
To: Kees Cook <keescook@chromium.org>
Cc: Felix Fietkau <nbd@nbd.name>,  Lorenzo Bianconi <lorenzo@kernel.org>,
  Ryder Lee <ryder.lee@mediatek.com>,  Shayne Chen
 <shayne.chen@mediatek.com>,  Sean Wang <sean.wang@mediatek.com>,  Matthias
 Brugger <matthias.bgg@gmail.com>,  AngeloGioacchino Del Regno
 <angelogioacchino.delregno@collabora.com>,
  linux-wireless@vger.kernel.org,  linux-arm-kernel@lists.infradead.org,
  linux-mediatek@lists.infradead.org,  Nathan Chancellor
 <nathan@kernel.org>,  Nick Desaulniers <ndesaulniers@google.com>,  Tom Rix
 <trix@redhat.com>,  linux-kernel@vger.kernel.org,  llvm@lists.linux.dev,
  linux-hardening@vger.kernel.org
Subject: Re: [PATCH] wifi: mt76: Annotate struct mt76_rx_tid with __counted_by
References: <20230915200612.never.786-kees@kernel.org>
	<202310061320.8630F7E51@keescook>
Date: Sat, 07 Oct 2023 06:45:52 +0300
In-Reply-To: <202310061320.8630F7E51@keescook> (Kees Cook's message of "Fri, 6
	Oct 2023 13:21:13 -0700")
Message-ID: <87cyxrgknj.fsf@kernel.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231006_204336_238450_D1928873 
X-CRM114-Status: GOOD (  10.79  )
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

Kees Cook <keescook@chromium.org> writes:

> On Fri, Sep 15, 2023 at 01:06:12PM -0700, Kees Cook wrote:
>> Prepare for the coming implementation by GCC and Clang of the __counted_by
>> attribute. Flexible array members annotated with __counted_by can have
>> their accesses bounds-checked at run-time checking via CONFIG_UBSAN_BOUNDS
>> (for array indexing) and CONFIG_FORTIFY_SOURCE (for strcpy/memcpy-family
>> functions).
>> 
>> As found with Coccinelle[1], add __counted_by for struct mt76_rx_tid.
>
> Friendly ping. Can this get picked up by the wifi tree, or should it go
> via something else?

It's already in mt76 pull request and should be in wireless-next next
week:

https://patchwork.kernel.org/project/linux-wireless/patch/a5a2baaa-0db4-403e-9ebd-a7ff089675b4@nbd.name/

-- 
https://patchwork.kernel.org/project/linux-wireless/list/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches

