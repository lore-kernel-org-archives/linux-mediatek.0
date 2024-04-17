Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C029BC4345F
	for <linux-mediatek@archiver.kernel.org>; Wed, 17 Apr 2024 14:46:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Subject:Message-Id:
	References:In-Reply-To:Cc:To:From:MIME-Version:Content-Transfer-Encoding:
	Content-Type:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=623f2Sw1Qt5a+Wt6hFJN2yCPqyp7RBDIMXWmUmycYWk=; b=4eichPqZM8cPmlkohnS5G+kyeD
	L0pvhomFiVTXp5KWjF4CbRckuxxlJYgnlg/uMONZlNPIHPPknvZ8rn5QJQGzJ2VLL+Uhv0/GECny7
	vB9Y13qHeebTcyXSX5IDXivDG+DHRQf3uZTU87Dbvr818Q3vDEJTTFDmKuwPme/3L1YgzfDqU6bpn
	pPU3qsFzG8dFe6HugjbE7ksuxA5cb0WPq0MdX7uQnssUdMGtqjyxg6IuO9lgGnX5by7r3x1z0OIWr
	z4hWtcVpAMdsSU/c1vAkzTsLiV/cdF0az1QVe2IFnmeiluJ/kuB6jgiEaIftWIVZi9xmNzKz9P1rr
	hDQ7iGGw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rx6YI-0000000GPzc-18rP;
	Wed, 17 Apr 2024 14:46:22 +0000
Received: from sin.source.kernel.org ([2604:1380:40e1:4800::1])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rx6Y1-0000000GPqz-3nfm;
	Wed, 17 Apr 2024 14:46:08 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id 4373FCE12B8;
	Wed, 17 Apr 2024 14:46:03 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2AA90C2BD11;
	Wed, 17 Apr 2024 14:46:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1713365161;
	bh=ZQvye4lH9STIxQEy+fEJCBvieMZben0M75cWxAuq1j4=;
	h=Date:From:To:Cc:In-Reply-To:References:Subject:From;
	b=SbUSBk6QbYGJuhVO8IOS8J++ios5qIsqlUVbf/3SCArnZ0ChScc3bpnDB6mtXgFxy
	 UMuKBrwMRnP9yI57eQKCftRjolZEEaTzUBB9+WLyJ6joVX5tYyLJLNpdvwcuAanh5+
	 yPt4/H6JceEFkIjBeiKQGtw+1h7gk7ntSCgGIed87Sku3OGCceRVK13JENAS7VbAiv
	 rjEKiqzbfZZ8z8gJMsVuhj777DCWeMlw1nkuy1lxNkfJt1ewky7Bj4GgsxpKpR+qxd
	 ilAEQTDfa864m4M/ViKaeG9msS6+8vPBgu8cePwDm/nhyqvijYIPsrW+Y5rB7SCqGf
	 QkPwF3n0tLPIA==
Date: Wed, 17 Apr 2024 09:46:00 -0500
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
From: Rob Herring <robh@kernel.org>
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: henryc.chen@mediatek.com, wenst@chromium.org, keescook@chromium.org, 
 gustavoars@kernel.org, linux-mediatek@lists.infradead.org, 
 amergnat@baylibre.com, broonie@kernel.org, devicetree@vger.kernel.org, 
 krzysztof.kozlowski+dt@linaro.org, linux-arm-kernel@lists.infradead.org, 
 conor+dt@kernel.org, matthias.bgg@gmail.com, djakov@kernel.org, 
 linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org, lgirdwood@gmail.com, 
 kernel@collabora.com
In-Reply-To: <20240417091442.170505-2-angelogioacchino.delregno@collabora.com>
References: <20240417091442.170505-1-angelogioacchino.delregno@collabora.com>
 <20240417091442.170505-2-angelogioacchino.delregno@collabora.com>
Message-Id: <171336511790.2347768.12360106374334104584.robh@kernel.org>
Subject: Re: [PATCH v2 1/7] dt-bindings: regulator: Add bindings for
 MediaTek DVFSRC Regulators
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240417_074606_157775_2B49CD5D 
X-CRM114-Status: GOOD (  12.05  )
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


On Wed, 17 Apr 2024 11:14:36 +0200, AngeloGioacchino Del Regno wrote:
> The Dynamic Voltage and Frequency Scaling Resource Collector Regulators
> are controlled with votes to the DVFSRC hardware.
> 
> This adds support for the regulators found in MT6873, MT8183, MT8192
> and MT8195 SoCs.
> 
> Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
> ---
>  .../mediatek,mt6873-dvfsrc-regulator.yaml     | 71 +++++++++++++++++++
>  1 file changed, 71 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/regulator/mediatek,mt6873-dvfsrc-regulator.yaml
> 

My bot found errors running 'make dt_binding_check' on your patch:

yamllint warnings/errors:

dtschema/dtc warnings/errors:
Documentation/devicetree/bindings/regulator/mediatek,mt6873-dvfsrc-regulator.example.dtb: /example-0/soc/system-controller@10012000: failed to match any schema with compatible: ['mediatek,mt8195-dvfsrc']

doc reference errors (make refcheckdocs):

See https://patchwork.ozlabs.org/project/devicetree-bindings/patch/20240417091442.170505-2-angelogioacchino.delregno@collabora.com

The base for the series is generally the latest rc1. A different dependency
should be noted in *this* patch.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit after running the above command yourself. Note
that DT_SCHEMA_FILES can be set to your schema file to speed up checking
your schema. However, it must be unset to test all examples with your schema.


