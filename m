Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 10313D1D89D
	for <linux-mediatek@archiver.kernel.org>; Tue, 15 Oct 2024 18:40:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:References:In-Reply-To:Date:Cc:To:From
	:Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=8ZIAcIQNXFU0HJAbelK5w6AajE5AfFCSDcserEzGKO8=; b=5B6IPiyWB3TJUy0j4+h9EpwBk/
	WIp78USkKm2RX6N95gssKnDaBoi53u+ZOWX45SSjc9dMvlMxVrIJPmwEwOegsTWvofFWZp9nFNJMb
	wgyUqWfNez0yVmL75/UUbqlsjaCt1gGIJlNwrPMvMnpBh7RyyB8jmib5ul/3AfSCALXTigZyQIB/A
	JJIcX4oxi6s/MlDLv12pgrJzntcd9nUknhzqN/OxxuBHGULEkzh15U7sDERi715rBEZvNtZzOqP2U
	aDy5uq+wyFdHkf0lAnEechlxpti2bjYwSa5HaA7ynaFE9DFKFIawkjzHxdTa9HqjBD2UJdzRD0X1A
	6VDrb2MA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t0mT0-00000009FhB-33iv;
	Tue, 15 Oct 2024 18:40:22 +0000
Received: from mail-qv1-xf32.google.com ([2607:f8b0:4864:20::f32])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t0mSx-00000009Fer-0Isc
	for linux-mediatek@lists.infradead.org;
	Tue, 15 Oct 2024 18:40:20 +0000
Received: by mail-qv1-xf32.google.com with SMTP id 6a1803df08f44-6cbe700dcc3so43741916d6.3
        for <linux-mediatek@lists.infradead.org>; Tue, 15 Oct 2024 11:40:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ndufresne-ca.20230601.gappssmtp.com; s=20230601; t=1729017618; x=1729622418; darn=lists.infradead.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=8ZIAcIQNXFU0HJAbelK5w6AajE5AfFCSDcserEzGKO8=;
        b=OoMYByIVyG0Ebnks72kfP2AHmILdVuGnCRvyn7arfZEE0B492vN6NFhZXhE+ZkjMwb
         ZDGOQwhYdKE+c7OMZO+wdyL8vVHQ6AKPjk61SKcxqLyd2Dodrbnu7z2Qh2EUtY1ANdqt
         UA4lXA0yTbBbGEBRyXAohANpDMrbrx4qq/p3C2uHUz1Aj7AzojqhrcgLcPLaGEb23LvT
         LFl0clq7mz3fCJmr5pXLZBRmbTZtQPNx5jksLedI/CsGWLza/0R5Gy9FSHYU7Imb9di2
         vS/bsRBo5T7d5NnnmKHFj01Njj9fcbpDvH2TQ28tBZIEmcF8d8z5naFZQSWXZBApnFcH
         LoCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729017618; x=1729622418;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=8ZIAcIQNXFU0HJAbelK5w6AajE5AfFCSDcserEzGKO8=;
        b=XN/wUkhikePyRYRq+Y4S2MxZR7R3u9Wn6tjSZJigpgxlXwZ5I11BdmODSyaQvWYta4
         ahsucCTGX49gRv1rsWvSb1JPowWKYpwj0O5M/uYyplNXAoSrjoDSNsxICVCULpMHopZq
         vrMBNl9y5b836qxE16CHpfUCX2MFNu7pNmC7hnmkXbqvysp9QS1OxqtSOdIRFRAJW/Vw
         y45M8XcoFvPXajMfDIMzTTIJc68w3jtnHdo5yDtONTsyre7bEycn+ZMeQhPNELYAUEZ5
         58/8A95WTaB7iMAX+5qcG25KJwuT2OTDdNG9Ujt30i4FEkP1gHg3GYboBhMWSCO0J0uj
         J0hQ==
X-Forwarded-Encrypted: i=1; AJvYcCWYuK84/DJ400JTwlDX5/zw9GjHEj64iDogE2bRCsoHDNVu4qdM1OyBleaKVAF9TjbT5kpNtFaOoWkTeEcFHg==@lists.infradead.org
X-Gm-Message-State: AOJu0Yzso8+5QcJp5YItqgYrkx0YEL/5lWkOpg4XKjQWHXcHfD6m0oEo
	E4TjYboOsox6LAnANyBHhblSyHLG8o5+3c5oFem+dApjEYveLQV7f+ZaGxALa3SFXNU9H2yhxLe
	TtXo=
X-Google-Smtp-Source: AGHT+IFusBTYb7gPAxZixD4vre5MF4aNXpzmSWO1sCDmCktW5i/0FD6ZzrAV8Ze8EESk75jqueZHlQ==
X-Received: by 2002:a05:6214:469b:b0:6cb:faee:76da with SMTP id 6a1803df08f44-6cc2b923c6fmr17530536d6.48.1729017618017;
        Tue, 15 Oct 2024 11:40:18 -0700 (PDT)
Received: from nicolas-tpx395.lan ([2606:6d00:15:862e::7a9])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-6cc22959b4fsm9683206d6.84.2024.10.15.11.40.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Oct 2024 11:40:17 -0700 (PDT)
Message-ID: <ef6f582876782339a6abed5e5d114efade10f9ec.camel@ndufresne.ca>
Subject: Re: [PATCH v1 00/10] Add MediaTek ISP7 camera system driver
From: Nicolas Dufresne <nicolas@ndufresne.ca>
To: Shu-hsiang Yang <Shu-hsiang.Yang@mediatek.com>, Mauro Carvalho Chehab
	 <mchehab@kernel.org>, Rob Herring <robh@kernel.org>, Krzysztof Kozlowski
	 <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Matthias Brugger
	 <matthias.bgg@gmail.com>, AngeloGioacchino Del Regno
	 <angelogioacchino.delregno@collabora.com>, Sumit Semwal
	 <sumit.semwal@linaro.org>, Christian Konig <christian.koenig@amd.com>
Cc: linux-media@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-mediatek@lists.infradead.org, dri-devel@lists.freedesktop.org, 
 linaro-mm-sig@lists.linaro.org, 
 Project_Global_Chrome_Upstream_Group@mediatek.com, yaya.chang@mediatek.com,
  teddy.chen@mediatek.com, hidenorik@chromium.org, yunkec@chromium.org, 
 shun-yi.wang@mediatek.com
Date: Tue, 15 Oct 2024 14:40:16 -0400
In-Reply-To: <20241009111551.27052-1-Shu-hsiang.Yang@mediatek.com>
References: <20241009111551.27052-1-Shu-hsiang.Yang@mediatek.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.52.4 (3.52.4-1.fc40) 
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241015_114019_385447_03417B66 
X-CRM114-Status: GOOD (  19.79  )
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

Hi,

Le mercredi 09 octobre 2024 =C3=A0 19:15 +0800, Shu-hsiang Yang a =C3=A9cri=
t=C2=A0:
> Based on linux-next/master, tag: next-20241008
>=20
> The patch set adds the MediaTek ISP7.x camera system hardware driver.
>=20
> This driver sets up ISP hardware, handles interrupts, and initializes
> V4L2 device nodes and functions. Moreover, implement V4L2 standard
> video driver that utilizes media framework APIs. It also connects
> the sensors and ISP, bridging with the seninf interface. Communicate
> with SCP co-processor to compose ISP registers in the firmware.

Thanks for this work. If I read you correctly, this will depends on an scp
firmware update. Its probably early at rev1, but we appreciate if you can c=
ross-
reference your associated linux-firmware submission (or document which MT
flavour of SCP firmware) contains this support already.

For ISP drivers reviewers, we have the experience with SCP that the IPC is =
not
versioned, making it difficult to maintain backward compatibility. Won't ma=
tter
until this is merged, but be aware that unless this SCP IPC design issue ha=
s
been fixed, any change to the -if headers means a modification to the SCP h=
as
been made, and often we have had to ask MTK to revisit the firmware code to
unbreak backward compatibility.

If this specific part of the SCP IPC is versioned, please let us know. I do=
n't
want this to be alarming message, just something we need to collectively be
aware of not to break userspace, which may not update their firmwares in lo=
ck
step with the kernel.

regards,
Nicolas

p.s. for those new to MTK architecture, the SCP firmware provides services =
to
everything multimedia in the platform, including CODECs, color converter an=
d
scalers, etc.

>=20
> These patches include CSI received data from sensors, sensor interface
> bridge, raw/YUV image pre-processing, ISP utility and ISP control parts.
>=20
> Thank you for reviewing these patches.
>=20
> Shu-hsiang Yang (10):
>   dt-bindings: media: mediatek: add camsys device
>   media: platform: mediatek: add seninf controller
>   media: platform: mediatek: add isp_7x seninf unit
>   media: platform: mediatek: add isp_7x cam-raw unit
>   media: platform: mediatek: add isp_7x camsys unit
>   media: platform: mediatek: add isp_7x utility
>   media: platform: mediatek: add isp_7x video ops
>   media: platform: mediatek: add isp_7x state ctrl
>   media: platform: mediatek: add isp_7x build config
>   uapi: linux: add mediatek isp_7x camsys user api
>=20
>  .../media/mediatek/mediatek,cam-raw.yaml      |  169 +
>  .../media/mediatek/mediatek,cam-yuv.yaml      |  148 +
>  .../media/mediatek/mediatek,camisp.yaml       |   71 +
>  .../media/mediatek/mediatek,seninf-core.yaml  |  106 +
>  .../media/mediatek/mediatek,seninf.yaml       |   88 +
>  drivers/media/platform/mediatek/Kconfig       |    1 +
>  drivers/media/platform/mediatek/Makefile      |    2 +
>  drivers/media/platform/mediatek/isp/Kconfig   |   21 +
>  .../platform/mediatek/isp/isp_7x/Makefile     |    7 +
>  .../mediatek/isp/isp_7x/camsys/Makefile       |   16 +
>  .../isp_7x/camsys/kd_imgsensor_define_v4l2.h  |   87 +
>  .../mediatek/isp/isp_7x/camsys/mtk_cam-ctrl.c | 1797 ++++++
>  .../mediatek/isp/isp_7x/camsys/mtk_cam-ctrl.h |  140 +
>  .../isp/isp_7x/camsys/mtk_cam-debug.c         | 1271 ++++
>  .../isp/isp_7x/camsys/mtk_cam-debug.h         |  273 +
>  .../mediatek/isp/isp_7x/camsys/mtk_cam-defs.h |  168 +
>  .../isp/isp_7x/camsys/mtk_cam-dmadbg.h        |  721 +++
>  .../isp/isp_7x/camsys/mtk_cam-feature.c       |   40 +
>  .../isp/isp_7x/camsys/mtk_cam-feature.h       |   26 +
>  .../mediatek/isp/isp_7x/camsys/mtk_cam-fmt.h  |   87 +
>  .../mediatek/isp/isp_7x/camsys/mtk_cam-ipi.h  |  233 +
>  .../isp/isp_7x/camsys/mtk_cam-meta-mt8188.h   | 2436 ++++++++
>  .../isp/isp_7x/camsys/mtk_cam-plat-util.c     |  207 +
>  .../isp/isp_7x/camsys/mtk_cam-plat-util.h     |   16 +
>  .../mediatek/isp/isp_7x/camsys/mtk_cam-pool.c |  393 ++
>  .../mediatek/isp/isp_7x/camsys/mtk_cam-pool.h |   28 +
>  .../mediatek/isp/isp_7x/camsys/mtk_cam-raw.c  | 5359 +++++++++++++++++
>  .../mediatek/isp/isp_7x/camsys/mtk_cam-raw.h  |  325 +
>  .../isp/isp_7x/camsys/mtk_cam-raw_debug.c     |  403 ++
>  .../isp/isp_7x/camsys/mtk_cam-raw_debug.h     |   39 +
>  .../isp/isp_7x/camsys/mtk_cam-regs-mt8188.h   |  382 ++
>  .../isp/isp_7x/camsys/mtk_cam-seninf-def.h    |  193 +
>  .../isp/isp_7x/camsys/mtk_cam-seninf-drv.c    | 1741 ++++++
>  .../isp/isp_7x/camsys/mtk_cam-seninf-drv.h    |   16 +
>  .../isp/isp_7x/camsys/mtk_cam-seninf-hw.h     |  120 +
>  .../isp/isp_7x/camsys/mtk_cam-seninf-if.h     |   28 +
>  .../isp/isp_7x/camsys/mtk_cam-seninf-regs.h   |   40 +
>  .../isp/isp_7x/camsys/mtk_cam-seninf-route.c  |  356 ++
>  .../isp/isp_7x/camsys/mtk_cam-seninf-route.h  |   23 +
>  .../isp/isp_7x/camsys/mtk_cam-seninf.h        |  170 +
>  .../isp/isp_7x/camsys/mtk_cam-timesync.c      |  125 +
>  .../isp/isp_7x/camsys/mtk_cam-timesync.h      |   12 +
>  .../isp/isp_7x/camsys/mtk_cam-ufbc-def.h      |   59 +
>  .../isp/isp_7x/camsys/mtk_cam-video.c         | 1817 ++++++
>  .../isp/isp_7x/camsys/mtk_cam-video.h         |  224 +
>  .../mediatek/isp/isp_7x/camsys/mtk_cam.c      | 4168 +++++++++++++
>  .../mediatek/isp/isp_7x/camsys/mtk_cam.h      |  733 +++
>  .../isp_7x/camsys/mtk_camera-v4l2-controls.h  |   65 +
>  .../isp_7x/camsys/mtk_csi_phy_2_0/Makefile    |    5 +
>  .../mtk_csi_phy_2_0/mtk_cam-seninf-cammux.h   |  911 +++
>  .../mtk_cam-seninf-csi0-cphy.h                |   69 +
>  .../mtk_cam-seninf-csi0-dphy.h                |  139 +
>  .../mtk_cam-seninf-hw_phy_2_0.c               | 2879 +++++++++
>  .../mtk_cam-seninf-mipi-rx-ana-cdphy-csi0a.h  |  257 +
>  .../mtk_cam-seninf-seninf1-csi2.h             |  415 ++
>  .../mtk_cam-seninf-seninf1-mux.h              |  147 +
>  .../mtk_csi_phy_2_0/mtk_cam-seninf-seninf1.h  |   47 +
>  .../mtk_csi_phy_2_0/mtk_cam-seninf-tg1.h      |   49 +
>  .../mtk_csi_phy_2_0/mtk_cam-seninf-top-ctrl.h |   99 +
>  include/uapi/linux/mtkisp_camsys.h            |  227 +
>  60 files changed, 30194 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/media/mediatek/medi=
atek,cam-raw.yaml
>  create mode 100644 Documentation/devicetree/bindings/media/mediatek/medi=
atek,cam-yuv.yaml
>  create mode 100644 Documentation/devicetree/bindings/media/mediatek/medi=
atek,camisp.yaml
>  create mode 100644 Documentation/devicetree/bindings/media/mediatek/medi=
atek,seninf-core.yaml
>  create mode 100644 Documentation/devicetree/bindings/media/mediatek/medi=
atek,seninf.yaml
>  create mode 100644 drivers/media/platform/mediatek/isp/Kconfig
>  create mode 100644 drivers/media/platform/mediatek/isp/isp_7x/Makefile
>  create mode 100644 drivers/media/platform/mediatek/isp/isp_7x/camsys/Mak=
efile
>  create mode 100644 drivers/media/platform/mediatek/isp/isp_7x/camsys/kd_=
imgsensor_define_v4l2.h
>  create mode 100644 drivers/media/platform/mediatek/isp/isp_7x/camsys/mtk=
_cam-ctrl.c
>  create mode 100644 drivers/media/platform/mediatek/isp/isp_7x/camsys/mtk=
_cam-ctrl.h
>  create mode 100644 drivers/media/platform/mediatek/isp/isp_7x/camsys/mtk=
_cam-debug.c
>  create mode 100644 drivers/media/platform/mediatek/isp/isp_7x/camsys/mtk=
_cam-debug.h
>  create mode 100644 drivers/media/platform/mediatek/isp/isp_7x/camsys/mtk=
_cam-defs.h
>  create mode 100644 drivers/media/platform/mediatek/isp/isp_7x/camsys/mtk=
_cam-dmadbg.h
>  create mode 100644 drivers/media/platform/mediatek/isp/isp_7x/camsys/mtk=
_cam-feature.c
>  create mode 100644 drivers/media/platform/mediatek/isp/isp_7x/camsys/mtk=
_cam-feature.h
>  create mode 100644 drivers/media/platform/mediatek/isp/isp_7x/camsys/mtk=
_cam-fmt.h
>  create mode 100644 drivers/media/platform/mediatek/isp/isp_7x/camsys/mtk=
_cam-ipi.h
>  create mode 100644 drivers/media/platform/mediatek/isp/isp_7x/camsys/mtk=
_cam-meta-mt8188.h
>  create mode 100644 drivers/media/platform/mediatek/isp/isp_7x/camsys/mtk=
_cam-plat-util.c
>  create mode 100644 drivers/media/platform/mediatek/isp/isp_7x/camsys/mtk=
_cam-plat-util.h
>  create mode 100644 drivers/media/platform/mediatek/isp/isp_7x/camsys/mtk=
_cam-pool.c
>  create mode 100644 drivers/media/platform/mediatek/isp/isp_7x/camsys/mtk=
_cam-pool.h
>  create mode 100644 drivers/media/platform/mediatek/isp/isp_7x/camsys/mtk=
_cam-raw.c
>  create mode 100644 drivers/media/platform/mediatek/isp/isp_7x/camsys/mtk=
_cam-raw.h
>  create mode 100644 drivers/media/platform/mediatek/isp/isp_7x/camsys/mtk=
_cam-raw_debug.c
>  create mode 100644 drivers/media/platform/mediatek/isp/isp_7x/camsys/mtk=
_cam-raw_debug.h
>  create mode 100644 drivers/media/platform/mediatek/isp/isp_7x/camsys/mtk=
_cam-regs-mt8188.h
>  create mode 100644 drivers/media/platform/mediatek/isp/isp_7x/camsys/mtk=
_cam-seninf-def.h
>  create mode 100644 drivers/media/platform/mediatek/isp/isp_7x/camsys/mtk=
_cam-seninf-drv.c
>  create mode 100644 drivers/media/platform/mediatek/isp/isp_7x/camsys/mtk=
_cam-seninf-drv.h
>  create mode 100644 drivers/media/platform/mediatek/isp/isp_7x/camsys/mtk=
_cam-seninf-hw.h
>  create mode 100644 drivers/media/platform/mediatek/isp/isp_7x/camsys/mtk=
_cam-seninf-if.h
>  create mode 100644 drivers/media/platform/mediatek/isp/isp_7x/camsys/mtk=
_cam-seninf-regs.h
>  create mode 100644 drivers/media/platform/mediatek/isp/isp_7x/camsys/mtk=
_cam-seninf-route.c
>  create mode 100644 drivers/media/platform/mediatek/isp/isp_7x/camsys/mtk=
_cam-seninf-route.h
>  create mode 100644 drivers/media/platform/mediatek/isp/isp_7x/camsys/mtk=
_cam-seninf.h
>  create mode 100644 drivers/media/platform/mediatek/isp/isp_7x/camsys/mtk=
_cam-timesync.c
>  create mode 100644 drivers/media/platform/mediatek/isp/isp_7x/camsys/mtk=
_cam-timesync.h
>  create mode 100644 drivers/media/platform/mediatek/isp/isp_7x/camsys/mtk=
_cam-ufbc-def.h
>  create mode 100644 drivers/media/platform/mediatek/isp/isp_7x/camsys/mtk=
_cam-video.c
>  create mode 100644 drivers/media/platform/mediatek/isp/isp_7x/camsys/mtk=
_cam-video.h
>  create mode 100644 drivers/media/platform/mediatek/isp/isp_7x/camsys/mtk=
_cam.c
>  create mode 100644 drivers/media/platform/mediatek/isp/isp_7x/camsys/mtk=
_cam.h
>  create mode 100644 drivers/media/platform/mediatek/isp/isp_7x/camsys/mtk=
_camera-v4l2-controls.h
>  create mode 100644 drivers/media/platform/mediatek/isp/isp_7x/camsys/mtk=
_csi_phy_2_0/Makefile
>  create mode 100644 drivers/media/platform/mediatek/isp/isp_7x/camsys/mtk=
_csi_phy_2_0/mtk_cam-seninf-cammux.h
>  create mode 100644 drivers/media/platform/mediatek/isp/isp_7x/camsys/mtk=
_csi_phy_2_0/mtk_cam-seninf-csi0-cphy.h
>  create mode 100644 drivers/media/platform/mediatek/isp/isp_7x/camsys/mtk=
_csi_phy_2_0/mtk_cam-seninf-csi0-dphy.h
>  create mode 100644 drivers/media/platform/mediatek/isp/isp_7x/camsys/mtk=
_csi_phy_2_0/mtk_cam-seninf-hw_phy_2_0.c
>  create mode 100644 drivers/media/platform/mediatek/isp/isp_7x/camsys/mtk=
_csi_phy_2_0/mtk_cam-seninf-mipi-rx-ana-cdphy-csi0a.h
>  create mode 100644 drivers/media/platform/mediatek/isp/isp_7x/camsys/mtk=
_csi_phy_2_0/mtk_cam-seninf-seninf1-csi2.h
>  create mode 100644 drivers/media/platform/mediatek/isp/isp_7x/camsys/mtk=
_csi_phy_2_0/mtk_cam-seninf-seninf1-mux.h
>  create mode 100644 drivers/media/platform/mediatek/isp/isp_7x/camsys/mtk=
_csi_phy_2_0/mtk_cam-seninf-seninf1.h
>  create mode 100644 drivers/media/platform/mediatek/isp/isp_7x/camsys/mtk=
_csi_phy_2_0/mtk_cam-seninf-tg1.h
>  create mode 100644 drivers/media/platform/mediatek/isp/isp_7x/camsys/mtk=
_csi_phy_2_0/mtk_cam-seninf-top-ctrl.h
>  create mode 100644 include/uapi/linux/mtkisp_camsys.h
>=20


