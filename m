Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C28F4C54E49
	for <linux-mediatek@archiver.kernel.org>; Thu,  7 Mar 2024 10:33:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=CiuFY13fgixWUbPKp5/6RtABKC3h9yvYyVmqJiK8CNU=; b=ZkXlCTrEm4GJhJRYmBiwxnmQMg
	TyqFX0XWMmJ760btpcTRiYUPgAAyHbgmHu64bUAwHlIyOFRONDvZMZyZsg5a+jezeD6ZVFo2p08pD
	F/XnkmZY411MrYIAUOfFnqUFcLdUx7L3pVhW3P6ZHWWFTJRN4fTxUITJPt4h+BLChUuiFSOShv3y+
	suKu4nF7p95mZaG8h6hQOGq6QASeQep38SpAYN7lI02bJyC/Iw9Esav5/Re1bBMzzScswt/XpvJI2
	CzXm+wTLS2XaUPZUzRVKqRoCAA9cpyZhSikzYrDBdzRkRqKyTuEabkDyzZOacMdRZ1kZNnv9cuWAF
	riEnvnmA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1riB3v-000000046Lb-0sF3;
	Thu, 07 Mar 2024 10:33:19 +0000
Received: from madrid.collaboradmins.com ([2a00:1098:ed:100::25])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1riB3m-000000046FN-1WtQ;
	Thu, 07 Mar 2024 10:33:12 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1709807589;
	bh=L8L1t6vR3+FIcUH9lsp8UHwMW9LCHOizjMz2kHHqd/k=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=NwAQ1Wvm8vG6dt/M8t5FWhxZwSttfRhLhkS3Daza1zhVkAgyqxNE8iJmqh9ncTuut
	 yXTY7y66lAviwCcFPbTw8cBq2QTJpCAS/HWCZ/owCEhs7aPTGlZdm2gUiXFSICyYxU
	 91QqJRDcxtEwoPRndoNYMyI7NZs64C1FUG1cu2Z5kemIJT5StYPxW1W1+NIsLcZZdM
	 9Gu7lgMqP0XrQTxGa/YSPWLyVRHRbcxGiH7oon/RGNOYJCu8f2DPlsV3WenHukFUb1
	 Dlr8F/lD5K/lfceDEF9ZmqH4bQjd+PdXNKVEgTNRm8VqlNR+fhN6JaHiPl9AAatlNz
	 RmCRDsonNg+sA==
Received: from [100.113.186.2] (cola.collaboradmins.com [195.201.22.229])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madrid.collaboradmins.com (Postfix) with ESMTPSA id 4489637820E9;
	Thu,  7 Mar 2024 10:33:08 +0000 (UTC)
Message-ID: <54d746b5-a27b-4076-98cf-51c887741c68@collabora.com>
Date: Thu, 7 Mar 2024 11:33:07 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 3/4] soc: mediatek: mtk-cmdq: Add cmdq_pkt_poll_addr()
 function
Content-Language: en-US
To: "Jason-JH.Lin" <jason-jh.lin@mediatek.com>,
 Jassi Brar <jassisinghbrar@gmail.com>,
 Chun-Kuang Hu <chunkuang.hu@kernel.org>,
 Matthias Brugger <matthias.bgg@gmail.com>
Cc: Jason-ch Chen <jason-ch.chen@mediatek.com>,
 Singo Chang <singo.chang@mediatek.com>, Nancy Lin <nancy.lin@mediatek.com>,
 Shawn Sung <shawn.sung@mediatek.com>, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 Project_Global_Chrome_Upstream_Group@mediatek.com
References: <20240307013458.23550-1-jason-jh.lin@mediatek.com>
 <20240307013458.23550-4-jason-jh.lin@mediatek.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <20240307013458.23550-4-jason-jh.lin@mediatek.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240307_023310_628477_0533028C 
X-CRM114-Status: GOOD (  10.37  )
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

Il 07/03/24 02:34, Jason-JH.Lin ha scritto:
> Add cmdq_pkt_poll_addr function to support CMDQ user making
> an instruction for polling a specific address of hardware rigster
> to check the value with or without mask.
> 
> POLL is a legacy operation in GCE, so it does not support SPR and
> CMDQ_CODE_LOGIC. To support polling the register address which doesn't
> have the subsys id, CMDQ users need to make an instruction with GPR and
> CMDQ_CODE_MASK operation to move the register address to be poll into GPR.
> Then users can make an POLL instruction with GPR to poll the register
> address assigned in previous instruction.
> 
> Signed-off-by: Jason-JH.Lin <jason-jh.lin@mediatek.com>

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>



