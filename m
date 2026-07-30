Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3A10FC55160
	for <linux-mediatek@archiver.kernel.org>; Thu, 30 Jul 2026 01:44:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=hLDg/lOQfnHHDcmf98A5srZhKLIOaOoJ/RLfiAyjiFo=; b=hfKk+o1zqF4iswvmJcIk7tK2LL
	HOIO8QpKPF4ckJAF1eumSGToy3H+iE+3W4sey6bPEvhTYyWd2xEIGMoPk3AO7GC8NxxO5BVpROpsD
	m7rCRu2qvti4RwEHaim3Esu4HVft9FJRSsOUnmx17Sm+hIl5hhIKmvxhJVX5D4E41hnXR3kPy39Wh
	MiigXcQ7hUACIY8XIXSLVjXDewTci4NSGJFE8e48xzQQnG7CMrjQSi2ldInCvY5hO3SaMREaxWxWL
	pxsaC4wloU8p/n74gb9cejjcTATBErKvhna3n5nCqHSWVou9YPr4UhKMz8cUXxz/9n6HW2exwKqXg
	Bo6oUhwA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wpFpE-00000009Hq0-1Ktv;
	Thu, 30 Jul 2026 01:44:44 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wpFpC-00000009Hp4-337H;
	Thu, 30 Jul 2026 01:44:42 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 2E26D4362E;
	Thu, 30 Jul 2026 01:44:42 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7DE7A1F000E9;
	Thu, 30 Jul 2026 01:44:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785375882;
	bh=hLDg/lOQfnHHDcmf98A5srZhKLIOaOoJ/RLfiAyjiFo=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References;
	b=hFcyLcQTUVNOHTXuVoab1LHOar6vUpahKFtRrwXtVzGu+HqLHeGMMVnlO0MywAxM0
	 q2hqrpRhp3GOQbpkQgZaaE1NAj//OQnc35haTpfSI0teK/Wl2oNqw/XlDx2GA/8muP
	 Ko4T4247XaxIzUTiIN6rQXvVByziF47eDmVqjPfBLgCUUxyG46KUCM9S9KtcWKLAQ3
	 PbAEtj6vgjXuz7ZUmQeWSCL48J2zfU1S7A2ncZcMvtuoxFS2T7hZJngB0Gf4qsxWQb
	 Sn/q6ZODlSBtxcRoBsnRib+LCLErtZ7Qwek5Rkx3sxvhSzj0X6nentwzHeVk2vPY5m
	 /67psCDxD/mfA==
Date: Wed, 29 Jul 2026 18:44:40 -0700
From: Jakub Kicinski <kuba@kernel.org>
To: Daniel Golle <daniel@makrotopia.org>
Cc: "Chester A. Unal" <chester.a.unal@arinc9.com>, Andrew Lunn
 <andrew@lunn.ch>, Vladimir Oltean <olteanv@gmail.com>, "David S. Miller"
 <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, Paolo Abeni
 <pabeni@redhat.com>, Matthias Brugger <matthias.bgg@gmail.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Alexander Couzens <lynxis@fe80.eu>, Heiner Kallweit <hkallweit1@gmail.com>,
 Russell King <linux@armlinux.org.uk>, Russell King
 <rmk+kernel@armlinux.org.uk>, Sean Wang <sean.wang@mediatek.com>, Florian
 Fainelli <f.fainelli@gmail.com>, Landen Chao <Landen.Chao@mediatek.com>,
 netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org
Subject: Re: [PATCH net v2 0/5] net: dsa: mt7530: fix swallowed MDIO read
 errors
Message-ID: <20260729184440.0d67ce5b@kernel.org>
In-Reply-To: <cover.1785368701.git.daniel@makrotopia.org>
References: <cover.1785368701.git.daniel@makrotopia.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
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

On Thu, 30 Jul 2026 01:14:30 +0100 Daniel Golle wrote:
> While working on a register access cleanup for the mt7530 driver, the
> Sashiko AI reviewers flagged long-standing error handling gaps in the
> driver's read paths [1].

I just applied v1, please send a rebased / incremental series.
-- 
pw-bot: cr

