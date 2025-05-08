Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 446B6C3ABBE
	for <linux-mediatek@archiver.kernel.org>; Thu,  8 May 2025 08:19:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=w85/6rgvGAOB4SsUeEe6vc5w4zMuRzHb4rVDlvW989U=; b=R3VNa2SIHRo+891wMemDUgH3Uy
	Jg+9Go9OtokJ4m5rEF/9y9jeEGfJFCVYADiEVlm+qMdH2f9dHuu1qFDMnaGFZgwXnjTGSPCtDMyYr
	BpZCYBi1uBeof/DU6yDTOtW8Hi19Q4n+QRUusah2mML4Yh/Rnn+1jcdVx8iaRBKQBa9gMPDTJqcmh
	OflkDoLx0sQk0jT6E5HZlXDLEPlX8rexTkvnGshHdBCOl2VlxJaDpW5lp6hwX8+QbC9syNJRDKwL2
	wIe/sHQwmaNDhVdY/0itR6o9L0AadlhNG4ezpkstMgDA1s3hsPMMHP9VMxc2IF9RVueSUzWDCnJez
	4UZsPJNA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uCwTn-000000005WK-0ey5;
	Thu, 08 May 2025 08:19:43 +0000
Received: from bali.collaboradmins.com ([148.251.105.195])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uCwPs-000000004pN-3lvJ;
	Thu, 08 May 2025 08:15:42 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1746692139;
	bh=0J5yyuWYoiqeNSzqTqaD/OXkyRKI3jBk1sYRAPwhWEM=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=KYe+QqaYHxtSZYuPW61wnny7iHdzaiyk/VdmR7/oKaJKB7i0uDQet2do1NGazV1YQ
	 cLxdziCRoag4XEfGt/p292DHgFhZpbja63fY8YbbVWtSNYywQ0VRLPyeRwciMrgAC9
	 IIjnhxe9ItQ77AQQU26VQmh0q/gsJYM2jAlcJRlEyGupSg8xvxOzJzZrdYTuWn2lwU
	 yOlU6K/7nR95f/2/x+GHUlFuzAgW8EZBJ6exf09QRilKptvKvbyuTK6pyQ8Ef8pRhk
	 3aSkAqoxgFmhezGJ8WeTyNHDgoIcak/+cobyN70MRpiq+A55W0IMMBAZoJSyE8cetB
	 3NFc1svtJ1jHQ==
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 8995317E0FBA;
	Thu,  8 May 2025 10:15:38 +0200 (CEST)
Message-ID: <fe72f05e-6a79-4240-8cf5-7a20e094aa46@collabora.com>
Date: Thu, 8 May 2025 10:15:38 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/3] dt-bindings: serial: mediatek,uart: Add compatible
 for MT8189
To: Sirius Wang <sirius.wang@mediatek.com>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Jiri Slaby <jirislaby@kernel.org>, Matthias Brugger
 <matthias.bgg@gmail.com>, Sean Wang <sean.wang@mediatek.com>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-serial@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, wenst@chromium.org,
 xavier.chang@mediatek.com
References: <20250508063546.289115-1-sirius.wang@mediatek.com>
 <20250508063546.289115-3-sirius.wang@mediatek.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <20250508063546.289115-3-sirius.wang@mediatek.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250508_011541_083387_89E33BC1 
X-CRM114-Status: UNSURE (   5.54  )
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

Il 08/05/25 08:35, Sirius Wang ha scritto:
> Add compatible string for serial on MT8189 SoC.
> 
> Signed-off-by: Sirius Wang <sirius.wang@mediatek.com>

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>


