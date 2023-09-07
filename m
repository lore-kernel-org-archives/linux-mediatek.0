Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9D530EE14D3
	for <linux-mediatek@archiver.kernel.org>; Thu,  7 Sep 2023 09:03:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From
	:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Sy3Z3DJSlc3e5ktATbgFNf0GmEMVoOPM89ZroshYARQ=; b=jOjasDSrqzPxIxUzCqdRlB5PAh
	3foNLu0r/Q0Xg5Zj8is+MRhOsVFHICzCKOcKwEErjrxKfQAYkCiG7NJd4K+2812YOhq1RPVr6HN37
	Zptw2gkIsxcrVyyI3A3E/ARYVvpdzDA7N+Ppa4ahLTZ55P+DYZUWmvr/IkTW9+tmktPeZiV0cqGJh
	uz0zUEHjY7SDHcAJZhLkHlwReqRs2pQcx2ptATu43CCJ/m1jNIxE2L0yHDLcFKBWTWsgSP8Hw2jew
	snklilmwWTgP/YOycS+eScvBRarmqySqogJnWZXpB+Ayou89YYoJkgbA/0ndI6YuE0BFycAojsZuj
	6sAeW+xQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qeAvA-00BdW9-1i;
	Thu, 07 Sep 2023 09:03:28 +0000
Received: from madras.collabora.co.uk ([46.235.227.172])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qeAv7-00BdVS-28;
	Thu, 07 Sep 2023 09:03:26 +0000
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id B4A5B66072EB;
	Thu,  7 Sep 2023 10:03:20 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1694077401;
	bh=cxgHzHn8tiosscM7rs1t8c0B3y0bEz5hVnyonEDHwcQ=;
	h=Date:Subject:To:References:From:In-Reply-To:From;
	b=Jg1VsCm9fyb2bJm+Y5M/Ced1kTka548X7IOgeXjgnnWl67hvNS821o1bKeDkQu2WE
	 brIIQdtFGeGVK3M5Dk2Pt0NhVtC6msKiIq1jyReoAQwjBIrv6LCzEbihfwYz9k1HAx
	 lt7VIocWeYNT+7l6SezTDlpFKPLmRiY2hU34cR5LpuhG8Z5WQ9nKgNRxZjSKh00rQc
	 nxbnx1vT52hGtcgAsMgSHRT1pLGcl3sFQNawVJZ0+eE6IzDdtXHg2y2rw1mdhjLKki
	 s+87GyXOpqw8UQ/DD43vAn4RnWAlEmY0twKQPoTAOgdIoP4l+3emRC86Bq3kD3AN72
	 p3l9H8ciY53xA==
Message-ID: <827ba3c8-198a-7d1d-4511-b7aa9710b27f@collabora.com>
Date: Thu, 7 Sep 2023 11:03:17 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.0
Subject: Re: [PATCH] scsi: ufs: do not look for unsupported
 vdd-hba-max-microamp
Content-Language: en-US
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 Stanley Chu <stanley.chu@mediatek.com>,
 "James E.J. Bottomley" <jejb@linux.ibm.com>,
 "Martin K. Petersen" <martin.petersen@oracle.com>,
 Matthias Brugger <matthias.bgg@gmail.com>, linux-scsi@vger.kernel.org,
 linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org
References: <20230906113302.201888-1-krzysztof.kozlowski@linaro.org>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <20230906113302.201888-1-krzysztof.kozlowski@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230907_020325_895831_638F4107 
X-CRM114-Status: UNSURE (   7.90  )
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

Il 06/09/23 13:33, Krzysztof Kozlowski ha scritto:
> Bindings do not allow vdd-hba-max-microamp property and the driver does
> not use it (does not control load of vdd-hba supply).  Skip looking for
> this property to avoid misleading dmesg messages:
> 
>    ufshcd-qcom 1d84000.ufs: ufshcd_populate_vreg: unable to find vdd-hba-max-microamp
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

For MediaTek:

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>



