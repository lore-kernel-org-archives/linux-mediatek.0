Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E1C6AE8FDB1
	for <linux-mediatek@archiver.kernel.org>; Mon, 29 Dec 2025 11:52:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=yyAejQoJ31yxLblaGyJA0UaK0btri2z1qopeoq8fo/o=; b=As70k9O6vuNPt8Nl3ud8Ox9vCp
	t3xklXGpSk/d/jBagi0sSfo2/6acaJ3vndpa7avYdOGNc82J9X5Rs70XEDpn27srxJo7p8Y7aviW+
	J1a908bY0N9TSagSITph4NWS0dFbOMPZh/YUZndHyzZpLY1ViW9AU8B4MUFM3aKExyYCBl4qpOmCX
	RLKM1HkOyRlaxx0LJPbB+jlRz3ZJcrzsSv7OHsuRT63kVC3BQE7fOd3HLZvvESAFBpksCKThbTygv
	BeKx0brdEQ9OmB1cT+dTRaWTlihh0wtAi+or+kqjM9lFEsWJOS1jiSS7F7Wf/7GVR4kfTSjaylG8V
	cNbp1g7A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vaBny-00000003dbq-2cbK;
	Mon, 29 Dec 2025 11:52:54 +0000
Received: from mail-lf1-x134.google.com ([2a00:1450:4864:20::134])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vaBnv-00000003dal-1H61
	for linux-mediatek@lists.infradead.org;
	Mon, 29 Dec 2025 11:52:53 +0000
Received: by mail-lf1-x134.google.com with SMTP id 2adb3069b0e04-598f8136a24so10057797e87.3
        for <linux-mediatek@lists.infradead.org>; Mon, 29 Dec 2025 03:52:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1767009169; x=1767613969; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=yyAejQoJ31yxLblaGyJA0UaK0btri2z1qopeoq8fo/o=;
        b=V0ce7uAYYx0TGpoOAQ2gXapbP1Qy0EcTF9XOEhxs0JSQy8zs6Cvtju75AzZ9oF1nCY
         MTMTg6vdF+Cukmadnl90Djxtox82Qwxrgkji3keMCMUXaV+1ZHVJfVgNDVboz8LnGnOH
         gAqR2W4rTxwrhstUNEqtu1Fjn0ObL3A/x0Kp1yVNfNIwMIwT68Nn5ypELlWjKxLElRwz
         i7rPTPYz0+b6UmvMTiXUPfqAA1GJ6kpPCkY/qinq0mIxdVi4cp7/wkyPUtaJ3OKVaWkV
         RIFtRS55VNycY08AuW6l0QA01zENaXYO/RdhYCEZfXTdolxqSwTQVbCnuZ/gEUpvfQv5
         O/VQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767009169; x=1767613969;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=yyAejQoJ31yxLblaGyJA0UaK0btri2z1qopeoq8fo/o=;
        b=Tr3tyH9ziGnzJLd+Jc+pDTB/xVIiuJgR2TBqSD2B6ceg/5JWE1ETRM01a+xizkFlMx
         jN1OkpmClygAVrf5sX2lKqaCmYIpt/mOPRDnK1MewqF6c9qc0v7ORlYlggQ3EZtYtla8
         d5siszRbC6awPhMgot1ux8UXgG8itKKFowOoi68i+6BaNnyjIPTruL0VTiSXhOOnm264
         i/mIarqQ6OoK49vhlzTb4OGffG7Bhn3s+cw+e7e39IKfk1nyIAT7KXuUs01UEolvGQ0M
         SOg1dcP7kUYOc2k3s47BiUQqhtPhH0eCkzxfLtKExVH24f43GCjEYny5Jm+lSjgw79TW
         xEtA==
X-Forwarded-Encrypted: i=1; AJvYcCUXzQiMgJK1tvh5xnvwlfup3VLyKNFfHrOGQ65Qd5Rn2BlN7nC2IyKRBNJLdGnUbyH9yL64vXrWnzptQ3bGMA==@lists.infradead.org
X-Gm-Message-State: AOJu0YxeovAnf0kmrgkpOBMqDWPgqpXskRHH+LhyMYqE7LYvYjSdYKGQ
	QJVc+PfWZOVoAFMTOqNtr/u0Grni0e7VC+BCT3+VQH00bJMkYqIFLdl4Muy6L7rosdfLQN6WJ44
	q8tRm+lLdbwVSHDpUmW37ZcSCPglGe0a4u8+3SrEbdg==
X-Gm-Gg: AY/fxX6oYoQOAKKIS617cBsHvpcIo/LVp/DLcZ85iyk76FlKkhzN8NtFlCflEkDZShT
	Uk4Ddi1P45qnk1w/HnipkOFQyC4nr51XwevD0KY6bYPl8Q09OKD55tkzs2qhro0IK/27mxLH2ny
	pbttdJwYlgs5SGFok9TVXTYfT9Qlj5sGMRgkhWIxNHFjeWKPJM3vDbi4KFhjaWt8K5xy61S3dpF
	0EB8QZuBg3DcHIPCCHltspwMV1QJ0jGvq8hE1wKCtJlzDYWvlF9qVAhLhjulUObpwfWU6fU
X-Google-Smtp-Source: AGHT+IGXTnQvaqHS0G2iP51aqu1mvuIV4jhgR6at2cQP1b4/0bJHJAEiAFHVEV4s8SZhwvY+c3cbe65DWXNr4JmMalg=
X-Received: by 2002:a05:6512:3686:b0:59b:4213:7587 with SMTP id
 2adb3069b0e04-59b42137644mr469217e87.27.1767009168978; Mon, 29 Dec 2025
 03:52:48 -0800 (PST)
MIME-Version: 1.0
References: <20251220-mt8196-shader-present-v2-0-45b1ff1dfab0@collabora.com>
In-Reply-To: <20251220-mt8196-shader-present-v2-0-45b1ff1dfab0@collabora.com>
From: Ulf Hansson <ulf.hansson@linaro.org>
Date: Mon, 29 Dec 2025 12:52:13 +0100
X-Gm-Features: AQt7F2qiYKGEucbLF3l0nxkbcDv5up47FHRBhmipPDgxy8BIo3kAL2HBIUAOYlA
Message-ID: <CAPDyKFqkPg5rWYk7cwDywRn_pexQhd2V3R63atjruJnSpYxfZQ@mail.gmail.com>
Subject: Re: [PATCH v2 0/4] Make MT8196 get its Mali GPU shader_present from nvmem
To: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
Cc: Boris Brezillon <boris.brezillon@collabora.com>, Steven Price <steven.price@arm.com>, 
	Liviu Dudau <liviu.dudau@arm.com>, Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
	Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, Chen-Yu Tsai <wenst@chromium.org>, 
	Chia-I Wu <olvaffe@gmail.com>, kernel@collabora.com, dri-devel@lists.freedesktop.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
	linux-pm@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251229_035251_400709_54CF40D0 
X-CRM114-Status: GOOD (  28.20  )
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

On Sat, 20 Dec 2025 at 19:50, Nicolas Frattaroli
<nicolas.frattaroli@collabora.com> wrote:
>
> The MediaTek MT8196 SoC's Mali SHADER_PRESENT register does not list
> only functional shader cores, but also those that are fused off to
> improve yield.
>
> The SHADER_PRESENT bitmask with the one fused off core omitted is to be
> found in an efuse. However, the efuse address is considered
> confidential, and is not public knowledge.
>
> The MT8196 GPUEB MCU, which does the power management for the Mali GPU
> on this SoC, knows and reads the efuse however, and exposes it in the
> shared memory intended to communicate state to the application
> processor. Reading the bitmask from this shared memory area is the
> vendor's intended solution.
>
> This series models this in the binding and implements it in the
> corresponding Linux drivers:
> - the mali-valhall-csf binding gets an nvmem-cells/nvmem-cell-names
>   property to declare that shader-present is in a different castle
> - the mt8196-gpufreq binding requires nodes to expose the shader-present
>   cell
> - panthor checks for the presence of the shader-present cell and uses it
>   as the shader-present value if it's found, instead of the Mali GPU
>   register contents
> - mtk-mfg-pmdomain becomes an nvmem provider and will happily serve
>   queries for the shader-present cell
>
> While it would be preferable if we could read the efuse directly, it's
> not possible as things stand, and insisting on it will just keep this
> hardware from working in mainline. Running a GPU workload with a
> SHADER_PRESENT bitmask that includes a faulty core results in corrupt
> GPU rendering output.
>
> Modelling the mt8196-gpufreq device as a nvmem-cell provider however is
> not lying about the hardware's capabilities, as it truly does provide
> access to the nvmem-cell, even if it acts as a proxy.
>
> From a bindings and panthor perspective, this is also generic enough to
> where hypothetical other vendors doing the same thing (even with direct
> efuse access) can rely on the same cell name and implementation.
>
> Signed-off-by: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>

I have applied the pmdomain changes in patch2 and patch 4 for next, thanks!

I assume the gpu changes will be funneled via another tree, but let me
know if there is a reason to keep these changes together.

Kind regards
Uffe


> ---
> Changes in v2:
> - panthor: move to nvmem_cell_read_variable_le_u64
> - mtk-mfg-pmdomain: put of_node in error path
> - mtk-mfg-pmdomain: remove leftover stray of_node_put on NULL
> - Link to v1: https://lore.kernel.org/r/20251217-mt8196-shader-present-v1-0-f6f8f3aa1e93@collabora.com
>
> ---
> Nicolas Frattaroli (4):
>       dt-bindings: gpu: mali-valhall-csf: Add shader-present nvmem cell
>       dt-bindings: power: mt8196-gpufreq: Describe nvmem provider ability
>       drm/panthor: Implement reading shader_present from nvmem
>       pmdomain: mediatek: mtk-mfg: Expose shader_present as nvmem cell
>
>  .../bindings/gpu/arm,mali-valhall-csf.yaml         | 14 +++++
>  .../bindings/power/mediatek,mt8196-gpufreq.yaml    | 13 +++++
>  drivers/gpu/drm/panthor/panthor_hw.c               | 36 ++++++++++---
>  drivers/pmdomain/mediatek/mtk-mfg-pmdomain.c       | 59 ++++++++++++++++++++++
>  4 files changed, 116 insertions(+), 6 deletions(-)
> ---
> base-commit: 638148c6ffa31d2e4958d51708ff3675221e2da7
> change-id: 20251217-mt8196-shader-present-e2dc3f97fc74
>
> Best regards,
> --
> Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
>

