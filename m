Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 36DF8FF885D
	for <linux-mediatek@archiver.kernel.org>; Tue, 28 Apr 2026 07:32:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=4cQixoYLwFWEll7U5txljbDfGyqh2O+tBxKWryc9TYw=; b=h9NxTiEUQHjGjNzyjvvMUgjay/
	B0dgHj+HFLBPfpLmQZzQQwDFTLd90SQRABm1QWVMDDtBMb5mzzhviuYXVS+SI0WU/JIo99B+qr/32
	Dhg09LFS0O6dD4DGlqXia6jqcWIkubFnKqqFhjsqGTGOoMjXvgrCMy00BVuPNleg8xXXWqjpXCBd0
	NZM5uRwE32v19dQ8bhhOVByOtslYdfFzDr0ttO315+/ec5EGSUjMd5pWMsSlaxizM8Hq26bmam/ep
	4Nno1f0OSE/dkuH862rOr1KAiAwPxw4Jiv8Z3FRuWLuudiWAo4W7FhemtF6LYpDb3gP66irIqwvDr
	RR+MGfKA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wHcvZ-00000000mTK-1uO2;
	Tue, 28 Apr 2026 07:32:17 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wHcvW-00000000mSt-0Wl3;
	Tue, 28 Apr 2026 07:32:15 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 1219C444DE;
	Tue, 28 Apr 2026 07:32:13 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 52B1EC2BCAF;
	Tue, 28 Apr 2026 07:32:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1777361532;
	bh=ta679nTBF0qF6aMOX98uSDCs95HnVt93Xv2e2aIkGPk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=EUpsCyI2+DA1zj1aLq3/uH2I9xi8Ml7HOIKsjSytN7397tXIUNBiyt778dgIoqTwR
	 DPLc/tMCEbXtYki8jr7nr7MSaOGRw00kwdlQjzS6bPVuLpt87oe0REVKfcsNh7PxXN
	 XNgrarQdDFssxlrb4X4pcsuqW5Ma9PRYx7bD146iqB0DBoKkQ/jv9e+LIpy3uQ64nJ
	 5ivECba5BwftL0494sEsG9yTN2yGNazpyFAs61cAkUbWxfMUalk0FJyHZAzN1IhUWv
	 lTZD2PRq02vEl59ssnaFY5eGSmt1VJ686RjDJFxUYMbmxIVcf+5FGNV+wYri/RgGyv
	 f7UVKfGdxYbWQ==
Date: Tue, 28 Apr 2026 09:32:10 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Rosen Penev <rosenp@gmail.com>
Cc: devicetree@vger.kernel.org, Felix Fietkau <nbd@nbd.name>, 
	Lorenzo Bianconi <lorenzo@kernel.org>, Ryder Lee <ryder.lee@mediatek.com>, 
	Shayne Chen <shayne.chen@mediatek.com>, Sean Wang <sean.wang@mediatek.com>, 
	Johannes Berg <johannes@sipsolutions.net>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, Thomas Bogendoerfer <tsbogend@alpha.franken.de>, 
	"open list:MEDIATEK MT76 WIRELESS LAN DRIVER" <linux-wireless@vger.kernel.org>, 
	"open list:ARM/Mediatek SoC support" <linux-kernel@vger.kernel.org>, 
	"moderated list:ARM/Mediatek SoC support" <linux-arm-kernel@lists.infradead.org>, 
	"moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>, "open list:MIPS" <linux-mips@vger.kernel.org>
Subject: Re: [PATCH 3/3] wifi: mt76: remove mt76_get_of_data_from_mtd
Message-ID: <20260428-prophetic-rat-of-ampleness-a20a4b@quoll>
References: <20260427034427.881389-1-rosenp@gmail.com>
 <20260427034427.881389-4-rosenp@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260427034427.881389-4-rosenp@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260428_003214_185054_5E8F72B4 
X-CRM114-Status: UNSURE (   8.60  )
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

On Sun, Apr 26, 2026 at 08:44:27PM -0700, Rosen Penev wrote:
> mt76_get_of_data_from_mtd has been replaced by
> mt76_get_of_data_from_nvmem in all usages.
> 
> Remove it to prevent people from using the deprecated
> mediatek,mtd-eeprom binding.

Where did you deprecate it? I cannot find it.

Anyway, as Conor pointed out, this is ABI break and really poorly
explained. Cleanup is not a reason to break ABI.

Best regards,
Krzysztof


