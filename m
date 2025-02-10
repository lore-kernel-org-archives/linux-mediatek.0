Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 580D9C02198
	for <linux-mediatek@archiver.kernel.org>; Mon, 10 Feb 2025 16:38:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=jnVsidunPUcCCl52pkEC/lxQHRWliC3TnCX/H3pJsM0=; b=axwJlERF3JzkX5wzcoaEIGTRc5
	22mOEnlAAnt5ifbk1UnHeov32Avjs2Rc4VPUp9PNuIhI2Zm64+BlPSgZD6hfR4PhxCthOQhxPw6nL
	4pjeP41nh/7+gn/Ll5y1CRoqhvLom16sb1w57/vx34Hh2cr7gHG0glfmddEmkFiyv5l7+0Rr6uLrN
	8r+dh0XQKOgoq98RXF+bkXwKx9Yvaf3TqhY5Yqete5O5MF8l+V3GigWat6LzJyxIsSDMIhpydSpKu
	B1YJEvIoVId484c1kjVhep1XL6X9t+x55UQxuTuxKyGXWkZgmMNLsPMZsYjoq05l/PjHa+1kDVszi
	X6H9JISw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1thWnp-00000000Y3J-17If;
	Mon, 10 Feb 2025 16:38:33 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1thWmP-00000000Xpr-21w0;
	Mon, 10 Feb 2025 16:37:07 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 486855C5C05;
	Mon, 10 Feb 2025 16:36:25 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1EAD7C4CED1;
	Mon, 10 Feb 2025 16:36:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1739205424;
	bh=pfpzmuq24TwF+06dco5as3bO4qJhodsYwsIa1AqMl8Q=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=epcN3QYSWuIIIk/Db2P8XQu5Ddu1B8GmBhUxdkPEutuOrxxm03ixaHdmL1nN/8OEX
	 y2wTb9kXguPvZ6dfwKkkgcqPW57+ZApqinbEsUSF6OLgUdqXHtV4ZHU8zffXA+HnUn
	 mEUAgM1Nyd1RbIKM4HEHV8+TZiLR4SKVDCjn/vtpXmf7Mfs/Mt1eBdt/bHxZix2Ofp
	 PYEeOa8eB+D8kmLs59wxxJNbwm5OIthMBpdmAMKj1VsfWBib2KBDYoLI5+1wbPvjEh
	 fHE0/nVh975H4xkkPJJDqoyXC6PIH0mMhODGZ/Qs6iEkhhShEmXocsOJNmB9e7rZxn
	 1bD/BqEd4jSig==
From: Lee Jones <lee@kernel.org>
To: Val Packett <val@packett.cool>
Cc: Fabien Parent <parent.f@gmail.com>, 
 Dmitry Torokhov <dmitry.torokhov@gmail.com>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Sen Chu <sen.chu@mediatek.com>, 
 Sean Wang <sean.wang@mediatek.com>, Macpaul Lin <macpaul.lin@mediatek.com>, 
 Lee Jones <lee@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
 Eddie Huang <eddie.huang@mediatek.com>, 
 Alexandre Belloni <alexandre.belloni@bootlin.com>, 
 Javier Carrasco <javier.carrasco.cruz@gmail.com>, 
 Yassine Oudjana <y.oudjana@protonmail.com>, 
 Chen Zhong <chen.zhong@mediatek.com>, linux-input@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-pm@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-mediatek@lists.infradead.org, linux-rtc@vger.kernel.org
In-Reply-To: <20241226050205.30241-5-val@packett.cool>
References: <20241226050205.30241-1-val@packett.cool>
 <20241226050205.30241-5-val@packett.cool>
Subject: Re: (subset) [PATCH 4/9] mfd: mt6397: Add support for MT6392 pmic
Message-Id: <173920541986.1887800.1972669785800121190.b4-ty@kernel.org>
Date: Mon, 10 Feb 2025 16:36:59 +0000
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailer: b4 0.13.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250210_083705_565560_5EEBAAB4 
X-CRM114-Status: UNSURE (   6.86  )
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

On Thu, 26 Dec 2024 01:58:04 -0300, Val Packett wrote:
> Update the MT6397 MFD driver to support the MT6392 PMIC.
> 
> 

Applied, thanks!

[4/9] mfd: mt6397: Add support for MT6392 pmic
      commit: 896b1eb4ca771b37ea50feb4d90a78dd4e9cb388

--
Lee Jones [李琼斯]


