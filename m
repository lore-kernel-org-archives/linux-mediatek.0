Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 57BD0C47077
	for <linux-mediatek@archiver.kernel.org>; Thu, 11 Jan 2024 08:08:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=vSO4rsqGTytf6/0Prk7ujy7Nghy7DZNOQ0GfzFRDvqk=; b=Ua9yAD+ZAc0bYvsCrmvASl2k1N
	GimOPoYkLmnCfVprwuGhnt56plj229MO88r0geOX9tt2cl8jo5zjdqb6atk6Pxu/1pJNfwEEcGosY
	MGAY1Aq1d9D8JjXk9KqHVLNQ//Wa2yxBkWKgFMbBkaaExbNGsdcepGI57D3UyaE7U/R8nr4QggPAP
	k65HRk/RrtkMBsV7guLmmhOacx2saLOWZyU7b1Wz6ZbWM8L4BfoHcHQr3QN1lO4vOXHZfyTzqxzFz
	ZErFnTA3EJ/Ms2ZTKFrkbEBIHuHVoBpNcDbX0K3sjAROKBJCa++XHJquHYMTh30YzMdTcTjtApKSI
	u37/mKVA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rNq7D-00GQP0-0s;
	Thu, 11 Jan 2024 08:08:39 +0000
Received: from perceval.ideasonboard.com ([213.167.242.64])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rNq79-00GQNh-2Q;
	Thu, 11 Jan 2024 08:08:37 +0000
Received: from pendragon.ideasonboard.com (89-27-53-110.bb.dnainternet.fi [89.27.53.110])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id C211AC85;
	Thu, 11 Jan 2024 09:07:24 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1704960445;
	bh=qmei24w/G2Gd38IxUj6H/ANIvTM67mnsZB7V0/RAtLI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=MkyY8POSVX7UaEBiHxkzQk/CvAeTddOKPInEUe2lqAC8sd8iiVp8EOWmbT4xVvwCs
	 SUYCwgl6oQwd37DkkC+LE+zrlPX+IqygjAq3WeNY+PM+neqWudwbyBDpAf/NXP2FIW
	 EJykbF8O+CempNUHb0/63gw0Bb3QMjQqUNhQst/s=
Date: Thu, 11 Jan 2024 10:08:37 +0200
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Julien Stephan <jstephan@baylibre.com>
Cc: Andy Hsieh <andy.hsieh@mediatek.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Conor Dooley <conor+dt@kernel.org>, devicetree@vger.kernel.org,
	Florian Sylvestre <fsylvestre@baylibre.com>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	linux-mediatek@lists.infradead.org, linux-media@vger.kernel.org,
	Louis Kuo <louis.kuo@mediatek.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Paul Elder <paul.elder@ideasonboard.com>,
	Phi-bang Nguyen <pnguyen@baylibre.com>,
	Rob Herring <robh+dt@kernel.org>
Subject: Re: [PATCH v4 0/5] Add Mediatek ISP3.0
Message-ID: <20240111080837.GA30988@pendragon.ideasonboard.com>
References: <20240110141443.364655-1-jstephan@baylibre.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20240110141443.364655-1-jstephan@baylibre.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240111_000835_955609_F6D6250B 
X-CRM114-Status: GOOD (  27.78  )
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

Hi Julien,

Thank you for the patches.

On Wed, Jan 10, 2024 at 03:14:37PM +0100, Julien Stephan wrote:
> This series adds the support of the Mediatek ISP3.0 found on some
> Mediatek SoCs such as the mt8365. The driver is divided into 2 parts:
> 
> * SENINF: the sensor interface
> * CAMSV: this driver provides a path to bypass the SoC ISP so that image
>   data coming from the SENINF can go directly into memory without any
>   image processing. This allows the use of an external ISP or camera
>   sensor directly.

I'm afraid this doesn't compile based on the latest media tree's master
branch, scheduled for v6.8-rc1. I've pushed the following fixes to [1]:

0d2e75fb8909 media: mediatek: isp_30: Update to new subdev state API
05dc498f151a media: mediatek: isp_30: Update to new subdev state API

You can squash those in v5 when you will rebase on v6.8-rc1.

[1] https://git.kernel.org/pub/scm/linux/kernel/git/pinchartl/linux.git/log/?h=mtk/v6.8/pumpkin/camera

> The SENINF driver is based on previous work done by Louis Kuo available
> as an RFC here: https://lore.kernel.org/all/20200708104023.3225-1-louis.kuo@mediatek.com/
> 
> This series depends on the following series for the phy [1]
> 
> Changes in v4:
> - fix suspend/resume deadlock
> - fix various locking issues reported by Laurent Pinchart on v3
> - run LOCKDEP
> - add missing include reported by kernel-test-robot for non mediatek arch and COMPILE_TEST=y
> - use atomic poll inside mtk_camsv30_setup
> - drop second lane support as it was not used 
> - remove useless members in structs
> - fix media entity initialization
> - initialize correct pad for camsv video device
> - add isp support in mt8365.dtsi
> - rebase on 6.7
> 
> Changes in v3:
> - fix a lot of formatting issues/coding style issues found in camsv/seninf reported by Angelo on v2
> - fix camsv/seninf binding file error reported by Rob
> 
> Changes in v2:
> - renamed clock `cam_seninf` to `camsys`
> - renamed clock `top_mux_seninf` to `top_mux`
> - moved phy properties from port nodes to top level
> - remove patternProperties
> - specify power management dependency in the cover letter description to fix
>   missing include in dt-binding example
> - change '$ref' properties on some endpoint nodes from
>   '$ref: video-interfaces.yaml#' to '$ref: /schemas/graph.yaml#/$defs/endpoint-base'
>  where applicable
> 
> Best
> Julien Stephan
> 
> [1] : https://lore.kernel.org/all/20230620121928.1231745-1-jstephan@baylibre.com/
> 
> 
> 
> Louis Kuo (2):
>   dt-bindings: media: add mediatek ISP3.0 sensor interface
>   media: platform: mediatek: isp_30: add mediatek ISP3.0 sensor
>     interface
> 
> Phi-bang Nguyen (2):
>   dt-bindings: media: add mediatek ISP3.0 camsv
>   media: platform: mediatek: isp_30: add mediatek ISP3.0 camsv
> 
>  .../bindings/media/mediatek,mt8365-camsv.yaml |  109 ++
>  .../media/mediatek,mt8365-seninf.yaml         |  259 +++
>  MAINTAINERS                                   |   10 +
>  arch/arm64/boot/dts/mediatek/mt8365.dtsi      |  128 ++
>  drivers/media/platform/mediatek/Kconfig       |    1 +
>  drivers/media/platform/mediatek/Makefile      |    1 +
>  drivers/media/platform/mediatek/isp/Kconfig   |    2 +
>  drivers/media/platform/mediatek/isp/Makefile  |    3 +
>  .../platform/mediatek/isp/isp_30/Kconfig      |   35 +
>  .../platform/mediatek/isp/isp_30/Makefile     |    4 +
>  .../mediatek/isp/isp_30/camsv/Makefile        |    7 +
>  .../mediatek/isp/isp_30/camsv/mtk_camsv.c     |  328 ++++
>  .../mediatek/isp/isp_30/camsv/mtk_camsv.h     |  199 +++
>  .../isp/isp_30/camsv/mtk_camsv30_hw.c         |  427 +++++
>  .../isp/isp_30/camsv/mtk_camsv30_regs.h       |   60 +
>  .../isp/isp_30/camsv/mtk_camsv_video.c        |  774 +++++++++
>  .../mediatek/isp/isp_30/seninf/Makefile       |    5 +
>  .../mediatek/isp/isp_30/seninf/mtk_seninf.c   | 1488 +++++++++++++++++
>  .../isp/isp_30/seninf/mtk_seninf_reg.h        |  112 ++
>  19 files changed, 3952 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/media/mediatek,mt8365-camsv.yaml
>  create mode 100644 Documentation/devicetree/bindings/media/mediatek,mt8365-seninf.yaml
>  create mode 100644 drivers/media/platform/mediatek/isp/Kconfig
>  create mode 100644 drivers/media/platform/mediatek/isp/Makefile
>  create mode 100644 drivers/media/platform/mediatek/isp/isp_30/Kconfig
>  create mode 100644 drivers/media/platform/mediatek/isp/isp_30/Makefile
>  create mode 100644 drivers/media/platform/mediatek/isp/isp_30/camsv/Makefile
>  create mode 100644 drivers/media/platform/mediatek/isp/isp_30/camsv/mtk_camsv.c
>  create mode 100644 drivers/media/platform/mediatek/isp/isp_30/camsv/mtk_camsv.h
>  create mode 100644 drivers/media/platform/mediatek/isp/isp_30/camsv/mtk_camsv30_hw.c
>  create mode 100644 drivers/media/platform/mediatek/isp/isp_30/camsv/mtk_camsv30_regs.h
>  create mode 100644 drivers/media/platform/mediatek/isp/isp_30/camsv/mtk_camsv_video.c
>  create mode 100644 drivers/media/platform/mediatek/isp/isp_30/seninf/Makefile
>  create mode 100644 drivers/media/platform/mediatek/isp/isp_30/seninf/mtk_seninf.c
>  create mode 100644 drivers/media/platform/mediatek/isp/isp_30/seninf/mtk_seninf_reg.h

-- 
Regards,

Laurent Pinchart

