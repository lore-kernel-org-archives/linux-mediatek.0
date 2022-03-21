Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 64702C4332F
	for <linux-mediatek@archiver.kernel.org>; Mon, 21 Mar 2022 12:05:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ODSlF36rPXTmkBu2bZ9fBeFCbc1MVPY0y09Jtj9CGsk=; b=f5gXHXd2EX9yYp
	OgCYlJ74vSltvV2Rl4yFRR0MehkWGZ6EP2xL9/fELoA858i8+tIaavg9meF2ggl97RfFdO/kvN99U
	9hlR7TKGSSjnpyTRogckoWSZS8F9mKFtjjsCzDqWkZcO37Ts8q7yXSYSzcbvk56q200xN50ZDa8Ju
	crpp1pctjZmjHsoPIItFnuLK+/4GqID2whenMff89KPBWNq19QX7+9OWDdAeFSY34HIgloFdCVyax
	2eZ9S2z5r8ozj/PmH5DhhgCpHql0LRZUbkq8Lmr2qVjKGd0VIQiVNShElQtGrgnC6/VBwxFqeL4pO
	v1n810pdAV5gZZnpMsOw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nWGn8-007aUS-GR; Mon, 21 Mar 2022 12:05:42 +0000
Received: from bhuna.collabora.co.uk ([46.235.227.227])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nWGlp-007Zss-GL; Mon, 21 Mar 2022 12:04:23 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (Authenticated sender: kholk11) with ESMTPSA id 6D4CC1F41AD2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1647864250;
 bh=juB9ncatAw5tBbLICYJf9adbDnlB0mhtknonKfRigfo=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=LNfk/yFRVJb+YGgQfgF6LW7EDRJBX/qj4Tqt0oeQIhrJG5PlV26AG65D8k0UweCP9
 wp9rcHBOA5mCaR7g7UZvkZWlmeKyJ42C6TQhqqPXpmCinlMVxfswclq7dwKphWGIax
 DM896VSxIDIoDv44L1/ZA6sgvV0iwwsdIGe009LNef/1AFBftocX2ntjFdAQk+hVwO
 n2jZzjgQ73CdAdWYkTMP4yl0FMadeWzc2bO0CHCjBSs+uWz6t0d+NYyND8LjyoXsFN
 dJnywNHz+PQFaF1+Gd9rb3NqC5a8CI8LMmw3AtfCuMXWeL9xc3g+gzCh5+XT2a1/p1
 KXOv1rrnPvIsg==
Message-ID: <c1dfb526-1daf-5c14-2e4e-9ac2785eec20@collabora.com>
Date: Mon, 21 Mar 2022 13:04:07 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.1
Subject: Re: [PATCH v4 22/22] arm64: dts: mt8192: Add pwm node
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
 <20220318144534.17996-23-allen-kh.cheng@mediatek.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <20220318144534.17996-23-allen-kh.cheng@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220321_050421_722369_FD3BF28C 
X-CRM114-Status: UNSURE (   9.43  )
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
> Add pwm node for mt8192 SoC.
> 
> Signed-off-by: Allen-KH Cheng <allen-kh.cheng@mediatek.com>

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>

> ---
>   arch/arm64/boot/dts/mediatek/mt8192.dtsi | 11 +++++++++++
>   1 file changed, 11 insertions(+)
> 

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
