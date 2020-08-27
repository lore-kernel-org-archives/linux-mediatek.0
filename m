Return-Path: <SRS0=xkEi=CF=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.0 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C6036C433DF
	for <linux-mediatek@archiver.kernel.org>; Thu, 27 Aug 2020 15:45:22 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 966932087D
	for <linux-mediatek@archiver.kernel.org>; Thu, 27 Aug 2020 15:45:22 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="K+/uE3Gp";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="AMPa8N1A"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 966932087D
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Type:Cc:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=KZgTXHPO+wOrOuz/IQXj/vJiyDeYiwE5P0ZerLGE/90=; b=K+/uE3GprlyzKrjbyznoWLv/p
	omlyVgveJSpAj6WNLG9sgyWs2YM9IBmrjUvhd1N0Pc+rn0CLxR1fXc288cWf264gHKopKrhS5IUok
	T5OUYQ1qi0Zl+gMHD0sUA6QutDSOhscG/IFNlJ1jftZ2kTpge+Jxhmqim6YVB1BMzP18CSFrpxY4q
	37DTxwuUSHevmWEL9/f70ndebnlX20rt/w5xxwX/uNWnRw4h/mSoVMNMHcxGZrOP4mlBQx8XbHcmM
	onMK7+aKTSMnq2XbTAXQZaXL7PsWXVyvrxbX9SLACkvxYHcoqyOlHNHwl39bpcP+fxFzYwAFHaD+E
	kE1qmYxLQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kBK5Q-00079r-4x; Thu, 27 Aug 2020 15:45:12 +0000
Received: from mail-ed1-x544.google.com ([2a00:1450:4864:20::544])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kBK5L-00077q-HT; Thu, 27 Aug 2020 15:45:08 +0000
Received: by mail-ed1-x544.google.com with SMTP id q4so5353729eds.3;
 Thu, 27 Aug 2020 08:45:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=74Ao/c7oeFoBT1F8v8BlKUziYBzWC4YEYws/h439jKs=;
 b=AMPa8N1AoD9YB7fIeGgmF/cNowE7jTvmdnSlHkNXqWgTuHGj1LDyz6RY9dorKnL/fN
 Z30pyVOeUrs4fDWQn3hrs1dZvRxrbplQZbImRrNJNHdCgPH/5mhyGT43pJeH7xkrp6Sb
 MZBcScUrs/MJyLn42oxJRGaNJrvbJexbN1cPg2Cxkb3XtnP+LC3+ovtJFuj8hqptSUOv
 CcXCkksNHNjATY9ob/FlyIIO46cj2X4u3uwybNf4+PMBFfX+68NaraOwOxzF+DfICVCM
 VN25BNvOEthy10Y2DCDS0ilfaqRXmZ3ernBzLlAAUqcBNegk+XnORCZVVMope4D1TZQ+
 iXvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=74Ao/c7oeFoBT1F8v8BlKUziYBzWC4YEYws/h439jKs=;
 b=K8GujqJzVJ0e/K36B9TTQN106xi7W2RUapFsKXAtoyH+1GhoVBLtvQPXxP/kpV0ZyP
 BAlBOZQfbkumcZzuQkn+nHpt9yR4R7leie2k76f3rCfYznfzvicwk1EaJNZrhiQb432a
 63FuySgl8UBxSxGmZ2nhwm80yk2OlRWQMfoqLQ+ay+OpKog2HSAOjdAn3BDntu2yQ7sW
 TVQkQMxONZFBIxn0/x1r/x3EziBiCjv1CltsS8RVAsPIcbi1TbeTXzMAqtow5dLI6Vhi
 CTYn7eNCnU5j4Tz7fJ9xhTyzW6U+/MFMkno2fikAkTmbtkpJjKfBLcs1xPVxZPUlNehh
 qhig==
X-Gm-Message-State: AOAM532SfhiYHCqDeKZTV4AumjTUPC73OmMGcvT1OLZgGM0ml00iO12B
 Jj5bOt7BcbwDBQm1D6h8S6k=
X-Google-Smtp-Source: ABdhPJxRtAe6Y1ma+0338eCNyd9I0m6G1oP+UGM2tA/8xgx0U3OYLFtKYBAAwxNFg0VrZz+x/RmEmw==
X-Received: by 2002:a05:6402:3088:: with SMTP id
 de8mr20472098edb.88.1598543104973; 
 Thu, 27 Aug 2020 08:45:04 -0700 (PDT)
Received: from localhost ([62.96.65.119])
 by smtp.gmail.com with ESMTPSA id u4sm1804409edt.11.2020.08.27.08.45.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 27 Aug 2020 08:45:03 -0700 (PDT)
Date: Thu, 27 Aug 2020 17:45:02 +0200
From: Thierry Reding <thierry.reding@gmail.com>
To: Robin Murphy <robin.murphy@arm.com>
Subject: Re: [PATCH 13/18] iommu/tegra: Add IOMMU_DOMAIN_DMA support
Message-ID: <20200827154502.GA1660457@ulmo>
References: <cover.1597931875.git.robin.murphy@arm.com>
 <cd11bc7851dbe46db6d14821a942678047331913.1597931876.git.robin.murphy@arm.com>
MIME-Version: 1.0
In-Reply-To: <cd11bc7851dbe46db6d14821a942678047331913.1597931876.git.robin.murphy@arm.com>
User-Agent: Mutt/1.14.6 (2020-07-11)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200827_114507_617882_ACB24EE5 
X-CRM114-Status: GOOD (  18.03  )
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
Cc: geert+renesas@glider.be, dri-devel@lists.freedesktop.org,
 bjorn.andersson@linaro.org, linux-tegra@vger.kernel.org,
 laurent.pinchart@ideasonboard.com, digetx@gmail.com, s-anna@ti.com,
 will@kernel.org, hch@lst.de, m.szyprowski@samsung.com,
 linux-samsung-soc@vger.kernel.org, joro@8bytes.org, magnus.damm@gmail.com,
 linux@armlinux.org.uk, jonathanh@nvidia.com, agross@kernel.org,
 yong.wu@mediatek.com, kyungmin.park@samsung.com, linux-media@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, inki.dae@samsung.com, vdumpa@nvidia.com,
 linux-mediatek@lists.infradead.org, matthias.bgg@gmail.com,
 linux-arm-kernel@lists.infradead.org, sw0312.kim@samsung.com,
 linux-kernel@vger.kernel.org, t-kristo@ti.com,
 iommu@lists.linux-foundation.org
Content-Type: multipart/mixed; boundary="===============6865827141050661655=="
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org


--===============6865827141050661655==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="YiEDa0DAkWCtVeE4"
Content-Disposition: inline


--YiEDa0DAkWCtVeE4
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Aug 20, 2020 at 04:08:32PM +0100, Robin Murphy wrote:
> Now that arch/arm is wired up for default domains and iommu-dma,
> implement the corresponding driver-side support for DMA domains.
>=20
> Signed-off-by: Robin Murphy <robin.murphy@arm.com>
> ---
>  drivers/iommu/tegra-smmu.c | 37 +++++++++++++++++++++----------------
>  1 file changed, 21 insertions(+), 16 deletions(-)

We can't do that yet because it will currently still break for use-cases
such as display where we don't properly set up identity mappings during
boot. The result is that the dma-iommu code will enable translations
before the driver gets a chance to set up any mappings and if the
display controller was left on by the bootloader, scanning out a splash
screen, this causes faults between the point where dma-iommu is being
set up for the display controller and where the display controller
starts mapping its own buffers (rather than the ones mapped by the
bootloader).

That said, I do have a series that I've been carrying around for longer
than I've wanted that does exactly this for Tegra SMMU and I'd prefer if
you could drop this particular change from your series so that I can
keep working on resolving the identity mapping issues first.

Thierry

--YiEDa0DAkWCtVeE4
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAl9H1PwACgkQ3SOs138+
s6GMrhAAqb0k0/ZQ/J5VIibNnM1oZSG1CTD/3tuwm94u1T1J++b71xlQpN0U7Fru
gJNX22olSrdpzdecS9LQ3Twqu4qgPzLazvenfBLxxrDuwS466j3hbbW8cG1Tlb/m
6lEbacziO0f91GP7ao5dAG0HIPZvIYfU1PIA/eOPnBcOlFVvWVfCnN6gOjPOSocz
20X/S1W6d5Jo7x2T0PtA0TFpD9BZVzjZA2q9XVzPSxkqLfEVMU00Yp/TnHySfWJ3
+sfRxeaUl5Ysjrtkd5YeFoIGlVctyKIKtGCIR60HU4bPlB4cdaVaaJBVkJAM7kQh
p+UGnGgl09/DyAe57qVaEWsbcXwHaxeveFmdjMHn9y0veGidzQPg0KtDUL2k7D3V
NXHKnets8HdkODT8PjTSbS3ELLEHf1GxsYAcR9aHvV1FLMl3c/8ZmMA1RZ5CIAbD
rmFaxQENmVHUev0lQnwlYP7Wwt2YyXc62L9UfyhrIkQjHmm/D+uIlPmjkr/YDreI
xndQ7H0OgVFKuc9nfSpnBOgIEeLDNr2AA59wzUxHikB+5MfDyxOk5TqnsjdcqSqr
b8257AC5ZWe79OOD0/hwDAlmSlx/hB3lO2kmm3BhLX+5tOTQv7vTSgr9BTppkZrD
dQHiT2TjMsiQyBhXhceazD0hhSAC3MSh1+TpgLDrBy2Sh96zUQ8=
=Dzgn
-----END PGP SIGNATURE-----

--YiEDa0DAkWCtVeE4--


--===============6865827141050661655==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek

--===============6865827141050661655==--

