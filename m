Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8253BC43217
	for <linux-mediatek@archiver.kernel.org>; Fri, 14 Oct 2022 20:43:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:To:Cc:From:
	Subject:References:In-Reply-To:Content-Transfer-Encoding:MIME-Version:
	Content-Type:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=jysvzUZBCzregl+pcc3aK31ZZv5e9uKoafnbZNrJPAI=; b=gKF5GkhxqK0EcaqFFq1iJPcvq1
	Nf+uyCDexOJKo0VNE6kEUXz9H0dmlyNuMXlb/4BiYdmb+PADLKhMwolQ9szvlsVYf9XD/fYk+ylv5
	YoeeyvIHJgBSojKoyKCF32SBVYscFRbt801BBfYNqmFdgtIdJPKw6mk0h9c8krzC/VUXS9WExqrxS
	eMCBy7SeOiDeOC9m197TzLImYbW02tprB17691KdEIvCRDwVVT+ivKr3gl11c3CyY4qleX9slLdbN
	7A922PTMKbYb/fjMWl3RtYjpxCcMzB2swP4p//Dn7+Nc/e/01xwGIFYkW9OvcvLwU1ahADdHVN/hW
	ZgwdcxAQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ojRWK-00FrnW-NK; Fri, 14 Oct 2022 20:43:04 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ojRW0-00Fres-26; Fri, 14 Oct 2022 20:42:47 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 705F161C39;
	Fri, 14 Oct 2022 20:42:43 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C7CAFC433B5;
	Fri, 14 Oct 2022 20:42:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1665780162;
	bh=O2YPCkvYoPkPM51n6KuE/kCLXzRJRqmOqCJxc3Y7mZQ=;
	h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
	b=ErXdOE1Nm7fTP7QoH5gB7S2AdCRaYd2zN/6XSFY6kzVcntp6H8nDVfxYMaSg2jbpD
	 ND8eh4tCScUhdfjq8dKMuGaF1H2a9BMhS7wVF+KTquILvLUw8dn5ZZPnNRV+LSnTPR
	 hE2oQgKvcWdTMe9xzA2Adm+KaPmeaCAiUx5pGclOkMwFubWCrOekCbA/c3WLsM6uPm
	 WTbdZthF0elbni9zYxYISQgK1xp0UO5VOyPg8pR9hH/szkf7RA7/9HSPg72P0G340X
	 oQy+2mZVRvL0pWQsn91mp9BADJh6w0g2PkGkAFrLMzpm7ds9BQBh5eQEpihZNc2biO
	 WiTGC6WMReSrQ==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20221013112336.15438-3-johnson.wang@mediatek.com>
References: <20221013112336.15438-1-johnson.wang@mediatek.com> <20221013112336.15438-3-johnson.wang@mediatek.com>
Subject: Re: [PATCH v4 2/4] dt-bindings: arm: mediatek: Add new bindings of MediaTek frequency hopping
From: Stephen Boyd <sboyd@kernel.org>
Cc: linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, Project_Global_Chrome_Upstream_Group@mediatek.com, kuan-hsin.lee@mediatek.com, yu-chang.wang@mediatek.com, Johnson Wang <johnson.wang@mediatek.com>, Edward-JW Yang <edward-jw.yang@mediatek.com>
To: Johnson Wang <johnson.wang@mediatek.com>, angelogioacchino.delregno@collabora.com, krzysztof.kozlowski+dt@linaro.org, robh+dt@kernel.org
Date: Fri, 14 Oct 2022 13:42:40 -0700
User-Agent: alot/0.10
Message-Id: <20221014204242.C7CAFC433B5@smtp.kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221014_134244_166937_5C9B12B4 
X-CRM114-Status: GOOD (  14.76  )
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

Quoting Johnson Wang (2022-10-13 04:23:34)
> Add the new binding documentation for MediaTek frequency hopping
> and spread spectrum clocking control.
>=20
> Co-developed-by: Edward-JW Yang <edward-jw.yang@mediatek.com>
> Signed-off-by: Edward-JW Yang <edward-jw.yang@mediatek.com>
> Signed-off-by: Johnson Wang <johnson.wang@mediatek.com>
> Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collab=
ora.com>
> Reviewed-by: Rob Herring <robh@kernel.org>
> ---
>  .../arm/mediatek/mediatek,mt8186-fhctl.yaml   | 53 +++++++++++++++++++
>  1 file changed, 53 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/arm/mediatek/mediat=
ek,mt8186-fhctl.yaml
>=20
> diff --git a/Documentation/devicetree/bindings/arm/mediatek/mediatek,mt81=
86-fhctl.yaml b/Documentation/devicetree/bindings/arm/mediatek/mediatek,mt8=
186-fhctl.yaml
> new file mode 100644
> index 000000000000..59111946966c
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/arm/mediatek/mediatek,mt8186-fhct=
l.yaml
> @@ -0,0 +1,53 @@
> +# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/arm/mediatek/mediatek,mt8186-fhctl.ya=
ml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: MediaTek frequency hopping and spread spectrum clocking control

The driver patch is in drivers/clk so why not put the binding in
bindings/clock as well?

> +
> +maintainers:
> +  - Edward-JW Yang <edward-jw.yang@mediatek.com>
> +
[...]
> +
> +required:
> +  - compatible
> +  - reg
> +  - clocks
> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    #include <dt-bindings/clock/mt8186-clk.h>
> +    fhctl: fhctl@1000ce00 {

Is it a clock-controller? 'fhctl' isn't a generic node name.

> +        compatible =3D "mediatek,mt8186-fhctl";
> +        reg =3D <0x1000ce00 0x200>;
> +        clocks =3D <&apmixedsys CLK_APMIXED_MSDCPLL>;
> +        mediatek,hopping-ssc-percent =3D <3>;

