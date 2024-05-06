Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D658EC25B5F
	for <linux-mediatek@archiver.kernel.org>; Mon,  6 May 2024 16:02:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-ID:References:
	In-Reply-To:Subject:CC:To:From:Date:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=z8G8tzytL5EQJL54ZG7dt8auAwYgJmpRiWb3yoTVl6A=; b=G1zh1QwSXwpOfB
	C9Crqx6iznBXlKoQ40aoJR5HlyJMDr+zvIdgXqRv7lwag+/pTNv8sbb3Y+5wbHBLD3y8m4cHSgrjm
	qVe9BhA86uBYqzQfB9CUyFHKyzT739stZxJcuE47SPKMhbaloGegoIZIrH2jANWAnScLWwN1mUK7a
	utW8cFa48rAGXf9Uc/Cxo96DH6iFvsVZn4oro5ALWweAwksf/8Gc7HvVC2acHkWiemjJDaQoVYxO1
	kb6yMGDdWdmX4Cy8yxNujuNbzDeh+e3t8+GZUzRqv5w/nl7HPOjrrFiWUSckpIxfYV5dWw16j2JFO
	SZVGHLkxJ6uyBmT+7v0Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s40n9-00000007yQM-2OQk;
	Mon, 06 May 2024 16:02:15 +0000
Received: from mout.gmx.net ([212.227.17.20])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s40n5-00000007yOw-41LS;
	Mon, 06 May 2024 16:02:13 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=public-files.de;
	s=s31663417; t=1715011311; x=1715616111; i=frank-w@public-files.de;
	bh=z8G8tzytL5EQJL54ZG7dt8auAwYgJmpRiWb3yoTVl6A=;
	h=X-UI-Sender-Class:Date:From:To:CC:Subject:Reply-to:In-Reply-To:
	 References:Message-ID:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:cc:content-transfer-encoding:
	 content-type:date:from:message-id:mime-version:reply-to:subject:
	 to;
	b=ExcHQ71zgurjKEdBE1RfioXtlPFtuD3xfIU6C4C1Y0Dp3ypHe3XMdw+3FcFi7+HN
	 iurm5slUeYgLTuFsKtj9PeiMRNJm69HUXK3yU+fp67Z7xgO5BDdtBGJbT08g9jTMF
	 hYrB5Es+ccDhCsAOZAD7X4AkjI2ksDf8qyuZCqdOBui3ALcZvCS52YkHkL20AOqZd
	 fBN4nWn/Cecd0J1O7R+fuj2t/DOqRHknfdQ0nsAW0DSUz6/UPVFpvV4Bx7XuJtxEB
	 SNGMmAYd2arH2VJW/zftRdxLg4/2c19aFLJex4+6VZd4t+QJ3eAMXBPUmkEe/p7mm
	 JuThOc9PRYQb6kVI3w==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from [IPv6:::1] ([80.187.68.153]) by mail.gmx.net (mrgmx105
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1MeCpb-1sezUm1vRX-00bI9k; Mon, 06
 May 2024 18:01:51 +0200
Date: Mon, 06 May 2024 18:01:50 +0200
From: Frank Wunderlich <frank-w@public-files.de>
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Frank Wunderlich <linux@fw-web.de>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>,
 Pavel Machek <pavel@ucw.cz>, Lee Jones <lee@kernel.org>,
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 Matthias Brugger <matthias.bgg@gmail.com>
CC: Eric Woudstra <ericwouds@gmail.com>, Tianling Shen <cnsztl@immortalwrt.org>,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-clk@vger.kernel.org, linux-leds@vger.kernel.org,
 netdev@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org
Subject: =?US-ASCII?Q?Re=3A_=5BRFC_v1_2/5=5D_dt-bindings=3A_clock=3A_mediate?=
 =?US-ASCII?Q?k=3A_add_address-cells_and_size-cells_to_ethsys?=
User-Agent: K-9 Mail for Android
In-Reply-To: <a43a076f-7d7e-4c7d-8be1-45569c7b2c16@collabora.com>
References: <20240505164549.65644-1-linux@fw-web.de> <20240505164549.65644-3-linux@fw-web.de> <a43a076f-7d7e-4c7d-8be1-45569c7b2c16@collabora.com>
Message-ID: <6A98D99E-C64E-441F-9496-EBF39141C4BA@public-files.de>
MIME-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:EvJGf3yoWCy1hX284ILeRzi5OdXlUzlOTm6wblWYTGCY8Ws6Gww
 F7hYZf+CSst1+2bF8ZcVqQR32B9zp54zWGXQfzaXne4jggfEFM10HfNaJnZo/GoiNsjFNL7
 Rp9FYBqM3ZT2UVnrAeXCqjFzh/nA6h/yLcEpN1U/e64eYymDbvscnf8W9A5AlDu/516Dsj5
 nMnxzjIWEVQqsafH40oIQ==
UI-OutboundReport: notjunk:1;M01:P0:ozEtPywastQ=;SZFw/2RUdiC4ZRyq+jT9OWp3y8e
 TXsSCkPf4nMpTsh0sURQin0IEw0ytSyMs3ZFaw/rqP9fJmVA1OjtVgQwhPXSghltfPu78Fgm+
 fU0yMidKDEU+m9cr8kuUGOFKNUtoRZAWhcUpbAAqwWqWvwHuVJ9Zv/SEwYYGSXVawFe7NfSRw
 P56M3eI1MoZYazsfDHfvRcqWI1Wr2xrcf7F/kAyKvbeswb/zxU38cSqiAekgy/EPNojPx6hDi
 xjoWchYjcP0ebamQwZqT00J4yT8thVYwBsO6pw7D5lKiftQZcS4iMGiAdYk+GktA7HA3ATdXi
 1BZtYEscY+TjymFHiyMRXMs/dfJSuxjxlEayaZWtF8mcs/WEL/rN5PeBhzyUupUx8whfmHaja
 sdezjAa383PmYCT7p5cRx8WbV6Ml2InLlbwXaxW2HOlLKDztqbHnQUbPMFPn/xgOO63MiK24g
 p53lXb/XIVbmhRDBbiO4SXM44oPyF7aWzzeBrD5FcsJMTWZPy2NHZuQd4aKcwtBK3W02P7/dP
 o37R2PUGBfLgJ6vT3CXFwEDPVsb7IZNrJ6l5F7elG1rjyuyMeU+CM9DRlcDSgjcOeUB1W6H0s
 e7BH30r7KDB2pHgQimA1TFClJLjlOqiMq+32jzduoVB23BMT7gtE6ImKhB5g9m0EibFVwCrBH
 evXI2G5eHrdbgBxqfiFQu4j+wnBDGFFRco+vXlWTJ8dEK7KA4VBguqNCoBJ/z6ZGYc8UWCMKS
 iKDdoWRsY3PyZs7YTy9HG3eKbGVri/9EcSGMoa8n7stRIcj5PPNrq4fao5eJoQkwV5q6800M6
 GHlhwjOlNBPVKo+KJmLtwPfifaS+hjMkacc04b3MsskI4=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240506_090212_310326_113A5BC0 
X-CRM114-Status: UNSURE (   5.34  )
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

Am 6=2E Mai 2024 14:48:58 MESZ schrieb AngeloGioacchino Del Regno <angelogi=
oacchino=2Edelregno@collabora=2Ecom>:
>Il 05/05/24 18:45, Frank Wunderlich ha scritto:
>> From: Frank Wunderlich <frank-w@public-files=2Ede>
>>=20
>> Add missing properties already used in mt7986a=2Edtsi=2E
>>=20
>> Signed-off-by: Frank Wunderlich <frank-w@public-files=2Ede>
>
>Fixes tag? :-)
>
>Cheers,
>Angelo

Should i use fixes tag of binding commit or where dts (-part) was added?
regards Frank

