Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7142AC35FEB
	for <linux-mediatek@archiver.kernel.org>; Tue, 17 Sep 2024 07:02:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=wL7bb6z2iPwWqy6wScaLnhBW8fFzb85kAzY2JZAjutM=; b=jH+I5qjOjgN9YCW8IkJfD/mkpk
	zhXDa4Gg6XjTLcV60Etii29+9Z0HN5Njbm/PCu0jMuI/Wj4XC8HzDntenfwg4U5eIrjTIl1e//6cI
	ejXEpUmDSESXV9sFLlXSEz+grCjv1xFAjm3uwKO3QWqOAbZHCnyXPUgoGWlSl1t2a3aueOQR9lTF8
	htasB7JHm1zZMaIB4KfQWfK3ZEEtiK8xXnqKRofN7HnOhR71lPFUzmSIOcpWTHsnMzLetrAHpRhMg
	dAXMzttVc86LVQjQyW6K78efUfSV07Jp/inXhP9iNEDNK5Xx9ez5gpz8XOmJenJudOthjz2mHJqXk
	BgX/jl3Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1sqSEV-00000005Xrf-3gBG;
	Tue, 17 Sep 2024 07:02:44 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1sqSD4-00000005Xbm-30vr;
	Tue, 17 Sep 2024 07:01:16 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 503645C5798;
	Tue, 17 Sep 2024 07:01:10 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9A480C4CEC6;
	Tue, 17 Sep 2024 07:01:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1726556473;
	bh=wL7bb6z2iPwWqy6wScaLnhBW8fFzb85kAzY2JZAjutM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Sq9vfbO9nxUpSGNrYLqj2Q8lgo2euizIAqPcu+2RYfv9Qy3Xi2to2W8G0453aZgEc
	 gyRJPwKRSdpoyxSS3nybDQAy6L0+yiQFLBZwEOKaqFabevwP3eAwvuBkC2PR07sLlc
	 tdfPOcXthy+/W+VBtKl/10ApKOWKuVMlLQbddbD5x79MMNBxJkUEPa9xduBmI2O+4Q
	 10OzeyGNN4KwiGQRZMx8NSk43PUjg2pSgZiF7cgpmecnNknHIG56/r4GwIrHSXI7qX
	 hJZBX1ANS2kKMrC0YgPjonPKpAvKBQIpQnCTAGjsSUUrh22ejpWEeBjoyvk+UbB5uG
	 y0jWIJh4ltyXg==
Date: Tue, 17 Sep 2024 09:01:10 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Macpaul Lin <macpaul.lin@mediatek.com>
Cc: Andrew Lunn <andrew@lunn.ch>, Florian Fainelli <f.fainelli@gmail.com>, 
	Vladimir Oltean <olteanv@gmail.com>, "David S . Miller" <davem@davemloft.net>, 
	Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>, 
	Paolo Abeni <pabeni@redhat.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, Liam Girdwood <lgirdwood@gmail.com>, 
	Mark Brown <broonie@kernel.org>, Sean Wang <sean.wang@mediatek.com>, 
	Sen Chu <sen.chu@mediatek.com>, netdev@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-mediatek@lists.infradead.org, Dmitry Torokhov <dmitry.torokhov@gmail.com>, 
	Pavel Machek <pavel@ucw.cz>, Lee Jones <lee@kernel.org>, Sebastian Reichel <sre@kernel.org>, 
	Alexandre Belloni <alexandre.belloni@bootlin.com>, Chen Zhong <chen.zhong@mediatek.com>, 
	linux-input@vger.kernel.org, linux-leds@vger.kernel.org, linux-pm@vger.kernel.org, 
	linux-rtc@vger.kernel.org, linux-sound@vger.kernel.org, 
	Alexandre Mergnat <amergnat@baylibre.com>, Bear Wang <bear.wang@mediatek.com>, 
	Pablo Sun <pablo.sun@mediatek.com>, Macpaul Lin <macpaul@gmail.com>, 
	Chris-qj chen <chris-qj.chen@mediatek.com>, 
	MediaTek Chromebook Upstream <Project_Global_Chrome_Upstream_Group@mediatek.com>, Chen-Yu Tsai <wenst@chromium.org>
Subject: Re: [PATCH v5 3/3] regulator: dt-bindings: mt6397: move examples to
 parent PMIC mt6397
Message-ID: <ev4kqtbjwglrti3mk2cnayilj4muy7ll7ux2uwlekcwu73dy5e@h4wvpucmyepw>
References: <20240916151132.32321-1-macpaul.lin@mediatek.com>
 <20240916151132.32321-3-macpaul.lin@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20240916151132.32321-3-macpaul.lin@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240917_000114_849557_08CAC373 
X-CRM114-Status: UNSURE (   9.36  )
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

On Mon, Sep 16, 2024 at 11:11:32PM +0800, Macpaul Lin wrote:
> Since the DT schema of multiple function PMIC mt6397 has been converted,
> move the examples in "mediatek,mt6397-regulator.yaml" to the parent schema
> "mediatek,mt6397.yaml".

Is there any error otherwise? Why this cannot stay here, since it is
already there?

Best regards,
Krzysztof


