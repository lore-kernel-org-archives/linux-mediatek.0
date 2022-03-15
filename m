Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9064AC433F5
	for <linux-mediatek@archiver.kernel.org>; Tue, 15 Mar 2022 14:54:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=DdNUZESCznliGvyidz3r5ZUz2rYqL+c43PjjoMg6TcE=; b=xdSa/jrTCwPUHo
	ZGQ6oLj+4TshmTsNyEVOhyiia2t2u46Iutc+GbEVBqq0UAuGJmUnwuFits2T+OTSbDAS095NP8+km
	QpTRxyw8IzL2JAry6+M7SsQ4TX/hnBqPO8Q6qtkl3x8WDnx85281sMWbBOdKVE99TITjG1TxnVge4
	BF2EcAqcwLfrJaelE7cGI/hjS5Vpoof3GdCD/QPnzHbxmFbaO8eP//dH7IP+cSm32ZvZsTUwxGJgQ
	hK7odLXPzovaLnlPPzCWl+QI0vtDVvvzTpIM4FK5VBoctBJ3UTFLbp/HUamUDelBpzdHwCkgYR9le
	cxWFcyUnBULDsf7Za29A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nU8ZW-009Zfb-RX; Tue, 15 Mar 2022 14:54:50 +0000
Received: from bhuna.collabora.co.uk ([46.235.227.227])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nU8ZG-009ZZ1-MU; Tue, 15 Mar 2022 14:54:36 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (Authenticated sender: kholk11) with ESMTPSA id DA64A1F4305E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1647356073;
 bh=eIrlImnsszc818O3+euA/0yi4B+s9IYLXKObZEOtXEk=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=C+Rf1ZFHf3p/MfmKhikakuDwUkemARip+mt7wtoE8algflEjjpeQwLLhCc86KT1uo
 luaUdW68Kz+wWqSpBkHXwh2ES7MgFjBLZTjj+6XyGfOu6ynuITL0/6A/6FLj428v5k
 8VB/xvXbwJbcr1Z/5UIiblsB6TkhjGjTKevv1tqEmaJHnarigML2M9tg5MbzOO22XP
 WDphQRkAB1lDDKwGr+LxydWCQb+jp9dUiYTrwWpd3PwHMRCu1xAWHrI3Vt6z9isfnt
 nVB3Zz5CJwxmD79Z1wIKaUGEZLd4HySwzgNdQvALSHX7u9BRMLKwqAQ28POUwNubrP
 ODe89QOtO0JJA==
Message-ID: <96783335-ef61-81a4-bfa0-380d81f84ae0@collabora.com>
Date: Tue, 15 Mar 2022 15:54:30 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.1
Subject: Re: [PATCH v3 20/21] arm64: dts: mt8192: Add gce info for display
 nodes
Content-Language: en-US
To: Allen-KH Cheng <allen-kh.cheng@mediatek.com>,
 Matthias Brugger <matthias.bgg@gmail.com>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
Cc: Project_Global_Chrome_Upstream_Group@mediatek.com,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org,
 Chen-Yu Tsai <wenst@chromium.org>, Ryder Lee <ryder.lee@kernel.org>,
 Hui Liu <hui.liu@mediatek.com>
References: <20220304130809.12924-1-allen-kh.cheng@mediatek.com>
 <20220304130809.12924-21-allen-kh.cheng@mediatek.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <20220304130809.12924-21-allen-kh.cheng@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220315_075434_905265_6FCADDCE 
X-CRM114-Status: UNSURE (   9.48  )
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

Il 04/03/22 14:08, Allen-KH Cheng ha scritto:
> Add gce info for display nodes
> - It's required to get drivers' CMDQ support
> 
> Signed-off-by: Allen-KH Cheng <allen-kh.cheng@mediatek.com>

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>

> ---
>   arch/arm64/boot/dts/mediatek/mt8192.dtsi | 16 ++++++++++++++++
>   1 file changed, 16 insertions(+)
> 


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
