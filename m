Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8F96FC433EF
	for <linux-mediatek@archiver.kernel.org>; Mon,  2 May 2022 08:58:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=7/kEL5RwnoEm6CZoRvFGH2rBuAN0e/OuQQFtt8oWpI0=; b=S+k7LxUNcwvBWi
	e8/OvhOccv77uvu91y77b1RAjRg9pAjk4YiSxTbHKxR0r9th5CWkANTYzDUax5m5PuZJu2kUJktIm
	A03rq1jHMKu2wM/YhEhPwJ4GvJmiHcRbgRvuC+DLM1v/hf3e2Q5d8qeBDFDJH24yZ1919WNN14wWF
	LhFgoPxrvRKBXKl7YaEqBt/Orp6diyPnvGkOCFYKaGYO6HnwO0F04aq9V3aYbc3jvSxb9skPuEi6e
	YJXND5sCyzvCZgn8PTQweFs5OycBI+7Q+y1YCZGvZoTndRThCDA5WDxrrjflkV7cPe/q2/nAvjcPF
	oLxdP4qsVhEDp/H2/lsA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nlRsv-000UKG-7A; Mon, 02 May 2022 08:58:25 +0000
Received: from bhuna.collabora.co.uk ([46.235.227.227])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nlRsj-000UHq-RH; Mon, 02 May 2022 08:58:15 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (Authenticated sender: kholk11) with ESMTPSA id C1BEB1F43062
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1651481892;
 bh=cL2Z9D3LEn371erJNlKs66Hq7tPkrOTINXHvZ7G0d+c=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=Yj19NQrakpqBXtzQ2Tvz+IdaN8+kHDGYAzx03qomXv9RwCM2mU1828/CFylouUXl/
 Pqh0o0PJkU4bm4eqNLrfWhcop/4Sy8QH/ooj848iLKL2D6rRdEwmL1gSKJG9Ldgb/U
 6+KxjRx6GmYPtDgH2ggvyK06Kw6ukeR4gKpEO3NzhogJqO+XFMPlmyW3iXKtbIvKCK
 1TazwhC4q16e0IXbHKm0fRN82ft6Co/2ANDvni63eDguHunwTeyxfZuydp7MdffT5U
 f/hHGGD3TMy7mqPj3wA4ZrCqIpg5EcEf0b9vffmpSGV6gsfpibb3LWy0Ket/dC6/OR
 PckUmxW4yTjkQ==
Message-ID: <cda236e3-787a-43ce-1c5a-57e75f0b9322@collabora.com>
Date: Mon, 2 May 2022 10:58:08 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [PATCH v3] dt-bindings: arm: mediatek: mmsys: refine power and
 gce properties
Content-Language: en-US
To: "Jason-JH.Lin" <jason-jh.lin@mediatek.com>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Matthias Brugger <matthias.bgg@gmail.com>
Cc: Fabien Parent <fparent@baylibre.com>, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, CK Hu <ck.hu@mediatek.com>,
 Rex-BC Chen <rex-bc.chen@mediatek.com>, Nancy Lin <nancy.lin@mediatek.com>,
 Singo Chang <singo.chang@mediatek.com>,
 Project_Global_Chrome_Upstream_Group@mediatek.com,
 Cellopoint <cellopoint.kai@gmail.com>
References: <20220501090117.19557-1-jason-jh.lin@mediatek.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <20220501090117.19557-1-jason-jh.lin@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220502_015814_065923_3CDF468A 
X-CRM114-Status: UNSURE (   7.01  )
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

Il 01/05/22 11:01, Jason-JH.Lin ha scritto:
> Power:
>    Refine description and add item number for power-domains property.
> 
> GCE:
>    Refine description and add item number for mboxes property and
>    mediatek,gce-client-reg property.
> 
> Fixes: 1da90b8a7bae ("dt-bindings: arm: mediatek: mmsys: add power and gce properties")
> Signed-off-by: Jason-JH.Lin <jason-jh.lin@mediatek.com>

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
