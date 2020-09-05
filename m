Return-Path: <SRS0=aCep=CO=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 63681C433E2
	for <linux-mediatek@archiver.kernel.org>; Sat,  5 Sep 2020 10:00:26 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5E6A6206E7
	for <linux-mediatek@archiver.kernel.org>; Sat,  5 Sep 2020 10:00:24 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="NnAOOG/F";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="AxMeDotJ";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=gmx.net header.i=@gmx.net header.b="lCWs+nk/"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 5E6A6206E7
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=public-files.de
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:References:In-Reply-To:Date:Subject:To:From:
	Message-ID:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=OVh8SjqLkLFlQtTVYDqJ7RBMDQ3G/u/gIUNSENbQIho=; b=NnAOOG/Fv/j/jb92PcUbXp0Jq
	Xs14jHNeo2DAe/g+ZR4EiiFoRvXJAE5Dg/WzDK4bAmdCmhqIZJaVqinWivUjdPzaneZTyhGcxJd0/
	B7XuVWM8ZmYMWrNrHt0ZkYwWbS24v35T8zE8NM5fd9FyDQYOZgFOSUIUKul5bh1l60GqXaqI15icM
	w2WpqgHuWvw/aAzRo4dtqxaqrBBkXfq42E71SlunYQpV5hdTjNXEPmDfWdI2utAiqgR5PaadfPzqS
	jBLnqj/wGmw2IRUnintjgmvD/7Q3JmvBlmrE40PI2ImnfgKLFSKiUIJ16tFBKiFFQ6c9vmbF9ihsm
	OZ9nKLCaA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kEUzV-0001gk-J3; Sat, 05 Sep 2020 10:00:13 +0000
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kEUzP-0001gF-9U; Sat, 05 Sep 2020 10:00:07 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:References:
 In-Reply-To:Date:Content-Type:Subject:Cc:To:From:Message-ID:MIME-Version:
 Sender:Reply-To:Content-ID:Content-Description;
 bh=utjDIK4c+jfyziV5qVf//NXOas3JHZKOFUJzyxLQ+AY=; b=AxMeDotJ8J+DNrXJvVs6brHFCE
 KuDqaGlD86qpnACqtmKCAbiKP3ATSOLM2JoMUft917Lt33dPs9tWaBI9YZaRp/RUiNc2s8NfDh2Io
 Y/15MY/PHsCL0Fe68yUdjJoPkLv94fOfPuPP1UL2x32If2Zpc2w6Czb+W41Z9S4gtKpyLS6CpvLX9
 MJo6V8wQpCj+E9WXFToGaoRxfbfSb2sQy3Wnl0qVWg+HkWOhmyvf8rLLs44Ih8tMN1npuDh83EvjP
 Pc2QJW2SnW+O/WA/WIVJ9FvEad2waj6wfWhuw2n7Cn61CKhyaRO4ThguO5V9vTTMVlOMOc2ZQ6AI2
 lk9GkKzw==;
Received: from mout.gmx.net ([212.227.17.20])
 by casper.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kEUzK-0002Qn-D4; Sat, 05 Sep 2020 10:00:05 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
 s=badeba3b8450; t=1599299990;
 bh=eix5yRMvEp6sJh7Rs0RgjDhlP2OHRcoVgdliMP0dXoE=;
 h=X-UI-Sender-Class:From:To:Cc:Subject:Date:In-Reply-To:References;
 b=lCWs+nk/h3oB5JCEAUOegE9GARsP0w2wJtXh/B8JsqJmUBJF64asnSe5xs9Iy/+xY
 6mCwlPrOaDG6yESOSVPss8qr3mAc4qUT7CkK1jn8bf2Gu1YMvuHfHIOBv0XVmDo0IY
 yh2rkTUGM18XQ88VmWLf5qADhLj6BcC/tSdO4sh0=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from [185.76.98.35] ([185.76.98.35]) by web-mail.gmx.net
 (3c-app-gmx-bap15.server.lan [172.19.172.85]) (via HTTP); Sat, 5 Sep 2020
 10:45:54 +0200
MIME-Version: 1.0
Message-ID: <trinity-03089c68-65a5-4572-95c3-c75b9f7e330a-1599295554893@3c-app-gmx-bap15>
From: Frank Wunderlich <frank-w@public-files.de>
To: Landen Chao <landen.chao@mediatek.com>
Subject: Aw: [PATCH net-next v3 0/6] net-next: dsa: mt7530: add support for
 MT7531
Date: Sat, 5 Sep 2020 10:45:54 +0200
Importance: normal
Sensitivity: Normal
In-Reply-To: <cover.1599228079.git.landen.chao@mediatek.com>
References: <cover.1599228079.git.landen.chao@mediatek.com>
X-UI-Message-Type: mail
X-Priority: 3
X-Provags-ID: V03:K1:MMt5CpznMQ6UwycKDY4nf8k4bJDTcA9TPyAL5cJ4hZazWapBftjA95dt/HPJGwzEahN66
 oWrPR3jwRP8mU4AAiDQnJJLY7m0uC0+fRTItnuV5exivHEEvVPkI2xxo/FVi4T45cgXGW4F40+D9
 1rRqURX+4M7x4G7YJ/LDZfTvw6nNvCiCs0882yDk/J1D9l3iD+Wuu4l8sGGeXeVxlbUPUiaIfnnF
 E3JeEECHuEDd2743H+pyJiSFr0HEbIy1iX1R404LpXTW/uP6LG1QpaKPAaY6ocZGFe/NWJ3KAKK/
 qc=
X-UI-Out-Filterresults: notjunk:1;V03:K0:QqKmGNJuINU=:0Xeq9F1Ts60+shgtFaw0LE
 2phaIGZfzN/uk+anipHpGnAq78Rq/QsZrKxX67EDb4VqlBC45clDZAxeRCynLUjpUeC5cR+lL
 EOGgZXFgi3M4WtbtP1gvYsX5yICx7JrKAloFthfJMWXdbaDmi1885hWA+ycr46i1xQGPt7yZV
 GxfakOejRgAV/pfeUctK0vna2w011126gVH9wFLjjDqJpJb03N1y07Wa13tXexUMcj7VljW6x
 yOA6eBdZMXKM625XYqa6mAVcKcZs7TpkmVLdou3mOdkvmLozrmkRLfTpEeKZiM1xlXGLVv1uc
 5VGJtCAFyTogINKw0BsCwklto855DFzm9ij4j0NxcKj9ecWpoghZx8skoO0tF5qyYmL/a+All
 Uz/LGGp7XGdnrSCGrkT1Rj+vm3Qb907Xp7rxK7bAvMRbvZe4PinxykuQT0gsTvwtAeHgl7byf
 OSvOTkExbDZ3MIcQThlxcrERldaBPwnjQp3+A7UXfHEbgyD5JxT6H/3TiZaXyapszFUq7LC7I
 CHJbNIzTtD0RXjYL5ZPZnV/CfXQ7cvwKSecsd7sFtleDTTng96hK12tNg6vaxHoAK47o0wsCL
 bgs7YCAL6sZacU13feiTZCe5Fm2c4NGTzKYS0vmJ9bXvRaUt8Fjj/ef+xR4f/0SNHvbO6EPwB
 GZKaWh5KpUY8NldoQaDWAo3K5nMY+rHfpUks0PgktXpN65rHhM2KRqw18BPZaG1YLsE8=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200905_110002_600748_B5EA08D5 
X-CRM114-Status: UNSURE (   6.28  )
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
Cc: Andrew Lunn <andrew@lunn.ch>, dqfext@gmail.com,
 Florian Fainelli <f.fainelli@gmail.com>, linux-kernel@vger.kernel.org,
 devicetree@vger.kernel.org, netdev@vger.kernel.org,
 Sean Wang <sean.wang@mediatek.com>, Russell King <linux@armlinux.org.uk>,
 "David S . Miller" <davem@davemloft.net>, opensource@vdorst.com,
 Rob Herring <robh+dt@kernel.org>, linux-mediatek@lists.infradead.org,
 Philipp Zabel <p.zabel@pengutronix.de>,
 Matthias Brugger <matthias.bgg@gmail.com>, Jakub Kicinski <kuba@kernel.org>,
 Landen Chao <landen.chao@mediatek.com>,
 Vivien Didelot <vivien.didelot@gmail.com>,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

tested full series on Bananapi-r64 (mt7531) running iperf3-server

[ ID] Interval           Transfer     Bitrate         Retr
[  5]   0.00-10.00  sec  1.09 GBytes   939 Mbits/sec    0             sender
[  5]   0.00-10.01  sec  1.09 GBytes   935 Mbits/sec                  receiver

reverse mode (-R)
[ ID] Interval           Transfer     Bitrate         Retr
[  5]   0.00-10.01  sec  1.10 GBytes   941 Mbits/sec    0             sender
[  5]   0.00-10.00  sec  1.09 GBytes   939 Mbits/sec                  receiver

similar to bananapi-r2 (mt7530)

[ ID] Interval           Transfer     Bitrate         Retr
[  5]   0.00-10.00  sec  1.09 GBytes   938 Mbits/sec    0             sender
[  5]   0.00-10.01  sec  1.09 GBytes   936 Mbits/sec                  receiver

reverse-mode:

[ ID] Interval           Transfer     Bitrate         Retr
[  5]   0.00-10.01  sec  1.05 GBytes   905 Mbits/sec  14533             sender <<<<<<<<<<<
[  5]   0.00-10.00  sec  1.05 GBytes   905 Mbits/sec                  receiver

on last test i see iperf3 has ~30%cpu load and also ksoftirqd (using debian buster), so i tried opening server on my Laptop and running iperf -c on BPI-R2 with similar result

[ ID] Interval           Transfer     Bitrate         Retr
[  5]   0.00-10.00  sec  1.03 GBytes   886 Mbits/sec  13990             sender
[  5]   0.00-10.00  sec  1.03 GBytes   885 Mbits/sec                  receiver

in dmesg of both devices only DSA-Messages (nonfatal error -95 setting MTU on port) because of missing port_change_mtu callback. here i got a patch, but had not yet time to setup environment for testing jumbo-frames too. But this just as side-note

regards Frank


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
