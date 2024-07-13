Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 57894C3DA45
	for <linux-mediatek@archiver.kernel.org>; Sat, 13 Jul 2024 10:47:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-ID:References:
	In-Reply-To:Subject:CC:To:From:Date:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=6Rd/PEeMiqexHiwaSOQ1xuaoeBDAi/qd5v9AWNzziaQ=; b=jbcxGjewD27mH5
	LmrJKm09GMW2kHTHgbg4rNy7ynMC/p/ZVBG1fpSooFGzOzkPpywIHq1ebLDGZ9XWrRDAbksWqUzq8
	5n/b8TRyzNIs5s5EMZj2o7WsPbsiJMqw+ZaKomoPgQrqWvChDkLivdgXQ58JQudGs9zbVE+B8/wXX
	TlmiyTmGvPnqtrfrlKRqIx9tsFXv0KkGvrpmNht2/d8RXTjE5mEIMLNtNTBIzvuM2j6mqnivTnP1X
	5EI4xrPVyhrbOVCMlcfx2GAnSsmq2jZse4VFV6s9LvFPR77pI5YzWVEUVQB+5ygLv9woDsHtrYWdf
	hq8pmHWxMMHOr9Y7Uzow==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sSaIF-00000002OVh-3eiU;
	Sat, 13 Jul 2024 10:47:55 +0000
Received: from mout.gmx.net ([212.227.15.15])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sSaHv-00000002OPj-2pOX;
	Sat, 13 Jul 2024 10:47:37 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=public-files.de;
	s=s31663417; t=1720867623; x=1721472423; i=frank-w@public-files.de;
	bh=6Rd/PEeMiqexHiwaSOQ1xuaoeBDAi/qd5v9AWNzziaQ=;
	h=X-UI-Sender-Class:Date:From:To:CC:Subject:Reply-to:In-Reply-To:
	 References:Message-ID:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:cc:content-transfer-encoding:
	 content-type:date:from:message-id:mime-version:reply-to:subject:
	 to;
	b=K26DenVpAOM12XFxLVW2HTOzeEb9UP9Wopq+Zd+I3K0jsuybfB9ZPx5BthXcR6+t
	 0z8fu6N+k5+zKeHNxNuCh5WpD5trpFLbDRJeVTkhSC/f6nbHTneO4Rcyt3IieKo1z
	 BJNw60T10sZ1lHtXQkiWUe80Y/4Lem97Sfpf35Ls1u/n8GjZBADVGajbqbFnp+ANm
	 8dPbmv6WzVaxikP/sf3Bc7pfJQCEaLRN5DkMS/1+QmQ7WaC32cPcnKHNMOapB/HZ2
	 hrgCjn/PBs/qAaWNAKMQNuF1eJYwJete8TCONf7QfCKx9hn3dv8wi31NJRyl3Q1Tj
	 IegYx1yF9pvye2oiWA==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from [127.0.0.1] ([217.61.145.51]) by mail.gmx.net (mrgmx004
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1MdNY2-1rtWZq38Ma-00iLMZ; Sat, 13
 Jul 2024 12:47:02 +0200
Date: Sat, 13 Jul 2024 12:47:00 +0200
From: Frank Wunderlich <frank-w@public-files.de>
To: Krzysztof Kozlowski <krzk@kernel.org>, Frank Wunderlich <linux@fw-web.de>,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Wim Van Sebroeck <wim@linux-watchdog.org>,
 Guenter Roeck <linux@roeck-us.net>
CC: Daniel Golle <daniel@makrotopia.org>, linux-clk@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 linux-watchdog@vger.kernel.org
Subject: =?US-ASCII?Q?Re=3A_=5BPATCH_v1_1/4=5D_dt-bindings=3A_watchdog=3A_me?=
 =?US-ASCII?Q?diatek=2Cmtk-wdt=3A_add_MT7988_syscon_requirement?=
User-Agent: K-9 Mail for Android
In-Reply-To: <58cba30d-af53-47a6-9258-8b36eab6cbfb@kernel.org>
References: <20240709101328.102969-1-linux@fw-web.de> <20240709101328.102969-2-linux@fw-web.de> <58cba30d-af53-47a6-9258-8b36eab6cbfb@kernel.org>
Message-ID: <F5A59950-5D16-4780-A64C-806A6324D467@public-files.de>
MIME-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:dfQVnBpIteXjdR8ttejmmx8V5KDS9dWqIXsSefOdM2sLE/Obzco
 NGDmA4NYZJB7TLC2wDsEaXEpgf6Xsx332EYdG0YfLBz0/8wsNk7+hpg4Itwu2I3DUCcOb0w
 msuBv+/Xb0nDwy+ySkjfwRlAToGV+uz3y5kI4J44Pkay2s66a7DBZI7b1JXLpsZapc5cAW0
 dxdy9GJLKI/j6SjG0lDkg==
UI-OutboundReport: notjunk:1;M01:P0:7d5/pH8sfOY=;kZxM77vMuE7lzEFRj2it8hMElOb
 XfUwf6PpqfVT6w35/xDyxLXkd35plIy0+Ix3IXfqwLS8q67xbsOjI2UEmx4Q01LoOhF+1d25e
 t1wbbK1QfPNMrMMwDYKayZcNi5nmZqHQjFktyMYC4KhTxI9hRT0DhO4bn5g/tGEqAMFGOcmgY
 Sulc9zWvKtnkX4G5oL/FceF6nm4/joU9GzZo6XqBzClqoq3kkKtrLTtIofPvPBwhYipdn8HB6
 ZtIs9TZwqyByvlSrk/kLn1HJRQyXfoSeYsPA5YsQ4It0wIIpY7MQOC7rsFp/103FEgayRYik2
 h6GKbWQrRv2jaU00V45KtiVVvUXtY4sMQD66tF3C9VrSBVvQzSDSzSVZ0IBzJNfYETB6I1YFC
 8t60Wu+ms6rM+TF8L1AYT5GyFAwXhZkfjpK4Uqs9ZgEFY5MyQmKRn3DF3u++8mY+9zJ11/ylw
 W9Z01g4C4STe2483/xiUV3FBps2s2cL3pKgH9XKBtMAXGHB+FUgSk2iDPmLHZ53ZbCNzsNcAY
 MP77ljfHtbwC60yPXReUmOxZMHFhb3j1DP5T0ivfrtSKeJ2CMm+QcLG1B2xXk82ed0jb2OtAY
 eqIqhU3gch1KgXPpwVl3ZTNRJF4EGDQrRt9/BGHhyDiVHFDLNdf1wzgqO49zVpdzV7bEo1O79
 9gqvnb3z8tph1gI2uCwLtPizYyl4gCyeRBzITWzgSkEXXsy18ytGV1uZBf1erunhQXdKePRHB
 EIrompkqsMh3FSLQyfP8eUKENAH5Ju+yhDvbsKgZJiyiDd3yD/hhSK8mdebk+Ji5mz6qaXzWR
 hNM+bQeiUUEaJILs+UEYi5/g==
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240713_034736_037269_66011C7F 
X-CRM114-Status: UNSURE (   7.87  )
X-CRM114-Notice: Please train this message.
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
Reply-To: frank-w@public-files.de
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Am 13=2E Juli 2024 12:21:46 MESZ schrieb Krzysztof Kozlowski <krzk@kernel=
=2Eorg>:
>On 09/07/2024 12:13, Frank Wunderlich wrote:
>> From: Frank Wunderlich <frank-w@public-files=2Ede>
>>=20
>> This is needed by u-boot-driver when using OF_UPSTREAM=2E
>
>Thanks for providing context=2E What we miss here still, is the
>description of the hardware and for what this syscon is used=2E Why this
>become system controller and before was not? Or this is just for regmap
>- then it does not work that way=2E=2E=2E You cannot have whatever driver
>poking all around then claim - I have crappy driver poking to every
>driver without implementing proper driver model, so I add syscon to
>bindings=2E
>
>
>
>Best regards,
>Krzysztof
>

The nodes here are linked to the ethernet-node and syscon is only needed t=
o get the regmap=2E=2E=2Ethe access to it is done by ethernet driver=2E It =
does work,but maybe not the right way=2E=2E=2E
regards Frank

