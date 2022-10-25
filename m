Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6BA40C38A2D
	for <linux-mediatek@archiver.kernel.org>; Tue, 25 Oct 2022 10:52:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=iqP25/5V+C1f0K2Q4zSYqo1AnR1zTq3OdxNrMNY7khE=; b=EF1nQqniVtbHXStBhEiYysxTRz
	qYMxU8TOpMWuZQC08KnBS9dEZpx7SezddDtzZhu4uM9DdUV+7jM4s7GD1nGKHNhushBTzRfAgnfwj
	tpRfqf7PqMBiiB8ZXdnuwSnkx9Vt1J27Nd9t0qpRM1yITMypboXydjYqpIxBd6BbQNxOvYzISQFTE
	QYju6f+mvb/we5a5SKblPp8LF4/Z+Pc77OBkCIzBelHqffCJ7oZGf9FAdhxxQQYlN2HFPu5IjNJPn
	flaHECeYRIVHMuF9Ooyh3o5nnnxCVACexdccB/s0aCQK/D68OCtCYE6fhg1URSFd+5/DtgziHPzCe
	NHlHkQLA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1onHXm-004r6D-M4; Tue, 25 Oct 2022 10:52:26 +0000
Received: from madras.collabora.co.uk ([46.235.227.172])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1onHXV-004r0Y-Da; Tue, 25 Oct 2022 10:52:10 +0000
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id 89E9D660239E;
	Tue, 25 Oct 2022 11:52:07 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1666695128;
	bh=bSnVLL8Pc8DTD3Pf6881nmJo6l8V96eFCrGuGcmdU4Q=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=es+lRqNKDNionDgcTpis7RV31K7MhghDuuKQsTDDRz44pfp1Oy6y6RNGu22yLDQnl
	 8PFuv37ffvvc2vG1mhxutWoRPlZkUPIitr8nsABx67F/HOJPYi73CM5B0xTvXJRk6H
	 Gq1nWzEDV1WcbXdcBiKdr+OpCbl6k0JgrGm1Ldb7HI1nGZ/bamiJBdC9s8LULIipvC
	 mSmsUolxk10fJh7F0QLmwAm6uk1cd1eGKCKvP0RWxm6/uz4RwGoxr/9mcDaIm20fjY
	 ZsaERHnE7h7Kr3GaOvGOwtwDsPRFYk1dhJvGKY7la1BHxecoC9TkbY7RMU2PVBXOzs
	 icANv1HT9MwiA==
Message-ID: <2bc75b20-9469-e7e3-24e3-cc80ab9b8a8e@collabora.com>
Date: Tue, 25 Oct 2022 12:52:05 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.3
Subject: Re: [PATCH v4 5/6] arm64: dts: mt7622: drop r_smpl property from mmc
 node
Content-Language: en-US
To: Frank Wunderlich <linux@fw-web.de>, linux-mediatek@lists.infradead.org
Cc: devicetree@vger.kernel.org, Ulf Hansson <ulf.hansson@linaro.org>,
 Wenbin Mei <wenbin.mei@mediatek.com>, Sam Shih <Sam.Shih@mediatek.com>,
 linux-mmc@vger.kernel.org, linux-kernel@vger.kernel.org,
 Rob Herring <robh+dt@kernel.org>, linux-arm-kernel@lists.infradead.org,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Chaotian Jing <chaotian.jing@mediatek.com>
References: <20221025074238.18136-1-linux@fw-web.de>
 <20221025074238.18136-6-linux@fw-web.de>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <20221025074238.18136-6-linux@fw-web.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221025_035209_616286_FF9ABA1F 
X-CRM114-Status: UNSURE (   8.82  )
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

Il 25/10/22 09:42, Frank Wunderlich ha scritto:
> From: Frank Wunderlich <frank-w@public-files.de>
> 
> This property is not defined in binding and driver.
> 
> Signed-off-by: Frank Wunderlich <frank-w@public-files.de>

Fixes tag please.



