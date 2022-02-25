Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 62283C433EF
	for <linux-mediatek@archiver.kernel.org>; Fri, 25 Feb 2022 10:01:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=kwLhKyvcJbloNWhBfXWcYXSIPN/SBY9IcVXcB52dkFc=; b=XKUp2IUSEFCPbW
	ly5gl7lqX+lXH3vflebE/FpowSh/FUju4EqEexney5ee13k7d/XWwg9ze1oJZDccYhoNFdlCSn+h5
	UC+RBSTyDrXC2w+RVNfl2iujNJ5z+z1eBXyVC2UsoXOh6dKYeslTdXh6T86lVrIxa3PJ/b0x8Kz9W
	mF53S2/k+2cb+gWVFAr33Bfg/11t6g9JvFhvL0HVSfAyEj8DQzKOPO3LM08M4sxX3gZHpXO4Qwb3X
	+x1HNMg6pqlDbJ2tg09oAAlSbJuC+VYANolcQNCGi4d1AvOG4R0vGL2Pj+vPD4PqmJT9EUBjU1AmQ
	hlxggIWnJFfFSqIxi9iw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nNXPh-004GL0-Su; Fri, 25 Feb 2022 10:01:25 +0000
Received: from bhuna.collabora.co.uk ([2a00:1098:0:82:1000:25:2eeb:e3e3])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nNXPU-004GGM-Nm; Fri, 25 Feb 2022 10:01:14 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (Authenticated sender: kholk11) with ESMTPSA id 4A1691F45ACF
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1645783270;
 bh=D5PHixB15iSbClBF6eHaM6GctJ2rJbHgaj2nP9Jozuk=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=mjVcXZnNlW9ZVL7GKoFEZzXM0b+Zr6KGezNedLUYcvvMGbPWl61e2mDXP3oNgdZSv
 voYqQWRBgW1JkWT8kXgZoT6rqFd/CVPNVQLJdivWoqHH0q9qoQkm3KA1cvAWH5IHwv
 jnFV4BvrBaYD13EFrQTs5WpgCrakuVkeyAv+gbGLEn7WURu/J11Ex4lGF/5Jvh9v3v
 RHUDLjQ33tO9C6cqh/ojf7YGSz5EcyBWv3DnaclIzdp6/RFiIbeqw/GZsPtTiFamnX
 4KOQigzfY7zB1futUMHMfJA7Ai9C0+APpG3eDmfyvj3zfqUnLrn8KRi1iEEEjDvXco
 vtG97qB46Fe3A==
Message-ID: <ae3e077b-2e3a-8ca3-d359-040c5288f2c8@collabora.com>
Date: Fri, 25 Feb 2022 11:01:07 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.1
Subject: Re: [PATCH v2] arm64: dts: mt8195: add display node for vdosys0
Content-Language: en-US
To: "jason-jh.lin" <jason-jh.lin@mediatek.com>,
 Rob Herring <robh+dt@kernel.org>, Linus Walleij <linus.walleij@linaro.org>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Sean Christopherson
 <seanjc@google.com>, maciej.szmigiero@oracle.com,
 David Matlack <dmatlack@google.com>, Jing Zhang <jingzhangos@google.com>,
 Marc Zyngier <maz@kernel.org>,
 Bartosz Golaszewski <bgolaszewski@baylibre.com>,
 Sean Wang <sean.wang@mediatek.com>, Tinghan Shen <tinghan.shen@mediatek.com>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org,
 Project_Global_Chrome_Upstream_Group@mediatek.com, ryder.lee@kernel.org,
 wenst@chromium.org, chunfeng.yun@mediatek.com,
 Seiya Wang <seiya.wang@mediatek.com>, moudy.ho@mediatek.com,
 roy-cw.yeh@mediatek.com, nancy.lin@mediatek.com, singo.chang@mediatek.com,
 Macpaul.Lin@mediatek.com
References: <20220225021535.2655-1-jason-jh.lin@mediatek.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <20220225021535.2655-1-jason-jh.lin@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220225_020112_993163_93109AD8 
X-CRM114-Status: GOOD (  16.11  )
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

Il 25/02/22 03:15, jason-jh.lin ha scritto:
> Add display node for vdosys0.
> 
> Signed-off-by: jason-jh.lin <jason-jh.lin@mediatek.com>
> ---
> This patch depends on series [1]
> [1] Add Mediatek Soc DRM (vdosys0) support for mt8195
> - https://patchwork.kernel.org/project/linux-mediatek/list/?series=608548
> 
> This patch is based on [2][3][4]
> 
> [2] arm64: dts: Add mediatek SoC mt8195 and evaluation board
> - https://patchwork.kernel.org/project/linux-mediatek/patch/20220112114724.1953-4-tinghan.shen@mediatek.com/
> [3] arm64: dts: mt8195: add IOMMU and smi nodes
> - https://patchwork.kernel.org/project/linux-mediatek/patch/20210615173233.26682-15-tinghan.shen@mediatek.com/
> [4] arm64: dts: mt8195: add gce node
> - https://patchwork.kernel.org/project/linux-mediatek/patch/20220126090109.32143-1-jason-jh.lin@mediatek.com/
> ---
> Hi Angelo,
> 
> I'm sorry I couldn't find your last reply mail, so I reply you so late.
> 
> Thanks for the reviews!
> I have fixed them.
> 
> Regards,
> Jason-JH.Lin

Hi Jason-JH,

no worries about that. Thank you for sending a v2.

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>

> ---
>   arch/arm64/boot/dts/mediatek/mt8195.dtsi | 123 +++++++++++++++++++++++
>   1 file changed, 123 insertions(+)
> 

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
