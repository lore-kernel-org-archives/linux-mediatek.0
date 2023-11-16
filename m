Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 327A5C197A0
	for <linux-mediatek@archiver.kernel.org>; Thu, 16 Nov 2023 09:01:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=TK1UGESPXIlBGlU0FfG42M9arQ3tmo/CWpQxVzrSs1k=; b=sXvAINn1TJV7/704x2aHeV6A7w
	7BU4McorUf8X2m6BAE/4svkiUmSih1Fq1jlrYu3pw+fovgGj03lMwvs6yqz9Q3kRRvG32M7BvW5BZ
	NEAvstgKsi4WOJuAUMsjtOtKtgSkAy8lVZn6GuS9lkdSUP3fo9tHB21eZ0iWRbo+kq/mqA3GM2bYp
	xanp7NCfjK5bDmMThgd+eGLWq01c/CdqaWWyjrVYTeD6KgSz0sjrFzjnxfvgReMmjS84yXiKHpFv6
	HezZv624n2JCWzLxdLczvsCAlwFDyZaoJ5MVlCnIWP3mXLA0YSDkZaqTeUhRVlID4y1zTo5oNtZqp
	7BhZ805w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r3YFc-002vD5-0L;
	Thu, 16 Nov 2023 09:01:28 +0000
Received: from madras.collabora.co.uk ([2a00:1098:0:82:1000:25:2eeb:e5ab])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1r3YFW-002vAP-1X;
	Thu, 16 Nov 2023 09:01:23 +0000
Received: from [100.107.97.3] (cola.collaboradmins.com [195.201.22.229])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id 882A466071EF;
	Thu, 16 Nov 2023 09:01:20 +0000 (GMT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1700125281;
	bh=MzwcOLZt6ojmNlxmFUAbnTlthwox7Z0tKERvrVGUWEk=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=k+RpmIC6I2wMZqvYfmUuTq2UsQ47eVOvlqNveTsIMU/jfNmZgqs66sk6LFbEqwVi3
	 zDsQ6vlO3cFltj5w53d7NWirGNLwhtvDswUTftVHmBZ4mr8OaMSoQY0wtKGGWEggq5
	 d/xAJxKU/nHcsI7yI26CMSNuz38XEc52ptbSXiXR2ab4sI7edjxjco/o+CdNYce8xp
	 F4FJhpuXRxatXKB00UJNXA9reZeJkKstIJ3mfhrIaIbLFQ4mKm5MDj9cjXelgKNUiC
	 7kI0daSDvvfa68rWldLAJgYLvNpQRXqD6IMNB5rlAlI3RTmm72RQnL9flRe/eqVDZJ
	 1sHsyXJI6dezQ==
Message-ID: <74018232-d406-4a6d-8d43-4e82e6d4cb40@collabora.com>
Date: Thu, 16 Nov 2023 10:01:18 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 1/3] soc: mediatek: svs: Add support for MT8195 SoC
Content-Language: en-US
To: Mark Tseng <chun-jen.tseng@mediatek.com>, Rob Herring
 <robh+dt@kernel.org>, Krzysztof Kozlowski
 <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor+dt@kernel.org>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Philipp Zabel <p.zabel@pengutronix.de>, Roger Lu <roger.lu@mediatek.com>,
 Kevin Hilman <khilman@kernel.org>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 Project_Global_Chrome_Upstream_Group@mediatek.com
References: <20231011034307.24641-1-chun-jen.tseng@mediatek.com>
 <20231011034307.24641-2-chun-jen.tseng@mediatek.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <20231011034307.24641-2-chun-jen.tseng@mediatek.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231116_010122_649345_5663A856 
X-CRM114-Status: UNSURE (   5.40  )
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

Il 11/10/23 05:43, Mark Tseng ha scritto:
> MT8195 svs gpu uses 2-line high bank and low bank to optimize the
> voltage of opp table for higher and lower frequency respectively.
> 
> Signed-off-by: Mark Tseng <chun-jen.tseng@mediatek.com>

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>


