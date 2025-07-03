Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 30CB1C83F03
	for <linux-mediatek@archiver.kernel.org>; Thu,  3 Jul 2025 21:00:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=af1gXahHDj3+vTGl3zYYql5gtv9egPIFOeLtJr5k0gc=; b=WP73CGs2+1dC+roSLxG8yyvlpG
	Wc69DBDvw0g1PG/LMbB6T7WYz5CWqwMRmWyNhdacNM+NofahFUNTUeAZ3fcb9g/FLAFN0mN8/o33K
	e5gdMUOC7ErAKLoSz/G//vMQGw3dtAbpwc3kJ0muBDPvQG8YLsTae6sk2EdQLDKZnadeL8bz8ZFne
	gGApCp4dG+u5xHydvre7CAM2lyi4vGKhyp0Jz1MCqc5XiipUor1hHedBiuWaswceDvQHXpNupG8cY
	d2DjG8DOXpr69ZgJWFdl7sLSYazmSABb2n8lYbGARYFuh1qV6QmzsVdLNZsujmWND+s48lJSUecP6
	Q642/1Nw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uXR2L-0000000CXZ3-2iOG;
	Thu, 03 Jul 2025 21:00:05 +0000
Received: from mail-ej1-x62a.google.com ([2a00:1450:4864:20::62a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uXN0Y-0000000C1qT-0EY7
	for linux-mediatek@lists.infradead.org;
	Thu, 03 Jul 2025 16:41:59 +0000
Received: by mail-ej1-x62a.google.com with SMTP id a640c23a62f3a-ae0c571f137so14716866b.0
        for <linux-mediatek@lists.infradead.org>; Thu, 03 Jul 2025 09:41:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1751560916; x=1752165716; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=af1gXahHDj3+vTGl3zYYql5gtv9egPIFOeLtJr5k0gc=;
        b=FgtYaiKyAEHsUturd+FvsZsqgS7gAnLHFpzoLyQTIs0iCxBk2po5nLOtrQfpcYIDVQ
         Yw/CW6heNyo/aiMpPgHGvnb6Y4oI7WXG5vKJJc+gmIlGKLSPXIQs93NlxHo+0c8m3INr
         pLUFqihzCRSaBrX/kOUL9ghZ5R9Y8p81UyeqNHdFoU1+4Lwv4MK8dT33WqGbMF2cNkEU
         1cBgSS8BN130753tqR9P/AaUMwXfolf4PtmD7XTrFrtAS6kxNmFHstNjTqWghSFZ9m/f
         Gp0Ikjh7cW55Ltl3rz4UF+fqurJg+JYuR4qN3zdUCTyuQAz5OhDSsgbD/WJ6pjDoPR96
         iH2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751560916; x=1752165716;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=af1gXahHDj3+vTGl3zYYql5gtv9egPIFOeLtJr5k0gc=;
        b=UD7rrVgVunoASLRuezErLivlVlttqaFP9QLjjA8zjyMinzCyEkUkmlWI48aQYhFvql
         nt6x6u/p5jPsphXGTskBIE8izNQnm4oLYuZ6nfI9fF3okMZPivB0NPSX1QJUyt1FgwGw
         gGbsggsZ98IMwgnq6eWKIQdFFwpwN/2uXuipkzFao4htnOJW8/X6tEIl/60q7aDxZdON
         toJhPV3G5J1VOy1JsiqZu7UEzY2SPtcgKK4KVoHfQkG2/4qioNp7AZ+ujWwur1uBDgCH
         1P0mfujDxK6oXrZVyeatMw5pKuzisFnUy7O5KavzzGDm9qcaP/5JySGPd0v9qTLqaOtL
         sbqg==
X-Forwarded-Encrypted: i=1; AJvYcCWQT7bLb5FWNvf0nD8b+hXbT3vLumqg/ZFZin3ulx9IJQFBbmzOpo4DHiiKAU/jY7rZUDfsAr8LCj1UsYL0yA==@lists.infradead.org
X-Gm-Message-State: AOJu0YydzgUYEU3EwhiA1vodmGPU/cT6NJzuYIFcZZT/dQXH+dODj9xH
	phUn/zgSMXGWmW7HVpBy9kP8hvxYahwgoe5IgnJgYbxeTjRrrShJawZwmedHIV4InD8=
X-Gm-Gg: ASbGncuIUfmEPFNdE5wFiSLOhoCZga9sX7wQ2jOWX0DLaDpmJWMv9oxgWEq5cWF+Atl
	+/u4Yri7dxA7tiTR8iSPwKy0Y0ncSCAAmMzD7rZceFWEJKzSY8VdzGb8ICKS9H94MqG4zUqnQrE
	AL7L2a4eexJ/FprHYmIDHK48JRu2tdet4jlvYpWGb2paiisV+FOMX6sUwJ4uziVW33A+VTVPIYq
	tQC/hCr2XSUyT3uovlammvX8qZ0+qTctECtNJQo9w+UOeIEV6wF8nISBhkelqvQmNJyHgCHzxzp
	1R+0jHB3y8QKPDe0WvZ/mvFdAUzi/Kp6tGlR8FKglddvH3PU0onr80dZdGpkAoCNlGCz6UIa1Qc
	wL9wn5bpkpWPqhaJV16FhDH6PiSv9
X-Google-Smtp-Source: AGHT+IG1Q6T7zYtraRTxu4LE7BnHzIirGKXY1QxEhawuvlIUwK7MxzBM9eQBF4eG96mIbzTvlvveTQ==
X-Received: by 2002:a17:906:eecd:b0:ad8:9b5d:2c1e with SMTP id a640c23a62f3a-ae3d8c9dcb1mr434769866b.29.1751560915895;
        Thu, 03 Jul 2025 09:41:55 -0700 (PDT)
Received: from localhost (p200300f65f06ab0400000000000001b9.dip0.t-ipconnect.de. [2003:f6:5f06:ab04::1b9])
        by smtp.gmail.com with UTF8SMTPSA id a640c23a62f3a-ae3f6958586sm5003066b.72.2025.07.03.09.41.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Jul 2025 09:41:55 -0700 (PDT)
Date: Thu, 3 Jul 2025 18:41:53 +0200
From: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>
To: Yong Wu <yong.wu@mediatek.com>
Cc: Krzysztof Kozlowski <krzk@kernel.org>, 
	Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, linux-mediatek@lists.infradead.org, 
	linux-arm-kernel@lists.infradead.org, Louis-Alexis Eyraud <louisalexis.eyraud@collabora.com>, 
	iommu@lists.linux.dev
Subject: Re: NULL pointer exception in drivers/memory/mtk-smi.c
Message-ID: <lri2gdwioe3on3unzrnmezv4pnxke6lmixrsvargeupdcywweo@j6xoz36xjdoh>
References: <allge3h2abtjfj77idsnwccurxi2jnbcv6qcxar5f5m3jjmpvs@a4mmfghdhtv4>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="mmnkz7o7pwgteghy"
Content-Disposition: inline
In-Reply-To: <allge3h2abtjfj77idsnwccurxi2jnbcv6qcxar5f5m3jjmpvs@a4mmfghdhtv4>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250703_094158_186831_5CD55484 
X-CRM114-Status: GOOD (  19.02  )
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


--mmnkz7o7pwgteghy
Content-Type: text/plain; protected-headers=v1; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: NULL pointer exception in drivers/memory/mtk-smi.c
MIME-Version: 1.0

Hello,

[expanding the audience a bit according to the drivers that are involved
now that the problem is better understood]

On Tue, Jun 17, 2025 at 05:18:30PM +0200, Uwe Kleine-K=F6nig wrote:
> on a 6.16-rc2 kernel running on an mt8365-evk I occasionally hit the
> following during boot:

I invested some time now to understand the issue. So here comes what I
understood, maybe that helps someone to spot the fix to the described
problem.=20

With a configuration that has all drivers built-in but

	CONFIG_DRM_MEDIATEK=3Dm
	CONFIG_MTK_IOMMU=3Dm

and=20

diff --git a/drivers/iommu/mtk_iommu.c b/drivers/iommu/mtk_iommu.c
index cb95fecf6016..d4320db7cd2d 100644
--- a/drivers/iommu/mtk_iommu.c
+++ b/drivers/iommu/mtk_iommu.c
@@ -1387,14 +1387,15 @@ static int mtk_iommu_probe(struct platform_device *=
pdev)
 		goto out_list_del;
=20
 	ret =3D iommu_device_register(&data->iommu, &mtk_iommu_ops, dev);
 	if (ret)
 		goto out_sysfs_remove;
=20
 	if (MTK_IOMMU_IS_TYPE(data->plat_data, MTK_IOMMU_TYPE_MM)) {
+		msleep(10000);
 		ret =3D component_master_add_with_match(dev, &mtk_iommu_com_ops, match);
 		if (ret)
 			goto out_device_unregister;
 	}
 	return ret;
=20
 out_device_unregister:

I can reliably trigger the race.

With that sleep in place iommu_device_register() completes quickly which
enables probing of the devices with drivers contained in the
drm_mediatek module (because the modules are loaded in parallel on
a different CPU).

Then generic driver code calls resume on all suppliers for devices to
bind, among them the four larb devices. However due to
component_master_add_with_match() not being called yet, the larb devices
are not yet bound to the iommu device and so larb->mmu is still NULL.
The latter is a problem in mtk_smi_larb_config_port_gen2_general() which
is called from mtk_smi_larb_resume().

I don't know what the right fix here is, but maybe someone else does?

Best regards
Uwe

--mmnkz7o7pwgteghy
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEP4GsaTp6HlmJrf7Tj4D7WH0S/k4FAmhmss4ACgkQj4D7WH0S
/k4xfAgAo8//U5/g2i21yMqMBVXTs2xxgBcBuLMjuj7nazzxU/t2NCbyfDBSYY5b
VnbwhSsyWIShTgehlQ9KqlgvwmeDuArdtjNsmsG6XaNAbC2xmgo0qy8g1M20Bhpu
cPoHpbn2a7Do99/XlSCJseysvIBKIEBndBl6tC8gmVRFSCw4DttijBeKN/Kaj9Is
fGGhKbdv0NCywa9YanAX/WlkxWspmvpiCMM3uKa2r/PlYJ31PsgD5eWQv9XpSvSC
EkHtXWh5Ykq4YYaadFi6ZI5B8Hx7mTlaDH08SZmgKSzc0UfdVl3qG8YnKBiAuH8Y
1Q6g+GM7xC3yvyyGwYYPyvMPRDSyyw==
=s/aj
-----END PGP SIGNATURE-----

--mmnkz7o7pwgteghy--

