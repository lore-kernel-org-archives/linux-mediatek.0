Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 23EB9E77188
	for <linux-mediatek@archiver.kernel.org>; Fri, 10 Jan 2025 13:59:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Subject:Message-Id:
	References:In-Reply-To:To:From:MIME-Version:Content-Transfer-Encoding:
	Content-Type:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=gAwWD/T4MOyZUPt+o+iUAqDeL/G1BwsvQHyDyyfHt7o=; b=44B58pGt7yUt1me90Cnqe/e4hN
	qpMCErhmpgEN1jAcTQAsEjB3j4HVdLblV4obYldMrEfifFExlP+tOM+OxoJyDnmWkTNkU+Wowk1QV
	HLgJb0m2SStih9IITQ4ssbSjzX+LCc2lWcvKowds31Pl2zZgnZ9Uf9ZXjQYMdccS1agF7/Yr9YSN+
	IVqbb9VfWSWHMhOVx8X3sEqTlZDU1dwrQDo90JLyQUoEX9x2punkh0ZavjawRv9hy+SDA221qS5Gg
	HXa/C/J586bAyqWOiVwPoOzcKJ1gUk8j3MPcReL9/PTVdawqlGF5RHcVEDhoOVGPyKgCjMdVQ7b7z
	o5E1T9dA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tWFYC-0000000FYZL-3n2y;
	Fri, 10 Jan 2025 13:59:48 +0000
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tWFSv-0000000FXU8-4B77;
	Fri, 10 Jan 2025 13:54:23 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id B8F9AA41FF0;
	Fri, 10 Jan 2025 13:52:32 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D91C3C4CEE0;
	Fri, 10 Jan 2025 13:54:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1736517261;
	bh=c33XsyMYg3lCZo4jpADv7ET+BOVPEFjhz4yMn/jPl1A=;
	h=Date:From:Cc:To:In-Reply-To:References:Subject:From;
	b=KWqV6/vE7KQCJgNFRcquCgrCjHRe/7On429TF1/YwgJ8uyH8LgGnzoxu9h2hPB+np
	 eV/ArpXirzOXk2MpJjQ5k2WU4XMN2dCN1XuMVoBPAKP83DlDEDkR2NThlO8HSZDfVW
	 gA5KluAc59Ylpw0SuzcNDGBrYLBFUSQgkS0qaYo1N/3f+8+p2K0uIW4KkrNMi2w/oy
	 xW2oqZPse7R8vvCQYlX3fQDuPhwc4OH0wc0+4cIe13QQwrz7xXQwh7alaDcRZLcsUR
	 2eEEyMV/pjQr7ARpnoAagABg7tVVjjDWNP1H9LlIK8PpZRx/wKuoR4S0PLhydXrnA3
	 DEVsj+JcmLydw==
Date: Fri, 10 Jan 2025 07:54:19 -0600
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
From: "Rob Herring (Arm)" <robh@kernel.org>
To: "paul-pl.chen" <paul-pl.chen@mediatek.com>
In-Reply-To: <20250110123835.2719824-7-paul-pl.chen@mediatek.com>
References: <20250110123835.2719824-1-paul-pl.chen@mediatek.com>
 <20250110123835.2719824-7-paul-pl.chen@mediatek.com>
Message-Id: <173651725647.2671771.14303040035335565076.robh@kernel.org>
Subject: Re: [PATCH 05/12] dt-bindings: display: mediatek: add OUTPROC yaml
 for MT8196
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250110_055422_096087_BB5B37DB 
X-CRM114-Status: GOOD (  13.06  )
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
Cc: devicetree@vger.kernel.org, conor+dt@kernel.org, xiandong.wang@mediatek.com, chunkuang.hu@kernel.org, jason-jh.lin@mediatek.com, singo.chang@mediatek.com, linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, Project_Global_Chrome_Upstream_Group@mediatek.com, treapking@chromium.org, nancy.lin@mediatek.com, linux-mediatek@lists.infradead.org, sunny.shen@mediatek.com, p.zabel@pengutronix.de, sirius.wang@mediatek.com, matthias.bgg@gmail.com, krzk+dt@kernel.org, linux-arm-kernel@lists.infradead.org, angelogioacchino.delregno@collabora.com
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org


On Fri, 10 Jan 2025 20:34:01 +0800, paul-pl.chen wrote:
> From: "Paul-pl.Chen" <paul-pl.chen@mediatek.com>
> 
> Add mediate,outproc.yaml to support OUTPROC for MT8196.
> 
> Signed-off-by: Paul-pl.Chen <paul-pl.chen@mediatek.com>
> ---
> The header used in examples:
> #include <dt-bindings/clock/mt8196-clk.h>
> is not upstreamed yet.
> 
> It will be sent by related owner soon.
> ---
>  .../display/mediatek/mediatek,outproc.yaml    | 57 +++++++++++++++++++
>  1 file changed, 57 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/display/mediatek/mediatek,outproc.yaml
> 

My bot found errors running 'make dt_binding_check' on your patch:

yamllint warnings/errors:

dtschema/dtc warnings/errors:


doc reference errors (make refcheckdocs):

See https://patchwork.ozlabs.org/project/devicetree-bindings/patch/20250110123835.2719824-7-paul-pl.chen@mediatek.com

The base for the series is generally the latest rc1. A different dependency
should be noted in *this* patch.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit after running the above command yourself. Note
that DT_SCHEMA_FILES can be set to your schema file to speed up checking
your schema. However, it must be unset to test all examples with your schema.


