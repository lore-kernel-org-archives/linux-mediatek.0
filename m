Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 18140D3F078
	for <linux-mediatek@archiver.kernel.org>; Wed, 28 Jan 2026 14:57:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ONpXfF3lQToQjK7rRSj7gTOlaNKqcczWPw9kZFHHahw=; b=YSOtkueDD7xeYdy2HVZKvILcQq
	XvyKDIOF+iHiCsM2yCUTlvb4jv4/PvbDMgyTX72gXESwaNAcb+b9eHvV/bJxXFhPPWU4um3ob24u1
	/SdzCDZhFmBSWWPK5icXs0Y9hnrNaEtSmjhaZF4O+SqcOIDLxEFLp24U1wqXx3KvA7lWXy9bt8OHJ
	3YbEaTxPop5grJ6b1rq0PQDc1noZmTXBhPQz0MUAe2eyf1akGrr/ivdhQf0MQZXpIiZkUHwQo49Uu
	1ZOZRtViqVboF7eQQuFDlnod+y1dqhZ1VTXZFwYVKzzOHVWsTRW/O4J5I7qV82mvDx8DH+0EsfYdC
	GgIrHSbA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vl6yh-0000000GDjB-46uU;
	Wed, 28 Jan 2026 14:57:07 +0000
Received: from mx-relay49-hz1.antispameurope.com ([94.100.132.225])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vl6yf-0000000GDhL-3BPg
	for linux-mediatek@lists.infradead.org;
	Wed, 28 Jan 2026 14:57:07 +0000
ARC-Authentication-Results: i=1; mx-gate49-hz1.hornetsecurity.com 1; spf=pass
 reason=mailfrom (ip=94.100.132.6, headerfrom=ew.tq-group.com)
 smtp.mailfrom=ew.tq-group.com
 smtp.helo=hmail-p-smtp01-out03-hz1.hornetsecurity.com; dmarc=pass
 header.from=ew.tq-group.com orig.disposition=pass
ARC-Message-Signature: a=rsa-sha256;
 bh=ONpXfF3lQToQjK7rRSj7gTOlaNKqcczWPw9kZFHHahw=; c=relaxed/relaxed;
 d=hornetsecurity.com; h=from:to:date:subject:mime-version:; i=1; s=hse1;
 t=1769612209;
 b=mSN/UsBSAu+kkMEnqHIwVFUm4hYUY+SqN3kZdw1OEcyiHLVTXI8dK90IUIjb4nx2GLVytGan
 wTjm+p4Q6BqpWXHfFre2c48VAJWE7VAPh8qHGlwIscTivxYqoO+/eDMHoZKXB1Uu5reYHxTjBS3
 ++16Jv9nJ7KdC+aMf6PoP1Rr83DtkIJ0+SfRFGDVwIvavqWobEL9wJiHRTCOM+NGQTMqK9b6mKa
 kzd8oCJjwff4PpAsxejTxukdiFG2X5P/FZ/r+eRYdGobKRbSsiwgQXzVkwnO5X05VjX9vzgawQ9
 gZuFzLhLBfmKr0dK1LvMl030lI1bam157FgnaG74feyUQ==
ARC-Seal: a=rsa-sha256; cv=none; d=hornetsecurity.com; i=1; s=hse1;
 t=1769612209;
 b=a44Zhc6ybx5igVINWXzyqpmrYLHOhaC9Nk69VKsKxKcYY+bbTvoKZrI3s+6xDYWHs8ycu64K
 x1nUGcs8QLk7RTyPs2SFglBn1lFq0YndUddBNvkEDldcpohd3k5RCnARRydWtUyq2spZDs9zZes
 H78wieEJPmoXpgY0E8YYYB9edWjY59U4XccfsaGF8WP4CJ32Q3ct7sy5VZbryo+/9oLQXlNdH2X
 ZLqJko5k5FCviMHEFFJc/isBUKMKmApmC0WRvAPJuptJTyQ3QO6OOPkET1kHmWkZOrtyo3K7oWw
 m9bdJEEts5rx0coCGgUPLtnXeTrCKx/rpUpSZg4JsbPGQ==
Received: from he-nlb01-hz1.hornetsecurity.com ([94.100.132.6]) by mx-relay49-hz1.antispameurope.com;
 Wed, 28 Jan 2026 15:56:48 +0100
Received: from steina-w.localnet (host-82-135-125-110.customer.m-online.net [82.135.125.110])
	(Authenticated sender: alexander.stein@ew.tq-group.com)
	by hmail-p-smtp01-out03-hz1.hornetsecurity.com (Postfix) with ESMTPSA id 1625ECC0CB8;
	Wed, 28 Jan 2026 15:56:31 +0100 (CET)
From: Alexander Stein <alexander.stein@ew.tq-group.com>
To: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>,
 Mark Brown <broonie@kernel.org>
Cc: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>,
 Dong Aisheng <aisheng.dong@nxp.com>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Yassine Oudjana <y.oudjana@protonmail.com>,
 Laura Nao <laura.nao@collabora.com>,
 =?ISO-8859-1?Q?N=EDcolas_F=2E_R=2E_A=2E?= Prado <nfraprado@collabora.com>,
 Chia-I Wu <olvaffe@gmail.com>, Chen-Yu Tsai <wenst@chromium.org>,
 kernel@collabora.com, linux-clk@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org
Subject: Re: [PATCH v3 1/5] clk: Respect CLK_OPS_PARENT_ENABLE during recalc
Date: Wed, 28 Jan 2026 15:55:54 +0100
Message-ID: <5050249.GXAFRqVoOG@steina-w>
Organization: TQ-Systems GmbH
In-Reply-To: <daa1906b-a112-4158-aec2-ad1d29b4fe35@sirena.org.uk>
References: <20251010-mtk-pll-rpm-v3-0-fb1bd15d734a@collabora.com>
 <6678782.DvuYhMxLoT@workhorse>
 <daa1906b-a112-4158-aec2-ad1d29b4fe35@sirena.org.uk>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="iso-8859-1"
X-cloud-security-sender: alexander.stein@ew.tq-group.com
X-cloud-security-recipient: linux-mediatek@lists.infradead.org
X-cloud-security-crypt: load encryption module
X-cloud-security-Mailarchiv: E-Mail archived for: alexander.stein@ew.tq-group.com
X-cloud-security-Mailarchivtype: outbound
X-cloud-security-Virusscan: CLEAN
X-cloud-security-disclaimer: This E-Mail was scanned by E-Mailservice on mx-relay49-hz1.antispameurope.com with 4f1QMg6GcFz28ym5
X-cloud-security-connect: he-nlb01-hz1.hornetsecurity.com[94.100.132.6], TLS=1, IP=94.100.132.6
X-cloud-security-Digest: 3cf64e51d346abca35efec810fea2612
X-cloud-security: scantime:1.873
DKIM-Signature: a=rsa-sha256;
 bh=ONpXfF3lQToQjK7rRSj7gTOlaNKqcczWPw9kZFHHahw=; c=relaxed/relaxed;
 d=ew.tq-group.com;
 h=content-type:mime-version:subject:from:to:message-id:date; s=hse1;
 t=1769612208; v=1;
 b=nPoMtxyZFKwdY3JlP6B+soBeYuv6YlT8kfdtgWMQ3noj5Vgai50nfbbo3Wc4vQyRxH37p6XW
 0BT7mejDqStaBuJ/h7fUUf3b8MiBSBo9jj9jImDP+0bCL6sq72JZacdInz+GrpMWaCR4+D7TwDq
 6723HXQwof5aTsQ5pLmnEQRzU9IaCyUrT98SFlSydMHEvM40rRiuLTLT/jOFgWypqIu2Q3Xx3p9
 ygl7AFfrONxeyFCr3Gx1q9PbcGeVQpYP/4aalVAkic7xEYcBE7NaYQ84fYZlTFkos1Sv0JuBa6+
 XTM0U5pCiu4ZnVzAF7esHYyVlPhjPi8wfBT6/hzh18mcg==
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260128_065705_997151_23717A28 
X-CRM114-Status: GOOD (  14.48  )
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

Hi everyone,

Am Mittwoch, 28. Januar 2026, 15:47:08 CET schrieb Mark Brown:
> On Wed, Jan 28, 2026 at 03:09:46PM +0100, Nicolas Frattaroli wrote:
> > On Wednesday, 28 January 2026 00:14:29 Central European Standard Time M=
ark Brown wrote:
>=20
> > > Do you have a debugging patch we could run which would say which cloc=
ks
> > > are impacted?  I guess it's more of an issue for the platforms that g=
ive
> > > no output but for at least Avenger96 I was getting earlycon output.
>=20
> > Try this one
>=20
> For the Avenger96 that says:
>=20
> [    0.347816] __clk_core_init: enabling parent ck_hse for ck_per
> [    0.352230] __clk_core_init: disabling parent ck_hse for ck_per
> [    0.358207] __clk_core_init: enabling parent pll1_p for ck_mpu
> [    0.364005] __clk_core_init: disabling parent pll1_p for ck_mpu
>=20
> https://lava.sirena.org.uk/scheduler/job/2412562#L563
>=20

This is for TQMa8MPxL/MBa8MPxL:

[    1.452788] __clk_core_init: enabling parent audio_pll1_out for clkout1_=
sel
[    1.457677] __clk_core_init: disabling parent audio_pll1_out for clkout1=
_sel
[    1.464270] __clk_core_init: enabling parent audio_pll1_out for clkout2_=
sel
[    1.471760] __clk_core_init: disabling parent audio_pll1_out for clkout2=
_sel
[    1.478360] __clk_core_init: enabling parent sys_pll2_500m for arm_a53_d=
iv
[    1.485259] __clk_core_init: disabling parent sys_pll2_500m for arm_a53_=
div

Best regards,
Alexander

=2D-=20
TQ-Systems GmbH | M=FChlstra=DFe 2, Gut Delling | 82229 Seefeld, Germany
Amtsgericht M=FCnchen, HRB 105018
Gesch=E4ftsf=FChrer: Detlef Schneider, R=FCdiger Stahl, Stefan Schneider
http://www.tq-group.com/



