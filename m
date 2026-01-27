Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9E403C88E41
	for <linux-mediatek@archiver.kernel.org>; Tue, 27 Jan 2026 14:56:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=KXLHhSC3baWFHNZu1Qcd0OlNW50IsuJlgqvgKTVshG0=; b=01kEQem6HqwSHoRcGeijNRTTaX
	yk2HA5poGfxiEB9FQc+1XnxxRNhM+gl34GjcMXtgygl9Tlh3TIMjQX6Fq6I79/JTpoZ6xeJh16bjb
	jrZBb45TkBOqBQPyCPWSJ+GEGJPtbkETLIG3oao9U5d3PuKQAFlZVIGj7rtGNoOLwM/xatzHN7Tb6
	7h65HQeaGU6SCiNW3h4emzUJNjz+ta8ymD+sP4406ms/LKCoMtDPt7mivjHhvo50rM5B6zm68NuhS
	A2r15SLFvAQIShCSu6prJV8XLvGb+u1WtKx0oD9zMXzfqlAxKoZowwqBaEom4WE7+dSlZP/iL/Sos
	l0XJ/oVg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vkkUn-0000000EU5c-0gPJ;
	Tue, 27 Jan 2026 14:56:45 +0000
Received: from mx-relay49-hz3.antispameurope.com ([94.100.134.238])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vkkUi-0000000EU4e-0tk0
	for linux-mediatek@lists.infradead.org;
	Tue, 27 Jan 2026 14:56:43 +0000
ARC-Authentication-Results: i=1; mx-gate49-hz3.hornetsecurity.com 1; spf=pass
 reason=mailfrom (ip=94.100.132.6, headerfrom=ew.tq-group.com)
 smtp.mailfrom=ew.tq-group.com
 smtp.helo=hmail-p-smtp01-out03-hz1.hornetsecurity.com; dmarc=pass
 header.from=ew.tq-group.com orig.disposition=pass
ARC-Message-Signature: a=rsa-sha256;
 bh=KXLHhSC3baWFHNZu1Qcd0OlNW50IsuJlgqvgKTVshG0=; c=relaxed/relaxed;
 d=hornetsecurity.com; h=from:to:date:subject:mime-version:; i=1; s=hse1;
 t=1769525782;
 b=myvR4/dG/t05HC7uCy7zmw9xaV29u3d/xG1QI7NMRW5ShJJn1FP5jHLxkKopjHRlPx4HfXmL
 xrTCpPnIyiLPgKAMMpEG19xausSWlCzAJqTdIhAzQtcwaLw0RgEaL4BKLM05slMmAroMEjVK/HQ
 Vx5KpMxlhRQ4tdOXwvipcwA7gdCsFoR784KyjjfW21SWpHy33ewPZpVsa1hP7SiV2qpPkhUnpKt
 eJ8oirpD4vJI76M/8PIQsZ1BmxXbhNi+kK1Gt7c6vSmNWDqqw8U+rLXHCHhxlznXJjfarXxOcvF
 SX4SsIhy2cS1dWdJLC/psI79gcZKTCe/7tAOqjT23iKeA==
ARC-Seal: a=rsa-sha256; cv=none; d=hornetsecurity.com; i=1; s=hse1;
 t=1769525782;
 b=PK/Nf+oqbpqcTpc+qEqMT/xF97AttArKICGo2sHqBe/+oZCi3xtQxFOwvi4MMbgbInMWC4Mm
 4eI+PUdRW2nWvDlm2NwmQntD73uwx2TcSH1+JiDXLqvxO3MU4rMZIbSnXyamY2Ox6bqZQC08Za0
 hdzTfXYd/LNVLIOu6alxXu7fJIRi2beBXwDY9sP9ndljzHp/dbwiQEaGHDI/exOiOSNHbCTNGvr
 zp48xKs4v8w2Gi5KNq9eLiliyYfq3Mr9cw2brlFjN9sIiv2RTGidEG605KkUnJFQUDXDPYkFDM9
 dwi9Qsqhs2B7kcI8QtRV/trb+GFMpaoWrITM5xXTVxnIg==
Received: from he-nlb01-hz1.hornetsecurity.com ([94.100.132.6]) by mx-relay49-hz3.antispameurope.com;
 Tue, 27 Jan 2026 15:56:22 +0100
Received: from steina-w.localnet (host-82-135-125-110.customer.m-online.net [82.135.125.110])
	(Authenticated sender: alexander.stein@ew.tq-group.com)
	by hmail-p-smtp01-out03-hz1.hornetsecurity.com (Postfix) with ESMTPSA id 9FBF6CC0A1D;
	Tue, 27 Jan 2026 15:56:05 +0100 (CET)
From: Alexander Stein <alexander.stein@ew.tq-group.com>
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Chen-Yu Tsai <wenst@chromium.org>, Chia-I Wu <olvaffe@gmail.com>,
 Dong Aisheng <aisheng.dong@nxp.com>, Laura Nao <laura.nao@collabora.com>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Michael Turquette <mturquette@baylibre.com>,
 Nicolas Frattaroli <nicolas.frattaroli@collabora.com>,
 =?ISO-8859-1?Q?N=EDcolas_F=2E__R=2E__A=2E?= Prado <nfraprado@collabora.com>,
 Yassine Oudjana <y.oudjana@protonmail.com>, Stephen Boyd <sboyd@kernel.org>
Cc: kernel@collabora.com, linux-clk@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org,
 Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
Subject: Re: [PATCH RESEND v3 1/5] clk: Respect CLK_OPS_PARENT_ENABLE during recalc
Date: Tue, 27 Jan 2026 15:55:29 +0100
Message-ID: <6239343.lOV4Wx5bFT@steina-w>
Organization: TQ-Systems GmbH
In-Reply-To: <176913273374.4027.10690199843699119944@lazor>
References: <20251215-mtk-pll-rpm-v3-0-5afb3191e869@collabora.com>
 <20251215-mtk-pll-rpm-v3-1-5afb3191e869@collabora.com>
 <176913273374.4027.10690199843699119944@lazor>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="iso-8859-1"
X-cloud-security-sender: alexander.stein@ew.tq-group.com
X-cloud-security-recipient: linux-mediatek@lists.infradead.org
X-cloud-security-crypt: load encryption module
X-cloud-security-Mailarchiv: E-Mail archived for: alexander.stein@ew.tq-group.com
X-cloud-security-Mailarchivtype: outbound
X-cloud-security-Virusscan: CLEAN
X-cloud-security-disclaimer: This E-Mail was scanned by E-Mailservice on mx-relay49-hz3.antispameurope.com with 4f0pPf56qSz3yXl8
X-cloud-security-connect: he-nlb01-hz1.hornetsecurity.com[94.100.132.6], TLS=1, IP=94.100.132.6
X-cloud-security-Digest: 488e984b4919a202955d5ac62586d299
X-cloud-security: scantime:1.885
DKIM-Signature: a=rsa-sha256;
 bh=KXLHhSC3baWFHNZu1Qcd0OlNW50IsuJlgqvgKTVshG0=; c=relaxed/relaxed;
 d=ew.tq-group.com;
 h=content-type:mime-version:subject:from:to:message-id:date; s=hse1;
 t=1769525781; v=1;
 b=KE5jmAT7pzhGAWPnyUi7gqZoE0DG+WFoucRlvho8oCGMyqNhpbyu+FK0b0lXPSqLaO7hKYXQ
 dx/m6J2RGINgbP63clx/GI46YrAfxjbNV7IT6UffM2P+13ya+OyEgpDgIR6U+DSi+xLSaraS0ec
 sX4ZSX1QU1tgROKLPWa9kkuY6gSD0AbUd795KtT/a92N/exPLE848gNO3iASGymYUXbdofRU2Af
 fXhebRKMDlkhAXdGR+TQtsB3CKumk6mygRCpoWRv0XW4bDD/G00Z3lZWHU2dlvNVft/fKJJmCmH
 KM7mrRTEBvMw1gpknfMJ6pVBUHsvycZjmFf/FbrWboL4Q==
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260127_065640_506343_805592BC 
X-CRM114-Status: GOOD (  12.05  )
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

Hello,

Am Freitag, 23. Januar 2026, 02:45:33 CET schrieb Stephen Boyd:
> Quoting Nicolas Frattaroli (2025-12-15 03:23:58)
> > When CLK_OPS_PARENT_ENABLE was introduced, it guarded various clock
> > operations, such as setting the rate or switching parents. However,
> > another operation that can and often does touch actual hardware state is
> > recalc_rate, which may also be affected by such a dependency.
> >=20
> > Add parent enables/disables where the recalc_rate op is called directly.
> >=20
> > Fixes: fc8726a2c021 ("clk: core: support clocks which requires parents =
enable (part 2)")
> > Fixes: a4b3518d146f ("clk: core: support clocks which requires parents =
enable (part 1)")
> > Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@coll=
abora.com>
> > Reviewed-by: Chen-Yu Tsai <wenst@chromium.org>
> > Signed-off-by: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
> > ---
>=20
> Applied to clk-next

Unfortunately this breaks my board TQMa8MPxL+MBa8MPxL on next-20260126.
Last lines on bootlog (earlycon is necessary)
> [    1.175639] Initialise system trusted keyrings
> [    1.178907] workingset: timestamp_bits=3D42 max_order=3D19 bucket_orde=
r=3D0
> [    1.185822] NFS: Registering the id_resolver key type
> [    1.190295] Key type id_resolver registered
> [    1.194473] Key type id_legacy registered
> [    1.198515] nfs4filelayout_init: NFSv4 File Layout Driver Registering.=
=2E.
> [    1.205235] nfs4flexfilelayout_init: NFSv4 Flexfile Layout Driver
> Registering... [    1.213235] cryptd: max_cpu_qlen set to 1000
> [    1.274689] Key type asymmetric registered
> [    1.275939] Asymmetric key parser 'x509' registered
> [    1.280896] Block layer SCSI generic (bsg) driver version 0.4 loaded
> (major 242) [    1.288278] io scheduler mq-deadline registered
> [    1.292840] io scheduler kyber registered
> [    1.299245] ledtrig-cpu: registered to indicate activity on CPUs

Reverting commit 669917676e93fca5ea3c66fc9539830312bec58e fixes the problem.

Best regards,
Alexander
=2D-=20
TQ-Systems GmbH | M=FChlstra=DFe 2, Gut Delling | 82229 Seefeld, Germany
Amtsgericht M=FCnchen, HRB 105018
Gesch=E4ftsf=FChrer: Detlef Schneider, R=FCdiger Stahl, Stefan Schneider
http://www.tq-group.com/



