Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1DAA3C4332F
	for <linux-mediatek@archiver.kernel.org>; Thu, 13 Oct 2022 08:18:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/Xzt8MbcX5Dr8DU0lY4nz0qm0NArBQQVscu5IAq8GL0=; b=kkA+5pUbRdigYVHN/y1u3qEr6O
	lH2f4qtYZ+qF7PYQct4jLb8ZI/HWMMjCRsPWyuRg5yi0dg7zd2e4ltXyoJpfZz1OiYE1uZJ3PnVxl
	0PgVEEE3TwiUYwO+abdtWJ/VjpsI6ltumZjzWF4uRTJOAmpIVJfZfFwKf6UJKHe0q1zYQrDKqp3Y1
	HTjlOgBStnMwjcYkxFW7wSh0hi32TAXjqQZOLjcqKii0UBmB4PotHqel+ObpSEqjlZhZYwoRTkQfl
	HkHXaXHasO4EP5woFbK1Kkl9JYDwHouHrIG54AFWm5va9JSIPm0aDwJFBsEHVCPzyqVdZ3BqbA9PO
	x7mSKvxg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oitPw-00B3GR-Ty; Thu, 13 Oct 2022 08:18:12 +0000
Received: from madras.collabora.co.uk ([2a00:1098:0:82:1000:25:2eeb:e5ab])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oitPm-00B3Db-Tq; Thu, 13 Oct 2022 08:18:04 +0000
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id E567A6600371;
	Thu, 13 Oct 2022 09:18:00 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1665649081;
	bh=Uu5rbmrfroLdLSqOR0v0a9UJfb8k7vbHXqzMAJmPRYE=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=CyJfw0tT3OoEdHdBd6mo1gu16SOMZHEBKGmV2FdEYLjlbrkXgZ/4MaDZlDIGKJMi0
	 BW12aVDG2Hh/1DBNtaJzRhmNIX2ojPHOB0xkGlNQpXlVvB0TK5DnOuLHN0UQ5V35rP
	 45OwgZ/8wdmGHZbVqRe0lGBAvkV5lP2mL6dGay0iS44qkOWf6cvTSXs8c7nRQLX59R
	 eJXJl8uj4qN9VYOBvAaWNu0fPPS1tpJbCbq7SVmgoQtVtqmU+U6GBp2mLAPvvkixkz
	 lmZ37jNw2J2/kcLxY52b0gWFLjf5I9W9XA+ODtUY548kk95FRt/ww/Vos2LCWhw9yB
	 aHHjPVAloiz/g==
Message-ID: <14228ff6-f2de-6d85-d0ee-41983941659a@collabora.com>
Date: Thu, 13 Oct 2022 10:17:58 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.0
Subject: Re: [PATCH v3 4/8] arm64: dts: mediatek: mt8195: add MUTEX
 configuration for VPPSYS
Content-Language: en-US
To: Moudy Ho <moudy.ho@mediatek.com>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Chun-Kuang Hu <chunkuang.hu@kernel.org>
Cc: linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 Project_Global_Chrome_Upstream_Group@mediatek.com
References: <20221013020329.8800-1-moudy.ho@mediatek.com>
 <20221013020329.8800-5-moudy.ho@mediatek.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <20221013020329.8800-5-moudy.ho@mediatek.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221013_011803_116334_1D03F8ED 
X-CRM114-Status: UNSURE (   8.80  )
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

Il 13/10/22 04:03, Moudy Ho ha scritto:
> In MT8195, the MMSYS has two Video Processor Pipepline Subsystems
> named VPPSYS0 and VPPSYS1, each with specific MUTEX to control
> Start of Frame(SOF) and End of Frame (EOF) signals.
> Before working with them, the addresses, interrupts, clocks and power
> domains need to be set up in dts.
> 
> Signed-off-by: Moudy Ho <moudy.ho@mediatek.com>

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>



