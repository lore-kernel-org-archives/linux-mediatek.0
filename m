Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1A9B7C88E50
	for <linux-mediatek@archiver.kernel.org>; Sat, 12 Sep 2026 00:08:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=PKOjMDXQRwMnjwfHSFSVSkvHj3xfpBDTda3CqhlJen8=; b=2+qvLqKDFtbdkuCg3Iq1gw4CO9
	WK4H3qUp8gpDO5Do2YoZTcq19tHvwPvwZ3CtUL0RBZRnTN2KRjleOrW3t0ISCQH2Ma1yd/0HPfXA7
	uYIa2GgOOGXPSVhSQiF2aNYObG+0tfunltf6XNKOynldkP1WjD8YUkucw6HPkLDdPhkixpxoXnCH3
	QD2didKVuy+hr6D3NkNDmCsGZmb9okCP9YZzYuJKlLiwZmKcCK+I3OVFxYLdVHiO8fxMPDvPA3WP7
	Rz4Oa8wNwxL6mYD2I8DU07n0WzV/uC8J5rizaKjRrWAZ3EEHHBJW1WeSISBeTYb2GzsaFzmgP88sA
	Fl7WToww==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x5BIc-00000000QSG-0KgW;
	Sat, 12 Sep 2026 00:08:54 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x5BIa-00000000QR0-2UAJ;
	Sat, 12 Sep 2026 00:08:52 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id BA920601EF;
	Sat, 12 Sep 2026 00:08:51 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B72761F00898;
	Sat, 12 Sep 2026 00:08:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789171731;
	bh=PKOjMDXQRwMnjwfHSFSVSkvHj3xfpBDTda3CqhlJen8=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References;
	b=Q0Oq/tERW2zN2geFXSdG5TcvRwsirw2cC4ORPsqyD8VIM5+1uPIUu/MPj6FLSXxIi
	 PVULcXYpZ69OJIEcvRU+1VkvTyj84g2mEh5bz+fUkRVFtMGRrL4LO7Zo+Hobc+ptu+
	 7eG5T2TlTJg58ugjY9vvZlLMTOPtOqkH6x9K9upMQ0Ea95JC5vrPpbCLtR8lDlLbAA
	 LkCDuxnYw2xdicd9PWl4JtDEgXtp6/i6QzaCRVIToqM1hTPA76deOh1yUndeAU4dDc
	 Jqt4Jtn2rtnlYk9d0cNqPSswzsY8lRHWyo6/2AQxisdkxBIzo2P+Zehe46xLSuo0mj
	 kPV+muiZswLBA==
Date: Fri, 11 Sep 2026 17:08:50 -0700
From: Jakub Kicinski <kuba@kernel.org>
To: Caleb James DeLisle <cjd@cjdns.fr>
Cc: netdev@vger.kernel.org, andrew@lunn.ch, olteanv@gmail.com,
 davem@davemloft.net, edumazet@google.com, pabeni@redhat.com,
 robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
 matthias.bgg@gmail.com, angelogioacchino.delregno@collabora.com,
 chester.a.unal@arinc9.com, daniel@makrotopia.org, linux@armlinux.org.uk,
 arinc.unal@arinc9.com, Landen.Chao@mediatek.com, dqfext@gmail.com,
 sean.wang@mediatek.com, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, naseefkm@gmail.com, b.larsson@gmx.com
Subject: Re: [PATCH net-next 7/7] net: dsa: mediatek: support EN751221
 switch
Message-ID: <20260911170850.05cfb134@kernel.org>
In-Reply-To: <20260909140346.2861572-8-cjd@cjdns.fr>
References: <20260909140346.2861572-1-cjd@cjdns.fr>
	<20260909140346.2861572-8-cjd@cjdns.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
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

On Wed,  9 Sep 2026 14:03:46 +0000 Caleb James DeLisle wrote:
> The EcoNet EN751221 has either one, or two, onboard MT7530 switches.
> Every implementation of this SoC has one switch on die with the CPU,
> but some chips - notably those with a "G" in the name, have a second
> MT7530 as an MCM module.
>=20
> The on-die MT7530 has 4 FE ports and 1 GE port. The MCM switch has all
> gigabit ports.
>=20
> The MCM switch connects to the SoC switch via a TRGMII link from port
> 5 on the SoC switch to port 6 on the MCM switch. This link undergoes
> calibration on startup.
>=20
> All known devices with the MCM present do not make any use of the ports
> on the on-die switch, it is put into "passthrough" mode in which all
> traffic is shuttled between port 6 and port 5 without alteration of the
> DSA tags.
>=20
> Add support for both the on-die and the MCM switch, and calibration of
> the TRGMII link between them.

../drivers/net/dsa/mt7530.c: In function =E2=80=98en751221_trgmii_pair_setu=
p=E2=80=99:
../drivers/net/dsa/mt7530.c:593:12: warning: variable =E2=80=98default_taps=
_ondie=E2=80=99 set but not used [-Wunused-but-set-variable=3D]
  593 |         u8 default_taps_ondie[NUM_TRGMII_CTRL];
      |            ^~~~~~~~~~~~~~~~~~
--=20
pw-bot: cr

