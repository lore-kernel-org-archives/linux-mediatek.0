Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E5039C4706C
	for <linux-mediatek@archiver.kernel.org>; Sat, 13 Jan 2024 10:26:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=Cu52BRfKxl75PPDP1cnZ73YAlMaoZLACyxVOZm73PrU=; b=FocLkjmktYf6IWLRu1CxDh7gIZ
	GMmZLs6+baV2qzlaQVrPJpDMA/yNwhgK58+sptd2UZh/df4FpYv2kFKn0PYnnTSvc0MH42nWBp1Nz
	vtJMVArMS5q+Mb3bnqwj1F3OI6+dfTz0y0K0jOn3hxSTlFdo0B6z0xZKyDZufcjnno6PZDKIccH69
	P6B4bTPDLEI2x3r/GG33y2h2YphZ5uJa1VhzIadRz1KnNP2DwXNfMyIa+lIB9LvOoG0ftzkwigJL6
	mQ8yxfyUBSljlh8RiGCDmaHa/3dLX5kYiIpz+0EH4HYfuqmsqSgPavcFnt1D6G9CYzC3Fk5OZywPb
	iJqi2Y/A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rObDI-004tCJ-02;
	Sat, 13 Jan 2024 10:26:04 +0000
Received: from relay3-d.mail.gandi.net ([217.70.183.195])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rObDB-004t9h-1M;
	Sat, 13 Jan 2024 10:26:00 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id 8A13F60004;
	Sat, 13 Jan 2024 10:25:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arinc9.com; s=gm1;
	t=1705141545;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=Cu52BRfKxl75PPDP1cnZ73YAlMaoZLACyxVOZm73PrU=;
	b=DDEz3incql+CdQGRquQneoKwYWsrpGnPGMLcOnvmFyiPH5Fxc8KfS8S6Jsm9P7igYvDB3c
	sFsoEOJLN78pluh0BvfSANaqaWZluwelR5FD4CF0jE7+HN4meXxbugmDXemXOOK+Yd9i4/
	U7w+RCZ3z74TV/vt9vkIHXXTMhngy6y+Zqu59k4QtzM4EOdWKXg1vzFEb188M/W98tIhyH
	KWRAheZc8VevgIUvY+10UiqJDkM5M1E646jrXeQShhnUxAkogPXEO/XxD6JRht61vG+9lP
	EekTR9ntlQoVUCZ/h67VLOSuC5WjNswKNCIeFqf/+PimEr4mHIbIE93p24zUjA==
From: =?UTF-8?q?Ar=C4=B1n=C3=A7=20=C3=9CNAL?= <arinc.unal@arinc9.com>
To: =?UTF-8?q?Ar=C4=B1n=C3=A7=20=C3=9CNAL?= <arinc.unal@arinc9.com>,
	Daniel Golle <daniel@makrotopia.org>,
	Landen Chao <Landen.Chao@mediatek.com>,
	DENG Qingfang <dqfext@gmail.com>,
	Sean Wang <sean.wang@mediatek.com>,
	Andrew Lunn <andrew@lunn.ch>,
	Florian Fainelli <f.fainelli@gmail.com>,
	Vladimir Oltean <olteanv@gmail.com>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: mithat.guner@xeront.com,
	erkin.bozoglu@xeront.com,
	Luiz Angelo Daros de Luca <luizluca@gmail.com>,
	netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Subject: [RFC PATCH net-next 0/8] MT7530 DSA Subdriver Improvements Act II
Date: Sat, 13 Jan 2024 13:25:21 +0300
Message-Id: <20240113102529.80371-1-arinc.unal@arinc9.com>
X-Mailer: git-send-email 2.40.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-GND-Sasl: arinc.unal@arinc9.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240113_022557_618982_C5E500C6 
X-CRM114-Status: UNSURE (   3.32  )
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

Hi.

I'm submitting this to receive reviews while net-next is closed.

Arınç



