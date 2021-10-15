Return-Path: <SRS0=QAkp=PD=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 15B5BC4332F
	for <linux-mediatek@archiver.kernel.org>; Fri, 15 Oct 2021 15:00:43 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D8096611C3
	for <linux-mediatek@archiver.kernel.org>; Fri, 15 Oct 2021 15:00:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org D8096611C3
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=bCbq72uLl48nEH+hL/yzoOapVpMrFG2J79b56mona3A=; b=0cBumF2uTRs9Az
	pdToITxll0Uqunp+62hM2vJlyepOp4W+hCrCX2xHcqLV3ctGePHvOrsgNrNQhDvzxNiD8nmtdICGi
	Kvm6nnAOuMo7wCnRDVxqpbQbGKnSJdA0SQxoMDMYm+D/znw3maZPVJ/lKyYyqsuym6bPsU+s4De1S
	AHpZDpDISqliorU0klvfKlYrm8azubDvOXc+YKrfDnGj8dMIopbzmiPKPg3TLstKDF/247g+JlZVG
	wAu4lMJGNTTK8Em/QXP0GWt+HoGBBDPhBqr2pKBuLKkj0VEbAXcA9ofQMflSJWfuT+wRlG5JC/xl2
	1yO9kHgNXghzyVD1vNog==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mbOhD-007mKl-QZ; Fri, 15 Oct 2021 15:00:31 +0000
Received: from mail-ua1-x930.google.com ([2607:f8b0:4864:20::930])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mbORr-007gmG-2C
 for linux-mediatek@lists.infradead.org; Fri, 15 Oct 2021 14:44:40 +0000
Received: by mail-ua1-x930.google.com with SMTP id f4so18495834uad.4
 for <linux-mediatek@lists.infradead.org>; Fri, 15 Oct 2021 07:44:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=6NXO5j/QvPweGncoBAgiXUgJMHU7982ggUW1I99+ELI=;
 b=qQDqhHXvOOt2EigmIUXiWCQKCuVRCjrBtPuU7e6JSBKdRAIr9FunCz0YnNxNZIMeA7
 aMLe6kS7dqzw1URKahIvNJhM9AuQbeemsIQUSKAiYehsmFtISL3AkdrwAoNS6zIkob/9
 /KtDkv9XsyMmnftzcffE0mXjzBQe+ld4pQYYOOZVVvjF2ZZo8Y5Phz/EoW+3DSF8Lc1Z
 JF2KAgPbCApxB3orWhy+gLzKD5rHVWPDu94uqNUBXAE5iIe9QzBVAkZmVHNdfcUo5hFz
 fpRNNdZgJiSwSuMUwRXdtLMzcZ+zwMygcGsY6DB8uWwxVjt5NwC+kvdtIHvLEYDRDfRS
 wB5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=6NXO5j/QvPweGncoBAgiXUgJMHU7982ggUW1I99+ELI=;
 b=OZGwOjO/wq7fkLl5eVmbmnv8Dq7b4c3d3D3SIyjxQo9I9MJFE/CazeJ+dRworstyG/
 WqVyysLZksaKqUtMXutMDaFuok80T6Hv/s0CLXPFecq+0PbUvRN5j8AUmvlkyaY15fIf
 vemSemnSjrq1FhXOB6REdWqxq5BcDGKnE5mzoVjoF22l82sMttxBc6Gd13I/pgMvsEOf
 DNnCUYBVHCo2ai5Bo8AJtFfrBtGlHrTs+FDZvCqnDPw57S7zbInEmCzq19kddrgQB6k4
 2T3CcLX1EsyKixnFU0aPJidoX4evr1R8TBASyDINJpveNN1Cn4uGIjw5apINDwratDMW
 EUTA==
X-Gm-Message-State: AOAM5331JNNALJy02JwlTalOrvewwALDPJyQ0XpbswfEXgpR0jLJtp/A
 AsN8TsFGICKxpbrxjjG2uSqo9KTvZDDzTvsr574=
X-Google-Smtp-Source: ABdhPJwTx5WOz/B4JFQIN2LXVYOE6NknltOp91EUdzVCPhuF8CBbkZUp65CtShUv6SVmutruddi0ECLxgD3e4Aj+Ssk=
X-Received: by 2002:a67:d78c:: with SMTP id q12mr14260184vsj.28.1634309077262; 
 Fri, 15 Oct 2021 07:44:37 -0700 (PDT)
MIME-Version: 1.0
References: <CALW65jbKsDGTXghqQFQe2CxYbWPakkaeFrr+3vAA4gAPjeeL2w@mail.gmail.com>
In-Reply-To: <CALW65jbKsDGTXghqQFQe2CxYbWPakkaeFrr+3vAA4gAPjeeL2w@mail.gmail.com>
From: Sergio Paracuellos <sergio.paracuellos@gmail.com>
Date: Fri, 15 Oct 2021 16:44:26 +0200
Message-ID: <CAMhs-H8-hfR4m4ArUvPO9wCZoE=shV9vbv89yT43mmhMp-LTcA@mail.gmail.com>
Subject: Re: MT7621 ethernet does not get probed on net-next branch after 5.15
 merge
To: DENG Qingfang <dqfext@gmail.com>
Cc: netdev <netdev@vger.kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>,
 Siddhant Gupta <siddhantgupta416@gmail.com>,
 Ilya Lipnitskiy <ilya.lipnitskiy@gmail.com>, 
 "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>,
 Felix Fietkau <nbd@nbd.name>, 
 John Crispin <john@phrozen.org>, Sean Wang <sean.wang@mediatek.com>, 
 Mark Lee <Mark-MC.Lee@mediatek.com>, Russell King <linux@armlinux.org.uk>, 
 Jakub Kicinski <kuba@kernel.org>, David Miller <davem@davemloft.net>, 
 =?UTF-8?Q?Ren=C3=A9_van_Dorst?= <opensource@vdorst.com>, 
 OpenWrt Development List <openwrt-devel@lists.openwrt.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211015_074439_164283_84976B74 
X-CRM114-Status: GOOD (  14.81  )
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

Hi Qingfang,

On Fri, Oct 15, 2021 at 4:23 PM DENG Qingfang <dqfext@gmail.com> wrote:
>
> Hi,
>
> After the merge of 5.15.y into net-next, MT7621 ethernet
> (mtk_eth_soc.c) does not get probed at all.
>
> Kernel log before 5.15 merge:
> ...
> libphy: Fixed MDIO Bus: probed
> libphy: mdio: probed
> mt7530 mdio-bus:1f: MT7530 adapts as multi-chip module
> mtk_soc_eth 1e100000.ethernet eth0: mediatek frame engine at 0xbe100000, irq 20
> mt7621-pci 1e140000.pcie: host bridge /pcie@1e140000 ranges:
> ...
>
> Kernel log after 5.15 merge:
> ...
> libphy: Fixed MDIO Bus: probed
> mt7621-pci 1e140000.pcie: host bridge /pcie@1e140000 ranges:
> ...
>
>
> I tried adding debug prints into the .mtk_probe function, but it did
> not execute.
> There are no dts changes for MT7621 between 5.14 and 5.15, so I
> believe it should be something else.
>
> Any ideas?

Maybe you have a chance to try git bisect to see what is the commit
that introduces that regression and report here?

Best regards,
    Sergio Paracuellos

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
