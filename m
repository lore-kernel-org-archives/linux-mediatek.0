Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4B465C25B08
	for <linux-mediatek@archiver.kernel.org>; Wed, 17 Aug 2022 16:09:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=swwT+TkLAVdnFfvKH4QquAkODkMxOcrPfum/cjVHZso=; b=QPERaEhfKZc86LSrMtohrXuG8W
	zVqsdYnoYxCxxXJblq3hlQqDcYjOl2F0NUBcjgneLnxExgtAG6+7v/2PCORY9PLDQeZ0biChbEMKG
	2OfPgIL0GVwnOD9to4duuiqDlM53FBhSKqxFTSSny/lYfX+2f5Kzc5O8hFtMsMdUvbvBUok0r/s1a
	TVT8h22YN2xvi9WGHc6dOmaOzhZdiM+EQS+eKXLN0/GDOrdDqZd2beZ5MtAvXftfCYThTcB/PDVC9
	KhX4JGOeWumcSVsQRoZEWnq1CcsKrrWvyryTGQNsE1r0xk7mEjyGZJIDjGcF1vAPr+3dPZTNV7trx
	Wpu8RwIQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oOLc6-003dxg-4h; Wed, 17 Aug 2022 16:09:50 +0000
Received: from madras.collabora.co.uk ([46.235.227.172])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oOLbu-003dpB-08; Wed, 17 Aug 2022 16:09:39 +0000
Received: from notapiano (unknown [70.107.189.129])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: nfraprado)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id 5EF6F660184A;
	Wed, 17 Aug 2022 17:09:32 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1660752574;
	bh=e/Of4jtD4ScJ5WePhgSWEAVJX0lhg7eBLY1bsDyCvTA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ctwVd0yGuilnyXL+Huj1WqffMGwtY9wmtAQMlBsoYakIjyqjlPw2XVzYVMaNNmauo
	 VKPLLIeLzFSWdt0EYUhQ3NCV4Q2zanjViWw8aQlaaladQLlWDcWlF67VG4w7So7apY
	 5r0FuSqQ34y+rjfKpboGh/PHS/ErUjzVLqCg3nEQwxeJmRD76riNuS3R6wCs6Us4iM
	 Te7AQyuGVWUi32v7YVmRQ1Ix9SCBCbLtHKSfsBPNgzsQ9j3w8N8cmg0Jur8nmrPUFL
	 YbFhhv14NXg1tQKH918xRqOF6Y8INxlbFf/f3IAPDvUrEkvTiww4C6CD/Q2ZcUPqKm
	 4v8F+6Pe8AoXQ==
Date: Wed, 17 Aug 2022 12:09:28 -0400
From: =?utf-8?B?TsOtY29sYXMgRi4gUi4gQS4=?= Prado <nfraprado@collabora.com>
To: Allen-KH Cheng <allen-kh.cheng@mediatek.com>
Cc: Linus Walleij <linus.walleij@linaro.org>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	angelogioacchino.delregno@collabora.com,
	Project_Global_Chrome_Upstream_Group@mediatek.com,
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org,
	Chen-Yu Tsai <wenst@chromium.org>,
	Guodong Liu <guodong.liu@mediatek.com>
Subject: Re: [PATCH v2] dt-bindings: pinctrl: mt8186: Fix 'reg-names' for
 pinctrl nodes
Message-ID: <20220817160928.ppkjonuymr7rn4bu@notapiano>
References: <20220817052615.27153-1-allen-kh.cheng@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20220817052615.27153-1-allen-kh.cheng@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220817_090938_272149_CF7CFB9D 
X-CRM114-Status: GOOD (  16.45  )
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

Hi Allen,

On Wed, Aug 17, 2022 at 01:26:15PM +0800, Allen-KH Cheng wrote:
> The mt8186 contains 8 GPIO physical address bases that correspond to
> the 'reg-names' of the pinctrl driver. The 'reg-names' entries in
> bindings are ordered incorrectly, though. The system crashes due of an
> erroneous address when the regulator initializes.
> 
> We fix the 'reg-names' for the pinctrl nodes and the pinctrl-mt8186
> example in bindings.
> 
> Fixes: 338e953f1bd1 ("dt-bindings: pinctrl: mt8186: add pinctrl file and binding document")
> Signed-off-by: Allen-KH Cheng <allen-kh.cheng@mediatek.com>
> Signed-off-by: Guodong Liu <guodong.liu@mediatek.com>

The sender's (your) signed-off-by should come last [1]. Also, what is the
participation of Guodong in this patch? If Guodong helped in writing the patch
there should also be a Co-developed-by tag for Guodong, as shown in [1].

[1] https://www.kernel.org/doc/html/latest/process/submitting-patches.html#when-to-use-acked-by-cc-and-co-developed-by

> ---
[..]
> --- a/Documentation/devicetree/bindings/pinctrl/pinctrl-mt8186.yaml
> +++ b/Documentation/devicetree/bindings/pinctrl/pinctrl-mt8186.yaml
[..]
> @@ -232,12 +232,12 @@ examples:
>              <0x10002200 0x0200>,
>              <0x10002400 0x0200>,
>              <0x10002600 0x0200>,
> -            <0x10002A00 0x0200>,
> +            <0x10002a00 0x0200>,

Also, you should avoid making changes that don't have to do with the patch
itself. This patch is about fixing the reg names, so no need to touch the
formatting of addresses. It just adds noise.

Other than that,

Reviewed-by: Nícolas F. R. A. Prado <nfraprado@collabora.com>

Thanks,
Nícolas

