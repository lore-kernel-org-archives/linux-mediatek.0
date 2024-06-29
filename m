Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 05CD3C27C4F
	for <linux-mediatek@archiver.kernel.org>; Sat, 29 Jun 2024 17:58:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-ID:References:
	In-Reply-To:Subject:CC:To:From:Date:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=aLrT4oOnpymwjd8DVpGHvZEJrdv2DOdEX0kQWZpJWRA=; b=T3u0KehGRaNEFl
	JnARo7POHGjnBpEWqGOgzQ+AGrrQQPjwTW1Ta+yMOiMZ7BApyo48V/u4P0Va+S0P5VL4zqDL6UnWo
	Wact0P3MTNqK3evFrBSDg0iD2itNLirOtnPkbnpvlmWzr1ocbcl/tApwFzlTXbPmGHv1KN0JxTLaU
	ZrjLxlXHd5ze7VkBeWY8N6wA0jDIIUF18FCyQyzrCIDn5/niT2/F5NGQjH4o6PD4c3dz55Qd+17cW
	fz905UGRlL3g2ChfM2tFu+ZbtOHQHW6AZmouIdL0VARjJRIzz9QWUJKnHm+WG/a5IgaV8CCwp65kL
	R0ToStxmWrJ5conkkwkg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sNcLb-0000000GkgC-02gn;
	Sat, 29 Jun 2024 17:58:51 +0000
Received: from mout.gmx.net ([212.227.15.15])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sNcLX-0000000GkfQ-09uo;
	Sat, 29 Jun 2024 17:58:48 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=public-files.de;
	s=s31663417; t=1719683920; x=1720288720; i=frank-w@public-files.de;
	bh=aLrT4oOnpymwjd8DVpGHvZEJrdv2DOdEX0kQWZpJWRA=;
	h=X-UI-Sender-Class:Date:From:To:CC:Subject:Reply-to:In-Reply-To:
	 References:Message-ID:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:cc:content-transfer-encoding:
	 content-type:date:from:message-id:mime-version:reply-to:subject:
	 to;
	b=HyvcYbt8SJ7A8KWkB1a032mAMta423UnsOZPh6Z/cAD08ObBFIif9W+6xAiEx7Uf
	 gUfW9YnxAseq0SsQcg3bajeU4DOPvCoIuBT3R3Jv4Yfr/ernWvBFi1nOrWefPcfnt
	 cdEpjSH7YbYC0HjHdcDXKnEk2nAPkXzOhBkuFXOEeZJzyLEa586GF8a+mhRUtKJAz
	 YZv1dWrI8V6YJdXqzwmXV+r/y3n+MWj1TPcrs8yWhGtvnZnmmdwFLnvI+gBq+pYto
	 Rmu0qsOA1Pg1oEKjhG/uhcG7Jqvb5qg7u6TCKVTcsPqOZddt8rBDmdaICck4uYEGW
	 aJ6nwhBUZfIRNW6CYQ==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from [127.0.0.1] ([80.245.77.57]) by mail.gmx.net (mrgmx004
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1M6Ue3-1sUV2E3kxl-008jaY; Sat, 29
 Jun 2024 19:58:40 +0200
Date: Sat, 29 Jun 2024 19:58:38 +0200
From: Frank Wunderlich <frank-w@public-files.de>
To: Markus Elfring <Markus.Elfring@web.de>,
 Christian Marangi <ansuelsmth@gmail.com>, linux-mediatek@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
 linux-clk@vger.kernel.org,
 Angelo Gioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Conor Dooley <conor+dt@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Michael Turquette <mturquette@baylibre.com>,
 =?UTF-8?Q?Rafa=C5=82_Mi=C5=82ecki?= <rafal@milecki.pl>,
 Rob Herring <robh@kernel.org>, Stephen Boyd <sboyd@kernel.org>
CC: stable@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>
Subject: =?US-ASCII?Q?Re=3A_=5BPATCH_v2_1/2=5D_arm64=3A_dts=3A_mediate?=
 =?US-ASCII?Q?k=3A_mt7622=3A_readd_syscon_to_pciesys_node?=
User-Agent: K-9 Mail for Android
In-Reply-To: <9f67af8b-9c8c-4ad6-88c3-03d9fd9673d2@web.de>
References: <20240628105542.5456-1-ansuelsmth@gmail.com> <9f67af8b-9c8c-4ad6-88c3-03d9fd9673d2@web.de>
Message-ID: <7B85B9EF-589B-4025-9933-847C6BDCF284@public-files.de>
MIME-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:/XeJwdnckIOl1ojd6eCqyn4n7VHLmaLRB1MmDzcRq4iP+LgaqM9
 aoGV8ocSw5XCK4SmmZ1AbuTshcCrdsRGiL+8VJHOJ1BlVgb4RS0Rd85iUeJ2E7Mg0xQbLRM
 pR5Ahj6teUQXjEAd/oS/GXWScw0jHEKyEElJ3x6U02BecSyNGKNtGAs0Rx3ZO2Qs+NeqDgk
 trX5YINi4Ej7VdcpAZinA==
UI-OutboundReport: notjunk:1;M01:P0:aXtMXo6gijc=;daTEpV3dzaZ3Xfnp2LUT3IOkcIi
 ITveyJxrT/X8ytrJYBRNKr/x95owVeX/C9T7qBD/Kmtd2U3QUSPqpXFR5E4dUzjgE7g35amDP
 /zkpkeIHV8ipLjst1NnPEG0iarLJVo9Hs1Ijkzop02rQMhBEb4Bx3j4S3YB5ZvNL3n7M8oKGw
 fPdMJJduhdtG1ToRI1EpPWczgVYycNv0UBfi8yMKzwy/o6t6eEkxPNmaMrunHK8yERfyvEVEX
 NnK6zUkDwaqLEmqE7LAuNpseuRZgRFff9npL2cK5HC+PXDh3vvidymtN7GJ/UZcG5RZ7zwSdg
 RKSNV0JH1wux420g3qhWF5ovJHiOyOmOrDAaIe4nbVy37B7vgoeuXEv5tiE5BQV55XeHd+Rng
 KIS0JcpFyh6lAhixklb/llgvBEmo8SQfY1VoEYL+bYItPnghx70X4TDQNYYNN9QvsEfsF1VcG
 Eo4vsgx9MFWnawBrIMyYvil9UDpNE+MUc8ABhnF357XiVNMp1E4Wwjjctq4cRRnA0UeZrSZmc
 gKlG7PmI90ODmiecKDgsE9nOftb/zbBChNgGNKbQC5Zv88CKepaAES6A2a432Yi7nSmmPY8RV
 RMJwXhhS5xfd3x7uAaSucm1K3FZrAjsVZl3Fky+eWGhMHtOfabaTj6x3hyJsHcknYhjwotnsj
 Upg+TXk6bxPGRRIJ4uCZSbLO27nl5eZAI2VS4WODbF6RO4NgVcFBvIxu6nJv8irTJ1mnOFhAu
 G/a62lLZuVX8YJDT689FohWgNFXt92hDEOC+lz36w6rptZkal8xiTnIkhTMeLRpJIXZnRSQ98
 1vgJich+5VizoOGmB27nJlslGE7vaoitXvpEbb+5sOhuY=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240629_105847_462453_20C6F659 
X-CRM114-Status: UNSURE (   9.14  )
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

Am 29=2E Juni 2024 19:35:01 MESZ schrieb Markus Elfring <Markus=2EElfring@w=
eb=2Ede>:
>> Sata node reference the pciesys with the property mediatek,phy-node
>> and that is used as a syscon to access the pciesys regs=2E
>>
>> Readd the syscon compatible to pciesys node to restore correct
>> functionality of the SATA interface=2E
>=E2=80=A6
>> Reported-by: Frank Wunderlich =E2=80=A6
>
>Was any related information published?
>
>Regards,
>Markus
>

Hi,

I found this while changing uboot to of_upstream and fixed it there (not y=
et send to mailinglist)=2E As of_upstream uses linux dts,i rechecked if it =
is broken there too and yes it is=2E

But i have not sent issue to mailinglist because we fixed it before :)
regards Frank

