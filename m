Return-Path: <SRS0=QAkp=PD=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 99C80C433F5
	for <linux-mediatek@archiver.kernel.org>; Fri, 15 Oct 2021 14:31:35 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 633AA610E5
	for <linux-mediatek@archiver.kernel.org>; Fri, 15 Oct 2021 14:31:35 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 633AA610E5
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=v2BHTBFs6cY/u+9aiLUmmy0j3nYq0+6we/TbUTtqHzY=; b=u4OEtrv2PEhhYr
	qjDE9QdaNJIwFLYmHWt0Xj2kbPiY3Q+LxJnbEkSPDsdOJkpgTDnMdhDtAInl4BWM0UxMbH2Fivy3V
	W/Jv3S9u477jlAcCIvDfrpaGtVKMeyqqS+fNrC3LTwX0yfi5Fr2I3vRG54+6e9/NDDG/T+jErAWce
	1AvbqofEb+8JxVDG1ix5pqePBlPPb5ZNfDJUul4CQeXFY7M9czn18F1Q6DsaypEcIpAJYlrql2+j2
	2NbhswUhdLCHtOBox4/9JDeCDp6WRkPCoUSJQHNDXwdK6cxAfbKHo2ic6omwAbotPeASaeozF/wJI
	GHHh9okKot7vw6EP+5ig==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mbOEx-007cJB-Aw; Fri, 15 Oct 2021 14:31:19 +0000
Received: from mail-lf1-x134.google.com ([2a00:1450:4864:20::134])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mbO7Q-007Z67-Ut
 for linux-mediatek@lists.infradead.org; Fri, 15 Oct 2021 14:23:34 +0000
Received: by mail-lf1-x134.google.com with SMTP id z11so41164891lfj.4
 for <linux-mediatek@lists.infradead.org>; Fri, 15 Oct 2021 07:23:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:from:date:message-id:subject:to:cc;
 bh=I1yd0Kg3PInoRGoWNvW2I6imujJbF3fiak9H6lsWXX4=;
 b=A6gREVibTcvNTmVGky9se8S1lvkH2RkTmrzx0uyklyAHNnznIAuwXNsCMXBArO6tuW
 Ts5Hj6G//NuWsg4XxCr0W6zmdwbDovER6pZr3jxyaq1KOov635aTjdrShrsV1Pn8vJ0+
 rA1vkK+DDlWjqIoXydA/DIvJ7JCOWrm/aoB5CXJ/PZBt8Qq00wU5bCGKnpzURcC+sKPY
 tGLgDbPrBmWhM8xm7XHQM8TrhAvOqoHzESWsDNpMtIbNUiLM21ro5rPKFDS89Il75pkQ
 M95wMgkncoNfS3qsRW6+pTIoo4Pf7dUix4TR4Bb/S1+yqOwMS+iqMf1CPJwh3qLHnm2e
 yh8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to:cc;
 bh=I1yd0Kg3PInoRGoWNvW2I6imujJbF3fiak9H6lsWXX4=;
 b=5+A25O30/IWIokG+KM3dycCXh4X2VQPcvhvO7T3dyuJvqBcXT5Kl55AZdShaFVMch3
 Welsf9GJHavrAZocnatSKhDHUrWHbUNppIM3F5YZREJokO6KnMN+rw/KQ8bRV5/TVFou
 OcZtbmh5JQDtpVUb3wOtCdaD5Lb2e6p9Uqjc7zK8QFyjdGouZDwGOpGlhFIfLkHLrZDe
 lxYSIdx1ZcP5b//BSeDs2/XuFLHs8wHVWxGcwmNsV4zqiWqMwxQmfcJTEXtKks3ugFmP
 Onn3eyCyT2qdqao5CtRCr4usMqsr5zfddLzFk4tayqJ2Rp1iInxBXfelOHZY9F9OV//H
 DBtg==
X-Gm-Message-State: AOAM5304M/YHfRRqlYhOXDpU52ZoMWdy3aTpaAM8i1dfb+npwfH07cAd
 5eztvmQLmoefE4hjAS3ACw6jhtGJHD03BsOWC0c=
X-Google-Smtp-Source: ABdhPJzZJ8TJkviFsYjb2WrxfvYmZctptkQf1LYDEtA2oI9sGpdQwQvqOquaksjkFTUO+sjBQbc7RFGwwkOD3REm54Q=
X-Received: by 2002:a05:6512:2213:: with SMTP id
 h19mr11789382lfu.576.1634307809209; 
 Fri, 15 Oct 2021 07:23:29 -0700 (PDT)
MIME-Version: 1.0
From: DENG Qingfang <dqfext@gmail.com>
Date: Fri, 15 Oct 2021 22:23:17 +0800
Message-ID: <CALW65jbKsDGTXghqQFQe2CxYbWPakkaeFrr+3vAA4gAPjeeL2w@mail.gmail.com>
Subject: MT7621 ethernet does not get probed on net-next branch after 5.15
 merge
To: netdev <netdev@vger.kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>,
 Siddhant Gupta <siddhantgupta416@gmail.com>,
 Ilya Lipnitskiy <ilya.lipnitskiy@gmail.com>, 
 Sergio Paracuellos <sergio.paracuellos@gmail.com>, 
 "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>,
 Felix Fietkau <nbd@nbd.name>, 
 John Crispin <john@phrozen.org>, Sean Wang <sean.wang@mediatek.com>, 
 Mark Lee <Mark-MC.Lee@mediatek.com>, Russell King <linux@armlinux.org.uk>, 
 Jakub Kicinski <kuba@kernel.org>, David Miller <davem@davemloft.net>, 
 =?UTF-8?Q?Ren=C3=A9_van_Dorst?= <opensource@vdorst.com>
Cc: openwrt-devel@lists.openwrt.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211015_072333_038281_26946DA4 
X-CRM114-Status: UNSURE (   6.56  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Hi,

After the merge of 5.15.y into net-next, MT7621 ethernet
(mtk_eth_soc.c) does not get probed at all.

Kernel log before 5.15 merge:
...
libphy: Fixed MDIO Bus: probed
libphy: mdio: probed
mt7530 mdio-bus:1f: MT7530 adapts as multi-chip module
mtk_soc_eth 1e100000.ethernet eth0: mediatek frame engine at 0xbe100000, irq 20
mt7621-pci 1e140000.pcie: host bridge /pcie@1e140000 ranges:
...

Kernel log after 5.15 merge:
...
libphy: Fixed MDIO Bus: probed
mt7621-pci 1e140000.pcie: host bridge /pcie@1e140000 ranges:
...


I tried adding debug prints into the .mtk_probe function, but it did
not execute.
There are no dts changes for MT7621 between 5.14 and 5.15, so I
believe it should be something else.

Any ideas?

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
