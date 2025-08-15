Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8D310CA0EE4
	for <linux-mediatek@archiver.kernel.org>; Fri, 15 Aug 2025 03:46:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Subject:Message-Id:
	References:In-Reply-To:To:Cc:From:MIME-Version:Content-Transfer-Encoding:
	Content-Type:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=7gTQhgS/PCAFF82SZ6Z1u8WHxfzOCE9NSg1LWgEZgX4=; b=T3O52ogkrKZK5OiwJ0SB2saYtr
	brYl1+7lGOtKfZSPEn29mPPiaXp4xWk6ZAI5kB0ttbmvz8t9HrV0L4D0bCwSzUegVXTAhwIbsrPJJ
	NBLubjlJCScEwFUjB3gZ5srZKrqB7f3Ro6oEJamL/pgqBirSPJ8Siw5ssTQlgCouUJiA/aWET8niy
	PVsQ3uaupt3Vojbp+DEUxw4SCEtYlXQWwfXTyP1OidoRwLTLNsT9/OCjZCMMqDagTNM2W0h18H8FP
	t8EAezLOnN5eYEo2vxMHZHrpFjLzhV4LcCpuo47JpvfqGBwUn5FbV/05cnAUXkVHYv+4528VUMmAc
	HthsmSjw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1umlOt-00000001KTp-0u9X;
	Fri, 15 Aug 2025 03:46:43 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1umkBi-000000019qs-3nZO;
	Fri, 15 Aug 2025 02:29:04 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 6BE38461BA;
	Fri, 15 Aug 2025 02:29:02 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 34840C4CEED;
	Fri, 15 Aug 2025 02:29:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1755224942;
	bh=mrIFnf38WHuWo+npT76l0eVvwyuTXr6L3piFWujpfYc=;
	h=Date:From:Cc:To:In-Reply-To:References:Subject:From;
	b=EzZtiW0EkhDcPGb/p/XGknovtZlObtJ74JLzKRktWStLzPDoAREAwQEFmBGG4/lcU
	 kJuJFI88d1Yg2M2TvE6lsWrgbzUKuygxVu9K21jHkXSEyd1FkDWAAvE4XTtV3NbK/h
	 geGbVEAi8hJOV6ODUe/wkbWQEUtBmi3R97vumnNvgkw7oFM08dk40yR+BSI14Hb3oN
	 4U5DLAgmgVEtkvI86f+afxxIuhyerFeqA48dlhOsUNbh8eW9vI71vzTPwjN2zTWAaP
	 zpEC0HK44AeIIe/NNS5pDu6IK2kTLuPo1zCSpF0fhgfUHJBF7/+WEvv7QnxVxLTclW
	 6z8ISRsmiX7cg==
Date: Thu, 14 Aug 2025 21:29:01 -0500
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
From: "Rob Herring (Arm)" <robh@kernel.org>
Cc: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, devicetree@vger.kernel.org, 
 Chunfeng Yun <chunfeng.yun@mediatek.com>, 
 linux-mediatek@lists.infradead.org, ~postmarketos/upstreaming@lists.sr.ht, 
 Conor Dooley <conor+dt@kernel.org>, Vinod Koul <vkoul@kernel.org>, 
 Kishon Vijay Abraham I <kishon@kernel.org>, 
 linux-arm-kernel@lists.infradead.org, 
 Matthias Brugger <matthias.bgg@gmail.com>, linux-kernel@vger.kernel.org, 
 linux-phy@lists.infradead.org
To: Arseniy Velikanov <me@adomerle.pw>
In-Reply-To: <20250814234825.810-1-me@adomerle.pw>
References: <20250814234825.810-1-me@adomerle.pw>
Message-Id: <175522494130.180632.985870901068506270.robh@kernel.org>
Subject: Re: [PATCH v1 1/2] dt-bindings: phy: mtk-tphy: add property for
 software role switch
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250814_192902_963744_8265E2FA 
X-CRM114-Status: UNSURE (   9.43  )
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


On Fri, 15 Aug 2025 03:48:24 +0400, Arseniy Velikanov wrote:
> Add a boolean property to enable software control of the PHY mode
> switching.
> 
> Signed-off-by: Arseniy Velikanov <me@adomerle.pw>
> ---
>  Documentation/devicetree/bindings/phy/mediatek,tphy.yaml | 6 ++++++
>  1 file changed, 6 insertions(+)
> 

My bot found errors running 'make dt_binding_check' on your patch:

yamllint warnings/errors:

dtschema/dtc warnings/errors:
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/phy/mediatek,tphy.yaml: mediatek,software-role-switch: missing type definition

doc reference errors (make refcheckdocs):

See https://patchwork.ozlabs.org/project/devicetree-bindings/patch/20250814234825.810-1-me@adomerle.pw

The base for the series is generally the latest rc1. A different dependency
should be noted in *this* patch.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit after running the above command yourself. Note
that DT_SCHEMA_FILES can be set to your schema file to speed up checking
your schema. However, it must be unset to test all examples with your schema.


