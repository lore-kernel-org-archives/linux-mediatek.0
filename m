Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C4BECC433FE
	for <linux-mediatek@archiver.kernel.org>; Mon, 21 Mar 2022 12:05:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=xRZkPnfc+ytq+oHaKx7UrJN1wZ70kxb7x5Oo64+d7Mk=; b=1yWwhq3doK36Lp
	AGFi8hwQOOxPh+8TWecP7TtzYamLVXWZY65/fcW9LR2SB2PTgaSpT8yqGPz9Q2ys7vVyAp9tCgvSl
	edNg5dYcl/vXDi5/T/lHaGNGfXGA00M1o7lnOQSB/fYwYZy5VS1lR/Lm55grKjzydgy3SsAWR5hKD
	bH689aq1zsIZv+0qlkHI2ukR0qFtw8ZNwNf2nxhz8Skvk+aCRxu6s72WwM33cvGmfsWcVMqF1ftP1
	wpoblltEXs3CddRazMNR8/mds0qkWNOKWWTVpJTnTmI69wW6NRb5aUuZ6Plv6XcwTym8WcHbFQZkL
	02eIDaPpTkDACS6eXhbA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nWGnA-007aV8-Gl; Mon, 21 Mar 2022 12:05:44 +0000
Received: from bhuna.collabora.co.uk ([46.235.227.227])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nWGlr-007ZxX-8Q; Mon, 21 Mar 2022 12:04:24 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (Authenticated sender: kholk11) with ESMTPSA id 6E3B21F43132
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1647864262;
 bh=xzzF947HKeOJPunjfbRNF+C7W9FjijE2ZgcP9tgWNIc=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=nTZKRERVnPRoZx4UnIXCoj8N0Vl2wLYvhl6t7Ni0av/blmzWqCwFJvD91ih0XIlKX
 0YX51qIonRqfwAK98gVdn3JdRgqKC5WWp14xqbgjfLHR0O2q0yDDY9HqCFlai23buu
 aSHMIavGZqVuQ/G1zuvl5I4Uwpyp4NRgPmHgUQFlNMfPMWeG9eqPjPgGQ5+5Xvuc8d
 ZcgBVs/6jF/owIJgF3F3xBX4YBGA+iB4ZJu2DTZSZA4rZJjG8VTqw7uW9CnuCxYhFB
 fXi+x3DnyIRe7LTDHOyy6RmnUgYou+W2vgmOTythwVC5S7l5mboCUt8z2xB2zp0/T4
 fcwr3+qqGdF9A==
Message-ID: <43f6046e-4c26-e78b-5917-d1dd40e82c57@collabora.com>
Date: Mon, 21 Mar 2022 13:04:19 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.1
Subject: Re: [PATCH v4 16/22] arm64: dts: mt8192: Add vcodec lat and core nodes
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
 <20220318144534.17996-17-allen-kh.cheng@mediatek.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <20220318144534.17996-17-allen-kh.cheng@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220321_050423_486781_6512E2C4 
X-CRM114-Status: UNSURE (   8.82  )
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
> Add vcodec lat and core nodes for mt8192 SoC.
> 
> Signed-off-by: Allen-KH Cheng <allen-kh.cheng@mediatek.com>

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>

> ---
>   arch/arm64/boot/dts/mediatek/mt8192.dtsi | 61 ++++++++++++++++++++++++
>   1 file changed, 61 insertions(+)
> 

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
