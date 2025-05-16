Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 471D2C3ABD8
	for <linux-mediatek@archiver.kernel.org>; Fri, 16 May 2025 23:33:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=llwsbB0/SEO3VBncmuDcTCOk6TFoKsugl0/TrEZQkVA=; b=KPVFxKhtzlE6qJDYx9tCsmrJdY
	KTF19z9W35fGo1zROt0zFG4lxBfpSo44d1i0glqQ3+Dxprq1VQ0PaHkbhi85PndtKW7MgxKkFo0B0
	aDI2PIGRlK8qQK89PvEQ2Zd23nD9rgCIGAsocFfVegEz6VKcqi2oMOAkzsW+iH0ZNw4qvQJo/plXA
	3bWSHLfhpvOjGSTh8Ym5vI74SdEyM7pWdJMKVkj3ZlgK7PIYQm3q90akKjJ0gNEdKBTjI0LxQLBk6
	9EPZ9RD57dZ6iTyDwYb2X6l6XryW+V9fNEqkw2gquAe+CqHlBlTE6G0XNbuw8xAIm0zN4uPRS++cS
	UcoTj9+g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uG4YG-00000004rAu-3wUc;
	Fri, 16 May 2025 23:33:16 +0000
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uG4WC-00000004r0D-1SE0;
	Fri, 16 May 2025 23:31:11 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 72E86A4E54D;
	Fri, 16 May 2025 23:31:07 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4A050C4CEE4;
	Fri, 16 May 2025 23:31:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1747438267;
	bh=LLXZH8CcZsv0YcixDzRJ1c9l0A1zuk/pzjDX3m7p/V4=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=n1gO6Z3Z7Gvk7LqDSlLPRSu67oFEX4V2NsGLnIODlWsQ4jO8W67/4of9MJ0Sx83hL
	 kKC0+Iw5vXgsbLF34bNv2ldP2cVTmhtQKcdwNuqdmo31jBt0UVS3Ge+x2efjTc1LfH
	 gv8XzD+AlIONXgYcBIPgpaGFOHgQQQEAUc4pzHO6vCsUqxGBcYaDBslRQ3CpyC1Ql4
	 U/D003bt41MLHJQLF6UyM5rXoypEP0EhD8z2lxx+wo8DOKR8bttJIlhzv18CVFTRsC
	 3G6tmIQBuM+VrQOf6ahcpWVbPhjtQZFa9m/E/JzvVceNe/piLrOBAk0DAcNXTAr5vn
	 X8T4EYfANuXuQ==
Date: Fri, 16 May 2025 16:31:05 -0700
From: Jakub Kicinski <kuba@kernel.org>
To: Frank Wunderlich <frank-w@public-files.de>
Cc: Frank Wunderlich <linux@fw-web.de>, Andrew Lunn <andrew@lunn.ch>,
 Vladimir Oltean <olteanv@gmail.com>, "David S. Miller"
 <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, Paolo Abeni
 <pabeni@redhat.com>, Rob Herring <robh@kernel.org>, Krzysztof Kozlowski
 <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Matthias Brugger
 <matthias.bgg@gmail.com>, AngeloGioacchino Del Regno
 <angelogioacchino.delregno@collabora.com>, Daniel Golle
 <daniel@makrotopia.org>, Qingfang Deng <dqfext@gmail.com>, SkyLake Huang
 <SkyLake.Huang@mediatek.com>, Heiner Kallweit <hkallweit1@gmail.com>,
 Russell King <linux@armlinux.org.uk>, =?UTF-8?B?QXLEsW7DpyDDnE5BTA==?=
 <arinc.unal@arinc9.com>, Landen Chao <Landen.Chao@mediatek.com>, Sean Wang
 <sean.wang@mediatek.com>, Lorenzo Bianconi <lorenzo@kernel.org>, Felix
 Fietkau <nbd@nbd.name>, netdev@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org
Subject: Re: [net-next, PATCH v2] net: phy: mediatek: do not require syscon
 compatible for pio property
Message-ID: <20250516163105.12088849@kernel.org>
In-Reply-To: <D997C4DB-1B03-4AFD-B48C-BFA19AB6194D@public-files.de>
References: <20250516180147.10416-1-linux@fw-web.de>
	<20250516180147.10416-3-linux@fw-web.de>
	<D997C4DB-1B03-4AFD-B48C-BFA19AB6194D@public-files.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250516_163108_453723_CB603086 
X-CRM114-Status: UNSURE (   8.00  )
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

On Fri, 16 May 2025 20:08:47 +0200 Frank Wunderlich wrote:
> Sorry, resent it by accident while sending v2 of my dts series.
> regards Frank

Unfortunately patchwork thought this is patch 1 of the series instead
of the bindings patch :(

Let's wait for binding reviews and maybe you could repost patches 1-3
for net-next without the dts ones? 

