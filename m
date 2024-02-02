Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 19415C47DB3
	for <linux-mediatek@archiver.kernel.org>; Fri,  2 Feb 2024 12:58:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=t0l8YfnAKEx/FrBGo5s3bgp4D926rL9rDO7ig9PaGrw=; b=mNF9WCu43V7YAAM5PYoOpe2T7C
	tkCJCHQ48fDhZy6PILSboRHlfVLpq6dnK3+7xRA47yCec7f5GXoe+zDGZ/BZ/BtclYvYxS1DhHO4c
	DU8LQ/pf7aruieVSgxywLuHdPTuI7+U590c8dOALs84PI+mjYAmSiJdOuke9nACZ6XdFZ9a93j5X6
	4dooOORrmisqDZDuZ+L3BaRNxuRzK7XyInfbxpsJaWpXCHXvuK7wCfIwJWbR1QK93kni43CDUZzfz
	FL20+S1llYQMzgX45o1aycsS5RyynUE8p5kdkSZPK5h9BxykJYToKTZCV/IVB1uGxyO8WIbbrrj0I
	QapFULhA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rVt7b-0000000BXTh-0Qvu;
	Fri, 02 Feb 2024 12:58:19 +0000
Received: from madrid.collaboradmins.com ([46.235.227.194])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rVt7W-0000000BXQd-3C4B;
	Fri, 02 Feb 2024 12:58:16 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1706878687;
	bh=eZxOtydVn75KlLDsjhljk2E/9by5DLKsxQBgEm9BoA4=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=XxK6AL0RPCUwDZCkOln4QsiMSxSV+V+FsoLeSFodim/VeGCBa1gRurxBCEurJn9H1
	 M2eGLmZ+8wJVHWBjjDGOkpEOaya0UT3PXQi1F27UH0gXzNGRVlOL4c/Cez0pazK5Rr
	 d9cB1gGLUlMHG3kODLG+Gi6kn012YCsOX8O9kqZ/jGxnF3UgCGRr0Vn76qmqgatdU6
	 5JZ+kROqn3LJvFe9To2ze9qVVshRt8ZPYqZQBDdxr4afC+bq5B5knr2nVetBzsmkTA
	 /28LyP/bnxgLvhI5Kx9TFGvU4P2UVolG0oliYpt3Pt/ApMa4UW5btQsmVeYAJpdc/k
	 QYH8MpJArwguA==
Received: from [100.113.186.2] (cola.collaboradmins.com [195.201.22.229])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madrid.collaboradmins.com (Postfix) with ESMTPSA id 79E863781183;
	Fri,  2 Feb 2024 12:58:06 +0000 (UTC)
Message-ID: <5658ec37-868f-454d-a149-467e6de139cd@collabora.com>
Date: Fri, 2 Feb 2024 13:58:05 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/3] media: mediatek: vcodedc: Fix
 Wcast-function-type-strict warnings
Content-Language: en-US
To: Sami Tolvanen <samitolvanen@google.com>,
 Nathan Chancellor <nathan@kernel.org>, Ricardo Ribalda
 <ribalda@chromium.org>, =?UTF-8?B?TsOtY29sYXMgRi4gUi4gQS4gUHJhZG8=?=
 <nfraprado@collabora.com>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>,
 Nick Desaulniers <ndesaulniers@google.com>, Bill Wendling
 <morbo@google.com>, Justin Stitt <justinstitt@google.com>,
 Mike Isely <isely@pobox.com>, Tiffany Lin <tiffany.lin@mediatek.com>,
 Andrew-CT Chen <andrew-ct.chen@mediatek.com>,
 Yunfei Dong <yunfei.dong@mediatek.com>,
 Matthias Brugger <matthias.bgg@gmail.com>, linux-media@vger.kernel.org,
 linux-kernel@vger.kernel.org, llvm@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org
References: <20240128-fix-clang-warnings-v1-0-1d946013a421@chromium.org>
 <20240128-fix-clang-warnings-v1-3-1d946013a421@chromium.org>
 <20240201221654.GC2240065@dev-arch.thelio-3990X>
 <CABCJKudd3SUy3Qor7Tc0zyJsSAWy0PavbbBFALuWEpBa32pBCQ@mail.gmail.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <CABCJKudd3SUy3Qor7Tc0zyJsSAWy0PavbbBFALuWEpBa32pBCQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240202_045814_985421_45E7FC39 
X-CRM114-Status: GOOD (  17.95  )
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

Il 01/02/24 23:25, Sami Tolvanen ha scritto:
> On Thu, Feb 1, 2024 at 10:17 PM Nathan Chancellor <nathan@kernel.org> wrote:
>>
>> On Sun, Jan 28, 2024 at 02:12:22AM +0000, Ricardo Ribalda wrote:
>>> Building with LLVM=1 throws the following warning:
>>> drivers/media/platform/mediatek/vcodec/common/mtk_vcodec_fw_vpu.c:38:32: warning: cast from 'mtk_vcodec_ipi_handler' (aka 'void (*)(void *, unsigned int, void *)') to 'ipi_handler_t' (aka 'void (*)(const void *, unsigned int, void *)') converts to incompatible function type [-Wcast-function-type-strict]
>>>
>>> Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
>>
>> I am not positive because I don't have any hardware to test this driver
>> but I suspect this patch is just hiding the warning without actually
>> addressing the issue that it is pointing out.
> 
> Agreed, this won't fix the issue. The correct solution is to drop the
> cast and change the handler type to match the pointer type (i.e. use
> const void* for the first argument).
> 

Even though I agree that the correct solution is to change the handler's type,
I think that having a test on the actual hardware done is still valuable.

We scheduled a job on KernelCI to test this commit on our integration kernel,
you'll get results for ChromeOS' tast decoders (MT8195 only) and Fluster tests
on MT8183/8186/8192/8195.


The results should be available in a couple of hours here, relative to commit 
`49955a84129dbe1f94fedf729690efcf28513828` on our tree:
https://chromeos.kernelci.org/job/collabora-chromeos-kernel/branch/for-kernelci/

P.S.: If they don't, feel free to ping me or Nicolas (added to the loop) about it.

Cheers,
Angelo

