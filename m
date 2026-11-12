Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 77FAF606A8B6
	for <linux-mediatek@archiver.kernel.org>; Thu, 12 Nov 2026 08:43:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=qjnuHUTX;
	dkim=pass (1024-bit key) header.d=cmss.chinamobile.com header.i=@cmss.chinamobile.com header.a=rsa-sha256 header.s=default header.b=dvKOlbjk
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=7mQ9PgE1JmToTrJOndvjvlG2pZvNaNVcvI5nSe1P3IU=; b=qjnuHUTX56Nbsq
	1yeW4C7nYQJgc3nQVbGVWix4BgJxwffJHeKa8RvxNAFiSVxU8QIPE7n7zl8kftJaGVICCjkreuJ4K
	tHVchRQ0yOsa73Jykbf27hADdw8uRbftB/uNm+iuZZy6GmH89duIk7zn9/bKefwcZEDOF14sCpY/D
	eZ4e2R18oBThqlTnCRwb9H4pa2CvhXgbY7iLaG6IGg2d64O52Zc3jHcl6M0dK6ITD62nNBkNt8+fT
	HQK/sqlCdGTuHod3GsBrGRzzL2meSTcom7fcsS51YI/JVgHOM8x9oyFuQ2Ga02NI/OBszdaL2Amyo
	eAeND8OUC9J5dFrOHbcA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRQOp-00000009D05-2iI7;
	Thu, 12 Nov 2026 08:43:16 +0000
Received: from cmccmta2.chinamobile.com ([111.22.67.135])
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRQLp-00000009Bd7-1K6R;
	Thu, 12 Nov 2026 08:40:35 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=cmss.chinamobile.com; s=default; l=0;
	h=from:subject:message-id:to:cc:mime-version;
	bh=47DEQpj8HBSa+/TImW+5JCeuQeRkm5NMpJWZG3hSuFU=;
	b=dvKOlbjkxzAzGH2CcvRLA9QMKfkzEan6NRcKwcELTpvl7ebAhZ1Vaepsg8AZlTcprcICFIMKlKgw2
	 nWoB1cvrQT3r3NQBAnVqh2MJOPYMs7vof158+T2bpNODcDwBwKDXGTKlsOkHhFtRgd67v2IhHddj92
	 /9+2NK8qZ4v79Gy8=
X-RM-TagInfo: emlType=0                                       
X-RM-SPAM-FLAG: 00000000
Received: from spf.mail.chinamobile.com (unknown[10.188.0.87])
	by rmmx-syy-dmz-app07-12007 (RichMail) with SMTP id 2ee76af57b5db16-e158b;
	Thu, 12 Nov 2026 16:39:58 +0800 (CST)
X-RM-TRANSID: 2ee76af57b5db16-e158b
X-RM-TagInfo: emlType=0                                       
X-RM-SPAM-FLAG: 00000000
Received: from [198.18.0.6] (unknown[223.108.79.101])
	by rmsmtp-syy-appsvr05-12005 (RichMail) with SMTP id 2ee56af57b5c081-f984e;
	Thu, 12 Nov 2026 16:39:58 +0800 (CST)
X-RM-TRANSID: 2ee56af57b5c081-f984e
From: Xia Yan <yanxia@cmss.chinamobile.com>
To: netdev-bot+sinfo@kernel.org
Cc: netdev@vger.kernel.org, Felix Fietkau <nbd@nbd.name>,
 Lorenzo Bianconi <lorenzo@kernel.org>, Andrew Lunn <andrew+netdev@lunn.ch>,
 David S. Miller <davem@davemloft.net>, Eric Dumazet <edumazet@kernel.org>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Yanqing Wang <ot_yanqing.wang@mediatek.com>,
 Bartosz Golaszewski <brgl@kernel.org>, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 yana06070@163.com
Subject: Re: [PATCH net-next v2] net: ethernet: mtk-star-emac: fix device_node
 leak in mtk_star_probe()
Date: Thu, 12 Nov 2026 16:39:57 +0800
Message-ID: <1794472797000.690257.2793446627884027520@cmss.chinamobile.com>
In-Reply-To: <179445682040.2168702.1032780874409478036@kernel.org>
References: <1794455490000.585551.2561101329908158128@cmss.chinamobile.com>
 <179445682040.2168702.1032780874409478036@kernel.org>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261112_004011_115125_5216C276 
X-CRM114-Status: UNSURE (   7.28  )
X-CRM114-Notice: Please train this message.
X-Spam-Score: -2.4 (--)
X-BeenThere: linux-mediatek@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-mediatek.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-mediatek/>
List-Post: <mailto:linux-mediatek@lists.infradead.org>
List-Help: <mailto:linux-mediatek-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mediatek>,
 <mailto:linux-mediatek-request@lists.infradead.org?subject=subscribe>
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
X-Spam-Status: No, score=-3.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=no
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On 11/12/26 12:13, netdev-bot+sinfo wrote:
>  - What hardware the change was tested on. For driver fixes please
>    mention the device (and if relevant firmware version) used for
>    testing, or say that the change was not tested on real hardware.

Hi,

I don't have any MediaTek hardware with this Ethernet MAC, so the
change is compile-tested only, with CONFIG_NET_MEDIATEK_STAR_EMAC
enabled on x86_64.

Thanks,
Xia Yan



