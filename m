Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B9772CD1288
	for <linux-mediatek@archiver.kernel.org>; Mon,  1 Apr 2024 17:10:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:To:References:Message-Id:
	Content-Transfer-Encoding:Cc:Date:In-Reply-To:From:Subject:Mime-Version:
	Content-Type:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=cOLKrFXode7RL7ZHvCqUyHCs2EwpfvvlesdpnmleB6M=; b=Fg94EBexaqBtkhVviQfXSerT2u
	aLj6nKPe6D4W4pkaJNO/tEottjuI8cuWKnX+ZfpeZGujcKkCWwhHXlrg1hOBKz+gogfD4tR1mtojM
	dOT74gy745yd48+XPTqjVGmkwRiP0C4NGxvS47DsdkZlo8oZmdpeB9gJ/VkpRFxLQW9MXOVGyl3Wo
	Y7aa7+od0ioPZPTphfVMF1kwREsw1o/D7N6T60Wmk6THhM7zBCeyGREcaOdKUauSnXlh1Y1UKm3zi
	kcggi2boEEpqXFfnVNmuLzpScELxTX1i4zn49ih6iP+CFe6y99vVHX1Uz52hBqREP6f2jK5X+EHzO
	QvvZpTyw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rrLAp-00000008QRn-1q2F;
	Mon, 01 Apr 2024 17:10:19 +0000
Received: from mail-wm1-x32f.google.com ([2a00:1450:4864:20::32f])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rrLAi-00000008QQ3-42FK;
	Mon, 01 Apr 2024 17:10:15 +0000
Received: by mail-wm1-x32f.google.com with SMTP id 5b1f17b1804b1-4156dfa8a75so3315315e9.1;
        Mon, 01 Apr 2024 10:10:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1711991408; x=1712596208; darn=lists.infradead.org;
        h=to:references:message-id:content-transfer-encoding:cc:date
         :in-reply-to:from:subject:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=cOLKrFXode7RL7ZHvCqUyHCs2EwpfvvlesdpnmleB6M=;
        b=YUwCxw9LmsWhYgNFnwvjywdgfCsfsL4zQzVmXKOm3pEYIIf2GXXiqltJnvCOlVWULE
         dou12nhlXn9PdjDz8E/xlr7xt0CtecLevGlSrXpcDla+ll29orHxn63Z+7NI/DqVzZWV
         vxipqvkONUoJnem8N6p7MNN/nd1/46GsQsy86lWG8saamX9285FnDJjrBJ6wCJl5jJi2
         LY7owgOcxt1Y3NVrj4eU4FtGkfYdOiUl8cC/9buQ53h39xdunZgy3XGvhbMta4UR/jvl
         h4uC7Wv492TCrFr90SIciimiOvLxhLfyz9UilRVQWwKA9mDdgWiNVo5mT8Qo3XW3yQjs
         PrQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711991408; x=1712596208;
        h=to:references:message-id:content-transfer-encoding:cc:date
         :in-reply-to:from:subject:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=cOLKrFXode7RL7ZHvCqUyHCs2EwpfvvlesdpnmleB6M=;
        b=pNRVjV3Y7/gCyhJvJ7wjembf7P5urXIcO1/YtXDgFRDKVSW0BB6w65r0hatKzlJeNZ
         MMCzJjZr4iKwseq7ye6k8IkcZKeqpCvTNuKs5nd3J3drkYatJksDzQcHlydprpLCg1BU
         OMFmMeWMoEmN0pUzrZgVZ6q9VZmzcGzEcBll5AjqUTCoVXbggORT5t+3clkG42SoPyWk
         29HtTxQwxcWyzuyPXX89CnOEzcDDHyqpngxTj2R+U2n8ghVktRxwPWk02JFLBSHbm4U2
         0hSo7fttbXrIq9Ysvc6d6+MhyrYPPXw00hNqJwxGb23SlCL7oFZk67qsZvFlphEll69m
         YFJA==
X-Forwarded-Encrypted: i=1; AJvYcCXFgeEtb97h1DzS/Audnp82A5eGAOqVhbwu8gAtGcu0AD2Wex1qpU6hgftdS3JCSjq8yFOKiwd6qjiPROIyIHyd2RlTr1KrwpBidKDM7bJkv7ynl9BkDDc9Mg38g5sRmz/RyYRR8Rv9frMQxxG/DZfWVEMvjjalg0py1zje76rbm40rUN588peUyiSh2TEKA0sQrf19pMeadog=
X-Gm-Message-State: AOJu0YysUdx6aBilR70wDaXRkbbreW5og1RmxrLxA4rkMNkoGKOlf1zL
	FUYScoR50/uSK8dJ9VPeXwlC59FPbGDQGQGi4HNn7ChiY05Xrry5
X-Google-Smtp-Source: AGHT+IFdvWVQ5t5OSPrCcdGuPANNFpwX5kFJrnnSRIfNsMRL2/flh2LngyKi3zlajFubCMdZRc8Qmw==
X-Received: by 2002:a05:600c:1c1d:b0:413:ee55:8bba with SMTP id j29-20020a05600c1c1d00b00413ee558bbamr9516959wms.4.1711991407785;
        Mon, 01 Apr 2024 10:10:07 -0700 (PDT)
Received: from smtpclient.apple ([167.99.200.149])
        by smtp.gmail.com with ESMTPSA id n38-20020a05600c3ba600b00415509b11c3sm11433054wms.22.2024.04.01.10.10.04
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 01 Apr 2024 10:10:07 -0700 (PDT)
Content-Type: text/plain;
	charset=utf-8
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3774.400.31\))
Subject: Re: [PATCH v5 00/10] drm/ci: Add support for GPU and display testing
From: Christian Hewitt <christianshewitt@gmail.com>
In-Reply-To: <20240401061235.192713-1-vignesh.raman@collabora.com>
Date: Mon, 1 Apr 2024 21:09:52 +0400
Cc: dri-devel@lists.freedesktop.org,
 daniels@collabora.com,
 Helen Koike <helen.koike@collabora.com>,
 David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>,
 emma@anholt.net,
 robdclark@gmail.com,
 david.heidelberg@collabora.com,
 guilherme.gallo@collabora.com,
 sergi.blanch.torne@collabora.com,
 hamohammed.sa@gmail.com,
 rodrigosiqueiramelo@gmail.com,
 melissa.srw@gmail.com,
 mairacanal@riseup.net,
 mcanal@igalia.com,
 linux-mediatek@lists.infradead.org,
 linux-amlogic@lists.infradead.org,
 linux-rockchip@lists.infradead.org,
 linux-kernel@vger.kernel.org
Content-Transfer-Encoding: quoted-printable
Message-Id: <43FF2E86-D0C7-4497-8203-E598E80FFA1B@gmail.com>
References: <20240401061235.192713-1-vignesh.raman@collabora.com>
To: Vignesh Raman <vignesh.raman@collabora.com>
X-Mailer: Apple Mail (2.3774.400.31)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240401_101013_125843_AF4E0400 
X-CRM114-Status: GOOD (  24.38  )
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

> On 1 Apr 2024, at 10:12=E2=80=AFam, Vignesh Raman =
<vignesh.raman@collabora.com> wrote:
>=20
> Some ARM SOCs have a separate display controller and GPU, each with
> different drivers. For mediatek mt8173, the GPU driver is powervr,
> and the display driver is mediatek. In the case of mediatek mt8183,
> the GPU driver is panfrost, and the display driver is mediatek.
> With rockchip rk3288/rk3399, the GPU driver is panfrost, while the
> display driver is rockchip. For amlogic meson, the GPU driver is
> panfrost, and the display driver is meson.

I=E2=80=99m not sure if this is describing the contents of a test lab or =
making
a statement on the Amlogic platform; but (being the pedant I am) I=E2=80=99=
ll
point out that Amlogic G12A/SM1 (Mali G31) and G12B (Mali G52) boards
do use panfrost, but the GXBB/GXL/GXM boards (Mali450) use lima.

CH.

> IGT tests run various tests with different xfails and can test both
> GPU devices and KMS/display devices. Currently, in drm-ci for =
MediaTek,
> Rockchip, and Amlogic Meson platforms, only the GPU driver is tested.
> This leads to incomplete coverage since the display is never tested on
> these platforms. This commit series adds support in drm-ci to run =
tests
> for both GPU and display drivers for MediaTek, Rockchip, and Amlogic
> Meson platforms.
>=20
> Uprev mesa and IGT in drm-ci and add amd, v3d, vc4 and vgem specific
> tests to testlist. Add testlists to the MAINTAINERS file and skip
> driver-specific tests.
>=20
> This series also includes patch to add vkms testing to drm-ci.
>=20
> Working pipeline link,
> https://gitlab.freedesktop.org/vigneshraman/linux/-/pipelines/1140647
>=20
> Vignesh Raman (10):
>  drm/ci: arm64.config: Enable CONFIG_DRM_ANALOGIX_ANX7625
>  drm/ci: uprev mesa version
>  drm/ci: uprev IGT and update testlist
>  drm/ci: mediatek: Refactor existing mediatek jobs
>  drm/ci: mediatek: Add job to test panfrost and powervr GPU driver
>  drm/ci: meson: Refactor existing meson jobs
>  drm/ci: meson: Add job to test panfrost GPU driver
>  drm/ci: rockchip: Refactor existing rockchip jobs
>  drm/ci: rockchip: Add job to test panfrost GPU driver
>  drm/ci: add tests on vkms
>=20
> MAINTAINERS                                   |  11 +
> drivers/gpu/drm/ci/arm64.config               |   1 +
> drivers/gpu/drm/ci/build.sh                   |   2 +-
> drivers/gpu/drm/ci/container.yml              |   6 +-
> drivers/gpu/drm/ci/gitlab-ci.yml              |  18 +-
> drivers/gpu/drm/ci/igt_runner.sh              |  16 +-
> drivers/gpu/drm/ci/image-tags.yml             |   5 +-
> drivers/gpu/drm/ci/test.yml                   | 138 ++++++--
> drivers/gpu/drm/ci/testlist.txt               | 321 ++++++++++++++++++
> drivers/gpu/drm/ci/x86_64.config              |   1 +
> .../gpu/drm/ci/xfails/amdgpu-stoney-fails.txt |  25 +-
> .../drm/ci/xfails/amdgpu-stoney-flakes.txt    |  10 +-
> .../gpu/drm/ci/xfails/amdgpu-stoney-skips.txt |  23 +-
> drivers/gpu/drm/ci/xfails/i915-amly-skips.txt |   9 +-
> drivers/gpu/drm/ci/xfails/i915-apl-skips.txt  |   9 +-
> drivers/gpu/drm/ci/xfails/i915-cml-skips.txt  |   7 +
> drivers/gpu/drm/ci/xfails/i915-glk-skips.txt  |   9 +-
> drivers/gpu/drm/ci/xfails/i915-kbl-skips.txt  |   9 +-
> drivers/gpu/drm/ci/xfails/i915-tgl-skips.txt  |   9 +-
> drivers/gpu/drm/ci/xfails/i915-whl-skips.txt  |   9 +-
> .../drm/ci/xfails/mediatek-mt8173-fails.txt   |  15 -
> .../drm/ci/xfails/mediatek-mt8173-flakes.txt  |  13 +
> .../drm/ci/xfails/mediatek-mt8173-skips.txt   |   6 +
> .../drm/ci/xfails/mediatek-mt8183-fails.txt   |  21 +-
> .../drm/ci/xfails/mediatek-mt8183-flakes.txt  |   8 +
> .../drm/ci/xfails/mediatek-mt8183-skips.txt   |   6 +
> .../gpu/drm/ci/xfails/meson-g12b-fails.txt    |   5 -
> .../gpu/drm/ci/xfails/meson-g12b-skips.txt    |   6 +
> .../gpu/drm/ci/xfails/msm-apq8016-skips.txt   |   5 +
> .../gpu/drm/ci/xfails/msm-apq8096-skips.txt   |   8 +-
> .../msm-sc7180-trogdor-kingoftown-skips.txt   |   6 +
> ...sm-sc7180-trogdor-lazor-limozeen-skips.txt |   6 +
> .../gpu/drm/ci/xfails/msm-sdm845-skips.txt    |   6 +
> .../gpu/drm/ci/xfails/panfrost-g12b-fails.txt |   1 +
> .../gpu/drm/ci/xfails/panfrost-g12b-skips.txt |   8 +
> .../drm/ci/xfails/panfrost-mt8183-fails.txt   |   1 +
> .../drm/ci/xfails/panfrost-mt8183-skips.txt   |   8 +
> .../drm/ci/xfails/panfrost-rk3288-fails.txt   |   1 +
> .../drm/ci/xfails/panfrost-rk3288-skips.txt   |   8 +
> .../drm/ci/xfails/panfrost-rk3399-fails.txt   |   1 +
> .../drm/ci/xfails/panfrost-rk3399-skips.txt   |   8 +
> .../drm/ci/xfails/rockchip-rk3288-fails.txt   |  50 +--
> .../drm/ci/xfails/rockchip-rk3288-flakes.txt  |  21 ++
> .../drm/ci/xfails/rockchip-rk3288-skips.txt   |  15 +-
> .../drm/ci/xfails/rockchip-rk3399-fails.txt   |  38 +--
> .../drm/ci/xfails/rockchip-rk3399-flakes.txt  |  28 +-
> .../drm/ci/xfails/rockchip-rk3399-skips.txt   |  11 +
> .../drm/ci/xfails/virtio_gpu-none-fails.txt   |   1 -
> .../drm/ci/xfails/virtio_gpu-none-skips.txt   |   9 +-
> drivers/gpu/drm/ci/xfails/vkms-none-fails.txt |  33 ++
> .../gpu/drm/ci/xfails/vkms-none-flakes.txt    |  20 ++
> drivers/gpu/drm/ci/xfails/vkms-none-skips.txt |  23 ++
> 52 files changed, 890 insertions(+), 144 deletions(-)
> create mode 100644 =
drivers/gpu/drm/ci/xfails/mediatek-mt8173-flakes.txt
> create mode 100644 drivers/gpu/drm/ci/xfails/mediatek-mt8173-skips.txt
> create mode 100644 =
drivers/gpu/drm/ci/xfails/mediatek-mt8183-flakes.txt
> create mode 100644 drivers/gpu/drm/ci/xfails/mediatek-mt8183-skips.txt
> create mode 100644 drivers/gpu/drm/ci/xfails/meson-g12b-skips.txt
> create mode 100644 drivers/gpu/drm/ci/xfails/msm-apq8016-skips.txt
> create mode 100644 drivers/gpu/drm/ci/xfails/panfrost-g12b-fails.txt
> create mode 100644 drivers/gpu/drm/ci/xfails/panfrost-g12b-skips.txt
> create mode 100644 drivers/gpu/drm/ci/xfails/panfrost-mt8183-fails.txt
> create mode 100644 drivers/gpu/drm/ci/xfails/panfrost-mt8183-skips.txt
> create mode 100644 drivers/gpu/drm/ci/xfails/panfrost-rk3288-fails.txt
> create mode 100644 drivers/gpu/drm/ci/xfails/panfrost-rk3288-skips.txt
> create mode 100644 drivers/gpu/drm/ci/xfails/panfrost-rk3399-fails.txt
> create mode 100644 drivers/gpu/drm/ci/xfails/panfrost-rk3399-skips.txt
> create mode 100644 =
drivers/gpu/drm/ci/xfails/rockchip-rk3288-flakes.txt
> create mode 100644 drivers/gpu/drm/ci/xfails/vkms-none-fails.txt
> create mode 100644 drivers/gpu/drm/ci/xfails/vkms-none-flakes.txt
> create mode 100644 drivers/gpu/drm/ci/xfails/vkms-none-skips.txt
>=20
> --=20
> 2.40.1
>=20
>=20
> _______________________________________________
> linux-amlogic mailing list
> linux-amlogic@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-amlogic


