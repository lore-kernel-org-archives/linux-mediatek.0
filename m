Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 09163C27C76
	for <linux-mediatek@archiver.kernel.org>; Wed, 25 Jan 2023 16:42:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-ID:References:
	In-Reply-To:Subject:CC:To:From:Date:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=I/XYpvqrK1DqQFzbaeT9L0xlHCiGajy68Z1wX83YMy8=; b=I1rMifhzhvzZv1
	BjCHf1ILDRtQTRca+6+g8aONWejVCxW5CIQRdFx9EdOUoYiCkQ/Ub8gtf8CaBrp3S5DvG3N0z40a+
	bHqKCgPhWjiqccfmrpnMoTNqyWe8O7oSWiuKIUGq/aH9JGD8oIvauyPr4GPYX9fTZXjA+X9PvwAWM
	941GQmXWS2TxIUryWwhaBewR+XAWbUeM2loa4HMgW2vDMx+eDl37dWqXbKFvUrcwk6gn43+ND9RRn
	AESnfffPjsFVXjtsoWN9056F3xQ+sNP09qOb8c2y2qgw9cEotefAL+FUxA3+HZLowYHOTDr1XBMUr
	g43iEExrTuwXuSTI/4ng==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pKiqv-0080GF-56; Wed, 25 Jan 2023 16:42:25 +0000
Received: from mout.gmx.net ([212.227.17.22])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pKiqS-00800Y-06; Wed, 25 Jan 2023 16:41:59 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=public-files.de;
	s=s31663417; t=1674664893;
	bh=rq+I8BBcOwkHDtDkBgR8HbDE4eXh6wxwg8QxpCdBsuk=;
	h=X-UI-Sender-Class:Date:From:To:CC:Subject:Reply-to:In-Reply-To:
	 References;
	b=Aib0yHDu+eyiQv28rupHTeZhOzRItxLLzzSnQWkDqzpyA/2TJf0OMdEGE4mYpX3PE
	 Av7TfeuAuAA0/G0teARI99Jmu1BgpijM1f47Hs2GqMqm1aMIW/3VyXLns9W5HcwwGC
	 Bh4NaKNuvH9T+9d6EdOkLHASvpm1lCiEwQdjNclizsuTXRDiBxOpeeA/omjkMq06aa
	 8VzAKzef5k6GW0PxwsnlBDLO14pcuhjLIjWOOaEjiEdPBeLPJekd1wINQZxOyaFsUr
	 e5p9yRWsnSr6Q2l8VTUpA7v2gWt2iAef9PkBq0erZJhIDgNQqj1fYyyo2Z0+FUvlD1
	 lLWANVNlGFAOg==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from [127.0.0.1] ([80.245.74.59]) by mail.gmx.net (mrgmx105
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1N33ET-1ofqaG02KD-013RVC; Wed, 25
 Jan 2023 17:41:33 +0100
Date: Wed, 25 Jan 2023 17:41:25 +0100
From: Frank Wunderlich <frank-w@public-files.de>
To: =?UTF-8?B?QXLEsW7DpyDDnE5BTA==?= <arinc.unal@arinc9.com>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Matthias Brugger <matthias.bgg@gmail.com>
CC: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org,
 erkin.bozoglu@xeront.com, Sean Wang <sean.wang@mediatek.com>,
 DENG Qingfang <dqfext@gmail.com>
Subject: Re: [PATCH 4/5] arm: dts: mt7623: mux phy0 on Bananapi BPI-R2
User-Agent: K-9 Mail for Android
In-Reply-To: <20230120205318.519493-5-arinc.unal@arinc9.com>
References: <20230120205318.519493-1-arinc.unal@arinc9.com> <20230120205318.519493-5-arinc.unal@arinc9.com>
Message-ID: <9A7BD95A-F026-4EAB-96E1-12B1B0C6AAA4@public-files.de>
MIME-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:CG5Ii1F2NzN0unmUtBDjSqSGd3Cfi/OGshwd2tOQ+KvmtVd8au4
 VD+h0gQ0/p3kX6FHp5MTu/2MvM0VEcPvzs+TsWPU86u26qfKhK1ThTcIyZq/oPfHxaeb+zQ
 iRGVr0cbfzoFsfcUUWOeCbHb310xYBXdWcmEA8rNipZGmw9rLIuV92BOt99UoLlBzTqsWYY
 X4UGMEBCvepZgHZ08dhVQ==
UI-OutboundReport: notjunk:1;M01:P0:K5UPTwbdRb8=;kWsV7bmkHlOyetrvEMoeRlecVhy
 txkPzft12wrIFC5uE169oHr5ThrVpekB/nkEJYYFQAwfnxsH914wxKGk4usF5NT0o8wPpNco7
 raEszTt63uPhOUvdQrutQ9XIp3Hoh4/VdOX11/eQ2oOw760xObk7ObF5Qj3EYF+LQHFVdna9u
 oP7IJQKX0xZOdc+1Nd2YVHFCxNipJ9nYsspQ68sdnubve7zngVsj9Thm7I2fbKCKhJd91IMYE
 UXrxyMN+2c7qDKVnZ5epSIlriP9eVdh2sH1QMBxfsqA9kAMektkVa515AwqomYUqJtFnDZacS
 GASml8R22UbNcI+NEHjRE5Wx7QTBv1bBkxBMf9WwF/ayua78K9mVJmFST2Dcc6p4DbTXvzc7C
 oSSeI7R1da7ecnrpkFjb6IvWblVAeTgRbcmwLMq5zfBQkbW6xZGFc2rtURM5ejDPrAdloLMIP
 GTC9aTOZupTVayK/PLIjhKv2iChEYkXbwzZ4cZOtN0KJK16D7WfvGvJgjzzGrPQzQEU06g0RQ
 V0ZdI8Yl+wd+6pLR/BHTgOS4m2T8zT6AeKo9H6skO63nWkSbw6FZv6gJMLhrhUgIi3A49UI6U
 QdNqLxuHVX46vOGDMfzggVa6AVIJG1b+xFrQfeNqClu1ySK2Sr/RkeB9ZPotnMnvyUb54dciJ
 uT9UFAOtICPOaEOZQDvO6QIlnSgB0EId302jDAKsfpfA2656PoCsByRH8xi//HXMvLHM3niOY
 eqyfVRNz5TQkdugiKPCw/42QiJvb+6tGr8lu+q6SJXkRhrnik0c4G9NJdp6XiZ+e4LSH+F2CI
 lJDIG9FSFMzr0f4drH/Y4EPww93iTWJv86nI/5VCWl1V3WyjgM2XHm41x2ntIHPA+Py41hq1d
 G2AFXASKAss8utIX1JGbmWdCEOBJIFWhHO7ZXx5IPp3dhN7jNooDgjnq4JPVmeLfbHKuRVVNi
 Grm01g==
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230125_084156_441852_DB3C91A1 
X-CRM114-Status: UNSURE (   6.27  )
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

Am 20=2E Januar 2023 21:53:17 MEZ schrieb "Ar=C4=B1n=C3=A7 =C3=9CNAL" <arin=
c=2Eunal@arinc9=2Ecom>:

> 		switch@1f {
> 			compatible =3D "mediatek,mt7530";
> 			reg =3D <0x1f>;
>@@ -199,11 +208,6 @@ ports {
> 				#address-cells =3D <1>;
> 				#size-cells =3D <0>;
>=20
>-				port@0 {
>-					reg =3D <0>;
>-					label =3D "wan";
>-				};
>-

This will break existing userspace setups using wan as interface name=2E

> 				port@1 {
> 					reg =3D <1>;
> 					label =3D "lan0";


regards Frank

