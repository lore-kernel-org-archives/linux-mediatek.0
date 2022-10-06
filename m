Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 12CACC433F5
	for <linux-mediatek@archiver.kernel.org>; Thu,  6 Oct 2022 09:31:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Km9UlQfv9u+Pi0HaqbMFuSua/coXZZ4u08s4ZSOz4zo=; b=qwVRZ1glVOK+d7eid0RY3pD42x
	1lytsK51pE01C4K1I9sOZX4nid/HhhgbDK7LZmYEbK2hu0YOpMBbY0iEQtGbPAbO2u4HdTXkhJyrZ
	042eYvIrYl7+yGwLXfjxsZX0Dm8CMO5bPDS/zz+6hRptmQJnR5uxbjUtG71davzUObiggF4IN1kAB
	QIhKIPLtG27iPWulC+Qo33NSXoBLF+oQ2KhJVOqpfW7Jje4nlBk9cVLvrHHoVv8tbJdFXqB2mTd0+
	bsa9i/JFXgnZHVvdd1UeSMu59zKjcNT5gCA/uHw0OFVQDnd2xEPvaHCRPiMZ7wkWUlJ1ST9SDjKLZ
	I8POzAzg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ogNE8-0019Fy-N9; Thu, 06 Oct 2022 09:31:36 +0000
Received: from madras.collabora.co.uk ([2a00:1098:0:82:1000:25:2eeb:e5ab])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ogNDP-0018pm-J8; Thu, 06 Oct 2022 09:30:53 +0000
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id AE2086601595;
	Thu,  6 Oct 2022 10:30:49 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1665048650;
	bh=DZafEcdio5imhGIlFetdrZR2SPXKufatKggl05kVwN8=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=T3TXFlla5OAqLTidG45otxzLLgFgUL7vK2o1YNvBgcn6GZ6qZ7qZSUWvxHk/5ec58
	 CzznJ9DXUzmbFafqfvVOeriSGvfaI8u3cHbj2EIxL4SSzXh6WU4GavD/2jWTVQ5g8c
	 V1srnsG9PCBlbU4c8RsPtqxeq6Fli38wH6gvbEUtzq3eQSnSMudB1RZBS/hLnKHYhF
	 BZRs84tP5p29RH/FsD+3/BSzPCU94nc8r7LzkkyR2jt8LxUl/kcFmWo1dg5R6QBFiz
	 UWNb9Kpr0BeHfcA0PrqPyuT9SA1m6DepfrlqMb5GXvAKKgM3pk4W5iEC7Ja6Yda5zN
	 IJWSYjjYlvN6w==
Message-ID: <294fa048-1dc0-ea52-d65b-2c6c0c48bafc@collabora.com>
Date: Thu, 6 Oct 2022 11:30:47 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.0
Subject: Re: [PATCH v9, 3/4] mailbox: mtk-cmdq: add gce ddr enable support
 flow
Content-Language: en-US
To: Yongqiang Niu <yongqiang.niu@mediatek.com>, CK Hu <ck.hu@mediatek.com>,
 Chun-Kuang Hu <chunkuang.hu@kernel.org>
Cc: Jassi Brar <jassisinghbrar@gmail.com>,
 Matthias Brugger <matthias.bgg@gmail.com>, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 Project_Global_Chrome_Upstream_Group@mediatek.com,
 Hsin-Yi Wang <hsinyi@chromium.org>
References: <20221006043456.8754-1-yongqiang.niu@mediatek.com>
 <20221006043456.8754-4-yongqiang.niu@mediatek.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <20221006043456.8754-4-yongqiang.niu@mediatek.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221006_023051_802845_3A77973B 
X-CRM114-Status: GOOD (  11.08  )
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

Il 06/10/22 06:34, Yongqiang Niu ha scritto:
> add gce ddr enable control flow when gce suspend/resume
> 
> when all cmdq instruction task has been processed done,
> we need set this gce ddr enable to disable status to tell
> cmdq hardware gce there is none task need process, and the hardware
> can go into idle mode and no access ddr anymore, then the spm can go
> into suspend.
> 
> the original issue is gce still access ddr when cmdq suspend function
> call, but there is no task run.
> so, we need control gce access ddr with this flow.
> when cmdq suspend function, there is no task need process, we can
> disable gce access ddr, to make sure system go into suspend success.
> 
> Signed-off-by: Yongqiang Niu <yongqiang.niu@mediatek.com>


I already gave you my Reviewed-by tag for this patch and here nothing has
changed from v8 to v9. Please retain tags that were given to you in these cases.

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>

