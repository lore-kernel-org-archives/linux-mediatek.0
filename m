Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A5297FA3730
	for <linux-mediatek@archiver.kernel.org>; Fri, 13 Sep 2024 08:56:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ajQnfDxwsmtZDK18CU1+oSg+wN/wqBE59BgyP4vSTc0=; b=WkH8Cek5k4Qi8l9pjEqQUHsan9
	In+L37ZAg8xOCT6pmHrvupAtXHWh7ISZYtVqYkS+UIgNePy+jfvtjzCyuJ6FxG7MqDQvwaTKyqaE3
	08Ztbzgmy+WN+Slv5MD7tXaZwJ2P1toMW198W7HXoCwuaM/fYWRLms5B+UHjB9IGvBHKN1vGk2Ajf
	ADbbvCuReeEHjkFFIF+RN0aJu2/Hcs5IPuEqnKtHoTTF4wyNeQsdW9YWr+YNVBp+wXqtr55XiUq6S
	jhxmjEfHPftDHDWjOC9PDYzQN/LCtm0rYVFx41jqlWu5HGgLBc+T5UBemcb2vehndX4tU1SV2WpqQ
	HH+9z7ew==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sp260-0000000FPZe-40aK;
	Fri, 13 Sep 2024 08:56:04 +0000
Received: from a7-50.smtp-out.eu-west-1.amazonses.com ([54.240.7.50])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sp25y-0000000FPZ2-1QgY
	for linux-mediatek@lists.infradead.org;
	Fri, 13 Sep 2024 08:56:03 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=4232tfv5ebdrjdwkr5zzm7kytdkokgug; d=collabora.com; t=1726217758;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:In-Reply-To:Content-Type:Content-Transfer-Encoding;
	bh=yRGGn9KUcYp+ecXIoiuLZBY3QdwMcXtt0dMTBMqC+Oo=;
	b=J1s8dfmoeCoXie2NoIr5GgXLR3tnjN+/YL7PHr6Qq7OG8wirlezjvKjyoFTuWiZE
	tf1MJwRQmSgEL96UFThJ4clzGQeK07CGIOnOOoFbXsGjokyzgMRCd8FdbpZ/wqYLWR2
	IOijmY4xUxK/6b2y7LUQdKXQDyTBP99E/E4cgLM66D7na0wujBjhaee/zyRx20cXYyW
	willCxzoAggd5qA3iHMk+zGctgghmUukT9BE3usFGpQkflf6ZPKyBLbim00xKPf0bRg
	wH7kJyivEYE0XgQOSGoDYTZg/YpMtS0RdeMV8YsiV/hyzUrX0O9ZPEF5btCUgcWoobu
	4lf3Bcofbg==
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=uku4taia5b5tsbglxyj6zym32efj7xqv; d=amazonses.com; t=1726217758;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:In-Reply-To:Content-Type:Content-Transfer-Encoding:Feedback-ID;
	bh=yRGGn9KUcYp+ecXIoiuLZBY3QdwMcXtt0dMTBMqC+Oo=;
	b=YkeDtf+whiDS718vK4g6f8eVb3O/c/g+4EnaW2/ic1nIXOy31oRmfbrN42QJE4bL
	jKRK1LdovtTjGYJYTl0ATmtSymkaitSl/6EcWqiqBqBCjW66HcDxmExAYkDI+Zpiq9y
	mVfdXxcXoLjsZpDhydLhvEk47xHrNeEyXfO8csJw=
Message-ID: <01020191ea98a643-2d0be5d1-e00b-48e0-b823-bfe2c65b0d00-000000@eu-west-1.amazonses.com>
Date: Fri, 13 Sep 2024 08:55:58 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 1/2] dt-bindings: arm: mediatek: Add MT8186 Ponyta
 Chromebook
To: Jianeng Ceng <cengjianeng@huaqin.corp-partner.google.com>, 
	matthias.bgg@gmail.com, robh@kernel.org, krzk+dt@kernel.org, 
	conor+dt@kernel.org, knoxchiou@google.com, hsinyi@google.com
Cc: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org, 
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
References: <20240913031505.372868-1-cengjianeng@huaqin.corp-partner.google.com>
 <20240913031505.372868-2-cengjianeng@huaqin.corp-partner.google.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <20240913031505.372868-2-cengjianeng@huaqin.corp-partner.google.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Feedback-ID: ::1.eu-west-1.YpP9ZbxnARFfy3Cb5pfsLd/pdsXBCNK0KEM7HforL4k=:AmazonSES
X-SES-Outgoing: 2024.09.13-54.240.7.50
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240913_015602_563481_5A4B6B1E 
X-CRM114-Status: GOOD (  11.66  )
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

Il 13/09/24 05:15, Jianeng Ceng ha scritto:
> Ponyta is a custom label Chromebook based on MT8186. It is a
> self-developed project of Huaqin and has no fixed OEM.
> 
> Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> Signed-off-by: Jianeng Ceng <cengjianeng@huaqin.corp-partner.google.com>
> ---
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
> index 1d4bb50fcd8d..43a824bee1b6 100644
> --- a/Documentation/devicetree/bindings/arm/mediatek.yaml
> +++ b/Documentation/devicetree/bindings/arm/mediatek.yaml
> @@ -257,6 +257,16 @@ properties:
>             - const: google,steelix-sku393218
>             - const: google,steelix
>             - const: mediatek,mt8186
> +      - description: Google Ponyta (Custom label)

Instead of "(Custom label)", why don't we just label it as "(Huaqin ODM)" or as
the ODM board number (if not confidential)?

Or we could even drop it and just say "Google Ponyta" instead, maybe?

I don't really like "Custom label", as that looks really like a placeholder
for something else, which doesn't look right.

Cheers,
Angelo

> +        items:
> +          - const: google,ponyta-sku0
> +          - const: google,ponyta
> +          - const: mediatek,mt8186
> +      - description: Google Ponyta (Custom label)
> +        items:
> +          - const: google,ponyta-sku1
> +          - const: google,ponyta
> +          - const: mediatek,mt8186
>         - description: Google Rusty (Lenovo 100e Chromebook Gen 4)
>           items:
>             - const: google,steelix-sku196609


