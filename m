Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C5BC7C433FE
	for <linux-mediatek@archiver.kernel.org>; Tue, 29 Nov 2022 15:01:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=cg298UtuBKEW8dtLffGFA7yJh4sdMXnD5PB5fcFqies=; b=JvjyAzIqN9txGdCbWRvXI9wjx1
	XWohhMo2eX3vT4/gXY/3GBt108QdtXCNhnzXEVq96fwG3Iew5sJ9gBOdrrytnwbPE5nBKNjcx3lA5
	SRUItGs8ZFQknc8oAwTfLUzZ4jMUKoSdo+YHEbQSuc+Q6YybGibI24qKtUcUP7v+r9mVUX+OyVowP
	SbyEhbFuWLknTpQcD+hzOWbSEyD29ZQuqNNWbMC3Ks4ZegufZP44s7WPP7DT13ARaMOxFeCvJBdgY
	h+tx/gqsB9idK9OE/pW4FnzHm95J6j2vPC2884T5QZgscjaNcVFikCbh21UNq0rVCPJnr1QvCJf+W
	T/+7v6wg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p026s-009XGv-Ai; Tue, 29 Nov 2022 15:01:22 +0000
Received: from madras.collabora.co.uk ([46.235.227.172])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p026d-009X5i-Le
	for linux-mediatek@lists.infradead.org; Tue, 29 Nov 2022 15:01:10 +0000
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id 3CB826602B14;
	Tue, 29 Nov 2022 15:01:00 +0000 (GMT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1669734061;
	bh=tlzoqvO3u8C44kx2Y9u+ybzWD6r+wYvLQQmDBQC7WMI=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=YOX+dq1Vl6bi3pHyQsviCt6TMoG9ZK6WHrh8uTK/RTYzhYsASZvUIvjLIN157z6uR
	 FZN3W4kyMFX/Lcs4VFezqODebQqEWTkpjzr0l70nsjAy6S8FhIze4jqctPSpyWAosZ
	 k9Q0TJ7l6nAnD+5b5hEzn8f64rX3mSQczavXj8V/aCu+rP1qbsHPpv+D6Xb9UnACJ9
	 8RG/fB7mFakIcJlAQPsW4BN6QjoQEc6DX90C3WZrp/714KSHvDcZlOhC1pGgi0ZfIQ
	 QESVm7egzI1jfnCsmeKz8vmyP3RHMsEbGDmP6W022ef6mXgUGfSP0EKkCZbKSVgySl
	 F3cM30a9B88BA==
Message-ID: <1e8185a3-0a40-a637-7e49-79b00d95e576@collabora.com>
Date: Tue, 29 Nov 2022 16:00:57 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.0
Subject: Re: [PATCH v2 1/2] wifi: mt76: introduce reboot notifier support
Content-Language: en-US
To: Deren Wu <deren.wu@mediatek.com>, Felix Fietkau <nbd@nbd.name>,
 Lorenzo Bianconi <lorenzo@kernel.org>
Cc: Sean Wang <sean.wang@mediatek.com>, Soul Huang <Soul.Huang@mediatek.com>,
 YN Chen <YN.Chen@mediatek.com>, Leon Yen <Leon.Yen@mediatek.com>,
 Eric-SY Chang <Eric-SY.Chang@mediatek.com>, KM Lin <km.lin@mediatek.com>,
 Robin Chiu <robin.chiu@mediatek.com>, CH Yeh <ch.yeh@mediatek.com>,
 Posh Sun <posh.sun@mediatek.com>, Stella Chang <Stella.Chang@mediatek.com>,
 Evelyn Tsai <evelyn.tsai@mediatek.com>, Ryder Lee <ryder.lee@mediatek.com>,
 Shayne Chen <shayne.chen@mediatek.com>,
 linux-wireless <linux-wireless@vger.kernel.org>,
 linux-mediatek <linux-mediatek@lists.infradead.org>
References: <d44631bcc74cce3f32a72f616a99d1bd2837690f.1669711916.git.deren.wu@mediatek.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <d44631bcc74cce3f32a72f616a99d1bd2837690f.1669711916.git.deren.wu@mediatek.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221129_070108_015617_8B62FCFD 
X-CRM114-Status: GOOD (  11.72  )
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

Il 29/11/22 10:16, Deren Wu ha scritto:
> Some combinations of hosts cannnot detect wifi chip after reboot. The
> interoperability issue is caused by the status mismatch between host
> and chip fw. In such cases, the driver should stop chip activities
> and reset chip to default state before reboot.
> 
> This is a preliminary patch to add mt7921e reboot notifier support.
> 
> Reviewed-by: Shayne Chen <shayne.chen@mediatek.com>
> Signed-off-by: Deren Wu <deren.wu@mediatek.com>

If you want to perform shutdown actions when rebooting the machine, this
means that you want to perform actions when shutting down the kernel....

...so, have you tried to perform such actions in the .shutdown() callback
of your struct pci_driver? :-)

Regards,
Angelo

> ---
>   drivers/net/wireless/mediatek/mt76/mac80211.c | 21 +++++++++++++++++++
>   drivers/net/wireless/mediatek/mt76/mt76.h     |  2 ++
>   2 files changed, 23 insertions(+)
> 


