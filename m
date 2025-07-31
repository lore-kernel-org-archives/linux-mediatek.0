Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D83A5C87FCA
	for <linux-mediatek@archiver.kernel.org>; Thu, 31 Jul 2025 07:31:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:To:Subject
	:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=rGaC2RK2K60aU9ILU/yIawe6YAOVfa3ISrHJ7vgOtis=; b=OSoCX0wNmoI2K1
	3rC1FMd4Z6cCd/z+sKmBDczbkXYP6t4zeqk6P3QZ9QVKXd9xELIHMryOAdsLiloJR0SIF56ngbtIy
	U4k0g/89JdgY1xXRRJltdSOFKQdaiATXoVriH39cCWhDMcAUl54DUayetPKnv4yi6RhfHwn9iHcyh
	3c9rVrhNOdNh8Ti1h534O86Luk/wJKR+n3nxm3IF8EKnW8QOl91L7dFFrlT6ZsnSjMaE4mITBnLf3
	QQOR+Ko6td6oFf4vS0dd0fRpbChPRpYqE04yvRKNq+nY+qPQM9QKF0mHW8xW0arZFACScRGHMkf9T
	KpEgbhHVhJyR6o3D4Myg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uhNl2-000000033pm-3Esh;
	Thu, 31 Jul 2025 07:31:20 +0000
Received: from bali.collaboradmins.com ([2a01:4f8:201:9162::2])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uhNiI-000000033a6-0UVE;
	Thu, 31 Jul 2025 07:28:31 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1753946907;
	bh=qtZaVgHB/hhKpNwT2a4wIg9fcBK+yk7JS3AwLBOGuOY=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=Flxe1seKL0nCIHgcCgIKPgBLjmpo5KOvhOo85ujPcLRGU5A96/x+g7eN3dyGVA8Oe
	 NJbwkjNyTQnnrUC31XQfujNKb+HJOAKLKsHuNf1rlh1ALFZ7i7PotWnVut8a/2s7b5
	 88GrLyct7536PeT5TDcilbsOa3MS/RZfEQpmfmW9rooO9pF3MYA9z69cf2orAxbQ+Q
	 OsbrLiYm6/Saz7Nh2Kk71rE+nOQwda8CsJkFtYTy6NMI+6yzpMobR995FDeyzTOq4l
	 YIhAWjetUrY2N2JDiIiNeRFOjp3uqYiQWeHyq6SPHlcGSfjTw5sw6INzX5q+hirh2P
	 iiQxekzhq0/8Q==
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id A270117E0593;
	Thu, 31 Jul 2025 09:28:26 +0200 (CEST)
Message-ID: <f485e3a1-46eb-4239-9c66-7a212c63ad64@collabora.com>
Date: Thu, 31 Jul 2025 09:28:26 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 9/9] dt-bindings: nvmem: mediatek: efuse: Add support
 for MT8196
To: Laura Nao <laura.nao@collabora.com>, srini@kernel.org, robh@kernel.org,
 krzk+dt@kernel.org, conor+dt@kernel.org, rafael@kernel.org,
 daniel.lezcano@linaro.org, rui.zhang@intel.com, lukasz.luba@arm.com,
 matthias.bgg@gmail.com
References: <20250730152128.311109-1-laura.nao@collabora.com>
 <20250730152128.311109-10-laura.nao@collabora.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <20250730152128.311109-10-laura.nao@collabora.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250731_002830_313142_83C5CF1D 
X-CRM114-Status: GOOD (  11.34  )
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
Cc: andrew-ct.chen@mediatek.com, kernel@collabora.com, nfraprado@collabora.com, arnd@arndb.de, linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, u.kleine-koenig@baylibre.com, linux-arm-kernel@lists.infradead.org, wenst@chromium.org, linux-mediatek@lists.infradead.org, bchihi@baylibre.com, colin.i.king@gmail.com, lala.lin@mediatek.com
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Il 30/07/25 17:21, Laura Nao ha scritto:
> The MT8196 eFuse layout is compatible with MT8186 and shares the same
> decoding scheme for the gpu-speedbin cell.
> 
> Signed-off-by: Laura Nao <laura.nao@collabora.com>
> ---
>   Documentation/devicetree/bindings/nvmem/mediatek,efuse.yaml | 1 +
>   1 file changed, 1 insertion(+)
> 
> diff --git a/Documentation/devicetree/bindings/nvmem/mediatek,efuse.yaml b/Documentation/devicetree/bindings/nvmem/mediatek,efuse.yaml
> index 4dc0d42df3e6..455b96c1e1f4 100644
> --- a/Documentation/devicetree/bindings/nvmem/mediatek,efuse.yaml
> +++ b/Documentation/devicetree/bindings/nvmem/mediatek,efuse.yaml
> @@ -25,6 +25,7 @@ properties:
>     compatible:
>       oneOf:
>         - items:
> +          - const: mediatek,mt8196-efuse

Oh wow wait. This is not an enum.

You broke MT8188 like that...!

Cheers,
Angelo

>             - const: mediatek,mt8188-efuse
>             - const: mediatek,mt8186-efuse
>         - const: mediatek,mt8186-efuse



