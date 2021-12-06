Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8E38EC433FE
	for <linux-mediatek@archiver.kernel.org>; Mon,  6 Dec 2021 15:00:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:Cc:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=rJP/5tq6cm0HTwqpEemOrbvaWoO5eVjnVTB9s8lK8JE=; b=auKdrjBKO64UbVwQ5uYgjDxUbo
	p0IAebXon/Ved4xph5jv7CrkchekfSi9dfHZnJ9tASU1zNbl/SX/jwoucujfaoPZmWgl6QjiCu85C
	/xlYFAvIOeo5HNfoJgvBdfOa/PIIjCy2hEJB5rNfFP2ADBn46D2YV5XbGTpk46twVzh0DD98Jfwb6
	/b1LPwVq+tbKiXt3+X89cvgf8nWlzZRMG6pun3qJVOddb3TpKCuLSQLWeQUiUBo0NAtp3DJ/elxJx
	yCoaPGcLXG1a7MF1N6wBqdwrHCjszfPc/PjAk9U+AHifkwgqnMrBwr3PfPdzZ/xi62kMgLHixFtna
	LSiiM9Vg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1muFTh-004KfC-7H; Mon, 06 Dec 2021 15:00:29 +0000
Received: from bhuna.collabora.co.uk ([46.235.227.227])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1muFTP-004KVz-Qn; Mon, 06 Dec 2021 15:00:13 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (Authenticated sender: kholk11) with ESMTPSA id 4FBD11F44803
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=collabora.com; s=mail;
 t=1638802808; bh=GdCGPmly0UuQ6WjSsNws2p+iDG85TsB+eBdXAeJYWKo=;
 h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
 b=K0fNGcFVKt7O287APEpkAIFNWACJowOJtubES7YzU18wZK9tNnX6ZS0kbADSNKC+Y
 am0NkVRHfnoQTQJlzPZjKnz30qgm4Whf1fMoJ36ZW7tuuwUON8yNfV5KB1fLGF4qLz
 wRT4fRML+iDArFocVdBPGhXWssHAcEDtuY3zEl7XnqGMC9g8Nu3Z34O6qjezjYx2+p
 Jm3G8SkDOksXBYgZgWNmR8ZXro02agCanHvdBQG3jB7N6mGf3ioJSxk1lPrjf/msEu
 rhasgGlGOHR52V1irMnWJcut59XIHV0ggwnbxyB9JXfc+GJvqg6CTW6oYAXy015cKw
 WjK2fAddW3VRw==
Subject: Re: [PATCH 4/4] memory: mtk-smi: mt8186: Add smi support
To: Yong Wu <yong.wu@mediatek.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
 Rob Herring <robh+dt@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>
Cc: Krzysztof Kozlowski <krzk@kernel.org>, Joerg Roedel <joro@8bytes.org>,
 Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>,
 Tomasz Figa <tfiga@chromium.org>, linux-mediatek@lists.infradead.org,
 srv_heupstream@mediatek.com, linux-kernel@vger.kernel.org,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 iommu@lists.linux-foundation.org, youlin.pei@mediatek.com,
 anan.sun@mediatek.com, lc.kan@mediatek.com, yi.kuo@mediatek.com,
 anthony.huang@mediatek.com
References: <20211203064027.14993-1-yong.wu@mediatek.com>
 <20211203064027.14993-5-yong.wu@mediatek.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Message-ID: <417ec223-b49a-c8dc-c53a-7831cca4d2d1@collabora.com>
Date: Mon, 6 Dec 2021 16:00:04 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <20211203064027.14993-5-yong.wu@mediatek.com>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211206_070012_384436_A3DEF636 
X-CRM114-Status: UNSURE (   8.20  )
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

Il 03/12/21 07:40, Yong Wu ha scritto:
> Add mt8186 SMI support.
> 
> Signed-off-by: Yong Wu <yong.wu@mediatek.com>


Acked-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
