Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6FE8AC77B6E
	for <linux-mediatek@archiver.kernel.org>; Wed, 12 Apr 2023 16:53:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	References:In-Reply-To:Date:Content-Type:Subject:Cc:To:From:Message-ID:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Ga19AbmnUG/i9MQtFbDdHjDPIuc1VRLirL/KPGThSJQ=; b=SX8i2gP1LgYUVTmub61odSZmOS
	9oaJ1AuOe/PV8wITrXeRPb10iSdhrOJLoyYGPsrqjBZ5vAUwGGO8RvbbJOIliST2pNz3tLAg+Zyum
	gWGo/hofjRyvpmNKRcC8n9H/2gsw2Y8nQDZGi/+ApPR4JRqzaK2yhb7jbi/CY19WACRE+Z8gKFrF1
	BxEwspn6mixWtPyn58whppTxlQZU+IVyBc6KwIpJVI+stKrjDnCd7DVPcAyTbkBGNQspC+H1UdYqn
	0bRoEbJtNGHWVzBuszyJomVuUi31fFz2G7G2vTdQqtqbIogv3kAYvjzlxddZMsCJ5FItTfhOgMV1u
	tLJSSq0w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pmdix-003sP4-2o;
	Wed, 12 Apr 2023 16:53:35 +0000
Received: from mout.gmx.net ([212.227.17.21])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pmdit-003sO5-2k;
	Wed, 12 Apr 2023 16:53:33 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=public-files.de;
	s=s31663417; t=1681318402; i=frank-w@public-files.de;
	bh=fOcCePvOyVu5eqlb5sp+l70CGKrbBCGwfk0FK1UiB6A=;
	h=X-UI-Sender-Class:From:To:Cc:Subject:Date:In-Reply-To:References;
	b=T11a/NQKdRIp7/w6QMtRCcwRI9SL3vR24KO1dRkUMQ0NylY0gyvM176s/DA0J4i1H
	 8Ms3HYAqO0pDKGgRWP5JS1MylsQ3F2gsi74otH1NM0k1q9UC4hR6AS29PfbNpuNsig
	 qaBfZbOKfOXJLpmbhb46CDYI/jcmKJGZl3iH/OazZ9/+GKGCSedaMmKbcOfFC0xzMv
	 d7o37rGFWH/1bMIv20ok4whvRmsrhfa2tVzXVKkMGyW768pwKJ51lT6qJI+7ks0FN/
	 /koPbmjICN8kuL0anYOBGbYW5U3pr1la9fTkg6eVU9bSvdBnfJ1mYMKIENXwKrpe1K
	 5mjLlWKGDDgzw==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from [217.61.157.203] ([217.61.157.203]) by web-mail.gmx.net
 (3c-app-gmx-bap50.server.lan [172.19.172.120]) (via HTTP); Wed, 12 Apr 2023
 18:53:22 +0200
MIME-Version: 1.0
Message-ID: <trinity-990f3b28-d67c-49ef-9094-c3b7d2059e36-1681318402336@3c-app-gmx-bap50>
From: Frank Wunderlich <frank-w@public-files.de>
To: =?UTF-8?Q?Ar=C4=B1n=C3=A7_=C3=9CNAL?= <arinc.unal@arinc9.com>
Cc: Rob Herring <robh+dt@kernel.org>, Krzysztof Kozlowski
 <krzysztof.kozlowski+dt@linaro.org>, Matthias Brugger
 <matthias.bgg@gmail.com>, AngeloGioacchino Del Regno
 <angelogioacchino.delregno@collabora.com>, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, erkin.bozoglu@xeront.com
Subject: Aw: Re:  Re: Re: Re: Re: [PATCH v3 0/5] arm: dts: mt7623: relocate
 gmacs, mt7530 switch, and add port@5
Content-Type: text/plain; charset=UTF-8
Date: Wed, 12 Apr 2023 18:53:22 +0200
Importance: normal
Sensitivity: Normal
In-Reply-To: <0d242292-16b7-6837-7d1a-b70c41309e6b@arinc9.com>
References: <20230210182505.24597-1-arinc.unal@arinc9.com>
 <c3ab9a9b-3eb2-8fb0-d5d7-c0b7c684d3a7@arinc9.com>
 <trinity-dab715b9-3953-40da-bc25-c4c2a5e9b7c3-1676715866453@3c-app-gmx-bap53>
 <27a26da8-8297-5327-7493-54d8359b6970@arinc9.com>
 <trinity-dd260791-3637-4193-8f93-a9fcdb013dcb-1676722705920@3c-app-gmx-bap53>
 <2dc2fc39-b0d5-c872-36bf-fde851debe4b@arinc9.com>
 <A329B2DF-04B7-40FA-BBCE-1F1012A6DBBD@public-files.de>
 <fb96d8eb-2eb7-db19-1135-1a833294dd67@arinc9.com>
 <trinity-899c01a6-0fc5-4900-aea8-2b43802c8329-1676814734826@3c-app-gmx-bs35>
 <trinity-3f46d325-bc45-4ee7-ae86-c8db4467aa94-1681303779505@3c-app-gmx-bap50>
 <703ad8a8-f84e-6404-4cce-5386bfaa2bd7@arinc9.com>
 <trinity-489cdc3b-e861-49d0-b1ec-e964f00388df-1681312277092@3c-app-gmx-bap50>
 <0d242292-16b7-6837-7d1a-b70c41309e6b@arinc9.com>
Content-Transfer-Encoding: quoted-printable
X-UI-Message-Type: mail
X-Priority: 3
X-Provags-ID: V03:K1:2TgEVklogIPN9QUAHc+I39F76U3lLe2ea2lWUGSEcJ3RvU2i5XuSHdQJ6pvi7JcepqiJp
 i+kF1SQKfSGdpEKFDMk5JKhFry7q/xhTmS/ZbkqN3cyuS4s4+9iw1B4zxnWHYq2gUbFbIdfNs1YM
 J3kaN74CFnKi5rybX+JCfH+SMqCSekk7oXbyLyBxLj/4jEc7Lo10H0LlBl4KB2w1OApUY2Zyn1xG
 41Fgfzzly9PIDY0Z581CNIHF2nkEJx/mTeozgGw7zpRjjtj34v2WjTHkMmdJRSEWGyizDGWy9a1g
 mo=
UI-OutboundReport: notjunk:1;M01:P0:btFEPD+riPY=;Xnw2hP3/+Exoi5h6KiI8WevmZh5
 Hw8Hj1E8jYcStC4/qFENBVeJyF6xFB6WOunAwtq2jg9HkOZaOsKO3HzbWflflUZkZMrSx5y3B
 HPKjevXxPY0YC7TJuRb1QondTcRXFKim0FE13JLVu6DWTHgbAkXXvH0Jzd/LwVKcp/zfdfjn0
 Ps5dXAr09WF9obZIyU1WYAgS7Ay4l6OZOsuwQdqtGViiDfws733AK33NEQFQVD6WOGuiaI+zB
 LfKyZVAsACzrIArIrfpEuvZgt7IXeQrhpawBdV0+YzadsXcAhOyxqY/fb7FHoXoauyflF+Pbm
 t6GnjwtZXbTzc1rd9wk+XV4yzm5C9eDeupz+QmEDQN9TMoQsIxf+GCdh0rXvsL7rxounctZlX
 7z8wyLMCDJ5MMGvucv4E1XnHg80o8DkE6PXR/ASRjmzKUc+ecv+ijqEnApVoIILJGP/5M29PV
 x5A/uYCGOySYne/y3C3kaFeBTnHbhUUmZpMYyhaZK9tOKs5szVAqr5pApYqwx2r6sSGeGtfSD
 ZMlKrya8UMQbMs9y+7KgMuzExrv3fnDS6J2zi2JUhlHheoLg/MD9ktkviMoHjP+SbFj7pPL3w
 c+5RkJNNml9o8AKY06T7hGi21t05IUZx68KBsNJX8VTb3wr6Yi+yGCaWVN9sR0afU/LDHTbTh
 Tv2HMoyZ5OVxBOtJuQ2B0wisz5gV2OOJIjyObS3AfYG6LTSnt4B2sRQuJGP60VMPNAKtzpMjf
 Uw2PSpTpPsCJtyp4fS3nqowt59iFgeU/s8p87/5aZ8nAFGbBcB7QY1R4lVwnxqSIQI0d9PGHZ
 kAQvLdDk5goa4unvyXmFJozw==
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230412_095332_181204_27D22578 
X-CRM114-Status: GOOD (  12.75  )
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

Hi

> Gesendet: Mittwoch, 12=2E April 2023 um 18:21 Uhr
> Von: "Ar=C4=B1n=C3=A7 =C3=9CNAL" <arinc=2Eunal@arinc9=2Ecom>
> > thanks, it changes the master when i upgrade iproute to 6=2E1 (from de=
bian bullseye-backports), but i cannot do any traffic on it after switching=
 to gmac1=2E=2E=2E
> >=20
> > 5: wan@eth1: <BROADCAST,MULTICAST,UP,LOWER_UP> mtu 1500 qdisc noqueue =
state UP group default qlen 1000
> >      link/ether f2:d2:51:56:cd:3d brd ff:ff:ff:ff:ff:ff
> >      inet 192=2E168=2E0=2E11/24 scope global wan
> >         valid_lft forever preferred_lft forever
> >=20
> > see no p5-TX/gmac-rx

> Did you apply the vlan and flooding fix patches from Richard?

have now applied all patches i've found from richard (which are all reject=
ed):

fe4495bb3cc2 2023-02-12 Fix setting up CPU and User ports to be in the cor=
rect mode during setup and when toggling vlan_filtering on a bridge port=2E=
  (HEAD -> 6=2E3-rc)
b0641f3e1a69 2023-02-12 Fix Flooding: Disable by default on User ports and=
 Enable on CPU ports=20
cb04b3451524 2023-02-12 Do not add all User ports to the CPU by default=2E=
 This will break Multi CPU when added a seperate patch=2E It will be overwr=
itten by =2Eport_enable and since we are forcing output to a port via the S=
pecial Tag this is not needed=2E

and now it seems working and is clear ;)

root@bpi-r2:~# ip l show wan
5: wan@eth1: <BROADCAST,MULTICAST,UP,LOWER_UP> mtu 1500 qdisc noqueue stat=
e UP mode DEFAULT group default qlen 1000
    link/ether f2:d2:51:56:cd:3d brd ff:ff:ff:ff:ff:ff

iperf3
[ ID] Interval           Transfer     Bitrate         Retr                =
                                                                           =
                        =20
[  5]   0=2E00-10=2E00  sec  1=2E09 GBytes   940 Mbits/sec    0           =
  sender                                                                   =
                              =20
[  5]   0=2E00-10=2E03  sec  1=2E09 GBytes   936 Mbits/sec                =
  receiver                                                                 =
                              =20


iperf3 -R
[ ID] Interval           Transfer     Bitrate         Retr                =
                                                                           =
                        =20
[  5]   0=2E00-10=2E04  sec  1=2E09 GBytes   936 Mbits/sec    0           =
  sender                                                                   =
                              =20
[  5]   0=2E00-10=2E00  sec  1=2E09 GBytes   938 Mbits/sec                =
  receiver                                                                 =
                              =20


how do you deal with these patches? do you include them into your mt7530 f=
ixes series? they (and vladimirs preferred cpu-port) need to be applied bef=
ore these DTS-changes

regards Frank

