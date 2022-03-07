Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 54425C433EF
	for <linux-mediatek@archiver.kernel.org>; Mon,  7 Mar 2022 10:49:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=XWgb7Q/9jZqvi3v1phFZu4ANYj9TcW1e83DYt18H4ek=; b=X0e/GmAbRDnXWE
	MevyXSMrDUjK42/d4+VIc+EAijHZQVKCsCpSLm71wIB0yB+InMvciV4oVBCbN4SVIWCnNbNQ6pmbB
	UyY9RsIKwAZxBshD1t5sSZMqcQqbOL4dZ4xeOFt3f5pJohV9o81I1VV6oEqDk+PKnk0wMnGXFWE56
	hgWEbaVKBfVdx3rMtXmHcmiMKVLAt/I1Ne58VGrs040UunYi5ETBIuv7eOyYajutDi6W/Bu4F8Cvk
	f6NpXlndDcFNiqOC6eefRlVt3aTc6hfiR85fL3z/ZupRYwFd/Vo+oWNR4ToeXpseT41ikM2fih9iY
	o2oAkW7cYHtCMqa+1Q7Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nRAvm-00HDEW-Uf; Mon, 07 Mar 2022 10:49:34 +0000
Received: from bhuna.collabora.co.uk ([46.235.227.227])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nRAva-00HD9a-Fe; Mon, 07 Mar 2022 10:49:23 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (Authenticated sender: kholk11) with ESMTPSA id 93BCB1F439B4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1646650161;
 bh=xcHrA688gBPqRiYshhBRs/w3XKYVKzPjdXoPUfWuwIE=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=L13Iyh+MGBgvI0+tRh+GV1faYYieScGpgDewVXwECjJOGs0Be9EP46wJ9pTu2C+Vf
 jE2+08RPH668Jm6/nzpThsMw64DRj7rerCOm/d11db6g9CN+nQj5/osNf4gM7UcHGk
 IbjFT9Nikm0rMTBALl3aQuXam4cON5Zfu9R1U60H/rtTGR0gjx8mTb12WVe2y4sfN0
 wuKA3cctlK1YphfdNOiye9xiUMo+cxTci5x+4vaPURnX3OB8weYV90R84cT6iI/zTe
 TUXxFmRp96zvCBLJnIoI0bpGuuNG8Cblen2IMjDTUNt3V1u3n0tVF0no4rty11xpqd
 oGEmac2YETZaA==
Message-ID: <60248c8a-89a4-6f87-71f7-0732c3826e0b@collabora.com>
Date: Mon, 7 Mar 2022 11:49:18 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.1
Subject: Re: [PATCH v1 1/2] dt-bindings: i2c: update bindings for MT8168 SoC
Content-Language: en-US
To: Kewei Xu <kewei.xu@mediatek.com>, wsa@the-dreams.de
Cc: matthias.bgg@gmail.com, robh+dt@kernel.org, linux-i2c@vger.kernel.org,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org,
 srv_heupstream@mediatek.com, leilk.liu@mediatek.com, qii.wang@mediatek.com,
 liguo.zhang@mediatek.com, caiyu.chen@mediatek.com,
 housong.zhang@mediatek.com, yuhan.wei@mediatek.com
References: <20220307033649.11564-1-kewei.xu@mediatek.com>
 <20220307033649.11564-2-kewei.xu@mediatek.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <20220307033649.11564-2-kewei.xu@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220307_024922_708785_AF8C5DF7 
X-CRM114-Status: GOOD (  12.04  )
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

Il 07/03/22 04:36, Kewei Xu ha scritto:
> Add a DT binding documentation for the MT8168 soc.
> 
> Signed-off-by: Kewei Xu <kewei.xu@mediatek.com>

A conversion to dt-binding (yaml) would be very appreciated... however there
is nothing wrong with this addition, so:

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>

> ---
>   Documentation/devicetree/bindings/i2c/i2c-mt65xx.txt | 1 +
>   1 file changed, 1 insertion(+)
> 
> diff --git a/Documentation/devicetree/bindings/i2c/i2c-mt65xx.txt b/Documentation/devicetree/bindings/i2c/i2c-mt65xx.txt
> index 88f74a3c81ec..026985b8f61a 100644
> --- a/Documentation/devicetree/bindings/i2c/i2c-mt65xx.txt
> +++ b/Documentation/devicetree/bindings/i2c/i2c-mt65xx.txt
> @@ -12,6 +12,7 @@ Required properties:
>         "mediatek,mt7622-i2c": for MediaTek MT7622
>         "mediatek,mt7623-i2c", "mediatek,mt6577-i2c": for MediaTek MT7623
>         "mediatek,mt7629-i2c", "mediatek,mt2712-i2c": for MediaTek MT7629
> +      "mediatek,mt8168-i2c": for MediaTek MT8168
>         "mediatek,mt8173-i2c": for MediaTek MT8173
>         "mediatek,mt8183-i2c": for MediaTek MT8183
>         "mediatek,mt8186-i2c": for MediaTek MT8186



_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
