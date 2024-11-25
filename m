Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 31BAED3B7FB
	for <linux-mediatek@archiver.kernel.org>; Mon, 25 Nov 2024 10:17:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=N/U591jDR61jTaBydM13/5UfJskFc+l7AdDJHwvu6Cg=; b=Pr/qOuRRyFk7YYJFNKUcWtNLlF
	/3HKE5gr4XXRo0FYmbWjMLdyyR3K1JG0V7BKuK5lcKiHSYrhq+5gtR0Uw8d1BhrSY9Qat8yFxDD0s
	bHiFfJCcDMWCSXOPPX23UeifhWuHqdjUxL5g6VqwVIS3Cr/QZ+yt2m8Sfdg1Rrf9vQL+nWUvNBjJr
	ezlGcQjJEdpTGKSKlQiMg7lI4R1eIWUjv+meNtofS/V4hTw1YwhnNSJaxWPvc5vgr39inpvu2C8qd
	6w0SgyxOw74/soEOKwOMpLXrca7csJ+kva4xamh4KBZ3AiGpMCe8XRL5XycW3r5HXjCJHHGgkYb4Z
	Xn2PF5rw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tFWA3-00000007i2A-3MRL;
	Mon, 25 Nov 2024 10:17:46 +0000
Received: from bali.collaboradmins.com ([2a01:4f8:201:9162::2])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tFVln-00000007ef9-2o88;
	Mon, 25 Nov 2024 09:52:41 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1732528357;
	bh=2tS8FIGs5XfE/2qFIHTISjAC2cAm3XxgBs/cPNnw7kI=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=qP6Pk+LCYgDMpAulcmdEP+3T1YaUinBnS5Q/YXyUtee5d1kafzYxViIItesWz5ywp
	 Lj5lB9+CLm221BhmLUGC7qAXN1mGMcry8/KkzOHY8fcmD9Z+aOwe/o9RiEdWrpKd8y
	 lf7MubkhsxMmQBb0z/p376R+eZPuEvCihD7+VCsc24fHCywctPYXvykTy7q7jtKQpb
	 cgtHD59rIUdVrLyd53PTEQ/7bB35w3gN11AyAbX5+oYjITIoJ+IXtskiXoBfbfI4Qp
	 A+LFiXEMMzPqTKJod654CsxwgEuVin5Tqovg2VhRLJS7MKC4IZ7pTt+OIfoLGSkN00
	 LHGAZ6qci66Ng==
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 79B6A17E14D5;
	Mon, 25 Nov 2024 10:52:37 +0100 (CET)
Message-ID: <dbe132d3-94bf-4801-8d52-167cb2074038@collabora.com>
Date: Mon, 25 Nov 2024 10:52:36 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v11 7/7] arm64: dts: mediatek: mt8173-elm-hana: Mark
 touchscreens and trackpads as fail
To: Chen-Yu Tsai <wenst@chromium.org>
Cc: Matthias Brugger <matthias.bgg@gmail.com>, Wolfram Sang <wsa@kernel.org>,
 chrome-platform@lists.linux.dev, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 linux-kernel@vger.kernel.org, Douglas Anderson <dianders@chromium.org>,
 linux-i2c@vger.kernel.org, stable+noautosel@kernel.org
References: <20241106093335.1582205-1-wenst@chromium.org>
 <20241106093335.1582205-8-wenst@chromium.org>
 <1246d672-4370-4db7-b4d0-368524809435@collabora.com>
 <CAGXv+5H8YwiTyk1eMSwPLuGw5sQxec4n8OKR-Qa5wz8QGH4h9w@mail.gmail.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <CAGXv+5H8YwiTyk1eMSwPLuGw5sQxec4n8OKR-Qa5wz8QGH4h9w@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241125_015239_873647_344BD92A 
X-CRM114-Status: GOOD (  11.07  )
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

Il 25/11/24 09:01, Chen-Yu Tsai ha scritto:
> On Thu, Nov 14, 2024 at 6:36 PM AngeloGioacchino Del Regno
> <angelogioacchino.delregno@collabora.com> wrote:
>>
>> Il 06/11/24 10:33, Chen-Yu Tsai ha scritto:
>>> Instead of having them all available, mark them all as "fail-needs-probe"
>>> and have the implementation try to probe which one is present.
>>>
>>> Also remove the shared resource workaround by moving the pinctrl entry
>>> for the trackpad interrupt line back into the individual trackpad nodes.
>>>
>>> Cc: <stable+noautosel@kernel.org> # Needs accompanying new driver to work
>>> Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>
>>> Reviewed-by: Douglas Anderson <dianders@chromium.org>
>>
>> Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
> 
> Hi Angelo,
> 
> Could Wolfram also take this patch instead of it having to wait another cycle?
> 
> 
> Thanks
> ChenYu


Acked-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>

Yes

Thanks,
Angelo

