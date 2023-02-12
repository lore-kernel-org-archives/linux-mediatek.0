Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 95CD5C05027
	for <linux-mediatek@archiver.kernel.org>; Sun, 12 Feb 2023 12:33:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Message-ID:References:In-Reply-To:Subject:CC:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=iW6NHJ1DaKHka9lsuwgtqKchiHTmHzr1YJDtg/h1ekM=; b=f/avFVm5NliPmG6XfbUxu6XpQe
	GHBCC4ML/WVHjg8FsZiAM6DD2iFaaMaE/xmVbVDao3nWZfixTwkhnqu4BY8P5Rwhrogr9mZWDiEo7
	oJK3fKZ6ti1JV44BvmKyGaMAZCKEKrBGJo+xOC8TwXYfqCc6GbEQIHO/IpAaMF2saq43pX5zU7VgI
	OIm1O3fK8ndgqZD+mBlJj0mWtiv8OJICDIdMOe294XodBa0Hhu5w4iIl2/5GBmsVXd+jZg1h/k2eP
	k6OjGlIPjtAEa7/uM37mo8qFqOxyj0t9eDKkA9MYvlB5pYsiuYFA8PiIidgvAV/OB03Wp/JgTlLIN
	5K77SL3w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pRBXz-00BSGo-SP; Sun, 12 Feb 2023 12:33:35 +0000
Received: from mout.gmx.net ([212.227.17.20])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pRBXo-00BSEw-7S; Sun, 12 Feb 2023 12:33:26 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=public-files.de;
	s=s31663417; t=1676205191;
	bh=mfAdWlTjwfH3+nbkJ+Eo3z223mI2t25YvKplATELZCg=;
	h=X-UI-Sender-Class:Date:From:To:CC:Subject:In-Reply-To:References;
	b=LSu98A3PnyIOMpVWltOiGOe7kDBOmvwPKPdDzC7BbP3w6y89RWXsRjLQ9Bv6SWAsx
	 F+AMUStMG/rIB/5dMeqtqRU2uxHabKyfumtLhImNZKUHIAN68bAiJSdLiSAnXUoyTr
	 5lfgVz8/NvvzigRg1XCJubEyZJkWe2G8dIaq+yh3R2yvgo2VIdNI2L/th8nAqn+AYC
	 NAKu0TNDNYWemI5RPVTx3Iis1uWcOlkcST2SX6T0imk56lbR8x97u38VIDWJDAOdJQ
	 uuIP2NJRMnpEOXr+26TIz8pHoGQvPasEhg9ADK3n50iqSSvhrdrOUZ4NRvFQOHuc/K
	 Ko6ahi7aeiSjA==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from [127.0.0.1] ([217.61.147.13]) by mail.gmx.net (mrgmx105
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1M6lpG-1pV0Uz210g-008GgB; Sun, 12
 Feb 2023 13:33:11 +0100
Date: Sun, 12 Feb 2023 13:33:10 +0100
From: Frank Wunderlich <frank-w@public-files.de>
To: arinc9.unal@gmail.com, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
CC: =?UTF-8?B?QXLEsW7DpyDDnE5BTA==?= <arinc.unal@arinc9.com>,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 erkin.bozoglu@xeront.com
Subject: Re: [PATCH] arm: dts: mt7623: disable home key on Bananapi BPI-R2
User-Agent: K-9 Mail for Android
In-Reply-To: <20230212121354.44590-1-arinc.unal@arinc9.com>
References: <20230212121354.44590-1-arinc.unal@arinc9.com>
Message-ID: <C18B89E3-7B54-47B4-98B3-B2D74AB29A54@public-files.de>
MIME-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:3v1Q0P2cM0SvTy/PY8QCQf/wi4JtkA7j6Mx04xrx2ALTl8Wi53i
 lgYIJ8+mPhkrWdz49Fq4lS48iPxOm9ytmTDYqBDmlyGVS1a2IiNiBPyb4RJ+b9O/Q8Teuit
 vhkIr+f6w0aHU/R1UBLNvuAFEAzEgCVx7BppKgsvABifOSwUeHacW7oLaYj2gBsmbCfQRFr
 NiX/DvDj1pHSacJgtZfTg==
UI-OutboundReport: notjunk:1;M01:P0:kJHbSfdxVZU=;Zmqx7cMp7mXYWAwrv8kftavGJZd
 0yYsnF7Xsm9b+kSicIf+rvVxdx3h2WPVe8Lkj5fBi+Ewm8wAcKh00KaDHL2i+I7nOfNrtXzG5
 /CeZ3q06BwYCV9lrJPvAXvSEAqhcDaGNGc/O3OWe/zz33s51CMFo4KaLuJ5fgafAsJ90Z2Thc
 lxUScrUFp5g7TjvEZGSbymGAjmWCDUA043NNDsdP/gFXvCR2dYOxzYWYFzDJbH5htvZa1N6SZ
 e+tEuWPmyiGQUp5YqoB7GuYAS01m6AZ2yMUvpdGG9mRjgtlI2BUqu4P7QhvgzRUKCOjZvgAFi
 upFs6CGy/ih7b6VVmuTS9MLLenGOO7zZBs5vFDkm6qPNONKpGrgZB5MrrttLx3pfzNn/KOz+R
 reg1dVc7FCW895a2+Ee9KWneLWaoBMN5pMAeUOJzd8hDk4bovQMJ16EdASKBI0pPVM96DJwHR
 qXOFJm+qgYywlFIpZmbbysNb1a7sFocnH7Sex0J8yJ6D4IftB66NZ8nV5lj+HMjovu6Sj2WHU
 a7nLz7zsImDSu7lp3U3w/9wc+kIQC3fTasHyyWfUQO9wvuxqE/DB/nAJHoHmB/m/xmmBgGxTI
 d1oQCbw4HVSDrFtc54+n2MFJ64y/nFXYIRnmzOPr7SylY2FBqx660ibKcaoBdWMbT0Me+KCCs
 3Y2yB6CmllpC+cFq3LsAXgNlEiyh4cAfqtib5obK8DLrkgXQCX0dFXG0Am3Z43FQUabX3t37s
 cOAMSEGEHEJ8RIuuQDmTxN20xOYB/USFVZBhhVlLiKVZ5ic9F0YXiv6hu2upZ2z4DqwprufJj
 4qEar5pvIhkxVYFj5lUm0sI8VFnZmXVaMYKPwHJMjdhYKsfUfI7RUnyZ2Hwk9LPra/QOvr6lW
 7eiKNUVfJsWFXI4eN2ZtR7JbusnMl3N6eiB0uF9lHPVx3+HfAdcnN1dCpI1UfSi9W6Ib0ogRC
 yLGjfguf3Yo2Aht6tCWzdVa67tI=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230212_043324_576200_CE911342 
X-CRM114-Status: UNSURE (   4.97  )
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

Am 12=2E Februar 2023 13:13:54 MEZ schrieb arinc9=2Eunal@gmail=2Ecom:
>From: Ar=C4=B1n=C3=A7 =C3=9CNAL <arinc=2Eunal@arinc9=2Ecom>
>
>There's no home key on Bananapi BPI-R2=2E Disable it=2E

>=20
>+&mt6323keys {
>+	home {
>+		status =3D "disabled";
>+	};
>+};
>=20

Acked-by: Frank Wunderlich <frank-w@public-files=2Ede>
regards Frank

