Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 20944C77B76
	for <linux-mediatek@archiver.kernel.org>; Thu, 20 Apr 2023 14:32:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From
	:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=E9d8G20OG4PzTp+AUugnRMZVm+9jSxFxOJMSEoJr3yA=; b=EfH5jf5M1APIoWbrghB06Tky1I
	yAGcYJyq7BmD2BAYis58CgoVDSTl7/ocGtgIjl9QCIBC4JltY0htrbFe1BdAzR5Bhjz+r9VXbm/jO
	fxyMnzYah3UdzcfVrBlUNca2Iq7If7YvE1dlbBbxJofo48TK+SvzgwYOY370iaCOiSr7nDMlfap8h
	SBrqhnZTfwfmLz7azgd93C8wOmh321UO6l2El8a9FxeMVva+pawOX+JGNlsu+XiXpLWHr7+uCMKMz
	EhO8SkBPuN0q3cW/8R8PexCF3+yZi+1M5qJ8wSb3Rk48CuE7tUT20BNt2oaEJz1DXqjydy05kaRGm
	bl1jgRDQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1ppVKv-008JU0-2C;
	Thu, 20 Apr 2023 14:32:37 +0000
Received: from madras.collabora.co.uk ([2a00:1098:0:82:1000:25:2eeb:e5ab])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1ppVKr-008JSa-39;
	Thu, 20 Apr 2023 14:32:35 +0000
Received: from [IPV6:2001:b07:2ed:14ed:c5f8:7372:f042:90a2] (unknown [IPv6:2001:b07:2ed:14ed:c5f8:7372:f042:90a2])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id E063E6603265;
	Thu, 20 Apr 2023 15:32:30 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1682001151;
	bh=+TVWRubMAjRGPp7QPq7BCPc3y2bv7sKk2mvQp0XR9e4=;
	h=Date:Subject:To:References:From:In-Reply-To:From;
	b=DwKLq+3Ti4XpC+rjzkMoBCLlra80K/O3SeBpLyKMv9BjhtKOQI/v3FpKbuBdArkUV
	 cEcJB9MxeHYiFZB/N2BxWCjYo0MxFw8mmnYCJ7B8rZbZ1VXlh/9ltVWT8ogR6rDkWb
	 idFuTKbS8PxEY9IVyrYxYjTp9Mj+5jCulTz2arWXFIczoaUJMYqAH7Y4akXMXSG1P+
	 Buz6Vtq2FgEYcZ5ChfS62icntVGqOTI4OXNVjbnR7P6/K08VPPycXhAVUWeYtNrs+y
	 hT5c8SoYM6lMxwNdcnTqlrdAT9mNhF1SiSOaN8pGHNvKzphLgfiubSUDUKh7yhKkQy
	 7kK1Og/YmAM2g==
Message-ID: <99c2ec7c-bff2-fa50-f267-d5ca383bd5ca@collabora.com>
Date: Thu, 20 Apr 2023 16:32:27 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.1
Subject: Re: [PATCH v2 2/2] pwm: mediatek: Add support for MT7981
Content-Language: en-US
To: Daniel Golle <daniel@makrotopia.org>, linux-pwm@vger.kernel.org,
 linux-mediatek@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, Thierry Reding <thierry.reding@gmail.com>,
 =?UTF-8?Q?Uwe_Kleine-K=c3=b6nig?= <u.kleine-koenig@pengutronix.de>,
 Matthias Brugger <matthias.bgg@gmail.com>, John Crispin <john@phrozen.org>
References: <cover.1681992038.git.daniel@makrotopia.org>
 <7c6e31c844642c199f223f4229a04a37b57a34f3.1681992038.git.daniel@makrotopia.org>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <7c6e31c844642c199f223f4229a04a37b57a34f3.1681992038.git.daniel@makrotopia.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230420_073234_227036_978A1E81 
X-CRM114-Status: GOOD (  12.82  )
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

Il 20/04/23 14:36, Daniel Golle ha scritto:
> The PWM unit on MT7981 uses different register offsets than previous
> MediaTek PWM units. Add support for these new offsets and add support
> for PWM on MT7981 which has 3 PWM channels, one of them is typically
> used for a temperature controlled fan.
> 
> Signed-off-by: Daniel Golle <daniel@makrotopia.org>

The implementation is good now; there's only one nitpick: you're reordering
the platform data entries and I agree about doing that, as they should be
alphabetically sorted, but you didn't mention that in the commit message.

Please send a v3 that mentions that you're also reordering.

"...while at it, also reorder..."

After which:

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>

