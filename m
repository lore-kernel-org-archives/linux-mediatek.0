Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 406A5C36013
	for <linux-mediatek@archiver.kernel.org>; Mon, 31 Mar 2025 08:40:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=k7wwkMJuKrgAAHqCuFo82uHn3H8Esy9hZsip1Q0vPVE=; b=aY7GASASNl88lpHgqA7Q0qGinq
	Xy3xXYda6AOPDAAnH/YeKjIi2EKIgLTwzOKtimEP3KQj40Xkv1u58rvgTLKRNCk4kliYVtmsJohvj
	8UmD4dvhDhEvYHdTS0qszlVM5R91qBv9PMAoDBBrprXlDDk6S/JhEr8gru8ql2lwcvfsPDO0RtV4J
	Iee7TXBJDL0LAMO+snhjSg96orXq1BUk55nEI8GSMVAOVmfzDeEI0QqnpRZxgAZnqcrfGGjbjZrm9
	w+OjRjRTexrDmeyGFkUDhwDE2VOy60JPlHpr6VfOLs83hsa4gDf3S7BbDK7t40Q0lebV4Ai1S+5Po
	cgsodNaw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1tzAgu-0000000HPRS-0jMq;
	Mon, 31 Mar 2025 08:40:20 +0000
Received: from bali.collaboradmins.com ([148.251.105.195])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1tzAgr-0000000HPQW-168D
	for linux-mediatek@lists.infradead.org;
	Mon, 31 Mar 2025 08:40:18 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1743410414;
	bh=ypcrZAQMEpvhOWeBUP5X3m7CMpEjeUmAFI7M8hG6qVo=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=g2ZSF3szLbk4CKxgx5lsyICscYAmAzRVfUHo6ib/UJMZ56Eq6wfxwG7AcfTdQtssx
	 thF9QOf3CU/ngGOAA3mri8RbjKhItKS7SHYmVPU6xLMwHmqs1P12EFQK+7sVWieGQ3
	 e0OD2Bj9bpVZIPBj1Dde06Pk7GTMlSTCbF0pjbb5ixRz9F0cErBOba0pix8JMxjlzD
	 LG4bPSi1+QnzhwQSB/ye0aEMJilKVO4k8fSfKomy0kS4paebpCGuX6QIewdhZCRyZp
	 ejs4IE6VOUSHF54K6Iq3g1MRoi0hmXULMTu6YCZ6L43RVLn2c48BpcpVamvv8ZQ2/n
	 c+NKvyoR4Rc0w==
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id EF98717E0860;
	Mon, 31 Mar 2025 10:40:13 +0200 (CEST)
Message-ID: <86725036-4204-49a8-a841-4f9eff69aa6f@collabora.com>
Date: Mon, 31 Mar 2025 10:40:13 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v9 1/2] dt-bindings: arm: mediatek: Add MT8186 Ponyta
 Chromebook
To: Jianeng Ceng <cengjianeng@huaqin.corp-partner.google.com>,
 sam@ravnborg.org, neil.armstrong@linaro.org, daniel@ffwll.ch,
 dianders@google.com, hsinyi@google.com, matthias.bgg@gmail.com,
 robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
 knoxchiou@google.com
Cc: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org
References: <20250328094034.3400233-1-cengjianeng@huaqin.corp-partner.google.com>
 <20250328094034.3400233-2-cengjianeng@huaqin.corp-partner.google.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <20250328094034.3400233-2-cengjianeng@huaqin.corp-partner.google.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250331_014017_458858_8909F188 
X-CRM114-Status: GOOD (  10.88  )
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
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Il 28/03/25 10:40, Jianeng Ceng ha scritto:
> Ponyta is a custom label Chromebook based on MT8186. It is a
> self-developed project of Huaqin and has no fixed OEM.
> 
> Signed-off-by: Jianeng Ceng <cengjianeng@huaqin.corp-partner.google.com>
> ---
> Chage in V9:
> - No change.
> 
> Changes in v8:
> - PATCH 1/2: Remove custom label.
> - Link to v7:https://lore.kernel.org/all/01020191ea98a643-2d0be5d1-e00b-48e0-b823-bfe2c65b0d00-000000@eu-west-1.amazonses.com/
> 
> Chage since V6:
> - No change.
> 
> Changes in v5:
> - PATCH 1/2: Remove sku2147483647.
> - Link to v4:https://lore.kernel.org/all/20240906085739.1322676-2-cengjianeng@huaqin.corp-partner.google.com/
> 
> Changes in v4:
> - PATCH 1/2: Add more info for Ponyta custom label in commit.
> - Link to v3:https://lore.kernel.org/all/20240904081501.2060933-1-cengjianeng@huaqin.corp-partner.google.com/
> 
> Changes in v3:
> - PATCH 1/2: Modify lable to label.
> - Link to v2:https://lore.kernel.org/all/20240903061603.3007289-1-cengjianeng@huaqin.corp-partner.google.com/
> 
> Chage since V2:
> - No change.
> 
> ---
>   Documentation/devicetree/bindings/arm/mediatek.yaml | 10 ++++++++++
>   1 file changed, 10 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/arm/mediatek.yaml b/Documentation/devicetree/bindings/arm/mediatek.yaml
> index 108ae5e0185d..fdc57c140af7 100644
> --- a/Documentation/devicetree/bindings/arm/mediatek.yaml
> +++ b/Documentation/devicetree/bindings/arm/mediatek.yaml
> @@ -285,6 +285,16 @@ properties:
>             - const: google,steelix-sku393218
>             - const: google,steelix
>             - const: mediatek,mt8186
> +      - description: Google Ponyta
> +        items:

            items:
              - enum:
                  - google,ponyta-sku0
                  - google,ponyta-sku1

> +          - const: google,ponyta-sku0
> +          - const: google,ponyta
> +          - const: mediatek,mt8186

Regards,
Angelo

> +      - description: Google Ponyta
> +        items:
> +          - const: google,ponyta-sku1
> +          - const: google,ponyta
> +          - const: mediatek,mt8186
>         - description: Google Rusty (Lenovo 100e Chromebook Gen 4)
>           items:
>             - const: google,steelix-sku196609




