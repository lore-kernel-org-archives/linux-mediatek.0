Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C34A6C001DF
	for <linux-mediatek@archiver.kernel.org>; Thu,  3 Aug 2023 09:01:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ALY6t7vWm+QVkzmtoX4VTBog0joGmHEwVlgagdVRtI8=; b=T4XXwv4YFx19eEi7/0iW3s0xCg
	Dk4u3QeaXuB299WvK03egfw6JKs53WRXl+zR9INk7nz44v0sLs0OA15MMxGjzPQtwsToL6r0yiYVg
	VgSSu3x5ejQui6jBAjo9Os0JO+F/eZr1B4d1tdcRoF0yirWcQUtUWzkDKi7jt046TR0wppqXD/X7N
	gZXLUNKe4jDAYHbBN+VfZq0tF+cEZhqyo1ufvhneX3+eAmrNkkPbmAlosNfZBmJi6JaCxufds1UOM
	v2qtn7g1DspnE5Rtzdyh4RgBKtiCD+6Gvpk8yU2SgPaiUjNO0jprK/lKyyGJWC0TLAiM/4bGzaCFc
	wQpepKEA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qRUDJ-0076FG-05;
	Thu, 03 Aug 2023 09:01:45 +0000
Received: from madras.collabora.co.uk ([46.235.227.172])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qRUDD-0076C0-0F;
	Thu, 03 Aug 2023 09:01:40 +0000
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id 4A4346607196;
	Thu,  3 Aug 2023 10:01:37 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1691053297;
	bh=n6x8qVg9ckYSoTjCy7F7/wTKhU+kmyxKJY7nozYBmC0=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=DySo9xrqDsZ5CgHL3yu2ZELyYNp5oChz3s2sn/LMivMcNytQ699XGRSr3oTL5Y6zc
	 iYK8pi/fHflz0E/EICDIWQAOyrRa1x1DOviyQJ1Ao7HmKV1mfHuLwNOZKQVR2HJ9qL
	 tI8sARXoBvCG1AdOhdJI5tKelvuLhTX23eE/BoojNG3HVyq8VHygc7mjRgtQhWNl9p
	 1pTP4hwz1KYhJT7SFcyTzif6FaP6AnHcMY61rOCPFQDSGTsWE+NFzS95DZx2G9LpE3
	 1akvgdO1ozjGn4eQU/T5PcULe24IMehq9HH0rrogXZWsx/Q5YYDbDZ6clwGfhygBII
	 FnhRoPDRT8gOg==
Message-ID: <e9c38029-f27d-7800-2ba8-d9ee19d999e4@collabora.com>
Date: Thu, 3 Aug 2023 11:01:35 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH 9/9] soc: mediatek: pwrap: add support for MT6366 PMIC
Content-Language: en-US
To: Chen-Yu Tsai <wenst@chromium.org>, Lee Jones <lee@kernel.org>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>, Matthias Brugger
 <matthias.bgg@gmail.com>, Mark Brown <broonie@kernel.org>
Cc: Zhiyong Tao <zhiyong.tao@mediatek.com>, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org
References: <20230803074249.3065586-1-wenst@chromium.org>
 <20230803074249.3065586-10-wenst@chromium.org>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <20230803074249.3065586-10-wenst@chromium.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230803_020139_292047_50B84109 
X-CRM114-Status: GOOD (  21.90  )
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

Il 03/08/23 09:42, Chen-Yu Tsai ha scritto:
> The MT6366 PMIC is mostly, but not fully, compatible with MT6358. It has
> a different set of regulators. Specifically, it lacks the camera related
> VCAM* LDOs, but has additional VM18, VMDDR, and VSRAM_CORE LDOs.
> 
> Add a separate compatible for the MT6366 PMIC.
> 
> Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>

We can express the same partial-compatibility state with bindings, adding a
new compatible here with the same platform data doesn't really add any value...

...also because in DT we'll have something like
	compatible = "mediatek,mt6366", "mediatek,mt6358";

so if any variation of platform data in mtk-pmic-wrap will ever be needed, we
would still be able to do that in the future without any headache.

In my opinion, this commit can be dropped.

P.S.: We could add a comment in the mt6366.dtsi pmic devicetree for that, too?

Cheers,
Angelo

> ---
>   drivers/soc/mediatek/mtk-pmic-wrap.c | 2 ++
>   1 file changed, 2 insertions(+)
> 
> diff --git a/drivers/soc/mediatek/mtk-pmic-wrap.c b/drivers/soc/mediatek/mtk-pmic-wrap.c
> index 11095b8de71a..e3c0e767033b 100644
> --- a/drivers/soc/mediatek/mtk-pmic-wrap.c
> +++ b/drivers/soc/mediatek/mtk-pmic-wrap.c
> @@ -2257,6 +2257,8 @@ static const struct of_device_id of_slave_match_tbl[] = {
>   	{ .compatible = "mediatek,mt6357", .data = &pmic_mt6357 },
>   	{ .compatible = "mediatek,mt6358", .data = &pmic_mt6358 },
>   	{ .compatible = "mediatek,mt6359", .data = &pmic_mt6359 },
> +	/* MT6366 is mostly compatible with MT6358, except for slightly different regulators. */
> +	{ .compatible = "mediatek,mt6366", .data = &pmic_mt6358 },
>   
>   	/* The MT6380 PMIC only implements a regulator, so we bind it
>   	 * directly instead of using a MFD.



