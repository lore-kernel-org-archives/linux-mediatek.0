Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D4CEECD1296
	for <linux-mediatek@archiver.kernel.org>; Wed, 10 Apr 2024 09:40:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=nHSzvGCp1BuotsSGR0ioM1ribaJlkvnpqH6T6kdFBjs=; b=RcBBDLPtMTL2GIPRPPEV1hcKZt
	tt1nKMCaXHpA5LI6e7cbsHGNxgbALB9e3n5nyBi1E8ymZG4KPVWGBcytKAibH1xS5q2kfpUZTnFRC
	oml6yfGvS+ylJce9ZI9ftXrQVh2M56lSoZRYZDln7xe3037E23/AkcNd++iB7N6owG7B+H4aM+b1G
	IEhum54EMEfcjiTW3HojkMqLC2I0cot9BbakNMFq+VjQNMvLDlFgI22PggC0TvxlEjKZk8p7HddGZ
	ihSxaQKBeWbhvf5qLcgYghtUrLeC3Jwc+w/GdqN4jAHVSxamXVA/AYf54q2t2jC8kmC0g1+A4oFUv
	lNKf8iuw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1ruURJ-00000006CBY-1XSN;
	Wed, 10 Apr 2024 09:40:21 +0000
Received: from madrid.collaboradmins.com ([2a00:1098:ed:100::25])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1ruURD-00000006C9R-0Xar;
	Wed, 10 Apr 2024 09:40:16 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1712742013;
	bh=9EIcnM9Ibe7JbXZ8eAtGo6g7cnqXXcNhJCTV5wJYFkc=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=chWcdsU6YnQv9GfWi1KfuxJMCXDDZR35uq+lHRRXGrOflxnR+Lei3splYu3JgGJ6o
	 MyNakp2WVghJuRuIN6uMKyK4JlW224mvgfnsBStwV+pXOCAXlz8RxXk7Zxs5TZuW7H
	 v/eS2btQ5nNpExe7l87qhtu7GQ9hLj6mZ6AvgxWHvvz7G2e0XrRsFYPC/vYt+ewPxv
	 ACxHuIEwiyuwYsFpmV+Bj8/+lh4vP2PKYXEooKWjTHJOOd4jXDpv1RM9epvDl45lkb
	 XCgvDL80fO85EjFcKvWVU75sH7IR3djEFPvNfSzV0amkIXlBRm8IfeFcGCwVroE0ez
	 1omnwdgPsiL0w==
Received: from [100.113.186.2] (cola.collaboradmins.com [195.201.22.229])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madrid.collaboradmins.com (Postfix) with ESMTPSA id B7ACC37820E2;
	Wed, 10 Apr 2024 09:40:12 +0000 (UTC)
Message-ID: <1865719d-db95-413f-b4c9-a5e2ce35051b@collabora.com>
Date: Wed, 10 Apr 2024 11:40:12 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] scsi: ufs: mediatek: fix module autoloading
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 Peter Wang <peter.wang@mediatek.com>, Stanley Jhu <chu.stanley@gmail.com>,
 "James E.J. Bottomley" <jejb@linux.ibm.com>,
 "Martin K. Petersen" <martin.petersen@oracle.com>,
 Matthias Brugger <matthias.bgg@gmail.com>, linux-scsi@vger.kernel.org,
 linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org
Cc: Will McVicker <willmcvicker@google.com>
References: <20240409203954.80484-1-krzysztof.kozlowski@linaro.org>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <20240409203954.80484-1-krzysztof.kozlowski@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240410_024015_708869_F77B4BF8 
X-CRM114-Status: UNSURE (   5.44  )
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

Il 09/04/24 22:39, Krzysztof Kozlowski ha scritto:
> Add MODULE_DEVICE_TABLE(), so the module could be properly autoloaded
> based on the alias from of_device_id table.
> 
> Cc: Will McVicker <willmcvicker@google.com>
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>


