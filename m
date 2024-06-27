Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 19018C2BD09
	for <linux-mediatek@archiver.kernel.org>; Thu, 27 Jun 2024 08:19:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=B76JdKJP7NL62N7NLYXXU7XuQuEkVTh37ZqW5zb3YTg=; b=Cv2QQEvk3JG5icVFzIBiR5YJbO
	uRQ4TVVStYiLH47qhE9+Q/26mVeLfFIegPeAsMRFKZqgAPu423m80BvdsLZEh6uHE5fQ715/h6g0Y
	tF4b/ks+Td5eA39Fs1UBRzCJtt3RLOmxGHZUNi2BSSTgiCezkzmjR3PzH0X2puHcbX8CnlTxAv1Pk
	O58pXPqBPVEjPX8NI+O6Ma5G5Izuqkn8kExIM+8Y8ydAboOz540QyXBhlVqUMnIshu2XhLq0zflnH
	uAV594fWH24wUVDA//cZd7RXEtVN8dAb4VOLeXaFbF9w3USMjuETkDMe9l3I6s8DqEjmuGquXu4Lz
	9TGByl9g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sMkLd-00000009iZv-0BQc;
	Thu, 27 Jun 2024 08:19:17 +0000
Received: from sin.source.kernel.org ([145.40.73.55])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sMkLT-00000009iWz-1vDo;
	Thu, 27 Jun 2024 08:19:09 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id B9A21CE20D9;
	Thu, 27 Jun 2024 08:19:02 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B81ACC2BBFC;
	Thu, 27 Jun 2024 08:18:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1719476341;
	bh=iVl5R4+HXbf/5A+fy4DPGQQgVODrP+GEinz+6PySv8k=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Hyj8fE5QZpbW9ucDN27Qui9TvgPDrMEcdEC0Ax958ZvsoFqDYu6yUwBvGdBfdNtOT
	 uZfMGMTqS/xKoEveEaocX2IfvAGwL62tEoRA1uV4e3ilcBKui2tGU1+hrwK95b0sL9
	 xg6LTHPZjhS9AyRYRz4h16Hf5RCoYncgGhbsMufJU0yN0Hklajo/TeRa/TK7h7jQC2
	 FDOrt0GSx65j2k2Kx/zbOqOM0ox/XMQOSWs8l/0Fnb5G17x0pBO3Fqcwigt3rAg8e3
	 dNBCHB/iDYsYYY0BLsc1OKY54R+jwAE5IsyKcW5BHL48cU9lxLvSNESSHHDluPwM5H
	 D/l0CGwT9LfHQ==
Date: Thu, 27 Jun 2024 09:18:53 +0100
From: Lee Jones <lee@kernel.org>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: Orson Zhai <orsonzhai@gmail.com>,
	Baolin Wang <baolin.wang@linux.alibaba.com>,
	Chunyan Zhang <zhang.lyra@gmail.com>,
	Jacky Huang <ychuang3@nuvoton.com>,
	Shan-Chun Hung <schung@nuvoton.com>,
	Khuong Dinh <khuong@os.amperecomputing.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Chuanhua Lei <lchuanhua@maxlinear.com>,
	Rahul Tanwar <rtanwar@maxlinear.com>,
	Lars Povlsen <lars.povlsen@microchip.com>,
	Steen Hegelund <Steen.Hegelund@microchip.com>,
	Daniel Machon <daniel.machon@microchip.com>,
	UNGLinuxDriver@microchip.com, Nishanth Menon <nm@ti.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Jiaxun Yang <jiaxun.yang@flygoat.com>, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	Conor Dooley <conor.dooley@microchip.com>,
	Rahul Tanwar <rahul.tanwar@linux.intel.com>,
	Amireddy Mallikarjuna reddy <mallikarjunax.reddy@intel.com>,
	"Zhu, Yi Xin" <Yixin.zhu@intel.com>,
	Maxime Ripard <mripard@kernel.org>
Subject: Re: [PATCH v3 0/7] dt-bindings: mfd: syscon: Document more
 compatibles and require simpe-mfd description
Message-ID: <20240627081853.GF2532839@google.com>
References: <20240626-dt-bindings-mfd-syscon-split-v3-0-3409903bb99b@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20240626-dt-bindings-mfd-syscon-split-v3-0-3409903bb99b@linaro.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240627_011907_905711_60DA8CAF 
X-CRM114-Status: GOOD (  22.25  )
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

On Wed, 26 Jun 2024, Krzysztof Kozlowski wrote:

> Hi,
> 
> Dependency
> ==========
> Rebased on Lee's MFD tree, because dependency is there already:
> https://lore.kernel.org/all/171828959006.2643902.8308227314531523435.b4-ty@kernel.org/
> 
> Merging
> =======
> Preferrably everything via MFD tree (file/context dependencies).
> 
> Changes in v3
> =============
> - Add tags
> - intel,lgm-syscon: change maintainers (email bounce)
> - syscon/Split: drop unneeded |, use const instead of enum in select:
> - Link to v2: https://lore.kernel.org/r/20240616-dt-bindings-mfd-syscon-split-v2-0-571b5850174a@linaro.org
> 
> Changes in v2
> =============
> - Add acks
> - lgm-syscon: add ranges to binding and example
> - syscon.yaml: add big select with all compatibles for older dtschema
> - Link to v1: https://lore.kernel.org/r/20240519-dt-bindings-mfd-syscon-split-v1-0-aaf996e2313a@linaro.org
> 
> Description/problem
> ===================
> Simple syscon nodes can be documented in common syscon.yaml, however
> devices with simple-mfd compatible, thus some children, should have
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
> Solution
> ========
> 1. Split the syscon.yaml binding into common syscon properties, used
>    potentially by many bindings, and only simple syscon devices (NO
>    simple-mfd!).
> 2. Move some known simple-mfd bindings from syscon.yaml to dedicated
>    files.
> 
> This patchset might introduce new dtbs_check warnings for devices having
> simple-mfd and being part of syscon.yaml previously. I fixed some of
> them, but probably not all.
> 
> Best regards,
> Krzysztof
> 
> To: Lee Jones <lee@kernel.org>
> To: Rob Herring <robh@kernel.org>
> To: Krzysztof Kozlowski <krzk+dt@kernel.org>
> To: Conor Dooley <conor+dt@kernel.org>
> To: Lars Povlsen <lars.povlsen@microchip.com>
> To: Steen Hegelund <Steen.Hegelund@microchip.com>
> To: Daniel Machon <daniel.machon@microchip.com>
> To: UNGLinuxDriver@microchip.com
> To: Nishanth Menon <nm@ti.com>
> To: Matthias Brugger <matthias.bgg@gmail.com>
> To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
> Cc: devicetree@vger.kernel.org
> Cc: linux-kernel@vger.kernel.org
> Cc: linux-arm-kernel@lists.infradead.org
> Cc: linux-mediatek@lists.infradead.org
> 
> ---
> Krzysztof Kozlowski (7):
>       dt-bindings: mfd: syscon: Drop hwlocks
>       dt-bindings: soc: sprd: sc9863a-glbregs: Document SC9863A syscon
>       dt-bindings: soc: intel: lgm-syscon: Move to dedicated schema
>       dt-bindings: soc: microchip: sparx5-cpu-syscon: Move to dedicated schema
>       dt-bindings: soc: ti: am654-serdes-ctrl: Move to dedicated schema
>       dt-bindings: mfd: syscon: Split and enforce documenting MFD children
>       dt-bindings: mfd: syscon: Add APM poweroff mailbox
> 
>  .../devicetree/bindings/mfd/syscon-common.yaml     |  71 +++++
>  Documentation/devicetree/bindings/mfd/syscon.yaml  | 306 ++++++++++++---------
>  .../bindings/soc/intel/intel,lgm-syscon.yaml       |  57 ++++
>  .../soc/microchip/microchip,sparx5-cpu-syscon.yaml |  49 ++++
>  .../bindings/soc/sprd/sprd,sc9863a-glbregs.yaml    |  55 ++++
>  .../bindings/soc/ti/ti,am654-serdes-ctrl.yaml      |  42 +++
>  6 files changed, 457 insertions(+), 123 deletions(-)
> ---
> base-commit: 8dc7c29f608649f3d9eca826e9d4fe4b8a32c472
> change-id: 20240517-dt-bindings-mfd-syscon-split-37e23996523d

Okay, I tried to apply these whilst fixing up all the conflicts, but
lost the will to live.  Please rebase and [RESEND].

-- 
Lee Jones [李琼斯]

