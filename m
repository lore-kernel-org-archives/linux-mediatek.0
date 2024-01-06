Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7807DC46CD2
	for <linux-mediatek@archiver.kernel.org>; Sat,  6 Jan 2024 12:28:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=7noi2iKU5EnE918BOp85Wnr/KFrAzpzFDgpVthjy3yw=; b=FAZESPTQflCrEWPHNiA2mqYMif
	rCJU26S7F2mlO/HMYBywKCDTfxqGAZ4vdbnb8V9FYZgG3yiQB2nRBTA8eRz+YS22xt5jRhuHD2idy
	+IZlPqU/gmh4EbwGvmglalnd9pZjjHzs63XaqiYYw28/r9PKKkAliSTGLqchMSmkwztzsg12jUpHr
	d5ZituQC6gUba2/BFOgUx8El0vS2zbuVO6WgtTd9HQhpoXcsjIrfZsaLox41NvFRWNBjMdDS5SgWr
	J2n4v+amcTlFomJZ84kOEYkHaH6rMVhM42CSIY2POjOJiR/WtOh5F8j6ru6iAMIVyNa1RSH2oS4Sq
	2Dp1BdXQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rM5mb-001IRL-1n;
	Sat, 06 Jan 2024 12:28:09 +0000
Received: from relay5-d.mail.gandi.net ([2001:4b98:dc4:8::225])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rM5mX-001IQf-1T;
	Sat, 06 Jan 2024 12:28:06 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id A62981C0004;
	Sat,  6 Jan 2024 12:27:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arinc9.com; s=gm1;
	t=1704544081;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=7noi2iKU5EnE918BOp85Wnr/KFrAzpzFDgpVthjy3yw=;
	b=N0VDTGHSN4rPb3eLWFQoZDbNEMVhFvrf6M4aDDts6uaUOrYYg9iqlvxPsotgrurX7/vsUW
	hjxrgpcJwVePVTDvVXFm9usq1E3Ydkcm2u/tSjjdYiZKyedeL2TYIJdKIjuvmSY6/SX+Ja
	YGDEuqxd9ok+D765PNtm6WytId98g97XFeQOHNPtrsvz4j2/EVsoDMrwAPc+CWSU0BBMY2
	yFNgmojwSNkce4ewbYopAZuDDOlNGHgg9IlFWYEu6cdrdnXbkW/2bN1GchDjibMHYvLrB0
	d94QNhfq9GHHIjwIG3FEQn6Uq/rOCSHGv1PKFwAcZPRfdyWBYiDFQqRbXzRhhQ==
Message-ID: <85070571-e03a-48c7-a2e6-2d73709c487c@arinc9.com>
Date: Sat, 6 Jan 2024 15:27:55 +0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net-next] net: dsa: mt7530: support OF-based registration
 of switch MDIO bus
To: Daniel Golle <daniel@makrotopia.org>,
 Landen Chao <Landen.Chao@mediatek.com>, DENG Qingfang <dqfext@gmail.com>,
 Sean Wang <sean.wang@mediatek.com>, Andrew Lunn <andrew@lunn.ch>,
 Florian Fainelli <f.fainelli@gmail.com>, Vladimir Oltean
 <olteanv@gmail.com>, "David S. Miller" <davem@davemloft.net>,
 Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, Matthias Brugger <matthias.bgg@gmail.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: David Bauer <mail@david-bauer.net>, mithat.guner@xeront.com,
 erkin.bozoglu@xeront.com, Luiz Angelo Daros de Luca <luizluca@gmail.com>,
 netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org
References: <20240106122142.235389-1-arinc.unal@arinc9.com>
Content-Language: en-US
From: =?UTF-8?B?QXLEsW7DpyDDnE5BTA==?= <arinc.unal@arinc9.com>
In-Reply-To: <20240106122142.235389-1-arinc.unal@arinc9.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-GND-Sasl: arinc.unal@arinc9.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240106_042805_663719_C5DE6050 
X-CRM114-Status: UNSURE (   3.83  )
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

The author is wrong. I'll fix that with v2. I'm waiting for reviews in the
meantime.

pw-bot: cr

Arınç

