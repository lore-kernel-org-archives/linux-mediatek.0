Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DAE4CC46CD2
	for <linux-mediatek@archiver.kernel.org>; Tue,  2 Jan 2024 09:29:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=jZspIdwPfwjMVdesud/zxLQzSxefi2EwUC/T482SpUw=; b=kFBJUy8zek3Wx5RIf62FiVcezB
	DkLHjyH3WgPhyqftfZ3h/t6xQ1Z32OaPNS4V6Q6LbJnIA61QtNKWcE4EqCu4Rzz6FWlbhN3v9PhoO
	CRfuP+GRJtdZ+JIkOFD0sR5blJP31Qsnskmhy1XdskjKGeopUhYg/woOV7NW9e8cND8uhEV5gxKDq
	u/c7KU5Zcb6GWF672fZbg+MaanX8Z0SksGVcAWvEoDuyWzkal32avJmqy/+7srtftjqMtMHJYz9UU
	SndAVT9Ty0Rhet024uRcbHJWhFceIUFZVbt/LscqxXyEpbLyH27Ng0wnJfMZtBtedZqIUniwvvHSw
	kUBdcCOg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rKb5d-007Spg-08;
	Tue, 02 Jan 2024 09:29:37 +0000
Received: from madrid.collaboradmins.com ([46.235.227.194])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rKb5Z-007Sos-2Q;
	Tue, 02 Jan 2024 09:29:35 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1704187772;
	bh=X3V/FUP7jB7imPZc6a3/phfo3h5eler6vQthFA3zLC0=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=Jf8esK5AKxIa/brudcCHU0UiYvO2pmC29TKXKFazyHwe51nl7mJ9rTLT6TMri+DXW
	 CR1f5LycZXNqGF5vdL7dggD0rhKyTw7suSPKQWOcGD86dLIre936kfJXIYwAtGSLzz
	 0vXMs3/xqgKiY67o/avkHRZa3qO+/58d9xIvLa/jOiF4EFvBMS/j2NBHHwObWqgWzk
	 TDkLXzFwAuNuEJ8BfP+t3uCKw9lx4XzUz+j69TXSjETy24mwcHv2AkMhOO/JcVTE4s
	 3TUjuQyH3gLYM3Vsbqj6D7lS1CIl0KNca9i/VY2dNaM+RQ1R2v9dye3bNRIp93Xdhm
	 KF2TPYpN8PuWQ==
Received: from [100.113.186.2] (cola.collaboradmins.com [195.201.22.229])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madrid.collaboradmins.com (Postfix) with ESMTPSA id 8DBD53781433;
	Tue,  2 Jan 2024 09:29:31 +0000 (UTC)
Message-ID: <5ad9e27b-761f-47a9-8d7d-f182dac5d2cd@collabora.com>
Date: Tue, 2 Jan 2024 10:29:31 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] dt-bindings: media: mediatek-jpeg-encoder: change max
 ioomus count
Content-Language: en-US
To: Eugen Hristev <eugen.hristev@collabora.com>, bin.liu@mediatek.com,
 matthias.bgg@gmail.com, linux-media@vger.kernel.org,
 devicetree@vger.kernel.org
Cc: linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org
References: <20231227130812.148914-1-eugen.hristev@collabora.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <20231227130812.148914-1-eugen.hristev@collabora.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240102_012933_915590_043A377F 
X-CRM114-Status: GOOD (  14.84  )
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

Il 27/12/23 14:08, Eugen Hristev ha scritto:
> MT8186 has 4 iommus in the list, to cope with this situation, adjust
> the maxItems to 4 (instead of previous 2).
> Add also minItems as 1 since iommus are mandatory, to avoid warning
> on the example.
> 
> Signed-off-by: Eugen Hristev <eugen.hristev@collabora.com>
> ---
>   .../devicetree/bindings/media/mediatek-jpeg-encoder.yaml       | 3 ++-
>   1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/Documentation/devicetree/bindings/media/mediatek-jpeg-encoder.yaml b/Documentation/devicetree/bindings/media/mediatek-jpeg-encoder.yaml
> index 37800e1908cc..60c75b9312e8 100644
> --- a/Documentation/devicetree/bindings/media/mediatek-jpeg-encoder.yaml
> +++ b/Documentation/devicetree/bindings/media/mediatek-jpeg-encoder.yaml
> @@ -38,7 +38,8 @@ properties:
>       maxItems: 1
>   
>     iommus:
> -    maxItems: 2
> +    minItems: 1
> +    maxItems: 4
>       description: |
>         Points to the respective IOMMU block with master port as argument, see
>         Documentation/devicetree/bindings/iommu/mediatek,iommu.yaml for details.

(commit title) `ioomus` is something I've never heard of before... :-P

Please fix the typo, after which:

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>


