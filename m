Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 31EFEC0018C
	for <linux-mediatek@archiver.kernel.org>; Thu,  9 Nov 2023 09:11:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=7Xo7DkoSwTZx6ttj0gr/7Bd7VygmP4QPGjx7nVYQX4o=; b=FVdhPfxICZXEP6dQ6ShbxU+WcG
	mRRG/UvKJCnqBzC+YyAYnW3gBfP9fo+RIJjBCu14b2uPRzsYSA36zDYYQYrM/k3kwwlkI3WSdJAID
	Q7fZhH08SoOj+Zxx1Jp3Uos+cDFCTZI80S8bKkV43LabL1KmQzMI1Yl9xJVvgktKm/WsgqSbHRf3Q
	WO1Eog0/D1uG9+H/3wUfiw0z3sfhtaNZnBS166b9KPKxSLmLmT1RNxfxjroqVx3zAFbboZ5TV20QK
	NTPBr/Y6LW/T6eF+7FdSdJrRTKGcaK8OAIrYR7R2OAk19Qufonsz+oAHIoqA2n/hCuHjIW8eftWJc
	49GdAf1g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r1140-005k1k-0b;
	Thu, 09 Nov 2023 09:11:00 +0000
Received: from madras.collabora.co.uk ([46.235.227.172])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1r113v-005jzR-0d;
	Thu, 09 Nov 2023 09:10:56 +0000
Received: from [100.107.97.3] (cola.collaboradmins.com [195.201.22.229])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id 637F4660740D;
	Thu,  9 Nov 2023 09:10:52 +0000 (GMT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1699521053;
	bh=42Ln2E9Xl3GRKOogFcQnIosDWOt7twPlXl2xjiL26lo=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=VEYf88+yOiO/9aKcpq4nOi1CS8inDpYYExslSKzAQKkas4kG19PXscZm7knfzqusG
	 yZcpCjtcQGhSRcHH6tEAYNvZhiHPXoiq05WfbVabplih+WQi8q+tRRKIbGanj+3UXz
	 nrzwtc6PFOJ5zC9Ex6OozzI9uiDKz444QFdx5AeaESxkKX4BXn6qj5VnP2v7Ufg8kR
	 RaFnv4L4CKxkQ6GC2c9d5fqwNCI3A/LzHo32oVpsOA+UouS3C9QNWe2g7PZMECdjOu
	 V4Pbm1fZjf85HCI/6iYjlrwYh93YBYwshxnC0Sk2JWHnJ2mKyPysYYpyPovzMycEY9
	 fOYkBn/SgmsoQ==
Message-ID: <1cbecdd4-f99e-4227-be80-5b0163a61f5d@collabora.com>
Date: Thu, 9 Nov 2023 10:10:49 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/3] soc: mediatek: mmsys: Add support for MT8188 VPPSYS
Content-Language: en-US
To: "yu-chang.lee" <yu-chang.lee@mediatek.com>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 =?UTF-8?Q?N=C3=ADcolas_F_=2E_R_=2E_A_=2E_Prado?= <nfraprado@collabora.com>
Cc: Nathan Lu <nathan.lu@mediatek.com>, Moudy Ho <moudy.ho@mediatek.com>,
 "Jason-JH . Lin" <jason-jh.lin@mediatek.com>, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 Project_Global_Chrome_Upstream_Group@mediatek.com
References: <20231109082201.7698-1-yu-chang.lee@mediatek.com>
 <20231109082201.7698-2-yu-chang.lee@mediatek.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <20231109082201.7698-2-yu-chang.lee@mediatek.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231109_011055_363180_CB142688 
X-CRM114-Status: UNSURE (   5.23  )
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

Il 09/11/23 09:21, yu-chang.lee ha scritto:
> Add MT8188 VPPSYS0 and VPPSYS1 driver data.
> 
> Signed-off-by: yu-chang.lee <yu-chang.lee@mediatek.com>

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>


