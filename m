Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6D9C2C87FCF
	for <linux-mediatek@archiver.kernel.org>; Fri, 25 Jul 2025 20:30:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Type:MIME-Version:References:Message-ID:Subject:To:From:Date:Reply-To
	:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=7L7gaGUKN4AyYqjQe54WpKie/pTZKX55zK8rR8kRVvs=; b=xsipmnxbevkJTvciLHJvVz/1gw
	yCHiztNgQcUHc2YURLsuTsmq9WISSN2AkCTaNN9nXzfVt8KgDWV5JAd2dH/OYM9um5upVamfqiXv3
	hUKEoPwcF3l9iwV5cgBE6JLJPueu4tTcl0zYUfaka339VvOUcMOxbmpW3z9gj4VN55qOy2bTtnfcP
	4XRkzPlXzz5jfih3jK0Suq1MsBlt50pyjZeoTiZHfSONzrR+4r/sZgg2Cv+e7ACNHIgiNiRsg9JEW
	1G9kfTmJiF9F0AuQE9cTISdlIWbINg9eHsfVtg2nPCzF3oTnS/uZoOwATi2668bVYvmgkk/rTVBKQ
	ZKWofIkQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ufP3n-0000000AeNY-1suQ;
	Fri, 25 Jul 2025 20:30:31 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ufP3k-0000000AeLp-1o0S;
	Fri, 25 Jul 2025 20:30:29 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 2391944F67;
	Fri, 25 Jul 2025 20:30:28 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D3FC8C4CEE7;
	Fri, 25 Jul 2025 20:30:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1753475428;
	bh=ba7r3CQWnc9Pg59zckBMYOhewHfZtzF4js8BFZ+0f9c=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=dbW8S110p3NBmLaJdPOPH54qeqD00XyhjoRdv89Oc/9seV5Gebju3lz+V2fFMuB/Q
	 ZG8upnvyRHMVpuySek1hBhmyctGYtzAQ6cXCXKjp1lQQHSzkE4iUJER7UN+9bgbZVA
	 QD1lVSbKRyDW0ZEe0/EMwhfbQ3E0gDpivtn/VhyvaLE9BDL80GMlVu3pdeb2Z5HYzH
	 TunHOOTBpQ6fbovuC8fjR2Xisgued54rZ+8BjIfP0ES1hs+vhy0arR1Uy65Q8BhfC2
	 L9k/9/uQq129XN7CqmqHgViTcChBd1BD0wYRt70Q9poeuLwbSEYOWmAUrgkw/tMMZW
	 DvOdLKPmgYbZg==
Date: Fri, 25 Jul 2025 15:30:27 -0500
From: "Rob Herring (Arm)" <robh@kernel.org>
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Subject: Re: [PATCH 12/38] dt-bindings: regulator: mediatek,mt6331: Add
 missing compatible
Message-ID: <175347542615.1838505.12887834541571951617.robh@kernel.org>
References: <20250724083914.61351-1-angelogioacchino.delregno@collabora.com>
 <20250724083914.61351-13-angelogioacchino.delregno@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250724083914.61351-13-angelogioacchino.delregno@collabora.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250725_133028_489019_C2642DAA 
X-CRM114-Status: UNSURE (   8.50  )
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
Cc: jassisinghbrar@gmail.com, daniel.lezcano@linaro.org, mwalle@kernel.org, chunkuang.hu@kernel.org, linus.walleij@linaro.org, simona@ffwll.ch, linux-remoteproc@vger.kernel.org, dri-devel@lists.freedesktop.org, lgirdwood@gmail.com, olivia.wen@mediatek.com, shane.chien@mediatek.com, linux-phy@lists.infradead.org, airlied@gmail.com, kishon@kernel.org, herbert@gondor.apana.org.au, eugen.hristev@linaro.org, tinghan.shen@mediatek.com, fparent@baylibre.com, jiaxin.yu@mediatek.com, sam.shih@mediatek.com, chunfeng.yun@mediatek.com, jieyy.yang@mediatek.com, devicetree@vger.kernel.org, conor+dt@kernel.org, jitao.shi@mediatek.com, tzimmermann@suse.de, arnd@arndb.de, andy.teng@mediatek.com, maarten.lankhorst@linux.intel.com, linux-sound@vger.kernel.org, ck.hu@mediatek.com, granquet@baylibre.com, linux-mediatek@lists.infradead.org, mripard@kernel.org, matthias.bgg@gmail.com, tglx@linutronix.de, mchehab@kernel.org, linux-arm-kernel@lists.infradead.org, kyrie.wu@mediatek.corp-partner.google.com, mathieu.poirier@linaro.org, linux-gpio@vger.kernel.org, andersson@kernel.org, sean.wang@kernel.org, linux-kernel@vger.kernel.org, houlong.wei@mediatek.com, vkoul@kernel.org, broonie@kernel.org, linux-crypto@vger.kernel.org, p.zabel@pengutronix.de, atenart@kernel.org, krzk+dt@kernel.org, linux-media@vger.kernel.org, davem@davemloft.net
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org


On Thu, 24 Jul 2025 10:38:48 +0200, AngeloGioacchino Del Regno wrote:
> This binding had no compatible and for this reason would not be
> applied to anything: add the missing "mediatek,mt6331-regulator"
> comaptible.
> 
> Fixes: 6385e21692bb ("regulator: Add bindings for MT6331 regulator")
> Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
> ---
>  .../bindings/regulator/mediatek,mt6331-regulator.yaml      | 7 +++++++
>  1 file changed, 7 insertions(+)
> 

Acked-by: Rob Herring (Arm) <robh@kernel.org>


