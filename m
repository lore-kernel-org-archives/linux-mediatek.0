Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 19CF9E7717D
	for <linux-mediatek@archiver.kernel.org>; Mon,  9 Dec 2024 23:41:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=uI7KRrsJCwKAEhUPghYG3oAvPQyCprZOP0dck1wkdRE=; b=mFtdPczWWJsEWJt0Fk0Zya3YaU
	WvOL1SBvlaL5op7lLTDgcU+/qr3jeD8dqSZWpCGiU23Dmq3jjjMcwj6t/GdfkIK4GzVtp0pKEGX8s
	kkHFxbiNpNBqymk4of6FtCDwkGTwlPBRynsdbnxlFGkvbUalIljtDiC2i9ErUgXmxd5IJ3bgt2mz6
	tJ6Sz7YcCHbTho9PpOCpnIAv4SRPQdQba3byhRRxI1cr50ywh1+1WBbcAQs0cyPKk/8uFpkBX5lgj
	9qWlDKK6TKL03vNDsx0WqH/0mnY/cz5p/XwqXMPSxIsunJJ7phlRxuy9016WdwhG0jq30BkbsgxSh
	ujZpXpaA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tKnNi-00000009bMQ-1CWI;
	Mon, 09 Dec 2024 23:41:38 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tKnMe-00000009bFB-3o8r;
	Mon, 09 Dec 2024 23:40:34 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id C7E9D5C5DEA;
	Mon,  9 Dec 2024 23:39:49 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 37CABC4CED1;
	Mon,  9 Dec 2024 23:40:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1733787632;
	bh=BA3duGjUYPvGt2f4+K5L5RH1loqbyxLxJMRIpyaILmo=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=Kztj4lA8lDAmSnUT5tJAv2cjEFrlBhTk0sI+1anlxEucU7S3ppmCiiWp5j4UokfY5
	 m2BSlb5gR8sB7vJTcTjbsusvlp3qeZySOwq+xumA8ySDM1kPDzfUE3UC28tuXfdOyu
	 h9nNK1YCihA7AkI/xYMpeyyJxxf7458SLNL4wVNwRdACYpZ7SqOup4EI6ovshHP8ue
	 bUE/M59+4CE35vCbPFYegUUYE71neBMWZK/ac0t4DUOfz6rZf1CEdOYHKAGhr1VfCj
	 6CxapaXrpuDI4Lupv+e3t3V242MpkykZGjpXu5omW31b4jYWhtn/ZVMAlPgZ+UFFBx
	 bp7H1SQcIDumw==
Date: Mon, 9 Dec 2024 15:40:30 -0800
From: Jakub Kicinski <kuba@kernel.org>
To: Christian Marangi <ansuelsmth@gmail.com>
Cc: Lee Jones <lee@kernel.org>, Rob Herring <robh@kernel.org>, Krzysztof
 Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Andrew
 Lunn <andrew+netdev@lunn.ch>, "David S. Miller" <davem@davemloft.net>, Eric
 Dumazet <edumazet@google.com>, Paolo Abeni <pabeni@redhat.com>, Vladimir
 Oltean <olteanv@gmail.com>, Srinivas Kandagatla
 <srinivas.kandagatla@linaro.org>, Heiner Kallweit <hkallweit1@gmail.com>,
 Russell King <linux@armlinux.org.uk>, Matthias Brugger
 <matthias.bgg@gmail.com>, AngeloGioacchino Del Regno
 <angelogioacchino.delregno@collabora.com>,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 netdev@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, upstream@airoha.com
Subject: Re: [net-next PATCH v11 5/9] mfd: an8855: Add support for Airoha
 AN8855 Switch MFD
Message-ID: <20241209154030.0f34d5dd@kernel.org>
In-Reply-To: <67577bd7.7b0a0220.1ce6b5.fe93@mx.google.com>
References: <20241209134459.27110-1-ansuelsmth@gmail.com>
	<20241209134459.27110-6-ansuelsmth@gmail.com>
	<20241209151813.106eda03@kernel.org>
	<67577bd7.7b0a0220.1ce6b5.fe93@mx.google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241209_154032_990424_07EBE390 
X-CRM114-Status: UNSURE (   7.83  )
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

On Tue, 10 Dec 2024 00:22:59 +0100 Christian Marangi wrote:
> Also hope we won't have to request multiple stable tag for this multi
> subsystem patch. Any hint on that?

Sorry I haven't payed much attention to earlier discussions.
Why multiple stable tags? AFAICT all trees will need patches 
4 and 5, so we can put that on a stable tag / branch, the rest 
can go directly into respective trees (assuming the table tag
has been merged in). No?

