Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C3D63D49799
	for <linux-mediatek@archiver.kernel.org>; Tue,  3 Dec 2024 09:14:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=HbhoI7yjnk7c8Pf7JX/MdZzfEVXAeVwsxPCVjZjlVls=; b=ZPez7NS0OuQpLIJvLYJ/HTImXj
	2cSzz0laZBa57kBZV/oFNGEOsfNb8GPUyGAhIgTKV24QWo0mcb7WRzUwFFpzTDUZeTdmwLXAeXXZq
	y4/ssfx9uN3YyWCx+RN0prnq7wb3ohrWT2F0H9H9/tL0UFwBr8NQXVMq19j2S9mBDr2+73WviRyy0
	WTn6rIMzmiHcx4LW36pwuzG7nl3j8b9Ncaro6+8W+dvy9+F3wSeonyItxVx25+Uv5EROcYa1B0uP1
	tiMzSAQJex7+SO7+6gV92k4gUedcY5Wt1EYjnabr1pidJuJvh1IwhGem8W1F6O5t8W5vHYpf9jfaU
	JQ7gAnlA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tIOzR-00000008phX-45gI;
	Tue, 03 Dec 2024 09:14:41 +0000
Received: from bali.collaboradmins.com ([2a01:4f8:201:9162::2])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tIOwH-00000008oy0-3WKv
	for linux-mediatek@lists.infradead.org;
	Tue, 03 Dec 2024 09:11:27 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1733217084;
	bh=76A10C0+a+1sqcPCvHskNVyiLtHtVGvnW0mmH/vp9SM=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=bu9xPqeTxO4dscqc9VgQViTib7TqSFnpanUdnKfQWyGwm1YIjpZZbkWCLJI/L6Gho
	 xIITRDYl00sLEe0ifC7Fook7juoWG/ODjQkdnGUNN00bI3dGMDqCgghpzrKk68hJp9
	 xX6wOJwBPZW3qGvGDHUneeop5CSm2M14Pb2A2CkSn7/QATtEY/Y2Wyb65zDqYTqtsO
	 SQxiUPSjzfQOhD9s8G+tFopQkS0Q+rSrPxCA08m0T2X2WWOtUaPXjyFQBzi14otJJo
	 8/xmH/jLex+EDqhuUP7vT/46s3HWc0B5ccihTj9h0DFtZmOPJxGBk37RcBryYWicWO
	 5Unk3i9eKLjHQ==
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 1BF9617E14FB;
	Tue,  3 Dec 2024 10:11:24 +0100 (CET)
Message-ID: <4fd73e67-1f39-4f5e-87d7-31e9c355b049@collabora.com>
Date: Tue, 3 Dec 2024 10:11:24 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 6.6 2/2] arm64: dts: mediatek: mt8195-cherry: Mark USB 3.0
 on xhci1 as disabled
To: Chen-Yu Tsai <wenst@chromium.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Sasha Levin <sashal@kernel.org>
Cc: stable@vger.kernel.org, linux-kernel@vger.kernel.org,
 Matthias Brugger <matthias.bgg@gmail.com>, devicetree@vger.kernel.org,
 linux-mediatek@lists.infradead.org, Koichiro Den
 <koichiro.den@canonical.com>,
 =?UTF-8?B?TsOtY29sYXMgRi4gUi4gQS4gUHJhZG8=?= <nfraprado@collabora.com>
References: <20241202081552.156183-1-wenst@chromium.org>
 <20241202081552.156183-2-wenst@chromium.org>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <20241202081552.156183-2-wenst@chromium.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241203_011126_017611_46DE538E 
X-CRM114-Status: UNSURE (   8.29  )
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

Il 02/12/24 09:15, Chen-Yu Tsai ha scritto:
> [ Upstream commit 09d385679487c58f0859c1ad4f404ba3df2f8830 ]
> 
> USB 3.0 on xhci1 is not used, as the controller shares the same PHY as
> pcie1. The latter is enabled to support the M.2 PCIe WLAN card on this
> design.
> 
> Mark USB 3.0 as disabled on this controller using the
> "mediatek,u3p-dis-msk" property.
> 
> Reported-by: Nícolas F. R. A. Prado <nfraprado@collabora.com> #KernelCI
> Closes: https://lore.kernel.org/all/9fce9838-ef87-4d1b-b3df-63e1ddb0ec51@notapiano/
> Fixes: b6267a396e1c ("arm64: dts: mediatek: cherry: Enable T-PHYs and USB XHCI controllers")
> Cc: stable@vger.kernel.org
> Link: https://lore.kernel.org/r/20240731034411.371178-2-wenst@chromium.org
> Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
> Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>


Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>



