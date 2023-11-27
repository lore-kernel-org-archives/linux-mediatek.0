Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 771E1C4167B
	for <linux-mediatek@archiver.kernel.org>; Mon, 27 Nov 2023 11:30:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Message-ID:References:In-Reply-To:Subject:CC:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=NhGJjrTTtgimxfRNbfSScr4mzO4GO8LCiZ6yeATg9+M=; b=llsy4M1REaAwc01B7v8aryK4GJ
	KqJR1fp6nWahErWbybFrTASi6B++6Ten/0tgyZ8JmNddfKUBxLr1iHFLkJad2T2r1sYAIGHmRRkt8
	obOIdr8Kcm0xC3/Ih4FAeV2QjmGiOyLC1uJ5C9iUBqGIUc/NaL2JVPfo41oanM+x9PKU8vETvlnFm
	RxP0ii/DWI+M04bSDZycCqROHD1zhIeNUL/QMm6REVA+IWvvv1vzKIY4+moJHA0ijp6sDRu5WMnUV
	P85pAqG0/Di7eseQjOMjTvuaPr3T08QCNTuE9GdbP6TH+IAK1443WxNi7ZTCig8gXXhERWd81eIQV
	mS3I7/Jw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r7Zoi-002Dmj-0h;
	Mon, 27 Nov 2023 11:30:20 +0000
Received: from relay3-d.mail.gandi.net ([217.70.183.195])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1r7Zoe-002Dl7-0S;
	Mon, 27 Nov 2023 11:30:17 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id 64C3160015;
	Mon, 27 Nov 2023 11:30:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arinc9.com; s=gm1;
	t=1701084611;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=NhGJjrTTtgimxfRNbfSScr4mzO4GO8LCiZ6yeATg9+M=;
	b=npQAcUWNK817PNnMtIdROlqCU68u6J61oYaZWTMkiXUcjId2TZsw9+CYlsWf1Twe1A7QsX
	PPvsguZ8kGHxSACCttFXMA6c2ei3G64kYeMy+O4ks2hYu6y7mO1bjtaBqADr6WclX07srH
	155/YPZ39tOrpqzZESeecLaJ0vM0tOdKlwJmCioV8VOiHnuGB2t0K6hin8yJ4p+UipZkS9
	t5j2c/ATP0vtoe0KQ5MEYPyYsg6f2MBpD8LbOYBm9JGdhTJriRAjtlFHetKxHJBG4Y/nSi
	eGI5gzotSHzqYhUoB84bkoQOt+uUn+iPOWfQusWJrH5LtOwNCxqAp99XSnibiA==
Date: Mon, 27 Nov 2023 13:30:00 +0200
From: =?UTF-8?B?QXLEsW7DpyDDnE5BTA==?= <arinc.unal@arinc9.com>
To: Daniel Golle <daniel@makrotopia.org>
CC: Vladimir Oltean <olteanv@gmail.com>, Andrew Lunn <andrew@lunn.ch>,
 Florian Fainelli <f.fainelli@gmail.com>,
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Landen Chao <Landen.Chao@mediatek.com>, DENG Qingfang <dqfext@gmail.com>,
 Sean Wang <sean.wang@mediatek.com>, netdev@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org
Subject: =?US-ASCII?Q?Re=3A_=5BPATCH_RESEND_net-next_2/2=5D_dt-bindings=3A?= =?US-ASCII?Q?_net=3A_dsa=3A_mediatek=2Cmt7530=3A_document_MDIO-bus?=
User-Agent: K-9 Mail for Android
In-Reply-To: <ZWPIQW1JA3rsvAzm@makrotopia.org>
References: <6eb1b7b8dbc3a4b14becad15f0707d4f624ee18b.1691246461.git.daniel@makrotopia.org> <9aec0fe0cb676b76132c388bb3ead46f596a6e6e.1691246461.git.daniel@makrotopia.org> <dcb981b9-b435-c0e5-8e47-d66add207fdc@arinc9.com> <20230808121707.chona7hakapp6whe@skbuf> <44fde617-1159-4961-84c4-372fe265fbd8@arinc9.com> <20230809220102.t3dqw7iojez5xsq3@skbuf> <3f262579-eec1-4b21-9b18-1d1d612e715b@arinc9.com> <ZWPIQW1JA3rsvAzm@makrotopia.org>
Message-ID: <D03B73C8-0DD4-459E-8BA3-C1A0B16809A3@arinc9.com>
MIME-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-GND-Sasl: arinc.unal@arinc9.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231127_033016_477318_13E3DA5F 
X-CRM114-Status: GOOD (  12.83  )
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

On 27 November 2023 00:35:45 EET, Daniel Golle <daniel@makrotopia=2Eorg> wr=
ote:
>On Sat, Aug 12, 2023 at 01:45:29AM +0300, Ar=C4=B1n=C3=A7 =C3=9CNAL wrote=
:
>> On 10=2E08=2E2023 01:01, Vladimir Oltean wrote:
>> > [=2E=2E=2E]
>> > Since commit fe7324b93222 ("net: dsa: OF-ware slave_mii_bus"), DSA as=
 a
>> > framework also supports auto-creating an internal MDIO bus based on t=
he
>> > presence of the "mdio" node name, so I guess it makes sense for the
>> > "mdio" to appear in the generic dsa=2Eyaml if there's nothing else th=
at's
>> > special about it=2E
>>=20
>> I agree with this=2E I've done this which works=2E It's even found a po=
rt
>> node with the ethernet property missing, as it should've=2E
>
>Are you planning to complete/submit your work below?
>I'm asking because being able to reference the PHYs on the internal
>MDIO bus is mandatory on MT7988 which requires calibration data from
>NVMEM for each PHY, so supporting MT7988 depends on the associated
>driver change[1]=2E
>
>[1]: https://patchwork=2Ekernel=2Eorg/project/netdevbpf/patch/6eb1b7b8dbc=
3a4b14becad15f0707d4f624ee18b=2E1691246461=2Egit=2Edaniel@makrotopia=2Eorg/

This patch triggered conversation on a deeper level regarding the
devicetree bindings aspect of it=2E I will continue discussing that with t=
he
maintainers here and achieve a mutual agreement=2E

To get things going on the driver side, I think it's fine to submit that
as a single patch=2E I'll do that in a week, if nobody else does it first=
=2E

Ar=C4=B1n=C3=A7

