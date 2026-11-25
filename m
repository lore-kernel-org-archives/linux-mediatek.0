Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A668F606A337
	for <linux-mediatek@archiver.kernel.org>; Wed, 25 Nov 2026 10:56:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=3XM91Wfg;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=NvG4H/6J
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From
	:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=uk1PPG/FDoyL9b6Au2Lqg1OrW2czFnedhEgtVD2BHEI=; b=3XM91Wfg0JZmoS
	AUU+NN6zSUhnFNYSTQNP9bllhg8d7HVUh3Ll26pbp+le+QI/6S3v5G0NAJEuu/eGP45Ti1NCiyM4v
	X/7a/77H878FZEnxZ1Q8xH1WepzfKcgekHlIrwn965ikwm9otT+zp8X044cSYNtzyfIaG0Pd6dO1u
	vjuNR2HWV60kBPkHolVOme+5Hh8iRomdB855kr/eC2tyKAdxyjnAJNdsv67O8hWxbXMCEQ/5tqbGg
	LjLdP4vVk3bonxl8xlmQqVYZdIyMvDrmnWVzJUxH67w/1WkIQvRRcqfUvyzbkjCkJaLaeNEGLxvsR
	BIA80ywGN/uDmS5ZAO7Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWAfV-00000009WPq-1eq8;
	Wed, 25 Nov 2026 10:56:05 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWAfU-00000009WOz-2PlW;
	Wed, 25 Nov 2026 10:56:04 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 0EC2B447D4;
	Wed, 25 Nov 2026 10:56:04 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E6E641F000C0;
	Wed, 25 Nov 2026 10:55:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795604163;
	bh=uk1PPG/FDoyL9b6Au2Lqg1OrW2czFnedhEgtVD2BHEI=;
	h=Date:Subject:To:References:From:In-Reply-To;
	b=NvG4H/6JtQ6E4Uf23rGZN/aBgjo0J2DaZo9i6kFoa+t0wwBhH22VAWT2zRepaP9wC
	 B298LAti6/W9d7tRSQF6CAb1kDVdmLQXddgtYOPVauQQpOPO+VE25N+PbmLNLKSNsE
	 IKT4IRXYvIpdKismji8P6Y/EN3YOnx1bGdN1QSlY9JXprhp/n/xHPmPjdMKQ8pQRCW
	 3XjaonLF0KMjAuy5OFbHOSoJ5lUjSvIYemWrWvNJUoJhGuqJuLPe2GRm2zoet0h8IL
	 oXmJyjusLT9mDuNImoB6VNlvCX5+gNYdxzP75HiM6FGu5YS2U3Qm8d2qmhQamns1t5
	 8+zTuzDW7tWlA==
Message-ID: <77569628-a251-4086-a148-7673453854e8@kernel.org>
Date: Wed, 25 Nov 2026 11:55:55 +0100
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/7] dt-bindings: clock: mediatek: add MT8196 MMDVFS clock
 IDs
To: Echo Zhang <echo.zhang@mediatek.com>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>,
 Jerome Brunet <jbrunet+clk@baylibre.com>,
 Nathan Chancellor <nathan@kernel.org>,
 Nick Desaulniers <ndesaulniers@google.com>, Bill Wendling
 <morbo@google.com>, Justin Stitt <justinstitt@google.com>,
 MMDVFS Team <linux-mediatek@lists.infradead.org>, kyrie.wu@mediatek.com,
 ming-fan.chen@mediatek.com, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-clk@vger.kernel.org, llvm@lists.linux.dev
References: <20261125060037.649659-1-echo.zhang@mediatek.com>
 <20261125060037.649659-2-echo.zhang@mediatek.com>
From: Krzysztof Kozlowski <krzk@kernel.org>
Content-Language: en-US
Autocrypt: addr=krzk@kernel.org; keydata=
 xsFNBFVDQq4BEAC6KeLOfFsAvFMBsrCrJ2bCalhPv5+KQF2PS2+iwZI8BpRZoV+Bd5kWvN79
 cFgcqTTuNHjAvxtUG8pQgGTHAObYs6xeYJtjUH0ZX6ndJ33FJYf5V3yXqqjcZ30FgHzJCFUu
 JMp7PSyMPzpUXfU12yfcRYVEMQrmplNZssmYhiTeVicuOOypWugZKVLGNm0IweVCaZ/DJDIH
 gNbpvVwjcKYrx85m9cBVEBUGaQP6AT7qlVCkrf50v8bofSIyVa2xmubbAwwFA1oxoOusjPIE
 J3iadrwpFvsZjF5uHAKS+7wHLoW9hVzOnLbX6ajk5Hf8Pb1m+VH/E8bPBNNYKkfTtypTDUCj
 NYcd27tjnXfG+SDs/EXNUAIRefCyvaRG7oRYF3Ec+2RgQDRnmmjCjoQNbFrJvJkFHlPeHaeS
 BosGY+XWKydnmsfY7SSnjAzLUGAFhLd/XDVpb1Een2XucPpKvt9ORF+48gy12FA5GduRLhQU
 vK4tU7ojoem/G23PcowM1CwPurC8sAVsQb9KmwTGh7rVz3ks3w/zfGBy3+WmLg++C2Wct6nM
 Pd8/6CBVjEWqD06/RjI2AnjIq5fSEH/BIfXXfC68nMp9BZoy3So4ZsbOlBmtAPvMYX6U8VwD
 TNeBxJu5Ex0Izf1NV9CzC3nNaFUYOY8KfN01X5SExAoVTr09ewARAQABzSVLcnp5c3p0b2Yg
 S296bG93c2tpIDxrcnprQGtlcm5lbC5vcmc+wsGPBBMBCgA5AhsDBgsJCAcDAgYVCAIJCgsE
 FgIDAQIeAQIXgBYhBJvQfg4MUfjVlne3VBuTQ307QWKbBQJp2mE8AAoJEBuTQ307QWKbeaIP
 /ihHTkTW4KsN/DQ945JJbyu5tI0J80Wue7QyyLPglyKfhgb5cLLNPpOC8cCIJsc7+W3i2P38
 s2c1cOH6CYGE7E9ur3Vfme8NW2S2I/Z8VC7bZnzyS23wT17LrsdS/qCpx4o8U+pt/xdXDKph
 EGRYrIEmMpUWvyYzyYKGIe25FtaayIIKpq8eZYyFcp2f/sG5IkOW5uZzHPMPdcm87jU7fyuQ
 rAU2vx9r+ulUfQ/q9Z2roC/ode3l7t2pN7BCBCsUDp6JCrUyZrtT1e7EbA0ZRP3aOBNk2P2E
 DQOgJGjGdO5Yx2Y9LFtltu6JbsBJHi1syGRX3AtQYOMc4Y1WGoeZJmMlvKj2ZqqXNkcWi2DS
 IQEWB0uW6CqFsBBIMGDa+6OzdaVO/uAVXWDWml02Men3CILdI1MbVjoh8ECqYUY7OQ+JJvNN
 vnliuq5WM3Ghd3jg/LZZrxXjdIginRHFQCjIJYLKpLZWm1/iDFedcfzqRNYmTtqscdCNHW41
 oT3Z7BmO9xwdjuwBS6nmS6JJwkbf5Ot2QR4pB/DRU7ZwjT1qHe+9r9gF32wXVQatHNGK/VVu
 sfwOnkdxCWkp/qb2gdQRmZh+SedStWshigH6sNfuHBloF/q+hjMRc8b2m326OZdrbSHwY1Sz
 vti8Hn7n8NjdHO9LKB7BIdjkA9DA5WsqOuVCzsFNBFVDXDQBEADNkrQYSREUL4D3Gws46JEo
 Z9HEQOKtkrwjrzlw/tCmqVzERRPvz2Xg8n7+HRCrgqnodIYoUh5WsU84N03KlLueMNsWLJBv
 BaubYN4JuJIdRr4dS4oyF1/fQAQPHh8Thpiz0SAZFx6iWKB7Qrz3OrGCjTPcW6eiOMheesVS
 5hxietSmlin+SilmIAPZHx7n242u6kdHOh+/SyLImKn/dh9RzatVpUKbv34eP1wAGldWsRxb
 f3WP9pFNObSzI/Bo3kA89Xx2rO2roC+Gq4LeHvo7ptzcLcrqaHUAcZ3CgFG88CnA6z6lBZn0
 WyewEcPOPdcUB2Q7D/NiUY+HDiV99rAYPJztjeTrBSTnHeSBPb+qn5ZZGQwIdUW9YegxWKvX
 XHTwB5eMzo/RB6vffwqcnHDoe0q7VgzRRZJwpi6aMIXLfeWZ5Wrwaw2zldFuO4Dt91pFzBSO
 IpeMtfgb/Pfe/a1WJ/GgaIRIBE+NUqckM+3zJHGmVPqJP/h2Iwv6nw8U+7Yyl6gUBLHFTg2h
 YnLFJI4Xjg+AX1hHFVKmvl3VBHIsBv0oDcsQWXqY+NaFahT0lRPjYtrTa1v3tem/JoFzZ4B0
 p27K+qQCF2R96hVvuEyjzBmdq2esyE6zIqftdo4MOJho8uctOiWbwNNq2U9pPWmu4vXVFBYI
 GmpyNPYzRm0QPwARAQABwsF2BBgBCgAgAhsMFiEEm9B+DgxR+NWWd7dUG5NDfTtBYpsFAmna
 YUkACgkQG5NDfTtBYptX+BAApg32CkxwNucNEi8WfWA8oKkW0y8YDuY6ORMo9FWNGiT/OTy0
 vyJrLocrpn86zwfjVp+eCrssPYh8eqJfnWqmYv6ACQtHPYzPZQ3mSo8H97Z01oUxITzCxpXm
 ZkLgPIqtDPcC2E3dPM/fVxcyowM8XsaMA9wcsaUYrta8toOq2b9tKcjleKMfMrm0gQ9u7wUc
 QbLkwj6TCLOwucb07GXzLTNF9PZmaDUpKAZjMjmrW+le+SFvQbhamx0rxLWPR0NWntXpbCn+
 +ACch03p/JyTBVktxFsFyCt7pTPE1kEaeuXBTe/a2D9iQvRxRW19LvuO2e59/u1wYUiH/orz
 wbIC2S4dBsPAPihL3ztOU1yE86GPyQtSE0kU+/7snnLt4QGi6PChf3t5gnNjAzjUUovO8rgI
 c+5yN5heq5loYHgK6OQ9OlHzsPHO9e9MOQcKlFycs1pyijFGzDwdNUm/SchK8iWT2QApTx4A
 K9bCVaboTA2T77QYkRcRJYSsO1alGX0ome/hMLD1daXlkrNUp1HWa3K4iytLRXjCSIorWiGs
 n+q3krnpXu3TFkA8qtOFZMdnIiFuiq1yLT8hptsV5xh1TA2nsVvSYiaCr3q4s4BKjS/KrLDb
 qoxzw8ISjdUp4pA85vb6YLCmb39NgidD+7PmAr65lBNveIFynTgsja1rRQ4=
In-Reply-To: <20261125060037.649659-2-echo.zhang@mediatek.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-BeenThere: linux-mediatek@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-mediatek.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-mediatek/>
List-Post: <mailto:linux-mediatek@lists.infradead.org>
List-Help: <mailto:linux-mediatek-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mediatek>,
 <mailto:linux-mediatek-request@lists.infradead.org?subject=subscribe>
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
X-Spam-Status: No, score=-17.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1
	autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On 25/11/2026 07:00, Echo Zhang wrote:
> Add clock IDs for the MT8196 MMDVFS clock provider.
> 
> These IDs describe the clocks exposed by the MMDVFS block and are used by
> device tree consumers to request multimedia performance levels through the
> standard clock framework.
> 
> Signed-off-by: Echo Zhang <echo.zhang@mediatek.com>
> ---
>  .../clock/mediatek,mt8196-mmdvfs.h            | 74 +++++++++++++++++++

This is not a separate commit.


>  1 file changed, 74 insertions(+)
>  create mode 100644 include/dt-bindings/clock/mediatek,mt8196-mmdvfs.h
> 
> diff --git a/include/dt-bindings/clock/mediatek,mt8196-mmdvfs.h b/include/dt-bindings/clock/mediatek,mt8196-mmdvfs.h
> new file mode 100644
> index 000000000000..428d8a35abdb
> --- /dev/null
> +++ b/include/dt-bindings/clock/mediatek,mt8196-mmdvfs.h
> @@ -0,0 +1,74 @@
> +/* SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause) */
> +/*
> + * Copyright (c) 2024 MediaTek Inc.
> + * Author: MediaTek MMDVFS Team
> + */
> +
> +#ifndef _DT_BINDINGS_MMDVFS_CLK_MT8196_H
> +#define _DT_BINDINGS_MMDVFS_CLK_MT8196_H
> +
> +/*
> + * MMDVFS Clock IDs for MT8196
> + *
> + * These IDs are used by multimedia clients in device tree to reference
> + * MMDVFS virtual clocks for DVFS voting.
> + *
> + * MT8196 uses HWCCF (Hardware Clock Control Fabric) architecture.
> + *
> + * Usage in device tree:
> + *   clocks = <&mmdvfs MMDVFS_USER_VDEC>;
> + *   clock-names = "mmdvfs";
> + */
> +
> +/* Core user clocks used by multimedia hardware drivers */
> +#define MMDVFS_USER_DISP	0	/* user-disp */
> +#define MMDVFS_USER_MDP		1	/* user-mdp */
> +#define MMDVFS_USER_MML		2	/* user-mml */
> +#define MMDVFS_USER_SMI		3	/* user-smi */
> +#define MMDVFS_USER_JPEGDEC	4	/* user-jpegdec */
> +#define MMDVFS_USER_JPEGENC	5	/* user-jpegenc */
> +#define MMDVFS_USER_VENC	6	/* user-venc */
> +#define MMDVFS_USER_VFMT	7	/* user-vfmt */
> +#define MMDVFS_USER_IMG		8	/* user-img */
> +#define MMDVFS_USER_CAM		9	/* user-cam */
> +#define MMDVFS_USER_VCORE	10	/* user-vcore */
> +#define MMDVFS_USER_VMM		11	/* user-vmm */
> +#define MMDVFS_USER_VDISP	12	/* user-vdisp */
> +#define MMDVFS_USER_VDEC	13	/* user-vdec */
> +#define DUMMY_USER_DIS		14	/* dummy-dis */
> +#define DUMMY_USER_MDP		15	/* dummy-mdp */
> +#define DUMMY_USER_MML		16	/* dummy-mml */
> +#define DUMMY_USER_SMI		17	/* dummy-smi */
> +#define DUMMY_USER_VEN		18	/* dummy-ven */
> +#define DUMMY_USER_VDE		19	/* dummy-vde */
> +#define DUMMY_USER_IMG		20	/* dummy-img */
> +#define DUMMY_USER_CAM		21	/* dummy-cam */
> +#define MMDVFS_USER_CAM_SMI	22	/* user-cam-smi */
> +#define MMDVFS_USER_VCP_SMI	23	/* user-vcp-smi */
> +
> +/* AP voter clocks (24-33) - System level control */
> +#define MMDVFS_AP_CAM		24
> +#define MMDVFS_AP_CAMTM		25
> +#define MMDVFS_AP_VDE		26
> +#define MMDVFS_AP_IMG		27
> +#define MMDVFS_AP_IPE		28
> +#define MMDVFS_AP_DIS		29
> +#define MMDVFS_AP_MML		30
> +#define MMDVFS_AP_SMI		31
> +#define MMDVFS_AP_VEN		32
> +#define MMDVFS_AP_MDP		33
> +
> +/* VCP voter clocks (34-43) - VCP firmware control */
> +#define MMDVFS_VCP_CAM		34
> +#define MMDVFS_VCP_CAMTM	35
> +#define MMDVFS_VCP_VDE		36
> +#define MMDVFS_VCP_IMG		37
> +#define MMDVFS_VCP_IPE		38
> +#define MMDVFS_VCP_DIS		39
> +#define MMDVFS_VCP_MML		40
> +#define MMDVFS_VCP_SMI		41
> +#define MMDVFS_VCP_VEN		42
> +#define MMDVFS_VCP_MDP		43
> +
> +#define MMDVFS_USER_NUM		44

Not a binding, drop.

Are you sending us some downstream old driver? Which upstream code was
used as a base/example for this work?

Best regards,
Krzysztof

