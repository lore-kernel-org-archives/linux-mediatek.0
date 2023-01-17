Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 77519C63797
	for <linux-mediatek@archiver.kernel.org>; Tue, 17 Jan 2023 08:59:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=hd1qqEoQHb2z/KlfwtwVYuuH6YBkoVQ3oftg2bskWek=; b=OM8c4HPkHDByRdbd/7dQ9aPKRC
	buq1tmwl1oPXqXEQPMBQA1R8tKEZEByqFk7HwqR0X6BHssjSTFsAhPBV7JwtrwDlFOhySUcXJlHxA
	2KSbcqyl/NrkCxqQH8mHiTK50gCSgdJF/8sSwtcAuQbadVKdgyAVh9mdvHxVYiYulyWhpScwzj0IW
	BhP60KaHZvzcrm2Z53S81FxYMqUk9zRlonB0nCreqQsyAIjSFQsaq6GfEoo13Csy2JKrwH0qsJS9s
	Gkz520rldTDPTnuVd1Fndi5tvlSypMWpmeNzl4gIdRK1jXdEfduXReqgZAkZKUsvBO9QlO02pGODQ
	/soG4q0w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pHhoO-00DRjM-Fw; Tue, 17 Jan 2023 08:59:20 +0000
Received: from madras.collabora.co.uk ([2a00:1098:0:82:1000:25:2eeb:e5ab])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pHhnh-00DRNX-Gg; Tue, 17 Jan 2023 08:58:38 +0000
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id C233B6602DEA;
	Tue, 17 Jan 2023 08:58:35 +0000 (GMT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1673945916;
	bh=qZ+2xKymdUypitvlKKjz7KHoO9yPt9+lbG67OmfsHqw=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=Ws4EqmRtAQMLebfZgqH0BFKZbXDC3qbakcrpV1Y9xK7bDCDxBKxbIarOq7A5GV09+
	 muWw68KwYfHhH2YAe8yxQsVF46gGFMOHGCxlQ86/nhHtsQ93BVIFkHXg+k41LzvAc5
	 lS8SePnxG1GXfOheZW17bXk8v5MM8XpObbYPQfWqwf8nQJsyr4JZaji0Bnqz6T6W6Y
	 tRiUl1QVAr7kWZr/mEKr3DQCC2Z9dcpaylzr77xkWH8i4MUp2Q6BqosiP+q2GQLz4T
	 CQPDJkTkLFxalrYEGP78d0fDILP6dHDPPcMvU4s8UgHZHME/iuCblv+mtRCVJT2W6z
	 5gIuNnm9ExqzA==
Message-ID: <0588c60f-6f72-db6c-aff2-2921f89b4956@collabora.com>
Date: Tue, 17 Jan 2023 09:58:33 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.0
Subject: Re: [PATCH 2/2] soc: mediatek: pm-domains: Add buck isolation setting
 in power domain
Content-Language: en-US
To: Allen-KH Cheng <allen-kh.cheng@mediatek.com>,
 Matthias Brugger <matthias.bgg@gmail.com>
Cc: Project_Global_Chrome_Upstream_Group@mediatek.com,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-mediatek@lists.infradead.org
References: <20230117032640.13504-1-allen-kh.cheng@mediatek.com>
 <20230117032640.13504-3-allen-kh.cheng@mediatek.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <20230117032640.13504-3-allen-kh.cheng@mediatek.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230117_005837_732266_EB450086 
X-CRM114-Status: UNSURE (   9.68  )
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

Il 17/01/23 04:26, Allen-KH Cheng ha scritto:
> In some chipsets, we need to disable EXT_BUCK_ISO before turning on the
> specific power pm-domains (mtcmos), such as ADSP in MT8192 and CAM_VCORE
> in MT8188.
> 
> Add the MTK_SCPD_EXT_BUCK_ISO flag to control the buck isolation setting
> in the mediatek power domain driver.
> 
> Fixes: 59b644b01cf4 ("soc: mediatek: Add MediaTek SCPSYS power domains")
> Signed-off-by: Allen-KH Cheng <allen-kh.cheng@mediatek.com>

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>



