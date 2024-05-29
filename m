Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9D6F8C25B75
	for <linux-mediatek@archiver.kernel.org>; Wed, 29 May 2024 14:42:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=IRZynocr/tTeUilm4xkJlwqyjNdzY/FslPNT5Qd8p+o=; b=FYlVmjzQlEbya4ShlpEBxJuI/e
	FMJYQRnIKi4whqyc+aGfM7pg8xujn8j0zNa2y8oTkA4Q+R1BEOqyaFrKtmMiudNIUWbcjRzZDTBbF
	hm6PZcUCfcjVlER2VkxqOLr6M1jLRnZxavFls6aRLmERSILURrUrzoZejJ0R+wxgs6AyFDB1+jnD9
	jNO/bCgRzCvcIs8Bnt7vEIGE7hVp+7dNmzYIhv+QZ9kX1kf4WeGL/7grLF7eqV1r9GR23i4p2JkyL
	GF/ruSt1FaUuxExMTAD5Ow4uklHaW6qVCjfmzcJLaG0phPNiTHkW9rSF2BXhIBUfnOIzIwORV3qdI
	KXUosd7g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sCKVB-00000004WZ5-0dum;
	Wed, 29 May 2024 14:42:05 +0000
Received: from vps0.lunn.ch ([156.67.10.101])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sCKV8-00000004WXi-3u3H
	for linux-mediatek@lists.infradead.org;
	Wed, 29 May 2024 14:42:04 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=IRZynocr/tTeUilm4xkJlwqyjNdzY/FslPNT5Qd8p+o=; b=GNR06GsVUQnBLY0V5w8USH6PfR
	Xz/kNmbZPIs4i/zAIud/9cce37YliOJE9E+zBFm7YVx/ZY5yMdVhq8Qfw/t0d9snL5qNAWu9W/AYK
	Vr9Gdzu/DZEJqmhUlbJyNAv1+ugNG40/pqw5UYLsiWcK3WYAa8CXtcOeKo0/obEOYTHk=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1sCKUt-00GGUJ-MR; Wed, 29 May 2024 16:41:47 +0200
Date: Wed, 29 May 2024 16:41:47 +0200
From: Andrew Lunn <andrew@lunn.ch>
To: Lorenzo Bianconi <lorenzo@kernel.org>
Cc: netdev@vger.kernel.org, arinc.unal@arinc9.com, daniel@makrotopia.org,
	dqfext@gmail.com, sean.wang@mediatek.com, f.fainelli@gmail.com,
	olteanv@gmail.com, davem@davemloft.net, edumazet@google.com,
	kuba@kernel.org, pabeni@redhat.com,
	linux-mediatek@lists.infradead.org, lorenzo.bianconi83@gmail.com,
	nbd@nbd.name
Subject: Re: [PATCH net-next] net: dsa: mt7530: Add debugfs support
Message-ID: <9ad6b014-11e1-4def-8217-b1fbeac768c3@lunn.ch>
References: <0999545cf558ded50087e174096bb631e59b5583.1716979901.git.lorenzo@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <0999545cf558ded50087e174096bb631e59b5583.1716979901.git.lorenzo@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240529_074203_125763_7359D589 
X-CRM114-Status: UNSURE (   7.26  )
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

On Wed, May 29, 2024 at 12:54:37PM +0200, Lorenzo Bianconi wrote:
> Introduce debugfs support for mt7530 dsa switch.
> Add the capability to read or write device registers through debugfs:
> 
> $echo 0x7ffc > regidx
> $cat regval
> 0x75300000
> 
> Signed-off-by: Lorenzo Bianconi <lorenzo@kernel.org>

In addition to Vladimirs NACK, you can also take a look at how
mv88e6xxx exports registers and tables using devlink regions.

    Andrew

---
pw-bot: cr

