Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 82E3DC52D7C
	for <linux-mediatek@archiver.kernel.org>; Wed, 21 Aug 2024 14:15:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=SOkQG3VkUso1q/ai4BDFbnihITgYf0r/4EYsZR0TJmM=; b=dBeAKq4BLJXKAjPAft7S5NUAGZ
	jT4y7FTDi2V/Z4O/3hMbMcga6j9JR1cpT3zb7nxSjV2/+3vMjyBLeQ0Z+e4DvBT4oGW7xSTcxvHwD
	qGN+sz/jhbvbjE4A0lSBnDWmLuTn4zKPIPqAFsIu4RhEFIQG0C+kdbv828svJ0qgrSDbeqwVOG5Is
	NICR2BLrjdDpSYTgITPBtgySaSNvn5FR24DVX607OA9C/gKYHCd3KiDDEzaoqqi+wD3R/zVK+Lb03
	xU4nTTz6/KYyhhnYSlXhy98B9an2labXG+M9Tlpk4wNkRhni6kcvpxa9LDSCyZsHkXd5ml4pBK2CV
	zd0q2rcw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sgm7n-00000009FiE-0SWz;
	Wed, 21 Aug 2024 14:15:47 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sgl2C-000000092XD-0bmr
	for linux-mediatek@lists.infradead.org;
	Wed, 21 Aug 2024 13:05:57 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id A40DF61025;
	Wed, 21 Aug 2024 13:05:55 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 65341C4AF09;
	Wed, 21 Aug 2024 13:05:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1724245555;
	bh=p1sqhjD4ylWmvdHtvSuqQze9HeUw+IqVr9VtYWgAGQQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Ub76omb58LU9FAOeH6aF7vfnxlc2vty9US0MbTYdioZQlSuVTmU28OTQkCMn6z29/
	 11xXCIz7FRRAlNmbbgKIJdCq2VX4Exf7QjHTssyMAAZO+p59WnSxQKzZP3ym8chFsn
	 d6chje2FYLJ/niIIZ2ZOKbizJxSgewSpBbFXKqqq6f8Wiftad0hUNMGTdOxl9z5azH
	 o34L2yHXKYzrEXszqEmVjxAoNZVOpLobko1m2WMotj2N9IYkyVMIS77QDZq6EaPE89
	 o+AJbAVkfDKvul8tGU1hTIqy17ygpiH1/dgXiDISle8lKrUveDfe9A2aRDVemuS5jL
	 mq17N8IiNP5/w==
Date: Wed, 21 Aug 2024 14:05:50 +0100
From: Mark Brown <broonie@kernel.org>
To: Zhang Yi <zhangyi@everest-semi.com>
Cc: alsa-devel@alsa-project.org, angelogioacchino.delregno@collabora.com,
	tiwai@suse.com, amadeuszx.slawinski@linux.intel.com,
	linux-mediatek@lists.infradead.org, yangxiaohua@everest-semi.com,
	zhuning@everest-semi.com
Subject: Re: [RESEND] ASoC: mediatek: mt8188-mt6359: Modify key
Message-ID: <e71cf2e2-9b66-4bc8-825a-6ccb7925ff8e@sirena.org.uk>
References: <20240821074051.3165-1-zhangyi@everest-semi.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="pd3ireFZcx+QdBZM"
Content-Disposition: inline
In-Reply-To: <20240821074051.3165-1-zhangyi@everest-semi.com>
X-Cookie: You are false data.
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240821_060556_331405_ED88E133 
X-CRM114-Status: GOOD (  11.02  )
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


--pd3ireFZcx+QdBZM
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed, Aug 21, 2024 at 03:40:51PM +0800, Zhang Yi wrote:
> In order to get the correct keys when using the ES8326.We will associate
> SND_JACK_BTN_1 to KEY_VOLUMEUP and SND_JACK_BTN_2 to KEY_VOLUMEDOWN
> when the ES8326 flag is recognized.

Please please allow a reasonable time for review.  People get busy, go
on holiday, attend conferences and so on so unless there is some reason
for urgency (like critical bug fixes) please allow at least a couple of
weeks for review.

--pd3ireFZcx+QdBZM
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmbF5i0ACgkQJNaLcl1U
h9AdlwgAhUT6zTnsivKrOEqFNg3dfQuMKgCdroZ1gNv9o33yxO2IuAwy6YcEpxPf
ajqB/gwUGbypff2/+grXp/ucfxyxufPBy/Fd+XEy3brTWTAi+yXWLA3FuYFm9xKC
RttFSCSHcsgIVwAwyALWlMA+vKA30mtNXx3Nxe232iptx8+nDdCigimIegbpRjZn
0P0MO+jME3FK67YQUZvAuWxGQAtG+VVX17h/LMtS5D7c0hd5dKCL5c2IcgbGz5fP
oNjjZX1AoMT79OmSzp5ZAFmlKwlc8ds3MCbnpGsp2TxT0Qzmtl5wfSZQS2DnDNic
t+5yc/eu6KKp95Db8ILnyqwmscIesA==
=tV+5
-----END PGP SIGNATURE-----

--pd3ireFZcx+QdBZM--

