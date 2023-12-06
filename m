Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 785C2C10F04
	for <linux-mediatek@archiver.kernel.org>; Wed,  6 Dec 2023 10:19:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=cRdpZb6Vv7gkvyhRaxs1WZnEZqaRvei6PSRpBEWY3NU=; b=VdBznZEB7TbhvIR9fTVURVh1ZM
	RVVXVn9fgaqNebeufCApajpctumImydFmFqj2dXIR4oq5wVFN1E9fLkq1lVG+XARkpoqoFeQB/YJC
	NI3bYElEE5556ZnWJEH8BBwB622/fVbwaD9hn1rSb/tCK7K5Qv5fBKYnk9NDMjWaja0haRT8E59E8
	wl1zVYci44HEH/3XGnbwD9g/p28mrJV1Aznn2Qoo7KR3ha0mme9xpwWroF14/ERB2eeUeXTYBGADF
	1eLX6TcP+WmD4H41ZRrjdX24DhdQd64viAFPibwmWXrfZKehWlr8ejjiklh4WAnPJO5HJjXaMJhcX
	KWR73QNg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rAp0H-009i8r-1Q;
	Wed, 06 Dec 2023 10:19:41 +0000
Received: from madras.collabora.co.uk ([2a00:1098:0:82:1000:25:2eeb:e5ab])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rAp0D-009i7Z-2l;
	Wed, 06 Dec 2023 10:19:39 +0000
Received: from [100.113.186.2] (cola.collaboradmins.com [195.201.22.229])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id EB2EF660732A;
	Wed,  6 Dec 2023 10:19:34 +0000 (GMT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1701857975;
	bh=UIy6Wcqp5kGevxZ+Hlaa9ohz+boVqoC9hBiFx+0skE8=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=LZw1QPHbwHNH02hOUzhaAEEcCznJHI2Kccpc0j+0vxUhqn2EB2YTd5Jbjhk6mVg9Z
	 gAXkyxL9euyUl4jiueoQqpvhXTEJW3uzC0hF+G4lj8WUB5IXpo1U0KBdU1plfLfbvr
	 jTvzqJboeY/EywwNiPMFg0dzYZ4XNlOkJmOfQFbHXPQ+49OX+4ikX4osHH47lKtNF+
	 9nCGDSAfLobENWjskTqJTsnIuD/9F4Tt7Q2DjMimyz2vegEhvg5rGm5vyuDd7Zp0JP
	 MzjL/nijM5NUkgrogipZ8BvrKAl3Fkbu+Zpm1YBq+bTln+/TT6b1U+vCd/B9BcsxoT
	 qYWzxupVCjIMA==
Message-ID: <6c693161-0e89-4f9d-9a92-18f3783eefd2@collabora.com>
Date: Wed, 6 Dec 2023 11:19:32 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/4] media: mediatek: vcodec: Fix mtk_vcodec_mem_free()
 error log criteria
Content-Language: en-US
To: Fei Shao <fshao@chromium.org>, Hans Verkuil <hverkuil-cisco@xs4all.nl>
Cc: Andrew-CT Chen <andrew-ct.chen@mediatek.com>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Nicolas Dufresne <nicolas.dufresne@collabora.com>,
 =?UTF-8?B?TsOtY29sYXMgRi4gUi4gQS4gUHJhZG8=?= <nfraprado@collabora.com>,
 Tiffany Lin <tiffany.lin@mediatek.com>,
 Yunfei Dong <yunfei.dong@mediatek.com>,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-media@vger.kernel.org, linux-mediatek@lists.infradead.org
References: <20231113123049.4117280-1-fshao@chromium.org>
 <20231113123049.4117280-4-fshao@chromium.org>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <20231113123049.4117280-4-fshao@chromium.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231206_021938_035805_828E72F2 
X-CRM114-Status: GOOD (  13.07  )
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

Il 13/11/23 13:26, Fei Shao ha scritto:
> mtk_vcodec_mem_free() shouldn't print error if the target DMA buffer has
> never been allocated or was freed properly in the previous call. That
> makes log confusing.
> 
> Update the error path to print log only when the caller attempts to free
> nonzero-size buffer with VA being NULL, which indicates something indeed
> went wrong.
> 
> This brings another benefit that the callers no more need to check
> mem->va explicitly to avoid the error, which can make the code more
> compact and neat.
> 
> Signed-off-by: Fei Shao <fshao@chromium.org>

I think that this error is supposed to catch two issues in one:
  - We're called to free no memory (something that does make no sense),
    this may happen for example when calling xxx_free() twice, and it
    is a mistake that *must* be fixed;
  - We're failing to free memory for real (which you covered)

....that said, I think that if you want to clarify the error messages
in this function, it should look something like this:

if (!mem->va) {
	mtk_v4l2_err(plat_dev, "%s: Tried to free a NULL VA", __func__);
	if (mem->size)
		mtk_v4l2_err(plat_dev, "Failed to free %lu bytes", mem->size);
	return;
}

Cheers,
Angelo


