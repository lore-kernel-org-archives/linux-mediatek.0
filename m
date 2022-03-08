Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ABE89C433F5
	for <linux-mediatek@archiver.kernel.org>; Tue,  8 Mar 2022 16:52:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=vF+QPifSi5jRRpimT/NNpAl6fmP9aTZPpj5W6zpqc/w=; b=RNxKKc7LVvGGNR
	7grmtE8X0szNdXS5memXq6+wd1UwdT/BHCqQt3BcMBlZkCFTYr/8PfhmN8ylmeIWthsjGhfqBwbRD
	PHDpQ/HR73Qrlu19ssWNDngmN6zHQnfiFzI0OjZeHpMe09/kNGSS8Y5ms04KHkgacXcPPYDKBM43R
	JvVCdgtHb/UNOT5KvdiY5l2bc5JXgEKR+d0nxcXqx+1eVyNlhknQF2Pr3WxSqoRwxXCHjQefX0mbu
	0rLSqsPmKGAIKiPTwZVJ/Dd9gcEEEUBOAuh+jdGmvUxU41ckuhPbFv21p9ijx8fXI3XyCla+6qOSI
	xR0q1FXwm90Lyxl9UGzQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nRd4L-005Kr7-IP; Tue, 08 Mar 2022 16:52:17 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nRcxh-005IfO-0P; Tue, 08 Mar 2022 16:45:26 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 5CED76175F;
 Tue,  8 Mar 2022 16:45:24 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 48674C340F4;
 Tue,  8 Mar 2022 16:45:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1646757923;
 bh=GYIufgGGLr9GxrrY4rIU9KUo4E+VCK3yFeTecR6ehQ4=;
 h=From:List-Id:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=sLMGfu3du1eA0pEoO32ZidYhCnRUjTuBXbYA1+1igjKi0Td7z4XaE1ef8TMuUKM4M
 5ekJScG2sCUfs34bsEQc9RQsnCrnOH6+YMqjh9IGlz64pi1P4LpbMFW6lXFLFqeT9u
 enrHOUbg/gNwUNsvqgGf8UB2HSDd1TxjBxI2FenAF4rNUUhSeruEPx7zt+OY8R9NGT
 lzMbaKYYgUIgKKHqynTBDjcdNUogISNiN/8/OeJ/7Az5aIe6b4L4Pjbn3HTQdXmtSp
 KBhzsS3Yz5z83m10rTnMWazdy/fVp2W1aI3Adsiv6ft8MyHZba9i2WUPtmBCHJ/sZi
 iUvzSy0aUNqOQ==
From: Arnd Bergmann <arnd@kernel.org>
To: Matthias Brugger <matthias.bgg@gmail.com>, SoC Team <soc@kernel.org>,
 arm-soc <arm@kernel.org>
Cc: Arnd Bergmann <arnd@arndb.de>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, 
 Maoguang Meng <maoguang.meng@mediatek.com>,
 "allen-kh.cheng" <allen-kh.cheng@mediatek.com>,
 "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>,
 Chun-Jie Chen <chun-jie.chen@mediatek.com>,
 Sam Shih <sam.shih@mediatek.com>,
 Mattijs Korpershoek <mkorpershoek@baylibre.com>
Subject: Re: [GIT PULL] arm64: dts: mediatek updates for v5.18
Date: Tue,  8 Mar 2022 17:44:41 +0100
Message-Id: <164675781051.4163171.14022771995881024304.b4-ty@arndb.de>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <c2064dcc-acdc-c86b-5ef7-cb8e7ae3122f@gmail.com>
References: <c2064dcc-acdc-c86b-5ef7-cb8e7ae3122f@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220308_084525_181167_29D73080 
X-CRM114-Status: GOOD (  12.18  )
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

From: Arnd Bergmann <arnd@arndb.de>

On Tue, 1 Mar 2022 10:43:41 +0100, Matthias Brugger wrote:
> Please have a look into the below updates for v5.18
> Little by little the mt8192 is getting into shape, now that the devices have the
> corresponding clock drivers. We also gained watchdog and power domain controller.
> Also mt8183 has now support for the keyboard connected to the PMIC as well as
> the JPGEG enconder.
> On the router side, unfortunately the mt7986 is moving a bit slow. Hopefully in
> the next cycle we can get more drivers supported for this new chip.
> 
> [...]

Merged into arm/dt, thanks!

merge commit: c723b6b7b7a1331709b44f16655ad702e10b025a

       Arnd

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
