Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DEE2ACD343B
	for <linux-mediatek@archiver.kernel.org>; Wed,  6 May 2026 15:31:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=LpMiaMn6dAmQVtExkum+YevLhvle5EftrSlfv8b97nA=; b=QmxjLF4DhgVK2tBN3y+EhUzPCa
	k9vsmHKmGah5+ONE3eOVWc53Xm1w4t58ANdpst/AdSgrXmvXdNYOMa5XjQ3/5EOTf8SqRC8yAVJwx
	mqDAboZZCj9fAKI0bp8vg9xgoapqH/guqS8pP/sBnP/3tLxpayN8DCM5ZRsaQunglI00+jBjNCwmL
	yIdkmu3psScd59H1844JauJzauid38GJ8xlzpuKbGfOjC9IVd3KtH3ksB7SabjUxfmBN8QRq6Eqe6
	2OPjNTcqbPU36J773Nd89Xmy4NhzBnniAwMbox7KoPM1+g7wn0ZCfW8ia7WUMNJupONfriLHmGkaN
	CDgS6Xhg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wKeDj-00000001KtB-3KqW;
	Wed, 06 May 2026 15:31:31 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wKeDh-00000001KsI-3Ywf;
	Wed, 06 May 2026 15:31:29 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 4580043C48;
	Wed,  6 May 2026 15:31:29 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E6784C2BCB0;
	Wed,  6 May 2026 15:31:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778081489;
	bh=IgHqoBvpmtUA7FgXX/Le9CmNm36RAHe0VSyPKzaNLfU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Qapj2ZbJvROo6HMGSV8FORvgrI9+0dhDdr5aft67gXjbpw92uNrsHG5vt8FhEeQ3e
	 ItYO/Aowm+Dg6y/ZaoLVCdxffOSyqnVLui0pLHwEAmCpkH7F84xGgW2fH2weUl6uU/
	 TFGVlgx9gljReqc2Leb7nX1UO/vL9CHvZLQKhtER/RISgk1ylzCBe9/VeTrAcVJDWI
	 B8NHnsRILYZYFUo0bPIbQhBe4NwJ7RUIll/oC2Aa9bLprg4Nxl81L5lk2uwN57SHnI
	 0XHdf1CF/wXotjhxzx1lVcWaA6XOrzkb3miEXU25G+R/2k/mQ+197EnuUOS7iVeCW7
	 0PU+5kX9UVJGw==
Date: Wed, 6 May 2026 10:31:26 -0500
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Louis-Alexis Eyraud <louisalexis.eyraud@collabora.com>
Cc: Sen Chu <sen.chu@mediatek.com>, Macpaul Lin <macpaul.lin@mediatek.com>,
	Sean Wang <sean.wang@mediatek.com>, Lee Jones <lee@kernel.org>,
	linux-mediatek@lists.infradead.org,
	Jonathan Cameron <jic23@kernel.org>, devicetree@vger.kernel.org,
	kernel@collabora.com,
	Nuno =?iso-8859-1?Q?S=E1?= <nuno.sa@analog.com>,
	linux-input@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>,
	David Lechner <dlechner@baylibre.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	linux-arm-kernel@lists.infradead.org,
	Chen Zhong <chen.zhong@mediatek.com>, linux-pm@vger.kernel.org,
	Matthias Brugger <matthias.bgg@gmail.com>,
	Dmitry Torokhov <dmitry.torokhov@gmail.com>,
	linux-iio@vger.kernel.org, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Andy Shevchenko <andy@kernel.org>, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/9] dt-bindings: mfd: mediatek: mt6397: Add rtc for
 MT6359
Message-ID: <177808148601.2163979.5712342936678937427.robh@kernel.org>
References: <20260429-mediatek-genio-mt6365-cleanup-v1-0-6f43838be92f@collabora.com>
 <20260429-mediatek-genio-mt6365-cleanup-v1-1-6f43838be92f@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260429-mediatek-genio-mt6365-cleanup-v1-1-6f43838be92f@collabora.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260506_083129_908584_E70C0F97 
X-CRM114-Status: GOOD (  11.41  )
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


On Wed, 29 Apr 2026 11:44:14 +0200, Louis-Alexis Eyraud wrote:
> The rtc block of MT6359 PMIC is compatible with the one found in MT6358
> but this compatibility was never expressed in the dt-bindings, so add
> the missing compatible string for the rtc subnode.
> 
> Signed-off-by: Louis-Alexis Eyraud <louisalexis.eyraud@collabora.com>
> ---
>  Documentation/devicetree/bindings/mfd/mediatek,mt6397.yaml | 1 +
>  1 file changed, 1 insertion(+)
> 

Acked-by: Rob Herring (Arm) <robh@kernel.org>


