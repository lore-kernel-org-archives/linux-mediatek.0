Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9A5CDC47DDF
	for <linux-mediatek@archiver.kernel.org>; Thu,  1 Feb 2024 11:40:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-ID:References:
	In-Reply-To:Subject:CC:To:From:Date:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=0ml7viK80JH0Jva8+KAcBgTkHRB2cpSTmxKESK/H3VU=; b=MZBVgAmP6bK6W5
	BTBUJ+9Vj+2IsI/nr2idCeL6/Hw2lrNrZat6K9O7AqsD6M7316rFZZlANlQ65p8HA+pdkVIpOagyt
	PrgjziumtwPA/g1ImskL9+EJGKopBCVbDWdVWemCh0n65ZSR9+yBJ8K8Zp6sPTD/WnNSq+JobBYt/
	8H7xdi3JP4SCNLc1OcPLpvGMy+DCWBZGTT+AAioP2DGE3EY4NwJHFA5qXF3gygPjWxB0/m0vqDYBu
	tKWtfSs/0qnmcLvKUJgiinHiUDsQHsUjvv0hCnmDFxJkanHhc4eTn2kcS7IBY2ifBGpiJmDn2NMHe
	fAXdGQlH+p7GILCpKlwg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rVVQv-00000007cBM-0NX1;
	Thu, 01 Feb 2024 11:40:41 +0000
Received: from mout.gmx.net ([212.227.17.20])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rVVQr-00000007c7U-0ll7;
	Thu, 01 Feb 2024 11:40:39 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=public-files.de;
	s=s31663417; t=1706787620; x=1707392420; i=frank-w@public-files.de;
	bh=0ml7viK80JH0Jva8+KAcBgTkHRB2cpSTmxKESK/H3VU=;
	h=X-UI-Sender-Class:Date:From:To:CC:Subject:Reply-to:In-Reply-To:
	 References;
	b=Gb/4rflUUnnLFGxlwx6g6lBB1v1L7/XE05d5gFvf5JXZD7yB752i0+4ejoMT8y30
	 69ogzd1P38x2+Rc8ve5u6nMotZgucM57eRVVHJCa0cLPtKIce0/ROZlfNILk3zCRD
	 OylAaGWJmzLcuRn2ZvwqsAmNkOQYQAIxObILRNe7juejwjKGanUqP4EK3dLIM2bzF
	 YPWSx0CGQ+6GQODxfYQlaqsuK+b3u2nOoBQhII6+pJaRXciasb3c89dIDIakNUWDn
	 XsEEZoitD5ZTN+76CAjLk/N/5TPARvNcZF/ipWTXmGWLcaWK/yQ4/aXCIzDyQhY/8
	 c1tWUYoABVhf4CR8/g==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from [127.0.0.1] ([217.61.148.248]) by mail.gmx.net (mrgmx105
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1Mw9UK-1rEwXw1fXg-00s97s; Thu, 01
 Feb 2024 12:40:20 +0100
Date: Thu, 01 Feb 2024 12:40:17 +0100
From: Frank Wunderlich <frank-w@public-files.de>
To: Conor Dooley <conor@kernel.org>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
CC: Frank Wunderlich <linux@fw-web.de>,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Philipp Zabel <p.zabel@pengutronix.de>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>, Sam Shih <sam.shih@mediatek.com>,
 Daniel Golle <daniel@makrotopia.org>, linux-clk@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 devicetree@vger.kernel.org, linux-mediatek@lists.infradead.org
Subject: =?US-ASCII?Q?Re=3A_Aw=3A_Re=3A_=5BPATCH_v3_1/2=5D_dt-bindings?= =?US-ASCII?Q?=3A_reset=3A_mediatek=3A_add_MT7988_reset_IDs?=
User-Agent: K-9 Mail for Android
In-Reply-To: <20240119-dupe-obligate-707b3a01b356@spud>
References: <20240117184111.62371-1-linux@fw-web.de> <20240117184111.62371-2-linux@fw-web.de> <20240118-calcium-krypton-3c787b8d1912@spud> <trinity-afc4f48e-65e1-46ee-a78b-1d670cc0f310-1705615200900@3c-app-gmx-bap21> <43f946cc-07e1-48c5-9b31-40fc9bc93037@collabora.com> <20240119-dupe-obligate-707b3a01b356@spud>
Message-ID: <0EA6A126-DDC0-4E9F-BEBC-FD018B08CA84@public-files.de>
MIME-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:y1z6Q7jXj+pqO1HZuYlxzuYbo5XGWT2nhBglJsaS3D/jXYPHO/E
 fqQckoUFrqWOYtFnR0avV/83ZiKtvFzTv0jNqDkQ4JQkSYb1R4TamPDpKXNjN/ArOiiFzUw
 zz54ZZENgvZguVYhLrfnI8TdVnyLp9SGIgiAOMryKrfSKWWH0/gDELEWzHvIOTEo1pVI+ZW
 WyQJhWE01UcOjxOi5rADA==
UI-OutboundReport: notjunk:1;M01:P0:pWne6h6kXCc=;pZaGvfKj0LTWoHMsy0FDDU4zrVI
 CewLpa8CIG3a3PXERoJlwqw5wE5gAL0HhZsj4pEcxrPQvzVCVfQSNrL5EPhEoFZmJRbcplvbO
 Cr4RQGG+PggquRYr3QnqvRhEEVsNfJ8blN83TiVomrrbUE3tDo4rfMOVLX+J9/QPtGxjP8KRG
 X6sTL5tZgtMjmONbS3Tfusw12GL9d9uwaIj7kiWolOyx8dOozA4MGW10/cc0NECcImpwo1yrI
 TgksSBZihpqet5jMBEa9imsZUFvGFEh3md2Bitg5AOQw0pr8AQ6dMlxasEC+ADew9ZTSSZmck
 IwZGJCEkg5gK6DcwhV8JS/fnCNn5Pa6YF5Qa6Tnpa/VMzZVvVUY/PaxM/mOuL79OacrFDYkI3
 co5g4gco8F/LJ4AuBIwUTlXWrWTL0Nsv0IHVXnOlvvQUP124TL6mMPoENzEu5oS+kKiW1kdZc
 4Dt4u/J3rW4/3ZGBLUeUF07OwXya0By3rfTCafR6UDBECjR7bLTD86S55bn9DrqmTblL/GjQY
 a68XW1M7h0d6ifO/98UR2YXp2eqP6G9RJu3nV155M86fPK4vA/DZfn5EopIz653pDnT/QYm/m
 nWFeupFQLb9JJuaH/GIhFjVJvpJhop7gU1Tc2vIt6S5iiAB6LZ6sSbJXw5ye/z8CeC/8XHC4s
 yrDK6lXHTNF1F27cFzLy+g9fvkKb9dDCRHaWSL9SsO68hLAFJQCy2zQ3uAZP9GT9UuyI74oPU
 X97C3XhX/ZKHMTvnfzMGtaQbu59TuCB5C/Rm2QQxZyXBZMuq+QrjQetUoOxTgU2GFJx3wSGbN
 8bo840wwR7QOQi3H0YvPAUJzHxtS6gyeYT+fooHIZAwYw=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240201_034037_759066_4B46CBFF 
X-CRM114-Status: GOOD (  14.41  )
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

Am 19=2E Januar 2024 18:04:36 MEZ schrieb Conor Dooley <conor@kernel=2Eorg>=
:
>On Fri, Jan 19, 2024 at 10:28:30AM +0100, AngeloGioacchino Del Regno wrot=
e:
>>
>> The resets are organized on a per-reset-controller basis, so, the ETHWA=
RP
>> reset controller's first reset is RST_SWITCH, the second one is RST_som=
ething_else,
>> etc=2E while the first reset of the INFRA reset controller is PEXTP_MAC=
_SWRST=2E
>>=20
>> That's why ETHWARP has a reset index 0 and INFRA also starts at 0=2E
>> I think that the numbering is good as it is, and having one driver star=
t at index 5
>> while the other starts at index 12 would only overcomplicate registerin=
g the resets
>> in each driver, or waste bytes by making unnecessarily large arrays, fo=
r (imo) no
>> good reason=2E
>>=20
>> This is one header, but it should "in theory" be more than one=2E=2E=2E=
 so we would have
>> one for each hardware block - but that'd make the reset directory over-=
crowded, as
>> other MediaTek SoCs have got even more resets in even more hardware blo=
cks than the
>> MT7988=2E That'd be something like ~4 reset headers per SoC (and will i=
ncrease with
>> newer ones)=2E=2E=2E
>> =2E=2E=2Eand this is why we have one binding header for resets=2E
>
>That's okay=2E The commit message leaves me, who clearly isn't a mediatek
>guy, with no information as to why these are not one contiguous set=2E
>IMO being for different reset controllers entirely is fine=2E
>
>> On the topic of leaving space to allow grouping RST0/RST1: -> No=2E <-
>> The indices have to start from zero and have to be sequential, with no =
holes=2E
>
>Agreed=2E

Hi,

Just a friendly reminder=2E

As far as i understood, Patches are fine so far and do not need any rework=
,right?

But i have not seen them picked up yet in linux-next=2E
regards Frank

