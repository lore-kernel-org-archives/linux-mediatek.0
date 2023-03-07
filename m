Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A8C7FC678D5
	for <linux-mediatek@archiver.kernel.org>; Tue,  7 Mar 2023 18:33:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Date:Content-Type:Subject:Cc
	:To:From:Message-ID:MIME-Version:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=iiYFJVeV5Lun31L5V97QB9wHxZh/USWR/3jK7Ozn0Z8=; b=JtqtSdh3pVr793/IDBQUz/x5Bj
	fNvUQltGZe4Se3tuuS1qwqFodlt0ai7YiGfaQEcPsCyNdcQTFYz2D5Jyg3HniDFa+YGrzSbzW6Ceq
	uyZPydC+lAMZ+8vHuHeKOx7/95dkXT738x1a42nG9b3NzPZlbRCAXnS8IMZDC3ukqFcLj5cJ/6BuA
	gSlSXaNCeJUoIlNm1ux8RO6SCHZx55YKdyjrLhonobfyceJnn0tdL2PKdv1TJPowysNUwL6VBx3rm
	9hNKJXnlSalBaCc0tLq9euX6Pjj1zGNZYWuHfnhLWClWwY8kmF9TqUErpbfobaDQoCwIbYCFZ4hu1
	Kvmm7IoQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pZc7T-0020yZ-QP; Tue, 07 Mar 2023 18:33:03 +0000
Received: from mout.gmx.net ([212.227.15.19])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pZc7Q-0020xe-HQ; Tue, 07 Mar 2023 18:33:02 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=public-files.de;
	s=s31663417; t=1678213958; i=frank-w@public-files.de;
	bh=iiYFJVeV5Lun31L5V97QB9wHxZh/USWR/3jK7Ozn0Z8=;
	h=X-UI-Sender-Class:From:To:Cc:Subject:Date;
	b=nrwQLyXnCC5aMbkQ+6Szw8cSeTl6xv481PdnVPYCXBg0FFTp+clxOOyGLKECps2LE
	 YNHkGL+/ucknfCvYf8mtmpATU+/fhl2DJqc6Ey0aNYw2BL8H7ZrNBSWKkFOfcMKp+y
	 4PtsDRDUSOoxZI0bLBZlMO7xUuyZ77WgoNBNTgYsiQfWTcXj0TYh9x3+RXo+Fv7hVv
	 PEeJN5eRzHJU9f3N/ErvKFnhep0hO+kRgmiH6U3aVGNDqcwJ9T6b31EbS+InFrTcpW
	 TMEwudSd2z6rAeXuoqbTQxMOILXZ8HFfoIp+MfAa2edIbiKX0wA6ZQWwaoLudPNxOZ
	 PTC/48FGwQAAg==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from [217.61.156.24] ([217.61.156.24]) by web-mail.gmx.net
 (3c-app-gmx-bs16.server.lan [172.19.170.68]) (via HTTP); Tue, 7 Mar 2023
 19:32:38 +0100
MIME-Version: 1.0
Message-ID: <trinity-92c3826f-c2c8-40af-8339-bc6d0d3ffea4-1678213958520@3c-app-gmx-bs16>
From: Frank Wunderlich <frank-w@public-files.de>
To: Felix Fietkau <nbd@nbd.name>, Mark Lee <Mark-MC.Lee@mediatek.com>, Sean
 Wang <sean.wang@mediatek.com>, Daniel Golle <daniel@makrotopia.org>
Cc: Lorenzo Bianconi <lorenzo@kernel.org>, "David S. Miller"
 <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, Jakub Kicinski
 <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, Matthias Brugger
 <matthias.bgg@gmail.com>, John Crispin <john@phrozen.org>, AngeloGioacchino
 Del Regno <angelogioacchino.delregno@collabora.com>,
 netdev@vger.kernel.org, linux-mediatek@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org
Subject: [BUG] MTK SoC Ethernet throughput TX only ~620Mbit/s since 6.2-rc1
Content-Type: text/plain; charset=UTF-8
Date: Tue, 7 Mar 2023 19:32:38 +0100
Importance: normal
Sensitivity: Normal
X-Priority: 3
X-Provags-ID: V03:K1:ubRWJfPcckhsg8gokIy5pT2FiG3BLjXPVe2Bp2f2IhnzRb7del4i7YLlq+tA7wVTjxgOW
 8Ou0/KrAWx322W9iRCjABuv9wZ3f03whhGZFDnag7vtjT+Nhj6iGtUQeidVh8zqPC9zyiVDweRhC
 lOryXI3U+73Kv1nSsOT6BHD9lCGbv63CHS9XZAT33TKsEi1gtJUfFgJS1wmlEZ5H3ygNsmEEQwDG
 ig5TSwZQITE0mMrXUtLcSx9evYtYZmqEAwhM0klefPQkSaqrYPDdrrh+MVZYibvwITdfYPz42vTT
 LI=
UI-OutboundReport: notjunk:1;M01:P0:r9ye7wDW7pg=;Jfx09dZpv3ZaCbno6AfR0AMqdNB
 rk0ZYj+3BgeN+F9WFQifUjaQw76M5ozqb3poMp/MOv129rT9nCAfgHVNj8+KuL3/F2gtkOXxY
 t8UJ1np1S69eVLxUwWVvVcdx4P3hRM/b5ibGqbVB/WF2HvpUV3Ny1CajvH+8r8F8vduzM5Wa1
 CeKhXUotHJgIn3m24VhpFevqwdUVg95eSN+LDwr3F+REVr+HZ79FqhT17Is5qipPu83V4U+3M
 6Shhi0yJEEgjiiO9gkY8G9R+vlVk2D0qdYHVvBXWDrjpR+9aIylO8lyYkwgr99d4doUIVTEkt
 e/YXaqib4Kxodx0m+F+brczfzNxNpCKc6pYcaof2v7unRpuc1Gb242QYSNk3IVmmuEqYfO+7p
 MvXcTeJs+yuEyIjswNTI8akIfRf1tsYqJUVWjo2DZvT1Lh7xzxnGv+SaAZb/gXC8W4t8MNRcg
 JxDgOJyIR5dbxIi6m/vuKywhyHbqttRjL6SmLl7leVL5jfBOSWyktEXBiNMVvcEzjZ61z4z5U
 hn6nLUDZkZ1sovff2YWWqLlMnoCXPWxA1trjDm94jCZ7Hywbmc9MonRee8Lgy4w7pUvdRRDIZ
 ho8tggehVMUrWFV3czpHDdVM9lT9Leas9GSgDXhE/VfAP3m0lUl21UgWjqUkzRHAore120v/z
 xTsVMogWaoOHCqEACuBX/8xygKKGHA6YgiA3PvBAQ1hPhyn6U3q5fklDXYsQ5z1HrlOWMsLjb
 AYDH8t7jnkQ2ZRpQEHv4tJKct6lBMHNNuqA96cQmfaPCAB0vvQCk+pFvnWGKvD310nHceuLNu
 O3BFEdrh22FuorwP5u141KA0+GNWZp2jDDxtmUZd0dy3A=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230307_103300_986899_D6FA80EF 
X-CRM114-Status: UNSURE (   8.69  )
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

i've noticed that beginning on 6.2-rc1 the throughput on my Bananapi-R2 and Bananapi-R3 goes from 940Mbit/s down do 620Mbit/s since 6.2-rc1.
Only TX (from SBC PoV) is affected, RX is still 940Mbit/s.

i bisected this to this commit:

f63959c7eec3151c30a2ee0d351827b62e742dcb ("net: ethernet: mtk_eth_soc: implement multi-queue support for per-port queues")

Daniel reported me that this is known so far and they need assistance from MTK and i should report it officially.

As far as i understand it the commit should fix problems with clients using non-GBE speeds (10/100 Mbit/s) on the Gbit-capable dsa
interfaces (mt753x connected) behind the mac, but now the Gigabit speed is no more reached.
I see no CRC/dropped packets, retransmitts or similar.

after reverting the commit above i get 940Mbit like in rx direction, but this will introduce the problems mentioned above so this not a complete fix.

example output before revert on mt7623/bpi.r2:

root@bpi-r2:~# iperf3 -c 192.168.0.21
Connecting to host 192.168.0.21, port 5201
[ 5] local 192.168.0.11 port 48882 connected to 192.168.0.21 port 5201
[ ID] Interval Transfer Bitrate Retr Cwnd
[ 5] 0.00-1.00 sec 75.3 MBytes 632 Mbits/sec 0 396 KBytes
[ 5] 1.00-2.00 sec 74.3 MBytes 623 Mbits/sec 0 396 KBytes
[ 5] 2.00-3.00 sec 74.6 MBytes 625 Mbits/sec 0 396 KBytes
[ 5] 3.00-4.00 sec 73.9 MBytes 620 Mbits/sec 0 396 KBytes
[ 5] 4.00-5.00 sec 74.6 MBytes 626 Mbits/sec 0 396 KBytes
[ 5] 5.00-6.00 sec 74.4 MBytes 624 Mbits/sec 0 396 KBytes
[ 5] 6.00-7.00 sec 74.4 MBytes 624 Mbits/sec 0 396 KBytes
[ 5] 7.00-8.00 sec 74.4 MBytes 624 Mbits/sec 0 396 KBytes
[ 5] 8.00-9.00 sec 73.9 MBytes 620 Mbits/sec 0 396 KBytes
[ 5] 9.00-10.00 sec 74.6 MBytes 626 Mbits/sec 0 396 KBytes
- - - - - - - - - - - - - - - - - - - - - - - - -
[ ID] Interval Transfer Bitrate Retr
[ 5] 0.00-10.00 sec 745 MBytes 625 Mbits/sec 0 sender
[ 5] 0.00-10.05 sec 744 MBytes 621 Mbits/sec receiver

iperf Done.
root@bpi-r2:~# ethtool -S eth0 | grep -v ': 0'
NIC statistics:
tx_bytes: 819999267
tx_packets: 538815
rx_bytes: 18338089
rx_packets: 261984
p06_TxUnicast: 261974
p06_TxMulticast: 10
p06_TxPktSz65To127: 261983
p06_TxPktSz256To511: 1
p06_TxBytes: 19386025
p06_RxFiltering: 13
p06_RxUnicast: 538783
p06_RxMulticast: 31
p06_RxBroadcast: 1
p06_RxPktSz64: 3
p06_RxPktSz65To127: 47
p06_RxPktSz128To255: 2
p06_RxPktSz256To511: 1
p06_RxPktSz512To1023: 2
p06_RxPktSz1024ToMax: 538760
p06_RxBytes: 819999267

Hope i've forgot no information for now :)

regards Frank

