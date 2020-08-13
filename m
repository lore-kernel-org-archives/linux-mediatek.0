Return-Path: <SRS0=lgZq=BX=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,NICE_REPLY_A,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CBA2FC433E1
	for <linux-mediatek@archiver.kernel.org>; Thu, 13 Aug 2020 13:57:50 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9506620791
	for <linux-mediatek@archiver.kernel.org>; Thu, 13 Aug 2020 13:57:50 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="v4HoaBxU"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 9506620791
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=suse.de
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Type:Cc:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:Date:Message-ID:From:References:To:Subject:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=biV14tGr3nBwt3pI+Y8ATQH4rARdnPSRl4YX64vkc8I=; b=v4HoaBxU8ILZTOe/YlKLXBU3N
	OwSHdo16YF0sJqHSj44WExcBrfuljR6M/iG1w8M0UfOrAEI5Z0D8lAi7L+y3gdfyJrAYpZILi/RrF
	E3SCIXQm5IyTiOR/xWS69Fem2FTpcRBBAt/zYNXlRVMTvMylpg6X3wpX6X6pBy84E/BQj6qBSuLCB
	p+9ErLmHzZMz1ylS7C3KSga2EstG1vEZAarRA77MBMEg0YuKZtJteJs7dBHwq94fksflhvC41NKSF
	LRF/G+CIVCdBm/aFFNMDr0/ga6UrOETsjpDKh67s7ouLxpgDPOtCprXZr8Lx8xhUL0tQdxQFqvFo7
	BeHKPs7GA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1k6Djh-0006ew-Hh; Thu, 13 Aug 2020 13:57:41 +0000
Received: from mx2.suse.de ([195.135.220.15])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1k6Dje-0006eI-Cc; Thu, 13 Aug 2020 13:57:39 +0000
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 5740DB19E;
 Thu, 13 Aug 2020 13:57:59 +0000 (UTC)
Subject: Re: [PATCH 19/20] drm/xlnx: Initialize DRM driver instance with CMA
 helper macro
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
References: <20200813083644.31711-1-tzimmermann@suse.de>
 <20200813083644.31711-20-tzimmermann@suse.de>
 <20200813133605.GJ6057@pendragon.ideasonboard.com>
From: Thomas Zimmermann <tzimmermann@suse.de>
Message-ID: <a8e39798-9812-e325-255a-e6536cb32339@suse.de>
Date: Thu, 13 Aug 2020 15:57:32 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.11.0
MIME-Version: 1.0
In-Reply-To: <20200813133605.GJ6057@pendragon.ideasonboard.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200813_095738_643041_83A5E2E3 
X-CRM114-Status: GOOD (  25.08  )
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
 thierry.reding@gmail.com, amd-gfx@lists.freedesktop.org, sam@ravnborg.org,
 emil.velikov@collabora.com, abdiel.janulgue@linux.intel.com,
 linux-samsung-soc@vger.kernel.org, jy0922.shim@samsung.com,
 oleksandr_andrushchenko@epam.com, michal.simek@xilinx.com, krzk@kernel.org,
 jonathanh@nvidia.com, linux-rockchip@lists.infradead.org,
 tomi.valkeinen@ti.com, bskeggs@redhat.com, xen-devel@lists.xenproject.org,
 marek.olsak@amd.com, matthew.auld@intel.com, chunkuang.hu@kernel.org,
 andi.shyti@intel.com, linux-arm-msm@vger.kernel.org,
 intel-gfx@lists.freedesktop.org, tianci.yin@amd.com, nirmoy.das@amd.com,
 etnaviv@lists.freedesktop.org, hdegoede@redhat.com,
 linux-mediatek@lists.infradead.org, rodrigo.vivi@intel.com,
 linux-tegra@vger.kernel.org, evan.quan@amd.com, sean@poorly.run,
 linux-arm-kernel@lists.infradead.org, tvrtko.ursulin@linux.intel.com,
 chris@chris-wilson.co.uk, rodrigosiqueiramelo@gmail.com, hyun.kwon@xilinx.com,
 aaron.liu@amd.com, Felix.Kuehling@amd.com, xinhui.pan@amd.com,
 sw0312.kim@samsung.com, hjc@rock-chips.com, kyungmin.park@samsung.com,
 miaoqinglang@huawei.com, kgene@kernel.org, alexander.deucher@amd.com,
 freedreno@lists.freedesktop.org, christian.koenig@amd.com,
 Hawking.Zhang@amd.com
Content-Type: multipart/mixed; boundary="===============6653712540914357527=="
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--===============6653712540914357527==
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="tbCt2o5uFn9Z4Xo4P1cpCcyhXosV08OH6"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--tbCt2o5uFn9Z4Xo4P1cpCcyhXosV08OH6
Content-Type: multipart/mixed; boundary="Orz2ZqpSWnksEfl2yo6RF3aBwExLujGG6";
 protected-headers="v1"
From: Thomas Zimmermann <tzimmermann@suse.de>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: hamohammed.sa@gmail.com, airlied@linux.ie, nouveau@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, michal.simek@xilinx.com,
 thierry.reding@gmail.com, krzk@kernel.org, sam@ravnborg.org,
 emil.velikov@collabora.com, abdiel.janulgue@linux.intel.com,
 linux-samsung-soc@vger.kernel.org, jy0922.shim@samsung.com,
 oleksandr_andrushchenko@epam.com, tomi.valkeinen@ti.com,
 linux-tegra@vger.kernel.org, linux@armlinux.org.uk, jonathanh@nvidia.com,
 linux-rockchip@lists.infradead.org, kgene@kernel.org, bskeggs@redhat.com,
 xen-devel@lists.xenproject.org, intel-gfx@lists.freedesktop.org,
 matthew.auld@intel.com, chunkuang.hu@kernel.org, andi.shyti@intel.com,
 linux-arm-msm@vger.kernel.org, marek.olsak@amd.com, tianci.yin@amd.com,
 etnaviv@lists.freedesktop.org, hdegoede@redhat.com,
 linux-mediatek@lists.infradead.org, rodrigo.vivi@intel.com,
 matthias.bgg@gmail.com, evan.quan@amd.com, sean@poorly.run,
 linux-arm-kernel@lists.infradead.org, tvrtko.ursulin@linux.intel.com,
 amd-gfx@lists.freedesktop.org, chris@chris-wilson.co.uk,
 hyun.kwon@xilinx.com, rodrigosiqueiramelo@gmail.com, aaron.liu@amd.com,
 Felix.Kuehling@amd.com, xinhui.pan@amd.com, sw0312.kim@samsung.com,
 hjc@rock-chips.com, miaoqinglang@huawei.com, kyungmin.park@samsung.com,
 nirmoy.das@amd.com, alexander.deucher@amd.com, Hawking.Zhang@amd.com,
 freedreno@lists.freedesktop.org, christian.koenig@amd.com
Message-ID: <a8e39798-9812-e325-255a-e6536cb32339@suse.de>
Subject: Re: [PATCH 19/20] drm/xlnx: Initialize DRM driver instance with CMA
 helper macro
References: <20200813083644.31711-1-tzimmermann@suse.de>
 <20200813083644.31711-20-tzimmermann@suse.de>
 <20200813133605.GJ6057@pendragon.ideasonboard.com>
In-Reply-To: <20200813133605.GJ6057@pendragon.ideasonboard.com>

--Orz2ZqpSWnksEfl2yo6RF3aBwExLujGG6
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable

Hi

Am 13.08.20 um 15:36 schrieb Laurent Pinchart:
> Hi Thomas,
>=20
> Thank you for the patch.
>=20
> On Thu, Aug 13, 2020 at 10:36:43AM +0200, Thomas Zimmermann wrote:
>> The xlnx driver uses CMA helpers with default callback functions.
>> Initialize the driver structure with the rsp CMA helper macro. The
>> driver is being converted to use GEM object functions as part of
>> this change.
>>
>> Two callbacks, .dumb_destroy and .gem_prime_import, were initialized
>> to their default implementations, so they are just kept empty now.
>>
>> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
>> ---
>>  drivers/gpu/drm/xlnx/zynqmp_dpsub.c | 14 +-------------
>>  1 file changed, 1 insertion(+), 13 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/xlnx/zynqmp_dpsub.c b/drivers/gpu/drm/xln=
x/zynqmp_dpsub.c
>> index 26328c76305b..058044dcc062 100644
>> --- a/drivers/gpu/drm/xlnx/zynqmp_dpsub.c
>> +++ b/drivers/gpu/drm/xlnx/zynqmp_dpsub.c
>> @@ -80,19 +80,7 @@ static struct drm_driver zynqmp_dpsub_drm_driver =3D=
 {
>>  	.driver_features		=3D DRIVER_MODESET | DRIVER_GEM |
>>  					  DRIVER_ATOMIC,
>> =20
>> -	.prime_handle_to_fd		=3D drm_gem_prime_handle_to_fd,
>> -	.prime_fd_to_handle		=3D drm_gem_prime_fd_to_handle,
>> -	.gem_prime_export		=3D drm_gem_prime_export,
>> -	.gem_prime_import		=3D drm_gem_prime_import,
>> -	.gem_prime_get_sg_table		=3D drm_gem_cma_prime_get_sg_table,
>> -	.gem_prime_import_sg_table	=3D drm_gem_cma_prime_import_sg_table,
>> -	.gem_prime_vmap			=3D drm_gem_cma_prime_vmap,
>> -	.gem_prime_vunmap		=3D drm_gem_cma_prime_vunmap,
>> -	.gem_prime_mmap			=3D drm_gem_cma_prime_mmap,
>> -	.gem_free_object_unlocked	=3D drm_gem_cma_free_object,
>> -	.gem_vm_ops			=3D &drm_gem_cma_vm_ops,
>> -	.dumb_create			=3D zynqmp_dpsub_dumb_create,
>> -	.dumb_destroy			=3D drm_gem_dumb_destroy,
>> +	DRM_GEM_CMA_DRIVER_OPS_VMAP_WITH_DUMB_CREATE(zynqmp_dpsub_dumb_creat=
e),
>=20
> The only effective change here is
>=20
> -	.gem_prime_import_sg_table	=3D drm_gem_cma_prime_import_sg_table,
> -	.gem_prime_mmap			=3D drm_gem_cma_prime_mmap,
> +	.gem_prime_import_sg_table	=3D drm_gem_cma_prime_import_sg_table_vmap=
,
> +	.gem_prime_mmap			=3D drm_gem_prime_mmap,
>=20
> The change is significant, and I have a hard time following the code to=

> verify that it's correct, or if it's an undesired side effect. If it's
> correct, could the change be mentioned in the commit message, with at
> least a brief explanation of why this is correct, and what the
> consequences here ?

I think this is a mistake that I didn't notice. Thanks for spotting it.
Initializing the driver structure
DRM_GEM_CMA_DRIVER_OPS_WITH_DUMB_CREATE should fix it. I'll change this
for the patch's next revision.

Best regards
Thomas

>=20
>> =20
>>  	.fops				=3D &zynqmp_dpsub_drm_fops,
>> =20
>=20

--=20
Thomas Zimmermann
Graphics Driver Developer
SUSE Software Solutions Germany GmbH
Maxfeldstr. 5, 90409 N=C3=BCrnberg, Germany
(HRB 36809, AG N=C3=BCrnberg)
Gesch=C3=A4ftsf=C3=BChrer: Felix Imend=C3=B6rffer


--Orz2ZqpSWnksEfl2yo6RF3aBwExLujGG6--

--tbCt2o5uFn9Z4Xo4P1cpCcyhXosV08OH6
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQFIBAEBCAAyFiEEchf7rIzpz2NEoWjlaA3BHVMLeiMFAl81RswUHHR6aW1tZXJt
YW5uQHN1c2UuZGUACgkQaA3BHVMLeiPfqAgAoOYcX5UFEbejKi/wGBq3HxlV2lCp
5M6+u8OsIfDWcmroBE+YK419eRwDbsNeDSbzHs7GVQ7SOEeltGdgRpf7QuaUgupn
VJmuMSjAwqbV0l5nyd5DD0Tr2Z/QOxaLAguvxUcSTOdYWAuqLwTo6X5+butu86YB
tEBhKOk6Vzm8C5KA3Loy27We59QzBmDHJ+cdzEhsM1AG0SPJ5sePjMiKFMM3Mo4u
8+HQ3wVLzYAQVhK7Q8bUM/6yIv+AQaAfoNtG3zPI7q9FKKKMbBbTVQV0YeZUKC4T
kIHdnG+dlK834qYxJmlxWwcU8XjHoiAbQYJDfpmjeYw++Xz1MePDB6MG2g==
=PGhi
-----END PGP SIGNATURE-----

--tbCt2o5uFn9Z4Xo4P1cpCcyhXosV08OH6--


--===============6653712540914357527==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek

--===============6653712540914357527==--

