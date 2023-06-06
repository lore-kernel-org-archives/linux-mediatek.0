Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4B9B7C77B73
	for <linux-mediatek@archiver.kernel.org>; Tue,  6 Jun 2023 07:28:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=IGcXs2WgvbDmgs+yAgjOErvVXUSHHRd5g2twKhlKmlo=; b=jqW//LMQIvgFTlLIZrvXzsNZmN
	eZJ4STHqxX32+PNU06Qq83KwrJ90jFkugrN3RXTY/xOos935KQK4TXeW2nvGLkE+r0XGmfc3q+SrR
	vbKJyM85Y4VTh054w6Dv7bnb0LjcLhuy/xlXwEay5kdco3y0aK2OVRLSHgeLWCk/EUfSUUckhpqzz
	AVjC3zNQBAUaqE1CIsTW1GYIOIavS5EuI3hhGiTZT6KjC1swAsJO7Fiwe6cyrQY0jwTeUmzDrugAP
	qE4xaU1Yd0hYSQX3HEf0tTlch2OaqyYw2fW1D1B9+iB57tMOo+d5Bg4DUjKShTptVITSKv6b3tNfD
	tlqQWkHQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q6R7V-000X9w-0i;
	Tue, 06 Jun 2023 07:28:45 +0000
Received: from madras.collabora.co.uk ([2a00:1098:0:82:1000:25:2eeb:e5ab])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1q6R7R-000X7v-21;
	Tue, 06 Jun 2023 07:28:42 +0000
Received: from [IPV6:2001:b07:2ed:14ed:a962:cd4d:a84:1eab] (unknown [IPv6:2001:b07:2ed:14ed:a962:cd4d:a84:1eab])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id CA9DE6602242;
	Tue,  6 Jun 2023 08:28:36 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1686036517;
	bh=pyYwYgG/thDw/e7Th0o26z7PqRLB1l3MTnLTKnKnhvM=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=c2chsJM784VPrrt2tC/268yFVqlR8UIxGiX3OAOk69aRouGNYw7rKUdVnB80DdmM1
	 VoKM8I9otTX7zoaLFDO7juqw3ML+VuAX9LMSn+UbMvM1+Lz4O57mtIzK7wq+2YW1cQ
	 tTXKhtIlofe+7QKrZxnox4l0r3l7mBef2KGn8yZ8ppzOHHLHTCz0uou2QgaQI1yis7
	 liCyB9qyglR9dBZKIzhVaoo9qew7tOx0rdqmQTBq3v6CrDGLDM4cZAyk+/hLJLzFRs
	 0YErAlu7yADh7fCMv0BODFUfgh46Ng7mT7p6f920bHaSb4Np3D1cPpJHCm8PXxKmHp
	 UWfi0EN6gLAqQ==
Message-ID: <1b3dd7b7-3c4a-f18a-a7c2-acab39a77b3d@collabora.com>
Date: Tue, 6 Jun 2023 09:28:34 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.2
Subject: Re: [PATCH 2/6] media: dt-bindings: mediatek,vcodec: Don't require
 assigned-clocks
Content-Language: en-US
To: =?UTF-8?B?TsOtY29sYXMgRi4gUi4gQS4gUHJhZG8=?= <nfraprado@collabora.com>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Hans Verkuil <hverkuil-cisco@xs4all.nl>
Cc: kernel@collabora.com, Andrew-CT Chen <andrew-ct.chen@mediatek.com>,
 Conor Dooley <conor+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring
 <robh+dt@kernel.org>, Tiffany Lin <tiffany.lin@mediatek.com>,
 Yunfei Dong <yunfei.dong@mediatek.com>, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-media@vger.kernel.org, linux-mediatek@lists.infradead.org
References: <20230605162030.274395-1-nfraprado@collabora.com>
 <20230605162030.274395-3-nfraprado@collabora.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <20230605162030.274395-3-nfraprado@collabora.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230606_002841_802212_6EFFAD9D 
X-CRM114-Status: UNSURE (   8.90  )
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

Il 05/06/23 18:20, Nícolas F. R. A. Prado ha scritto:
> On MT8183 it's not necessary to configure the parent for the clocks.
> Remove the assigned-clocks and assigned-clock-parents from the required
> list.
> 
> Signed-off-by: Nícolas F. R. A. Prado <nfraprado@collabora.com>

It should not be mandatory to configure clock parents manually on any model
anyway...

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>


