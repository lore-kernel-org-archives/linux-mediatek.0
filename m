Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C4480C10F16
	for <linux-mediatek@archiver.kernel.org>; Mon,  6 May 2024 12:50:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=51ooe2QkGM+O3gppuFTipE4uhKyMtoneSp9DsN2eKnE=; b=dpSlWKaMLdjQamxnoFa6B05eis
	UljPOZcoYyTILjpqXuMpLVCg5S8I6aXxHKZGDlT123y2lIHH4rywXOxVrbiTMWvIRqeqy2Qf6V2mH
	OY/TfRHNhvZcj2lORHjfc86RbmV3sjF/fxl4SCaKLWnQhp7sf8vRTGP1nceC+YCpqAnLvxKZGSLN3
	aOluZuCr3kK/CmX7OJ5Mc2uqfUkvDHYh6JedQtHmy0SWneE/SbaExA+0xSnhAa7HQyHbi9yaZUkga
	Ogp+S9nby0Zm6peKeXq1DZSgbZby8Ef8Halh0+c7a4zwKqguCzD0m7yO2Bqo9rw9GPxvZvfFMYRYQ
	DtAfoRgA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s3xna-00000007LqX-242G;
	Mon, 06 May 2024 12:50:30 +0000
Received: from madrid.collaboradmins.com ([46.235.227.194])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s3xnX-00000007Lpd-2p5l
	for linux-mediatek@lists.infradead.org;
	Mon, 06 May 2024 12:50:29 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1714999826;
	bh=7YmFAKYR4v2H/+//mZ++hNH0JQRI9liSvEk0JvHYCDY=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=i8KFlH6AamyBlWjrQW9iREnPXwHPMfII4+McxwIl577WfJtA/6aR5l2FM7I/nqoXG
	 faMYdZFR7GLYhlJ2dOIuYwYaGKb81WK5kXPJZoIln53XaVX7pqW093ee7s3U9p3EmO
	 amG8oPfOXYLCpIHmOq1i/oUXNRp4VIBp4LGnf8ksViwv0rarxbkhg3HolFR/dShDqn
	 E0vjJw5DYeGyZVOadgE+wPjLeyGDnMCoU19r0Wz0qzgff24Q5/Z71BwDusEvGOjbtc
	 uX/k329PMkE1Q6hpRbnEAWxNDpNcI4mS6SsJ/7nTHiYv8Wb0gKdc76PZ62cpm+Q4b9
	 HG32n7WzKDhMg==
Received: from [100.113.186.2] (cola.collaboradmins.com [195.201.22.229])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madrid.collaboradmins.com (Postfix) with ESMTPSA id DDB5837813E3;
	Mon,  6 May 2024 12:50:25 +0000 (UTC)
Message-ID: <d368c0c2-bffb-4801-a6be-c83dea738b70@collabora.com>
Date: Mon, 6 May 2024 14:50:25 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] remoteproc: mediatek: Fix error code in scp_rproc_init()
To: Dan Carpenter <dan.carpenter@linaro.org>,
 Olivia Wen <olivia.wen@mediatek.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
 Mathieu Poirier <mathieu.poirier@linaro.org>,
 Matthias Brugger <matthias.bgg@gmail.com>, linux-remoteproc@vger.kernel.org,
 linux-mediatek@lists.infradead.org, kernel-janitors@vger.kernel.org
References: <b2114e3c-fa64-4edb-a1ff-d2009e544c3f@moroto.mountain>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <b2114e3c-fa64-4edb-a1ff-d2009e544c3f@moroto.mountain>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240506_055027_893172_B8C57EFD 
X-CRM114-Status: UNSURE (   5.98  )
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

Il 04/05/24 13:26, Dan Carpenter ha scritto:
> Set the error code to ERR_PTR(-ENOMEM).  Otherwise if there is an
> allocation failure it leads to a NULL dereference in the caller.
> 
> Fixes: c08a82494500 ("remoteproc: mediatek: Support setting DRAM and IPI shared buffer sizes")
> Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>



