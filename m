Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E3EECC433F5
	for <linux-mediatek@archiver.kernel.org>; Tue, 12 Apr 2022 15:31:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=iOt61RpU9RTtH2WG9ikUVCKd3Ip63NisitV1N/AIlXk=; b=DX+ltimbvqm6J6
	Mj3wVXF70B0bio/GZ3kyABXzLWLTVfm8q03wC5RdHBW8xhU7IkjgvqDc6A96Mpuz4Ycbn2B1dgig1
	IrBTUOWZ9f94sllhhbv8f39Ia2rqf9hwsuqEJyozri2E4EAyq0UZ+5JmVNvRq2SNBpIoNjTsPQDf3
	ilQye3kR2YZ5TXXQS5JtKsHr5eDbcIlz7Fg1pvQCwsXaEhRYGnE+nL25ZuQJlxc9siHaYHVlknqbX
	UeBk0FYnFQehsx1OeEtwGiiGb1UaChFX8f2uFJY7me4Uw5719Nls1Rc9Ml7a5VPZdpodNoT/MYS7y
	fB10SzC9/9ijHmWrk0jw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1neITq-00EvrP-Bc; Tue, 12 Apr 2022 15:30:58 +0000
Received: from bhuna.collabora.co.uk ([2a00:1098:0:82:1000:25:2eeb:e3e3])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1neITa-00Evef-4V; Tue, 12 Apr 2022 15:30:45 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (Authenticated sender: kholk11) with ESMTPSA id 4C8611F449DD
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1649777437;
 bh=lQ4NdSCZzsjrOwPly6smii3XDpZabMAoBkBVD0ftePQ=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=DypMHo/iqBWeOVAIsUtbr1TgMRAo4Egs4mPvgCYZkmDXSh575Wnsh2QlOf4+zqnZ3
 HTc+h+30pelHZrWbwZMI5mxhwWB4ip2KId8dHBa1Hdul5lrLZ03e95mkFmtWa6Lrf+
 rwomvfA6S+IH4/wD0SLVUnRByMfS8kW8J3AGX83mzQnhbR3vb42SDAAkVrb0J7djP5
 zh/RBmU1mEP1yWGCGFzM1LuMe2QrvVjGYOynP1YYnV9Cp72fk4DlELrtKCKkcvLgYR
 1W/NwnhXSpzpC0pD7RFoZjPUG1x1d/zhWdLVzl1kRe0VDGNZZdUrUMIsNoF9uN/e3h
 CGn/SyVelKLJg==
Message-ID: <138aad1c-63d7-371a-ff41-4fd7022d365d@collabora.com>
Date: Tue, 12 Apr 2022 17:30:34 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [PATCH 2/2] soc: mediatek: svs: add support for mt8186
Content-Language: en-US
To: Tim Chang <jia-wei.chang@mediatek.com>, Rob Herring <robh+dt@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Philipp Zabel <p.zabel@pengutronix.de>, Roger Lu <roger.lu@mediatek.com>,
 Kevin Hilman <khilman@kernel.org>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org,
 Project_Global_Chrome_Upstream_Group@mediatek.com, hsinyi@google.com
References: <20220412112127.21570-1-jia-wei.chang@mediatek.com>
 <20220412112127.21570-3-jia-wei.chang@mediatek.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <20220412112127.21570-3-jia-wei.chang@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220412_083042_357548_FC349136 
X-CRM114-Status: UNSURE (   8.19  )
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

Il 12/04/22 13:21, Tim Chang ha scritto:
> From: Jia-Wei Chang <jia-wei.chang@mediatek.com>
> 
> MT8186 svs has a number of banks which used as optimization of opp
> voltage table for corresponding dvfs drivers.
> MT8186 svs big core uses 2-line high bank and low bank to optimize the
> voltage of opp table for higher and lower frequency respectively.
> 
> Signed-off-by: Jia-Wei Chang <jia-wei.chang@mediatek.com>

For the code only, as I am unable to test:

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
