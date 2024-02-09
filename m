Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0EA5FC48297
	for <linux-mediatek@archiver.kernel.org>; Fri,  9 Feb 2024 08:55:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=MrrJ+2y75zkH+rOXbRjZVXNej8Ef79xM/R3sX9ggE+0=; b=Sm8p7q6UH6K6WElRS4BUwQQTlA
	MSNZDV6hYMiClQeW6p9pwUimcWrP+QYuYoE88rpUfVv+5GTdJ3H8BmgMI5xj1KeOLkfW7eiAWLTUj
	K/vCgEyyrgAgswLS1MBu8PD3nyL/uPJTcMGX8tnkgBo7ya2h/DWKbpzUeecvQwI0MN8+UJHS0ulEE
	HHU5ySMIVM+cGnUffE/N8R86fX+nGblRoBo/mR9wRA1pSdBn8nwF/hTV5vlq/vMGj2ss3Lv1Y9uXP
	RLSAF34rWOVQz1x/GG/7fERwQoU7RqzMHmYvhhYng4uVGT9GORGo0PPksndovyq6WYo6Wd/sr/owk
	KLDF1yrA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rYMf1-0000000GVm1-30RV;
	Fri, 09 Feb 2024 08:55:03 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rYMez-0000000GVkf-2JQU;
	Fri, 09 Feb 2024 08:55:01 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=MrrJ+2y75zkH+rOXbRjZVXNej8Ef79xM/R3sX9ggE+0=; b=DunUkS+JA4l68GfmW40Tt4iuX0
	HdXoeDAqpmTyAfKOKYqCoe9nmLD6cMgZUvNl/GU730E8kJsH8DsF6cLYEq3JUMaUrEbvQ0WhkFWyM
	baKq/3N5iYYE3Gy+74T+zgSzyQMpKDDw3OFhrglAixPOEuxknUPLpGbF9MBIDwV9gSQx1oxEAphFm
	iyI9wj7dkHXuOwUqgXtyHKtngG47cF960Hk4rGO3HGUoLMvCMsMF4INqQb9fNxaqF7JAmmaQc9Par
	1aMG+lBCMZgMrr6fFgloqm5M/J0FQhAGli5MJzZqbH3X9ygd/l8FFOD7k+3ierGm/px7j0ksQZwzm
	w7dThw2A==;
Received: from madrid.collaboradmins.com ([46.235.227.194])
	by desiato.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rYMev-0000000DtL3-28tc;
	Fri, 09 Feb 2024 08:54:59 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1707468894;
	bh=J3H5m350c/j2c/Zrss1AfOjAUuFtB5wq5BaVux2rSjY=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=tOzjRwCTskl0m39IDIy/L/aNlDlFkIu4falBaJCTSLVxNjbhVBFAfjotBZayI7yAz
	 5FYMpzOaroeI4ItVolGfhqDGRHV1WfBoqstg5R5DuharkhrTTbURPDe9cVMcu1V/U0
	 4OLnF7yC0H7CiauX9PQDfkrX3WS1eMo9fBRB3d/JM0T/BVSYPR+uoSrJetjqF3dZHq
	 Uesux8liqjHnrV3rcLEX5KQnFbubuj4H1oRwmNRDTmElqlDARWlMVxUcW1wPB1v3Lj
	 yF4fcj+cAjqyJ4SjvKaMX36BDWeyLxgdGt1SrWf9F8/Afnj3OIKJyp7qC+9DOpueFh
	 ilrPLanSsSo3Q==
Received: from [100.113.186.2] (cola.collaboradmins.com [195.201.22.229])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madrid.collaboradmins.com (Postfix) with ESMTPSA id 6107737809D0;
	Fri,  9 Feb 2024 08:54:53 +0000 (UTC)
Message-ID: <90e0e76c-7bc9-4aa3-8d5e-4fe96c2687e4@collabora.com>
Date: Fri, 9 Feb 2024 09:54:53 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 11/19] power: reset: mt6323-poweroff: Use
 devm_register_sys_off_handler(POWER_OFF)
Content-Language: en-US
To: Andrew Davis <afd@ti.com>, Sebastian Reichel <sre@kernel.org>,
 Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
 Cristian Ciocaltea <cristian.ciocaltea@gmail.com>,
 Florian Fainelli <florian.fainelli@broadcom.com>, Ray Jui
 <rjui@broadcom.com>, Scott Branden <sbranden@broadcom.com>,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konrad.dybcio@linaro.org>, Sean Wang
 <sean.wang@mediatek.com>, Matthias Brugger <matthias.bgg@gmail.com>
Cc: linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-actions@lists.infradead.org, linux-arm-msm@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org
References: <20240208170410.67975-1-afd@ti.com>
 <20240208170410.67975-12-afd@ti.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <20240208170410.67975-12-afd@ti.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240209_085458_108526_2D1AB89C 
X-CRM114-Status: UNSURE (   5.17  )
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

Il 08/02/24 18:04, Andrew Davis ha scritto:
> Use device life-cycle managed register function to simplify probe and
> exit paths.
> 
> Signed-off-by: Andrew Davis <afd@ti.com>

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>



