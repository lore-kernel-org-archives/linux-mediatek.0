Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 27B40C4706C
	for <linux-mediatek@archiver.kernel.org>; Tue,  9 Jan 2024 23:51:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=FAlv0847+YFZYrcrOGu5VC85uwB2FgeOuL3mlkGOFuo=; b=3DoUR0Idn9j+oWNWiYScGTTRwl
	XrPfOyf3mPiLDRCeLz+RWnLE81LzoYE4NUE35XmssGQpYhj35/3nyVcFfce4Bj4J6NzEgGihyVPn8
	JY1iD074V0fu95OtgveL9jq+u/kPSOAhTYhXBhD5p6f8Ckrf5s7P2aNP2K9szsRWe44KpFkiPBDxU
	364dUvUGwpESDeUHRER0xSD5ic8iq4iGiNIFq2Aaie1hT4jRvWklpfrH1fO/zW2cmN7N+1LSlXR2e
	jFPjjj5iksdlX7WCG0r8PwR1F/eEGdrsjeRlpYajvqzwepvLx2FC4QmQ4qfp/Z+zMtVJa3mzIxmcq
	kFoLKQaA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rNLsw-009tEq-27;
	Tue, 09 Jan 2024 23:51:54 +0000
Received: from ams.source.kernel.org ([2604:1380:4601:e00::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rNLst-009tER-2p
	for linux-mediatek@lists.infradead.org;
	Tue, 09 Jan 2024 23:51:53 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by ams.source.kernel.org (Postfix) with ESMTP id 98BBAB81C52;
	Tue,  9 Jan 2024 23:51:50 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BCF5FC433C7;
	Tue,  9 Jan 2024 23:51:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1704844310;
	bh=NKZJA5qP3omuPD1SaRMmUKrZJGBrATmmJgUSRDrq2so=;
	h=Date:From:To:Cc:Subject:From;
	b=ZFmMbJZBN+whNTq/cG7RU3BeCYpsat/W3E1nBQkVlBQ6UFmtCX8mTd7wVQKY2FfHE
	 kY9mzn38SW5Kh2EKXDotvUSU5PMoyf3ZIvwbKm6cE91+skhADEzJjjdzZ48WsobSgp
	 LBa1vMcfqIOOkeHO5rXslCdB8Fn87f67MLWEEW6nCNskchpxM7GSHQNv9Bfe1dko3Q
	 o5vbOTJSXxcwTdisDOEgN/WaCKI5FFzqFnLTiqtHfkYAX21fFEEQewtrihwiz6zRcZ
	 tv57zAaTzIJ4hR2D6U9NMOMzjoffPIEsSdeFYaOU8uLB7pstC21HasE7yl/MbcF27V
	 QZF7Dqc/ftj0Q==
Date: Tue, 9 Jan 2024 17:51:48 -0600
From: Bjorn Helgaas <helgaas@kernel.org>
To: Sergio Paracuellos <sergio.paracuellos@gmail.com>
Cc: linux-pci@vger.kernel.org, linux-mediatek@lists.infradead.org
Subject: mt7621 static check warning
Message-ID: <20240109235148.GA2082000@bhelgaas>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240109_155152_055177_123C560B 
X-CRM114-Status: UNSURE (   5.90  )
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

Hi Sergio,

FYI:

  $ make W=1 drivers/pci/
    CC      drivers/pci/controller/pcie-mt7621.o
  drivers/pci/controller/pcie-mt7621.c: In function ‘mt7621_pcie_probe’:
  drivers/pci/controller/pcie-mt7621.c:228:49: error: ‘snprintf’ output may be truncated before the last format character [-Werror=format-truncation=]
    228 |         snprintf(name, sizeof(name), "pcie-phy%d", slot);
	|                                                 ^
  drivers/pci/controller/pcie-mt7621.c:228:9: note: ‘snprintf’ output between 10 and 11 bytes into a destination of size 10
    228 |         snprintf(name, sizeof(name), "pcie-phy%d", slot);
	|         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

I know we'll never actually hit this, but it'd be nice to clean this
up, and I don't think it would really cost us anything.  I think it's
currently the only "W=1" warning in drivers/pci/.

Bjorn

