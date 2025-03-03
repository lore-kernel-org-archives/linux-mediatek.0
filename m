Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7DC4AC282C5
	for <linux-mediatek@archiver.kernel.org>; Mon,  3 Mar 2025 11:15:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=RPGnmeWL+7UF8OC+JRI2RVs/wNVcvSMaUsG5u09eK60=; b=je5mPzG5gn3nhEJ8A/8ykT/bW4
	DkW7lq5v2wUvBHNIEHFsWJflufdayYll0KZVVMst5sZ7zw0j2UNFN/qVx+cYqlO7ZbSYjg+rjo0h7
	hDoj2u+/ZJRSC1Pq+Vi5newkG3HGkxkFdAkXkME4NXDH0xqGNC9yVZf17cpoiygS0Qo5QuzeQKfsq
	4jUys9jeduDTxyPeMZrd/iAC6FlCKegPEN2ZRSbwDrtB2YfMAotDFzk4cc9dWfG4U2aEc5LnMYR4t
	jOa1GMwY1qC50NaLR7WdHMsTcZw8ffDR95c2m3QdrioqWMW3jwU60KGs2syNR+IcMoE7kzUG1DvLB
	x4JpeeqQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tp3lE-00000000V8e-2Qov;
	Mon, 03 Mar 2025 11:15:00 +0000
Received: from bali.collaboradmins.com ([2a01:4f8:201:9162::2])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tp3dY-00000000SdV-3pHB;
	Mon, 03 Mar 2025 11:07:06 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1741000023;
	bh=G4hUql/r+AOpKgzvOwOid63ZNjiK3cqKnq3PjI+Um0w=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=SQSdbgHf01wJIx6zi4vp7QuOMMVrlLciGvtFzuZKOTM2dVinlHfqCp3tU7RSAl9KU
	 6vSUJ7fyPHcCPdiVcyi+A2eV79xnjuufeGn73YzkRkA+QtN3zSbfgrekNqmTFV/zaM
	 ZPaXp+hpz96Dq4bD/Ejfu7mFmj8FGUKhgBGB53g77BUs7QHTqfQWCpUpuFq1cOyKCq
	 2hm8Pl8gJBpuuBAY5R58WsmbWJqUlSEJgyZFTKDu0VwbNj+Ot/rl1jdKnzv7IK/buH
	 QEHqkY1x/6PDlF5EmnJ7v78gzo2S1blvrBFyE9Xikup3bJVMy2pYgfxRj2uTDY0JKw
	 qtLZ0XG4yiAHQ==
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 14FD617E068F;
	Mon,  3 Mar 2025 12:07:01 +0100 (CET)
Message-ID: <dac1dae7-55eb-45a5-903f-afb71320361b@collabora.com>
Date: Mon, 3 Mar 2025 12:07:01 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 13/20] ASoC: mediatek: mt6359-accdet: Make PWM debounce
 settings internal
To: =?UTF-8?B?TsOtY29sYXMgRi4gUi4gQS4gUHJhZG8=?= <nfraprado@collabora.com>,
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Matthias Brugger
 <matthias.bgg@gmail.com>, Sen Chu <sen.chu@mediatek.com>,
 Sean Wang <sean.wang@mediatek.com>, Macpaul Lin <macpaul.lin@mediatek.com>,
 Lee Jones <lee@kernel.org>, Jaroslav Kysela <perex@perex.cz>,
 Takashi Iwai <tiwai@suse.com>, Catalin Marinas <catalin.marinas@arm.com>,
 Will Deacon <will@kernel.org>
Cc: kernel@collabora.com, linux-sound@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 linux-pm@vger.kernel.org
References: <20250302-mt6359-accdet-dts-v2-0-5bd633ee0d47@collabora.com>
 <20250302-mt6359-accdet-dts-v2-13-5bd633ee0d47@collabora.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <20250302-mt6359-accdet-dts-v2-13-5bd633ee0d47@collabora.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250303_030705_094799_C08C450A 
X-CRM114-Status: UNSURE (   9.87  )
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

Il 02/03/25 17:30, Nícolas F. R. A. Prado ha scritto:
> Instead of reading a bunch of PWM debounce settings from the Devicetree,
> set reasonable values inside the driver that are known to work across
> multiple boards. There are no current users of these DT properties, so
> no backward compatibility needs to be maintained. The properties can be
> properly introduced in the binding in the future if different boards
> really need to override them.
> 
> Signed-off-by: Nícolas F. R. A. Prado <nfraprado@collabora.com>

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>



