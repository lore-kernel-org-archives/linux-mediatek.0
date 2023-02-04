Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 49D4EC61DA4
	for <linux-mediatek@archiver.kernel.org>; Sat,  4 Feb 2023 12:07:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-Id:To:Subject:From:Date:Reply-To:Cc:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=VU+F7MIyZ9ZZTAoORw3calU4FjGmh4WCCTK1lkz5VZw=; b=1Pc3CCHoQZosKN0HTfmi6zWBhn
	r6Okb7DhLvzP7nwvFg8KkFvlXTxUDY2QT53aeLvV+zvRWIM3h6aRcCM+LgymOsQelzV47MG/GZg86
	+DwGjyUJPnhTqPKgDxqNTBR02Cj840baxWDjH1NzARrOCysHfbSEjEBFP0LwblLpK6KsOCrpe6y6y
	x1h7i4oT+b60YmKZ1ZmPJsvfcdApCw64hMr0Z3uitEy4WsVIMs5UcBb2e7GGg7ZMV2Ah68eaHSC3r
	0a33b3QejSEn1s9/N+f4MkIFGNe6zohVRC9m/CaeJXL3GFCNIxttA9iMvdDOT258h9w0f0Q1Hxq79
	TSf05L6Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pOHKA-0050Fh-Vu; Sat, 04 Feb 2023 12:07:18 +0000
Received: from s2.dolansoft.org ([212.51.146.245] helo=mx.dolansoft.org)
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pOHK8-0050F4-93
	for linux-mediatek@lists.infradead.org; Sat, 04 Feb 2023 12:07:17 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=brun.one;
	s=s1; h=MIME-Version:Message-Id:Cc:To:Subject:From:Date:In-Reply-To:
	References:From:To:Subject:Date:Message-ID:Reply-To;
	bh=VU+F7MIyZ9ZZTAoORw3calU4FjGmh4WCCTK1lkz5VZw=; b=K0NRPmqFm8DaWAW3Pe79Ri4CRQ
	7s6u/G40KGG18mgDTpX0l8WvbcbJQbKpI9r8lzjKc+f2VxfEKPduUTiwYliXHkpVt+KhyshMYT6lQ
	i2GHKhofRAjZfXHn/xB74aQmqHC/+h3bgKjDhx5Ytr2q1ggLq5k4mn+ybpo+PeuHxsOP2dtsuumJt
	lJ4Jw5gBDzlboV1kG3rhD2TlQQ9dJbVjgyi8g4Qwx5577Iq/CEpQ0kgFev1sJ7ptwdCqbBqhyjE/i
	91vV2unqgxg6TIH/FhgJdN5YBv0zcMMBtUMCnKupY5KPtPpLVMcQTX+4xAWmSBwbMRIjF9MXJKsSk
	pD6j4ZkA==;
Received: from [212.51.153.89] (helo=[192.168.12.54])
	by mx.dolansoft.org with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <lorenz@dolansoft.org>)
	id 1pOHK2-0007yv-09;
	Sat, 04 Feb 2023 12:07:10 +0000
Date: Sat, 04 Feb 2023 13:07:04 +0100
From: Lorenz Brun <lorenz@brun.one>
Subject: mtk_soc_eth issues on MT7986
To: linux-mediatek@lists.infradead.org
Message-Id: <SN1KPR.7R1MV34Z4HRM3@brun.one>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230204_040716_368166_2DADF4A5 
X-CRM114-Status: GOOD (  10.83  )
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

Hi List,

I'm trying to run a "big" (arm64 defconfig with udev module loading) 
kernel on my Banana Pi R3 (MT7986a + MT7531).
I'm booting with mainline U-Boot 2023.01 on SPI-NOR which has network 
connectivity into my kernel plus initrd which are on eMMC. The kernel 
is 6.2-rc6 with a few patches

6205f61a0a61e net: dsa: mt7530: don't change PVC_EG_TAG when CPU port 
becomes VLAN-aware
28ab9ca128446 wifi: mt76: mt7915: enable per-phy led support
35bc5ae23e5bd wifi: mt76: move leds struct in mt76_phy
f7727b574052f wifi: mt76: move leds field in leds struct
14eb67ac1fbe8 thermal: mediatek: add support for MT7986 and MT7981
04119eac21e73 thermal/drivers/mtk: use function pointer for 
raw_to_mcelsius
e97264d5413e9 net: ethernet: mtk_eth_soc: ppe: fix L2 offloading with 
DSA untagging offload enabled
f849ec7e09dc2 net: ethernet: mtk_eth_soc: drop generic vlan rx offload, 
only use DSA untagging
ebbf1381e354f net: ethernet: mtk_eth_soc: fix flow_offload related 
refcount bug
589a52fd2a635 net: ethernet: mtk_eth_soc: work around issue with 
sending small fragments
9efb3514d33ff net: ethernet: mtk_eth_soc: account for vlan in rx header 
length
ce3db298bf519 mt76: mt7915: expose device tree match table

I also enable the following set of options on top of the arm64 
defconfig specifically for this HW (mostly copied from :

    COMMON_CLK_MEDIATEK = yes;
    COMMON_CLK_MT7986 = yes;
    COMMON_CLK_MT7986_ETHSYS = yes;
    MEDIATEK_GE_PHY = yes;
    MEDIATEK_WATCHDOG = yes;
    MTD_NAND_ECC_MEDIATEK = yes;
    MTD_NAND_ECC_SW_HAMMING = yes;
    MTD_NAND_MTK = yes;
    MTD_SPI_NAND = yes;
    MTD_UBI = yes;
    MTD_UBI_BLOCK = yes;
    MTK_EFUSE = yes;
    MTK_HSDMA = yes;
    MTK_INFRACFG = yes;
    MTK_PMIC_WRAP = yes;
    MTK_SCPSYS = yes;
    MTK_SCPSYS_PM_DOMAINS = yes;
    MTK_THERMAL = yes;
    MTK_TIMER = yes;
    NET_DSA_MT7530 = module;
    NET_DSA_TAG_MTK = module;
    NET_MEDIATEK_SOC = module;
    NET_MEDIATEK_SOC_WED = yes;
    NET_SWITCHDEV = yes;
    NET_VENDOR_MEDIATEK = yes;
    PCIE_MEDIATEK = yes;
    PCIE_MEDIATEK_GEN3 = yes;
    PINCTRL_MT7986 = yes;
    PINCTRL_MTK = yes;
    PINCTRL_MTK_MOORE = yes;
    PINCTRL_MTK_V2 = yes;
    PWM_MEDIATEK = yes;
    MT7915E = module;
    MT7986_WMAC = yes;
    SPI_MT65XX = yes;
    SPI_MTK_NOR = yes;
    SPI_MTK_SNFI = yes;
    MMC_MTK = yes;

This works mostly fine except for one very important problem: The 
ethernet interfaces do not work on the kernel (even the one not 
connected to the MT7531, it does not pass traffic). Not even MDIO seems 
to work as I get a timeout and then an MT7531 probe failure. I tried 
increasing the MDIO timeout to 15s in an attempt to rule out a timing 
issue, but it still just results in this log:

[ 21.758489] mtk_soc_eth 15100000.ethernet eth0: mediatek frame engine 
at 0xffff80000c700000, irq 138
[ 21.790761] mtk_soc_eth 15100000.ethernet: generated random MAC 
address 3e:11:2e:62:4c:6a
[ 21.800431] mtk_soc_eth 15100000.ethernet eth1: mediatek frame engine 
at 0xffff80000c700000, irq 138
[ 36.918265] mtk_soc_eth 15100000.ethernet: mdio: MDIO timeout # With 
increased 15s MDIO timeout hacked in
[ 36.924032] mdio_bus mdio-bus: failed to read mt7530 register

On a current OpenWRT snapshot which also uses a close-to-mainline 
kernel ethernet connectivity works fine with a kernel log like this:

[ 1.026045] mtk_soc_eth 15100000.ethernet eth0: mediatek frame engine 
at 0xffffffc009780000, irq 132
[ 1.035231] mtk_soc_eth 15100000.ethernet: generated random MAC address 
2a:c8:1c:50:66:d3
[ 1.044011] mtk_soc_eth 15100000.ethernet eth1: mediatek frame engine 
at 0xffffffc009780000, irq 132
[ 1.981789] mt7530 mdio-bus:1f: configuring for fixed/2500base-x link 
mode
[ 1.988942] mt7530 mdio-bus:1f: Link is Up - 2.5Gbps/Full - flow 
control rx/tx
[ 1.997884] mt7530 mdio-bus:1f wan (uninitialized): PHY [mt7530-0:00] 
driver [MediaTek MT7531 PHY] (irq=142)
[ 2.017790] mt7530 mdio-bus:1f lan1 (uninitialized): PHY [mt7530-0:01] 
driver [MediaTek MT7531 PHY] (irq=143)
[ 2.037352] mt7530 mdio-bus:1f lan2 (uninitialized): PHY [mt7530-0:02] 
driver [MediaTek MT7531 PHY] (irq=144)
[ 2.056893] mt7530 mdio-bus:1f lan3 (uninitialized): PHY [mt7530-0:03] 
driver [MediaTek MT7531 PHY] (irq=145)
[ 2.076454] mt7530 mdio-bus:1f lan4 (uninitialized): PHY [mt7530-0:04] 
driver [MediaTek MT7531 PHY] (irq=146)
[ 2.087084] DSA: tree 0 setup
[ 6.736417] mtk_soc_eth 15100000.ethernet eth0: configuring for 
fixed/2500base-x link mode
[ 6.744869] mtk_soc_eth 15100000.ethernet eth0: Link is Up - 
2.5Gbps/Full - flow control rx/tx
[ 13.446197] mtk_soc_eth 15100000.ethernet eth1: switched to 
inband/1000base-x link mode

I don't really know what could be going wrong here and would would be 
very grateful for pointers on how to debug this further or solve it.
Regards,
Lorenz



