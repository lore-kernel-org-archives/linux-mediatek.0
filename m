Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2CA73C46CA3
	for <linux-mediatek@archiver.kernel.org>; Wed,  6 Dec 2023 10:19:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=kTHbHHV9j8+k9IlmSMZU8yU+W+qTEqlgJ38mz0blqUc=; b=LVOH/zZpi0Vrw1rOF3ETKXzlaK
	BYzLVOg4amxhgkh5s+fZ22myz0ihkNlawYiKjenpvGgXD/SPK0gF3QjBvjnjcJp47vq+k5rqw8kwb
	8/kCjkCSX5743Vdd71bMXjlREaMkTLJUgdP6UTysimbc0QZ2eQ8WXS3QGK/4yVg0/Y+XXmUSTA05x
	AUlOpEGDSuxq/17JPXd4x7mTovQ7z9Qvc2+pzO2MaRybP/Q5XkLDYwjz9FvV4afJgMVBtGvsW1SoN
	cH/+R2XP3EoC5JVv25DI0n5vwjiwC72X3aindvjV7EjPyoNfTJC4ObMezeeNRz5jxW86SzDHa/fTH
	potoP2Ow==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rAp0M-009iB9-0S;
	Wed, 06 Dec 2023 10:19:46 +0000
Received: from madras.collabora.co.uk ([46.235.227.172])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rAp0G-009i7u-1S;
	Wed, 06 Dec 2023 10:19:41 +0000
Received: from [100.113.186.2] (cola.collaboradmins.com [195.201.22.229])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id 63DB66607337;
	Wed,  6 Dec 2023 10:19:37 +0000 (GMT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1701857978;
	bh=mjgfItsOqP4PFb5uiNh38eRZZOSIpCl5Be6d6JwRK6k=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=m67S4TBWJGoCE++hlGeXKmjI45cRDdU9lm8iaqdR7ahzfLo6OT6U3LO6cRR9S6bih
	 uCj5BNEvpF3OYNQG3mKAhV3VX09ryyOUFrG8UjOiqK7CCx630PMfCj56NcCJc9zrzQ
	 LBjEthQUPbth6qLOBk2nQEQqt7H0nA4L688Jrvbam9J0HJZ3uAFa4ebvA9qPAZmbCY
	 3Aluv2rA2Cv199JeYQEg9VW/scxbheo+pDRmgjZ4P2SQW4FV7V4EWLCdqgK3g16pjZ
	 fTpdvPTr6AOr0Z0VoaZGSe0qeF4WIl3McFNXT6CJnTE+93DtnZ4Mi/fQMaWpDBDPIl
	 GULkbwqENveWg==
Message-ID: <3528639f-85a3-4756-b04b-c233f6c84276@collabora.com>
Date: Wed, 6 Dec 2023 11:19:37 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/4] media: mediatek: vcodec: Drop unnecessary variable
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
 <20231113123049.4117280-3-fshao@chromium.org>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <20231113123049.4117280-3-fshao@chromium.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231206_021940_617428_7546CD12 
X-CRM114-Status: UNSURE (   6.75  )
X-CRM114-Notice: Please train this message.
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
> It's unclear why only mem->size has local copies without particular
> usage in mtk_vcodec_mem_alloc() and mtk_vcodec_mem_free(), and they
> seem removable.
> 
> Drop them to make the code visually consistent, and update printk format
> identifier accordingly.
> 
> Signed-off-by: Fei Shao <fshao@chromium.org>

That's probably just about personal preferences, as mem->size is not expected
to change during the flow of those functions.

That said, as much as you, I prefer not having this local copy as it's using
(a very small amount of) memory for no real reason anyway, so:

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>



