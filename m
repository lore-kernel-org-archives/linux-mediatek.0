Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8EBE3C43458
	for <linux-mediatek@archiver.kernel.org>; Thu,  2 Jul 2026 08:22:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=i07GUu6cLZiRMg+KpKsbgcQqGtHU6wKn9pZZaj1EafY=; b=dcZY1m1gVCbOkn1lp45wwzCq+V
	VktTyPY7KDOiA4sWMk8Fcq0Vwsu7y7qSuthUn7ux1iEPGUMB7fikgsdkF+ZSp4YXrUZtpVfKx9XYk
	eyq+CIGurRqla36oW1BSlJ7eLERl84MxaS5pU2OMBuBYZDdIUI9L5MHn9jd2OB9A6aODEPR7O74VE
	5uCc6aiLq4Pbx0brD6TfzrKse0NX7ku8YFYLMgNcqQuFAGxqD00dx+gBpSkR9864Z30oQMZ8sSB00
	G4qfO4Y3pLB1pSXznWGQxTs/BzDeAY6VzQlM1F2GTMDQDXVBPiSOYn9ph+F9lOH7tElYb6+deWC6M
	jpdlyhBw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wfCgN-00000003qVx-3ARk;
	Thu, 02 Jul 2026 08:22:03 +0000
Received: from bali.collaboradmins.com ([2a01:4f8:201:9162::2])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wfCgL-00000003qRt-1NYv;
	Thu, 02 Jul 2026 08:22:02 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1782980519;
	bh=SdqZifpTME4P22Rm/5g9MNYujks2ExaR7a48hkpIJro=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=n5kSsWaziA4wYy9eg1SkTnkPsFwzss2nhBTUTVLS+eB5n+eTv0q/6BjhoK9hnBVSj
	 hXmpn1MDV+VEmPZQKfrTVLlVJzCzlEcTVHpMlA99R6cpBXDABpKnZiQsMYUkW9pOwL
	 28hLLXCvB/CHqPa67Yimua34P0n8xxdA3CcVCjvxMLLFPBLdd6U0FfCkFv/oCa6Tq8
	 Dr+6Wf5PT21tnILYGJDRb7cxVCI6/m/6wnkjyDRrFTBzy2ET2PU15MyNbQmdzTFBQ6
	 2j7CyUF88LrFJFf+VxTG6kvIwE6jzdT5puB8eP/ZQXvFO5H8T8r64aa8hOueyBBfQr
	 BHmK4guGikP1A==
Received: from [100.64.1.21] (unknown [100.64.1.21])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id A8C2D17E00A0;
	Thu,  2 Jul 2026 10:21:58 +0200 (CEST)
Message-ID: <d740db6f-10f7-4531-98cc-33251a01b9ad@collabora.com>
Date: Thu, 2 Jul 2026 10:21:58 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] dmaengine: mediatek: mtk-uart-apdma: Return -ENOMEM on
 memory allocation failure
To: Vladimir Zapolskiy <vz@kernel.org>, Sean Wang <sean.wang@mediatek.com>,
 Matthias Brugger <matthias.bgg@gmail.com>, Vinod Koul <vkoul@kernel.org>,
 Frank Li <Frank.Li@kernel.org>
Cc: Long Cheng <long.cheng@mediatek.com>, dmaengine@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org
References: <20260701200703.117929-1-vz@kernel.org>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <20260701200703.117929-1-vz@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260702_012201_525113_06D89B98 
X-CRM114-Status: UNSURE (   6.78  )
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

On 7/1/26 22:07, Vladimir Zapolskiy wrote:
> If dynamic memory allocation in driver's probe function execution fails, it
> should be reported to the driver's framework with -ENOMEM error code.
> 
> Fixes: 9135408c3ace ("dmaengine: mediatek: Add MediaTek UART APDMA support")
> Signed-off-by: Vladimir Zapolskiy <vz@kernel.org>

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>


