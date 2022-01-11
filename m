Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9AEEBC433EF
	for <linux-mediatek@archiver.kernel.org>; Tue, 11 Jan 2022 09:14:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:Cc:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=3hVRD+8sFcsXwVVQ+rHYyvAtdPvlgbyQC5J7S51sVAU=; b=GwclGxlHgHMYXs9nCDh+aV7s1W
	PsLBtifUhh6QaWVIMNTyaJKgGqUAtFJih1zBQkIJbeyln3Auh/4ukiM9sOVRsjIIzUnGHeRtNbgi/
	8z8SKdSlQ9l/BvprkuA4mnuJKTMw4DEtNMuYZ1Ee6j3vJu9XEmG3+LNIoTcXqOg0gxV1p3f2bE9MN
	uTAD3XsqfDAn6wiydKaHx1q56RnKmVUrseWEi2wBA1ZlvdSvYUXqDR+br7Ks9HsczXIE9GMojvfUm
	9VommFtmQsh1rhyAAOEzGqcW5jJgSJevK0NWtDcxzuRXugbzrO/wMbeYQFUJDsl5bt/JjQXV/RWL3
	F4DehTCw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1n7DEm-00FVLx-VH; Tue, 11 Jan 2022 09:14:40 +0000
Received: from bhuna.collabora.co.uk ([46.235.227.227])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1n7DEa-00FVIU-Lp; Tue, 11 Jan 2022 09:14:29 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (Authenticated sender: kholk11) with ESMTPSA id 406F31F41CF3
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1641892467;
 bh=OpxYFNpUHYIuTIBv0HTc/nmFe9b8Qv/VGZti7c3+o2U=;
 h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
 b=E36tFSyAwJ9yqEtW4Zcvc4HVc5FLPeXnQLYaUHLeifo11gu0nrFYC+KLoL1I5wQUc
 S0gtJ6Wg+HcWrdQXzuQDhl2NIWOZrk5opIpPRITsMDsDkSi/XOTvWCzr0mJ1JwfN49
 +X1aS8HgGRjr3ngm3mHvdVKIcGjWxBz13wCTl5Eqwqm43o7GXVdyQXuf48BK3xr5Nk
 otD8S5HJwXMMl+A2AUoM/aWxIJb+fSeAy3rcEa9DkbfP5YempRDLYjmk4Mla6C1e5D
 dbCv8ynX5pr2F12D3mVTfuXItQeE/PxnxUUcjyl582bHDOM2MdwgXYK7pwCW1yRASV
 JiDoBJx+kpv3w==
Subject: Re: [PATCH v2 5/6] memory: mtk-smi: Add sleep ctrl function
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
References: <20220111063904.7583-1-yong.wu@mediatek.com>
 <20220111063904.7583-6-yong.wu@mediatek.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Message-ID: <e3815197-8963-99a6-e83d-b801de1725f3@collabora.com>
Date: Tue, 11 Jan 2022 10:14:23 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <20220111063904.7583-6-yong.wu@mediatek.com>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220111_011428_878083_4C7DBE6A 
X-CRM114-Status: GOOD (  13.09  )
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

Il 11/01/22 07:39, Yong Wu ha scritto:
> Sleep control means that when the larb goes to sleep, we should wait a bit
> until all the current commands are finished. Thus, when the larb runtime
> suspends, we need to enable this function to wait until all the existed
> commands are finished. When the larb resumes, just disable this function.
> This function only improves the safety of bus. Add a new flag for this
> function. Prepare for mt8186.
> 
> Signed-off-by: Anan Sun <anan.sun@mediatek.com>
> Signed-off-by: Yong Wu <yong.wu@mediatek.com>

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
