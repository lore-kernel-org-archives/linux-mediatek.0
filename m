Return-Path: <SRS0=ikIt=NE=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 488D3C4338F
	for <linux-mediatek@archiver.kernel.org>; Fri, 13 Aug 2021 15:55:16 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 0BC516103A
	for <linux-mediatek@archiver.kernel.org>; Fri, 13 Aug 2021 15:55:16 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 0BC516103A
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=collabora.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=T1NbLn//uv8YjnPRFsqSNT65F59USZXcf084FlGzoa8=; b=d9+CgGN+vq/3SIfQn6jFbTPXPa
	MFtQabc3tx+DmpXU5HNKui38mS0atHzgtXOVyyOf0rC1zeewsSbAw4kDBOrLoDsoXhTQJZ6cAk7TU
	h/m4sgRRx4MhsRY0fdN54nhtxexAKg7BVGp77FjiOz10JGC4MfFhc7o6BClFCtwbzqH+xDhh3ojkk
	na7y4E6vq14NMmA3DIosJPyrH+dep9pIegzyQ0hA7ktCxkdZepPAiU/NPkOKv4MQqGgjhaFbNfyzE
	QLIemXyWx5bGf4zmvqSmWWaElud9QwArOtQbIbmtDa9JaKqH9Fk7lV69+Pj+irg8fssMwqYeMGxiG
	wMmCbrQQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mEZWP-00D1Eo-T2; Fri, 13 Aug 2021 15:55:01 +0000
Received: from bhuna.collabora.co.uk ([2a00:1098:0:82:1000:25:2eeb:e3e3])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mEZW7-00D18k-L0; Fri, 13 Aug 2021 15:54:49 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1]) (Authenticated sender: sre)
 with ESMTPSA id 618541F40E8C
Received: by earth.universe (Postfix, from userid 1000)
 id 449DF3C0C99; Fri, 13 Aug 2021 17:54:38 +0200 (CEST)
Date: Fri, 13 Aug 2021 17:54:38 +0200
From: Sebastian Reichel <sebastian.reichel@collabora.com>
To: Gene Chen <gene.chen.richtek@gmail.com>
Cc: matthias.bgg@gmail.com, matti.vaittinen@fi.rohmeurope.com,
 broonie@kernel.org, robh+dt@kernel.org, devicetree@vger.kernel.org,
 linux-pm@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org,
 rdunlap@infradead.org, gene_chen@richtek.com, Wilma.Wu@mediatek.com,
 cy_huang@richtek.com, benjamin.chao@mediatek.com
Subject: Re: [PATCH resend v6 0/3] power: supply: mt6360_charger: add MT6360
 charger support
Message-ID: <20210813155438.4ssph6deqksob2uv@earth.universe>
References: <20210719033914.16990-1-gene.chen.richtek@gmail.com>
MIME-Version: 1.0
In-Reply-To: <20210719033914.16990-1-gene.chen.richtek@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210813_085443_893150_6845114C 
X-CRM114-Status: GOOD (  14.32  )
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
Content-Type: multipart/mixed; boundary="===============6257483880867489758=="
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org


--===============6257483880867489758==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="ikusuaweozgwybmv"
Content-Disposition: inline


--ikusuaweozgwybmv
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi,

On Mon, Jul 19, 2021 at 11:39:11AM +0800, Gene Chen wrote:
> This patch series add MT6360 Charger support contains driver and binding
> document

Thanks, queued.

-- Sebastian

> Gene Chen (3)
>  lib: add linear range get selector within
>  dt-bindings: power: Add bindings document for Charger support on MT6360 =
PMIC
>  power: supply: mt6360_charger: add MT6360 charger support
>=20
>  Documentation/devicetree/bindings/power/supply/mt6360_charger.yaml |   4=
8=20
>  drivers/power/supply/Kconfig                                       |   1=
1=20
>  drivers/power/supply/Makefile                                      |    =
1=20
>  drivers/power/supply/mt6360_charger.c                              |  86=
7 ++++++++++
>  include/linux/linear_range.h                                       |    =
2=20
>  lib/linear_ranges.c                                                |   3=
1=20
>  6 files changed, 960 insertions(+)
>=20
> changelogs between v1 & v2
>  - Add binding property with unit and custom name prefix
>  - Remove extcon device, redundant brackets and interrupts
>  - Fix power supply prop "charger type"
>=20
> changelogs between v2 & v3
>  - Add register selector to value mapping
>=20
> changelogs between v3 & v4
>  - move pdata vinovp to mt6360_chg_info
>  - remove unuse sysfs attribute
>  - refactor debug log and warning
>  - add power supply prop input voltage limit
>=20
> changelogs between v4 & v5
>  - add linear range selector mapping
>  - use linear range to map charger setting
>=20
> changelogs between v5 & v6
>  - use REGULATOR_LINEAR_RANGE
>  - use devm_work_autocancel
>  - fix Kconfig description
>=20
>=20

--ikusuaweozgwybmv
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEE72YNB0Y/i3JqeVQT2O7X88g7+poFAmEWlb4ACgkQ2O7X88g7
+ppfhg//Yi9xvms8G9ziPuIbkk/ywWDy7CTX6w5F2khCLGeODcH5NRpXPimmnrES
tod2JRpFOEvSplEAosnQR2e0PgCdCL2k0x0Ii0jQWJ3oJwSawTMGM95wx+7XiQB7
S/ncgc4Q9XkRx0btxMJ2ogKxjQzSKFh43AAhymt/p33ErnDvkbRNTX50SLNvyafy
/d0cry4eYF/wVU0L3xzO1RwILaK7HbOCoGI9XPzjR+76z9zQibtzJ9jg8/qSD2iP
BopKCrqOPTQvHGNt0/UHeVFj4OB34qhiHQqih0zONA9DdzLYOtvBvxpGn/1a31xN
0x4DzAOoVL3RcdAAT6dzrVsck8xn55wC2VcMDnMZd0uPANNLnILcXsWriaa69wrS
cj7Y1SUJdq7fbS3u3Pm6qcRDc24BORSR+oulRNJUaPM+Ylr/ADW+m9XCgTwCYnCQ
WUcqxa8rN+SEVDjo4mpBe2X5hOvn5hJopr7Xt6460sMtqvWN11H/B+NtdT47EwuG
pr6MZbqV2AUeZsz3Kf5F8i+QDeHMHn3vj6nkphP3w29gDcEGhd2bRqZ3QAG0tg03
vlLl07V1kryFcI0CQC5QPDEzLKG6whmmARoqJHVgR9Yw/bsvm97XPnX03fVVqwjT
gPwvndYyHoo4M8rhN6C6KdJVyjoUGo7CdnZO5nbUTK8cAPK685c=
=E5U1
-----END PGP SIGNATURE-----

--ikusuaweozgwybmv--


--===============6257483880867489758==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek

--===============6257483880867489758==--

