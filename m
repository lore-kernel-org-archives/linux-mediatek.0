Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ECA80C77B7A
	for <linux-mediatek@archiver.kernel.org>; Tue,  6 Jun 2023 07:31:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Nmg5B5xd0F6ji255iT9ndVhG10e1qDV7laJHq3pBNCk=; b=Xj6Y/IxIuywkmyzd1aBzD8CBcH
	MA3JkxgB5t4Y+49CzLj/OMSJRx/b52lyMXTISUc3UrIH7YxmBB8cQJvaP+7+uxppOVQ1X9aiwduK1
	No9EBJ0h6O0aeEY7FctrcyC0ahj7EjRH4UFBgU2jL5b6e3PlG3ytni/8ck71+E5/xTufoiykYbqgU
	LZTXpZlTvYHatX6q4o03/t7pa8JN+AdPAM+Iguv7jILlZiSt25yefn16fyzbLpaINTOu46pcLjcmY
	ZZAA+dGWyq6UFDt8Piw6fFT0ggp/FN3nklo5r66k8Cio2Q/6vi8MVbcrmNglGyB7H3njxbGGRS/wP
	PN0Zv/Zw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q6R9p-000XXC-12;
	Tue, 06 Jun 2023 07:31:09 +0000
Received: from madras.collabora.co.uk ([2a00:1098:0:82:1000:25:2eeb:e5ab])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1q6R9l-000XVu-1J;
	Tue, 06 Jun 2023 07:31:06 +0000
Received: from [IPV6:2001:b07:2ed:14ed:a962:cd4d:a84:1eab] (unknown [IPv6:2001:b07:2ed:14ed:a962:cd4d:a84:1eab])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id 5DB726606E98;
	Tue,  6 Jun 2023 08:31:02 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1686036664;
	bh=G9Yg0TlFYfsIFKwfhY9f+u1E2TG+wfhcVIp+pvHR+b4=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=Q1273EtdsG0JKBag/szWRjp/W+OmD9K0OIHSeUMw0w77R7uUWJNJlMRd4dTsf1sYu
	 GLEuQV4HRJoalp02WkpDphRmE8ug4K2UsKmJPnOxI0/TAn3LPxJimghjNxEl0MgCBD
	 f0ue0X1AtmFhl/2GQoWwW4RYmE495iZcpzCzYPq7/BBAcydvbPW0JaKrtv4cntL9Ap
	 3R2srxnNaqjSqLq8eq+TTHGMfKdvcgT349ncQS9Gmz7AoXZFwSNoLbrj9ZihsWpeJW
	 xEeANv/0MysGhWD7PcDbfHNVMgqLqWQh2G9FUb+nzlU+gpVwPI4UjfHB5vNfjuPHwN
	 HvvMPLObxxW+w==
Message-ID: <3400aec0-4532-ab39-52c4-13c718817ab3@collabora.com>
Date: Tue, 6 Jun 2023 09:30:59 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.2
Subject: Re: [PATCH 3/6] media: dt-bindings: mediatek,vcodec: Remove VDEC_SYS
 for mt8183
Content-Language: en-US
To: =?UTF-8?B?TsOtY29sYXMgRi4gUi4gQS4gUHJhZG8=?= <nfraprado@collabora.com>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Hans Verkuil <hverkuil-cisco@xs4all.nl>
Cc: kernel@collabora.com, Andrew-CT Chen <andrew-ct.chen@mediatek.com>,
 Conor Dooley <conor+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring
 <robh+dt@kernel.org>, Tiffany Lin <tiffany.lin@mediatek.com>,
 Yunfei Dong <yunfei.dong@mediatek.com>, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-media@vger.kernel.org, linux-mediatek@lists.infradead.org
References: <20230605162030.274395-1-nfraprado@collabora.com>
 <20230605162030.274395-4-nfraprado@collabora.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <20230605162030.274395-4-nfraprado@collabora.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230606_003105_579656_DB912E3D 
X-CRM114-Status: GOOD (  17.05  )
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

Il 05/06/23 18:20, Nícolas F. R. A. Prado ha scritto:
> The binding expects the first register space to be VDEC_SYS. But on
> mt8183, which uses the stateless decoders, this space is used only for
> controlling clocks and resets, which are better described as separate
> clock-controller and reset-controller nodes.
> 
> In fact, in mt8173's devicetree there are already such separate
> clock-controller nodes, which cause duplicate addresses between the
> vdecsys node and the vcodec node. But for this SoC, since the stateful
> decoder code makes other uses of the VDEC_SYS register space, it's not
> straightforward to remove it.
> 
> In order to avoid the same address conflict to happen on mt8183,
> since the only current use of the VDEC_SYS register space in
> the driver is to read the status of a clock that indicates the hardware
> is active, remove the VDEC_SYS register space from the binding and
> describe an extra clock that will be used to directly check the hardware
> status.
> 
> Also add reg-names to be able to tell that this new register schema is
> used, so the driver can keep backward compatibility.
> 
> Signed-off-by: Nícolas F. R. A. Prado <nfraprado@collabora.com>

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>



