Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D28BCC43334
	for <linux-mediatek@archiver.kernel.org>; Thu, 14 Jul 2022 15:46:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Tytfso3hu3yJGVSWdSJAQFVHZahl3xkkOHtgmw2OssY=; b=seMVj8IzLN8JoyFhH94eAmTHxk
	+402aVMafL2PXrv4lDYe5uoNccKnGGpnnQnPWcaA1+5TR7Fxqs7mMZ338809KhxpudEo2PkMuofu1
	Bq/2Eg5kmpJeYQ4LLFbprJ33UAZkfsqzPc6EmYXOk4+dOs8of2oWM0e8Aht/RIZ3Wlo4cvVX5NnqP
	H3/gCs/JoP/2dq5G1zxlHhbNXNmktSg1m7IV4Dfl5mgvud4HwQx2UJXzLw2oUl5Hrqr+3dXdRBXun
	WIEepgwMPNEkYkBPrg/i3ZpFy9COFaepprjOFPWRv75t9l5MX+74/9kpWFXDSEOuFSzuVqAk5TDmr
	3ABVjS3A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oC12S-00FscD-8Q; Thu, 14 Jul 2022 15:46:04 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oC0tM-00FmQb-2q; Thu, 14 Jul 2022 15:36:41 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id A5D2C61F33;
	Thu, 14 Jul 2022 15:36:39 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 41FFDC3411C;
	Thu, 14 Jul 2022 15:36:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1657812999;
	bh=0P8p+5zydmB7wmVW3Z4svWKwXJ/ZHm7yB/YrlzdcDAg=;
	h=From:List-Id:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=irDazLx1izP+8sOe2XnvCFfjuQC5+3L6PJhRqRTQorgvUkTl0vQTVh0z8rkZxmZXg
	 MPb1FWcVSd+2ENqWbJxSn7bFghy5jCIFgE56eO1/DFIoxKwN0JzaGFZAgUgLVQ7y4y
	 OvwzBFHSp8NUI8kMwOI6PmSZrd/kyqz+6kAHs2X1fBvcQJWfpUgCqBADOfN7Z/pWBb
	 WNw4eu1xpYDN1iRo1SUyIDafWFlrQvgbBxtB+fqSChRhgCoUwPxUyYdrJ42sN0wiJF
	 5d1Dlux64LVdEBO7JjS18OmokQlbynjS/U7zaVQhlLpDWq+yJ/wDITJC1tyU7WNFsO
	 6/V9omxyYLNqw==
From: Arnd Bergmann <arnd@kernel.org>
To: SoC Team <soc@kernel.org>,
	arm-soc <arm@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>
Cc: Arnd Bergmann <arnd@arndb.de>,
	"linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
	"moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Felix Fietkau <nbd@nbd.name>
Subject: Re: [GIT PULL] ARM: dts: MediaTek DT changes for v5.20
Date: Thu, 14 Jul 2022 17:36:14 +0200
Message-Id: <165781284929.3193627.15632310146386359167.b4-ty@arndb.de>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <63536da6-fbe4-2d96-ab91-ae756cd580c4@gmail.com>
References: <63536da6-fbe4-2d96-ab91-ae756cd580c4@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220714_083640_197934_0728E708 
X-CRM114-Status: GOOD (  10.20  )
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

From: Arnd Bergmann <arnd@arndb.de>

On Fri, 8 Jul 2022 19:36:06 +0200, Matthias Brugger wrote:
> Please have a look at the following changes to MediaTek based HW in the 32-bit
> Arm space. The most notable change is that we now have support for clock and
> PCIe on the Airoha EN7523, which were the last two bits that were missing.
> 
> Regards,
> Matthias

Merged into arm/dt, thanks!

merge commit: 1a110d77a9b9f8ae023634845dd8fd9c1c2efe21

       Arnd

