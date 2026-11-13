Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 78DD760A5BE1
	for <linux-mediatek@archiver.kernel.org>; Fri, 13 Nov 2026 16:03:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=nTTolRke;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=iDRqarTR
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=RhI4nQ4XKSj9VLiETSpLtJTrfU+/DWOouSPKVL4WRBY=; b=nTTolRketJ1NsQ
	gYEuLF/oixsOj2j4wQVhgb0tpkSMH5wqrdQ0Y6zk4TKSndxQOSN3UVqWRCablCRXoQJRqn4lBmf+z
	/Q+S0ibga5EtPG3/0sIwMIC4YYakCEGKx6GpI8QkpnO8F4ye4rOtbgpxDYDzAzhCvxDPugKuuYgc+
	5g8UEEd9LBaxQOLNAF8GgGHzZ2+aVK1O9yybFZuI8XeIgj0mGteLnmTJzaWpXKiu4CWo7/APfscKY
	gr9s5FiebWf/W9ttJWCyZ057V0OdxBl4Vj6Rupd22ZQbVfDH/jAHFaCb+NbQ9xf0OnYenP/GGkAhy
	1jfzkz0BzFqrPG9ACv+w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRtkZ-0000000DV04-0vdb;
	Fri, 13 Nov 2026 16:03:39 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRtkX-0000000DUzB-1pIT;
	Fri, 13 Nov 2026 16:03:37 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 6C6C662834;
	Fri, 13 Nov 2026 16:03:36 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6CB711F000CA;
	Fri, 13 Nov 2026 16:03:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794585816;
	bh=RhI4nQ4XKSj9VLiETSpLtJTrfU+/DWOouSPKVL4WRBY=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date;
	b=iDRqarTR8tS7X84ceTlEzYzy475kdu/SiDER8+osdboQ5UBiVytmybe/zFavofpsQ
	 R6fpcf5/355+3FgOlLJouoK/HF+2VVp1Jv1jMSdjUIL8GzxXuGC731l9EyxCw4PaWN
	 9TrCmhxV7PMd0i2OK52pNqVmMHa678Zw2uKra8Wz1C5w1RBG/ifb39bnybbPem/qw2
	 2zL8ODaPvg+rq+vnf1VbO55lsJ5fCg0jxLzlhBn7mOzwlX3ONyKBfOCB6vpzNPHuOx
	 wMMij6gVKX+aUrXlSS4B+DsyLT3mZnEB5mARNbgGLRkWLVxgzq5tgUPtPBvt5G5HXY
	 NYu/sLFRXvdYQ==
From: Lee Jones <lee@kernel.org>
To: Sen Chu <sen.chu@mediatek.com>, Sean Wang <sean.wang@mediatek.com>, 
 Macpaul Lin <macpaul.lin@mediatek.com>, Lee Jones <lee@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Eddie Huang <eddie.huang@mediatek.com>, 
 Alexandre Belloni <alexandre.belloni@bootlin.com>, 
 Ryan Brue <ryanbrue.dev@gmail.com>
Cc: linux-pm@vger.kernel.org, mfd@lists.linux.dev, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
 linux-rtc@vger.kernel.org
In-Reply-To: <20261101-rbrue-suez-upstreaming-mt6397-rtc-32k-v1-1-9758f38d7053@gmail.com>
References: <20261101-rbrue-suez-upstreaming-mt6397-rtc-32k-v1-1-9758f38d7053@gmail.com>
Subject: Re: (subset) [PATCH 1/2] dt-bindings: mfd: mediatek: mt6397:
 describe the RTC's 32 kHz output
Message-Id: <179458581213.82278.2659730023660991839.b4-ty@b4>
Date: Fri, 13 Nov 2026 16:03:32 +0000
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailer: b4 0.16-dev-ad80c
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
X-Spam-Status: No, score=-8.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Sun, 01 Nov 2026 23:33:46 -0600, Ryan Brue wrote:
> The MT6397 RTC drives its 32 kHz clock out of the PMIC, where boards
> use it as the sleep clock of a Wi-Fi/Bluetooth combo chip. The output
> is off unless something turns it on.
> 
> Let the RTC node provide it as a clock.
> 
> 
> [...]

Applied, thanks!

[1/2] dt-bindings: mfd: mediatek: mt6397: describe the RTC's 32 kHz output
      commit: c91c3c19d56b9f1c223963eeda275a28cdeb71f9

--
Lee Jones [李琼斯]


