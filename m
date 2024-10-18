Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C78D7D3C54C
	for <linux-mediatek@archiver.kernel.org>; Fri, 18 Oct 2024 06:17:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=iT9adTGJtAGwwEtaMBVOZTfON/Ze1/ofBShxENvic74=; b=dGVpE3GWMAUl3Dbj4wltskWY7G
	vNPX6FTTmWpBJWGWBq6wetw034jdtcC/ahWeigw/l6HU3h6Xx8KLSw9CnmEQuqSaPxzqATJI/IyCs
	74VY/IUASLaxxZNhy5G8iteU/kfz4g8GJuo3DM0kaH7GFFvjBMMX9v9zUBvrDXoGCp0JLembIp4hp
	+UFcDGK25HUCVWD9YZsKylQiBERaNWhOXiPE3lxosvBLBcZ8VnQG3bwMLPIgY6JcutHZOP0drjUTz
	moxsdi0KpyQmhft3scX04rBkauCokWQUC4VmHsGGb5IyfuZgxYgkvalfzxD6mFRgCpoIiOmXetLRo
	j05q1SLw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t1gIq-0000000H6iJ-2lZX;
	Fri, 18 Oct 2024 06:17:36 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t1gGq-0000000H6Xf-3Q3C;
	Fri, 18 Oct 2024 06:15:34 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 7BB595C5A93;
	Fri, 18 Oct 2024 06:15:27 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CDC74C4CEC3;
	Fri, 18 Oct 2024 06:15:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1729232131;
	bh=6M6kNuQkv1KZSwfaWc/t2QEfSgBi8V5I8EBEhHPPuXg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Cnfp2lxzmyhGDgkVgPNqX/zLvY1I51HXCYPPhcmDv0eJIgeoUEyF0OUefj46Vk+S2
	 jMV+hXgMKzqJwtzDtgIwWntIiyr0wgIBjd7Bd544Czk7g9o8ppK3rEkbiDSJycpQyI
	 Ae5nmI9mAjbtPp3h3ZDHPge5LSFXd1YPCUfZ54mlijNySG6iioyUyNBhWlrPJ6Ty6C
	 7ZCbgJW4/Wlic4ven3lc7pcceHjTxXNuq27romS1yHsUiWJ6OGg7jDdoxGSRtyQINi
	 xwdXJBD+ncPuillu4R6x5euP7g568dI9r9ACYYfI7BKMw4V/svtGp6F/vbIB5Wrmy6
	 zr2CYpva1F2UA==
Date: Fri, 18 Oct 2024 08:15:28 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Yassine Oudjana <yassine.oudjana@gmail.com>
Cc: Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Ulf Hansson <ulf.hansson@linaro.org>, Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, Alexandre Mergnat <amergnat@baylibre.com>, 
	Fabien Parent <fparent@baylibre.com>, Markus Schneider-Pargmann <msp@baylibre.com>, 
	Alexandre Bailon <abailon@baylibre.com>, Chen-Yu Tsai <wenst@chromium.org>, 
	Eugen Hristev <eugen.hristev@collabora.com>, MandyJH Liu <mandyjh.liu@mediatek.com>, 
	Yassine Oudjana <y.oudjana@protonmail.com>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-pm@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-mediatek@lists.infradead.org
Subject: Re: [PATCH v3 1/2] dt-bindings: power: Add binding for MediaTek
 MT6735 power controller
Message-ID: <gdksnrs34k5ypuvdxp6vecqakhxrjcswkxjmfwnbiyi24m42ix@4aekpbfy56pt>
References: <20241017085136.68053-1-y.oudjana@protonmail.com>
 <20241017085136.68053-2-y.oudjana@protonmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20241017085136.68053-2-y.oudjana@protonmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241017_231532_922905_8B26D8AC 
X-CRM114-Status: UNSURE (   7.87  )
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
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Thu, Oct 17, 2024 at 11:51:34AM +0300, Yassine Oudjana wrote:
> From: Yassine Oudjana <y.oudjana@protonmail.com>
> 
> Add DT binding for MediaTek MT6735 SCPSYS power controller.
> 
> Signed-off-by: Yassine Oudjana <y.oudjana@protonmail.com>

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof


