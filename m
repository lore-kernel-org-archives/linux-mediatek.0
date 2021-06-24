Return-Path: <SRS0=ohMe=LS=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.6 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 618CEC48BDF
	for <linux-mediatek@archiver.kernel.org>; Thu, 24 Jun 2021 12:58:01 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 22664613F6
	for <linux-mediatek@archiver.kernel.org>; Thu, 24 Jun 2021 12:58:01 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 22664613F6
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=suse.de
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:Date:Message-ID:From:References:Cc:To:Subject:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=H5VJELEWDXayqpofMe5sZVastLL2Rqtsu9alRCQ8Rrg=; b=MQT68PrWo92k7VeZeyVLeUleSC
	d6qcrcjmRbL/gAZc9UzgZ9bY5JNx4ku83UZf8cjCvf0YMKaeP6SNNw16fMoaXmcXYc9+1FdLFbs+t
	/dEMgM+LtWuyq/ydEkNf+xK+sjO4s9CADdNomNhiDLeYnoUO4GBRgDsLCA5sTcTsZBUIuI59aOgWI
	ET6d1nfZWf4sLvd5NYQKiwi6zUTJlJarJQwBD9EJQl4mailwYyvkOIVXwecQ5pKp0eVk9zRiLbnOr
	+1K39XEhjJyb/w9tM/3WXVn1FYnd8kweNYNSFg5EAbci9Mp3gj0x27qldgxbSasSYE6exFUFcdpA1
	w6jn2T+w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1lwOvX-00EiQR-9Y; Thu, 24 Jun 2021 12:57:51 +0000
Received: from smtp-out2.suse.de ([195.135.220.29])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1lwOvU-00EiPC-FE; Thu, 24 Jun 2021 12:57:50 +0000
Received: from imap.suse.de (imap-alt.suse-dmz.suse.de [192.168.254.47])
 (using TLSv1.2 with cipher ECDHE-ECDSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 7CFC81FD40;
 Thu, 24 Jun 2021 12:57:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1624539466; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=nlRQ0RGts2fg2n9D/bEIlhwvWJbNJH9fkaGW/6cqJVk=;
 b=u3LjD6oZssj/mJkoGStiSAvIHllAs+WCZqbgI6BOg34/wy6NHBbzTQ1JSVyR10sH/NyAAw
 pJl/nhBITtCxww7p96mvF926pQTQ0Gnk+voDz/USxmzhEd10NSPQzg7wj0bremchN+1FAC
 43RglR2P5jMZtZBUFtwX3C3sZNzp5eg=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1624539466;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=nlRQ0RGts2fg2n9D/bEIlhwvWJbNJH9fkaGW/6cqJVk=;
 b=skIn5fqMc0iuV1PMO3x3WjCWGfF0W6cyrE+GtqtdFjaVEN9HzBM8/z3ojcgJYirCjjhOr/
 y3pCmtMNeAOKcwCA==
Received: from imap3-int (imap-alt.suse-dmz.suse.de [192.168.254.47])
 by imap.suse.de (Postfix) with ESMTP id 81AF511A97;
 Thu, 24 Jun 2021 12:57:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1624539466; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=nlRQ0RGts2fg2n9D/bEIlhwvWJbNJH9fkaGW/6cqJVk=;
 b=u3LjD6oZssj/mJkoGStiSAvIHllAs+WCZqbgI6BOg34/wy6NHBbzTQ1JSVyR10sH/NyAAw
 pJl/nhBITtCxww7p96mvF926pQTQ0Gnk+voDz/USxmzhEd10NSPQzg7wj0bremchN+1FAC
 43RglR2P5jMZtZBUFtwX3C3sZNzp5eg=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1624539466;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=nlRQ0RGts2fg2n9D/bEIlhwvWJbNJH9fkaGW/6cqJVk=;
 b=skIn5fqMc0iuV1PMO3x3WjCWGfF0W6cyrE+GtqtdFjaVEN9HzBM8/z3ojcgJYirCjjhOr/
 y3pCmtMNeAOKcwCA==
Received: from director2.suse.de ([192.168.254.72]) by imap3-int with ESMTPSA
 id V0K6HkmB1GBJTAAALh3uQQ
 (envelope-from <tzimmermann@suse.de>); Thu, 24 Jun 2021 12:57:45 +0000
Subject: Re: [PATCH v3 04/27] drm: Don't test for IRQ support in VBLANK ioctls
To: Jani Nikula <jani.nikula@linux.intel.com>,
 Thierry Reding <thierry.reding@gmail.com>
Cc: hamohammed.sa@gmail.com, emma@anholt.net, airlied@linux.ie,
 nouveau@lists.freedesktop.org, rodrigo.vivi@intel.com, liviu.dudau@arm.com,
 alexandre.torgue@foss.st.com, dri-devel@lists.freedesktop.org,
 michal.simek@xilinx.com, melissa.srw@gmail.com, linux-tegra@vger.kernel.org,
 laurent.pinchart@ideasonboard.com, benjamin.gaignard@linaro.org,
 linux@armlinux.org.uk, mihail.atanassov@arm.com,
 linux-stm32@st-md-mailman.stormreply.com, linux-samsung-soc@vger.kernel.org,
 jy0922.shim@samsung.com, krzysztof.kozlowski@canonical.com,
 linux-rockchip@lists.infradead.org, linux-mediatek@lists.infradead.org,
 wens@csie.org, jernej.skrabec@gmail.com, jonathanh@nvidia.com,
 xinliang.liu@linaro.org, kong.kongxinwei@hisilicon.com,
 james.qian.wang@arm.com, linux-imx@nxp.com,
 Daniel Vetter <daniel.vetter@ffwll.ch>,
 linux-graphics-maintainer@vmware.com, intel-gfx@lists.freedesktop.org,
 bskeggs@redhat.com, chunkuang.hu@kernel.org, puck.chen@hisilicon.com,
 s.hauer@pengutronix.de, rodrigosiqueiramelo@gmail.com,
 laurentiu.palcu@oss.nxp.com, matthias.bgg@gmail.com, kernel@pengutronix.de,
 linux-arm-kernel@lists.infradead.org, mcoquelin.stm32@gmail.com,
 amd-gfx@lists.freedesktop.org, hyun.kwon@xilinx.com, tomba@kernel.org,
 jyri.sarha@iki.fi, yannick.fertre@foss.st.com, Xinhui.Pan@amd.com,
 sw0312.kim@samsung.com, hjc@rock-chips.com, christian.koenig@amd.com,
 linux-sunxi@lists.linux.dev, kyungmin.park@samsung.com,
 kieran.bingham+renesas@ideasonboard.com, philippe.cornu@foss.st.com,
 alexander.deucher@amd.com, tiantao6@hisilicon.com, shawnguo@kernel.org
References: <20210624072916.27703-1-tzimmermann@suse.de>
 <20210624072916.27703-5-tzimmermann@suse.de> <87im23u1ok.fsf@intel.com>
 <b5e7729f-ed11-e9ca-386e-562feb2bd2b7@suse.de> <877dijtzl2.fsf@intel.com>
 <af21db75-584f-aec0-9659-d5386f27b4ea@suse.de>
 <YNR0m2DJsdIW3NAZ@orome.fritz.box> <87zgvfsalz.fsf@intel.com>
From: Thomas Zimmermann <tzimmermann@suse.de>
Message-ID: <0b0b7cda-9808-f0ed-4122-2d8eeaa8f7c3@suse.de>
Date: Thu, 24 Jun 2021 14:57:44 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <87zgvfsalz.fsf@intel.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210624_055748_718378_B71A2398 
X-CRM114-Status: GOOD (  21.79  )
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
Content-Type: multipart/mixed; boundary="===============5734101406820371914=="
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--===============5734101406820371914==
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="uZAbLLO6gAsgbliLJ4wVdD8Q3Prh3JDl0"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--uZAbLLO6gAsgbliLJ4wVdD8Q3Prh3JDl0
Content-Type: multipart/mixed; boundary="lmd8tCC7cJwEr0gUau7cSsDcSUmocjFNc";
 protected-headers="v1"
From: Thomas Zimmermann <tzimmermann@suse.de>
To: Jani Nikula <jani.nikula@linux.intel.com>,
 Thierry Reding <thierry.reding@gmail.com>
Cc: hamohammed.sa@gmail.com, emma@anholt.net, airlied@linux.ie,
 nouveau@lists.freedesktop.org, rodrigo.vivi@intel.com, liviu.dudau@arm.com,
 alexandre.torgue@foss.st.com, dri-devel@lists.freedesktop.org,
 michal.simek@xilinx.com, melissa.srw@gmail.com, linux-tegra@vger.kernel.org,
 laurent.pinchart@ideasonboard.com, benjamin.gaignard@linaro.org,
 linux@armlinux.org.uk, mihail.atanassov@arm.com,
 linux-stm32@st-md-mailman.stormreply.com, linux-samsung-soc@vger.kernel.org,
 jy0922.shim@samsung.com, krzysztof.kozlowski@canonical.com,
 linux-rockchip@lists.infradead.org, linux-mediatek@lists.infradead.org,
 wens@csie.org, jernej.skrabec@gmail.com, jonathanh@nvidia.com,
 xinliang.liu@linaro.org, kong.kongxinwei@hisilicon.com,
 james.qian.wang@arm.com, linux-imx@nxp.com,
 Daniel Vetter <daniel.vetter@ffwll.ch>,
 linux-graphics-maintainer@vmware.com, intel-gfx@lists.freedesktop.org,
 bskeggs@redhat.com, chunkuang.hu@kernel.org, puck.chen@hisilicon.com,
 s.hauer@pengutronix.de, rodrigosiqueiramelo@gmail.com,
 laurentiu.palcu@oss.nxp.com, matthias.bgg@gmail.com, kernel@pengutronix.de,
 linux-arm-kernel@lists.infradead.org, mcoquelin.stm32@gmail.com,
 amd-gfx@lists.freedesktop.org, hyun.kwon@xilinx.com, tomba@kernel.org,
 jyri.sarha@iki.fi, yannick.fertre@foss.st.com, Xinhui.Pan@amd.com,
 sw0312.kim@samsung.com, hjc@rock-chips.com, christian.koenig@amd.com,
 linux-sunxi@lists.linux.dev, kyungmin.park@samsung.com,
 kieran.bingham+renesas@ideasonboard.com, philippe.cornu@foss.st.com,
 alexander.deucher@amd.com, tiantao6@hisilicon.com, shawnguo@kernel.org
Message-ID: <0b0b7cda-9808-f0ed-4122-2d8eeaa8f7c3@suse.de>
Subject: Re: [PATCH v3 04/27] drm: Don't test for IRQ support in VBLANK ioctls
References: <20210624072916.27703-1-tzimmermann@suse.de>
 <20210624072916.27703-5-tzimmermann@suse.de> <87im23u1ok.fsf@intel.com>
 <b5e7729f-ed11-e9ca-386e-562feb2bd2b7@suse.de> <877dijtzl2.fsf@intel.com>
 <af21db75-584f-aec0-9659-d5386f27b4ea@suse.de>
 <YNR0m2DJsdIW3NAZ@orome.fritz.box> <87zgvfsalz.fsf@intel.com>
In-Reply-To: <87zgvfsalz.fsf@intel.com>

--lmd8tCC7cJwEr0gUau7cSsDcSUmocjFNc
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable

Hi

Am 24.06.21 um 14:36 schrieb Jani Nikula:
> On Thu, 24 Jun 2021, Thierry Reding <thierry.reding@gmail.com> wrote:
>> On Thu, Jun 24, 2021 at 11:07:57AM +0200, Thomas Zimmermann wrote:
>>> Hi
>>>
>>> Am 24.06.21 um 10:51 schrieb Jani Nikula:
>>>> On Thu, 24 Jun 2021, Thomas Zimmermann <tzimmermann@suse.de> wrote:
>>>>> Hi
>>>>>
>>>>> Am 24.06.21 um 10:06 schrieb Jani Nikula:
>>>>>> On Thu, 24 Jun 2021, Thomas Zimmermann <tzimmermann@suse.de> wrote=
:
>>>>>>> diff --git a/drivers/gpu/drm/drm_vblank.c b/drivers/gpu/drm/drm_v=
blank.c
>>>>>>> index 3417e1ac7918..10fe16bafcb6 100644
>>>>>>> --- a/drivers/gpu/drm/drm_vblank.c
>>>>>>> +++ b/drivers/gpu/drm/drm_vblank.c
>>>>>>> @@ -1748,8 +1748,16 @@ int drm_wait_vblank_ioctl(struct drm_devic=
e *dev, void *data,
>>>>>>>     	unsigned int pipe_index;
>>>>>>>     	unsigned int flags, pipe, high_pipe;
>>>>>>> -	if (!dev->irq_enabled)
>>>>>>> -		return -EOPNOTSUPP;
>>>>>>> +#if defined(CONFIG_DRM_LEGACY)
>>>>>>> +	if  (unlikely(drm_core_check_feature(dev, DRIVER_LEGACY))) {
>>>>>>> +		if (!dev->irq_enabled)
>>>>>>> +			return -EOPNOTSUPP;
>>>>>>> +	} else /* if DRIVER_MODESET */
>>>>>>> +#endif
>>>>>>> +	{
>>>>>>> +		if (!drm_dev_has_vblank(dev))
>>>>>>> +			return -EOPNOTSUPP;
>>>>>>> +	}
>>>>>>
>>>>>> Sheesh I hate this kind of inline #ifdefs.
>>>>>>
>>>>>> Two alternate suggestions that I believe should be as just efficie=
nt:
>>>>>
>>>>> Or how about:
>>>>>
>>>>> static bool drm_wait_vblank_supported(struct drm_device *dev)
>>>>>
>>>>> {
>>>>>
>>>>> if defined(CONFIG_DRM_LEGACY)
>>>>> 	if  (unlikely(drm_core_check_feature(dev, DRIVER_LEGACY)))
>>>>>
>>>>> 		return dev->irq_enabled;
>>>>>
>>>>> #endif
>>>>> 	return drm_dev_has_vblank(dev);
>>>>>
>>>>> }
>>>>>
>>>>>
>>>>> ?
>>>>>
>>>>> It's inline, but still readable.
>>>>
>>>> It's definitely better than the original, but it's unclear to me why=

>>>> you'd prefer this over option 2) below. I guess the only reason I ca=
n
>>>> think of is emphasizing the conditional compilation. However,
>>>> IS_ENABLED() is widely used in this manner specifically to avoid inl=
ine
>>>> #if, and the compiler optimizes it away.
>>>
>>> It's simply more readable to me as the condition is simpler. But opti=
on 2 is
>>> also ok.
>>
>> Perhaps do something like this, then:
>>
>> 	if (IS_ENABLED(CONFIG_DRM_LEGACY)) {
>> 		if (unlikely(drm_core_check_feature(dev, DRIVER_LEGACY)))
>> 			return dev->irq_enabled;
>> 	}
>>
>> 	return drm_dev_has_vblank(dev);
>>
>> That's about just as readable as the variant involving the preprocesso=
r
>> but has all the benefits of not using the preprocessor.
>=20
> Looks like a winner to me. :)

That's the most readable.

But I just remembered that irq_enabled will likely become legacy-only in =

the device structure. We'll need an ifdef variant then. :/

Best regards
Thomas

>=20
> BR,
> Jani.
>=20
>=20

--=20
Thomas Zimmermann
Graphics Driver Developer
SUSE Software Solutions Germany GmbH
Maxfeldstr. 5, 90409 N=C3=BCrnberg, Germany
(HRB 36809, AG N=C3=BCrnberg)
Gesch=C3=A4ftsf=C3=BChrer: Felix Imend=C3=B6rffer


--lmd8tCC7cJwEr0gUau7cSsDcSUmocjFNc--

--uZAbLLO6gAsgbliLJ4wVdD8Q3Prh3JDl0
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature"

-----BEGIN PGP SIGNATURE-----

wsF5BAABCAAjFiEExndm/fpuMUdwYFFolh/E3EQov+AFAmDUgUgFAwAAAAAACgkQlh/E3EQov+Bk
HA/9GKE6DtrNVTmNxi2Q1NuMTT4X0e/U8VAQ+IlFKl8xxDejBHRg5B2w4IWO1ryG0fVvwJTmulCJ
4oIF7texau6jTumwKhAXbRwUOjdRyO1EVchjVjZ9OCG9+pab1hN4k6aH8EmG1Jbk47pgPrcn72Eb
/Wk9L3GlqhVg/h5/gXnNXX7lE3N/zwms6VexWkqGXOQN8/eRK03NFHIaim9TH2ZwA52ePGCFxf7X
qGCSxGUsTDfpjp1wh7vHkZQu8Xob/WUqBe8VD4l6qSxXmaaK6GX8PkcR/KHSaEQTbT9+xeiaARfc
fL+AAzsKgwT7VHQiBtiDp+vTFSb7Smqb1njcV6XKoT22ChKIkwXgosP0un57vun3nbUCINjkSWhH
sIDquVu33/iLM0phsJJGzNBVZIZ/TKjNZLN0xKL14t3QCiGaPmgK2T4oIIddEpEWDpC44+ReNuG+
gmDsDDCGlph9N3IQ3hFbmZEbE3zq3wpoNZc8waPul0MIh3NP4oVXqFWKfZQHe5ZG2L+SsXA0mD3V
JQ4YgpDzpqDrPVZN3e7IDy5AIAq8lHKQ7HjDnk9BAeU07ugunwtotH8nLRpsxEoH2rqRPHWLbskz
MH+boqUIKPbGSWWh3OCLIsONS9XZR5dnZG2etdxPgteJRgWatYNmdaacVJzZt/epo1ZxEnEZXi3C
DRk=
=+AeC
-----END PGP SIGNATURE-----

--uZAbLLO6gAsgbliLJ4wVdD8Q3Prh3JDl0--


--===============5734101406820371914==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek

--===============5734101406820371914==--

