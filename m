Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BD647C433EF
	for <linux-mediatek@archiver.kernel.org>; Mon, 27 Jun 2022 12:21:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=x7a5QfCOtYoXx48RnAoEGYGhw1vq+Xzmv7b3zvJp3mE=; b=CilifX4YnrG3QUFhf+WnKctGqc
	mpeUF0i6mE42ngR1Zdz+eJJn7SQy+kQ1jsRQbS8nOXElMn8jHmfDnE0E/c1Aw9QXawrWSXaRtHjIW
	SVIxQpPEbxci9IzdywJgEEu3D/5kXRT/YFJMkaELFEmotRWHO0YEFa4c1L/Qo8Wc3jJ6KvV+rqYYO
	MrcawWkSG/1/wMBBuZoqIfRYwGmlM1g69COOr/VLQW3mVW0jbNQT0ffEw1zp3Oj5D5SGYUWYEraaB
	Wv5n6M6B5/JiCpOGRROWL/hns0+ZTbI5HFzPaNv6RoejeD4EyzmWHiMbTv+HBx/ywqUzXhVyFnq8U
	8qyG+tJw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o5nkK-000pVZ-A2; Mon, 27 Jun 2022 12:21:40 +0000
Received: from madras.collabora.co.uk ([46.235.227.172])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o5nkH-000pU7-W4
	for linux-mediatek@lists.infradead.org; Mon, 27 Jun 2022 12:21:39 +0000
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id 9B4436601692;
	Mon, 27 Jun 2022 13:21:31 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1656332493;
	bh=ll0AAC70x8gIRC6X3Ln5rb75u7PNOK8G5e/4cbb1H7Q=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=E5DvMsjZKeokPps3T1LLq3BO8IrN/6THedJeI7NQ4Y8RzSCr2oNpB9rZnTw9DtlBm
	 hxNAzRT42jeBiiZ2Kn6OGjIJ1/1eAccJoMcR8RQ5RHq3CgyAiMLtnGtB4YkDL+2RgK
	 LEluaH6g5rKybr06kpR5wfXEGHlC2/ME7o5LjYqTNdfP62TB9eNZa2AH4yU6ra0/66
	 o28fiJDd4AR8MsuQ/zJgSI6eP9/ExbbQUbkNndMwiI1Yza+Mrr8RoOJCinBc3EPpxA
	 6GnIHI1waCh9u58x86fvtYcvIr7dOQ2us6rxvFx7x9Y/6sF1rfclcUPUkzl95PZJTz
	 w2jji8YwZvZhg==
Message-ID: <cc003570-31a6-61d8-1432-fb77d5f0f109@collabora.com>
Date: Mon, 27 Jun 2022 14:21:28 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Subject: Re: [PATCH v3] Bluetooth: btmtksdio: Add in-band wakeup support
Content-Language: en-US
To: sean.wang@mediatek.com, marcel@holtmann.org, johan.hedberg@gmail.com
Cc: Soul.Huang@mediatek.com, YN.Chen@mediatek.com, Leon.Yen@mediatek.com,
 Eric-SY.Chang@mediatek.com, Deren.Wu@mediatek.com, km.lin@mediatek.com,
 robin.chiu@mediatek.com, Eddie.Chen@mediatek.com, ch.yeh@mediatek.com,
 posh.sun@mediatek.com, ted.huang@mediatek.com, Eric.Liang@mediatek.com,
 Stella.Chang@mediatek.com, Tom.Chou@mediatek.com, steve.lee@mediatek.com,
 jsiuda@google.com, frankgor@google.com, abhishekpandit@google.com,
 michaelfsun@google.com, mcchou@chromium.org, shawnku@google.com,
 linux-bluetooth@vger.kernel.org, linux-mediatek@lists.infradead.org,
 linux-kernel@vger.kernel.org, Yake Yang <yake.yang@mediatek.com>
References: <848d3d5baf23eb78411a9672b8973ae3c593db98.1656285304.git.objelf@gmail.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <848d3d5baf23eb78411a9672b8973ae3c593db98.1656285304.git.objelf@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220627_052138_297754_721F7207 
X-CRM114-Status: UNSURE (   7.35  )
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

Il 27/06/22 01:27, sean.wang@mediatek.com ha scritto:
> From: Sean Wang <sean.wang@mediatek.com>
> 
> Commit ce64b3e94919 ("Bluetooth: mt7921s: Support wake on bluetooth")
> adds the wake on bluethooth via a dedicated GPIO.
> 
> Extend the wake-on-bluetooth to use the SDIO DAT1 pin (in-band wakeup),
> when supported by the SDIO host driver.
> 
> Co-developed-by: Yake Yang <yake.yang@mediatek.com>
> Signed-off-by: Yake Yang <yake.yang@mediatek.com>
> Signed-off-by: Sean Wang <sean.wang@mediatek.com>

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>


