Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 05251C5AE5A
	for <linux-mediatek@archiver.kernel.org>; Wed, 28 Aug 2024 15:43:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Subject:References:In-Reply-To:Message-ID:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=XCKdPShM2BSsjoKUXd5jLwgut9vQqNvq4fosnc20z7A=; b=EZlSEXd31VQY1Goi0izfNT7o6D
	9IZgVCHsY5+SrcUebkg9WyOfBbkjJX3XV+W885Dq8ay7mi6TtgwPq75LrSfWMVidtv3/wnp/ZGCMc
	X4xMcd6xVnT93ycxv96pkn5/N8Gd8YsykZuesv2yAHGzFU53o4FEt/Q1nKhNKpLbM5ISFtLrHhDnN
	qXEitIYgDfg1hemJtEl8U8D2pUWYp/q2Ofibe3usLypJQ2qR3nSA4C2yBd3S8qvOdfzVJ1IO8+BF5
	L8SLzRi9cmOR0EDTGtXiNzA+Axw8hiScUkh2Go3L7jc6faBJhm3ZoEorqFvdo47PV0HnxmjjOAGb5
	hrhDWj5Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sjKpL-0000000G1yD-3lWk;
	Wed, 28 Aug 2024 15:43:19 +0000
Received: from sender4-pp-f112.zoho.com ([136.143.188.112])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sjKVn-0000000Fwzb-0O2s;
	Wed, 28 Aug 2024 15:23:08 +0000
ARC-Seal: i=1; a=rsa-sha256; t=1724858582; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=n/0UeusnXOCvaEaJ1nhapBysPWJg8696ZD22LhKwNOjMIrmhYm6Hh/g1hJ2z3QffkO4VuqYZoxTZXKLyZ/VTyATeBFUvyW/ZTdjjq0xEj/BL5lEofKZ3SyCH2dTGpVenvq19l/KefQXVK3WIUe8zflbpzEzhS3fqEqfVoADkWcY=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1724858582; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=XCKdPShM2BSsjoKUXd5jLwgut9vQqNvq4fosnc20z7A=; 
	b=OP92ZjLenjEMMDFT+eHK7WNuPjfEm8fEPF52kLJYyZgF60nuoeQ6TmTaNF/rShu+hbGPRqPXTNzN3OP53bxDne9Uq8QHMJ9MK/q3vMknoCQWTbv1dUAWmiKyoRQ0RKe4AwCrlVwpwPxUnOKdJQQDDrK4d1klaeYMRNqMVbpR76U=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=helen.koike@collabora.com;
	dmarc=pass header.from=<helen.koike@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1724858582;
	s=zohomail; d=collabora.com; i=helen.koike@collabora.com;
	h=Date:Date:From:From:To:To:Cc:Cc:Message-ID:In-Reply-To:References:Subject:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:Reply-To;
	bh=XCKdPShM2BSsjoKUXd5jLwgut9vQqNvq4fosnc20z7A=;
	b=Dzkh270iCgK9bLYwALngFlgSPGwMdPTS1B0v6XJC1P80G0jRtoqar0Eds6Zhlh12
	A6c93FpxNKjl5bogYxOE5VQ9ept63a2EgrUR6Vojrmsbfi6AhNbfmU3XHd//hy/UhZT
	8qK23+cNsxfQjZuN+ibJPBV//LGXRxKEljTN573A=
Received: from mail.zoho.com by mx.zohomail.com
	with SMTP id 17248585802298.455583977077822; Wed, 28 Aug 2024 08:23:00 -0700 (PDT)
Date: Wed, 28 Aug 2024 12:23:00 -0300
From: Helen Mae Koike Fornazier <helen.koike@collabora.com>
To: "Rob Clark" <robdclark@gmail.com>
Cc: "Vignesh Raman" <vignesh.raman@collabora.com>,
	"dri-devel" <dri-devel@lists.freedesktop.org>,
	"daniels" <daniels@collabora.com>, "airlied" <airlied@gmail.com>,
	"daniel" <daniel@ffwll.ch>,
	"guilherme.gallo" <guilherme.gallo@collabora.com>,
	"sergi.blanch.torne" <sergi.blanch.torne@collabora.com>,
	"deborah.brouwer" <deborah.brouwer@collabora.com>,
	"linux-mediatek" <linux-mediatek@lists.infradead.org>,
	"linux-amlogic" <linux-amlogic@lists.infradead.org>,
	"linux-rockchip" <linux-rockchip@lists.infradead.org>,
	"amd-gfx" <amd-gfx@lists.freedesktop.org>,
	"linux-arm-msm" <linux-arm-msm@vger.kernel.org>,
	"intel-gfx" <intel-gfx@lists.freedesktop.org>,
	"virtualization" <virtualization@lists.linux.dev>,
	"linux-kernel" <linux-kernel@vger.kernel.org>
Message-ID: <19199953cbf.ded17a68157355.1209172729493560159@collabora.com>
In-Reply-To: <CAF6AEGu-T4=3jPRcnq3BFBtfb_yhmWE2b8EgxgTm5Q0bqSv04Q@mail.gmail.com>
References: <20240820070818.1124403-1-vignesh.raman@collabora.com> <CAF6AEGu-T4=3jPRcnq3BFBtfb_yhmWE2b8EgxgTm5Q0bqSv04Q@mail.gmail.com>
Subject: Re: [PATCH v1] drm/ci: increase timeout for all jobs
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Importance: Medium
User-Agent: Zoho Mail
X-Mailer: Zoho Mail
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240828_082307_211167_88FDA973 
X-CRM114-Status: GOOD (  14.13  )
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





---- On Tue, 27 Aug 2024 19:04:42 -0300 Rob Clark  wrote ---

 > On Tue, Aug 20, 2024 at 12:09=E2=80=AFAM Vignesh Raman=20
 > vignesh.raman@collabora.com> wrote:=20
 > >=20
 > > Set the timeout of all drm-ci jobs to 1h30m since=20
 > > some jobs takes more than 1 hour to complete.=20
 > >=20
 > > Signed-off-by: Vignesh Raman vignesh.raman@collabora.com>=20
 > =20
 > Acked-by: Rob Clark robdclark@gmail.com>=20

Applied to drm-misc-next.

Thanks
Helen

 > =20
 > > ---=20
 > >  drivers/gpu/drm/ci/test.yml | 5 ++++-=20
 > >  1 file changed, 4 insertions(+), 1 deletion(-)=20
 > >=20
 > > diff --git a/drivers/gpu/drm/ci/test.yml b/drivers/gpu/drm/ci/test.yml=
=20
 > > index b6f428cdaf94..09d8447840e9 100644=20
 > > --- a/drivers/gpu/drm/ci/test.yml=20
 > > +++ b/drivers/gpu/drm/ci/test.yml=20
 > > @@ -10,6 +10,7 @@=20
 > >  .lava-test:=20
 > >    extends:=20
 > >      - .test-rules=20
 > > +  timeout: "1h30m"=20
 > >    script:=20
 > >      # Note: Build dir (and thus install) may be dirty due to GIT_STRA=
TEGY=20
 > >      - rm -rf install=20
 > > @@ -71,6 +72,7 @@=20
 > >      - .baremetal-test-arm64=20
 > >      - .use-debian/baremetal_arm64_test=20
 > >      - .test-rules=20
 > > +  timeout: "1h30m"=20
 > >    variables:=20
 > >      FDO_CI_CONCURRENT: 10=20
 > >      HWCI_TEST_SCRIPT: "/install/igt_runner.sh"=20
 > > @@ -215,7 +217,6 @@ panfrost:rk3399:=20
 > >    extends:=20
 > >      - .lava-igt:x86_64=20
 > >    stage: i915=20
 > > -  timeout: "1h30m"=20
 > >    variables:=20
 > >      DRIVER_NAME: i915=20
 > >      DTB: ""=20
 > > @@ -414,6 +415,7 @@ panfrost:g12b:=20
 > >=20
 > >  virtio_gpu:none:=20
 > >    stage: software-driver=20
 > > +  timeout: "1h30m"=20
 > >    variables:=20
 > >      CROSVM_GALLIUM_DRIVER: llvmpipe=20
 > >      DRIVER_NAME: virtio_gpu=20
 > > @@ -436,6 +438,7 @@ virtio_gpu:none:=20
 > >=20
 > >  vkms:none:=20
 > >    stage: software-driver=20
 > > +  timeout: "1h30m"=20
 > >    variables:=20
 > >      DRIVER_NAME: vkms=20
 > >      GPU_VERSION: none=20
 > > --=20
 > > 2.43.0=20
 > >=20
 >=20

