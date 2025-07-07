Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 82DBDC8303C
	for <linux-mediatek@archiver.kernel.org>; Mon,  7 Jul 2025 07:40:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-ID:References:
	In-Reply-To:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=zVp3mU9tpJoLyKShOFZbvOMZjx+sbDfvqdrK5RIOkbg=; b=CgXHwPaK7t5e4p
	0LxNVGfVLsY9sM0wik0c9eQR4o/0Ukwnb+oBhot41yPyojq1yIrsbMNkHUuZFLFzBkWk+yG2+qmZz
	KRbJJ7dysy4goPqFw3+AqgPueNlydf/Ei/HqJstc1erYYkqTIaVv4oI/hZcLmJOdUKXe5vCK+INAi
	NcLcKiUtSNW/c4Ci2jSru3GSI4o6zzMeBWPczzNG//BlXHOjbRKzy+iVdSsSX8XKtHMyrKzt99OSJ
	Xt5VoxZjsC8xhx7uS+Sdzn/QXLNquFPFoYjBHYGvnEDk55cAE4W7meLFbzIxcyZgM9w7mh3h8TgQH
	HFzrMzA/EPpHkQFXmfdg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uYgSg-00000001ieF-0FOP;
	Mon, 07 Jul 2025 07:40:26 +0000
Received: from mxout2.routing.net ([2a03:2900:1:a::b])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uYgJ9-00000001goe-1nrT;
	Mon, 07 Jul 2025 07:30:36 +0000
Received: from mxbox2.masterlogin.de (unknown [192.168.10.89])
	by mxout2.routing.net (Postfix) with ESMTP id B0FE35FAAF;
	Mon,  7 Jul 2025 07:30:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailerdienst.de;
	s=20200217; t=1751873433;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=zVp3mU9tpJoLyKShOFZbvOMZjx+sbDfvqdrK5RIOkbg=;
	b=tcPHlMoWChlrn8xTPaCqBQ/0kL86NAfoif4bczhRr5EPFM2mHMEWkuotkm7Qcm8BgxNhKd
	cfd7uYKu7+c3NyNy1MFOYQHSkksnV/+Gw9qqAyCXu09nxFsZXLYurxI+bXh6AVtUosXhwp
	CTur5EUurSQKKFv4T1RiC3Lo7PaHHeg=
Received: from [IPv6:::1] (unknown [IPv6:2a01:599:808:65f4:756a:9686:4114:2d58])
	by mxbox2.masterlogin.de (Postfix) with ESMTPSA id 3BB8D100758;
	Mon,  7 Jul 2025 07:30:31 +0000 (UTC)
Date: Mon, 07 Jul 2025 09:30:32 +0200
From: Frank Wunderlich <linux@fw-web.de>
To: Krzysztof Kozlowski <krzk@kernel.org>
Subject: =?US-ASCII?Q?Re=3A_=5BPATCH_v8_02/16=5D_dt-bindings=3A_n?=
 =?US-ASCII?Q?et=3A_mediatek=2Cnet=3A_allow_up_to_8_IRQs?=
User-Agent: K-9 Mail for Android
In-Reply-To: <20250707-modest-awesome-baboon-aec601@krzk-bin>
References: <20250706132213.20412-1-linux@fw-web.de> <20250706132213.20412-3-linux@fw-web.de> <20250707-modest-awesome-baboon-aec601@krzk-bin>
Message-ID: <B875B8FF-FEDB-4BBD-8843-9BA6E4E89A45@fw-web.de>
MIME-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Mail-ID: 03c03832-acef-4e85-9034-7323a57b8c25
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250707_003035_630296_B1361978 
X-CRM114-Status: GOOD (  10.99  )
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
Cc: Andrew Lunn <andrew@lunn.ch>, Landen Chao <Landen.Chao@mediatek.com>, linux-kernel@vger.kernel.org, Eric Dumazet <edumazet@google.com>, Rob Herring <robh@kernel.org>, linux-pm@vger.kernel.org, Chanwoo Choi <cw00.choi@samsung.com>, MyungJoo Ham <myungjoo.ham@samsung.com>, Johnson Wang <johnson.wang@mediatek.com>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, Lorenzo Bianconi <lorenzo@kernel.org>, devicetree@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>, Sean Wang <sean.wang@mediatek.com>, DENG Qingfang <dqfext@gmail.com>, linux-mediatek@lists.infradead.org, Matthias Brugger <matthias.bgg@gmail.com>, linux-arm-kernel@lists.infradead.org, AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, =?UTF-8?B?QXLEsW7DpyDDnE5BTA==?= <arinc.unal@arinc9.com>, netdev@vger.kernel.org, Daniel Golle <daniel@makrotopia.org>, Kyungmin Park <kyungmin.park@samsung.com>, Georgi Djakov <djakov@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Vladimir Oltean <olteanv@gmail.com>, "David S. Miller" <davem@davemloft.net>, Felix Fietkau <nbd@nbd.name>
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Am 7=2E Juli 2025 08:31:11 MESZ schrieb Krzysztof Kozlowski <krzk@kernel=2E=
org>:
>On Sun, Jul 06, 2025 at 03:21:57PM +0200, Frank Wunderlich wrote:
>> From: Frank Wunderlich <frank-w@public-files=2Ede>
>>=20
>> Increase the maximum IRQ count to 8 (4 FE + 4 RSS/LRO)=2E
>
>Because? Hardware was updated? It was missing before?

There is no RSS support in driver yet,so IRQs were not added to existing D=
TS yet=2E

>>=20
>> Frame-engine-IRQs (max 4):
>> MT7621, MT7628: 1 IRQ
>> MT7622, MT7623: 3 IRQs (only two used by the driver for now)
>> MT7981, MT7986, MT7988: 4 IRQs (only two used by the driver for now)
>
>You updated commit msg - looks fine - but same problem as before in your
>code=2E Now MT7981 has 4-8 interrupts, even though you say here it has on=
ly
>4=2E

Ethernet works with 4,but can be 8 for MT798x=2E
I cannot increase the MinItems here as it will
throw error because currently only 4 are defined in DTS=2Esame for MT7986=
=2E
>>=20
>> Mediatek Filogic SoCs (mt798x) have 4 additional IRQs for RSS and/or
>> LRO=2E
>
>Although I don't know how to treat this=2E Just say how many interrupts
>are there (MT7981, MT7986, MT7988: 4 FE and 4 RSS), not 4 but later
>actually 4+4=2E

First block is for Frame Engine IRQs and second for RSS/LRO=2E Only mentio=
n total count=20
across all SoCs is imho more confusing=2E

>I also do not understand why 7 interrupts is now valid=2E=2E=2E Are these=
 not
>connected physically?

7 does not make sense but i know no way to allow 8 with min 4 without betw=
een (5-7)=2E

>Best regards,
>Krzysztof

Hi

Thanks for taking time for review again=2E

First block are the frame engine IRQs which are max 4 and on all SoCs=2E
The RSS IRQs are only valid on Filogic (MT798x),so there a total of 8, but=
 on
MT7981 and MT7986 not yet added as i prepare the RSS/LRO driver in backgro=
und=2E
We just want to add the IRQs for MT7988 now=2E
regards Frank

