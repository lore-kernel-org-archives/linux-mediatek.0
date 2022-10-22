Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 21C2CC433FE
	for <linux-mediatek@archiver.kernel.org>; Sat, 22 Oct 2022 10:52:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	References:In-Reply-To:Date:Content-Type:Subject:Cc:To:From:Message-ID:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/B2xlRoYaO6vdRiaURdXthAWr6Z3JTRdnxZApfQ8yCA=; b=vNWeXAl7TaCV6B2UymqViHihBz
	QcKt3ndX//VgdXP/Ju//FbErrY4/KZLvFYj91dkDY99xGJUoD4HrkpVfV2tkOIYlk9vkll9+SzB7E
	nKxjJpLBqrwazqLk00qCLwhqyOWNNRxquBDDPD/HBxcsAOo/WwB2FMFOC7zAHgr605gufVeIAyMBw
	KkWS/+486hHYbPr+yorKimqgTRpqCzSmgq/XMuiRZbDLwQnyDIIX9kN5cKNLnJcwlFCh66H2zAnzG
	g1hKq/oibCUuz9N11is49KlkqzxS+yREI6QaLPW+K51jdxk4PVFTV1skHIRIuQEqGZgOrFSsUZDq9
	Ssgi0WlQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1omC7K-00CIb3-H6; Sat, 22 Oct 2022 10:52:38 +0000
Received: from mout.gmx.net ([212.227.17.20])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1omC78-00CIWj-PL; Sat, 22 Oct 2022 10:52:28 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
	s=badeba3b8450; t=1666435920;
	bh=3Yd90e9Q3V8HInE/QdG86ZT+3Jb9FgTQiauiO9qiniw=;
	h=X-UI-Sender-Class:From:To:Cc:Subject:Date:In-Reply-To:References;
	b=bFtep/EyWURlXqgf9v4kjce5ykEHZdH+xMN9epLAVheyC4MRJaQ++eQSH4/B+9+Qi
	 knSJacrOCimWL1jaD1ngGwaCZY4ACsqvX1s2P6heH2M0So+5V/nG6HrfIAdi7Mr/0G
	 u2yuYTBEj2M6aTXXqWn5kiTzWis1+LCoTPQykxGE=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from [80.245.73.148] ([80.245.73.148]) by web-mail.gmx.net
 (3c-app-gmx-bs49.server.lan [172.19.170.102]) (via HTTP); Sat, 22 Oct 2022
 12:52:00 +0200
MIME-Version: 1.0
Message-ID: <trinity-4470b00b-771b-466e-9f3a-a3df72758208-1666435920485@3c-app-gmx-bs49>
From: Frank Wunderlich <frank-w@public-files.de>
To: "Russell King (Oracle)" <linux@armlinux.org.uk>
Cc: Frank Wunderlich <linux@fw-web.de>, linux-mediatek@lists.infradead.org,
 Alexander Couzens <lynxis@fe80.eu>, Felix Fietkau <nbd@nbd.name>, John
 Crispin <john@phrozen.org>, Sean Wang <sean.wang@mediatek.com>, Mark Lee
 <Mark-MC.Lee@mediatek.com>, "David S. Miller" <davem@davemloft.net>, Eric
 Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>, Paolo
 Abeni <pabeni@redhat.com>, Matthias Brugger <matthias.bgg@gmail.com>,
 netdev@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org
Subject: Aw: Re: Re: Re: [PATCH v2] net: mtk_sgmii: implement mtk_pcs_ops
Content-Type: text/plain; charset=UTF-8
Date: Sat, 22 Oct 2022 12:52:00 +0200
Importance: normal
Sensitivity: Normal
In-Reply-To: <Y1Ozp2ASm2Y+if3Q@shell.armlinux.org.uk>
References: <20221020144431.126124-1-linux@fw-web.de>
 <Y1F0pSrJnNlYzehq@shell.armlinux.org.uk>
 <02A54E45-2084-440A-A643-772C0CC9F988@public-files.de>
 <Y1JhEWU5Ac6kd2ne@shell.armlinux.org.uk>
 <trinity-e60759de-3f0f-4b1e-bc0f-b33c4f8ac201-1666374467573@3c-app-gmx-bap55>
 <Y1LlnMdm8pGVXC6d@shell.armlinux.org.uk>
 <trinity-b567c57e-b87f-4fe8-acf7-5c9020f85aed-1666381956560@3c-app-gmx-bap55>
 <Y1MO6cyuVtFxTGuP@shell.armlinux.org.uk>
 <9BC397B2-3E0B-4687-99E5-B15472A1762B@fw-web.de>
 <Y1Ozp2ASm2Y+if3Q@shell.armlinux.org.uk>
X-UI-Message-Type: mail
X-Priority: 3
X-Provags-ID: V03:K1:/yp+jB8wmgCtvIVgjcE7k4KpTSbWp2vpANssuY7SBFJCyxd+swPt57st3f9b5swAGXYzB
 NTpO1Fxzt19W9CUJANtb1MCEg8hj6c+UHZ+Kh0iUk6MDazLicfwXwLUk17Lw3/g2UNnLr1LEEeim
 YOyb5p1bvIaD5DrRrv0JnmGE2tu2WaTZ1+/ULfzbamzYeFKuorV/L1O2O3Pp6nMC52XH48jVjrT1
 R8yw5p2kAm1UMQqNL1YjK1ZW9IUejt+50MctyghHABP4XHVtBCnIU9izey0LlcPNobWJhzdQidC1
 IE=
X-UI-Out-Filterresults: notjunk:1;V03:K0:x4/0YoO09AA=:M0/dzt/fPCaOrmq7l9Dhss
 viZ71vainczpiQZVOZUThjHNw8OOIe6fILNQMZVJoS/MxACJE45r6ElnAFjVXYonld0QXz2De
 /siGNnKMiSyxZcQzgpw4P1fFfk8liBf6jkTXRS35ZZ34E7CuyDJO6kKtqw+FoYQmun1lvCrYH
 MLbNnVp5f+cocMRG7AN9CGIT/Y80HCnypOAl4YHTpeYD5XbCLXufADsJ+IoZPQg+HaicO4mA2
 QL73xM0+ZKjmcwY07+h5u3KP+xUx02dz0vt3McCYeiwK7dUBRMi/rki4cRiNM/9RyqysPKtGB
 gyAPXpmyQLJhHd3eOHNFhQJCWBFuuLb88DqYe7VNB+2nZbVUX0B1yjMdFTVRaLAKkscdiyg0b
 m+rp5SmVxY4FFHrd3aWjuXDRkRLTnlokMcHw189AwV3hohVDqrQf3qEJISCpLgHVqCWGcDJT+
 onVrs3CRvpTy3YqUCNDlsdA8KZceS73VVFaw4P1NkPZk3VxI8vX+PBMbWoCl5okI9USLOw5A7
 qdfU7ruY0ToYjW/Ignaby3dTRb+B4zwZBxtsOAqSSSds3p0bo/5l+pUw7PsT/k0ZI3l7AIZk1
 DKCWLen3Vik3CrGSGZWN5hJR+smiTFBiMHSMqc76cIfyyk36pHNSMUs27mRgOSCLlynYDwo+f
 uNaqSsxX0ZJLs2HLH5V3fLQ71HXYJ5zz7N74tNYLrcNDxN34d04HUXe2Mpdb+4q/jBT4VRWSY
 0SzBzdrXNLZ9dCBxILimCh2ogAR5ZGHKUigfUH3csYFyICR+UGs1MlHHLcLBW1R9nnRV86JiS
 LOemt9zQ4WI/MBhQFrpK2Z3pnSrzszxAPTGpAao0zYjA/tSpSaH+0LvxH9CULLfuJYgClWSly
 l1ssmn9kmUGwUdzzEb0GGwQdTi6xgjQhmEZ5jxy6tRfrHXr3sT46yZXwrzXsyPzsvlvgSDLm5
 tvK70roFZUIlttrxVzazER5NxPazHY0OtNpkT+fl8ccRQFvMcdGNlL4b+1jQ344rrEDZaZ9da
 az7dBWzqz/bBLhEtvKddhTxUgVA+WtZZTdhxsrnIgSMwyh5I4RdjRSmSGgwS16Aw7iYnBNpwe
 uiRzw81mvpEzAqCPZZi06Zly+9O88zVAsPS2Y8GTuXT+f6rZYxyRWDgGdALHY51VOcFi4UWYB
 2gswqjuXG6hl3XjXRrWuJurJbjb/KUf/eLF2Ovk3Y/XwjsnYvz2SMWhY38zBd9MhMerr8M+rW
 EtgLY3QCQWa4UQTQTZiPZWIFB9Z7bgsDG1Ul0cmmIhoF7+9/i+9NWouxJXHqOeMVZFKVXSbMc
 fcMPo0dM
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221022_035227_307312_379C00D4 
X-CRM114-Status: UNSURE (   8.04  )
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

> Gesendet: Samstag, 22. Oktober 2022 um 11:11 Uhr
> Von: "Russell King (Oracle)" <linux@armlinux.org.uk>

> Please try this untested patch, which should setup the PCS to perform
> autonegotiation when using in-band mode for 1000base-X, write the
> correct to offset 8, and set the link timer correctly.

hi,

this patch breaks connectivity at least on the sfp-port (eth1).

root@bpi-r3:~# ip link set eth1 up
[   65.457521] mtk_soc_eth 15100000.ethernet eth1: configuring for inband/=
1000base-x link mode
root@bpi-r3:~# [   65.522936] offset:0 0x2c1140
[   65.522950] offset:4 0x4d544950
[   65.525914] offset:8 0x40e041a0
[   65.529064] mtk_soc_eth 15100000.ethernet eth1: Link is Up - 1Gbps/Unkn=
own - flow control off
[   65.540733] IPv6: ADDRCONF(NETDEV_CHANGE): eth1: link becomes ready

root@bpi-r3:~# ip a a 192.168.0.19/24 dev eth1
root@bpi-r3:~# ip r a default via 192.168.0.10
root@bpi-r3:~# iperf3 -c 192.168.0.21 #ping does not work too
iperf3: error - unable to send control message: Bad file descriptor
root@bpi-r3:~# ethtool eth1
[  177.346183] offset:0 0x2c1140
[  177.346202] offset:4 0x4d544950
Settings for eth[  177.349168] offset:8 0x40e041a0
1:
        Supported p[  177.352477] offset:0 0x2c1140
[  177.356952] offset:4 0x4d544950

        Supported link modes:   1000baseX/Full
        Supported pause frame use: Symmetric Receive-only
        Supports auto-negotiation: Yes
        Supported FEC modes: Not reported
        Advertised link modes:  1000baseX/Full
        Advertised pause frame use: Symmetric Receive-only
        Advertised auto-negotiation: Yes
        Advertised FEC modes: Not reported
        Speed: 1000Mb/s
        Duplex: Unknown! (255)
        Auto-negotiation: on
        Port: FIBRE
        PHYAD: 0
        Transceiver: internal
        Current message level: 0x000000ff (255)
                               drv probe link timer ifdown ifup rx_err tx_=
err
        Link detected: yes
root@bpi-r3:~#

from sgmii_init
[    1.091796] dev: 1 offset:0 0x81140
[    1.094977] dev: 1 offset:4 0x4d544950
[    1.098456] dev: 1 offset:8 0x1
...
pcs_get_state
[   65.522936] offset:0 0x2c1140
[   65.522950] offset:4 0x4d544950
[   65.525914] offset:8 0x40e041a0
[  177.346183] offset:0 0x2c1140
[  177.346202] offset:4 0x4d544950
[  177.349168] offset:8 0x40e041a0
[  177.352477] offset:0 0x2c1140
[  177.356952] offset:4 0x4d544950

regards Frank

