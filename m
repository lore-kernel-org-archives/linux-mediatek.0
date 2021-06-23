Return-Path: <SRS0=j594=LR=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.6 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1CE68C4743C
	for <linux-mediatek@archiver.kernel.org>; Wed, 23 Jun 2021 06:46:44 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D44956115A
	for <linux-mediatek@archiver.kernel.org>; Wed, 23 Jun 2021 06:46:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org D44956115A
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=suse.de
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:Date:Message-ID:From:References:Cc:To:Subject:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=W6Uq9YxF1pIH4QI/DGIObjcLehKnd5dE2Ew4pTYMkVU=; b=RZM8dEeejClPbFAvLUJKNS7OPh
	5r4c8ZSQHtevKSLQGSGtRl722rrouTKPYX/k1Y+icL3mROa6d0ieDIuGCmAIj0pEhamlqLDDGiaQA
	eH/ID3v39zJCxc7UoCrOy3Ami3QyswxUz4zINo/uV0N94KTeligIGEURTUFQPcG2qY6LsepZkRYiq
	qi6qXFUNJs9+6D5opXKDSagQeQNnXsyGKfe1KSLdqvkwS8Zbfz2h4/iLjLtly398q0XMJpUyhrpGx
	B5mpbqCFioFCdtyrpALHWZ/tXBnmBNk8SPZxyGso6xQwhW9tfAxAyng4Hylx2CmG5IkFO9Z8Hm3Ot
	rltFVO8Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1lvweg-009dux-32; Wed, 23 Jun 2021 06:46:34 +0000
Received: from smtp-out1.suse.de ([195.135.220.28])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1lvweX-009dtI-Gq; Wed, 23 Jun 2021 06:46:27 +0000
Received: from imap.suse.de (imap-alt.suse-dmz.suse.de [192.168.254.47])
 (using TLSv1.2 with cipher ECDHE-ECDSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 988EA2197A;
 Wed, 23 Jun 2021 06:46:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1624430783; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=2ZcrZ8mqlycZCvqIEcHhGpxfIvuTeneHVV1SxihHfFE=;
 b=fysCyX7pl9hwhW7lTzSKgcEjXwuA1hSjnlioc+I+F/kS6sR8x0XrVBlQi9GMrNr+/TTuta
 p08ut3LPD29iy85JVrhF1ATbHuOhPkEUualytbvgfTQ/QUpFQ/Y9FDVhGnQB0hUbv8qUV9
 c369obDXPQ38a1O6O41ciPajyajOOSM=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1624430783;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=2ZcrZ8mqlycZCvqIEcHhGpxfIvuTeneHVV1SxihHfFE=;
 b=4Smgv0UnJNewFhbY+AWKvoKHBM7+sC/qxgajn4EyRdKoRPnbRT113AsH3tdSvhG+pj3ZPg
 x5HowUsIUAhcZ5Dw==
Received: from imap3-int (imap-alt.suse-dmz.suse.de [192.168.254.47])
 by imap.suse.de (Postfix) with ESMTP id C397811A97;
 Wed, 23 Jun 2021 06:46:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1624430783; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=2ZcrZ8mqlycZCvqIEcHhGpxfIvuTeneHVV1SxihHfFE=;
 b=fysCyX7pl9hwhW7lTzSKgcEjXwuA1hSjnlioc+I+F/kS6sR8x0XrVBlQi9GMrNr+/TTuta
 p08ut3LPD29iy85JVrhF1ATbHuOhPkEUualytbvgfTQ/QUpFQ/Y9FDVhGnQB0hUbv8qUV9
 c369obDXPQ38a1O6O41ciPajyajOOSM=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1624430783;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=2ZcrZ8mqlycZCvqIEcHhGpxfIvuTeneHVV1SxihHfFE=;
 b=4Smgv0UnJNewFhbY+AWKvoKHBM7+sC/qxgajn4EyRdKoRPnbRT113AsH3tdSvhG+pj3ZPg
 x5HowUsIUAhcZ5Dw==
Received: from director2.suse.de ([192.168.254.72]) by imap3-int with ESMTPSA
 id Gn2cLr7Y0mC4bAAALh3uQQ
 (envelope-from <tzimmermann@suse.de>); Wed, 23 Jun 2021 06:46:22 +0000
Subject: Re: [PATCH v2 00/22] Deprecate struct drm_device.irq_enabled
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: emma@anholt.net, airlied@linux.ie, nouveau@lists.freedesktop.org,
 liviu.dudau@arm.com, alexandre.torgue@foss.st.com,
 dri-devel@lists.freedesktop.org, michal.simek@xilinx.com,
 linux-tegra@vger.kernel.org, thierry.reding@gmail.com,
 amd-gfx@lists.freedesktop.org, benjamin.gaignard@linaro.org,
 mihail.atanassov@arm.com, linux-stm32@st-md-mailman.stormreply.com,
 linux-samsung-soc@vger.kernel.org, jy0922.shim@samsung.com,
 krzysztof.kozlowski@canonical.com, linux-rockchip@lists.infradead.org,
 linux-mediatek@lists.infradead.org, wens@csie.org, jernej.skrabec@gmail.com,
 jonathanh@nvidia.com, xinliang.liu@linaro.org,
 kong.kongxinwei@hisilicon.com, james.qian.wang@arm.com, linux-imx@nxp.com,
 linux-graphics-maintainer@vmware.com, linux-sunxi@lists.linux.dev,
 bskeggs@redhat.com, chunkuang.hu@kernel.org, puck.chen@hisilicon.com,
 s.hauer@pengutronix.de, laurentiu.palcu@oss.nxp.com, matthias.bgg@gmail.com,
 kernel@pengutronix.de, linux-arm-kernel@lists.infradead.org,
 mcoquelin.stm32@gmail.com, hyun.kwon@xilinx.com, tomba@kernel.org,
 jyri.sarha@iki.fi, yannick.fertre@foss.st.com, Xinhui.Pan@amd.com,
 sw0312.kim@samsung.com, hjc@rock-chips.com, christian.koenig@amd.com,
 kyungmin.park@samsung.com, philippe.cornu@foss.st.com,
 alexander.deucher@amd.com, tiantao6@hisilicon.com, shawnguo@kernel.org
References: <20210622141002.11590-1-tzimmermann@suse.de>
 <YNILtLMkI3uoH7mJ@pendragon.ideasonboard.com>
From: Thomas Zimmermann <tzimmermann@suse.de>
Message-ID: <03e349b3-f805-9aa8-14a7-96e674011c3a@suse.de>
Date: Wed, 23 Jun 2021 08:46:22 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <YNILtLMkI3uoH7mJ@pendragon.ideasonboard.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210622_234625_770460_170AD725 
X-CRM114-Status: GOOD (  22.02  )
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
Content-Type: multipart/mixed; boundary="===============8327803679971440181=="
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--===============8327803679971440181==
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="3WvZxzpHzwDdgKIhf5CsBVuKNwIjhuqGE"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--3WvZxzpHzwDdgKIhf5CsBVuKNwIjhuqGE
Content-Type: multipart/mixed; boundary="VpqofwZZWokdR6MNHNIH0htxV9CnMA5E8";
 protected-headers="v1"
From: Thomas Zimmermann <tzimmermann@suse.de>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: emma@anholt.net, airlied@linux.ie, nouveau@lists.freedesktop.org,
 liviu.dudau@arm.com, alexandre.torgue@foss.st.com,
 dri-devel@lists.freedesktop.org, michal.simek@xilinx.com,
 linux-tegra@vger.kernel.org, thierry.reding@gmail.com,
 amd-gfx@lists.freedesktop.org, benjamin.gaignard@linaro.org,
 mihail.atanassov@arm.com, linux-stm32@st-md-mailman.stormreply.com,
 linux-samsung-soc@vger.kernel.org, jy0922.shim@samsung.com,
 krzysztof.kozlowski@canonical.com, linux-rockchip@lists.infradead.org,
 linux-mediatek@lists.infradead.org, wens@csie.org, jernej.skrabec@gmail.com,
 jonathanh@nvidia.com, xinliang.liu@linaro.org,
 kong.kongxinwei@hisilicon.com, james.qian.wang@arm.com, linux-imx@nxp.com,
 linux-graphics-maintainer@vmware.com, linux-sunxi@lists.linux.dev,
 bskeggs@redhat.com, chunkuang.hu@kernel.org, puck.chen@hisilicon.com,
 s.hauer@pengutronix.de, laurentiu.palcu@oss.nxp.com, matthias.bgg@gmail.com,
 kernel@pengutronix.de, linux-arm-kernel@lists.infradead.org,
 mcoquelin.stm32@gmail.com, hyun.kwon@xilinx.com, tomba@kernel.org,
 jyri.sarha@iki.fi, yannick.fertre@foss.st.com, Xinhui.Pan@amd.com,
 sw0312.kim@samsung.com, hjc@rock-chips.com, christian.koenig@amd.com,
 kyungmin.park@samsung.com, philippe.cornu@foss.st.com,
 alexander.deucher@amd.com, tiantao6@hisilicon.com, shawnguo@kernel.org
Message-ID: <03e349b3-f805-9aa8-14a7-96e674011c3a@suse.de>
Subject: Re: [PATCH v2 00/22] Deprecate struct drm_device.irq_enabled
References: <20210622141002.11590-1-tzimmermann@suse.de>
 <YNILtLMkI3uoH7mJ@pendragon.ideasonboard.com>
In-Reply-To: <YNILtLMkI3uoH7mJ@pendragon.ideasonboard.com>

--VpqofwZZWokdR6MNHNIH0htxV9CnMA5E8
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable



Am 22.06.21 um 18:11 schrieb Laurent Pinchart:
> Hi Thomas,
>=20
> Thank you for the patches.
>=20
> On Tue, Jun 22, 2021 at 04:09:40PM +0200, Thomas Zimmermann wrote:
>> Remove references to struct drm_device.irq_enabled from modern
>> DRM drivers and core.
>>
>> KMS drivers enable IRQs for their devices internally. They don't
>> have to keep track of the IRQ state via irq_enabled. For vblanking,
>> it's cleaner to test for vblanking support directly than to test
>> for enabled IRQs.
>>
>> This used to be a single patch, [1] but it's now a full series.
>>
>> The first 3 patches replace instances of irq_enabled that are not
>> required.
>>
>> Patch 4 fixes vblank ioctls to actually test for vblank support
>> instead of IRQs.
>>
>> THe rest of the patchset removes irq_enabled from all non-legacy
>> drivers. The only exception is omapdrm, which has an internal
>> dpendency on the field's value. For this drivers, the state gets
>> duplicated internally.
>>
>> With the patchset applied, drivers can later switch over to plain
>> Linux IRQ interfaces and DRM's IRQ midlayer can be declared legacy.
>>
>> v2:
>> 	* keep the original test for legacy drivers in
>> 	  drm_wait_vblank_ioctl() (Daniel)
>>
>> [1] https://lore.kernel.org/dri-devel/20210608090301.4752-1-tzimmerman=
n@suse.de/
>>
>> Thomas Zimmermann (22):
>>    drm/amdgpu: Track IRQ state in local device state
>>    drm/hibmc: Call drm_irq_uninstall() unconditionally
>>    drm/radeon: Track IRQ state in local device state
>>    drm: Don't test for IRQ support in VBLANK ioctls
>>    drm/komeda: Don't set struct drm_device.irq_enabled
>>    drm/malidp: Don't set struct drm_device.irq_enabled
>>    drm/exynos: Don't set struct drm_device.irq_enabled
>>    drm/kirin: Don't set struct drm_device.irq_enabled
>>    drm/imx: Don't set struct drm_device.irq_enabled
>>    drm/mediatek: Don't set struct drm_device.irq_enabled
>>    drm/nouveau: Don't set struct drm_device.irq_enabled
>>    drm/omapdrm: Track IRQ state in local device state
>>    drm/rockchip: Don't set struct drm_device.irq_enabled
>>    drm/sti: Don't set struct drm_device.irq_enabled
>>    drm/stm: Don't set struct drm_device.irq_enabled
>>    drm/sun4i: Don't set struct drm_device.irq_enabled
>>    drm/tegra: Don't set struct drm_device.irq_enabled
>>    drm/tidss: Don't use struct drm_device.irq_enabled
>>    drm/vc4: Don't set struct drm_device.irq_enabled
>>    drm/vmwgfx: Don't set struct drm_device.irq_enabled
>>    drm/xlnx: Don't set struct drm_device.irq_enabled
>>    drm/zte: Don't set struct drm_device.irq_enabled
>=20
> The list seems to be missing armada, rcar-du and vkms. It would also be=

> nice to address i915 if possible.

Indeed. I grepped for \>irq_enabled. But some few drivers use=20
=2Eirq_enabled. I'll fix this in the patchset's next iteration. Thanks fo=
r=20
double checking.

Best regards
Thomas


--=20
Thomas Zimmermann
Graphics Driver Developer
SUSE Software Solutions Germany GmbH
Maxfeldstr. 5, 90409 N=C3=BCrnberg, Germany
(HRB 36809, AG N=C3=BCrnberg)
Gesch=C3=A4ftsf=C3=BChrer: Felix Imend=C3=B6rffer


--VpqofwZZWokdR6MNHNIH0htxV9CnMA5E8--

--3WvZxzpHzwDdgKIhf5CsBVuKNwIjhuqGE
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsF5BAABCAAjFiEExndm/fpuMUdwYFFolh/E3EQov+AFAmDS2L4FAwAAAAAACgkQlh/E3EQov+DU
wBAAw45Ui6qNyMQ6l7x7FjeKz6BOxeL/3pFiEg6QBuIF3dcF1K/av6JC94zL+kHXKPKf8RL0kK6R
llSacrxSur3jN59j06sLSWaj+i6zIfcJnZGVC0gc943dR4mqoXM3xY2lbxKjscSbT4ZAnNRAueqe
aVPvREhaES8K8dUdi1SvXbPGYu0SFpncaamo2SjRwCpsgaBuqR/en65vDdOMMZXF7wvON+UVnLDO
eNmXxqxe6J4nAaMej8d05VkTFbGjnMQRYFNpml0jme9KeCIidOWuhiTn8B2TfJflgozLDLSuI9Oc
HrAUMfEi/ylWg3AYV/7kw0sOHPK0u2yPy/o4y5rMkZE0WUC6r0quMB77bAHZvCBtotod2P85oVoY
6aspu2FDzpID6HrFcsBr9mY/3AVMJD1OFWrK7GvzTfhuY22oEiNr5iE6VccabOn0Sh2UkCU/ZV1u
NmlpoaRQm1ha7gITQisOwkps5C+gE5Cazo8hFAbJ0kalSzXr7JA2sifCm8GN5qtHnRpFv2UxfceG
XMbscIhcKgiIDQU4PksI0w4o7/u0pKVfb7JA2NzNqwItMDAITSJk083kJXrNqPXRZZlLTX+U25SN
rtpXlEe13EoOtMeXDiZP2rn7CZmWoFQrgsmTKOUrBPWMMpfr9PMgakJNUBThOirbykuQ+SrNpYgt
rgY=
=zLOG
-----END PGP SIGNATURE-----

--3WvZxzpHzwDdgKIhf5CsBVuKNwIjhuqGE--


--===============8327803679971440181==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek

--===============8327803679971440181==--

