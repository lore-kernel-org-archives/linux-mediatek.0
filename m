Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4C910C46467
	for <linux-mediatek@archiver.kernel.org>; Sat,  7 Jan 2023 12:24:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Date:Content-Type:Subject:Cc
	:To:From:Message-ID:MIME-Version:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=zv9DFz2jFU7cwgarhZpClLtUvJqk7GOMCDtGW4naVT4=; b=Rzm25R57GXUc8IpuEuMVlum/Jc
	Q25v/NcI39IFrnRp/z3/+2mnvyGnJhIRMl8A1AsXbUOEo68/DY0/XF36A9sjiGrnHV3ydNxGl7SmC
	hrReZD807fUu//GZk//QwtL8JIcl3/Ew8nmG890G/js6+363R+kVz+IZyANPRTLQdx89BDTE7QNk5
	I0bKknez+KjkB5JRdFSDixoyOS+mwvlMxFRJnW6WO5IICh+P2nhYHLvFDBeLDoE+2VUpwsGKxsYw7
	JMA0Td/ugHG9jh7aFeCHOHHDLXjjZua+/OOFadm1QzY4bkZe9DL7hwpmlh2F6onka2DI+blMXuYMk
	ZCTS7ACg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pE8FP-004mNM-Fc; Sat, 07 Jan 2023 12:24:27 +0000
Received: from mout.gmx.net ([212.227.17.22])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pE8FK-004mJQ-3j
	for linux-mediatek@lists.infradead.org; Sat, 07 Jan 2023 12:24:23 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=public-files.de;
	s=s31663417; t=1673094231;
	bh=zv9DFz2jFU7cwgarhZpClLtUvJqk7GOMCDtGW4naVT4=;
	h=X-UI-Sender-Class:From:To:Cc:Subject:Date;
	b=hbAOPRtSb4588GuGdrreMXwPNKZzA8qLj0qIC6pxdDTQB8M+r5wxb8kCPYrrf/0UW
	 x+BOek4gnxBmzNEdiZ170bcM+j41CLvtvGVJtzLYRKeOAbW+tLCpZva0Rsqg4+qzdL
	 +ovfeXt0aToUj+rRFcBqMuTcmMnMrPEN1qncGGIbm8pOURdl4tZ4e8oZfaFPOVXAqu
	 0HoqcyUZ0bZjICnAPO303ej8Tia+MRrdNe4TDk1v99ca6OewdpAq4MCuFZSA1BdSD7
	 ++yHyddhAX4MiCbTPijTZ21oNhmfX+rCPZ7tc+63wKu5ha5zllyMwX4AMsT4lnXi3g
	 77phW1xspdWLw==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from [217.61.149.37] ([217.61.149.37]) by web-mail.gmx.net
 (3c-app-gmx-bap38.server.lan [172.19.172.108]) (via HTTP); Sat, 7 Jan 2023
 13:23:50 +0100
MIME-Version: 1.0
Message-ID: <trinity-88ad03e9-e830-4898-93f0-106af8b753bd-1673094230865@3c-app-gmx-bap38>
From: Frank Wunderlich <frank-w@public-files.de>
To: Felix Fietkau <nbd@nbd.name>
Cc: netdev@vger.kernel.org, John Crispin <john@phrozen.org>, Sean Wang
 <sean.wang@mediatek.com>, Mark Lee <Mark-MC.Lee@mediatek.com>, Lorenzo
 Bianconi <lorenzo@kernel.org>, "David S. Miller" <davem@davemloft.net>,
 Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>, Paolo
 Abeni <pabeni@redhat.com>, Matthias Brugger <matthias.bgg@gmail.com>,
 Russell King <linux@armlinux.org.uk>, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Aw: Re:  Re: Re: [PATCH net v3 4/5] net: ethernet: mtk_eth_soc:
 drop generic vlan rx offload, only use DSA untagging
Content-Type: text/plain; charset=UTF-8
Date: Sat, 7 Jan 2023 13:23:50 +0100
Importance: normal
Sensitivity: Normal
X-Priority: 3
X-Provags-ID: V03:K1:wP4TMKG2DaLks5PJfrg2GiHqrg61/W8XG98+sNB3yE8BNT7gs3jeY2pXQVQKnB7KxWyUS
 K5gRCfuJyh+1XkzUHJYtYdCyz12l1Zrq2nJXf2uy7GIx4Q+0TfZ86VV7pbS+KPUjhTZu3RMng/up
 gr67XmEPFWRWirGMyy0KXX0dDCBELBUm7bo1YDH/eomd69m06ar2+5LgUiPk0bRdVWPlIGFV2yCX
 3WwyLlARITSboIzUqWrkF0qDjrmaOJrdwkB9XVL61jT7xuBZdAgg4eSrrYmhGW+coaew3xGIpP9K
 Gc=
UI-OutboundReport: notjunk:1;M01:P0:UIrRf/JzP+0=;92GAdljAG5pcOdjgtJXbJhVbr1z
 MYRfKTlAMm+8VBnPWol1WaUFOO1zKpSY0/vTXsjeXWhxiWax0Zc5vbK7M2Fq4EXosoZHKfVjf
 1A/n7THFpjvoALbpfzC4WZU/2vHhXNeHCbLDy3NtWq85bgwvidRz4P9tDUTrNvRB9YgAlvYbQ
 b58NB5HVVLMqwS/Fxhp29FtMG3cvehpBLxN0lVf+1dcldosd0CoW3zRvSOC2ctkfY4VlfoMFp
 7k1fVyVfar+ZSC+HKnXeuLEZF2QHYQSmOQMQXAEpOiXfaqaq+wBWsIZFfnc/iEyELv7WbTurm
 ijROU15BsZDdARYwMbWm4X6ZmLE6/UnXIxvN6hoBMb7ycKSRQbOAvAml5Ql0hv3ir2IOK56Ms
 n9+t32zdTlMfu1NaXEPsaqKR7QSI+bWGRAfp/iDjg9YOQjISAQ1zeR9CuZtPnGF1Qp+F6lUWx
 3i2vNr8XzOMM71xklgjniMh74y4ze56L+f9l4cs0+5Mn1EmKjQt5Tes7c91j3qnvPTSYO2gwC
 FXKp6eBexPneP/Bq/6d6iwQHslBfprX5KcGo9qD43mbOTTOrYnN1eA1vKouXjzQp+Q42cu2gr
 Seykp6axgvDcl5BSp2ox2hBzcUA64d6Bt/ak391zvTvHDK02U7wjJIE1TrzQzE0dKJFjOSajK
 T2Vq110SDrT3xQTIiKvHDAsaunF+wB5eyQmHbGD/S/TAsHn343zPDTSB/YuBE9ajoVpAktw2U
 7g6pBEpje75bGYB6xnF38GpTayoo7CGOZRgE6My4CfWg4YpGcdqRW8B84OCdOI17PVQXrkXxn
 13v2RlCe0Gs/pw4G9T9Cnu+Zj3lCekIcISIecUcklGlUI=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230107_042422_572756_DC410EFD 
X-CRM114-Status: UNSURE (   4.71  )
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

Hi,

FYI, opened a systemd issue on github

https://github.com/systemd/systemd/issues/25970

---

regards Frank

Hi,

update on my tests...something in my systemd-networkd breaks vlan on dsa-port.

if i boot with this disabled vlan added manually works on dsa-port and gmac too. so felix you can keep my tested-by.

if vlan is working and i activate networkd afterwards vlans are still working...i guess systemd puts the wan-interface into some kind of non-vlan-mode (vlan-filtering?).

...

