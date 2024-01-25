Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A7392C47258
	for <linux-mediatek@archiver.kernel.org>; Thu, 25 Jan 2024 14:23:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=RRqCcXiSlKmuLlXjHq2xkRqOBSBAmFOAmLSO9TMQ+pY=; b=aqwLwq5VZp9ieCvuU95WvhY5go
	/XIRjRR/zJNeZJu273v3HK6O1EgE1OJYOBmpJKNeY4jhXEELeZ7liDZnwLKmEUVYv8ms2Err3IU+g
	UR4YxskrmhZRtqOLSz/CXWyBBkYZk+XqLEnRsmWoI122mhUcb6W2UkPpeZcdEPvAocGmQ8ryaG+ky
	bHZopTCv09a/WaX2NdSpB+IUhNInioBMpAw7PMydpQpACxol3rUQCI6bgA7GEEHTWW0ZXQ1dB1AXF
	vRRkAT/9wj7OOdfojtJuk6kvn6AcY0X3y9syqc7W4ZLHm6MkEGTptE6ShEnxKTArykwdtl+SuwMFM
	51AGG8IQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rT0dr-00000000MJ6-0eNA;
	Thu, 25 Jan 2024 14:23:43 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rT0dp-00000000MIK-0WhW;
	Thu, 25 Jan 2024 14:23:41 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=RRqCcXiSlKmuLlXjHq2xkRqOBSBAmFOAmLSO9TMQ+pY=; b=BaGrpGzVGimYdWoPbx0jhml8NA
	iW2/doP5JwtNSrheNn5q+DI/KIn9qK3lu5HphvTIeY0DX/rEHLUGW6Hn2X67txP4q54uSjLxv2fVe
	aTpjId/4G3Qj2PVq2zBSYAVSlX+hOHcd+uaKsmeA4Ig9pbbz3QIsBiWRaj1pLYHWZvJVCcU2dIHhJ
	bjQEYqzqXasn3SsmfSB6Bn23cAiq/qek/4ankOk+AHjrPGbM4CBXJpGbqAToy66/wOrqvTM2vqGBT
	NLotJv5rla3KgYfiPuX3+7aJPpPt8fcVoYlsL48y4k/BS53NWMycGm5IbBks6+e3vIofokz9IiEcN
	XS2fd2yQ==;
Received: from madrid.collaboradmins.com ([46.235.227.194])
	by desiato.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rSxsv-00000005Bas-1JCn;
	Thu, 25 Jan 2024 11:27:07 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1706181964;
	bh=9G80+GECq48W/Xf3HqDt+OaUbZB2584sod+5BUxsKtA=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=R7vBpMqOde3jaA3fHeVBIjCbpc8fyuXilcUd5xGS0IZ/dbgb2ZCzuuwC7pKvopoPA
	 Wf5UQY9Z0ZKz4dOyIuqGzixN32gZ4r26SEZeBwAUM9A8aJXv98nHlCYQze/aP0hbVm
	 7gD6OHQeys6HZemTmmuJ10TAeMbpC7VJzGBeZC4ncjFPsUN2sLh/Ke03GqG+G9fU2C
	 qI2dkn5FClunBpsA9YTphh03d2aSMl61HTEmzrNmDWLBouCOiH9HQH/zFSQR79s/Sn
	 Mio1LzhFF9+t+mu4bGU7xVMna8mlxitkFrkfa8caNTkfoifNLw3Mt4UDwdv1AZnY/Z
	 mFjaxIbm+1rSw==
Received: from [100.113.186.2] (cola.collaboradmins.com [195.201.22.229])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madrid.collaboradmins.com (Postfix) with ESMTPSA id A96653781182;
	Thu, 25 Jan 2024 11:26:03 +0000 (UTC)
Message-ID: <9f910e07-6af9-45e2-ab02-d3467e650623@collabora.com>
Date: Thu, 25 Jan 2024 12:26:03 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] pwm: mediatek: Update kernel doc for struct
 pwm_mediatek_of_data
Content-Language: en-US
To: =?UTF-8?Q?Uwe_Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>,
 Matthias Brugger <matthias.bgg@gmail.com>, Sam Shih <sam.shih@mediatek.com>,
 Thierry Reding <thierry.reding@gmail.com>, Ryder Lee <ryder.lee@mediatek.com>
Cc: linux-pwm@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, kernel@pengutronix.de
References: <20240125085649.1571268-2-u.kleine-koenig@pengutronix.de>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <20240125085649.1571268-2-u.kleine-koenig@pengutronix.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240125_112705_622709_D01CDA0F 
X-CRM114-Status: UNSURE (   6.84  )
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

Il 25/01/24 09:56, Uwe Kleine-König ha scritto:
> The struct never had a member called clk_freq. This fixes the W=1
> warning:
> 
> 	drivers/pwm/pwm-mediatek.c:60: warning: Excess struct member 'clk_freq' description in 'pwm_mediatek_chip'
> 
> Fixes: efecdeb82f21 ("pwm: mediatek: Allocate the clks array dynamically")
> Signed-off-by: Uwe Kleine-König <u.kleine-koenig@pengutronix.de>

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>


