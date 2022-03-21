Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 55E61C433EF
	for <linux-mediatek@archiver.kernel.org>; Mon, 21 Mar 2022 12:06:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=OdMsEyL5PXBzhHE4jFFh7abA0JFZZehwnnz+MPvdhWQ=; b=tf9h+CDmiXuafd
	rfXlYoplTqWJDzPjmc8SCnROkGnfYLC6JcbAFePyAJvP+oGfLAdCRh/sbXLZLr69jnVxkSXZQZy1P
	uienwFf/B+pNg6fsUagh4UgwL/BEuQeNqn9DTO2Vm77fKd+nlPo86CdbpxcW/zfx50f8PR3zwAfZt
	gZiTX3KB0vuzUSn0fZ4TOwDbU76jm+g8K2CrsNqov9miKeMbM60cNmKmAQNvbsaZWSHXWn7Hu2WtQ
	dBBSVntAo0gDwIn6qEZM3jyoR12MxyolBtvtLoPhX1IhjIv47sgvZN/E5ERR3wmEtU5z9urqkVT4W
	P3DeT9ZJO0QBcvfAY2rQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nWGnj-007apT-RS; Mon, 21 Mar 2022 12:06:19 +0000
Received: from bhuna.collabora.co.uk ([46.235.227.227])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nWGlv-007a02-LB; Mon, 21 Mar 2022 12:04:29 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (Authenticated sender: kholk11) with ESMTPSA id DC7991F41AD2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1647864266;
 bh=XxxTOXcmQzzf/utFY/eul8IymAsv627cSR3PPYKHUsw=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=fTtEJerib6lvh9W+wETb2/+RMmu7yejkqOA3/sUfJI61TT+daI4wp6Sj08pNWoUYl
 mu5Aul3+1ciTmuVJ/46YKUNnxR3gfEdVsB1wUh0fRaaV9Vvv+TIOz7WehoiHFwK9VV
 n0w8cy+xYdJcfrcDk6hn61DZXHG7opxb1hjZeDlfQYI6cF7umsu0QnLxpam14GHfrw
 Fns3AmiTVCoH3sf1E5jzYv4qQeDPlkXiHwZgL8LvYMc1NvPM2N1t3Yd2tdFRl3R6q/
 OfQW41q0HV4Hq3gfUY5p4X8cCJg/Ls2C+ktpQyJz4fMHmzWuKHe6PFtzCX7SPiP4SF
 XWbaC2qnRJ0Tg==
Message-ID: <1ffc7d8f-466e-22ac-36a8-196d7c5d32d3@collabora.com>
Date: Mon, 21 Mar 2022 13:04:23 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.1
Subject: Re: [PATCH v4 13/22] arm64: dts: mt8192: Add mipi_tx node
Content-Language: en-US
To: Allen-KH Cheng <allen-kh.cheng@mediatek.com>,
 Matthias Brugger <matthias.bgg@gmail.com>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
Cc: Project_Global_Chrome_Upstream_Group@mediatek.com,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org,
 Chen-Yu Tsai <wenst@chromium.org>, Ryder Lee <ryder.lee@kernel.org>,
 Hui Liu <hui.liu@mediatek.com>
References: <20220318144534.17996-1-allen-kh.cheng@mediatek.com>
 <20220318144534.17996-14-allen-kh.cheng@mediatek.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <20220318144534.17996-14-allen-kh.cheng@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220321_050427_903410_5D499569 
X-CRM114-Status: UNSURE (   9.24  )
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Il 18/03/22 15:45, Allen-KH Cheng ha scritto:
> Add mipi_tx node for mt8192 SoC.
> 
> Signed-off-by: Allen-KH Cheng <allen-kh.cheng@mediatek.com>

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>

> ---
>   arch/arm64/boot/dts/mediatek/mt8192.dtsi | 10 ++++++++++
>   1 file changed, 10 insertions(+)
> 

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
