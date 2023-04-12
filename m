Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E8AB2C77B6E
	for <linux-mediatek@archiver.kernel.org>; Wed, 12 Apr 2023 15:11:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	References:In-Reply-To:Date:Content-Type:Subject:Cc:To:From:Message-ID:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=HzEN9DPAQbfT9SmW2PXpsCMsLE8IPuhf+M6dEj567A4=; b=HNUyB8ir7+Mkm3tOqUDZPN55OM
	1u29fzA4y6yPNFOrD3iCFlmCkrwZjkbal+WNV6SC3THAYBQUTLFVyySqzldPYnbaRQbC4FLIgyBvW
	ySmWr4MQCZJ3o2ihWZTvsPwME0YAKIx2FQ7NXAreCwY1R6OjuxGAY1euz3cIWOwziRnYCUIOjEmsC
	qjANkfz3jHfO9o3AX11zAa/ZuzO2wqNJYH+6xFT1DzH8v9yxyCh1dO9xVp7MI5CtR+QCDhK7kzyjW
	j+uWBySbOF+KNzr7nzMV2eLRYVOx0BoMlb4OGih6weMZvas+294joWqs3/KRZkowhy2lOJGvTCUce
	ov1xSWLg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pmc8C-003aRR-2i;
	Wed, 12 Apr 2023 15:11:32 +0000
Received: from mout.gmx.net ([212.227.17.21])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pmc87-003aQC-2l;
	Wed, 12 Apr 2023 15:11:29 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=public-files.de;
	s=s31663417; t=1681312277; i=frank-w@public-files.de;
	bh=rqVjKHBgGD009ldYSsk+/seWGZgvzvn/D8ANy1/A438=;
	h=X-UI-Sender-Class:From:To:Cc:Subject:Date:In-Reply-To:References;
	b=Y+S4FnaZtL5I/U0A/wed+gda0MO9rdx9o2ORKO2z4f31ifZEG5gUcHA6Yc16gizND
	 EPM3j/pfkq/KmeniIiBSNA4/hxrS1eBnJwi18Ex7B9pLJx2+d/q1OYErTS8M2hhAwl
	 4LRfsaylk8iYIXd9iqn9gi/oK0iw26b53qIK1rL0mpUBAzVdH3EtFknKzp5+C+LX0n
	 QAsca7OzMvxDzDBQ7E4wqd8hv7jiDiHyZ08JqLla9gBnU8L+3aD7ZKOg94TiB57CSg
	 8GIPSDkZWatwBM3jraW8x8lFtJnuY2nNMJEQgQwaioTwuxpUOvgbgcuQluCjKWQ/rB
	 D4DhCdKiO47Aw==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from [217.61.157.203] ([217.61.157.203]) by web-mail.gmx.net
 (3c-app-gmx-bap50.server.lan [172.19.172.120]) (via HTTP); Wed, 12 Apr 2023
 17:11:17 +0200
MIME-Version: 1.0
Message-ID: <trinity-489cdc3b-e861-49d0-b1ec-e964f00388df-1681312277092@3c-app-gmx-bap50>
From: Frank Wunderlich <frank-w@public-files.de>
To: =?UTF-8?Q?Ar=C4=B1n=C3=A7_=C3=9CNAL?= <arinc.unal@arinc9.com>
Cc: Rob Herring <robh+dt@kernel.org>, Krzysztof Kozlowski
 <krzysztof.kozlowski+dt@linaro.org>, Matthias Brugger
 <matthias.bgg@gmail.com>, AngeloGioacchino Del Regno
 <angelogioacchino.delregno@collabora.com>, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, erkin.bozoglu@xeront.com
Subject: Aw: Re:  Re: Re: Re: [PATCH v3 0/5] arm: dts: mt7623: relocate
 gmacs, mt7530 switch, and add port@5
Content-Type: text/plain; charset=UTF-8
Date: Wed, 12 Apr 2023 17:11:17 +0200
Importance: normal
Sensitivity: Normal
In-Reply-To: <703ad8a8-f84e-6404-4cce-5386bfaa2bd7@arinc9.com>
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
Content-Transfer-Encoding: quoted-printable
X-UI-Message-Type: mail
X-Priority: 3
X-Provags-ID: V03:K1:u6GFzg6pOcWqX8zGUBq6aqA1eVvOXgiODPGrvbT/KrzCmOVPknlh/A1ThikyZLO+nEXzO
 LaKlbvyfTjPFoOcun91BJQ7KtZIwSov5xChMOzlfkyYuUcpRg2XLlXqOa7Tc6nMqwLBOBI5wwBq/
 dm2ApV+g+ZIEX1oKC1/HpgOQ0iNigAqP40UgaSqtC+2OoPpTYwftZnC84NvGOVO5mv6fHTkk4OFC
 T7zPc01fIT8NQfzUuwDBrtxbY02atQqQUCw1y2xno2A220eXOHSEqCFapF88Qem6GXkSj+FvogqL
 Yc=
UI-OutboundReport: notjunk:1;M01:P0:wiky/k8vdBM=;uI1fbKp2Pxc7LqTwFPA3iJFNsjz
 DolfLJ2/jUi/tB8mZr0h3tTYUKFPvfKOFpbtiQoiS3Ef6y2haaNBZSov0UP9eKeir624vWyiL
 TkGE74CTdikZdtOfea63+M1F3eukE0rAZLRVfFCHQybA5Vdq6Mj46mIDm5ffVMKQzz7lVs8ba
 FDRYDEs3pzKtOjA+Bq6C0youwytVBoz4M4IBfudtYmjciEQDuv75sanrXGsGBAGLEcRrxAIdA
 iDItV4jHcEH299EGyWYmupw4sodnP584AA7jEwn75v1ODPNBLcF9u2y9HSer9XwNan1fxpyvs
 OCRJlaTXflKqukGB/6so+XZ+mT7kBm5OFL40jXvqRjZo7kUXTnVRCL0aHIYsmI5Y5FymICUaR
 2G9CU5XSmNurqi42j9SQZImwUsg3BcJpIw83HF3jCLimVrf+Apna2Lpkchn6vE0obV7vwcwlW
 S6pErjcS7MnU8LzRG6l/oOp83oJiBxkAnSwjlpMRK7f4qgz25UkXaUI/2Kc5u+whGU1sfAz9X
 9D/3MVH0sE2ZE33YOlyMJjdJlXsElsifmJxDyj4W3sYCUpJOvm9SeNaVBAIlievlY8CiUCWGu
 ETd197n8VpciRA1TKgiAhsYk4RYoDR5Zx/MU4h2CRjI/uq0eK1UvjNnWJAOw4cD+C920saVyr
 WVN/SD9tTmx7N09UKtxZljw6SxiYAeaVqKZn+Ogjuf/oBVidlxjaWc8SKuptWW1IN83C0z62F
 VfFoOQzX5nS3Oju1z60jiCH1uLFOjdyqOt0UxMAGugxkSgiuzm1HA5onxNHHvzO+BIO/0ih8R
 y8lpHgIoHL47GdDcw4WLz6lA==
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230412_081128_184650_C85EEC54 
X-CRM114-Status: GOOD (  10.13  )
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

> Gesendet: Mittwoch, 12=2E April 2023 um 16:31 Uhr
> Von: "Ar=C4=B1n=C3=A7 =C3=9CNAL" <arinc=2Eunal@arinc9=2Ecom>
> > looks good so far, but i have not managed how to change dsa master fro=
m the preferred port (eth0) to the second one=2E=2E=2E
> > any idea how the correct syntax is for iproute2?
>=20
> https://www=2Ekernel=2Eorg/doc/html/latest/networking/dsa/configuration=
=2Ehtml#affinity-of-user-ports-to-cpu-ports
>=20
> In short: ip link set lan0 type dsa conduit eth1

thanks, it changes the master when i upgrade iproute to 6=2E1 (from debian=
 bullseye-backports), but i cannot do any traffic on it after switching to =
gmac1=2E=2E=2E

5: wan@eth1: <BROADCAST,MULTICAST,UP,LOWER_UP> mtu 1500 qdisc noqueue stat=
e UP group default qlen 1000
    link/ether f2:d2:51:56:cd:3d brd ff:ff:ff:ff:ff:ff
    inet 192=2E168=2E0=2E11/24 scope global wan
       valid_lft forever preferred_lft forever

see no p5-TX/gmac-rx

root@bpi-r2:~# ethtool -S eth1                                            =
                                                                           =
                         =20
NIC statistics:                                                           =
                                                                           =
                         =20
     tx_bytes: 5156                                                       =
                                                                           =
                         =20
     tx_packets: 61                                                       =
                                                                           =
                         =20
     tx_skip: 0                                                           =
                                                                           =
                         =20
     tx_collisions: 0                                                     =
                                                                           =
                         =20
     rx_bytes: 0                                                          =
                                                                           =
                         =20
     rx_packets: 0                                                        =
                                                                           =
                         =20
     rx_overflow: 0                                                       =
                                                                           =
                         =20
     rx_fcs_errors: 0                                                     =
                                                                           =
                         =20
     rx_short_errors: 0                                                   =
                                                                           =
                         =20
     rx_long_errors: 0                                                    =
                                                                           =
                         =20
     rx_checksum_errors: 0                                                =
                                                                           =
                         =20
     rx_flow_control_packets: 0                                           =
                                                                           =
                         =20
     rx_xdp_redirect: 0                                                   =
                                                                           =
                         =20
     rx_xdp_pass: 0                                                       =
                                                                           =
                         =20
     rx_xdp_drop: 0                                                       =
                                                                           =
                         =20
     rx_xdp_tx: 0                                                         =
                                                                           =
                         =20
     rx_xdp_tx_errors: 0                                                  =
                                                                           =
                         =20
     tx_xdp_xmit: 0                                                       =
                                                                           =
                         =20
     tx_xdp_xmit_errors: 0                                                =
                                                                           =
                         =20
     p05_TxDrop: 0                                                        =
                                                                           =
                         =20
     p05_TxCrcErr: 0                                                      =
                                                                           =
                         =20
     p05_TxUnicast: 0                                                     =
                                                                           =
                         =20
     p05_TxMulticast: 0                                                   =
                                                                           =
                         =20
     p05_TxBroadcast: 0                                                   =
                                                                           =
                         =20
     p05_TxCollision: 0                                                   =
                                                                           =
                         =20
     p05_TxSingleCollision: 0                                             =
                                                                           =
                         =20
     p05_TxMultipleCollision: 0                                           =
                                                                           =
                         =20
     p05_TxDeferred: 0                                                    =
                                                                           =
                         =20
     p05_TxLateCollision: 0                                               =
                                                                           =
                         =20
     p05_TxExcessiveCollistion: 0                                         =
                                                                           =
                         =20
     p05_TxPause: 0                                                       =
                                                                           =
                         =20
     p05_TxPktSz64: 0                                                     =
                                                                           =
                         =20
     p05_TxPktSz65To127: 0                                                =
                                                                           =
                         =20
     p05_TxPktSz128To255: 0                                               =
                                                                           =
                         =20
     p05_TxPktSz256To511: 0                                               =
                                                                           =
                         =20
     p05_TxPktSz512To1023: 0                                              =
                                                                           =
                         =20
     p05_Tx1024ToMax: 0                                                   =
                                                                           =
                         =20
     p05_TxBytes: 0                                                       =
                                                                           =
                         =20
     p05_RxDrop: 0                                                        =
                                                                           =
                         =20
     p05_RxFiltering: 16                                                  =
                                                                           =
                         =20
     p05_RxUnicast: 11                                                    =
                                                                           =
                         =20
     p05_RxMulticast: 38                                                  =
                                                                           =
                         =20
     p05_RxBroadcast: 12                                                  =
                                                                           =
                         =20
     p05_RxAlignErr: 0                                                    =
                                                                           =
                         =20
     p05_RxCrcErr: 0                                                      =
                                                                           =
                         =20
     p05_RxUnderSizeErr: 0                                                =
                                                                           =
                         =20
     p05_RxFragErr: 0                                                     =
                                                                           =
                         =20
     p05_RxOverSzErr: 0                                                   =
                                                                           =
                         =20
     p05_RxJabberErr: 0                                                   =
                                                                           =
                         =20
     p05_RxPause: 0                                                       =
                                                                           =
                         =20
     p05_RxPktSz64: 17                                                    =
                                                                           =
                         =20
     p05_RxPktSz65To127: 44                                               =
                                                                           =
                         =20
     p05_RxPktSz128To255: 0                                               =
                                                                           =
                         =20
     p05_RxPktSz256To511: 0                                               =
                                                                           =
                         =20
     p05_RxPktSz512To1023: 0                                              =
                                                                           =
                         =20
     p05_RxPktSz1024ToMax: 0                                              =
                                                                           =
                         =20
     p05_RxBytes: 5156                                                    =
                                                                           =
                         =20
     p05_RxCtrlDrop: 0                                                    =
                                                                           =
                         =20
     p05_RxIngressDrop: 0                                                 =
                                                                           =
                         =20
     p05_RxArlDrop: 0

maybe i miss something?

i'm not sure it is a problem with richards Patch or p5/gmac1

> > at least vladimirs patch should be included when applying this series
>=20
> I'm currently cleaning up the DSA driver, I'll get to this at some point=
=2E

regards Frank

