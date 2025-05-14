Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B331BC3ABCC
	for <linux-mediatek@archiver.kernel.org>; Wed, 14 May 2025 13:54:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Dt0LGVUPC9+PRPUyHgHWCXqhc3/T0wJBdnp4avPzbeU=; b=2iOOi4zLmuUCE/191wqq/xESsZ
	7tv948odYl6eZxy/ZHZFsgI0PFrBZGc48nRpa4xxj4JyrAC8ZbTi7gXb3FeAmWwFY9+J+tyUDos0W
	lrzBzj4SZRlUc/yNXn75sgVtaBCE6E5H8ZCtjQtirmif/b0TLnROD11uxiVdiHjA7JGm5Ow3UMqpm
	rt3davDiW+IshWo+j192SLNri7pJmvNuE9H9wmPfxLqjgaOdVmO+AS5A/fwXaIHK9ZvZncf8hhyxw
	sGfLaf2qQ8hIPxlzbH3OKab/h3vbgFW3r1ASaVvopfAA0QIjgxgo6Ip2Mp7bc973hhAhPU3ebpYrn
	3Nwc15Mg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uFCZB-0000000FJUu-1rnR;
	Wed, 14 May 2025 13:54:37 +0000
Received: from bali.collaboradmins.com ([2a01:4f8:201:9162::2])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uFBku-0000000F9XU-4BfZ;
	Wed, 14 May 2025 13:02:42 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1747227759;
	bh=/qgL9c72UjfK/aScb//liTBZpBmD9llnpoWSPimdNJU=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=AB56yxbEJYn0H4B4CgSrglHvjNBBLYJTQw+pf4JzTL5dEQN/zruyvWMOrPRn4YQ6M
	 LSZrnkND0Rgs8VxCBy85DAi6tBnPo0weRB8hfDLI2YGEbE6ObujIDWj3wzsaZDZpBm
	 4YcrTZ7Jk+IpYed2/Rb8AGfHHSxnTgMpuVgF3WDgoBBSuLVn4NE9RQmDpVkaWOw07F
	 INpOC1hvLH1rUVVcBDo80bGCmCa+kaRB8FyolRSeIz+7ex3uByepG2bElkiVMVicY9
	 90heWpuyL/lFesm7zVzTybdU5rHiQl7Q2KapWjzPFbRduc2sBfhMb6CaL5Er2H1eq1
	 whDJRvQd4wEsg==
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id B818017E0509;
	Wed, 14 May 2025 15:02:38 +0200 (CEST)
Message-ID: <0d530e65-1c22-4538-9234-802541e5326a@collabora.com>
Date: Wed, 14 May 2025 15:02:38 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 3/3] arm64: dts: mediatek: mt8188: Add all Multimedia
 Data Path 3 nodes
To: Rob Herring <robh@kernel.org>
Cc: linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 devicetree@vger.kernel.org, Nicolas Dufresne
 <nicolas.dufresne@collabora.com>, Chun-Kuang Hu <chunkuang.hu@mediatek.com>,
 Conor Dooley <conor.dooley@microchip.com>
References: <20250514092259.47035-1-angelogioacchino.delregno@collabora.com>
 <20250514092259.47035-3-angelogioacchino.delregno@collabora.com>
 <439db3ea-4fb7-4944-b182-222663c09b3d@collabora.com>
 <CAL_JsqLwXwmt5Smutvv+V-HfLzgYCqb-YRVx9ydD7rfmkiWoeA@mail.gmail.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <CAL_JsqLwXwmt5Smutvv+V-HfLzgYCqb-YRVx9ydD7rfmkiWoeA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250514_060241_183137_70F3E05C 
X-CRM114-Status: GOOD (  17.96  )
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

Il 14/05/25 14:56, Rob Herring ha scritto:
> On Wed, May 14, 2025 at 4:26 AM AngeloGioacchino Del Regno
> <angelogioacchino.delregno@collabora.com> wrote:
>>
>> Il 14/05/25 11:22, AngeloGioacchino Del Regno ha scritto:
>>> Add all of the Multimedia Data Path 3 (MDP3) related nodes
>>> including its Mutex instances, one for each VPPSYS block, and
>>> all of its DMA controllers, Film Grain (FG), HDR, Adaptive Ambient
>>> Light (AAL), Frame Resizer (RSZ), Tone Curve Conversion (TCC),
>>> Two-Dimensional Sharpness (TDSHP), and others, enabling the entire
>>> MDP3 macro-block.
>>>
>>> Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
> 
> Acked-by: Rob Herring (Arm) <robh@kernel.org>
> 
>> Rob, sorry again for missing your previous email about the warnings
>> generated by this commit.
>>
>> I ran a dtbs_check on this and I didn't see any warning - can you please urgently
>> check and confirm that I didn't miss anything on this one so that I can pull it in
>> the MediaTek trees for a fixed up PR?
>>
>> If anything else is wrong with this one, I'll have to just drop it and delay this
>> for the next cycle as it's really too late (my bad, though).
> 
> Thanks for fixing.

Thank you for the very fast ack, highly appreciated.

I have just learnt that Arnd accidentally pulled the branch anyway, so I will
have to resend this as a fix on top - it will be just a diff between the current
one and this commit that you acked.

I guess I can retain your ack on the diff-only commit, as the result will be
exactly the same as this v2.

> FYI, Linus' and next trees are tested daily here:
> 
> https://gitlab.com/robherring/linux-dt/-/jobs
> 
> platform-warnings.log has the top warnings and undocumented
> compatibles by platform family.
> 
That's very useful! Didn't know about it - thanks, that'll make my maintainer
life easier. Bookmarked!

Cheers,
Angelo



