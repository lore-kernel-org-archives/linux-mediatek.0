Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AE36AC27C40
	for <linux-mediatek@archiver.kernel.org>; Wed, 22 Nov 2023 21:15:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=iZUIj80ten5WbMUx5i6IlNdeACrCCijzXzvQj60owfU=; b=QrM/Yg6Xn2N/h7VoncsG6uXma1
	Z+hmCNfOPviCFs1z7lUhjNGld8QEeACJIhSePsEf9X5LQwni1qVvaUtLOkQyeBSqTLa60QChptDz5
	q/fJOVdN2xaVeSxrciG0GjrVEyEyU3SBiApofge+U3vxOUn1lh6xduuhDj1byxTe9D+g8CSQ3PH1j
	7SBkAfhtcaD+9/Er4MEyARLQcESsbnliSnnsqMyePB7DcCtuDvDhG2kRyTCYyWLKHWvLmNipmmMKM
	M2oIBEuPRfhpBFIKTVt/9V6y1xSuwzlAFE/DMGllktQ1WGI7lD++GwtFLYiu+RAm1O5g0n5++PWah
	EuZqDiDA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r5uZ0-0035SS-2L;
	Wed, 22 Nov 2023 21:15:14 +0000
Received: from ams.source.kernel.org ([145.40.68.75])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1r5uYx-0035RE-1O;
	Wed, 22 Nov 2023 21:15:12 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by ams.source.kernel.org (Postfix) with ESMTP id 1756AB825F1;
	Wed, 22 Nov 2023 21:15:09 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 748A8C433C7;
	Wed, 22 Nov 2023 21:15:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1700687708;
	bh=tX29cwq4HW2ZTQzwFFB4rNa+GB41wrnSmjmIQn6Gg9c=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=E959KgU9SkJXN31p4CoiSoFMbt1/4mixRnb3ii4nBu8A1WjJfgKADIlw/4ob1B2OO
	 C2YiEz9grSlGSdayOaPCOmxT2duYcfB+4pdNVCGKJW3PEmzFt9LF/OPpmBoLkZEIyZ
	 DdSOuor0RqsN0PXu688gw3z8uc0RMaTG/hvbfr4h+jscQUVSNipFZ3C9MZlcpXlh1L
	 utkd7IFab0TsuoYQRgymLQiq4fx4G5OuLAUah8wAUR7PpwxAv0CvvCDPngDFwfS8DL
	 gKgUKN0gBkIcOfj2b+AuL6cYIdEKKmfUyQjOPIcdXSa8vT1rR8KS4H+4Z3zAzFGBxy
	 9PWmU8fF6JOpw==
Date: Wed, 22 Nov 2023 21:14:59 +0000
From: Simon Horman <horms@kernel.org>
To: Christian Marangi <ansuelsmth@gmail.com>
Cc: "David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>, Andy Gross <agross@kernel.org>,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konrad.dybcio@linaro.org>,
	Andrew Lunn <andrew@lunn.ch>,
	Heiner Kallweit <hkallweit1@gmail.com>,
	Russell King <linux@armlinux.org.uk>,
	Florian Fainelli <florian.fainelli@broadcom.com>,
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
	Daniel Golle <daniel@makrotopia.org>,
	Qingfang Deng <dqfext@gmail.com>,
	SkyLake Huang <SkyLake.Huang@mediatek.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	David Epping <david.epping@missinglinkelectronics.com>,
	Vladimir Oltean <olteanv@gmail.com>,
	"Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>,
	Harini Katakam <harini.katakam@amd.com>,
	Robert Marko <robert.marko@sartura.hr>, netdev@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-msm@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Subject: Re: [net-next RFC PATCH 04/14] net: phy: add initial support for PHY
 package in DT
Message-ID: <20231122211459.GA46439@kernel.org>
References: <20231120135041.15259-1-ansuelsmth@gmail.com>
 <20231120135041.15259-5-ansuelsmth@gmail.com>
 <20231122105243.GB28959@kernel.org>
 <655e452d.5d0a0220.61c31.01ae@mx.google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <655e452d.5d0a0220.61c31.01ae@mx.google.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231122_131511_636569_2AD7B06A 
X-CRM114-Status: GOOD (  18.65  )
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

On Wed, Nov 22, 2023 at 07:15:06PM +0100, Christian Marangi wrote:

...

> > Hi Christian,
> > 
> > I was a little hasty in hitting send on my previous message.
> > Please find some more minor feedback from my side below.
> >
> 
> Thanks a lot for the initial review and sorry for the various warning
> you had to write about it. I know this was a new concept and that I had
> to discuss a lot about the DT structure so I was a bit relaxed in
> releasing OF node. Will handle all of them in v2. Again thanks! 

No problem. I'm never sure if this kind of feedback is appropriate for and
RFC or not. And perhaps in this case it would have been better to wait for
at least one more revision. So sorry for the noise at this stage of the
patch-set's development.

...

