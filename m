Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5E97BC25B74
	for <linux-mediatek@archiver.kernel.org>; Fri, 24 May 2024 17:20:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=nLHTgtbT8puPWoNapYpLARnpHQaGv88/tvf3aUFDQxA=; b=EsZhEWhekjrepKSG45ZQ4GQneo
	Lb0ajzctL3LlQMQvTn5Acy+ZfDOWQZn30LYOJ8TJFvE15g3HqFXnRBV9vvvheLeaSsBx/nHMUFpbh
	eIPWZYkD3K1odBcBpxm1q+7z0nZMx9OXyI4WbgauDcZHjv3X571DOem6jqO5MCLYqc6fnoMGjeOCf
	VjD/2RVSLQGLGRBrxnA0pBFhg9e2BFlXn95vqLu1lEt5IMlQqAwHkou+6kYZi/pXvUbCk+yGHmkLB
	k0hDpPnyOeH50FTYe4P2Dh4PsyVQXcBFwxh9J70RpHYx1ayTlnRvMyyg2wsukOoJa0ztk7HymCdqa
	AFP9930Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sAYaO-00000009Tai-3NX9;
	Fri, 24 May 2024 17:20:08 +0000
Received: from pandora.armlinux.org.uk ([2001:4d48:ad52:32c8:5054:ff:fe00:142])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sAYaM-00000009TZk-00fK;
	Fri, 24 May 2024 17:20:07 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=armlinux.org.uk; s=pandora-2019; h=Sender:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
	List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=nLHTgtbT8puPWoNapYpLARnpHQaGv88/tvf3aUFDQxA=; b=bynRRlQzkKmtw0bttGssCy2U+l
	Bm0L74mjmqheDpnsoLrgz0DOazu57WjH47PWddaZikXF3hpqosQlGugW/FKvQzdCha830yxrHl8dM
	r17yy8BLuLosi0Pn1ImHxDov0ob0ImIPnZavF+i39fhVd2bN3VlmU1zRSihLxXA0x9Az0XYD6c4Sf
	UW1as9sIpw3RVcW+rgt5g+hn4/PBbVy66ppU9SQbXVoQSYjFE1IgU1cnjOdABRSjGw4NXXJAZg1XB
	xr8nlrTcRBch2N+AkifTYImuSwxvMbXV+xrOYGa8Rn8cm5uqWkwFcpZI39oqWjurLxdiwhwIdC40F
	K+aiNCeA==;
Received: from shell.armlinux.org.uk ([fd8f:7570:feb6:1:5054:ff:fe00:4ec]:37100)
	by pandora.armlinux.org.uk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <linux@armlinux.org.uk>)
	id 1sAYa6-0005le-0A;
	Fri, 24 May 2024 18:19:50 +0100
Received: from linux by shell.armlinux.org.uk with local (Exim 4.94.2)
	(envelope-from <linux@shell.armlinux.org.uk>)
	id 1sAYa6-00087r-GA; Fri, 24 May 2024 18:19:50 +0100
Date: Fri, 24 May 2024 18:19:50 +0100
From: "Russell King (Oracle)" <linux@armlinux.org.uk>
To: Nicolas Pitre <npitre@baylibre.com>
Cc: Julien Panis <jpanis@baylibre.com>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Daniel Lezcano <daniel.lezcano@linaro.org>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Zhang Rui <rui.zhang@intel.com>, Lukasz Luba <lukasz.luba@arm.com>,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org, linux-pm@vger.kernel.org
Subject: Re: [PATCH v5 0/6] Mediatek thermal sensor driver support for MT8186
 and MT8188
Message-ID: <ZlDMNkdE2jmFgD8B@shell.armlinux.org.uk>
References: <20240524-mtk-thermal-mt818x-dtsi-v5-0-56f8579820e7@baylibre.com>
 <238nnn48-0o7r-22q2-2rpo-s3n7n62pn2q4@onlyvoer.pbz>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <238nnn48-0o7r-22q2-2rpo-s3n7n62pn2q4@onlyvoer.pbz>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240524_102006_068429_68872093 
X-CRM114-Status: GOOD (  13.91  )
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

On Fri, May 24, 2024 at 01:04:38PM -0400, Nicolas Pitre wrote:
> On Fri, 24 May 2024, Julien Panis wrote:
> 
> > [RFC] When PATCH 1/6 and 2/6 are squashed, checkpatch raises this WARNING:
> > "DT binding docs and includes should be a separate patch." That's why I
> > split them in this v5. The problem is that the driver can't be compiled
> > any more at PATCH 1/6. It needs PATCH 2/6 to be compiled. Should the
> > checkpatch warning be ignored here ? Should I finally squash PATCH 1/6
> > and PATCH 2/6 ?
> 
> IMHO it might be preferable to preserve successful compilation across 
> bisection than to appeal to checkpatch in this case.

Or, patch 1 adds the new definitions, subsequent patches convert the
users, and the last patch removes the old, now unused, definitions.

-- 
RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
FTTP is here! 80Mbps down 10Mbps up. Decent connectivity at last!

