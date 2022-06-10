Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 99863C43334
	for <linux-mediatek@archiver.kernel.org>; Fri, 10 Jun 2022 10:36:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=oS1hRauaCsmd8xc+vofv6n/2ZAJPyqcOh4R66i/oPRs=; b=IZrLHO4IuiGS4U
	Grg9epo8+irqcUxOUBOxgkPj0t+HdPxDEYi9GmYeKhEi1ITte5oCcjF0ERw+0gKgh9i/WnUD3iAPb
	F29VhFqkv4/pQUn3keubZZZLm/2Sg9x1472/GXbBUSpQJLwBOAZFw0mNdfkegL1o5elA0sNil0L0L
	PYSLGcbIml3Hzs28I945YbuRxUHRGKGjfDw1pckCQoCWktJjXWz96N7Gqx5+RbIvYobdxL7GrTse4
	qnKwfNXiSD7dZ1XJeXYS6pZfbcowFeIL2W5cZb7O3zPGH/nvRD+1PcZOjQAirIEOdPXaNvOFwO9RL
	JR4UGZUv5OrDvbqGiDPQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nzc0N-007cOG-LB; Fri, 10 Jun 2022 10:36:39 +0000
Received: from madras.collabora.co.uk ([2a00:1098:0:82:1000:25:2eeb:e5ab])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nzbzz-007cJ0-2Y; Fri, 10 Jun 2022 10:36:16 +0000
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id 7C57C660173C;
	Fri, 10 Jun 2022 11:36:13 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1654857373;
	bh=Sl4XTI9fTeLYEGMYtkmUrZfpXPFc4NtB7yxUPzBz5P0=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=l3ooxUPnGPn7Wg1eAjlIfW0TigLrxkwaU37Ktz7fJpNpqghDtPC5QhreI3Y7iqTQ2
	 MQPMroHxVHkXOjRidl5LfRlIQzKyEM0XDKJON1ntm5FwoBIilEzans4bR3Exy8MQ+y
	 +2tpmDDVI7y+gBECo6irvnSAsmYvzMAlmiuJIlYQi+p6bAX6YBLmKDg1PDEM/M63Fu
	 ETynncpDInuWfW/lQqrW1AmR/Kqt4XLKUx0T4+OMk3zGEnSqaSZ/ZdeHJIQo2L4KJh
	 mMiyg5wqy3ZCrL4xZo3TpTPHxGgJnBmCWu8F28UOnlhH6tvyPzkH+zfnclsLfiohbh
	 ORITjCwV0iR7A==
Message-ID: <63e171dc-e1f6-3487-66c4-a5cf36d2471b@collabora.com>
Date: Fri, 10 Jun 2022 12:36:11 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.0
Subject: Re: [PATCH 1/3] usb: mtu3: sync interrupt before unbind the udc
Content-Language: en-US
To: Chunfeng Yun <chunfeng.yun@mediatek.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Matthias Brugger <matthias.bgg@gmail.com>, linux-usb@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 linux-kernel@vger.kernel.org, Eddie Hung <eddie.hung@mediatek.com>
References: <20220609074233.15532-1-chunfeng.yun@mediatek.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <20220609074233.15532-1-chunfeng.yun@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220610_033615_296197_F272D74A 
X-CRM114-Status: UNSURE (   7.05  )
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Il 09/06/22 09:42, Chunfeng Yun ha scritto:
> Register gadget irq to avoid the interrupt handler is occurred
> or scheduled during the unbind flow, may happen when do android
> function switch stress test.
> 
> Signed-off-by: Chunfeng Yun <chunfeng.yun@mediatek.com>

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
