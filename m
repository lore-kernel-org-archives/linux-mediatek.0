Return-Path: <SRS0=vHqv=JS=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A39D0C43460
	for <linux-mediatek@archiver.kernel.org>; Wed, 21 Apr 2021 16:49:42 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id DCC8560232
	for <linux-mediatek@archiver.kernel.org>; Wed, 21 Apr 2021 16:49:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org DCC8560232
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=public-files.de
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:Reply-To:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Message-ID:From:CC:To:Subject:MIME-Version:
	References:In-Reply-To:Date:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=FhTb4HdWyoXVR21v1RivLx7NMGFbQZ+zVWcY+/o3uyk=; b=Jax+IwcLGz49J4CPHYC74jbZ8
	N5uuYjsCBEVEMO0CGYv6fITtU5rxptWGjr+nWA6QSePDcJHMAukoky9+PWJXM474YoZI9s024JNOE
	I3oJUQlb+I4VwztGUy3z06u+WffqNo3XiAi7J51iNqLjLVyrLKrVZpVU3d+t20fwz7sKCWIR2AKlQ
	58Fxz14ZAHE/AODkRDV0pTJeHKsPWKO4GE9FiHRZ6m95EbhSc9gA9KIaTkWHDG/7OBoRW4Q0ivGLv
	Z9vk8P2HI4Dij02K8Jd9uV2rQ08ZFVcj1udabjm0Ay74rrG6xSTMawDkoeL7L5A+Go7A0p8QOfwGc
	s+/Rj0gJg==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lZG2a-00EmfL-Pc; Wed, 21 Apr 2021 16:49:28 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lZG2L-00EmbV-8J; Wed, 21 Apr 2021 16:49:13 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Message-ID:From:CC:To:Reply-to:
 Subject:Content-Transfer-Encoding:Content-Type:MIME-Version:References:
 In-Reply-To:Date:Sender:Content-ID:Content-Description;
 bh=40y2ogTwZHjVV2UFcvvi314l227rNstpubsLcSaRYGw=; b=q6ffRRoLViKG6bbnqN0QP2vQlE
 P2tiAHm45QQfsH3GZJUdXxXoEGHV5R/0fOHp7g3VmQFf83IRkpTm0vh6DT0AIvC7xNp3gtPB/2Ckl
 +slC+xDCNt1Tnzon0mK8qfYTJASkC1K4hmOWtuCNGNgvz2e090Be7bQtxr+5rIW5KCn0lAwT1wdfC
 4rnfbfuFsHviX9llWI2jMx5CYjP8IxPTnW29KVTGLxiaKeZsP7N6TkI25rQ36p2pEI1Mco3Wd+s4j
 NIP5kvL2gSzX5FPvxCwySMvk/54Hb1tPIliciESVZVPJdBPTWHnOuwSlG3eF0G8coIXyZ3MOAee+/
 TGdXwHLg==;
Received: from mout.gmx.net ([212.227.15.19])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lZG2F-00D2S6-Ae; Wed, 21 Apr 2021 16:49:11 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
 s=badeba3b8450; t=1619023715;
 bh=40y2ogTwZHjVV2UFcvvi314l227rNstpubsLcSaRYGw=;
 h=X-UI-Sender-Class:Date:In-Reply-To:References:Subject:Reply-to:To:
 CC:From;
 b=RD4rwJLAE+hx8dc2j+xXELvDJe44VQWdkz6RArOIzrmoxQHmULbh+wDgIL1BFhg3Y
 KZNPcHepnC4Jae6Ppw6bBoENc/M9Tk6xUK7/zZwALhLXB607ZmPus9SyeZ7oLxjauE
 7tX9N4UBHJ0Ch9U1GjJh6U2WtwVjpS3HjlOUOcFA=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from frank-s9 ([80.245.77.133]) by mail.gmx.net (mrgmx005
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1MwQT9-1lJ65W2iwP-00sLhi; Wed, 21
 Apr 2021 18:48:35 +0200
Date: Wed, 21 Apr 2021 18:48:28 +0200
User-Agent: K-9 Mail for Android
In-Reply-To: <CAL_JsqKne=ASOyd0E9GakVvDvaXDauHOOU5NgxU8X8ySvyrAcw@mail.gmail.com>
References: <20210419154659.44096-1-ilya.lipnitskiy@gmail.com>
 <20210419154659.44096-3-ilya.lipnitskiy@gmail.com>
 <20210420195132.GA3686955@robh.at.kernel.org>
 <CALCv0x2SG=0kBRnxfSPxi+FvaBK=QGPHQkHWHvTXOw64KawPUQ@mail.gmail.com>
 <trinity-47c2d588-093d-4054-a16f-81d76aa667e0-1619013874284@3c-app-gmx-bs34>
 <CAL_JsqKne=ASOyd0E9GakVvDvaXDauHOOU5NgxU8X8ySvyrAcw@mail.gmail.com>
MIME-Version: 1.0
Subject: Re: Re: [PATCH net-next v2 2/2] net: ethernet: mediatek: support
 custom GMAC label
To: linux-mediatek@lists.infradead.org,Rob Herring <robh@kernel.org>
CC: Ilya Lipnitskiy <ilya.lipnitskiy@gmail.com>,
 "David S. Miller" <davem@davemloft.net>, Jakub Kicinski <kuba@kernel.org>,
 Felix Fietkau <nbd@nbd.name>, John Crispin <john@phrozen.org>,
 Sean Wang <sean.wang@mediatek.com>, Mark Lee <Mark-MC.Lee@mediatek.com>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Russell King <linux@armlinux.org.uk>, netdev <netdev@vger.kernel.org>,
 "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
 <devicetree@vger.kernel.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 linux-arm-kernel <linux-arm-kernel@lists.infradead.org>,
 "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>,
 =?ISO-8859-1?Q?Ren=E9_van_Dorst?= <opensource@vdorst.com>
From: Frank Wunderlich <frank-w@public-files.de>
Message-ID: <278445B7-727F-444D-8F5F-986CAD38BA57@public-files.de>
X-Provags-ID: V03:K1:i4lFH21GXNNZAau9Nq++WTeXreXX1sfRjeshPFKYIVVtlsNV0e1
 IMeY+l/cJEiY5tCksT+kTXePvUQkmN3Rwevzn/muTwx8SeR6zdgtVBMrMoYlLr4JS637SG0
 SKZ13gCYiTkam5Zl0Wz3brEPXaqN7gDh/s5x6vzPFue7gDkKI+UNBYFUmeF1+9R+LhIrnfF
 1ytvCuGAUq6JMwbIrTA4A==
X-UI-Out-Filterresults: notjunk:1;V03:K0:o9viHyDaucU=:0rlcnz0e7JdvUX3oF/E7p9
 J1/G+8uMTzTLN6yJCNebZmuNDxl4tmI/GrZWf3xe140dNFsL9LyJndS8gPRATWrxVN+bYyw7t
 w8zikTRkv+QxI+rHBdDYoyJqwd11YxRrQrPvKAoFyIbq5427Ah7UGSDT0swtuli42GH1oxypZ
 DDt1JyjFBRGVfn1O2giVC+oIB1Hc20s4bUlvD9B8mhT75LkQYbzHrh1Bq5eAOhJH3usXHz1Tr
 d1pOc1VEQHagmnjGIiaw3QVpzcqRqd3MynpGKCMv77cX0/ZB/mxddj3R5qYWh9N63m8/ouReX
 pRa/acWLfxWi0CEFG0eDe7DamprjGlZv8nuAJ6x/Ut+FqLZk1faHmTW/tpWWFAWy9ovmLzLvR
 a68NvgC8RWTCIYqNmgoGWDmTR+x+qml+EYzLen0Owz8h4ZKoXTz26NEPG0+16o+2FkTdmPRtN
 s7/YqXEKhbajEJoDtO09uCLYRdB8geyRfO7ceCbA4lzvakEr63DXc7TbKaE87FIZBWhChxmgj
 cIeA455EMmLZ5irtHjCGShxm4Pc4UKowHM+GM5LDAvV5QYgSr0R3fZNKjB20tN57uDeGeA5qn
 2V05j1bMRPoVFgW7uRVJs+44tw3XDw+Ypw1Yd/O5c5ZYnn3AzDZ8pzn7lGd1SVN18VBEDL3IN
 YN5m2PicnkMZKkFvZ+LMVO91Gi0HKMGQTF2UttBnlw7bBq1DXebjGS1vO4mtG1tx84snUV/oR
 M43B00vF4AVldwJsvgY6bymPduJD6PaMIta1YGcHuQ8oY4MIV1kxcTgPPlo/iPXGOCjuynAZA
 waOSiw6WWVz89E5A+BlGJFVJMH48IzpvPy0SORIp2AGHAsUas4gjH4uoVvMwFTSadgkKT9yLi
 yu1apNeAcatOzWgodjIloZB1vPXJ8ynY5onfF/dvHgeDcT9eeHh9jbZoyBh4oXi3/iwtd84dw
 AqBRagZHByPnqYkuVrj4yJxo7ZGU4D2o0H1FYDPc+vfgrRJEOOB0CrEbnAsvi3vqqL21sIfOO
 qkKIX0ct23cGDnCVv+SFSrpSHBsSffM0TJrSCEeK7LSvEBV0tBxY4Z3m8iyTkJneJPuAC7RGy
 LHOlKeKKu5hoP/Tkue4KoO/HXrs6XfLYOU3iCn1rU6uos6BkYB6m4au+94Mh4XBd+oa2viZse
 4P3lc49bw1wYiPKQ8YsTB78S5RVzV4jlbXPhl80YuhNgW0JYl+XT+iOfavig1jjHyia2vLL/A
 3IJFskSsr1P3MJQIA
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210421_094907_725025_04C00751 
X-CRM114-Status: GOOD (  10.71  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Am 21. April 2021 18:12:41 MESZ schrieb Rob Herring <robh@kernel.org>:
>On Wed, Apr 21, 2021 at 9:05 AM Frank Wunderlich
><frank-w@public-files.de> wrote:
>>
>> Hi,
>>
>> for dsa slave-ports there is already a property "label", but not for
>master/cpu-ports
>
>Is that because slave ports are external and master are not? If so,
>that makes sense.

In my case gmac is internal,yes...i don't know if ilyas device is similar.

But in a previous kernel-version the gmac of bpi-r2 can be passed through mt7530 switch and gets available external while bypassing dsa core. Here i wanted renaming of this port (gmac1=eth1 mapped as wan-port,while gmac0=eth0 was splitted by dsa switch driver to lan0-lan3)

>Seems like it could be possible to want to distinguish port types for
>reasons other than just what to name the device. Better to describe
>that difference in DT and then base the device name off of that.

Interface names should be not only numbering as they can have different meaning (wan vs. lan).

>If you just want fixed numbering, then 'aliases' node is generally how
>that is done (either because it sneaks in or fatigue from arguing
>fixed /dev nodes are an anti-feature). There's already 'ethernetN'
>which u-boot uses, but the kernel so far does not.

Aliases are not yet used as interface name...do you want this way (use alias name as ifname)? imho we can define multiple aliases to one dt node which is imho not the best way as interface can have only one name, and interface is created feom target node from where the alias needs to be found.

regards Frank

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
