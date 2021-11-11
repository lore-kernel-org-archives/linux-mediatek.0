Return-Path: <SRS0=RaJc=P6=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DF9F7C433F5
	for <linux-mediatek@archiver.kernel.org>; Thu, 11 Nov 2021 13:30:48 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B0CD0610FC
	for <linux-mediatek@archiver.kernel.org>; Thu, 11 Nov 2021 13:30:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org B0CD0610FC
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=collabora.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:Cc:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=eWSyVywbsvW6q7pKmJi81Wn3rp7RBEdVf6olqlwV/MI=; b=xu4+5Ua7YZ8D0oIjL/OxFeDNir
	6sRbHOTj4OKuz7Qz3I5fff16lsAP4Cxyp61PST2cVz5unk7VjaBxuJ+IL/b6SZgiOmU7LDmG7Ngr4
	xmNTFelJIjrBwnwivwJSVCkq9iU7tIbbMWV9dwlKkDqgsazlrekD1u6U8UV2H/TnTp0tMWRemoxQ/
	jB/6SQjahFEiMYP4VTpArwGuQvxtkdIEKz0Ch0+wdQ7xYnDr/EUcdeTSFhW53TQ204KHVOrRyMA9N
	ypkZX5z9VmUJIrxQY7orz46fOFfp8WCNZ2MDX0ffTHwzzxZ8xV3U6QHtMObqUBwsMfON4MXCji5Cn
	hLNxQHcw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mlAA5-007zoI-VG; Thu, 11 Nov 2021 13:30:41 +0000
Received: from bhuna.collabora.co.uk ([2a00:1098:0:82:1000:25:2eeb:e3e3])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mlA9r-007zjI-Vb; Thu, 11 Nov 2021 13:30:29 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (Authenticated sender: kholk11) with ESMTPSA id 2763C1F45C19
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=collabora.com; s=mail;
 t=1636637426; bh=Q3uCANzvE9+cRG6QMf3K+KvzdaN3OYug4xiZOrBZ+iM=;
 h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
 b=rZzbQShwGj5gN7VirvGPcA6smFvOgJNJVxSZ/0tDPh9PcbO0sUcLPRcA7VYW4ImPS
 GhLtFxP2CKI2VHngQb15P/IdUO5b8lYSRD6m1vWcP7BI2axvDlU6Bu70t6OXMKGhR6
 7Ej4t7rl/haFWR2eEkl+oaO+836qD68UZNwafVYWKv4m3jpPTjEQe6mzpTPg9hs3sH
 sWb/3CorRa2b3Nako7IelthlBb+c632oUym8PYVP5MpuP+rAtIu+NBVz1aw3YzKcRq
 Pjz2+f4d3JzMSewpQvqJ0le+NkCaTlWURLnD0Of3JHjhH1pXrcc8eoEBI9xNiCobNs
 79pcEOuCWX4HA==
Subject: Re: [PATCH v2 4/5] dt-bindings: net: dwmac: Convert mediatek-dwmac to
 DT schema
To: Biao Huang <biao.huang@mediatek.com>, davem@davemloft.net,
 Jakub Kicinski <kuba@kernel.org>, Rob Herring <robh+dt@kernel.org>
Cc: Matthias Brugger <matthias.bgg@gmail.com>,
 Giuseppe Cavallaro <peppe.cavallaro@st.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Jose Abreu <joabreu@synopsys.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, netdev@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 linux-stm32@st-md-mailman.stormreply.com, srv_heupstream@mediatek.com,
 macpaul.lin@mediatek.com
References: <20211111071214.21027-1-biao.huang@mediatek.com>
 <20211111071214.21027-5-biao.huang@mediatek.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Message-ID: <4214b222-6c43-3132-bcfe-07c43d29f5f9@collabora.com>
Date: Thu, 11 Nov 2021 14:30:23 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <20211111071214.21027-5-biao.huang@mediatek.com>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211111_053028_194614_4FF195C5 
X-CRM114-Status: GOOD (  12.40  )
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

Il 11/11/21 08:12, Biao Huang ha scritto:
> Convert mediatek-dwmac to DT schema, and delete old mediatek-dwmac.txt.
> 
> Signed-off-by: Biao Huang <biao.huang@mediatek.com>
> ---
>   .../bindings/net/mediatek-dwmac.txt           |  91 --------
>   .../bindings/net/mediatek-dwmac.yaml          | 211 ++++++++++++++++++
>   2 files changed, 211 insertions(+), 91 deletions(-)
>   delete mode 100644 Documentation/devicetree/bindings/net/mediatek-dwmac.txt
>   create mode 100644 Documentation/devicetree/bindings/net/mediatek-dwmac.yaml
> 

Thanks for the DT schema conversion!

Anyway, you should split this in two commits: in the first one, you convert the
txt documentation to schema, as it is... and in the second one, you add mt8195
bindings.

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
