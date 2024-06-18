Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5ABD5C27C4F
	for <linux-mediatek@archiver.kernel.org>; Tue, 18 Jun 2024 07:23:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:Subject:References:Cc:To:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Bg3TIL3KzmjNs9lk8+SASEJZvZeUEBVqupiovsiTnss=; b=v3IfoMaw7sMnSzrhqzwHhhzXfq
	jPJHJn6xrV/u+quAqxM05xsBDrObpcZ1tzPQR7RzBV+gW8c+zarP39f1SxUilrx7EqSFPciE5GIQ8
	BjxIKG+F4rQ3CfBq2OjWxuJJuU/dMNZwYSZ4Twj40AIUiGq8OdHz0jnRzaZtn//wPS+MdT1gGg/pU
	6RzAzrBbWPbndj0Z4BSBWEllKSWr04j0OjMd815wo6E91oYrQPIPg5W4Qpsbmmb9+wo/svQl/4ivB
	uetpPOYXrujgJi14ujebFWoHQ5r2qif5zh2buAOLezgXYTuoZIRDfz+ltZc6OKeq9pRQyIeB9M3kl
	QcR/8aZw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sJTBH-0000000DwTn-1Ufq;
	Tue, 18 Jun 2024 07:23:03 +0000
Received: from mout.web.de ([212.227.15.3])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sJTBD-0000000DwSS-3i6k;
	Tue, 18 Jun 2024 07:23:01 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=web.de;
	s=s29768273; t=1718695349; x=1719300149; i=markus.elfring@web.de;
	bh=Bg3TIL3KzmjNs9lk8+SASEJZvZeUEBVqupiovsiTnss=;
	h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:To:Cc:References:
	 Subject:From:In-Reply-To:Content-Type:Content-Transfer-Encoding:
	 cc:content-transfer-encoding:content-type:date:from:message-id:
	 mime-version:reply-to:subject:to;
	b=ZAaxwRlrcDx0PCUvBtnXqrsiSNHNscYtnpXW3gtMAuUSGj7pQhStYq/XKutIVp56
	 UaFzrLJLtCiY1/L81xaJ4vLb2HjBan605/HVBJBYM9pg6nSlIj3IxVmPOLj0ewt1r
	 a8XLes3LhC9PEuCL+Fo4OKaN0q6+9jIIqhuiJw7XG70oVWcxB/cDGEk74bjQaHLnw
	 gN0gS1F71wo6DWYzC9OrL7H5+IewSLK8mc338mARjN91R3JXgQqpkUqHgKjgN/8Fz
	 rpGu+drIIOhV2cNX7JjNgi9tLPmUVTleoQmaUFKVJosUhyHWq7/4icxlisnYRJZA3
	 9ccHftpWfRUSzN8f2A==
X-UI-Sender-Class: 814a7b36-bfc1-4dae-8640-3722d8ec6cd6
Received: from [192.168.178.21] ([94.31.83.95]) by smtp.web.de (mrweb005
 [213.165.67.108]) with ESMTPSA (Nemesis) id 1Mtgyp-1ser2g39mZ-010pwq; Tue, 18
 Jun 2024 09:22:29 +0200
Message-ID: <ad8716ac-cff3-4fe5-86e1-f5f188e8b6b1@web.de>
Date: Tue, 18 Jun 2024 09:22:03 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: John Stultz <jstultz@google.com>, "T. J. Mercier" <tjmercier@google.com>,
 Yong Wu <yong.wu@mediatek.com>, Yunfei Dong <yunfei.dong@mediatek.com>,
 Project_Global_Chrome_Upstream_Group@mediatek.com,
 linux-mediatek@lists.infradead.org, linux-media@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-arm-kernel@lists.infradead.org,
 Angelo Gioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Benjamin Gaignard <benjamin.gaignard@collabora.com>,
 Hans Verkuil <hverkuil-cisco@xs4all.nl>,
 Jeffrey Kardatzke <jkardatzke@google.com>,
 Marek Szyprowski <m.szyprowski@samsung.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Nathan Hebert <nhebert@chromium.org>,
 Nicolas Dufresne <nicolas.dufresne@collabora.com>,
 =?UTF-8?B?TsOtY29sYXMgRi4gUi4gQS4gUHJhZG8=?= <nfraprado@collabora.com>,
 Sebastian Fricke <sebastian.fricke@collabora.com>,
 Tomasz Figa <tfiga@chromium.org>
Cc: LKML <linux-kernel@vger.kernel.org>, Brian Starkey
 <Brian.Starkey@arm.com>, Chen-Yu Tsai <wenst@chromium.org>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 Daniel Vetter <daniel@ffwll.ch>, =?UTF-8?Q?Fritz_K=C3=B6nig?=
 <frkoenig@chromium.org>, Hsin-Yi Wang <hsinyi@chromium.org>,
 Matthias Brugger <matthias.bgg@gmail.com>, Simon Horman <horms@kernel.org>,
 Steve Cho <stevecho@chromium.org>, Sumit Semwal <sumit.semwal@linaro.org>
References: <20240516122102.16379-7-yunfei.dong@mediatek.com>
Subject: Re: [PATCH v6 06/24] dma-heap: Add proper kref handling on dma-buf
 heaps
Content-Language: en-GB
From: Markus Elfring <Markus.Elfring@web.de>
In-Reply-To: <20240516122102.16379-7-yunfei.dong@mediatek.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:/+1vL2hF7w7/U6j+yJ4izBj1AbDZAVu4X1KpoJgdg2qMKCHU9BN
 Ifzm7y0IJZmLWnGCgmLUXzMukVIIELPS2EhhatKYzu6tegs4kxeySDupbDGTrWDASOQJbOg
 w9mOFs8Z1DfRanYvPSUkCR/gV8N0LYIh/MMX5DaY5G2apsoDTwnw29KpsyxShh4kisbe83Z
 9Cw/fKtyKjptSRJf//RyA==
UI-OutboundReport: notjunk:1;M01:P0:U8P0/GzVv8g=;JqrQtoY7YisOf6G5dLTpAxpmI8u
 UFlogheq71vxQwctu+U17hGJGx1e0HgWjuqEj2EXCNpHlvCP8TBGwWMaQoHnE1mMJqYTmm7RO
 Hhc94KlC1DelubZ5B+fXFdo+h/FkZpOUrd69UF8y2tCbPaV+zInRsxLq1UqQ358gU/EAHdehr
 TjsysmHaHnK00+gSR7hSY5BYGSrzuZBrX6viwHhtKSUHGi4+L0l6Aozpec8jLoGYUcbkQeMm9
 uhzGvk1yY8Av24P33qsqMjQwn01CAyTWSxyiuGuzMF4GtF38lOU8xjEug2UvzTDMRZNyVLhUT
 U+I0ydY/tuZRz8NpxgoWlaNzkUw5uJSTFxzO5oxtKD78/hfpLtUBzE0qKH6hhYMYnZquucjI1
 ghhamIqV+LBcwq2feNe1NOyfGfFX7aR8vS1H4jgAX09nYH2XXYg7tYqNsHmvZK2C86GhtVuKS
 w1mocZ4vHdgG1L0fQxKce3KZ4p9Br4Ebys5u5+zT6y/bPJ2dzke/SE8f9vlhyBYJalm0Qhjk4
 DXLfQt7zZFbLrK7DcoFO6CQ4X/ohCwOndeGEORneIy6/n8HBP+elbGyy7Y25+SoHccXmgbcuc
 b3FNLH4GZWv9XmhHn1HiUwWAShJla3r/9Lawn065g0aNjsLCShH8yU3EPUM1aFIwHz4OrDOWa
 I09c9SFF/tEcnNinSpKIT73FSejNr4NxRapyYFCYkYODb6rW62DeXWoR79XEvl9Q2KQpqGpLG
 iMikMNBnwC3zVIuFmmy4OjMH0oyAP5JmcqLOy2OZxqFHk1S9JwKgbzYHNIFOgdGwd3+WDmEJc
 Qxb+EpsaK7s31isNgGSIQIiL2vfV4oPG+DtW8o2JotqH0=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240618_002300_220966_2BBC8D36 
X-CRM114-Status: UNSURE (   6.20  )
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

> Add proper refcounting on the dma_heap structure.

             reference counting?


> While existing heaps are built-in, we may eventually
> have heaps loaded from modules, and we'll need to be
> able to properly handle the references to the heaps

You may occasionally put more than 52 characters into text lines
of such a change description.


=E2=80=A6
> +++ b/drivers/dma-buf/dma-heap.c
=E2=80=A6
> +static void dma_heap_release(struct kref *ref)
> +{
=E2=80=A6
> +	mutex_lock(&heap_list_lock);
> +	list_del(&heap->list);
> +	mutex_unlock(&heap_list_lock);
=E2=80=A6

Would you become interested to apply a statement like =E2=80=9Cguard(mutex=
)(&heap_list_lock);=E2=80=9D?
https://elixir.bootlin.com/linux/v6.10-rc4/source/include/linux/mutex.h#L1=
96

Regards,
Markus

