Return-Path: <SRS0=dHEP=CZ=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.3 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,NICE_REPLY_A,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6C997C43461
	for <linux-mediatek@archiver.kernel.org>; Wed, 16 Sep 2020 10:36:47 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 00B072074B
	for <linux-mediatek@archiver.kernel.org>; Wed, 16 Sep 2020 10:36:46 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="Jw9GbFHi"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 00B072074B
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=suse.de
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Type:Cc:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:Date:Message-ID:From:References:To:Subject:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=7B+NmcVZ9sqGkZovQt/0q6/3KdnCTX6NbyH2I0MSTzk=; b=Jw9GbFHizcl3Ga0TmQgvc9P4H
	fidvW7jSASoV3z/gLuic9r3S3FsgbBjZ4JWhaWJ/7XXwjEJsmSTte8rLw0y12rTx8dQVenn04ipXx
	c54yjg8nyn/NGVDnn2Mc/QPMIefiMOjhaFAHftF/aAT4vvq47+Nbw968M7sdqV96MeHAJC/GQ1Y0Z
	fseon/sfUzUWGNfNNL6Nsr7siWDvmx1bH/tOm9heg0odsFQ+WCP6x3JiP7zglRK2vsHFt6EuNlFdp
	PGrH1idsS0KTxb4V7kJvnRopmaeVWnDdz2GIgYGF0JPUlApuqqQh9qsjw+EAJFIX3Jo8V9smqpn+H
	VcRmWWokg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kIUnl-0007Ws-CD; Wed, 16 Sep 2020 10:36:37 +0000
Received: from mx2.suse.de ([195.135.220.15])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kIUnj-0007W2-8P; Wed, 16 Sep 2020 10:36:36 +0000
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 4E411B55A;
 Wed, 16 Sep 2020 10:36:48 +0000 (UTC)
Subject: Re: [PATCH v2 04/21] drm/exynos: Introduce GEM object functions
To: Daniel Vetter <daniel@ffwll.ch>
References: <20200915145958.19993-1-tzimmermann@suse.de>
 <20200915145958.19993-5-tzimmermann@suse.de>
 <20200916100318.GF438822@phenom.ffwll.local>
From: Thomas Zimmermann <tzimmermann@suse.de>
Message-ID: <fb1f5992-1642-5751-5672-486b89442e1c@suse.de>
Date: Wed, 16 Sep 2020 12:36:28 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.0
MIME-Version: 1.0
In-Reply-To: <20200916100318.GF438822@phenom.ffwll.local>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200916_063635_527139_61A7DD48 
X-CRM114-Status: GOOD (  23.30  )
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
Cc: hamohammed.sa@gmail.com, airlied@linux.ie, nouveau@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, linux@armlinux.org.uk, matthias.bgg@gmail.com,
 thierry.reding@gmail.com, krzk@kernel.org, sam@ravnborg.org,
 emil.velikov@collabora.com, linux-samsung-soc@vger.kernel.org,
 jy0922.shim@samsung.com, oleksandr_andrushchenko@epam.com,
 michal.simek@xilinx.com, miaoqinglang@huawei.com, jonathanh@nvidia.com,
 linux-rockchip@lists.infradead.org, tomi.valkeinen@ti.com, bskeggs@redhat.com,
 xen-devel@lists.xenproject.org, marek.olsak@amd.com, matthew.auld@intel.com,
 chunkuang.hu@kernel.org, andi.shyti@intel.com, linux-arm-msm@vger.kernel.org,
 intel-gfx@lists.freedesktop.org, tianci.yin@amd.com,
 etnaviv@lists.freedesktop.org, hdegoede@redhat.com,
 linux-mediatek@lists.infradead.org, rodrigo.vivi@intel.com,
 linux-tegra@vger.kernel.org, evan.quan@amd.com, sean@poorly.run,
 linux-arm-kernel@lists.infradead.org, tvrtko.ursulin@linux.intel.com,
 amd-gfx@lists.freedesktop.org, chris@chris-wilson.co.uk,
 rodrigosiqueiramelo@gmail.com, hyun.kwon@xilinx.com, aaron.liu@amd.com,
 Felix.Kuehling@amd.com, xinhui.pan@amd.com, sw0312.kim@samsung.com,
 hjc@rock-chips.com, kyungmin.park@samsung.com, nirmoy.das@amd.com,
 kgene@kernel.org, alexander.deucher@amd.com, Hawking.Zhang@amd.com,
 freedreno@lists.freedesktop.org, christian.koenig@amd.com,
 laurent.pinchart@ideasonboard.com
Content-Type: multipart/mixed; boundary="===============3735237971653377502=="
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--===============3735237971653377502==
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="VLzf65jApKkRavuxi39QvnC87GfNF3zix"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--VLzf65jApKkRavuxi39QvnC87GfNF3zix
Content-Type: multipart/mixed; boundary="dt3SkYl9e3y1MIK8AYjuI2mtP7GQiTevE";
 protected-headers="v1"
From: Thomas Zimmermann <tzimmermann@suse.de>
To: Daniel Vetter <daniel@ffwll.ch>
Cc: hamohammed.sa@gmail.com, airlied@linux.ie, nouveau@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, michal.simek@xilinx.com,
 thierry.reding@gmail.com, krzk@kernel.org, sam@ravnborg.org,
 emil.velikov@collabora.com, linux-samsung-soc@vger.kernel.org,
 jy0922.shim@samsung.com, oleksandr_andrushchenko@epam.com,
 tomi.valkeinen@ti.com, linux-tegra@vger.kernel.org, linux@armlinux.org.uk,
 jonathanh@nvidia.com, linux-rockchip@lists.infradead.org, kgene@kernel.org,
 bskeggs@redhat.com, xen-devel@lists.xenproject.org, miaoqinglang@huawei.com,
 intel-gfx@lists.freedesktop.org, matthew.auld@intel.com,
 chunkuang.hu@kernel.org, andi.shyti@intel.com,
 linux-arm-msm@vger.kernel.org, marek.olsak@amd.com, tianci.yin@amd.com,
 etnaviv@lists.freedesktop.org, hdegoede@redhat.com,
 linux-mediatek@lists.infradead.org, rodrigo.vivi@intel.com,
 matthias.bgg@gmail.com, evan.quan@amd.com, sean@poorly.run,
 linux-arm-kernel@lists.infradead.org, tvrtko.ursulin@linux.intel.com,
 amd-gfx@lists.freedesktop.org, laurent.pinchart@ideasonboard.com,
 hyun.kwon@xilinx.com, rodrigosiqueiramelo@gmail.com, aaron.liu@amd.com,
 Felix.Kuehling@amd.com, xinhui.pan@amd.com, sw0312.kim@samsung.com,
 hjc@rock-chips.com, chris@chris-wilson.co.uk, kyungmin.park@samsung.com,
 nirmoy.das@amd.com, alexander.deucher@amd.com, Hawking.Zhang@amd.com,
 freedreno@lists.freedesktop.org, christian.koenig@amd.com
Message-ID: <fb1f5992-1642-5751-5672-486b89442e1c@suse.de>
Subject: Re: [PATCH v2 04/21] drm/exynos: Introduce GEM object functions
References: <20200915145958.19993-1-tzimmermann@suse.de>
 <20200915145958.19993-5-tzimmermann@suse.de>
 <20200916100318.GF438822@phenom.ffwll.local>
In-Reply-To: <20200916100318.GF438822@phenom.ffwll.local>

--dt3SkYl9e3y1MIK8AYjuI2mtP7GQiTevE
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable

Hi

Am 16.09.20 um 12:03 schrieb Daniel Vetter:
> On Tue, Sep 15, 2020 at 04:59:41PM +0200, Thomas Zimmermann wrote:
>> GEM object functions deprecate several similar callback interfaces in
>> struct drm_driver. This patch replaces the per-driver callbacks with
>> per-instance callbacks in exynos. The only exception is gem_prime_mmap=
,
>> which is non-trivial to convert.
>>
>> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
>> ---
>>  drivers/gpu/drm/exynos/exynos_drm_drv.c | 10 ----------
>>  drivers/gpu/drm/exynos/exynos_drm_gem.c | 15 +++++++++++++++
>>  2 files changed, 15 insertions(+), 10 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/exynos/exynos_drm_drv.c b/drivers/gpu/drm=
/exynos/exynos_drm_drv.c
>> index dbd80f1e4c78..fe46680ca208 100644
>> --- a/drivers/gpu/drm/exynos/exynos_drm_drv.c
>> +++ b/drivers/gpu/drm/exynos/exynos_drm_drv.c
>> @@ -75,11 +75,6 @@ static void exynos_drm_postclose(struct drm_device =
*dev, struct drm_file *file)
>>  	file->driver_priv =3D NULL;
>>  }
>> =20
>> -static const struct vm_operations_struct exynos_drm_gem_vm_ops =3D {
>> -	.open =3D drm_gem_vm_open,
>> -	.close =3D drm_gem_vm_close,
>> -};
>> -
>>  static const struct drm_ioctl_desc exynos_ioctls[] =3D {
>>  	DRM_IOCTL_DEF_DRV(EXYNOS_GEM_CREATE, exynos_drm_gem_create_ioctl,
>>  			DRM_RENDER_ALLOW),
>> @@ -124,16 +119,11 @@ static struct drm_driver exynos_drm_driver =3D {=

>>  	.open			=3D exynos_drm_open,
>>  	.lastclose		=3D drm_fb_helper_lastclose,
>>  	.postclose		=3D exynos_drm_postclose,
>> -	.gem_free_object_unlocked =3D exynos_drm_gem_free_object,
>> -	.gem_vm_ops		=3D &exynos_drm_gem_vm_ops,
>>  	.dumb_create		=3D exynos_drm_gem_dumb_create,
>>  	.prime_handle_to_fd	=3D drm_gem_prime_handle_to_fd,
>>  	.prime_fd_to_handle	=3D drm_gem_prime_fd_to_handle,
>>  	.gem_prime_import	=3D exynos_drm_gem_prime_import,
>> -	.gem_prime_get_sg_table	=3D exynos_drm_gem_prime_get_sg_table,
>>  	.gem_prime_import_sg_table	=3D exynos_drm_gem_prime_import_sg_table,=

>> -	.gem_prime_vmap		=3D exynos_drm_gem_prime_vmap,
>> -	.gem_prime_vunmap	=3D exynos_drm_gem_prime_vunmap,
>>  	.gem_prime_mmap		=3D exynos_drm_gem_prime_mmap,
>>  	.ioctls			=3D exynos_ioctls,
>>  	.num_ioctls		=3D ARRAY_SIZE(exynos_ioctls),
>> diff --git a/drivers/gpu/drm/exynos/exynos_drm_gem.c b/drivers/gpu/drm=
/exynos/exynos_drm_gem.c
>> index efa476858db5..69a5cf28b4ae 100644
>> --- a/drivers/gpu/drm/exynos/exynos_drm_gem.c
>> +++ b/drivers/gpu/drm/exynos/exynos_drm_gem.c
>> @@ -129,6 +129,19 @@ void exynos_drm_gem_destroy(struct exynos_drm_gem=
 *exynos_gem)
>>  	kfree(exynos_gem);
>>  }
>> =20
>> +static const struct vm_operations_struct exynos_drm_gem_vm_ops =3D {
>> +	.open =3D drm_gem_vm_open,
>> +	.close =3D drm_gem_vm_close,
>> +};
>=20
> Hm moving the drm_gem_cma_vm_ops into drm_gem.h or so and maybe calling=

> them drm_gem_simple_ops or so would remove a pile of these. But perhaps=
 a
> quick follow up series.

Good idea. Several interfaces use the term 'default' in their name, so
something like drm_gem_default_vm_ops seems appropriate.

BTW is there a reason why we have file operations like
DEFINE_DRM_GEM_CMA_FOPS() in each module? It seems like this could also
be provided by the rsp memory-manager library.

Best regards
Thomas

>=20
> Reviewed-by: Daniel Vetter <daniel.vetter@ffwll.ch>
>=20
>> +
>> +static const struct drm_gem_object_funcs exynos_drm_gem_object_funcs =
=3D {
>> +	.free =3D exynos_drm_gem_free_object,
>> +	.get_sg_table =3D exynos_drm_gem_prime_get_sg_table,
>> +	.vmap =3D exynos_drm_gem_prime_vmap,
>> +	.vunmap	=3D exynos_drm_gem_prime_vunmap,
>> +	.vm_ops =3D &exynos_drm_gem_vm_ops,
>> +};
>> +
>>  static struct exynos_drm_gem *exynos_drm_gem_init(struct drm_device *=
dev,
>>  						  unsigned long size)
>>  {
>> @@ -143,6 +156,8 @@ static struct exynos_drm_gem *exynos_drm_gem_init(=
struct drm_device *dev,
>>  	exynos_gem->size =3D size;
>>  	obj =3D &exynos_gem->base;
>> =20
>> +	obj->funcs =3D &exynos_drm_gem_object_funcs;
>> +
>>  	ret =3D drm_gem_object_init(dev, obj, size);
>>  	if (ret < 0) {
>>  		DRM_DEV_ERROR(dev->dev, "failed to initialize gem object\n");
>> --=20
>> 2.28.0
>>
>=20

--=20
Thomas Zimmermann
Graphics Driver Developer
SUSE Software Solutions Germany GmbH
Maxfeldstr. 5, 90409 N=C3=BCrnberg, Germany
(HRB 36809, AG N=C3=BCrnberg)
Gesch=C3=A4ftsf=C3=BChrer: Felix Imend=C3=B6rffer


--dt3SkYl9e3y1MIK8AYjuI2mtP7GQiTevE--

--VLzf65jApKkRavuxi39QvnC87GfNF3zix
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQFIBAEBCAAyFiEEchf7rIzpz2NEoWjlaA3BHVMLeiMFAl9h6qwUHHR6aW1tZXJt
YW5uQHN1c2UuZGUACgkQaA3BHVMLeiPl9Qf+KR96aoWYf20LvHA3GnV4zrCawiec
y2yduL2GYhWPOf4GMfY2D+iMsP8w0W7E25g5LPHA+Vqz5D02rDOi3daO0DrNPmW6
693QU4qPhbQzK7Y+2jWAjMeuNnkrX+LMllUvQ1+QfapihbnvGqu9aNH3BpXfjOgt
BoqBHPnc6jc6BCC9knI+JDmxfv+mxrkN3TVEWw78TRR8W9HubgJK3Qx5yFPb76jL
BTd4moKQlMWspChoyM+/682BI3I/vaGbC7dL6ABTxoYc5Ub2PxY3RtaKnNPfCcpq
dvopHHQ1YJ3wOj988DPHGprg6T0jK2zsR3M9rja76IOs/Y3rh1LWAWk2LA==
=Gxfw
-----END PGP SIGNATURE-----

--VLzf65jApKkRavuxi39QvnC87GfNF3zix--


--===============3735237971653377502==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek

--===============3735237971653377502==--

