Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 93FDEC4332F
	for <linux-mediatek@archiver.kernel.org>; Tue,  4 Jan 2022 09:13:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:Cc:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=B0l3ZYJ5j1ybBdkjqSSa6NnXqkZw3qYuUM/0uI62koQ=; b=qJ+xdbME6Yo+qbmZl2lmHyWvJB
	JenV5iW/KQ6VX6w1vi2vO6JUUYQUzHSe7YzqwQNDtJcJ+BBsOUbNUVpF1vPlsftCGd2ouRjY8Q0CY
	MTdR+LbVVe0WFkBxbZD3ma1h/lxjCpyRgRqAxjaniNGS0bcy6O7AJ0TT5foIxms4BJ88fnbLP54Jn
	jYa9PDSoduA1R1n165TZzLaMIhmx+GudjHcq2Of8KXPrwgSiPGsK2YO4XVGNQDt3a+TJW93vDvrF5
	uLVg4XdGAGCRz7QFvAn9REguKwOe/r30EBNSS/G71lIrNJsD2Lh/cmpuFv9uB/caqsyz3bjmNWVr+
	TkpYxTvQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1n4ft2-00AuzJ-KA; Tue, 04 Jan 2022 09:13:44 +0000
Received: from bhuna.collabora.co.uk ([46.235.227.227])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1n4flP-00Asl9-I9; Tue, 04 Jan 2022 09:05:53 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (Authenticated sender: kholk11) with ESMTPSA id E59141F42D02
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1641287150;
 bh=LKHYs6cNRjJodREjyWXR9U6nFRgqGcHVmkVWUWSF8Wo=;
 h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
 b=T57fmN1aV+VEjBJZF3unAIRoCILKIDjrVV2dmGpTZ2tIVcniUChypoEHcvauTAlaf
 akuxrTMQOdRGUXM6nJXXEu+gP5MNnU8AR/c6il31bn+7hM5QfAMzgXbRW38QnBKgcB
 WL9H06wTTKdhyDbw6c1YIz0Md6a2QlfMAW5lt+wUPtXMSsItG44YbiGWN3UcMkjUwo
 h4SuJwixl1Y0GSI9nv6qjyIekwD86vH+lpXZJ2STy3hEp2ARohLqmmt01PgCiOe2Ec
 OgM+HVu6igZ1fwpAsGj+goeDprqqX+dfEcJBYTRbJ0XusZA3fKPj9UAPgtrRmCoK8k
 VBIYYQOGgHnCw==
Subject: Re: [PATCH 2/2] dt-bindings: mediatek: add compatible for MT8186 pwrap
To: Johnson Wang <johnson.wang@mediatek.com>, robh+dt@kernel.org,
 matthias.bgg@gmail.com
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 Project_Global_Chrome_Upstream_Group@mediatek.com
References: <20211230114913.9829-1-johnson.wang@mediatek.com>
 <20211230114913.9829-3-johnson.wang@mediatek.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Message-ID: <e5992de7-2570-8610-8acf-78313ff74718@collabora.com>
Date: Tue, 4 Jan 2022 10:05:47 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <20211230114913.9829-3-johnson.wang@mediatek.com>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220104_010551_799378_80236AA3 
X-CRM114-Status: GOOD (  15.07  )
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

Il 30/12/21 12:49, Johnson Wang ha scritto:
> This adds dt-binding documentation of pwrap for Mediatek MT8186
> SoCs Platform.
> 
> Signed-off-by: Johnson Wang <johnson.wang@mediatek.com>
> ---
>   Documentation/devicetree/bindings/soc/mediatek/pwrap.txt | 1 +
>   1 file changed, 1 insertion(+)
> 
> diff --git a/Documentation/devicetree/bindings/soc/mediatek/pwrap.txt b/Documentation/devicetree/bindings/soc/mediatek/pwrap.txt
> index d74a7a5ae9f2..214a34633824 100644
> --- a/Documentation/devicetree/bindings/soc/mediatek/pwrap.txt
> +++ b/Documentation/devicetree/bindings/soc/mediatek/pwrap.txt
> @@ -27,6 +27,7 @@ Required properties in pwrap device node.
>   	"mediatek,mt8135-pwrap" for MT8135 SoCs
>   	"mediatek,mt8173-pwrap" for MT8173 SoCs
>   	"mediatek,mt8183-pwrap" for MT8183 SoCs
> +	"mediatek,mt8186-pwrap" for MT8186 SoCs
>   	"mediatek,mt8195-pwrap" for MT8195 SoCs
>   	"mediatek,mt8516-pwrap" for MT8516 SoCs
>   - interrupts: IRQ for pwrap in SOC
> 

Acked-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
