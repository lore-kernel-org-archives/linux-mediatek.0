Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 00FE8C4332F
	for <linux-mediatek@archiver.kernel.org>; Tue, 22 Nov 2022 09:24:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=prK8j/Qz6Zju1CxHid9bqwh58Iokzgng+YGFU1j7xEM=; b=gup/3v810f3sRHrM+7YR88+KhI
	yDDA9YZL/FrugI/XXCvD09X4TeWSbzBfp2eHnqo/EuCu1D69LRCj2RiNnF9vA04wLiZ9fdG1667jI
	crDo7hLKYTgi72qI4F2TWZzJRB8m/LWz4jq8+gWKHJKxKHAc9c/NbhVD5LJwMBw5u99kEkqmMNu+x
	Unr2CAnuf6FD9ztEHyCcbk7di9b1niONvuKpDsfGAQHQmrxvvRkQBsCvdyAyVpIQZzQjEzN3BGHJU
	IRcGKcOtmNCtjHHBGKuxas5x0hr8GmesgWLLpeUI2b32mILosGUoH34Svs0+nnOlTCUCEjxPBFbi0
	WrwKPBzg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oxPVq-006xJS-5a; Tue, 22 Nov 2022 09:24:18 +0000
Received: from madras.collabora.co.uk ([2a00:1098:0:82:1000:25:2eeb:e5ab])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oxPUq-006wai-CT; Tue, 22 Nov 2022 09:23:18 +0000
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id B95126602AC7;
	Tue, 22 Nov 2022 09:23:13 +0000 (GMT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1669108994;
	bh=+mlBG/PJoJUc9mB4Fvqa/9O1jnPv1xX0SkB4mOqIHso=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=oATMFKxm8m+2BgI44UwSDJAtyNhdFHigDVbG6Z/9SiyBYFGV3ZSsbTLtST5gWh4KS
	 WJBQZWAGGa15Wiouudki0IYlWOUr+2EMIMnTehAUHfNbLwtF+sLHKydXIjqxCUz0AU
	 LuMRfxHk7vmryAUL9TDH1bxQDN8kjiY3HKNWtUu4CjarTpgLJ2tq8+RycPBNTjCLuy
	 PBnTp5ozH8QzSoabVMpb2uQqPng+rhyMbWe7oP8MxvyyQGyDwxugiijioK/ssdQRYx
	 q8cLwz48saX8Ksw857B93cNidbMc2/zl9LtpiF5RnE1QzdeoCkggEj5A96UEpZx51M
	 nfOBhknwD4Q5g==
Message-ID: <a176dc88-add7-7ce2-16c8-2bd7c6821399@collabora.com>
Date: Tue, 22 Nov 2022 10:23:11 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.0
Subject: Re: [PATCH v1 1/1] pinctrl: meditatek: Startup with the IRQs disabled
Content-Language: en-US
To: Ricardo Ribalda <ribalda@chromium.org>,
 Linus Walleij <linus.walleij@linaro.org>,
 Matthias Brugger <matthias.bgg@gmail.com>, Sean Wang <sean.wang@kernel.org>
Cc: Steven Rostedt <rostedt@goodmis.org>, Ross Zwisler <zwisler@kernel.org>,
 linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 Sergey Senozhatsky <senozhatsky@chromium.org>,
 "Joel Fernandes (Google)" <joel@joelfernandes.org>
References: <20221122-mtk-pinctrl-v1-0-bedf5655a3d2@chromium.org>
 <20221122-mtk-pinctrl-v1-1-bedf5655a3d2@chromium.org>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <20221122-mtk-pinctrl-v1-1-bedf5655a3d2@chromium.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221122_012316_631766_E18B291A 
X-CRM114-Status: GOOD (  11.01  )
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

Il 22/11/22 00:38, Ricardo Ribalda ha scritto:
> If the system is restarted via kexec(), the peripherals do not start
> with a known state.
> 
> If the previous system had enabled an IRQs we will receive unexected
> IRQs that can lock the system.
> 
> [   28.109251] watchdog: BUG: soft lockup - CPU#0 stuck for 26s!
> [swapper/0:0]
> [   28.109263] Modules linked in:
> [   28.109273] CPU: 0 PID: 0 Comm: swapper/0 Not tainted
> 5.15.79-14458-g4b9edf7b1ac6 #1 9f2e76613148af94acccd64c609a552fb4b4354b
> [   28.109284] Hardware name: Google Elm (DT)
> [   28.109290] pstate: 40400005 (nZcv daif +PAN -UAO -TCO -DIT -SSBS
> 		BTYPE=--)
> [   28.109298] pc : __do_softirq+0xa0/0x388
> [   28.109309] lr : __do_softirq+0x70/0x388
> [   28.109316] sp : ffffffc008003ee0
> [   28.109321] x29: ffffffc008003f00 x28: 000000000000000a x27:
> 0000000000000080
> [   28.109334] x26: 0000000000000001 x25: ffffffefa7b350c0 x24:
> ffffffefa7b47480
> [   28.109346] x23: ffffffefa7b3d000 x22: 0000000000000000 x21:
> ffffffefa7b0fa40
> [   28.109358] x20: ffffffefa7b005b0 x19: ffffffefa7b47480 x18:
> 0000000000065b6b
> [   28.109370] x17: ffffffefa749c8b0 x16: 000000000000018c x15:
> 00000000000001b8
> [   28.109382] x14: 00000000000d3b6b x13: 0000000000000006 x12:
> 0000000000057e91
> [   28.109394] x11: 0000000000000000 x10: 0000000000000000 x9 :
> ffffffefa7b47480
> [   28.109406] x8 : 00000000000000e0 x7 : 000000000f424000 x6 :
> 0000000000000000
> [   28.109418] x5 : ffffffefa7dfaca0 x4 : ffffffefa7dfadf0 x3 :
> 000000000000000f
> [   28.109429] x2 : 0000000000000000 x1 : 0000000000000100 x0 :
> 0000000001ac65c5
> [   28.109441] Call trace:
> [   28.109447]  __do_softirq+0xa0/0x388
> [   28.109454]  irq_exit+0xc0/0xe0
> [   28.109464]  handle_domain_irq+0x68/0x90
> [   28.109473]  gic_handle_irq+0xac/0xf0
> [   28.109480]  call_on_irq_stack+0x28/0x50
> [   28.109488]  do_interrupt_handler+0x44/0x58
> [   28.109496]  el1_interrupt+0x30/0x58
> [   28.109506]  el1h_64_irq_handler+0x18/0x24
> [   28.109512]  el1h_64_irq+0x7c/0x80
> [   28.109519]  arch_local_irq_enable+0xc/0x18
> [   28.109529]  default_idle_call+0x40/0x140
> [   28.109539]  do_idle+0x108/0x290
> [   28.109547]  cpu_startup_entry+0x2c/0x30
> [   28.109554]  rest_init+0xe8/0xf8
> [   28.109562]  arch_call_rest_init+0x18/0x24
> [   28.109571]  start_kernel+0x338/0x42c
> [   28.109578]  __primary_switched+0xbc/0xc4
> [   28.109588] Kernel panic - not syncing: softlockup: hung tasks
> 
> Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>



