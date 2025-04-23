Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8DE84C369CB
	for <linux-mediatek@archiver.kernel.org>; Wed, 23 Apr 2025 11:13:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=DiBiiSzJ0LXZxEbQiGkMKf3IQr11jDHSMESQoAZZbiQ=; b=GWxKH6p7pFfLFR3RxEXeQ2RKMM
	0BGSKg/4snSrxvQq81bKuAWdiT6AmPXscuMhsGcyLGV5mhnknOtUsJwPqNgqn1CwOL6OPvIat1HAR
	TpI77HtIBHAvHWnL+z9mraVT6q8c96+7CtNmdm2gcbvnyju+Zu64q3177J3bkY0wffaHn9StDZFx2
	Dh1+dcBguMOJqVREjsGUbTHs8p3L0KDQXxg4n58Vvx7a0wk9e3sIo4m428LaibuK2luYORPQmP7Vb
	7FHzlWYZyI6/cGZV/ulS4Nnu8r4PGwhVkZ48yyjMm+1ZjxR3P5FqG8MkTU/8v88XDRL8ENYeDXUYf
	prN0Jj9Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u7Y2h-0000000AHFg-2dYw;
	Wed, 23 Apr 2025 11:13:27 +0000
Received: from bali.collaboradmins.com ([148.251.105.195])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u7XSe-0000000ABfH-1U7s
	for linux-mediatek@lists.infradead.org;
	Wed, 23 Apr 2025 10:36:13 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1745404570;
	bh=E4aNkXNAf7lPTjZel8FFf785YVcNWb1onMeMZv2npsc=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=UA0zPiLyV7Q9K2NWcWRFhj5QjqtUC1OdI3G2Nk5JOb6hDt0WUKc4P9OZg44rkkM55
	 XX98hdJsrEp13mLC7RKrwb7y8assf5vX2ledBdCLpfrb0U7QKfcpvEt2yduRJLm8AF
	 wmng5ZShNEn6yZmRAYOWtx3x9RxkMILV+wNZEnYHGp1Ufs9k7OwsJ/c9QaSZzfNzn4
	 bPsCeUbW6BEOkWbancb0iw76bt31+tsw3cqvJgnFmh6a2aW4hZM0VKlwXkloIKXqPD
	 X+qzo+1o8mh5Ye7QJwKhCOdN4kvXSVbBGEsHmGMnWe/3REDfuCfP1Jd5SMtJ5EXmA8
	 R0ZvL5dKN0GyA==
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 223AD17E014F;
	Wed, 23 Apr 2025 12:36:10 +0200 (CEST)
Message-ID: <8c34fd48-5bff-4089-a217-bf2d08f00fae@collabora.com>
Date: Wed, 23 Apr 2025 12:36:09 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v10 1/2] dt-bindings: arm: mediatek: Add MT8186 Ponyta
 Chromebook
To: Jianeng Ceng <cengjianeng@huaqin.corp-partner.google.com>,
 sam@ravnborg.org, neil.armstrong@linaro.org, daniel@ffwll.ch,
 dianders@google.com, hsinyi@google.com, matthias.bgg@gmail.com,
 robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
 knoxchiou@google.com
Cc: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org
References: <20250423093647.4074135-1-cengjianeng@huaqin.corp-partner.google.com>
 <20250423093647.4074135-2-cengjianeng@huaqin.corp-partner.google.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <20250423093647.4074135-2-cengjianeng@huaqin.corp-partner.google.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250423_033612_641899_3515EDE9 
X-CRM114-Status: GOOD (  11.13  )
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

Il 23/04/25 11:36, Jianeng Ceng ha scritto:
> Ponyta is a custom label Chromebook based on MT8186. It is a
> self-developed project of Huaqin and has no fixed OEM.
> 
> Signed-off-by: Jianeng Ceng <cengjianeng@huaqin.corp-partner.google.com>
> ---
> Changes in v10:
> - PATCH 1/2: Add enum for ponyta sku.
> - Link to v9:https://lore.kernel.org/all/20250328094034.3400233-2-cengjianeng@huaqin.corp-partner.google.com/
> 
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
>   Documentation/devicetree/bindings/arm/mediatek.yaml | 13 +++++++++++++
>   1 file changed, 13 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/arm/mediatek.yaml b/Documentation/devicetree/bindings/arm/mediatek.yaml
> index 108ae5e0185d..bfa38e7fd0f7 100644
> --- a/Documentation/devicetree/bindings/arm/mediatek.yaml
> +++ b/Documentation/devicetree/bindings/arm/mediatek.yaml
> @@ -285,6 +285,19 @@ properties:
>             - const: google,steelix-sku393218
>             - const: google,steelix
>             - const: mediatek,mt8186
> +      - description: Google Ponyta
> +        items:
> +          - enum:
> +              - google,ponyta-sku0
> +              - google,ponyta-sku1
> +          - const: google,ponyta-sku0

You can't have sku0 as both const and enum.
Since there's no board declaring both, drop the enum.

Regards,
Angelo



