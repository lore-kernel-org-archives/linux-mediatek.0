Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9ADD3EDB7CA
	for <linux-mediatek@archiver.kernel.org>; Tue,  7 Apr 2026 07:26:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=uNskSbdvu6jFrA/u8elybDz1SG9TWXPXirXnKe3aEt8=; b=VmAkVU+zi6jiBmTOg53qDI/cLL
	9Y6v6lRHUKbGoVGTooepKTJXLv9HJhMvB74F27jmTTYzEx48yPms7ry2kr8Y6LRASIqXDRHLlwmBd
	aE6lQynm8LhtP6eMRxLxL0BS2J4CnIStIevR5dc/0KfszoV+eJN9/XiFiQpXHAE3tPDSPkXW5ya7N
	rjvv8Zf8xm7ZpLlWyd5zBzq19xndtdLblzOcVShFtRhzs4V15/MNMjFLBhiSMowvIYB5yacxpepQi
	KOhi5Pnbp7VCo36U/lwOoTdC2Z+OGFDE0YRuYyr8Bkyi7FR0YP9iNk1wxB2viQG4fdnhlPWpLCNCH
	TKy6Y2LQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wA0pW-000000064Bd-1duf;
	Tue, 07 Apr 2026 07:26:34 +0000
Received: from mailgw.kylinos.cn ([124.126.103.232])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wA0pT-000000064Av-09mv
	for linux-mediatek@lists.infradead.org;
	Tue, 07 Apr 2026 07:26:33 +0000
X-UUID: 15288c4a325311f1aa26b74ffac11d73-20260407
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.12,REQID:53894c7f-3703-429d-8003-cd38803bdc3f,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:e7bac3a,CLOUDID:d08578642a4a2fcd9191a12797752f6e,BulkI
	D:nil,BulkQuantity:0,Recheck:0,SF:80|81|82|83|102|898,TC:nil,Content:0|15|
	52,EDM:-3,IP:nil,URL:0,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0
	,OSA:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: 15288c4a325311f1aa26b74ffac11d73-20260407
X-User: xiaopei01@kylinos.cn
Received: from [10.42.12.251] [(10.44.16.150)] by mailgw.kylinos.cn
	(envelope-from <xiaopei01@kylinos.cn>)
	(Generic MTA with TLSv1.3 TLS_AES_128_GCM_SHA256 128/128)
	with ESMTP id 1313178304; Tue, 07 Apr 2026 15:26:24 +0800
Message-ID: <3cf2a965-27f4-40e2-99ad-0b386fbc8831@kylinos.cn>
Date: Tue, 7 Apr 2026 15:26:22 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/4] spi: mtk-snfi: unregister ECC engine on probe failure
 and remove() callback
To: Mark Brown <broonie@kernel.org>
Cc: gch981213@gmail.com, linux-spi@vger.kernel.org,
 linux-mediatek@lists.infradead.org
References: <cover.1775273351.git.xiaopei01@kylinos.cn>
 <09ac1024a0f1626efaa47ceefc5cfb8ee5dd9418.1775273351.git.xiaopei01@kylinos.cn>
 <d4871bdf-15bf-4491-be5c-5b38a065d810@sirena.org.uk>
From: Pei Xiao <xiaopei01@kylinos.cn>
In-Reply-To: <d4871bdf-15bf-4491-be5c-5b38a065d810@sirena.org.uk>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260407_002631_416761_F2345172 
X-CRM114-Status: UNSURE (   8.94  )
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



在 2026/4/6 20:53, Mark Brown 写道:
> On Sat, Apr 04, 2026 at 11:44:58AM +0800, Pei Xiao wrote:
> 
>> +	ret = devm_add_action_or_reset(&pdev->dev, mtk_unregister_ecc_engine,
>> +				       &ms->ecc_eng);
>> +	if (ret) {
>> +		dev_err(&pdev->dev, ret, "failed to add ECC unregister action\n");
>> +		goto release_ecc;
>> +	}
> 
> This should either be dev_err(), in which case ret is not a format
> string and this is buggy (I'm surprised it compiles without warnings...)
> or it should be dev_err_probe() in which case the arguments are correct.
ok, thanks a lot, from a person make bug.
I will send v2.

Pei.
> The latter is a little better, though it's unlikely to make a practical
> difference here.


