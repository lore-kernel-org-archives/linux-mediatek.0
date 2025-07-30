Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B0E41C87FC9
	for <linux-mediatek@archiver.kernel.org>; Wed, 30 Jul 2025 23:58:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Type:MIME-Version:References:Message-ID:Subject:To:From:Date:Reply-To
	:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=i9j9yX1967eLxOki2fQhz+Y5gTTmQmEw34RA/E/7wYA=; b=b27LqO0WcL5WPnIVsJd2VbLh3x
	0Z3hZ7C6n43ieCr9PJFKDQEQ1cyKvDd6AakWesgAmXd4dui7TM5gvVGTZLeCDBECVF1TQHZXTX0N/
	DQ5zueWgedA0i30LFV9Vz5EWrhpPLDQJREC9WNVqH5hkYgqJEo2irYQIgO4siZWTKn4sFzKUuafNn
	JLzN933DU7h+SC3vxv5XTZozqLBW6PHAiJC8rZ7sg5OpqTffkhYIkoO6VDvWHgmFFJtr8dYAx2pGE
	SXtRVmHurmGTMyS8fq6b2S0zsDv727tCFkRmaQZ8L2UIfhulK8fGeYNHzWDwKSNI5k5fOnRuy9vlO
	HDXXKczA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uhGgH-00000002dlA-4Bbw;
	Wed, 30 Jul 2025 23:57:58 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uhGdp-00000002da4-1EfT;
	Wed, 30 Jul 2025 23:55:25 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 0E1B6601D2;
	Wed, 30 Jul 2025 23:54:52 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9603DC4CEE3;
	Wed, 30 Jul 2025 23:54:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1753919691;
	bh=ksTAo89B5tD8/lmoPdu3reTp6aOUnIluUg9OleY9U14=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=rSOLHC+2xcUclev5lMKl8YTnHqCnmu2FR84Qb5kWKtyZbtzmti1Wa3KT7HXqwee7d
	 XyCHLZKJitXDKtefOZDI+zCGWDIYnT2BBDuM56ofl267HDMSbr7C/g0Unv4i5o9lzr
	 tmAheYiFoK07Q/mv54PpuwelfzTTj6EE11VYCTTKAk5GARLbO5mfhdsEWg5eKsQey9
	 9pAfbmqhy4FU1ayoYWBiirB4O8w2dqVtwxIQzJPn+hG9CMAhqwAjXvFuxbJxA/Nott
	 Cfy12vaqHhWQHW/c0fjk8to667+B5u6m9hNT0st8d2NJUjvNyTM5PD6c9XYGj/JhLz
	 JveiUKPWniMQw==
Date: Wed, 30 Jul 2025 18:54:51 -0500
From: Rob Herring <robh@kernel.org>
To: Laura Nao <laura.nao@collabora.com>
Subject: Re: [PATCH v2 9/9] dt-bindings: nvmem: mediatek: efuse: Add support
 for MT8196
Message-ID: <20250730235451.GA1911689-robh@kernel.org>
References: <20250730152128.311109-1-laura.nao@collabora.com>
 <20250730152128.311109-10-laura.nao@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250730152128.311109-10-laura.nao@collabora.com>
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
Cc: andrew-ct.chen@mediatek.com, lala.lin@mediatek.com, rafael@kernel.org, kernel@collabora.com, bchihi@baylibre.com, nfraprado@collabora.com, daniel.lezcano@linaro.org, wenst@chromium.org, rui.zhang@intel.com, colin.i.king@gmail.com, devicetree@vger.kernel.org, conor+dt@kernel.org, arnd@arndb.de, linux-pm@vger.kernel.org, u.kleine-koenig@baylibre.com, matthias.bgg@gmail.com, linux-arm-kernel@lists.infradead.org, angelogioacchino.delregno@collabora.com, linux-kernel@vger.kernel.org, srini@kernel.org, linux-mediatek@lists.infradead.org, krzk+dt@kernel.org, lukasz.luba@arm.com
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Wed, Jul 30, 2025 at 05:21:28PM +0200, Laura Nao wrote:
> The MT8196 eFuse layout is compatible with MT8186 and shares the same
> decoding scheme for the gpu-speedbin cell.
> 
> Signed-off-by: Laura Nao <laura.nao@collabora.com>
> ---
>  Documentation/devicetree/bindings/nvmem/mediatek,efuse.yaml | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/Documentation/devicetree/bindings/nvmem/mediatek,efuse.yaml b/Documentation/devicetree/bindings/nvmem/mediatek,efuse.yaml
> index 4dc0d42df3e6..455b96c1e1f4 100644
> --- a/Documentation/devicetree/bindings/nvmem/mediatek,efuse.yaml
> +++ b/Documentation/devicetree/bindings/nvmem/mediatek,efuse.yaml
> @@ -25,6 +25,7 @@ properties:
>    compatible:
>      oneOf:
>        - items:
> +          - const: mediatek,mt8196-efuse
>            - const: mediatek,mt8188-efuse
>            - const: mediatek,mt8186-efuse

You just broke mt8188 as it had 2 entries and now has 3. I think 
(based on the commit msg) you want to change 8188 entry to an enum with 
mediatek,mt8196-efuse and mediatek,mt8188-efuse.

>        - const: mediatek,mt8186-efuse
> -- 
> 2.39.5
> 

