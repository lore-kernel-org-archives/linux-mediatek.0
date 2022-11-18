Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 365A2C4332F
	for <linux-mediatek@archiver.kernel.org>; Fri, 18 Nov 2022 22:06:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-ID:References:
	In-Reply-To:Subject:CC:To:From:Date:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Cy/UMrRY23kBrD2ecL5l9ho8KZiKHiy2L0b7WpzlhX4=; b=duDYc7iOd3XMkx
	mVqum6eO/pEeEvwcnx2YSW4Vd2o2LiAE7ADeyoXrrOpgOZKOVDepHMwrlQxXroVOpUKXYhkD51qol
	D5QrT2lPuR9qfoYUDZx1a7dCAPurR1xWceqeKTdsbERzUr+mXFBShBsaEAohk4GNhse15hn2pOwVa
	s/GO9HHd7sLsUTEhsd7MbZ7EP2ZJb6B5eswOPPR0jm2ytZ0CaEisNrGuLCaH2liVJTtoBcyADL47b
	mzyL3fuus1kxOJ7Sp7PEMfhC9xE0NUV1kLA8q6YFM813aIX8zmeBmDYnEMTWc/fL1XH1wBfuG0yLh
	7U9fLiyjiNgKOb8ciLkg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ow9Um-008iM5-Aw; Fri, 18 Nov 2022 22:06:00 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ow9Ub-008iJH-Tt; Fri, 18 Nov 2022 22:05:50 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:MIME-Version:Message-ID:References:In-Reply-To:Reply-to:Subject:CC:To:From:
	Date:Sender:Content-ID:Content-Description;
	bh=Cy/UMrRY23kBrD2ecL5l9ho8KZiKHiy2L0b7WpzlhX4=; b=CTxWbp2sZqYzHQZPHf0ks6NLXx
	lO2uqO61AQZSyinA2vpcX0pUQ9tOpDIwdXTbktgm5Gs9As0AfoY3YLP37mdbSndYqXMhNSO2/phqR
	n5k0Hg4uV28Fvup1Z6PQUhjHmU7tKnl2jOllo55oAjZY7i1g7CVu/M/uBVSvN7BEzckNm4arCf7uf
	v7FqRlVrtrbjEjvkpsD8EGwQP9smJ6BOGFQgr/8XuMBjHGM6ve77VIpDihklZakSLSXclDkgKELE/
	5OD7WBxjxBSZhfKXYd5jYqGiLimTC8T8qGQvjNMwsLk9p6/mlsGhtIBSoMcio1UbTHzU08mv1pwrX
	DzvbQsiQ==;
Received: from mout.gmx.net ([212.227.17.20])
	by desiato.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ow9UW-0027gC-JJ; Fri, 18 Nov 2022 22:05:46 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=public-files.de;
	s=s31663417; t=1668809116;
	bh=hvzsqeW+pZ6aFflH2DeCG+N++nDpjK40B2TbayEPl3E=;
	h=X-UI-Sender-Class:Date:From:To:CC:Subject:Reply-to:In-Reply-To:
	 References;
	b=fxKRAT+HRry568qEjuPyxuqxsmOxh4Ut89W+yMncF4mJNkKMr+YYWLSXrzs8Bhygb
	 gtMmeD8NNRrBa2x/408mJhaEpcv+e7EncaHTSisARCpXGDGqE+Ua78jxcb7qs7fB7v
	 FqSRREPLyy16mkf6slwzRamQdHq7B0MLmBiGY++cvRU/gct7xlgk5a0NONEk7mmiuJ
	 bTMbyOw9Z1x1XJT2wd35t2bO5Tw2ixB0FK1bWOVI+rQL2b3gZ8aZsRWUeC2U9uSdNj
	 MQ2ftGVApLk/FLynG7pklgr0+kBi4vdvKgs2JM71nOCdylNpgdyUN81YUkvaeBuzDK
	 MZ1DqZv4XCJpg==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from [127.0.0.1] ([80.245.77.125]) by mail.gmx.net (mrgmx105
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1N49hB-1p5SwP0bLt-0102e6; Fri, 18
 Nov 2022 23:05:16 +0100
Date: Fri, 18 Nov 2022 23:05:11 +0100
From: Frank Wunderlich <frank-w@public-files.de>
To: Rob Herring <robh+dt@kernel.org>, Frank Wunderlich <linux@fw-web.de>
CC: linux-mediatek@lists.infradead.org, Ryder Lee <ryder.lee@mediatek.com>,
 Jianjun Wang <jianjun.wang@mediatek.com>,
 Bjorn Helgaas <bhelgaas@google.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Chunfeng Yun <chunfeng.yun@mediatek.com>,
 Kishon Vijay Abraham I <kishon@ti.com>, Vinod Koul <vkoul@kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Matthias Brugger <matthias.bgg@gmail.com>, Paolo Abeni <pabeni@redhat.com>,
 Lorenzo Bianconi <lorenzo@kernel.org>, Bo Jiao <Bo.Jiao@mediatek.com>,
 linux-pci@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-phy@lists.infradead.org, linux-usb@vger.kernel.org
Subject: Re: [PATCH v6 11/11] arm64: dts: mt7986: add BPI-R3 nand/nor overlays
User-Agent: K-9 Mail for Android
In-Reply-To: <CAL_JsqKiRzRToSzk3q+csWR5DEZjZpQWChqZ3mH8MLruvfe=Dw@mail.gmail.com>
References: <20221118190126.100895-1-linux@fw-web.de> <20221118190126.100895-12-linux@fw-web.de> <CAL_JsqKiRzRToSzk3q+csWR5DEZjZpQWChqZ3mH8MLruvfe=Dw@mail.gmail.com>
Message-ID: <99114D73-22EF-43CD-848E-88A37B29B953@public-files.de>
MIME-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:ScE/GLdzMud5Wy9dhqxwyzhpkGMvwUQamRc0PAPEshdXTYQ917R
 W2WaOPx54U0oSso0ZvsU9Tfe7Ytz0Dz0NdoNaAZ3tSrgN3ci493eH4jyax8y3Q2AM8B22Zj
 jnYHxDKAcHQ5+gC+KekOMWdMimNh0IpbabDtg8O1/GJfsLrV/p3dyUaLAA//2lCcDzbtF90
 067bPzcUPbKsFXpppCV2w==
UI-OutboundReport: notjunk:1;M01:P0:jzrKweSzGSM=;rrPo469rUCAif9db3YD44H+IJFQ
 RP9TeEEcYoQ9Y15+4Qqqr36r4ytGk/qXf1ndgvE0mvRc9JcwFpicqvMIhnFQoMMj9kFiSVWCY
 qYOI9NWegO0sFWVYt+uDRy/Vg8oudtQfZqkV1hBdUkCaFtD/j/QUPyk/1ose2PdBVsOwLUVj3
 dVfDKCq454TfNUe8uyD3UjBY07GTdDH2lpppsaj7Nm4ExwIoyNvI9s25LirIJOy1fkXNJ+oRH
 /+Su5ti6m1GrodB6ivViUBGMuiYKA39rVD2YA2SRKf5NT5dtxBaoqxeJhl/VtDHfqIjezjhsF
 MzPbGH+7lFMVCJcUp9O+pvhIU/DR2EXCRmw4YLNz0dfKf02XnNvorFa/Y3Yg7Rk8zYkyVKDMA
 esE6/FuupmZIj+33R/VDPJlsfzZYT1GVAEloc1gXg7SgA1z6l5YGez7T7O5/qY3WbLRWFQF8U
 UNvsPnDOSsBlenzsvz8kPyftCqdxm1azeq3S6ACDjTAmwwu0KKe0XAEHLo8nE+gowCCcY4jx/
 dzXeOiFnVVQOsgNxJ8Ly4abKqimvAav0m2tEywHZBUuKb/H09Dna+GBcCmfkOPRUfOhKozxP+
 Y5/IqectOej/avAT347nvrLm9Cl4IXPYjzzSj9e4QafM98y6hd1/wJh6orfb+Z1LfeQ18iDm1
 XEA3kJVKu9rum8z0BDUk1jM7XY74zCuz3p1c5IhGH5WYxQdX0JnLkECXlyy8UIyvU1L/YoQwu
 iED6oE1g2tVYPQAW8KS0DsuEmrLTF3/B8AHrtZFZvJABhlG4LLOYmumZNrbNbBjb3zlIVK6GG
 HtrmluWV7dcXPXe1YH/AnUqR2kaZ2scpnDI1fyP8Xd1turb8JZUBcdN/vNqg0qiMRt/JfXzfZ
 6YV1DFoB4zYXZxodKoC1hU6hE9xlGtaf3Nlhn6fJjGxSsrLTIwSOXtvQMD/b+msc+b3nhs8bq
 J2vMfA==
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221118_220544_851483_EEE0D8CF 
X-CRM114-Status: GOOD (  14.46  )
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

Am 18=2E November 2022 22:39:52 MEZ schrieb Rob Herring <robh+dt@kernel=2Eo=
rg>:
>On Fri, Nov 18, 2022 at 1:01 PM Frank Wunderlich <linux@fw-web=2Ede> wrot=
e:
>>
>> From: Frank Wunderlich <frank-w@public-files=2Ede>
>>
>> Add devicetree overlays for using nand and nor on BPI-R3=2E
>
>Can you not tell at runtime which one you booted from? If not, how
>does one choose which overlay to apply? If you can, why not populate
>both nodes and enable the right one? IMO, if all h/w is present, it
>should all be in the DT=2E Selecting what h/w to use is a separate
>problem and overlays aren't a great solution for that=2E

It is not the decision about bootdevice,more available devices=2E

Only 1 spi device (nand OR nor) is available
at boottime as they share same spi bus and
chipselect is set via hw jumper=2E
Both nodes have reg 0,which is imho not
supported in linux=2E

I choosed overlays to add the right spi
device on the right mmc device where
similar selection happens (see patch 10)=2E
Either sd OR emmc can be used (1 mmc
controller,first 4bits from bus switched by
hardware jumper)=2EBut for mmc i use it as
base fdt because i see mmc as primary
device which holds rootfs too=2E Nand/nor is
imho helping device for accessing emmc or
like rescue system (only uboot)=2E

I probe in uboot if emmc is available (mmc
 partconf) and choose emmc else sd=2E For
 spi i try with sf command to check for nor,if
 this does not work i apply nand overlay=2E

>> Signed-off-by: Frank Wunderlich <frank-w@public-files=2Ede>
>> ---
>> maybe rename to dtso?
>>
>> "kbuild: Allow DTB overlays to built from =2Edtso named source files"
>> https://git=2Ekernel=2Eorg/pub/scm/linux/kernel/git/robh/linux=2Egit/co=
mmit/?h=3Ddt/next&id=3D363547d2191cbc32ca954ba75d72908712398ff2

Should i do this?

>> more comments about the dt overlay-support:
>>
>> https://patchwork=2Ekernel=2Eorg/comment/25092116/
>> https://patchwork=2Ekernel=2Eorg/comment/25085681/

Daniel suggest define sd/emmc as overlay too=2E=2E=2Ewith way you mention =
below we could create 4 full fdt without applying overlays in uboot=2E

>> --- a/arch/arm64/boot/dts/mediatek/Makefile
>> +++ b/arch/arm64/boot/dts/mediatek/Makefile
>> @@ -8,6 +8,8 @@ dtb-$(CONFIG_ARCH_MEDIATEK) +=3D mt6797-x20-dev=2Edtb
>>  dtb-$(CONFIG_ARCH_MEDIATEK) +=3D mt7622-rfb1=2Edtb
>>  dtb-$(CONFIG_ARCH_MEDIATEK) +=3D mt7622-bananapi-bpi-r64=2Edtb
>>  dtb-$(CONFIG_ARCH_MEDIATEK) +=3D mt7986a-bananapi-bpi-r3-emmc=2Edtb
>> +dtb-$(CONFIG_ARCH_MEDIATEK) +=3D mt7986a-bananapi-bpi-r3-nand=2Edtbo
>> +dtb-$(CONFIG_ARCH_MEDIATEK) +=3D mt7986a-bananapi-bpi-r3-nor=2Edtbo
>
>These need rules to apply them to the base dtb(s)=2E You just need:
>
>full=2Edtb :=3D base=2Edtb overlay=2Edtb
>dtb-y +=3D full=2Edtb

I would prefer to do this in bootloader to allow all 4 possible configurat=
ions:

Sd+nand
Sd+nor
Emmc+nand
Emmc+nor

>Rob

Hi,
regards Frank

