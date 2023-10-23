Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7DCA3C004C0
	for <linux-mediatek@archiver.kernel.org>; Mon, 23 Oct 2023 09:50:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=I1wMHuG6rnovx3i4JLH52aKKWUS1DtTfes6Io8ETyG0=; b=L5imQYrwUQrQINjoNYbhYS9vLo
	/ejAN0yY3VqvzJ7trTdr7NsK3MRAlP3WH49T+3VuWzjoDnaUWXg5eY0FKeoepRWMfzqAqjAQ2d/eX
	dQwjw7T4r6FNNzBaA1NOLnP6NROB3VPLJ2lSj22CpdY+RY1I2aJBENNRPFj/APES0a93DnvWQCoZ4
	0cq1QsbhJYSEM3GT6Wx+JyTffTPhWxapiaX6/i43MCHsFcTd3qgEGRgAJ45CohB67Ai7HVNWL3itU
	EYcHRLPAKEaraYhVet9uVRFlUnaoErJt//MHqOl8VvJJ4QM75Vft03FKg7X3hnET0nHONn4giLGSL
	W9fPZwKQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qura3-006vbB-0j;
	Mon, 23 Oct 2023 09:50:39 +0000
Received: from madras.collabora.co.uk ([2a00:1098:0:82:1000:25:2eeb:e5ab])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qurZr-006vWG-2f;
	Mon, 23 Oct 2023 09:50:29 +0000
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id D48FE660708F;
	Mon, 23 Oct 2023 10:50:25 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1698054626;
	bh=GhK2Ud7iFADrChENpq0MFz1UWrwGPzQtCcCAlEyPGTM=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=BM5o3kiOsM4A/Yk6AEpLvWAIf3butKc5Th+izLQ8+ZCVV8ss7aCDC4aBuWoLC/udP
	 oJuvlx9rBaMmEAZ4F5gkNtfo3ITaK41zukqJN6klysjQ5J+Ldyl68ZiWsJlnDJtawC
	 eXKH2RQlRL2BdNYn5yi8AAFDMFPKzq7ltOxVzkHX7qSakxgXUYTQ0uhb1Zju81GDIs
	 S2ngBqYl6LriSE4+shP54ZOgiwHBE+QX1jYXRDMOootprG5QoK7EhhDLzytBZ3Sfdo
	 7uJ1+3dWcOhfqM4ouEyzURyfsmexeCqlbCu800Ibi4zlVXdBLdsIiCsla7fpihhvIt
	 wNViGEQnhvheg==
Message-ID: <44b27975-1476-4da5-8427-8b0dab81b0d6@collabora.com>
Date: Mon, 23 Oct 2023 11:50:23 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 4/9] soc: mailbox: Add cmdq_pkt_write_s_reg_value to
 support write value to reg
Content-Language: en-US
To: "Jason-JH.Lin" <jason-jh.lin@mediatek.com>,
 Jassi Brar <jassisinghbrar@gmail.com>,
 Chun-Kuang Hu <chunkuang.hu@kernel.org>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Cc: Conor Dooley <conor+dt@kernel.org>,
 Matthias Brugger <matthias.bgg@gmail.com>, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 Project_Global_Chrome_Upstream_Group@mediatek.com,
 Jeffrey Kardatzke <jkardatzke@google.com>,
 Jason-ch Chen <jason-ch.chen@mediatek.com>,
 Johnson Wang <johnson.wang@mediatek.com>,
 Singo Chang <singo.chang@mediatek.com>, Nancy Lin <nancy.lin@mediatek.com>,
 Shawn Sung <shawn.sung@mediatek.com>
References: <20231023043751.17114-1-jason-jh.lin@mediatek.com>
 <20231023043751.17114-5-jason-jh.lin@mediatek.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <20231023043751.17114-5-jason-jh.lin@mediatek.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231023_025027_997757_59183DFE 
X-CRM114-Status: UNSURE (   8.18  )
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

Il 23/10/23 06:37, Jason-JH.Lin ha scritto:
> Add cmdq_pkt_write_s_reg_value to support write a value to a register.
> 
> It appends write_s command to the command buffer in a CMDQ packet,
> ask GCE to excute a write instruction to write a value to a register
> with low 16 bits physical address offset.
> 
> Signed-off-by: Jason-JH.Lin <jason-jh.lin@mediatek.com>

Please fix the commit title:

soc: mediatek: cmdq: xxxx

Regards,
Angelo


