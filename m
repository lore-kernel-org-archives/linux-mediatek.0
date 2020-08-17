Return-Path: <SRS0=yC7h=B3=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CF63BC433DF
	for <linux-mediatek@archiver.kernel.org>; Mon, 17 Aug 2020 14:53:08 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9839C204FD
	for <linux-mediatek@archiver.kernel.org>; Mon, 17 Aug 2020 14:53:08 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="wuOctH4U";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="t6f4I5w3";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=gmx.net header.i=@gmx.net header.b="GbPByyGi"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 9839C204FD
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=public-files.de
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Date:Subject:To:From:Message-ID:MIME-Version:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=iWn7bz5H073T7ywiSr/3I7/dnUfXEupEyLaULzSGOpQ=; b=wuOctH4Uts/IzZRtTHmYQqDdG2
	BIlM3Y0Q/aG3/HzbdNzEoJrNRpY5kKkza+25YfYVucUkc8jZFpHO8o99P1iYQiVQWmevbTtgF0drw
	HZxd4ZvJZcnZdJXNViL2cX62z4ojfgIGdmD7xT7/2Zz3pqlOsP5qAUP+8AeGjzZv1tAqM8ofUyrMn
	uEfOnZoH6fV5USccTkdoA1kEz+J6Ide3TcPQQP/BRjFa703hXmdHBgA42yPsQXtfJ+PsSb8VeA1fG
	uD7WJesfPK+IsFB7Wo050iK8R1Uw+6gQRv1MkqX0T8sWBGtTltClsbr5aEGygpZWwu5SYu1dm9Od2
	WDEFcKBw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1k7gVM-0001a2-Ig; Mon, 17 Aug 2020 14:52:56 +0000
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1k7gVL-0001Zu-Az
 for linux-mediatek@merlin.infradead.org; Mon, 17 Aug 2020 14:52:55 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:Date:
 Content-Type:Subject:Cc:To:From:Message-ID:MIME-Version:Sender:Reply-To:
 Content-ID:Content-Description:In-Reply-To:References;
 bh=Fx+6XLHrnMHjJ3t2tt+9skDXbPQ1t+FMJvjKXDTQw4A=; b=t6f4I5w3f7CxW8tXHiSJ2hqNf2
 +vD8QsT25PJiJZJsyMt3a4XX2IHCNGNGvvwU/MLOvLnzaKyucsS9fDMhap1S9jIXGJTJVbEF5DtcK
 ZxyEQP/+ekMiuCWCJ+TYm8RAr8Z4XzsK6iJDdCVb0d3NSjY/LeRx5e9L3pyhoqY0qsXsnb6zfiYCl
 Q8c2rb8jQO9iL9RKrRvig+H8upKPnnJNFHdk9eHdYaKlHlhSztMv1OJZREM/HpD5FdlRlpwE75RrY
 uJua816NUVClgjCczU3XaWLi9NxEKoJ+hjX6SgnZ69fl4w+9152YdSie5vYlXDRe6Ivlmdd7Yz0pL
 3zblA+tQ==;
Received: from mout.gmx.net ([212.227.15.15])
 by casper.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1k7gVG-0006uU-Di
 for linux-mediatek@lists.infradead.org; Mon, 17 Aug 2020 14:52:53 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
 s=badeba3b8450; t=1597675960;
 bh=FnwjLb22HUjp4PiOi6cF+kfYG76GZvZBzJAczuehRww=;
 h=X-UI-Sender-Class:From:To:Cc:Subject:Date;
 b=GbPByyGiU/GhgnEIN0hnbkn/d49L5aotNLOwGBohQzxoCOYOl+Bod6yOYRO3b/TsP
 DBjNpy1cFZOIhpzLyzYB3AEAILRe+SokLq2GRO6DYLCfMZAVNmdUyVj4sMBkXQPr7b
 UqRPSWqJi695zGsNuIG5NTSTSc7atdiVNUYLK40s=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from [217.61.148.252] ([217.61.148.252]) by web-mail.gmx.net
 (3c-app-gmx-bs07.server.lan [172.19.170.56]) (via HTTP); Mon, 17 Aug 2020
 16:47:09 +0200
MIME-Version: 1.0
Message-ID: <trinity-e15639c2-d077-4b70-b351-a5888543688c-1597675629284@3c-app-gmx-bs07>
From: Frank Wunderlich <frank-w@public-files.de>
To: linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org
Subject: [BUG] 5.9-rc1 broken bootup on mt7622/mt7623
Date: Mon, 17 Aug 2020 16:47:09 +0200
Importance: normal
Sensitivity: Normal
X-Priority: 3
X-Provags-ID: V03:K1:Uq7mLMyk43jr1rVK0kpxDBhpMc+pJWcLVpnPUgo3ueusQMCuuwclCv9XQzxpBR2pqI5HB
 85o+2UHPoMDBer/aPyhiiMaYCd4o0uMIpMLPmwNg/FMwlOUl/yHFUvofQN3oXQuCGaz3Q+dwtXiy
 m5OgIkfcjxEtc7Cqlv+hDWb/JMdY+XlUL5PWdFdqTxN7+y3crWpbSCOHXqbpfCHPe4StgMZ5mJlj
 7H5kXDeBFWvPuN99OyDNDVGBGDn9GjrB+oiyca+fZO6nvaLhh93p2uBdL2bYoDyrb5cewoz6BRjo
 Gk=
X-UI-Out-Filterresults: notjunk:1;V03:K0:B79KqU03Fsc=:EP/SsK925LKHIu47g3B//5
 x1hGmuPWYHlmKMURYFCFkS3NR7aqrQOkihP4AH6Ck41G/iH+Q6W68J4AKPPXSTXLKx/BOQYZo
 F2uyG1+iHnaYZBgKAyXk5TGVGrykoU50Bo8SyqbpmOwUO56MUYeFp6xryMRizmk9n6plTTqKQ
 hqhPy+ATSU8Ww8ufoBANLW2zcuRImCobG407MhNIca3Vwa3CX8ZQKkIs6wUGBESxYrJt/bFxQ
 sQhB0GOuVu1KwfKbsEIhIbkLXVbg2gfit7Pt2T/TcJ4IMA7S2zuVBb6/4+q84Jc6hzd4WrCbL
 Gjv2nF4i5wwW77Fjpfhq7+8UEftNyTcHESF1vmwG0nI8pS9STqOLDHvKKxRLfAFTQGCk39NRx
 Mje9iOhTyH2yI8aTMycGg1qNbw2EoWauYX6X2nVp4VP/WU4AFGJodhH9GC28mWdKAACAgkpps
 CSqgLDIbPblYQU9L1kyfDAiOALU7duhbUh7Q0sVarcql2A6KLbE59nMFbNvOT94PYY3jxgKSM
 NhGTsoFlDnPo47fH6M6xOigvfxkmepdH8DhJWEDFSZvyCdeew9ZuSBj2vmYEl+1/ExlzkyEyA
 9p+ohjfp5E0EDvn5QYtwnvLQqIq+CKjZA6DXgPh/HioECELlg7Z5MzGO+O9Yh7TOlB0srbLNB
 MWzDqfAXmLKr/UskuCoN2W3lr60O//b7Rg+1j+1YzQnG9dvPDznjukcFsgEB/tHoZkdI=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200817_155251_089735_8DB4CC16 
X-CRM114-Status: UNSURE (   8.00  )
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
Cc: Matthias Brugger <matthias.bgg@gmail.com>,
 Chunfeng Yun <chunfeng.yun@mediatek.com>, Ryder Lee <ryder.lee@mediatek.com>,
 Sean Wang <sean.wang@mediatek.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Hi

at least my Bananapi R2/R64 does not bootup (no output on serial console) with 5.9-rc1

made a bisect which points me to this commit:

commit f97dbf48ca43009e8b8bcdf07f47fc9f06149b36
Author: Saravana Kannan <saravanak@google.com>
Date:   Fri Jul 17 17:06:36 2020 -0700

    irqchip/mtk-sysirq: Convert to a platform driver

    This driver can work as a platform driver. So covert it to a platform
    driver.

    Signed-off-by: Saravana Kannan <saravanak@google.com>
    Signed-off-by: Marc Zyngier <maz@kernel.org>
    Reviewed-by: Hanks Chen <hanks.chen@mediatek.com>
    Link: https://lore.kernel.org/r/20200718000637.3632841-4-saravanak@google.com

 drivers/irqchip/irq-mtk-sysirq.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

at least on my devices i got 5.9 working by reverting the commit, will send a revert-Patch

$ git bisect log
git bisect start
# bad: [d24b5abc4640b46bb356bb5371d244866a5fe0a3] gitignore: add from 5.8 + itb/mod
git bisect bad d24b5abc4640b46bb356bb5371d244866a5fe0a3
# good: [bcf876870b95592b52519ed4aafcf9d95999bc9c] Linux 5.8
git bisect good bcf876870b95592b52519ed4aafcf9d95999bc9c
# bad: [8186749621ed6b8fc42644c399e8c755a2b6f630] Merge tag 'drm-next-2020-08-06' of git://anongit.freedesktop.org/drm/drm
git bisect bad 8186749621ed6b8fc42644c399e8c755a2b6f630
# bad: [2324d50d051ec0f14a548e78554fb02513d6dcef] Merge tag 'docs-5.9' of git://git.lwn.net/linux
git bisect bad 2324d50d051ec0f14a548e78554fb02513d6dcef
# good: [92c59e126b21fd212195358a0d296e787e444087] Merge tag 'arm-defconfig-5.9' of git://git.kernel.org/pub/scm/linux/kernel/git/soc/soc
git bisect good 92c59e126b21fd212195358a0d296e787e444087
# good: [d4db4e553249eda9016fab2e363c26e52c47926f] Merge tag 'arm-newsoc-5.9' of git://git.kernel.org/pub/scm/linux/kernel/git/soc/soc
git bisect good d4db4e553249eda9016fab2e363c26e52c47926f
# good: [fd76a74d940ae3d6b8b2395cd12914630c7e1739] Merge tag 'audit-pr-20200803' of git://git.kernel.org/pub/scm/linux/kernel/git/pcmoore/audit
git bisect good fd76a74d940ae3d6b8b2395cd12914630c7e1739
# bad: [95ffa676583b23baed40861d30b65fe31397da00] Merge branch 'parisc-5.9-1' of git://git.kernel.org/pub/scm/linux/kernel/git/deller/parisc-linux
git bisect bad 95ffa676583b23baed40861d30b65fe31397da00
# bad: [f8b036a7fc231fe6e8297daddee5dffdbbf2581f] Merge tag 'irq-core-2020-08-04' of git://git.kernel.org/pub/scm/linux/kernel/git/tip/tip
git bisect bad f8b036a7fc231fe6e8297daddee5dffdbbf2581f
# good: [4f30a60aa78410496e5ffe632a371c00f0d83a8d] Merge tag 'close-range-v5.9' of git://git.kernel.org/pub/scm/linux/kernel/git/brauner/linux
git bisect good 4f30a60aa78410496e5ffe632a371c00f0d83a8d
# good: [8d16f5b979660c0fdcfa21a418cc03f1fde60cf7] genirq: Export irq_chip_retrigger_hierarchy and irq_chip_set_vcpu_affinity_parent
git bisect good 8d16f5b979660c0fdcfa21a418cc03f1fde60cf7
# bad: [c9c73a05413ea4a465cae1cb3593b01b190a233f] irqchip/loongson-liointc: Fix misuse of gc->mask_cache
git bisect bad c9c73a05413ea4a465cae1cb3593b01b190a233f
# bad: [f97dbf48ca43009e8b8bcdf07f47fc9f06149b36] irqchip/mtk-sysirq: Convert to a platform driver
git bisect bad f97dbf48ca43009e8b8bcdf07f47fc9f06149b36
# bad: [f97dbf48ca43009e8b8bcdf07f47fc9f06149b36] irqchip/mtk-sysirq: Convert to a platform driver
git bisect bad f97dbf48ca43009e8b8bcdf07f47fc9f06149b36 //needs change from 762a21fd45e0 as build-fix
# good: [3af9571cd585efafc2facbd8dbd407317ff898cf] irqchip/gic-v4.1: Ensure accessing the correct RD when writing INVALLR
git bisect good 3af9571cd585efafc2facbd8dbd407317ff898cf
# good: [f8410e626569324cfe831aaecc0504cafc12b471] irqchip: Add IRQCHIP_PLATFORM_DRIVER_BEGIN/END and IRQCHIP_MATCH helper macros
git bisect good f8410e626569324cfe831aaecc0504cafc12b471
# good: [5be57099d44550d2c4cf44a86c44df87edb79a57] irqchip/qcom-pdc: Switch to using IRQCHIP_PLATFORM_DRIVER helper macros
git bisect good 5be57099d44550d2c4cf44a86c44df87edb79a57
# first bad commit: [f97dbf48ca43009e8b8bcdf07f47fc9f06149b36] irqchip/mtk-sysirq: Convert to a platform driver

regards Frank


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
