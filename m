Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BE700EA4FD7
	for <linux-mediatek@archiver.kernel.org>; Tue, 24 Feb 2026 09:19:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=e5UHTLAH4eXTANXZV7LhsIQGc++VKw59X4IumTLtC/I=; b=H2iIx45vnflI40X51+FUF0ndCd
	nLE78nNsoe1tVEtsWaC4nn36OeCz6m90A+O4Iecxp2aQGElj3KDlyjrCN65xe4KNgRQ4ut9tK1jTa
	9iGpI6NAtTDf17tUIrranIGklwRSD0QjoNezTKWzGC1gIhJ3mjdfAPy2ZQD8NuYpyDfVaveB5X2Dj
	1HKYgypy7txK6oX7V2TAl+ZqtHfkkML2rkrqsPjzfYEaFyyxn5Czh3Cl28/QLgBscN7U8II2q57y0
	FcF6oOit/6FdXx2H2toOCruzL2wQoc3+6fCLizoYFN1KWIa7P2SLoJ4V9ENDwZT/Q5XswRrrYHaWk
	Gy2ejihA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vuoZg-00000001ix7-1UcN;
	Tue, 24 Feb 2026 09:19:24 +0000
Received: from bali.collaboradmins.com ([2a01:4f8:201:9162::2])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vuoZd-00000001iwW-23uK;
	Tue, 24 Feb 2026 09:19:22 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1771924758;
	bh=4jfgNAYSPdVmBpZEJ/Qh6Bm1tYNGC8vVa7akOnj86tk=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=fuOtpKqcKtQze0aqPhdKJ1aO3dH91tarK49NZ1DoU2aI+tyV9yYdklsUzIuCdike/
	 sBLPvlviBHCFAwB6EnI55JdQpfIM4rfn3d8Cab7Ig6Tligt+Vpz5wWj3aLqoPKUmEX
	 Wqw0Xzb0Q8GjKwhN8qrBo6+b7wu+MUfYMvnMX+Z5FRrlbntfS7auUxHJyEGVij1SOn
	 Kt+JZyqmLG2JkfK8l4nxEg+v6OjstlnTl77RtKutxLgpqnC4V64JtosmZ8k2lTcajO
	 V+ybZic19m3xEmZyjSkPQnt7z3D1DgiHbTgGsqDyMc3MZjDiLA92J1MvY7JfjYY3ri
	 m2V/YPVcDSDwQ==
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id C99D217E03E6;
	Tue, 24 Feb 2026 10:19:17 +0100 (CET)
Message-ID: <d52ecbed-1129-4aa8-b9c5-d9294e7d6cbf@collabora.com>
Date: Tue, 24 Feb 2026 10:19:17 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] arm64: dts: mediatek: mt8195-cherry: Disable xhci1
 completely
To: Chen-Yu Tsai <wenst@chromium.org>,
 Matthias Brugger <matthias.bgg@gmail.com>
Cc: linux-mediatek@lists.infradead.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org
References: <20260224070306.2650182-1-wenst@chromium.org>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <20260224070306.2650182-1-wenst@chromium.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260224_011921_714370_E8921D4D 
X-CRM114-Status: UNSURE (   6.89  )
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

Il 24/02/26 08:03, Chen-Yu Tsai ha scritto:
> There is nothing connected to xhci1 in this design, nor in the actual
> end devices.
> 
> Disable xhci1. Keep the USB PHY enabled, as it is a shared PHY and used
> for pcie1.
> 
> Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>



