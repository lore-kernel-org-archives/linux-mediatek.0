Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 51F3DC6FD1D
	for <linux-mediatek@archiver.kernel.org>; Tue,  4 Apr 2023 19:38:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Message-ID:References:In-Reply-To:Subject:CC:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=E2DTXl0wOTGge7LqnlEIvHTLL1rOaURDHtKaO0WFHcU=; b=lyWHeSd2EQBrHobodSVKzSxn9+
	/2Sys/4oUDtUQfyNIXCiq8pWZnPUKV7Ko7fROVgTYQp5dUzngnoER4y0c83R08zwHoFRj8wr8+sd0
	AI/2smmk4TMcaZvwibbKZMEBSpsG6Ktw/yp9ex5M5tuV/wkrZnLq8ZlBjPlBld9JudINYQo5BnbEo
	vPnl7M2kCR3Jc4H0kQoc77rfMvj9bDTvQbTsY2SWFNHZX7RVHEDqMo2ciRW86Q53NvTf3THrjUhsf
	zp0t8b1yuQCV9IZTkfYp7UBCixt7cdDx/6YBRcaNYa2dilbGUYEouwqqt/VI6uggtX5i5dB8zsr8D
	SPUMJ63g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pjmTg-002gGs-14;
	Tue, 04 Apr 2023 19:38:00 +0000
Received: from sender4-op-o10.zoho.com ([136.143.188.10])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pjmTc-002gCl-0E;
	Tue, 04 Apr 2023 19:37:57 +0000
ARC-Seal: i=1; a=rsa-sha256; t=1680637056; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=jr+O2D0F76JJU7kSwZlZ6I294JwkWu+0UOCw8XpzFlLFbtUlKp/Hhm8guCdhJGvS3U2CyVY2c/bJ5qXETP+gPh5atKuOmev9QccpfiTF3XzsLRd/m1fkTN9Fq1+P+0FS3PVf5N4QD5kZGGFuZoV9vb1B/TJ0wznJu7drD1vTO1Q=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1680637056; h=Content-Type:Content-Transfer-Encoding:Cc:Date:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:To; 
	bh=E2DTXl0wOTGge7LqnlEIvHTLL1rOaURDHtKaO0WFHcU=; 
	b=boRmo8TnI/Eg0BvnA8v+KFgkFPo+LaF1kW8D4awVhqktQE/OgLNlcth4BlHf7hvA7El2P0vuiPS1xGjeBrHWN1Adlp2uGFz5RJeqMDRim/Dkudy5cuUZiaN5sRyGICgypefJku2DRiHO2qN3nzHZte+nC8L6zu8hBr93zTesvu4=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=arinc9.com;
	spf=pass  smtp.mailfrom=arinc.unal@arinc9.com;
	dmarc=pass header.from=<arinc.unal@arinc9.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1680637056;
	s=zmail; d=arinc9.com; i=arinc.unal@arinc9.com;
	h=Date:Date:From:From:To:To:CC:Subject:Subject:In-Reply-To:References:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:Reply-To:Cc;
	bh=E2DTXl0wOTGge7LqnlEIvHTLL1rOaURDHtKaO0WFHcU=;
	b=ab753m7vvr7p0QelL1tg4ktxsIc5LvHNShTljT4isc+D44+NfP7kB/w8w551FhGs
	yr6LtcGzftMAyE8pIwTcpVZNsjrN5Bwx8q/fe0flkk20nWEW9qTligyxgyPEqmodufy
	a3rCZF/Mg3c9URAsf3Mhc2G+vbLJYkd+Tl/YPYNk=
Received: from [127.0.0.1] (149.91.1.15 [149.91.1.15]) by mx.zohomail.com
	with SMTPS id 1680637054373581.3705118144012; Tue, 4 Apr 2023 12:37:34 -0700 (PDT)
Date: Tue, 04 Apr 2023 22:37:22 +0300
From: =?UTF-8?B?QXLEsW7DpyDDnE5BTA==?= <arinc.unal@arinc9.com>
To: =?UTF-8?B?TGFuZGVuIENoYW8gKOi2meeajuWujyk=?= <Landen.Chao@mediatek.com>,
 "olteanv@gmail.com" <olteanv@gmail.com>, "andrew@lunn.ch" <andrew@lunn.ch>,
 "arinc9.unal@gmail.com" <arinc9.unal@gmail.com>,
 "f.fainelli@gmail.com" <f.fainelli@gmail.com>,
 Sean Wang <Sean.Wang@mediatek.com>, "kuba@kernel.org" <kuba@kernel.org>,
 "edumazet@google.com" <edumazet@google.com>,
 "pabeni@redhat.com" <pabeni@redhat.com>,
 "dqfext@gmail.com" <dqfext@gmail.com>,
 "matthias.bgg@gmail.com" <matthias.bgg@gmail.com>,
 "davem@davemloft.net" <davem@davemloft.net>,
 "angelogioacchino.delregno@collabora.com" <angelogioacchino.delregno@collabora.com>
CC: "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
 "erkin.bozoglu@xeront.com" <erkin.bozoglu@xeront.com>,
 "netdev@vger.kernel.org" <netdev@vger.kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "linux-mediatek@lists.infradead.org" <linux-mediatek@lists.infradead.org>
Subject: =?US-ASCII?Q?Re=3A_=5BPATCH_net_2/3=5D_net=3A_dsa=3A_mt7530=3A_move?= =?US-ASCII?Q?_lowering_TRGMII_driving_to_mt7530=5Fsetup=28=29?=
User-Agent: K-9 Mail for Android
In-Reply-To: <4d9c562eb980642381cb43f65efb2ee13d742485.camel@mediatek.com>
References: <20230320190520.124513-1-arinc.unal@arinc9.com> <20230320190520.124513-2-arinc.unal@arinc9.com> <4d9c562eb980642381cb43f65efb2ee13d742485.camel@mediatek.com>
Message-ID: <87B17946-4602-4D27-8756-7481846EDE35@arinc9.com>
MIME-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-ZohoMailClient: External
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230404_123756_187541_2A3D3298 
X-CRM114-Status: UNSURE (   9.63  )
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
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On 26 March 2023 21:13:49 GMT+03:00, "Landen Chao (=E8=B6=99=E7=9A=8E=E5=AE=
=8F)" <Landen=2EChao@mediatek=2Ecom> wrote:
>On Mon, 2023-03-20 at 22:05 +0300, arinc9=2Eunal@gmail=2Ecom wrote:
>>=20
>> I asked this before, MT7530 DSA driver maintainers, please explain
>> the code
>> I mentioned on the second paragraph=2E
>>=20
>> ---
>> @@ -2207,6 +2198,15 @@ mt7530_setup(struct dsa_switch *ds)
>>=20
>>         mt7530_pll_setup(priv);
>>=20
>> +       /* Lower Tx driving for TRGMII path */
>> +       for (i =3D 0; i < NUM_TRGMII_CTRL; i++)
>> +               mt7530_write(priv, MT7530_TRGMII_TD_ODT(i),
>> +                            TD_DM_DRVP(8) | TD_DM_DRVN(8));
>> +
>I guess you ask this part, and I try my best to recall what the
>original author said years ago=2E
>It is used to adjust the RX delay of port 6 to match the tx
>signal of the link partner=2E

Ok, thanks for replying=2E I will move this at the end, inside 'if (trgint=
)'=2E Since this doesn't lower the driving, there's no apparent benefit to =
run this if trgmii is not being used=2E

Ar=C4=B1n=C3=A7

