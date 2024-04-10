Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8DEE3CD11C2
	for <linux-mediatek@archiver.kernel.org>; Wed, 10 Apr 2024 09:40:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From
	:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=nk4DwiZqqtrT/rRVPAsmALZ2WW724icvbIwOY4PSU4E=; b=Ad4CcaGV6VbgY+AIaih2YvZ/cD
	KWHxTSXIxA5/K7/JvCOIsCoA7ezCMkCTnvYdGmLnh4dT3FXP1zkQavL51QingUZf0Mo153NZIUO4P
	cEva6NxVewgEOdCJoLO10a4uF7B4wO/0ZIrB8Cwlf470F1TURnqMVUkmfZrOVNbm2AsM8GLyGhzk7
	3YC24H3pbjs08/d1hEho9ViOaM2UBOpHGOOMSNJ8WXcQcLT+WPpAhVzxCoDWS2Am8+pXe2XxrhLfu
	LB6Hpn19hbNwIOt/IFxMk8EBaqf4v5Ajkgtw7svPdiofLvMMeP+gPlOL7Axr6+vFfxJzW6Hrt5ypp
	NlFhiIew==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1ruURI-00000006CBQ-46NT;
	Wed, 10 Apr 2024 09:40:20 +0000
Received: from madrid.collaboradmins.com ([2a00:1098:ed:100::25])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1ruURD-00000006C9M-0XvD;
	Wed, 10 Apr 2024 09:40:16 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1712742012;
	bh=6VlEmFeCzeMqMlidOOqawofjJtPNiIYfWbo5jJ4khEU=;
	h=Date:Subject:To:References:From:In-Reply-To:From;
	b=IxlPIgoC/HSFkYXu3u6msNCLCwyYZXqBy83qPPE6KGVaqnLZTahUnipe9wTpeLklh
	 sSoi0FhBGGWcuwBgt0J7XBWgEEFXYnEptr7IMv0Q4Ws0GsB44FlH7kTLkBMZPNlmcK
	 nH1g39ZwOR9TckMK3Lb2i+VLtllA5Fx35pjfOvbclX5CucStq/RQlWLiEFleLz5xD9
	 3txG89fvMiEujHDvZv6ieeBslookfAsIFSd/jpt6q7bwpw2m54niNWCIod0ctZK+cD
	 jrb50Mw00fek3IaAZnrKjNixpoqntSeWIRdiqbyZrtvaekRbNqH1e02Hm1SR5HM9Fl
	 NUew8OwZpUA/g==
Received: from [100.113.186.2] (cola.collaboradmins.com [195.201.22.229])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madrid.collaboradmins.com (Postfix) with ESMTPSA id 066273780480;
	Wed, 10 Apr 2024 09:40:11 +0000 (UTC)
Message-ID: <9488fe6d-8828-469c-bb48-5fd8b87f9cfe@collabora.com>
Date: Wed, 10 Apr 2024 11:40:11 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] memory: mtk-smi: fix module autoloading
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 Yong Wu <yong.wu@mediatek.com>, Krzysztof Kozlowski <krzk@kernel.org>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org
References: <20240409204615.83928-1-krzysztof.kozlowski@linaro.org>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <20240409204615.83928-1-krzysztof.kozlowski@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240410_024015_708460_59266FDD 
X-CRM114-Status: UNSURE (   4.97  )
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

Il 09/04/24 22:46, Krzysztof Kozlowski ha scritto:
> Add MODULE_DEVICE_TABLE(), so the module could be properly autoloaded
> based on the alias from of_device_id table.
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>


