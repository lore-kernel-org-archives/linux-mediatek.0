Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8CBA4C3DA4A
	for <linux-mediatek@archiver.kernel.org>; Thu,  1 Aug 2024 08:24:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=gGtEXTV8Q1xasiMva0WIQTBFdS4zoxRcCYwoJdz/tJc=; b=dnTSKqhAatiapG1dAMqGSA+0Ba
	e3BWT9iBRKm4XjGE5Lq5eRWOmsKwvqisoXALMqDY6037avrYwWP00YgrL700P5L6kiuZY2vaZw/eK
	lLcM+by0dnqMow6YD9vvxW2GWXEjovxRwGugKstA2myaladi7DOqZWtw1Xy9i0+5GZNFyFz0L5FFr
	bYSHP6khF1Ye1T3Az8fSQHVZzl51jiTsdzUOWx8cCIbTxyuqPW0xRAVzWEMFlyKm2kaOyfJBJz0fu
	GhEahaTmK46Ie1wb3Q3zeQAOdSqmCRYkPFis2jesN5Hq6+f7wTDRlHuFR/vK7jBQnxMJVaXSbcGJe
	HyhB1/XQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sZR6s-00000004L0k-16yy;
	Thu, 01 Aug 2024 08:24:30 +0000
Received: from madrid.collaboradmins.com ([46.235.227.194])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sZR6M-00000004Koa-0fc7;
	Thu, 01 Aug 2024 08:24:00 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1722500635;
	bh=suyOYv7hGoiKkqAOfnYjT40wA9uY4wMwWjlg+hdAcxE=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=4cpvwBuXeiF1IJKFI61G5oN7nxTdHUhz/ATQiukTCYP7ygTEAJEViNVhCBO8d/I4B
	 QpDNmQU6A8v5JCUALTlaeg7a/JIQZPxpkPfKTfWltlQWWGhd8kJgEtBXHYAVQbLJuw
	 vgZjJsdn6wfXzGYwM0nwbPlvwo6LYk4pft6wc4xpGB1Q+sm6V/a38TjGWfLQLhiLyp
	 pkw8tHVzQLMaO1f/IryRxW+S9Le7pBxrISaruD+P9bGK2VB4W9lyMOT5kmMBjPf/Fc
	 hJkrduG+PbIKam7blYf+oMx4L7HCyPmfGPTXNroZT7rHu9I3RtvtVTAXLP+HpEqdvk
	 HsjxrUu0ONiag==
Received: from [100.113.186.2] (cola.collaboradmins.com [195.201.22.229])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madrid.collaboradmins.com (Postfix) with ESMTPSA id 46888378220A;
	Thu,  1 Aug 2024 08:23:55 +0000 (UTC)
Message-ID: <9b983add-45a4-497d-ab95-188f8ca1c0d1@collabora.com>
Date: Thu, 1 Aug 2024 10:23:54 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm: mediatek: Drop unnecessary check for property
 presence
To: "Rob Herring (Arm)" <robh@kernel.org>,
 Chun-Kuang Hu <chunkuang.hu@kernel.org>,
 Philipp Zabel <p.zabel@pengutronix.de>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, Matthias Brugger <matthias.bgg@gmail.com>
Cc: dri-devel@lists.freedesktop.org, linux-mediatek@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
References: <20240731201407.1838385-1-robh@kernel.org>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <20240731201407.1838385-1-robh@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240801_012358_365108_F266381D 
X-CRM114-Status: GOOD (  10.07  )
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

Il 31/07/24 22:13, Rob Herring (Arm) ha scritto:
> of_property_read_u32() returns -EINVAL if a property is not present, so
> the preceeding check for presence with of_find_property() can be
> dropped. Really, what the errno is shouldn't matter. Either the property
> can be read and used or it can't and is ignored.
> 
> This is part of a larger effort to remove callers of of_find_property()
> and similar functions. of_find_property() leaks the DT struct property
> and data pointers which is a problem for dynamically allocated nodes
> which may be freed.
> 
> Signed-off-by: Rob Herring (Arm) <robh@kernel.org>

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>



