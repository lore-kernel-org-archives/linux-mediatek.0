Return-Path: <SRS0=Tto8=C2=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,NICE_REPLY_A,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 04611C43461
	for <linux-mediatek@archiver.kernel.org>; Thu, 17 Sep 2020 07:40:51 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 862992083B
	for <linux-mediatek@archiver.kernel.org>; Thu, 17 Sep 2020 07:40:50 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="hJ8DWk1D"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 862992083B
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=suse.de
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Type:Cc:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:Date:Message-ID:From:References:To:Subject:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=+lWSCaNrx8riA75OsXzSdHjq3/sGhxUrdCVqKkmwkOA=; b=hJ8DWk1DX7f26nGsdz+kJxOvb
	WwYi5RjkAlonTMYhfj6vHQOPia7pBC+6swNto3mAJZzV+6q7KBavBEVxyU60s3TPjJ+97d7VYg4iI
	LD0n3folRNLK6R2uYIMxgJa5AUMGDv8huW33c4CK9RO+DtVhpZQEaKR+4rvb+3tjTB4oY8+BncaSv
	pBtIwF0VyE3PVOBOwM7go7qRxGyRkaA+sQClIq69pXhzeCBsRiEIPMqvYdFf41CYGu2WMy9XLhE2o
	0NlWc3cSTk1VgbYezOMInPXQu9DsHQgoelvmdGzkYszsyziHeXRWd/gfYVfiLKHalcBH4ORiFyAyE
	/7kfqBq0A==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kIoX0-0007CH-U7; Thu, 17 Sep 2020 07:40:38 +0000
Received: from mx2.suse.de ([195.135.220.15])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kIoWx-0007B4-N9; Thu, 17 Sep 2020 07:40:36 +0000
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id C72DEAB5C;
 Thu, 17 Sep 2020 07:40:49 +0000 (UTC)
Subject: Re: [PATCH v2 01/21] drm/amdgpu: Introduce GEM object functions
To: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>,
 alexander.deucher@amd.com, airlied@linux.ie, daniel@ffwll.ch,
 linux@armlinux.org.uk, maarten.lankhorst@linux.intel.com,
 mripard@kernel.org, l.stach@pengutronix.de, christian.gmeiner@gmail.com,
 inki.dae@samsung.com, jy0922.shim@samsung.com, sw0312.kim@samsung.com,
 kyungmin.park@samsung.com, kgene@kernel.org, krzk@kernel.org,
 patrik.r.jakobsson@gmail.com, jani.nikula@linux.intel.com,
 joonas.lahtinen@linux.intel.com, rodrigo.vivi@intel.com,
 chunkuang.hu@kernel.org, p.zabel@pengutronix.de, matthias.bgg@gmail.com,
 robdclark@gmail.com, sean@poorly.run, bskeggs@redhat.com,
 tomi.valkeinen@ti.com, eric@anholt.net, hjc@rock-chips.com, heiko@sntech.de,
 thierry.reding@gmail.com, jonathanh@nvidia.com,
 rodrigosiqueiramelo@gmail.com, hamohammed.sa@gmail.com,
 oleksandr_andrushchenko@epam.com, hyun.kwon@xilinx.com,
 laurent.pinchart@ideasonboard.com, michal.simek@xilinx.com,
 sumit.semwal@linaro.org, evan.quan@amd.com, Hawking.Zhang@amd.com,
 tianci.yin@amd.com, marek.olsak@amd.com, hdegoede@redhat.com,
 andrey.grodzovsky@amd.com, Felix.Kuehling@amd.com, xinhui.pan@amd.com,
 aaron.liu@amd.com, nirmoy.das@amd.com, chris@chris-wilson.co.uk,
 matthew.auld@intel.com, tvrtko.ursulin@linux.intel.com,
 andi.shyti@intel.com, sam@ravnborg.org, miaoqinglang@huawei.com,
 emil.velikov@collabora.com
References: <20200915145958.19993-1-tzimmermann@suse.de>
 <20200915145958.19993-2-tzimmermann@suse.de>
 <835ba167-3576-1af6-5421-552075588796@amd.com>
From: Thomas Zimmermann <tzimmermann@suse.de>
Message-ID: <41eebda8-bf90-7b5c-8af2-e96b8fd0cea2@suse.de>
Date: Thu, 17 Sep 2020 09:40:28 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.0
MIME-Version: 1.0
In-Reply-To: <835ba167-3576-1af6-5421-552075588796@amd.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200917_034035_985057_51A1D1DB 
X-CRM114-Status: GOOD (  25.58  )
X-BeenThere: linux-mediatek@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-mediatek.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mediatek>, 
 <mailto:linux-mediatek-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mediatek/>
List-Post: <mailto:linux-mediatek@lists.infradead.org>
List-Help: <mailto:linux-mediatek-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mediatek>, 
 <mailto:linux-mediatek-request@lists.infradead.org?subject=subscribe>
Cc: linux-samsung-soc@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 intel-gfx@lists.freedesktop.org, etnaviv@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, linux-rockchip@lists.infradead.org,
 linux-mediatek@lists.infradead.org, amd-gfx@lists.freedesktop.org,
 nouveau@lists.freedesktop.org, linux-tegra@vger.kernel.org,
 xen-devel@lists.xenproject.org, freedreno@lists.freedesktop.org,
 linux-arm-kernel@lists.infradead.org
Content-Type: multipart/mixed; boundary="===============1003904228670354030=="
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--===============1003904228670354030==
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="ZR47F2it7RqvbT2snhj2Q3AXTit7yD8k0"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--ZR47F2it7RqvbT2snhj2Q3AXTit7yD8k0
Content-Type: multipart/mixed; boundary="mXx6VnsL56rJiBRNYFJpJY6lkuO91DGub";
 protected-headers="v1"
From: Thomas Zimmermann <tzimmermann@suse.de>
To: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>,
 alexander.deucher@amd.com, airlied@linux.ie, daniel@ffwll.ch,
 linux@armlinux.org.uk, maarten.lankhorst@linux.intel.com,
 mripard@kernel.org, l.stach@pengutronix.de, christian.gmeiner@gmail.com,
 inki.dae@samsung.com, jy0922.shim@samsung.com, sw0312.kim@samsung.com,
 kyungmin.park@samsung.com, kgene@kernel.org, krzk@kernel.org,
 patrik.r.jakobsson@gmail.com, jani.nikula@linux.intel.com,
 joonas.lahtinen@linux.intel.com, rodrigo.vivi@intel.com,
 chunkuang.hu@kernel.org, p.zabel@pengutronix.de, matthias.bgg@gmail.com,
 robdclark@gmail.com, sean@poorly.run, bskeggs@redhat.com,
 tomi.valkeinen@ti.com, eric@anholt.net, hjc@rock-chips.com, heiko@sntech.de,
 thierry.reding@gmail.com, jonathanh@nvidia.com,
 rodrigosiqueiramelo@gmail.com, hamohammed.sa@gmail.com,
 oleksandr_andrushchenko@epam.com, hyun.kwon@xilinx.com,
 laurent.pinchart@ideasonboard.com, michal.simek@xilinx.com,
 sumit.semwal@linaro.org, evan.quan@amd.com, Hawking.Zhang@amd.com,
 tianci.yin@amd.com, marek.olsak@amd.com, hdegoede@redhat.com,
 andrey.grodzovsky@amd.com, Felix.Kuehling@amd.com, xinhui.pan@amd.com,
 aaron.liu@amd.com, nirmoy.das@amd.com, chris@chris-wilson.co.uk,
 matthew.auld@intel.com, tvrtko.ursulin@linux.intel.com,
 andi.shyti@intel.com, sam@ravnborg.org, miaoqinglang@huawei.com,
 emil.velikov@collabora.com
Cc: linux-samsung-soc@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 intel-gfx@lists.freedesktop.org, etnaviv@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, linux-rockchip@lists.infradead.org,
 linux-mediatek@lists.infradead.org, amd-gfx@lists.freedesktop.org,
 nouveau@lists.freedesktop.org, linux-tegra@vger.kernel.org,
 xen-devel@lists.xenproject.org, freedreno@lists.freedesktop.org,
 linux-arm-kernel@lists.infradead.org
Message-ID: <41eebda8-bf90-7b5c-8af2-e96b8fd0cea2@suse.de>
Subject: Re: [PATCH v2 01/21] drm/amdgpu: Introduce GEM object functions
References: <20200915145958.19993-1-tzimmermann@suse.de>
 <20200915145958.19993-2-tzimmermann@suse.de>
 <835ba167-3576-1af6-5421-552075588796@amd.com>
In-Reply-To: <835ba167-3576-1af6-5421-552075588796@amd.com>

--mXx6VnsL56rJiBRNYFJpJY6lkuO91DGub
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable

Hi

Am 15.09.20 um 17:05 schrieb Christian K=C3=B6nig:
> Am 15.09.20 um 16:59 schrieb Thomas Zimmermann:
>> GEM object functions deprecate several similar callback interfaces in
>> struct drm_driver. This patch replaces the per-driver callbacks with
>> per-instance callbacks in amdgpu. The only exception is gem_prime_mmap=
,
>> which is non-trivial to convert.
>>
>> v2:
>> =C2=A0=C2=A0=C2=A0=C2=A0* move object-function instance to amdgpu_gem.=
c (Christian)
>> =C2=A0=C2=A0=C2=A0=C2=A0* set callbacks in amdgpu_gem_object_create() =
(Christian)
>>
>> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
>> ---
>> =C2=A0 drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c=C2=A0=C2=A0=C2=A0 |=C2=A0=
 6 ------
>> =C2=A0 drivers/gpu/drm/amd/amdgpu/amdgpu_gem.c=C2=A0=C2=A0=C2=A0 | 23 =
+++++++++++++++++-----
>> =C2=A0 drivers/gpu/drm/amd/amdgpu/amdgpu_gem.h=C2=A0=C2=A0=C2=A0 |=C2=A0=
 5 -----
>> =C2=A0 drivers/gpu/drm/amd/amdgpu/amdgpu_object.c |=C2=A0 1 +
>> =C2=A0 4 files changed, 19 insertions(+), 16 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c
>> b/drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c
>> index 6edde2b9e402..840ca8f9c1e1 100644
>> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c
>> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c
>> @@ -1505,19 +1505,13 @@ static struct drm_driver kms_driver =3D {
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 .lastclose =3D amdgpu_driver_lastclose_=
kms,
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 .irq_handler =3D amdgpu_irq_handler,
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 .ioctls =3D amdgpu_ioctls_kms,
>> -=C2=A0=C2=A0=C2=A0 .gem_free_object_unlocked =3D amdgpu_gem_object_fr=
ee,
>> -=C2=A0=C2=A0=C2=A0 .gem_open_object =3D amdgpu_gem_object_open,
>> -=C2=A0=C2=A0=C2=A0 .gem_close_object =3D amdgpu_gem_object_close,
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 .dumb_create =3D amdgpu_mode_dumb_creat=
e,
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 .dumb_map_offset =3D amdgpu_mode_dumb_m=
map,
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 .fops =3D &amdgpu_driver_kms_fops,
>> =C2=A0 =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 .prime_handle_to_fd =3D drm_gem_=
prime_handle_to_fd,
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 .prime_fd_to_handle =3D drm_gem_prime_f=
d_to_handle,
>> -=C2=A0=C2=A0=C2=A0 .gem_prime_export =3D amdgpu_gem_prime_export,
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 .gem_prime_import =3D amdgpu_gem_prime_=
import,
>> -=C2=A0=C2=A0=C2=A0 .gem_prime_vmap =3D amdgpu_gem_prime_vmap,
>> -=C2=A0=C2=A0=C2=A0 .gem_prime_vunmap =3D amdgpu_gem_prime_vunmap,
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 .gem_prime_mmap =3D amdgpu_gem_prime_mm=
ap,
>> =C2=A0 =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 .name =3D DRIVER_NAME,
>> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_gem.c
>> b/drivers/gpu/drm/amd/amdgpu/amdgpu_gem.c
>> index aa7f230c71bf..aeecd5dc3ce4 100644
>> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_gem.c
>> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_gem.c
>> @@ -36,9 +36,12 @@
>> =C2=A0 =C2=A0 #include "amdgpu.h"
>> =C2=A0 #include "amdgpu_display.h"
>> +#include "amdgpu_dma_buf.h"
>> =C2=A0 #include "amdgpu_xgmi.h"
>> =C2=A0 -void amdgpu_gem_object_free(struct drm_gem_object *gobj)
>> +static const struct drm_gem_object_funcs amdgpu_gem_object_funcs;
>> +
>> +static void amdgpu_gem_object_free(struct drm_gem_object *gobj)
>> =C2=A0 {
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 struct amdgpu_bo *robj =3D gem_to_amdgp=
u_bo(gobj);
>> =C2=A0 @@ -87,6 +90,7 @@ int amdgpu_gem_object_create(struct amdgpu_de=
vice
>> *adev, unsigned long size,
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 return r;
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 }
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 *obj =3D &bo->tbo.base;
>> +=C2=A0=C2=A0=C2=A0 (*obj)->funcs =3D &amdgpu_gem_object_funcs;
>> =C2=A0 =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 return 0;
>> =C2=A0 }
>> @@ -119,8 +123,8 @@ void amdgpu_gem_force_release(struct amdgpu_device=

>> *adev)
>> =C2=A0=C2=A0 * Call from drm_gem_handle_create which appear in both ne=
w and open
>> ioctl
>> =C2=A0=C2=A0 * case.
>> =C2=A0=C2=A0 */
>> -int amdgpu_gem_object_open(struct drm_gem_object *obj,
>> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 struct drm_file *file_priv)
>> +static int amdgpu_gem_object_open(struct drm_gem_object *obj,
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 struct drm_file *file_priv)
>> =C2=A0 {
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 struct amdgpu_bo *abo =3D gem_to_amdgpu=
_bo(obj);
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 struct amdgpu_device *adev =3D amdgpu_t=
tm_adev(abo->tbo.bdev);
>> @@ -152,8 +156,8 @@ int amdgpu_gem_object_open(struct drm_gem_object
>> *obj,
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 return 0;
>> =C2=A0 }
>> =C2=A0 -void amdgpu_gem_object_close(struct drm_gem_object *obj,
>> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0 struct drm_file *file_priv)
>> +static void amdgpu_gem_object_close(struct drm_gem_object *obj,
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 struct drm_file *file_priv)=

>> =C2=A0 {
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 struct amdgpu_bo *bo =3D gem_to_amdgpu_=
bo(obj);
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 struct amdgpu_device *adev =3D amdgpu_t=
tm_adev(bo->tbo.bdev);
>> @@ -211,6 +215,15 @@ void amdgpu_gem_object_close(struct
>> drm_gem_object *obj,
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ttm_eu_backoff_reservation(&ticket, &li=
st);
>> =C2=A0 }
>> =C2=A0 +static const struct drm_gem_object_funcs amdgpu_gem_object_fun=
cs =3D {
>> +=C2=A0=C2=A0=C2=A0 .free =3D amdgpu_gem_object_free,
>> +=C2=A0=C2=A0=C2=A0 .open =3D amdgpu_gem_object_open,
>> +=C2=A0=C2=A0=C2=A0 .close =3D amdgpu_gem_object_close,
>> +=C2=A0=C2=A0=C2=A0 .export =3D amdgpu_gem_prime_export,
>> +=C2=A0=C2=A0=C2=A0 .vmap =3D amdgpu_gem_prime_vmap,
>> +=C2=A0=C2=A0=C2=A0 .vunmap =3D amdgpu_gem_prime_vunmap,
>> +};
>> +
>> =C2=A0 /*
>> =C2=A0=C2=A0 * GEM ioctls.
>> =C2=A0=C2=A0 */
>> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_gem.h
>> b/drivers/gpu/drm/amd/amdgpu/amdgpu_gem.h
>> index e0f025dd1b14..637bf51dbf06 100644
>> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_gem.h
>> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_gem.h
>> @@ -33,11 +33,6 @@
>> =C2=A0 #define AMDGPU_GEM_DOMAIN_MAX=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0 0x3
>> =C2=A0 #define gem_to_amdgpu_bo(gobj) container_of((gobj), struct
>> amdgpu_bo, tbo.base)
>> =C2=A0 -void amdgpu_gem_object_free(struct drm_gem_object *obj);
>> -int amdgpu_gem_object_open(struct drm_gem_object *obj,
>> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0 struct drm_file *file_priv);
>> -void amdgpu_gem_object_close(struct drm_gem_object *obj,
>> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0 struct drm_file *file_priv);
>> =C2=A0 unsigned long amdgpu_gem_timeout(uint64_t timeout_ns);
>> =C2=A0 =C2=A0 /*
>> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_object.c
>> b/drivers/gpu/drm/amd/amdgpu/amdgpu_object.c
>> index ac043baac05d..c4e82a8fa53f 100644
>> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_object.c
>> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_object.c
>> @@ -561,6 +561,7 @@ static int amdgpu_bo_do_create(struct
>> amdgpu_device *adev,
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 bo =3D kzalloc(sizeof(struct amdgpu_bo)=
, GFP_KERNEL);
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if (bo =3D=3D NULL)
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 return -ENOMEM;=

>> +
>=20
> The newline is not unrelated.
>=20
> Apart from that the patch is Reviewed-by: Christian K=C3=B6nig
> <christian.koenig@amd.com>.
>=20
> But I think we need some smoke testing of it.

I gave it a try on the HW/drivers that I listed in the cover letter.
Appears to be working there. There was a bug reported by CI that will be
fixed in the next iteration.

Best regards
Thomas

>=20
> Christian.
>=20
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 drm_gem_private_object_init(adev_to_drm=
(adev), &bo->tbo.base,
>> size);
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 INIT_LIST_HEAD(&bo->shadow_list);
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 bo->vm_bo =3D NULL;
>=20
> _______________________________________________
> dri-devel mailing list
> dri-devel@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/dri-devel

--=20
Thomas Zimmermann
Graphics Driver Developer
SUSE Software Solutions Germany GmbH
Maxfeldstr. 5, 90409 N=C3=BCrnberg, Germany
(HRB 36809, AG N=C3=BCrnberg)
Gesch=C3=A4ftsf=C3=BChrer: Felix Imend=C3=B6rffer


--mXx6VnsL56rJiBRNYFJpJY6lkuO91DGub--

--ZR47F2it7RqvbT2snhj2Q3AXTit7yD8k0
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQFIBAEBCAAyFiEEchf7rIzpz2NEoWjlaA3BHVMLeiMFAl9jEuwUHHR6aW1tZXJt
YW5uQHN1c2UuZGUACgkQaA3BHVMLeiPyiggAh/BO7SFe5ZVkcBfrX0+omcib+uvq
wUfAVwNVPgP4GrDtDXLr4zKuk59o62DKt31reEMSrNQm0ZVv4oYlt9YTXUIBc0fb
Kfg1G/YdZEH4gl6Xnb1Y6bhK0lFKESQonYcCM20uUfgcfhIL71bxo6IQzNkLLXNl
Gvbkj8qnJhHFWO8PunW5ufHbKHG+ywye5TnGplv1ubKtNKZuIbC+3zb7gf/+ysCT
+8ttQ5BqdlF1Mc31bYqBTR0GwyfdofspCeDjdA6jDGN3Wq2Be+Y/E6/Pt7ANwWn8
+pRLfFQYnt1aj5BKBvxQ4zLmOtqu3DJtik5oXtau5wp3407kMunsBYib0A==
=Cl71
-----END PGP SIGNATURE-----

--ZR47F2it7RqvbT2snhj2Q3AXTit7yD8k0--


--===============1003904228670354030==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek

--===============1003904228670354030==--

