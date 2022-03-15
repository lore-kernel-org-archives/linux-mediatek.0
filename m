Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 54CF6C433F5
	for <linux-mediatek@archiver.kernel.org>; Tue, 15 Mar 2022 14:55:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=hvtshcciJpPe7C8rot63p+7+QMTvUG04jBpY2IbgHpY=; b=hC5mCmD1fqfkjR
	OHXsk1YFexTwJr4viJPUKiHdgXF/rns1zKC3xZycuJzpbsgNzSMK+edJx5v857DlENXmnxoPZvBw4
	vpaQ6U3zeipblOus+8Gj/rPe/rGsVc/mDpeADyIIgELh21ROgg9EJ+XLdoR73DIfIYP5XX0XOKcfO
	yDAts5macr6y9RghTqI8g1aiRkmkUKxyhoDr+G3j/YaF2EfZLMlJWOQ1JZwCPI/MFALYikTyexFwx
	sX/ogRB/Ha+b8wfjyPJcr4WdA/2SUUHL8G81M/LSzFLkB211f1+7MZkjwRN8aUS4g5bTtbUQJZECi
	zeJI44k3WkCnPr7n7I9Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nU8Zo-009Zld-MF; Tue, 15 Mar 2022 14:55:08 +0000
Received: from bhuna.collabora.co.uk ([46.235.227.227])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nU8ZI-009ZZN-1n; Tue, 15 Mar 2022 14:54:37 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (Authenticated sender: kholk11) with ESMTPSA id 58B011F43060
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1647356074;
 bh=hHNpfGwqkJSOcovWxTUWQn3EQ1HHqdXqDO9MtaovTe4=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=Uj6Do1zWF2asj2KEF4/LeJskKOAvp3f+26kTzJbrFDcBthf8Kzn0FaSeeqsvSZqsi
 1fJgAC93CDkCTdl3hTouLefe9V1OV8NzxQEqQJoaJ+DWcRkM13ttz5FGL1P9rYzGu8
 ka9TVKeUjL6X/2yX0LeH+Ocvr+Ea9QAmnR+G4U4Bb6PIiP+jZzzYJU3JoRohvP2A9J
 1ItHuaF7a0AGGNFttNA45dHtWu8U6g110OTsB1xLM/8fOnj3LPE/YvflNhoq0Phs2t
 dWbz0p+oGnSdGswz+lwTyWg7tokFd+YpD5pplNHfrJYdt6pFIaW4bKMILowaCqfnOA
 nAY50SLEJinjA==
Message-ID: <2bcef4cd-998f-5929-3fa8-c185e74932d4@collabora.com>
Date: Tue, 15 Mar 2022 15:54:31 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.1
Subject: Re: [PATCH v3 21/21] arm64: dts: mt8192: Add pwm node
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
 <20220304130809.12924-22-allen-kh.cheng@mediatek.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <20220304130809.12924-22-allen-kh.cheng@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220315_075436_269652_69AFED78 
X-CRM114-Status: UNSURE (   9.35  )
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
