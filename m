Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CC098C61DA4
	for <linux-mediatek@archiver.kernel.org>; Sat,  4 Feb 2023 10:28:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:References:In-Reply-To:Date:
	Content-Type:Subject:Cc:To:From:Message-ID:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=TQm9ieRv5B09nA3PAa1PAhtz6bSCFkESNEOIL8L9PhM=; b=cjus43KGzCWDsIVC2NlopDjsEC
	uhRmc8CXdX8yjPHoOgZclfMrXN04IIMOBrBSEkWLML84j1MlBdKEenXtTdADGSoZUa5UgjP+Q/+ju
	4VF/pqlAeSLsOD5nbRFICLQHXk3o1xPEXUjFGee1LO0Bw1Y9MSW6eFOb6pgThaDaEgprbvkBgkqlG
	wzLXiJkNqqLOhRKBBa2j9kW4fHqYf0+LR9UZ+MytytTAyOmcABVMeFSCus6eEiLWRnl7XZJQ45/4g
	LxjurhyLF6ueSaSMSW/ZMUHRZ94TgmKvQS48tDOnK9mpeyjxiOKrSO+C34PXrvT9Q+UqVqmESl7z+
	M7kupQBg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pOFm3-004sYB-9V; Sat, 04 Feb 2023 10:27:59 +0000
Received: from mout.gmx.net ([212.227.15.15])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pOFlt-004sXQ-Fe; Sat, 04 Feb 2023 10:27:51 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=public-files.de;
	s=s31663417; t=1675506452;
	bh=TQm9ieRv5B09nA3PAa1PAhtz6bSCFkESNEOIL8L9PhM=;
	h=X-UI-Sender-Class:From:To:Cc:Subject:Date:In-Reply-To:References;
	b=e/SqE1lDQs3/toO9p5vOPJdC+nVYg1tk+mDdWIkRWqESaHbI10EyG4a15OxEmQaVw
	 hV4zkaBBobH6vXMtiPGt6+oevdRnE0xIhzKgRfznhthTySj7PDqz2MxkQxa+EV97z4
	 NgsSZopxc+kzmHAaeugb8PIer69ytNC/NKHezHJTM+XxN6GcqKE9+xo6PUTBXVp2em
	 9ENvh6jWupG3zD+IEGhhzTnv9DPdjWUAKvid6Tjjr/rU8FTU91oao91BITsSZfPuky
	 iCxxGvN7DaVzmka/Xiwl+43iRieZWgWjG9vjLhyJykeFfLeBq0jHiqRFy81ifN1v0N
	 GGygXljgpJybA==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from [157.180.225.92] ([157.180.225.92]) by web-mail.gmx.net
 (3c-app-gmx-bs72.server.lan [172.19.170.208]) (via HTTP); Sat, 4 Feb 2023
 11:27:32 +0100
MIME-Version: 1.0
Message-ID: <trinity-ec3920c5-a96a-4edf-9ff1-4bf07e7b4d07-1675506452617@3c-app-gmx-bs72>
From: Frank Wunderlich <frank-w@public-files.de>
To: =?UTF-8?Q?Ar=C4=B1n=C3=A7_=C3=9CNAL?= <arinc.unal@arinc9.com>
Cc: arinc9.unal@gmail.com, Rob Herring <robh+dt@kernel.org>, Krzysztof
 Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Matthias Brugger
 <matthias.bgg@gmail.com>, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 linux-kernel@vger.kernel.org, erkin.bozoglu@xeront.com, Sean Wang
 <sean.wang@mediatek.com>, DENG Qingfang <dqfext@gmail.com>
Subject: Aw: Re: [PATCH v2 4/5] arm: dts: mt7623: mux phy0 on Bananapi
 BPI-R2
Content-Type: text/plain; charset=UTF-8
Date: Sat, 4 Feb 2023 11:27:32 +0100
Importance: normal
Sensitivity: Normal
In-Reply-To: <75d3758a-5502-03a4-b3a2-990f9339705b@arinc9.com>
References: <20230201185656.17164-1-arinc.unal@arinc9.com>
 <20230201185656.17164-5-arinc.unal@arinc9.com>
 <AC473057-266B-4403-9270-8007E0EC257C@public-files.de>
 <75d3758a-5502-03a4-b3a2-990f9339705b@arinc9.com>
X-UI-Message-Type: mail
X-Priority: 3
X-Provags-ID: V03:K1:c986fcPlX4Ooen57ZAsZI0v2Yr5gNsX/1CTe4qNxcW5X99bLBmBFzw1ZpGrQpvfYPoycP
 cVedJWKkyCyU1Tg73x1tq5Z8GGGgGFdLqq4CnoKY4CXtDCm+OdJ25BPx7WWfUjPaET4bkCXnQkBv
 VJKg0z3wBAN1WShT9ozrT69beX4iE5QVG/9IjTWASyoSq7OJpFBlHE3V78D1wgDHacV4YKPBAzzJ
 +53qy5TxXoiyrIrT2FpnDL350VoxN6UouGb2JdzxtY2jhCJGdyh2prXYm/i5XS7TH9l0DG1nKVZa
 ZU=
UI-OutboundReport: notjunk:1;M01:P0:Bw/EWLX9TdI=;JrT8R8+e0Rj9R2TqIcm7voib42M
 J9cyBYh2rNxoAOlzMIJEezkbGbB+dtR3G1Sca/0txnIsvMVamGEixTZajJKkKQ7WWw5XhipaT
 STENGATDGymObLbTusXAdYfME2xgwwCdqgE7ANBl9ZPw4bw/Z/gWQ8v1Y/iQ1pqM8EHUjXR3D
 L5XdyhHhpY7R0grdQ/5R8jxPUCekbcUUu/FiOCxnlKuVm52ISypgEutXxdeauDYk6pr1LtN5b
 m7QU4DfG4gNoulZYyPHX+F0OqT0N8eY2tHhBCAvajWIcQRi4StvkY7hHAqhgZVyCKONUp+TEk
 5b6QFUHmcQXAoLve0bsU02TUGTw99Kc8FLQZ8oMIWR2NKfnyqcrVs5w7wPdAR4JlRdpE3Qv5H
 49a+mxT81epnsofuW1086MT3lIShxKkiRreThzIktrMOg0BaVDPafwSVGXiI7UbbWyFJO0kPh
 AaOyS/LQpslLYFdySQdU5XNMIpGPkHqJqksJBET1xP/Tnhabv1MPTt+KyVicEBYxhL95UMgAj
 /1Xi0VkaHGkOPzoIBOhKJtBN/H/ToYsqzzuZrWdWxzDXhw0GqvzpCTd7qA+rVgcbkJdG9gIf3
 2MYb9TitSadMpVI/vNXVcFh6gssOddPt2UVookHzSlbcWtk/EZANeDgrUW8mW9rqjrauktiWp
 9G/NTiSatChiMIPY69AT20PH/W5CHCSiMHNrguIQqAa/PJvgBBkTyZGpKGVsViTDUNp3NpTjw
 G0mKXu/dZqJemzM/LosyUV22lBjXxmOYRj3BFhVPJHUCYWZH/kPhzaHihEK/9HhYTZmlkBCIF
 ZlcJWXRfn7rE61Ky9jZ0WxEVJulbpQhbQhqM8GfcG6Q1Y=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230204_022749_849936_5330875F 
X-CRM114-Status: UNSURE (   7.31  )
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

Hi aranc,

have tested this series, basicly it works, but i get only ~620 Mbits/sec (much more i will need on wan) in tx-mode of r2, rx-mode (iperf3 -c IP -R on r2) gets full 939 Mbits/sec. Both no retransmitts.

tried with my laptop which gets 940Mbit/sec in tx mode too...other end is a R2 with 5.15 connected to lan0 (and eth1+aux enabled, dmesg clean so far...for the "kernel log flooded"-comment).

maybe gmac1 needs to be tweaked a bit (clock-settings)?

can you confirm this with your board?

regards Frank

