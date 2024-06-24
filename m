Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 46096C2D0D1
	for <linux-mediatek@archiver.kernel.org>; Mon, 24 Jun 2024 20:28:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=yBd7ofEnRHUsBAQyAE0mG8eQuTNaQZxeYg9B1t2vuq4=; b=byXqycDtnKZo15LMxohWVSQc90
	kBhU5lfnhWBU3ixnULFA6OsZdvq+CmdqMQvawhHYYcOVgh2llP3VL5ycDCMS+IHpoCSKjUtNIldmn
	KaAAN/44qAF6chcaFy0rnXLKk49oU9WkeKlkN+E/+iuiQmaM4pIbnuGtAkSwqTopW4vfCx6bIymE3
	1vx+Lq/WDHs4z16rIPugX8b3bXO8KcHTH0KHcwCi4sdsLu/3rZdT+YOmL6Zja93+QTKqPF5UN21JI
	5Z2dCZrXBnpNOohxzu9o+rcI25fQqseqXDEKH82j2uw1fW+ya9NbGZUwI3oihAhoCbRXUly9qdbCg
	WRSbtbWw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sLqIo-00000000ZlH-1SoS;
	Mon, 24 Jun 2024 20:28:38 +0000
Received: from sin.source.kernel.org ([2604:1380:40e1:4800::1])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sLqIh-00000000Zj6-2zAj;
	Mon, 24 Jun 2024 20:28:33 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id CA180CE13CF;
	Mon, 24 Jun 2024 20:28:28 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EA6A5C2BBFC;
	Mon, 24 Jun 2024 20:28:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1719260907;
	bh=HL7UJ/iRbKbk7kdt37fx7w1eCbakq9KlVaHHm4Ee8YU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ZkXsulp9syLWY+sZw//zcuqYiWdoQaPOADpd4MwIteCIaoOP0sY9A33y6x3hqYO+K
	 t2kdQ42rzbZdSAypc21O/Afbgu69nRYjwyiGxJ0d9T4MnWiGVpYu3RPulzFnJVjHaF
	 X0xoGKs3Quz3DD2cOKmLYGaCnDd0oYBALak/NfDTDoP4myaqSSFlNl3zYRZyN8F+4q
	 /JdEhATIuiYjypfPK/10zC4yVUg6C0qpN6Ez7QN70UDxCX4UXbqgs/0isgm9V0KZbF
	 zQCp8Ik8aRov4QvKl4pArXh01s/iSpwE4/nneuZNEzms17LnuAw4VMNwcSMnai4acN
	 SdVJnkIRuD7ig==
Date: Mon, 24 Jun 2024 14:28:25 -0600
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: linux-mediatek@lists.infradead.org, Conor Dooley <conor+dt@kernel.org>,
	linux-kernel@vger.kernel.org,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Shan-Chun Hung <schung@nuvoton.com>,
	Orson Zhai <orsonzhai@gmail.com>,
	Vadivel Murugan <vadivel.muruganx.ramuthevar@linux.intel.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	UNGLinuxDriver@microchip.com,
	Steen Hegelund <Steen.Hegelund@microchip.com>,
	Baolin Wang <baolin.wang@linux.alibaba.com>,
	Chunyan Zhang <zhang.lyra@gmail.com>,
	Khuong Dinh <khuong@os.amperecomputing.com>,
	linux-arm-kernel@lists.infradead.org,
	Lars Povlsen <lars.povlsen@microchip.com>,
	Jiaxun Yang <jiaxun.yang@flygoat.com>, Lee Jones <lee@kernel.org>,
	Daniel Machon <daniel.machon@microchip.com>,
	Nishanth Menon <nm@ti.com>, Jacky Huang <ychuang3@nuvoton.com>,
	devicetree@vger.kernel.org,
	Matthias Brugger <matthias.bgg@gmail.com>
Subject: Re: [PATCH v2 6/7] dt-bindings: mfd: syscon: Split and enforce
 documenting MFD children
Message-ID: <171926090377.354722.8861218849398833034.robh@kernel.org>
References: <20240616-dt-bindings-mfd-syscon-split-v2-0-571b5850174a@linaro.org>
 <20240616-dt-bindings-mfd-syscon-split-v2-6-571b5850174a@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240616-dt-bindings-mfd-syscon-split-v2-6-571b5850174a@linaro.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240624_132831_955919_4EB2502E 
X-CRM114-Status: GOOD (  12.41  )
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


On Sun, 16 Jun 2024 15:19:26 +0200, Krzysztof Kozlowski wrote:
> Simple syscon nodes can be documented in common syscon.yaml, however
> devices with simple-mfd compatible, thus with some children, should have
> their own schema listing these children.  Such listing makes the binding
> specific, allows better validation (so the incorrect child would not
> appear in the simple-mfd node) and actually enforces repeated rule for
> simple-mfd devices:
> 
>   "simple-mfd" is only for simple devices, where the children do not
>   depend on the parent.
> 
> Currently the syscon+simple-mfd binding is quite broad and allows
> any child or property, thus above rule cannot be enforced.
> 
> Split the syscon.yaml binding into:
> 1. Common syscon properties, used potentially by many bindings.
> 2. Simple syscon devices (NO simple-mfd!).
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> 
> ---
> 
> Depends on:
> 1. Patch in MFD: https://lore.kernel.org/all/171828959006.2643902.8308227314531523435.b4-ty@kernel.org/
> 2. Previous patches in the series.
> ---
>  .../devicetree/bindings/mfd/syscon-common.yaml     |  72 +++++
>  Documentation/devicetree/bindings/mfd/syscon.yaml  | 294 +++++++++++++--------
>  2 files changed, 251 insertions(+), 115 deletions(-)
> 

Reviewed-by: Rob Herring (Arm) <robh@kernel.org>


