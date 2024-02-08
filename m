Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DDB02C4828F
	for <linux-mediatek@archiver.kernel.org>; Thu,  8 Feb 2024 11:06:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=mFxUoEBZbzYkrMJW+PYUk5xiC11e9ORCsGgOReq2qw8=; b=pqA8dj7oJRX6cf844AdEVF8kbc
	ZUmEmJlcgrDQtdNGbXFmm5hBb0l7HsMvw29gFmADPdQCcftGW+nY966heloyO939lwc/trhCocckS
	eINpBWuzPyJPN+BhPiZvL4jfWZqJHxTzQxChF0e6nGGNg+kY2DOPrGkKmH+1fJQaQy65RshKPMDBG
	FDePZX5Qqm8Xv+iLHqKriQmI15PmRdVkTbtliN4hCKGgBClHxY6yswTQtd0AyYOy16qIM9rS1tfHM
	6imfqvzOf0EHzdYXBMuzOBzT30/9fFJuU7Ym6+uAwkMEaBH1dzAAnMt2RdT+aVspniUPBgv4MvGxT
	MbLw7gPA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rY2EG-0000000DVtR-2t3g;
	Thu, 08 Feb 2024 11:06:04 +0000
Received: from madrid.collaboradmins.com ([46.235.227.194])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rY2ED-0000000DVrV-2N2v;
	Thu, 08 Feb 2024 11:06:02 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1707390359;
	bh=Cs6htXQD5fBG1zCUptzHGOkqKSyu+r7Da744Jigp1lk=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=qRwNDPiay9bPu9taiyTfr3AV31bGiRL/Op9Ot3D+AuExTqb251f4JjplaWTVWNYvU
	 aDind2pjljl2DpvSCkTrQXN3f8+RvV/Dn4dIZG92zqgFNgNqLX0GhLxEQU6+SCvCCo
	 4AH9xerF2qTaEqgwaikGL2ULKsJWYkXT3SSS7HH8pci9a+3NkoQFwuNG5nl1T/FWUf
	 z2ngE/s6zIKE5WQYUYbN57o1GnyRm+Y+h5JEFJe6YdQvuqsjbIv+vQPtMN/ovkhN6h
	 apnY+rXdhTJdrw4IqOERKJ4nzR9EAgtGyWyBdLjLyPgnZ1dhKUmSiGUuCZsmuw5q1y
	 FD6pMIaec+ANQ==
Received: from [100.113.186.2] (cola.collaboradmins.com [195.201.22.229])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madrid.collaboradmins.com (Postfix) with ESMTPSA id A82A1378134F;
	Thu,  8 Feb 2024 11:05:58 +0000 (UTC)
Message-ID: <7e834188-2838-40fb-961c-fc28bdfca169@collabora.com>
Date: Thu, 8 Feb 2024 12:05:57 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] arm64: dts: mediatek: mt8186: Add video decoder device
 nodes
Content-Language: en-US
To: Eugen Hristev <eugen.hristev@collabora.com>,
 linux-mediatek@lists.infradead.org
Cc: linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, matthias.bgg@gmail.com,
 kernel@collabora.com, Yunfei Dong <yunfei.dong@mediatek.com>,
 Allen-KH Cheng <allen-kh.cheng@mediatek.com>,
 Hsin-Yi Wang <hsinyi@chromium.org>
References: <20231220133302.39411-1-eugen.hristev@collabora.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <20231220133302.39411-1-eugen.hristev@collabora.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240208_030601_780263_03A9E4A3 
X-CRM114-Status: UNSURE (   5.68  )
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

Il 20/12/23 14:33, Eugen Hristev ha scritto:
> From: Yunfei Dong <yunfei.dong@mediatek.com>
> 
> Add mt8186 video decoder device nodes.
> 
> Signed-off-by: Yunfei Dong <yunfei.dong@mediatek.com>
> Signed-off-by: Allen-KH Cheng <allen-kh.cheng@mediatek.com>
> Reviewed-by: Hsin-Yi Wang <hsinyi@chromium.org>
> [eugen.hristev@collabora.com: minor cleanup]
> Signed-off-by: Eugen Hristev <eugen.hristev@collabora.com>

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>


