Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5ED78D6395B
	for <linux-mediatek@archiver.kernel.org>; Wed, 20 Nov 2024 14:30:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Subject:Message-Id:
	References:In-Reply-To:To:Cc:From:MIME-Version:Content-Transfer-Encoding:
	Content-Type:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Fp03UXlWUp80zh5X5NfC9E8RX3265tg4hBXR/7XNbhM=; b=mnGHet7m9EwkiwLd1RtZJlR6Kf
	neoPtqSvVDBMFavFy/G4aP3arzX9hV3IuIOpxNYU9dZgzlqsvA7uqy8gga/FJ8SzErt5T+5NtzLCh
	lqYMbzpeGJeBeeZkO0rg/tEz/slIgqejHNlSFDEWKiSRvIEETX90GWJS2rxt1nOu26DmVqt54XTBR
	K5/EKuJ6wE3PIkeniIWNuuLBdXwv207YeqONTJh3JvbpJkUmh7hZnIC5+C6cTlKrwyQ1xYxt56Wm6
	Va3dXHtCnDzIpmkZHy+jwgfQq0E+5IaATZXYWcYJ8vQ9QNwgQAk4zKkXDJfYPjg3uaArjrYIvd8/7
	VDQMq4sA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tDljF-0000000FYUf-1b2J;
	Wed, 20 Nov 2024 14:30:49 +0000
Received: from nyc.source.kernel.org ([147.75.193.91])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tDliI-0000000FYKP-17sW;
	Wed, 20 Nov 2024 14:29:51 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id C0261A43123;
	Wed, 20 Nov 2024 14:27:55 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A82D1C4CECD;
	Wed, 20 Nov 2024 14:29:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1732112988;
	bh=E3SCFt2aP8soC2dbkMLFMLoGhCfGpNlFOSTRpOtTPrE=;
	h=Date:From:Cc:To:In-Reply-To:References:Subject:From;
	b=Y2v+6I6SsDvnrNk8t/oeMHqMxN6BB6bya1x4af5bacX9K1VRoCuOCrdbxeXywPhlj
	 +Kfun/G8dCd7C/UXNWavt9g7BWaJOCX0adhXbd0PV3UedjjlP2uNfAyBtPxlWqn33i
	 zdw8J+j2mPeiq7V2dcdk2t+upnzSN7JYYnXgAokVSOLikqsTjbczWCwjqXW8NH6Iag
	 wP9TDlAU+NNk+G4jaOQfXeVEFFaCMhGi7w0KRKbQtHP0PI5VT1k46CvVZFdpmXogLB
	 1PaQbAGdOC4DWu714UMmgdt+4zW48n+bZ1lKHAoe8a4AdIulorZ4Z/GbxXSbCg/VmR
	 TnmKzPb3FSaQQ==
Date: Wed, 20 Nov 2024 08:29:47 -0600
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
From: "Rob Herring (Arm)" <robh@kernel.org>
Cc: tzimmermann@suse.de, conor+dt@kernel.org, matthias.bgg@gmail.com, 
 airlied@gmail.com, simona@ffwll.ch, linux-mediatek@lists.infradead.org, 
 p.zabel@pengutronix.de, mripard@kernel.org, chunkuang.hu@kernel.org, 
 ck.hu@mediatek.com, linux-arm-kernel@lists.infradead.org, 
 kernel@collabora.com, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, krzk+dt@kernel.org, 
 maarten.lankhorst@linux.intel.com, dri-devel@lists.freedesktop.org
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <20241120124512.134278-3-angelogioacchino.delregno@collabora.com>
References: <20241120124512.134278-1-angelogioacchino.delregno@collabora.com>
 <20241120124512.134278-3-angelogioacchino.delregno@collabora.com>
Message-Id: <173211298701.771700.9734039519570659117.robh@kernel.org>
Subject: Re: [PATCH v1 2/7] dt-bindings: display: mediatek: Add binding for
 MT8195 HDMI-TX v2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241120_062950_434789_5681D2D9 
X-CRM114-Status: GOOD (  13.31  )
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


On Wed, 20 Nov 2024 13:45:07 +0100, AngeloGioacchino Del Regno wrote:
> Add a binding for the HDMI TX v2 Encoder found in MediaTek MT8195
> and MT8188 SoCs.
> 
> This fully supports the HDMI Specification 2.0b, hence it provides
> support for 3D-HDMI, Polarity inversion, up to 16 bits Deep Color,
> color spaces including RGB444, YCBCR420/422/444 (ITU601/ITU709) and
> xvYCC, with output resolutions up to 3840x2160p@60Hz.
> 
> Moreover, it also supports HDCP 1.4 and 2.3, Variable Refresh Rate
> (VRR) and Consumer Electronics Control (CEC).
> 
> This IP also includes support for HDMI Audio, including IEC60958
> and IEC61937 SPDIF, 8-channel PCM, DSD, and other lossless audio
> according to HDMI 2.0.
> 
> Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
> ---
>  .../mediatek/mediatek,mt8195-hdmi.yaml        | 150 ++++++++++++++++++
>  1 file changed, 150 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/display/mediatek/mediatek,mt8195-hdmi.yaml
> 

My bot found errors running 'make dt_binding_check' on your patch:

yamllint warnings/errors:

dtschema/dtc warnings/errors:
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/display/mediatek/mediatek,mt8195-hdmi.example.dtb: hdmi-tx@1c300000: Additional properties are not allowed ('#sound-dai-cells' was unexpected)
	from schema $id: http://devicetree.org/schemas/display/mediatek/mediatek,mt8195-hdmi.yaml#

doc reference errors (make refcheckdocs):

See https://patchwork.ozlabs.org/project/devicetree-bindings/patch/20241120124512.134278-3-angelogioacchino.delregno@collabora.com

The base for the series is generally the latest rc1. A different dependency
should be noted in *this* patch.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit after running the above command yourself. Note
that DT_SCHEMA_FILES can be set to your schema file to speed up checking
your schema. However, it must be unset to test all examples with your schema.


