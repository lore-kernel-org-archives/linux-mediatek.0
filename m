Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4B47EC27C4F
	for <linux-mediatek@archiver.kernel.org>; Sat, 29 Jun 2024 17:35:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:References:Cc:To:Subject:From:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=tsJg2UT0g/WSTAeN0OossZ9r+TgWqAkhMXJOZv5nhmg=; b=oaQ5+1v4OJMnjEmSUtkegtn9wG
	PbnYOkIzMxix6WTtiDFgMcb4fU81GQEx4ag3pPnuCAkn0Cejukk/1QbNleQ3/+fver5FNap/V/caP
	HiX3iy0yGd9yPm4/gqPH4z8MUBeEfioYjof0/PO5bTcPceXMQBXqzNRUar63+xK9bg5kkCED4bjog
	4oX1SqrJBtkz1Uv4R//gLlB7xREO8NcrxZQnxGCx2ItrEXa6QuHAIlVRfwVi+t4j4uSaIb0/bXuHX
	ePn9D2BbbKYUAOYOBDJcfb225jQffgPhGRRx6vgmK5u9P1VrE6CGfZhgIuHu4ZTsNSMVylIivRU3y
	FG09Ovug==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sNbzD-0000000Gifh-0dMb;
	Sat, 29 Jun 2024 17:35:43 +0000
Received: from mout.web.de ([217.72.192.78])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sNbz2-0000000GieU-39Kl;
	Sat, 29 Jun 2024 17:35:34 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=web.de;
	s=s29768273; t=1719682519; x=1720287319; i=markus.elfring@web.de;
	bh=tsJg2UT0g/WSTAeN0OossZ9r+TgWqAkhMXJOZv5nhmg=;
	h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:From:Subject:To:
	 Cc:References:In-Reply-To:Content-Type:Content-Transfer-Encoding:
	 cc:content-transfer-encoding:content-type:date:from:message-id:
	 mime-version:reply-to:subject:to;
	b=B+epOElVMYgXswpTdA5mRf6qTcC2Gx0fzEhcDHw5s5nkT5d5aMTz1ZhQZFi5hU02
	 3X/+HskmAxZVytDvl8MBVFp/SkcieaiYOLld8ODp0Cz2+uldK966Kxqji29REhhgN
	 P3IJRkiOE989iEhMRrWduoE0JMXAf40AH8KWzoxvv+oaoA8eC8OXyIA+u9Bf6L/HI
	 uEygyCcJJ5k1x1qb/vLVNbJUZ2INU6EoqGAK/1HYiwuB9puvZZGFXKmreMopvroJq
	 JyktWO2a8OYUGJ9PIuHBjyOD6ORUwwopCZa335gyyn3nBu9D+CsZd814Bn3nYBiHL
	 Q1TCBVGSfCwj0LODZg==
X-UI-Sender-Class: 814a7b36-bfc1-4dae-8640-3722d8ec6cd6
Received: from [192.168.178.21] ([94.31.82.95]) by smtp.web.de (mrweb105
 [213.165.67.124]) with ESMTPSA (Nemesis) id 1N4N9I-1sGYvR0bQ6-00zBAC; Sat, 29
 Jun 2024 19:35:19 +0200
Message-ID: <9f67af8b-9c8c-4ad6-88c3-03d9fd9673d2@web.de>
Date: Sat, 29 Jun 2024 19:35:01 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Markus Elfring <Markus.Elfring@web.de>
Subject: Re: [PATCH v2 1/2] arm64: dts: mediatek: mt7622: readd syscon to
 pciesys node
To: Christian Marangi <ansuelsmth@gmail.com>,
 Frank Wunderlich <frank-w@public-files.de>,
 linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 devicetree@vger.kernel.org, linux-clk@vger.kernel.org,
 Angelo Gioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Conor Dooley <conor+dt@kernel.org>, Krzysztof Kozlowski
 <krzk+dt@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>,
 Michael Turquette <mturquette@baylibre.com>, =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?=
 <rafal@milecki.pl>, Rob Herring <robh@kernel.org>,
 Stephen Boyd <sboyd@kernel.org>
Cc: stable@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>
References: <20240628105542.5456-1-ansuelsmth@gmail.com>
Content-Language: en-GB
In-Reply-To: <20240628105542.5456-1-ansuelsmth@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:v8gBJ2lGpjG9X3tIzafMhs3tI5PY4M5B34TedERy2La5e4vj+id
 4Fp2ViEGYUwJKeWuxBkYDYwAPlaXtJbpgWSDpucxZjT/bLtrEKyJTo15qU2ZypHtriQukLW
 95oWGGQ3uQYixiAlYFNCzpWAjQO2zOVBi7bjeNSXeblGoeIzE1zqhHnMeGS8zL6eMII02Pt
 mdRjaCFcl1hGsqIWnC0+A==
UI-OutboundReport: notjunk:1;M01:P0:MNZwi5QpEBs=;rNwPC0lM5Jg4hhO2G++/jY1PrJy
 3Vqy/ghHNt3QkFVS1+2qNdMETT7EQEs7epsyP5HuXtx57kvvHufS6PIhuduEV7cyXaZH/kWAg
 gxBhyraJWmtilolZpQctgb1byPcCG/GDN2vAz43As+2mOY7SBdAsyo0sGLrc3fFTbPXg4PZ2q
 iUkl//5A8u0HwULkvavPY3hHIRIgEZH9dQDT5CaEp4X+OO3oaboYuRdcaiVbOfJaItSR20j5N
 t6YRVBR17nGhJMcSB20gYZMZxcT7daciEpT6cacM3f/e4rF4aPoO0DYWcjIDPeaG/nbW0LAlG
 P8/NHTE9X8kaqTqlKo0G4F3u2S4cutR7LodNRAD1gdZxDZnd8yNwF7iZcOuzQmJX0Hd25gwS2
 izz+qS2MMRXs+w2WK6mO8t4E0OxK7OmH2LNthYD9LYPrgOUVT/RwIo87UUSMXFuaVSnRQf2G/
 A0NQSIzC1D5bkpSrI++2YaAQ0AnX+dsX8pI0H+dYkqGo5tISw/2PlJq4QvVYm6/AUCUOGkHlb
 077XAl00o7Q7eMh0zJizKkWLnHwIRzur/A20acj/mmg/MD1wCD+NBsO0K1QoCOly9VXqVJQIq
 9I8ehgJqqNtUWf3g/5E6Ego03gPIp8u8kcAiJZtA0arS99Dii3nDLpqaaDb6UIzQjCDzR7qR+
 jC7bPSbTvohs4ZrhUE48kDQIzCeI1cROuMTTegjfpo7D5S5XxiJOPURMvWTcRnQXBVLRxRKJo
 ux6xXoYfBPgftPf0oh68r207mIaX8dg99ZS90PIjpiQfRJ31O3xjv1xQr4gGWZS1qaQsOhOKb
 bAmELv+sp/7Fqp3miBHR9miIl4tiDouSz/u7Ix+3wTJdQ=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240629_103533_180073_A5DE8D8A 
X-CRM114-Status: UNSURE (   6.79  )
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

> Sata node reference the pciesys with the property mediatek,phy-node
> and that is used as a syscon to access the pciesys regs.
>
> Readd the syscon compatible to pciesys node to restore correct
> functionality of the SATA interface.
=E2=80=A6
> Reported-by: Frank Wunderlich =E2=80=A6

Was any related information published?

Regards,
Markus


