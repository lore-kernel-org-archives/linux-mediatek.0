Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A8459C433EF
	for <linux-mediatek@archiver.kernel.org>; Mon, 21 Mar 2022 12:05:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=YINMJ/GXFjxOeCjahBU+gKZ8mwYMoVTy4bQxO1kFhWg=; b=0lhsaM94zJ14XK
	nJMQxLWhfzoJf5z4dmSEarDpYw+pV56q0bCljk2KJB7eHDha62fHL2kK+/xLpKF+faCvbRhKQcvvA
	MkZ282E2HMF1RqSWZTXinWBOzO4nCfXqyljtNNK5yP58x2O7PfB0qTrohf/ONTdHqy0A+yyCvAavX
	5Ub8sDqakX3qvWDXovHf6Yl4FNPCSuU1Gk0gUOi/bD4BL2fo+/tbFyGYF4uM2rkie1UHlbFSAIlct
	BrPS+zhNWUh5Jc8yFvQwo+0gCagjPfkYk9pwpi602VZHN8cZ/lX9aHapwAltawXrZrJ0pp/tSd0pU
	f3BDeV7UVw+1L49azf6w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nWGn6-007aTe-KD; Mon, 21 Mar 2022 12:05:40 +0000
Received: from bhuna.collabora.co.uk ([46.235.227.227])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nWGlp-007ZvH-Gh; Mon, 21 Mar 2022 12:04:23 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (Authenticated sender: kholk11) with ESMTPSA id 0C3101F43131
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1647864257;
 bh=2+p6LKc8stwQP9lSc/gNf5R5HnmdHx4kD0+QlTOF2X8=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=h5DJp9Aw0w8VVp1qf1v4O5Q8ezQt0Yj2tu26BtLhKyt+Nc6uOq96HC5Zw11hWuU23
 b1UU7v+dUq94UJOzpAh6t5NfeAf1GfohqGrLUh4szEkhazg3tOd+uBUoW5Qp8NTZsS
 Yu0hSPgdVAp/cjQKAULQ7ZXiS62BaQAJungoAwU1iA63J3gRJASOQpjFjTOgF0mOVS
 CIDeDQlkMAUZJHX/9j3dP6jTeSv/1h15F32OyVkUQNSAYUjxt6lg5gKvpUfOLLLEiH
 S92f/VD8/EjY+Le/a27aV+YJmFwWA0FrjtoRBeOFYiUqzovNjLqLCT4PTEEpwIMbOS
 Xz01qaD9aL62Q==
Message-ID: <3d4b08e3-185e-1f6d-0490-d523f0237ed8@collabora.com>
Date: Mon, 21 Mar 2022 13:04:14 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.1
Subject: Re: [PATCH v4 17/22] arm64: dts: mt8192: Add dpi node
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
 <20220318144534.17996-18-allen-kh.cheng@mediatek.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <20220318144534.17996-18-allen-kh.cheng@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220321_050421_804280_D01F469A 
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
> Add dpi node for mt8192 SoC.
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
