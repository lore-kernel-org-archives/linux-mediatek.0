Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 26AFEE77194
	for <linux-mediatek@archiver.kernel.org>; Thu,  2 Jan 2025 12:35:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=RO3yprsV3+0rva9WfrzgUuIDkiLifhyWmcOAA8iKNSE=; b=L+27gLi+NjK6Q56H38FNm5z8HK
	P528z3ASecxlh5u/8iEyjNlZy15t5HNiuCVbgen0HiunmxRS1hNhBAuUB47ThNT6WFHrVZo2mFBHp
	GQv00cgfeUiGfTivWIPwl+NS5DpFHfDzId1NA4O/S51rOsSSgTxGH7VRrwvozF2ThCNj9f+LEv0Gp
	zsWtrNpqclxrWQ3e7rBrvDNY7OGMy0X7LPLARIV0Dt1fnYDqTYECM76AKJN1lPGI4mx73nTopusJs
	rwI6x6rMID30SD9Fxf8zwmrdAkF11In/ir1R60JtFWh9GwEabsi4d5DhdvnkuhQexvidb6aqsdEcp
	amAv7HCg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tTKPw-0000000AMN8-1Xud;
	Thu, 02 Jan 2025 12:35:12 +0000
Received: from bali.collaboradmins.com ([2a01:4f8:201:9162::2])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tTKPt-0000000AMMU-28hu
	for linux-mediatek@lists.infradead.org;
	Thu, 02 Jan 2025 12:35:11 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1735821307;
	bh=os0Cxr0lwd8+rwXJ9k4K8vMInJAZ02qWvwYce/ccerU=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=Xb1eGjPYY0Q1gMpcj0EOzFqsSBuNzqEDicEnSklEr8GmRSC4wqCzzibGI2VHzets2
	 +mHqlmeaWDmGDG2EWT2k0N3SLtJs0VU0aJ+0BBj9LQ6JAP0GH/nQb+ugzGJCG7lp6y
	 Rouod0S888w4oOTBkrxRtYhFPM/L82x8FUuOOGRCHP8uTLBuysKqM4naUXbrM1H1kE
	 5i9MIf8lEzwS1318CQEkO0CSjd85ASUbHiN2h8HTiZOhFkHuU/xpS5Dv2UADRjuVEb
	 cSSnVkg2A0rnx/XI6KZIe/tiUzV8OgtlQR7PX1WtbyZ4Kjlm2vKytGoMutXEUUmj1H
	 jowAXaCngckCQ==
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 903C217E156C;
	Thu,  2 Jan 2025 13:35:07 +0100 (CET)
Message-ID: <033b6577-61da-47bb-8e22-3c84d89220e0@collabora.com>
Date: Thu, 2 Jan 2025 13:35:06 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/mediatek: Remove unneeded semicolon
To: Chun-Kuang Hu <chunkuang.hu@kernel.org>,
 linux-mediatek@lists.infradead.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, linux-media@vger.kernel.org
Cc: kernel test robot <lkp@intel.com>
References: <20241230135314.5419-1-chunkuang.hu@kernel.org>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <20241230135314.5419-1-chunkuang.hu@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250102_043509_728107_35B4A61D 
X-CRM114-Status: UNSURE (   5.13  )
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

Il 30/12/24 14:53, Chun-Kuang Hu ha scritto:
> cocci warnings: (new ones prefixed by >>)
>>> drivers/gpu/drm/mediatek/mtk_drm_drv.c:1092:2-3: Unneeded semicolon
> 
> Fixes: 4c932840db1d ("drm/mediatek: Implement OF graphs support for display paths")
> Reported-by: kernel test robot <lkp@intel.com>
> Closes: https://lore.kernel.org/oe-kbuild-all/202412022048.kY2ZhxZ4-lkp@intel.com/
> Signed-off-by: Chun-Kuang Hu <chunkuang.hu@kernel.org>

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>



