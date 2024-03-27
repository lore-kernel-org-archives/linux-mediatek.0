Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9EBA7C47DD9
	for <linux-mediatek@archiver.kernel.org>; Wed, 27 Mar 2024 09:57:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/z3wkoo7fek/OngF9tNMy9Q9s0VbeotS9dxygIFGJyA=; b=y3HeRKG6BmTJnUdclZI6E9U+bg
	TE/gdNUGnwaKhs55asdXEkblAe/nPfrAJuRGnkNFZj4j7KN7B+JL4Jhf8Ay6rUb2J3GI46K2LoOVv
	t2UxuylTrC0Q07ATC74kx1cs88TibTYI9bQlZV4vfEMhaXhK98jNXkW1VHB8DqmLcj8gkkeWXvX+K
	o16HDINJa4/emz8j/k+uSIcggD04gO/b5fAZ5pqG8p7akkIfqDZQBoIXQ6/r0P6JaM+bsRKjGNH6e
	ebhjSuKlAc9pqtCuBjF7H5Ry+oWEIwbynk7Pt04cF4MPxtNyqaMEt6nEU2EGKqDnFmIfuAGLfaO/D
	dK+6b4Pg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rpQ2J-00000008IqU-29tA;
	Wed, 27 Mar 2024 09:57:35 +0000
Received: from madrid.collaboradmins.com ([2a00:1098:ed:100::25])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rpQ2E-00000008IoK-3frq;
	Wed, 27 Mar 2024 09:57:32 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1711533443;
	bh=6i66eyLtFjTaO1dIDXVZlX8Q+lSEqYTtOhQaqZ1TG4Q=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=O9cgRC+ouOzomKIMASnl8XCJ1FP8XAkY19uHoDuWXBSAWIZlGDY0K6OazuGD3rUtr
	 W+84Dbhj0HYbPFfVsW31y3n/oOwJaizH68tLgmYnXe1N95NkWeE7w+AM1u5jxeagp7
	 9V7K56LW3zRaVA/eY1ev92fshjbjjTC4v/DjH1suTp8ji7lYcmy9jDZYQvqm26OVK4
	 K79GWTLo6oyQIIhcQgMcrA3Kwes/Bx976S+xMIcUDMXcqQKt4Xd0bjLcHFD3cscaB2
	 txx57D+K/2wYNck23bjyo+0QMF5OnNFy5BfmWkOF/kuq16x61TdUZfi53fWZ11+fd3
	 cdy02UHlicvFw==
Received: from localhost (cola.collaboradmins.com [195.201.22.229])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: sebastianfricke)
	by madrid.collaboradmins.com (Postfix) with ESMTPSA id 2478037813CA;
	Wed, 27 Mar 2024 09:57:23 +0000 (UTC)
Date: Wed, 27 Mar 2024 10:57:22 +0100
From: Sebastian Fricke <sebastian.fricke@collabora.com>
To: Fei Shao <fshao@chromium.org>
Cc: Hans Verkuil <hverkuil-cisco@xs4all.nl>,
	Andrew-CT Chen <andrew-ct.chen@mediatek.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Nicolas Dufresne <nicolas.dufresne@collabora.com>,
	Tiffany Lin <tiffany.lin@mediatek.com>,
	Xiaoyong Lu <xiaoyong.lu@mediatek.com>,
	Yunfei Dong <yunfei.dong@mediatek.com>,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	linux-media@vger.kernel.org, linux-mediatek@lists.infradead.org,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Subject: Re: [PATCH v2 0/4] Improvement around mtk_vcodec_mem_free() logging
 and usage
Message-ID: <20240327095722.w56iugips6z2bl2p@basti-XPS-13-9310>
References: <20231221092226.1395427-1-fshao@chromium.org>
 <CAC=S1njAtbvjy1KBoVNtsw8WDKL1Zoh76mG3HvcUaOUBprEMkQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAC=S1njAtbvjy1KBoVNtsw8WDKL1Zoh76mG3HvcUaOUBprEMkQ@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240327_025731_170081_64B4D100 
X-CRM114-Status: GOOD (  19.96  )
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

Hey Fei,

On 27.03.2024 17:18, Fei Shao wrote:
>On Thu, Dec 21, 2023 at 5:23 PM Fei Shao <fshao@chromium.org> wrote:
>>
>> Hi,
>>
>> This series includes some improvements around mtk_vcodec_mem_free() in
>> mtk_vcodec_util.c.
>>
>> I noticed that mtk_vcodec_mem_free() generates a spurious error if the
>> target DMA buffer has been freed previously:
>>   mtk_vcodec_mem_free(),69: [MTK_V4L2][ERROR] 18000000.video-codec
>>   dma_free size=0 failed!
>>
>> The warning is harmless, but it brings some confusion to our developers
>> and testing infra, so I sent this series to fix that with some minor
>> improvement for the driver alongside.
>>
>> The first two patches are for aesthetic and style improvements, the
>> third tries to make the error logs more informative, and the last adds
>> back the missing checks when calling the free function.
>>
>> Regards,
>> Fei
>>
>> v1: https://lore.kernel.org/all/20231113123049.4117280-1-fshao@chromium.org/
>>
>> Changes in v2:
>> - rebased on top of next-20231219
>> - revise commit message for clearer intention and rationale
>> - update the error messages based on the suggestion
>>
>> Fei Shao (4):
>>   media: mediatek: vcodec: Replace dev_name in error string
>>   media: mediatek: vcodec: Drop unnecessary variable
>>   media: mediatek: vcodec: Update mtk_vcodec_mem_free() error messages
>>   media: mediatek: vcodec: Only free buffer VA that is not NULL
>>
>>  .../mediatek/vcodec/common/mtk_vcodec_util.c  | 23 +++++++++----------
>>  .../vcodec/decoder/vdec/vdec_av1_req_lat_if.c | 22 ++++++++++++------
>>  .../vcodec/encoder/venc/venc_h264_if.c        |  5 ++--
>>  3 files changed, 29 insertions(+), 21 deletions(-)
>
>Hi Hans,
>
>I'd like to get some attention for this series in case it has been
>overlooked. It still applies to next-20240327 without conflict.
>Please let me know if you have any feedback or concerns on this.

Sorry this seems to have slipped through my fingers, I'll put it on my
list. Thanks for the notification.

>
>Thank you,
>Fei

Greetings,
Sebastian

>>
>> --
>> 2.43.0.472.g3155946c3a-goog
>>
>

