Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A0AC1C38A02
	for <linux-mediatek@archiver.kernel.org>; Fri, 28 Oct 2022 08:40:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=oSFxP9Fb4fyR8FREPivnQnZ8b4w7uljzRB2VBvMiBGc=; b=Pl7aTdzEx6eNQylD2mUZi4TFyv
	o7nr0yy6XXU5CklUIPKpjiWC0Fsp7SV7HMTUDUCYK/xtN3o1CNZxA/ybliNcquyPQL+qY0BddABp5
	M2wO3aw1NG0KSitSU2fq133VHASkQSn9RhR8VPGYKyd60zIyE325sN1nEDtFgiAPt0F8bVYaIZ8Dw
	Vfp/6xpOTGi5TOsLkPGNarJuxHFIpogU5T7uvCIL1q2VP+8K//uvHzjjIEnqA0+cNiy4HiIndTm50
	fnfoVn9Ceq6k6lX0uFAYwffq47lS98Zxy72AQ7udAzn/JUIHgXk098FgsdATV0+aWfEexFAWC8TfG
	WVXmdSNg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ooKuC-00GAy9-3N; Fri, 28 Oct 2022 08:39:56 +0000
Received: from madras.collabora.co.uk ([2a00:1098:0:82:1000:25:2eeb:e5ab])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ooKtz-00GAt6-0s; Fri, 28 Oct 2022 08:39:44 +0000
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id 0CFB3660290F;
	Fri, 28 Oct 2022 09:39:35 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1666946375;
	bh=UhMWJ/1/cEHdLVXxkAy9ur25nedUXLfJn8yUZ5lgu04=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=TefUW9//YWfJDnNMBy5ONnnUxBXe/gejvnZs+Gxu/ShigBEh2gElXp/yeYKn67n3W
	 wYKId+ZA4K5/rNAaMXTTZNbz8D04HFcxOrsdoL06tjAd057i1R1cRA0xuVj6nTZMWL
	 jc2HqGmg46eE/7za1W7guuJoTKf/w9NjTTZkSxrH4fmmCKMjHTxuUX2yXPo6dCzf++
	 W3BVHpf2icr820ATZo4+yvfE4iQFk5fUPIYoT0iTJqWC3eWZ5hP+uswwu4T1cE/YTg
	 33b9ucRL2oO2bz+cmRA3nbRJkjIWq3VNm2SkaMQYU3Or+FnlgIOJ6cLE8M0oybagYC
	 mMBK4o/11hlqw==
Message-ID: <eb47aba9-e5d9-9f27-06ae-cf386b291b05@collabora.com>
Date: Fri, 28 Oct 2022 10:39:31 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.3
Subject: Re: [PATCH] pwm: mediatek: always use bus clock for PWM on MT7622
Content-Language: en-US
To: Daniel Golle <daniel@makrotopia.org>, linux-pwm@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, Thierry Reding
 <thierry.reding@gmail.com>, =?UTF-8?Q?Uwe_Kleine-K=c3=b6nig?=
 <u.kleine-koenig@pengutronix.de>, Matthias Brugger <matthias.bgg@gmail.com>
Cc: Fabien Parent <fparent@baylibre.com>, Zhi Mao <zhi.mao@mediatek.com>,
 Sam Shih <sam.shih@mediatek.com>
References: <Y1iF2slvSblf6bYK@makrotopia.org>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <Y1iF2slvSblf6bYK@makrotopia.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221028_013943_424556_7DECB069 
X-CRM114-Status: GOOD (  10.72  )
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

Il 26/10/22 02:56, Daniel Golle ha scritto:
> According to MT7622 Reference Manual for Development Board v1.0 the PWM
> unit found in the MT7622 SoC also comes with the PWM_CK_26M_SEL register
> at offset 0x210 just like other modern MediaTek ARM64 SoCs.
> And also MT7622 sets that register to 0x00000001 on reset which is
> described as 'Select 26M fix CLK as BCLK' in the datasheet.
> Hence set has_ck_26m_sel to true also for MT7622 which results in the
> driver writing 0 to the PWM_CK_26M_SEL register which is described as
> 'Select bus CLK as BCLK'.
> 
> Fixes: 0c0ead76235db0 ("pwm: mediatek: Always use bus clock")
> Signed-off-by: Daniel Golle <daniel@makrotopia.org>

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>



