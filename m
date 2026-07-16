Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8F83AC44514
	for <linux-mediatek@archiver.kernel.org>; Thu, 16 Jul 2026 21:07:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=wRv4lOlKrq3dAOzPxj081DoRmnFjvX+pfhBpXeiahJI=; b=2+eXSGzw6G7O0LVHrv+OWj1Sjx
	0FQAVwUy40Zoz6YjRiPEdCp3fQgW/dVbfIzSnY6QvsHZON85qc+RAjNqYYcm2FNuxH9TAtzuNNBdA
	RWPNmjtPuxGh8f1Dd7IdpgE5Pn2YmCG9atCa43JvZOo4fUxaVd1t8DLvWQSSIPs9SwE7gPDp89BgF
	L1Ayr0qmuJ6BCml8KL/DnutGVeGP9FWpuAG6EYiVBwJMlbeZeS75Z3n1grycWW4QPL646N4YPW5pv
	0miq8vP5hjLf7nsrhzd/jQFyM6XZAGcTYd2IpzOy+W3BoH5qKspYt1211YiXh0WgO70Wd22FkAcCj
	bNcfsVGA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wkTIQ-00000000Zxn-1jeh;
	Thu, 16 Jul 2026 21:07:06 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wkTIP-00000000ZxH-0ihL;
	Thu, 16 Jul 2026 21:07:05 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id E710E411FD;
	Thu, 16 Jul 2026 21:07:04 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CD7171F000E9;
	Thu, 16 Jul 2026 21:07:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784236024;
	bh=wRv4lOlKrq3dAOzPxj081DoRmnFjvX+pfhBpXeiahJI=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date;
	b=D2vMWjornlyVXuKs4ZElabuNI7w1Q3eVyg5StJmER9vXugRvhmkx9JO18TXH+ZEuF
	 Rs1kYbqnqUazDhraR1RRZzVA1hQ/nl9zkOwV5baDCNG91SK0kRqcVaqdcikpGAZ/45
	 OiR05TZv9aVfYwMI7xw9HzGTAxxJXIEIs+TTpI3B6c3yCbV+WeRlMvtpm8mPIUV5A8
	 8z+NEwAjHbDZVIYJbqbWUidGgMR0LVQnBaqpEDPT3zlAi5QdVr5qNl0VISAqP9bYDc
	 teQ4Z1KkDIeTwDcEJ5pJVjF2/TaTQpvOh0qCHcggSJi5UfPlJb6q7E8zyw+LDVBcnY
	 H/8wbiIimcRFw==
From: Srinivas Kandagatla <srini@kernel.org>
To: Sen Chu <sen.chu@mediatek.com>, Sean Wang <sean.wang@mediatek.com>, 
 Macpaul Lin <macpaul.lin@mediatek.com>, Lee Jones <lee@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Roman Vivchar <rva333@protonmail.com>
Cc: Andy Shevchenko <andy@kernel.org>, linux-pm@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
 Ben Grisdale <bengris32@protonmail.ch>, 
 Conor Dooley <conor.dooley@microchip.com>
In-Reply-To: <20260713-mt6323-nvmem-v3-0-205c39267a24@protonmail.com>
References: <20260713-mt6323-nvmem-v3-0-205c39267a24@protonmail.com>
Subject: Re: (subset) [PATCH v3 0/3] nvmem: add support for the MediaTek
 mt6323 PMIC
Message-Id: <178423602161.378875.7272283878375160682.b4-ty@kernel.org>
Date: Thu, 16 Jul 2026 22:07:01 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.3
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


On Mon, 13 Jul 2026 13:11:34 +0300, Roman Vivchar wrote:
> This series adds support for the EFUSE found on the MediaTek mt6323 PMIC.
> 
> The previous version of the series for all AUXADC, EFUSE and thermal
> drivers was split after Krzysztof's comment [1].
> 
> Tested on the MediaTek mt6572 and mt8163 SoCs (Ben), both paired with a
> mt6323.
> 
> [...]

Applied, thanks!

[1/3] dt-bindings: mfd: mediatek: mt6397: add mt6323 PMIC EFUSE
      commit: 8852dfee93d3f8a54399060052e68792ba35f1b1
[2/3] nvmem: add mt6323 PMIC EFUSE driver
      commit: b3c090960d86901bd4e41447744fd532d6e1d7f9

Best regards,
-- 
Srinivas Kandagatla <srini@kernel.org>


