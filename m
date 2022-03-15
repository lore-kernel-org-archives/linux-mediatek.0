Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C74DAC433EF
	for <linux-mediatek@archiver.kernel.org>; Tue, 15 Mar 2022 14:34:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=IxExfiJfY74uPfTWB06uwD5XmmIwX/R5s9an0y/zyGs=; b=zE4BGPNatdgMxq
	3Qd6nBV1pjMmh+5ojqNCXzdsRrVTtmVi4NzuZyBxakE14lSf2QFTpRuj1SMiyqO4yOvQHwYgJeUEb
	nIPauvoO6n3GDfvJSCFDTttTYCD7V1aV05bYJfUCPBNhPzDNXjReUhPP9uteL7JPNoJmbGzIrtwA6
	mmxGHLvDa/hhpfW3SySHYHb/p5T1kp54qs2Fb2UDgu+IX8u5iEMNtoLelK8MyB96cXpRyNy5Hraal
	Sp5qw21QYLhqbNEx7huvlKWARZbWyFXv2ECiTtV99MHYJakTe4SMG175RRnPwYCutnZEar14wErIO
	w/TqKVNoONtfyZqKesSA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nU8Fl-009Sua-JM; Tue, 15 Mar 2022 14:34:25 +0000
Received: from bhuna.collabora.co.uk ([2a00:1098:0:82:1000:25:2eeb:e3e3])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nU8FY-009Sq8-C0; Tue, 15 Mar 2022 14:34:13 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (Authenticated sender: kholk11) with ESMTPSA id AA5741F4435D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1647354850;
 bh=oaY2smZek0FjJMLvsUD29xpTZGK6PcRh2JZv/s5EJCM=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=DWGuhcpVgjKV+eWwRkOa7PCd3K5MAVPQSh30xaSEMyF66Hv2436iXeKbRlZH9vJrL
 MuATUR3bTDS4UC7OEqonbt6r6KQpECI+XQhB5DTnJyL0FggPn3uAj3AQHWGL9ruze1
 5KB1nNo7l2XjqMUD+1g8QpBSk5gszwhM9Rx+XcsKgDv0FQwQAlqIHcjTaMQb6CXnHu
 /fHtUG2Lsfm8QQ0x8CVQ5xCLTYkOnYK/ivN9iWotGCbmlxkqIsyM2NwATEV++QyqXw
 zX6oXrKSPEmZeaN/U6frw3jlNI1Rdlmpnrb/xcoeYQp8jLbnoUKM5qW8pytvdo1wkJ
 ADYaHGVISaLog==
Message-ID: <8aae41c4-fff5-630a-77d0-62cef43d5ad1@collabora.com>
Date: Tue, 15 Mar 2022 15:34:04 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.1
Subject: Re: [PATCH v3 05/21] arm64: dts: mt8192: Add usb-phy node
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
 <20220304130809.12924-6-allen-kh.cheng@mediatek.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <20220304130809.12924-6-allen-kh.cheng@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220315_073412_620002_F08463E1 
X-CRM114-Status: UNSURE (   9.16  )
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

Il 04/03/22 14:07, Allen-KH Cheng ha scritto:
> Add xhci node for mt8192 SoC.
> 
> Signed-off-by: Allen-KH Cheng <allen-kh.cheng@mediatek.com>

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>

> ---
>   arch/arm64/boot/dts/mediatek/mt8192.dtsi | 22 ++++++++++++++++++++++
>   1 file changed, 22 insertions(+)
> 

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
