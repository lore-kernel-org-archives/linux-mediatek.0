Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E63F9CA0EEB
	for <linux-mediatek@archiver.kernel.org>; Tue, 19 Aug 2025 18:15:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=i4uRSjNPKqtltcOS+hhSwHyxhxy7BLwGH+op592omNk=; b=GNnclkepJFbXrfhT6/sndDyV9E
	8hvjBV4w0F0tAmHPQWZ2YuZCTbopzxOufB8sqAxUFk+SsLsUjiYYxswXfzroVrm4RSYhLYuf9bGqQ
	d28Og5GEo1NNtP9Wn2ZAHwNBggDCHT1OMw5J+elkm7BJDDp/Q3EMBGuQ7+zyjC7mQ4lJyaCHGu5Ig
	HxtPRt/uK1Z0N1M+1UYsCDbbkk7ZK7p9cKSgSBD8W/td8warW5WTvvJpUBqcRsNUbUlUnwpUeOHDq
	IveBmMjHCwl1WwzhazWVvE0qOvob4DQeB3DXOYdv0XF0WsaMJ8ZHS4GsSEmktJUNrsc5dQNWURBzB
	A2jdUH8g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uoQsB-0000000BFk6-0ydF;
	Tue, 19 Aug 2025 18:15:51 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uoNSY-0000000Alvi-269f;
	Tue, 19 Aug 2025 14:37:11 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id D52DA5C62AF;
	Tue, 19 Aug 2025 14:37:09 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 46B6AC4CEF1;
	Tue, 19 Aug 2025 14:37:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1755614228;
	bh=aZSj54aByG6mSlw6bfuWZN/4ePTQj9IrjVwHH3nYOsA=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=iD/2BRXZ4T/jKUg7tQ997lJ7azM1VrGJNnJ+qXZyVmdUhO3RcBAUSIYat8btn9nw+
	 3jRbfFYtHrsENNrHiRpRORvxNLu/dOv21SkKxhYaZL2YC7JHKJ9H/L2LEpk+F1gPT4
	 1O0cM58h7DG0Fxfc10+pj6d2tYoYwKgCVRkmNE+nmLfeZ5zCjC0xmpe2C24NXR3tJV
	 YuRxmdxQoeHIIgRWNnIw3VcnvtPPHY3PMXmAoZmi5XvdpjqxcUCS6CSmbktfqi42yR
	 qyll/n6gz4q26T0kw/Xrl+5vr9XaC5YKdadQJgWC1VXKnTHgAOwBf01m32nPClZnBv
	 7z7G4ZW8EG7IA==
From: Manivannan Sadhasivam <mani@kernel.org>
To: jianjun.wang@mediatek.com, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: ryder.lee@mediatek.com, bhelgaas@google.com, lpieralisi@kernel.org, 
 kwilczynski@kernel.org, robh@kernel.org, krzk+dt@kernel.org, 
 conor+dt@kernel.org, matthias.bgg@gmail.com, linux-pci@vger.kernel.org, 
 linux-mediatek@lists.infradead.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 kernel@collabora.com, Manivannan Sadhasivam <mani@kernel.org>
In-Reply-To: <20250703120847.121826-1-angelogioacchino.delregno@collabora.com>
References: <20250703120847.121826-1-angelogioacchino.delregno@collabora.com>
Subject: Re: [PATCH v2 0/3] mediatek-gen3: Add support for MT8196/MT6991
Message-Id: <175561422286.13472.6948461219213166201.b4-ty@kernel.org>
Date: Tue, 19 Aug 2025 20:07:02 +0530
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250819_073710_580477_C04555EC 
X-CRM114-Status: UNSURE (   6.92  )
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


On Thu, 03 Jul 2025 14:08:44 +0200, AngeloGioacchino Del Regno wrote:
> Changes in v2:
>  - bindings: Removed useless minItems in reset
>  - bindings: Defined reset-names items
> 
> This series adds (at least partial) support for the MediaTek MT8196
> Chromebook SoC and for the MT6991 Dimensity 9400 Smartphone SoC's
> PCI-Express controller.
> 
> [...]

Applied, thanks!

[1/3] PCI: mediatek-gen3: Implement sys clock ready time setting
      commit: a895dc47ceba63feb711905440585cf2b16e9ce2
[2/3] dt-bindings: PCI: mediatek-gen3: Add support for MT6991/MT8196
      commit: 0106b6c114cf8b77d801d9e280b221f8b4d5595b
[3/3] PCI: mediatek-gen3: Add support for MediaTek MT8196 SoC
      commit: 81fedb39a9f0da301a11c7a3b81d91c3b9024462

Best regards,
-- 
Manivannan Sadhasivam <mani@kernel.org>


