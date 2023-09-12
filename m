Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DC07EEE3F29
	for <linux-mediatek@archiver.kernel.org>; Tue, 12 Sep 2023 20:38:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-ID:References:
	In-Reply-To:Subject:CC:To:From:Date:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=37HUITb6LdSZ+O2wnDjc/sxq8EMiDMZlcaSvkcGEQvw=; b=dR496HHwknZa/s
	TJ0BOQQ9dc8K+1OgjLTk7e0kTMdGn0cGVG542oxB/K21LQ6mN/xfldToeq3UTcEOE19yik0Pd7OTl
	nwQKkaotlqNSaEWHEcPb+EP09zspk1JbZPC6Y57rB4eWVk5dM6tW2s6ZuS9kmJcTIdBFMPY7Dkkzt
	QlVM2IrMxVgSeFQnJJcrzNQIgcYNPctAJtUHGHSNikGLrpnr83ttUypJqBDuDoFaDfzLonMOEdJ3l
	qQxKjPmHX167eQVROnvedpdDtWDBzRZlZWGBnotrcHJ+UihCGbsCBdMBL6YyE3IL1YYJlaBHim+al
	V3ck1G8WfWJpBLxJt/Kw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qgA9W-0045sk-32;
	Tue, 12 Sep 2023 20:38:30 +0000
Received: from mout.gmx.net ([212.227.15.15])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qgA9T-0045rh-1m
	for linux-mediatek@lists.infradead.org;
	Tue, 12 Sep 2023 20:38:29 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=public-files.de;
 s=s31663417; t=1694551100; x=1695155900; i=frank-w@public-files.de;
 bh=3f5UiZlA8nKn8viAmwMIfvgTRl8FZPm5CRqjg7mq39I=;
 h=X-UI-Sender-Class:Date:From:To:CC:Subject:Reply-to:In-Reply-To:Referenc
 es;
 b=D77qv+r8idb/u+/830Yzd5IvchdUUOZiqLkGJZ7QD30JGftj4btmrsqHRuP1kCBKoMbkVNc
 jxwzpZRQvG9CbLxHqg0xcoYty7nHXNoHBd8pi/+paJ69URfLJyOOTRSQMTeGbPjhKKpy2f0Ac
 sSLSF5IPItEG0bKwUxw1sr0L4pzSZE6ylJ9nR+Cpmr0nuzRo+rBLsadsqhiNy8n2609AeB2qQ
 E/elxEdH8y2x6gF96piblXd0sOd6d1AACcp3vtnrpL74b0oIeYotdFd9Y1C7JUum6cSThuuyt
 PAWCb7IRWjn6oCE1ij9zlE8tv75m8tnczcCARBDxs0mIreTlvWcQ==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from [127.0.0.1] ([217.61.158.105]) by mail.gmx.net (mrgmx004
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1N0X8o-1rcGZr3NIq-00wV5O; Tue, 12
 Sep 2023 22:38:19 +0200
Date: Tue, 12 Sep 2023 22:38:21 +0200
From: Frank Wunderlich <frank-w@public-files.de>
To: Markus Schneider-Pargmann <msp@baylibre.com>,
 Daniel Lezcano <daniel.lezcano@linaro.org>
CC: Fabien Parent <fparent@baylibre.com>,
 Amjad Ouled-Ameur <aouledameur@baylibre.com>,
 Daniel Golle <daniel@makrotopia.org>, linux-mediatek@lists.infradead.org,
 linux-kernel@vger.kernel.org, Alex Riabchenko <d3adme4t@gmail.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Matthias Brugger <matthias.bgg@gmail.com>
Subject: =?US-ASCII?Q?Re=3A_regression_with_33140e668b10_thermal/driv?= =?US-ASCII?Q?ers/mediatek=3A_Control_buffer_enablement_tweaks?=
User-Agent: K-9 Mail for Android
In-Reply-To: <20230912134617.jwonuolt56nofifz@blmsp>
References: <trinity-6713557b-fe0a-4dae-84aa-1aa86f7619fa-1693473911557@3c-app-gmx-bs12> <trinity-f3e7d8e0-2e93-4e84-a489-3993c819d2c3-1693488871086@3c-app-gmx-bs12> <07a569b9-e691-64ea-dd65-3b49842af33d@linaro.org> <20230912134617.jwonuolt56nofifz@blmsp>
Message-ID: <B0B3775B-B8D1-4284-814F-4F41EC22F532@public-files.de>
MIME-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:fVM145ezhiwF/zqxfd8StOMbPCCiKOrRk4+H4gjtGd9CQfxUqUG
 XY7resjYBHZ+W/70zKN3x37/2g0wsK1vWPJhebH/OFSZNrcZxv1jt0zRMHK2SnC4VXaaZyz
 SItZHhGfBSV6xurIFj20GbMpv0CWg7Cbl2yuVj/bycPOw3nwYvaSGwwpXDsfPLc1YLrlKQN
 KMYrnyzbRzl4955oHINNQ==
UI-OutboundReport: notjunk:1;M01:P0:VPrnAZmP0ik=;VULxiDso5UE0QCU2TeetDf3PdzQ
 tkpZWPGMVbtyqTXztpQsFJb7u+WpZDIpgzJ2M7AE78vWisERmtONJNiX7eJSeHEt7knn/UQ/s
 IvGW9SSBStGsuLgy8yhmUDO4qPCxrgJroWGUltJJbCcmzsMg/v2NdMjZltRBN/u1B7Gr5lCnK
 unpfU4IFqQhfa+5tPogjg41soATo//4d7q3fLotuE4/0l+f1OhwMAH8+mU8iB5e6tP6EyeJeV
 V+rPlc6K0NuNrkYsFHOuW8OvDdKD7e4RbTOCzSBEEJQjqUzEEZ4nSLSvToKVGrElde36iEWwz
 uDtlbNKkDrs5VUeF8X0dI7sC7ZbaSSRxKyTMSyp4SioTqx4xTe+D39dk1L5YsOymeBH4a1vXo
 QU/98YzRAeP/JBncwREPN7PQTJGd0pe5RP4UpuASKA1y288q/im6KiUa1oxXjKrLEAzZ/WvtR
 Y6TBSp3TQkE4cjYHikcXFMQgvzYs1h1F/Lvb6S5IF9LtBFqqcC0ZGdxhp6+r/sbTHlxUPpJp9
 YrU0aMhhB7sP1ZVD6VKbpxKX1K59xOJUQPCdPmNpxsrdxc0+Q5+N3gWkQ2htiHHz4/Rsz1xWG
 ekl4hO+zTpsax51MAqn/ghycG0SPm0y/E49dTNdPwY4T9LfC+fERiCukGjhtF3P96N4wmPkma
 WUAEeIHKUtmOgmhqkJKLYDn1SF+Xpv2vJZQNWcz2vBKZR+KSCRO2z3mxwGhH2EwkXYrvGewO6
 OIesC5UIMj17DdsLbBppQqZT5oAcXN3CFfYgSbqLlV9HHdQgVjHCzvvXQClr/6pkr8vwo0WYA
 jEmQVznHGU2TYlD8JwnkV3yIGGiHafMu+OhSbBuJKlW5JJnRVWj9bssW1bszFK1X5YA7Kl6/i
 PXQWVj9mQ7JQtG7AmzkMgOJYukoC+jjlJP4c6oB2ERRNhHzsXrhNXnh/4bWlCB1ibMMYIvoxN
 mdtlp181luHyp0qbnatRMokPcVU=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230912_133827_976039_16C25DEA 
X-CRM114-Status: GOOD (  18.84  )
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

Am 12=2E September 2023 15:46:17 MESZ schrieb Markus Schneider-Pargmann <ms=
p@baylibre=2Ecom>:
>Hi Frank and Daniel,
>
>On Tue, Sep 12, 2023 at 02:57:45PM +0200, Daniel Lezcano wrote:
>>=20
>> Hi Frank,
>>=20
>> thanks for reporting and investigating the issue=2E
>>=20
>>=20
>> On 31/08/2023 15:34, Frank Wunderlich wrote:
>> > Hi,
>> >=20
>> > looked a bit deeper into it and it looks like i only need to add the =
fields in the mtk_thermal_data struct
>> >=20
>> > --- a/drivers/thermal/mediatek/auxadc_thermal=2Ec
>> > +++ b/drivers/thermal/mediatek/auxadc_thermal=2Ec
>> > @@ -690,6 +690,9 @@ static const struct mtk_thermal_data mt7986_therm=
al_data =3D {
>> >          =2Eadcpnp =3D mt7986_adcpnp,
>> >          =2Esensor_mux_values =3D mt7986_mux_values,
>> >          =2Eversion =3D MTK_THERMAL_V3,
>> > +       =2Eapmixed_buffer_ctl_reg =3D APMIXED_SYS_TS_CON1,
>> > +       =2Eapmixed_buffer_ctl_mask =3D GENMASK(31, 6) | BIT(3),
>> > +       =2Eapmixed_buffer_ctl_set =3D BIT(0),
>> >   };
>> >=20
>> > in my quick test the temprature can be read again and i'm near room t=
emperature=2E=2E=2Ei though it was a bit higher before, but as far as i und=
erstand the code, the values were fixed before and only made it configurabl=
e=2E
>> >=20
>> > if someone can confirm that i'm right, i can send official patch=2E
>
>Sorry for the delay, this was in my inbox but somehow not on my todo
>list=2E
>
>The patch looks correct=2E I think I simply missed adding the fields for
>MTK_THERMAL_V3 chips=2E Sorry!
>
>>=20
>> At the first glance, it seems the proposed change is correct and could =
be
>> proposed as a hot fix=2E
>>=20
>> However, the conditions with the version and the apmixed_buffer_ctl_reg
>> looks a bit fuzzy=2E
>>=20
>> Markus, can you revisit this part of code and consolidate the configura=
ble
>> approach ?
>
>Yes, it indeed looks like I broke another condition there=2E I will give
>it another close look and send a fix=2E
>
>Best,
>Markus

Hi

I already sent the Patch below

https://patchwork=2Ekernel=2Eorg/project/linux-mediatek/patch/202309071120=
18=2E52811-1-linux@fw-web=2Ede/

If it is correct (handled the same way as mt7622 before) you have not to s=
end a patch=2E

But you should maybe check condition !=3DV2 is correct when loocking on v3=
=2E

https://git=2Ekernel=2Eorg/pub/scm/linux/kernel/git/torvalds/linux=2Egit/c=
ommit/drivers/thermal/mediatek/auxadc_thermal=2Ec?id=3D33140e668b10200b7757=
79f302b143b32e6ae7ca

Regards Frank

