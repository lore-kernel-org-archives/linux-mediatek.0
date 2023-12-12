Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AEFEAC4167D
	for <linux-mediatek@archiver.kernel.org>; Tue, 12 Dec 2023 13:27:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:To:Subject
	:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=yubJUaMu/SbdYQ9xpU6i2r0MIynC4oV1otl7T/YcN94=; b=OEK0nfmvdpyq4/
	IBReuMvn+iXnmN4Rc9Tx1+QWcvJNs2qCgRralwu35KNtH5y8dlvXdN2OV57wIaT4yNcR7DMpX0Ja0
	bAmRE5TDv6+GCwObbfnNVgcak1Gvv8LSwsSHGRlHK83RY/zmeuzIdIV0FYfSGv3z1DvqNmNXOTKK+
	9FVITH+WMs5Go1aCTfGtuHZJrBJ5jcDbxRNXMmUb+Q5HdZ6sPHcNnCIDE9j97BdX+Na/RtlfVDKGo
	UzERDeA2SxhXRX5Fhqoj0oJsdXxuM76D/WkyhyOFI1RYBEvSjYrNAZ4xM0PTVZLWaLdvp9h7enkr8
	vLLTnxlwSRK18iLEuxqA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rD2nU-00Bnoj-2D;
	Tue, 12 Dec 2023 13:27:40 +0000
Received: from madrid.collaboradmins.com ([46.235.227.194])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rD2nH-00BngZ-39;
	Tue, 12 Dec 2023 13:27:29 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1702387646;
	bh=rWUWqFii2qLJ/wFkk1X0U1NddSTTuFmDH1RdkO8pl70=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=VcDJV83CJx62T0Er/BJFObiPtwNf7CDLhBv3PmPkjY2gn/0g0yX8GYBsf9XnQChXe
	 7KV4OoxoWgkah35n3xF/AT80gvOt2ZxEqJNyYXVAPIj1r7Gj24Shi1hq8eU+5Hd/2Z
	 P4OlLiYaxSrbtJNdgDoPgSyNMGbKqo2BhW+Phy1vhfMC/z3PUYt9Etj7yU1qAtDreW
	 9KqcIXX3FcIKMvQ91WTeSrSVpbSSGk9CHOy5cq9APd32QHFc75QVX6Mx6luXCAqX4J
	 FisH/Fakgsj7/9qjY2sYVDfULOH/G6YKVE0wePSG4YLzDOyqfwRgLymChOgXaVC2i1
	 Fa1z4xfnZj9wg==
Received: from [100.113.186.2] (cola.collaboradmins.com [195.201.22.229])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madrid.collaboradmins.com (Postfix) with ESMTPSA id D16963781464;
	Tue, 12 Dec 2023 13:27:25 +0000 (UTC)
Message-ID: <5d9e6f6c-604d-4e2d-a448-fc5b8bd24a75@collabora.com>
Date: Tue, 12 Dec 2023 14:27:25 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 03/17] dt-bindings: display: mediatek: ovl: Modify
 rules for MT8195/MT8188
Content-Language: en-US
To: Hsiao Chien Sung <shawn.sung@mediatek.com>,
 Chun-Kuang Hu <chunkuang.hu@kernel.org>, CK Hu <ck.hu@mediatek.com>
References: <20231212121957.19231-1-shawn.sung@mediatek.com>
 <20231212121957.19231-4-shawn.sung@mediatek.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <20231212121957.19231-4-shawn.sung@mediatek.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231212_052728_151979_1B9718E2 
X-CRM114-Status: UNSURE (   5.78  )
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
Cc: devicetree@vger.kernel.org, Daniel Vetter <daniel@ffwll.ch>, Sean Paul <sean@poorly.run>, linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, Rob Herring <robh+dt@kernel.org>, linux-mediatek@lists.infradead.org, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Chen-Yu Tsai <wenst@chromium.org>, Matthias Brugger <matthias.bgg@gmail.com>, Philipp Zabel <p.zabel@pengutronix.de>, Bibby Hsieh <bibby.hsieh@mediatek.com>, David Airlie <airlied@gmail.com>, linux-arm-kernel@lists.infradead.org
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Il 12/12/23 13:19, Hsiao Chien Sung ha scritto:
> Modify rules for both MT8195 and MT8188.
> Hardware capabilities include color formats and AFBC are
> changed since MT8195, stop using the settings of MT8183.
> 
> Acked-by: Rob Herring <robh@kernel.org>
> Signed-off-by: Hsiao Chien Sung <shawn.sung@mediatek.com>

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>



