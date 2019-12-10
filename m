Return-Path: <SRS0=F6Lp=2A=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9CED7C3F68F
	for <linux-mediatek@archiver.kernel.org>; Tue, 10 Dec 2019 11:37:59 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 722A8208C3
	for <linux-mediatek@archiver.kernel.org>; Tue, 10 Dec 2019 11:37:59 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="Z+iFcy4t";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=gmx.net header.i=@gmx.net header.b="DYqzdHVF"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 722A8208C3
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=public-files.de
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:References:In-Reply-To:Date:Subject:To:
	From:Message-ID:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=haRBAW5re8OHdvz0eU/0n5NEBualyLIpGVI+aPevOy8=; b=Z+iFcy4tdXlAQD
	Ses3Hg59rhuq+W1pLaU7Ywwf+Paq3rZ+luhwyl37ogOIScEnJV83eZExmhYpRe4YY7OQKtE1n4Wfm
	NajI/8EgB3NT+2Pt8pxWjqmL10AbBCJTvWD8AU2D45mFBiOOmHi7s9o8zsV2AY/fUp4eCs8EJfsZA
	MkjBTNtTzVbYfREIRRxHptaPRDAKEyrttKrrr32z70iaP5J9p6D8azI3m5ZDbm492cxAFeIjjY+xV
	gvvvNqysjNz2FSyWrj11HUkAbB8zVzbl5TKbxXD7NTC+xNiDTkpIno8zFu+smUpnL78OODTMvK+cb
	1THK5BlzBNjSCeU1wGxA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1iedps-0000wP-SU; Tue, 10 Dec 2019 11:37:48 +0000
Received: from mout.gmx.net ([212.227.15.15])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1iedpq-0000vV-1f
 for linux-mediatek@lists.infradead.org; Tue, 10 Dec 2019 11:37:48 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
 s=badeba3b8450; t=1575977828;
 bh=He5CmkAr29FB4eRkHCWB5ZuYfLynVAdGIaPMEFclt6s=;
 h=X-UI-Sender-Class:From:To:Cc:Subject:Date:In-Reply-To:References;
 b=DYqzdHVF3y06fAIXaE34SiDAOXxtMS0iMf4tbr1NeEs2LTBwlLeLZU1UnvRoNYZww
 p5qEgZyz8GYP9B7mBKQoLECKd85cU+Ydm//VbFwzzwZ2BRS/MQacS1jWkp8niWsGj6
 4lzXDmK9bdKNTGVlshtPgFE61gIVkJtAFfVI1JdM=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from [185.53.43.95] ([185.53.43.95]) by web-mail.gmx.net
 (3c-app-gmx-bs14.server.lan [172.19.170.66]) (via HTTP); Tue, 10 Dec 2019
 12:37:08 +0100
MIME-Version: 1.0
Message-ID: <trinity-be64e2d4-f70d-4bd8-82aa-fb5b07de0149-1575977828752@3c-app-gmx-bs14>
From: "Frank Wunderlich" <frank-w@public-files.de>
To: "Landen Chao" <landen.chao@mediatek.com>
Subject: Aw: [PATCH net-next 0/6] net-next: dsa: mt7530: add support for MT7531
Date: Tue, 10 Dec 2019 12:37:08 +0100
Importance: normal
Sensitivity: Normal
In-Reply-To: <cover.1575914275.git.landen.chao@mediatek.com>
References: <cover.1575914275.git.landen.chao@mediatek.com>
X-UI-Message-Type: mail
X-Priority: 3
X-Provags-ID: V03:K1:4r71h9Id7lIxLvhWGaanz8HzVDn2EN4RDfdcEk93knYE5eLJt3mSN3keYSRt852HP3ezg
 dBD8EAohBV7/z3Y8L50s6x5trisCsEm6WrRDoVWkLUFLmAGr3SvqFvfvqV16qZptKs7OhfEkt1Sz
 CQoqy0ysdmK0EJJq9zNF+DEcPm2gfIXsZtClhWjqR8iEdZtNUbr25JKrrlOLilkTkONwxoDzuLHA
 Y8oGaZngiKm8j8U8UI9maT/CVxDsGfaTyb1PD1kGDS0RghX7ngay1cM+xlKnsfZ7a+1P+WaxaPDs
 84=
X-UI-Out-Filterresults: notjunk:1;V03:K0:Y+zfh0Nni9M=:d1BklLbL735ejs8j88j0bC
 mpbX9pJBwfbOSVwp4/Bishz6v3EBsAU68LYy+DejDCXgRBUODaqznRkE6gafuko9FT5rhQ89z
 6CVr7ZfYWtHIJ87rlcCwkxZB3xZnyL4SS7nctqsOS6W4Vs+VfChBOXhta1UvEjIdyzxn3Eww3
 grYrGOhh5F5jdlWrgCKws7kVbFZqXndDhKHLgIbBso0nm3Kd9u2RG88Jx2lNnrPc61Ibe8VUz
 THLjI6IVcGDARMHSJXKicoghxd0NjJaW625vZahyqr+Jhxtx9S7KOCNE6rYbh4arVnY8JvtHD
 Fpuh0OxLyldsAwhIBIGsiYm1ZD0OI2jIKAKuYgQ/1Z6lyJQdgnIM5CstNNgssoBZrlSjW1Y/a
 AxpHrfoB2W8RowBd5H3l1y0VreRKuDNqqtS6Pe/rBrN9PTw6b6ZyLJ4YXoLNQBjw/aE9hmaQm
 bTfXsL83vCcBAhOSlqdT78pJ0iPVjbF8ntMYxUBV+nJxp5Ck1a4CJWRmH+W/eZpqrhuVeGtfV
 ymxyiR+9Gi8t/oRhwoBqXqACKgkw/nZEuF+0WcftL6SQvQc1cRcn9sh2BMiWJPzIMH+Sro6fp
 Gfrm1FMebISZYVCIcGhZmXnqdyfHKtpMhJgoIGqiU0Dy04dck/X/RX4Eb8ZJgT1Ag7aQGApaN
 wjmIBkZAioBxyr5MYv0J7q31pbvBdZuMhNIqGUkaoMEaMpCIRWK7MAo8tV42PhudlRCE=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20191210_033746_422930_014096F0 
X-CRM114-Status: UNSURE (   5.65  )
X-CRM114-Notice: Please train this message.
X-BeenThere: linux-mediatek@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-mediatek.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mediatek>, 
 <mailto:linux-mediatek-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mediatek/>
List-Post: <mailto:linux-mediatek@lists.infradead.org>
List-Help: <mailto:linux-mediatek-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mediatek>, 
 <mailto:linux-mediatek-request@lists.infradead.org?subject=subscribe>
Cc: mark.rutland@arm.com, andrew@lunn.ch,
 Landen Chao <landen.chao@mediatek.com>, f.fainelli@gmail.com,
 vivien.didelot@savoirfairelinux.com, netdev@vger.kernel.org,
 sean.wang@mediatek.com, linux-kernel@vger.kernel.org, opensource@vdorst.com,
 devicetree@vger.kernel.org, robh+dt@kernel.org,
 linux-mediatek@lists.infradead.org, matthias.bgg@gmail.com,
 davem@davemloft.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Hi

thank you for the DSA-driver, works so far, but a bit to improve:

i got some retransmitts on RX (TX looks good)...i guess a clk/pll problem

Iperf3-Client (BPI-R64,192.168.0.19):

root@bpi-r64:~# iperf3 -c 192.168.0.21
Connecting to host 192.168.0.21, port 5201
[  5] local 192.168.0.19 port 56412 connected to 192.168.0.21 port 5201
[ ID] Interval           Transfer     Bitrate         Retr  Cwnd
[  5]   0.00-1.00   sec   114 MBytes   957 Mbits/sec    0   1003 KBytes
[  5]   1.00-2.00   sec   113 MBytes   944 Mbits/sec    0   1.08 MBytes
[  5]   2.00-3.00   sec   112 MBytes   941 Mbits/sec    0   1.08 MBytes
[  5]   3.00-4.00   sec   112 MBytes   941 Mbits/sec    0   1.08 MBytes
[  5]   4.00-5.00   sec   112 MBytes   942 Mbits/sec    0   1.08 MBytes
[  5]   5.00-6.00   sec   112 MBytes   944 Mbits/sec    0   1.21 MBytes
[  5]   6.00-7.00   sec   112 MBytes   944 Mbits/sec    0   1.27 MBytes
[  5]   7.00-8.00   sec   112 MBytes   943 Mbits/sec    0   1.27 MBytes
[  5]   8.00-9.00   sec   111 MBytes   934 Mbits/sec    0   1.27 MBytes
[  5]   9.00-10.00  sec   112 MBytes   944 Mbits/sec    0   1.27 MBytes
- - - - - - - - - - - - - - - - - - - - - - - - -
[ ID] Interval           Transfer     Bitrate         Retr
[  5]   0.00-10.00  sec  1.10 GBytes   943 Mbits/sec    0             sender
[  5]   0.00-10.00  sec  1.10 GBytes   941 Mbits/sec                  receiver

iperf Done.

root@bpi-r64:~# iperf3 -c 192.168.0.21 -R
Connecting to host 192.168.0.21, port 5201
Reverse mode, remote host 192.168.0.21 is sending
[  5] local 192.168.0.19 port 56420 connected to 192.168.0.21 port 5201
[ ID] Interval           Transfer     Bitrate
[  5]   0.00-1.00   sec   112 MBytes   941 Mbits/sec
[  5]   1.00-2.00   sec   112 MBytes   941 Mbits/sec
[  5]   2.00-3.00   sec   111 MBytes   933 Mbits/sec
[  5]   3.00-4.00   sec   112 MBytes   941 Mbits/sec
[  5]   4.00-5.00   sec   112 MBytes   937 Mbits/sec
[  5]   5.00-6.00   sec   112 MBytes   941 Mbits/sec
[  5]   6.00-7.00   sec   111 MBytes   933 Mbits/sec
[  5]   7.00-8.00   sec   112 MBytes   939 Mbits/sec
[  5]   8.00-9.00   sec   112 MBytes   936 Mbits/sec
[  5]   9.00-10.00  sec   112 MBytes   941 Mbits/sec
- - - - - - - - - - - - - - - - - - - - - - - - -
[ ID] Interval           Transfer     Bitrate         Retr
[  5]   0.00-10.00  sec  1.10 GBytes   942 Mbits/sec  605             sender
[  5]   0.00-10.00  sec  1.09 GBytes   939 Mbits/sec                  receiver

iperf Done.

Iperf3-Server (my Laptop,192.168.0.21, reverse mode only):

Accepted connection from 192.168.0.19, port 56418
[  5] local 192.168.0.21 port 5201 connected to 192.168.0.19 port 56420
[ ID] Interval           Transfer     Bandwidth       Retr  Cwnd
[  5]   0.00-1.00   sec   115 MBytes   965 Mbits/sec    0    772 KBytes
[  5]   1.00-2.00   sec   112 MBytes   944 Mbits/sec    0    772 KBytes
[  5]   2.00-3.00   sec   111 MBytes   933 Mbits/sec  157    643 KBytes
[  5]   3.00-4.00   sec   112 MBytes   944 Mbits/sec    0    755 KBytes
[  5]   4.00-5.00   sec   111 MBytes   933 Mbits/sec  141    625 KBytes
[  5]   5.00-6.00   sec   112 MBytes   944 Mbits/sec    0    740 KBytes
[  5]   6.00-7.00   sec   111 MBytes   933 Mbits/sec  307    438 KBytes
[  5]   7.00-8.00   sec   111 MBytes   933 Mbits/sec    0    585 KBytes
[  5]   8.00-9.00   sec   112 MBytes   944 Mbits/sec    0    700 KBytes
[  5]   9.00-10.00  sec   112 MBytes   944 Mbits/sec    0    803 KBytes
[  5]  10.00-10.00  sec  0.00 Bytes  0.00 bits/sec    0    803 KBytes
- - - - - - - - - - - - - - - - - - - - - - - - -
[ ID] Interval           Transfer     Bandwidth       Retr
[  5]   0.00-10.00  sec  1.10 GBytes   942 Mbits/sec  605             sender
[  5]   0.00-10.00  sec  0.00 Bytes  0.00 bits/sec                  receiver

regards Frank

[1] https://github.com/frank-w/BPI-R2-4.14/tree/5.5-r64-netnext

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
