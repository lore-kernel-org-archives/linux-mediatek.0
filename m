Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A9589C54E49
	for <linux-mediatek@archiver.kernel.org>; Thu,  7 Mar 2024 10:33:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=yloVQYZfh0wE/p2XN8RCgXJxKNr2TJs8OXECFFlf4zo=; b=NE918i4YDn2yvWTht2zSfgKQLe
	1IZVx1vJCMhcjjnKrdq9J/TCHdaRJBhsEDme7OqRtCPY8pGeY2Mr+vu+2nNWwZ/Y2ezn1YoDCH2zE
	Q5yIxMMwHzACSu/hqBOKrZVUIZSaADwSMkKVjo7SOUwXzhdYVVQCXywayfmxkptMZu7/CToiFYhNe
	IqGM0qH4LA3I2ikWRkvZ9vffX31d9OvLKn6GfEeamZ8M0SXg3wBDWNnL5gB+AeJCOauNU8lKZVVN1
	JYw8owwNERW1O380syMHcWiT1l7csby1u3919OfXXE/I9FMDHy6fyb+/Jbm1wUSi6YYXH0AGYJyxA
	m2Z0oWyw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1riB3q-000000046IJ-0rFl;
	Thu, 07 Mar 2024 10:33:14 +0000
Received: from madrid.collaboradmins.com ([46.235.227.194])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1riB3l-000000046FH-3fv5;
	Thu, 07 Mar 2024 10:33:11 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1709807588;
	bh=w204slVxYNVadkZChPXCNGQajKtyqNyBZ5j9WXfP9X0=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=g12ih/RFFV6IU9U1+yKEYX4YQ67QjswvMLP/0+FIn2lSaIjLGo/TOZxSsgRq//eaX
	 n0Be0wwzdBUjx9kMLSukwZL8d5jq90C/DN1V9zA/JoCRwyJ4Jjgp0Wcw3z2HkgI8T/
	 w3tS1fO+cbl1qZ4Nva7goipuVHCGbEJlnmuMo+ID58kFx6bjpR7wLauziCeyrbUXRJ
	 FDBSCtPcn/ylgo4/NcKnxWTh4vdmKKI3Kt/tRrPbkv+LoKggbgnqjMDnR5JsWMB3PT
	 75FZ2L1T6C52JzayTRxfN1nRRaE47JEiUe7ENQPM6w6nyjqNWhuZD8Ambl38FTwg38
	 b7yRIJq2JwvJw==
Received: from [100.113.186.2] (cola.collaboradmins.com [195.201.22.229])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madrid.collaboradmins.com (Postfix) with ESMTPSA id 329B43780EC6;
	Thu,  7 Mar 2024 10:33:07 +0000 (UTC)
Message-ID: <ef1d901e-2bb9-46ec-b071-557c474587fe@collabora.com>
Date: Thu, 7 Mar 2024 11:33:06 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 4/4] soc: mediatek: mtk-cmdq: Add
 cmdq_pkt_acquire_event() function
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
 <20240307013458.23550-5-jason-jh.lin@mediatek.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <20240307013458.23550-5-jason-jh.lin@mediatek.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240307_023310_136926_C0D6C14A 
X-CRM114-Status: UNSURE (   9.81  )
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

Il 07/03/24 02:34, Jason-JH.Lin ha scritto:
> Add cmdq_pkt_acquire_event() function to support CMDQ user making
> an instruction for acquiring event.
> 
> CMDQ users can use cmdq_pkt_acquire_event() as `mutex_lock`
> and cmdq_pkt_clear_event() as `mutex_unlock` to protect the global
> resource modified instructions between them.
> 
> cmdq_pkt_acquire_event() would wait for event to be cleared.
> After event is cleared by cmdq_pkt_clear_event() in other GCE threads,
> cmdq_pkt_acquire_event() would set event and keep executing next
> instruction. So the mutex would work like this:
> 
>      cmdq_pkt_acquire_event() /* mutex lock */
> 
>      /* critical secton instructions that modified global resource */
> 
>      cmdq_pkt_clear_event() /* mutex unlock */
> 
> Prevent the critical section instructions from being affected by other
> GCE threads.
> 
> Signed-off-by: Jason-JH.Lin <jason-jh.lin@mediatek.com>

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>



