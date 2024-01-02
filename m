Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5843FC46CD2
	for <linux-mediatek@archiver.kernel.org>; Tue,  2 Jan 2024 09:15:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=98Bb80kwxiws2BkNTrrSYqpOcnwq6ljZ2TVtfCQWkoc=; b=GncPQjjTk5wos5MKdDX/kRMBxK
	dXYR3x9b7U+KJXTs3dRZz0CEL8uzNpc2gDw5TfZfe3MRvBOgLdOV9O5OF/MdFQPZTgAjysZDPdEZY
	2eywC4+yDzm/6amN5lk6E4V0iAJIummDNNfPkDC+SARsHnZSBqEdjmLeRosCZBfjNoz+2Vo+6U8sA
	d81lVKJ2f27NC3ZDtURkmatEMTFcuA28L36QfM2kiSfyQd2evfYIc9FtwjmBEI44AlD0dAE69k89s
	7M8C92Mi/+6+11lJwFtWvVxQMMhTJ9svlVomBCVvmyvMb2DUximHLvhF80nQ02LK/wtxUMLZgHoCz
	ViHJO2Jg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rKarW-007Qkc-1C;
	Tue, 02 Jan 2024 09:15:02 +0000
Received: from madrid.collaboradmins.com ([46.235.227.194])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rKarS-007QhJ-1E;
	Tue, 02 Jan 2024 09:14:59 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1704186897;
	bh=h1vYuqHfw4Si6zEFGSCOCtG/Sf6p6ZMOenHPLIBQu1g=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=m6E0ItzoMYPOvZwdJ9vXEdYJcHQj2X7R7GUh7rEnF6uqjrJAqHNJX3fZ3YU90QkKU
	 F9M5a57t4N/SSBoXdtO4wexHOIXr6JezHTjwTfk/bn5eB6ESJ5brgIpgpJg+0uFUgx
	 eAA3GEsNK8JwORvp5Z92CAXqqHRFDY9eXDPNzy2yH1YEXxjy4xrZYTJ24Eo7ih8RWQ
	 JpVi3bA6HlY9j0bpLSFgcJBnlVEFGRMbToEGWiMU1T5Mt1ssk35v2Rrc2myfLVzreC
	 f3QT+tq67VkSLRWIXHTZoLqX52FD2udi4EGOUle0jz6Oxm8TGKETdtr0iLM3rhXtnq
	 kROLcNG31KPDg==
Received: from [100.113.186.2] (cola.collaboradmins.com [195.201.22.229])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madrid.collaboradmins.com (Postfix) with ESMTPSA id 224FC37804B2;
	Tue,  2 Jan 2024 09:14:56 +0000 (UTC)
Message-ID: <d44ccb77-1bd9-43fe-be2d-cc2c342eae89@collabora.com>
Date: Tue, 2 Jan 2024 10:14:56 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 6/6] arm64: dts: mediatek: mt8186: Add venc node
Content-Language: en-US
To: Eugen Hristev <eugen.hristev@collabora.com>, tiffany.lin@mediatek.com,
 andrew-ct.chen@mediatek.com, matthias.bgg@gmail.com,
 linux-mediatek@lists.infradead.org
Cc: linux-media@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 robh+dt@kernel.org, kernel@collabora.com, Kyrie Wu <kyrie.wu@mediatek.com>,
 Allen-KH Cheng <allen-kh.cheng@mediatek.com>,
 Hsin-Yi Wang <hsinyi@chromium.org>
References: <20231228113245.174706-1-eugen.hristev@collabora.com>
 <20231228113245.174706-7-eugen.hristev@collabora.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <20231228113245.174706-7-eugen.hristev@collabora.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240102_011458_545007_4F749015 
X-CRM114-Status: UNSURE (   6.25  )
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

Il 28/12/23 12:32, Eugen Hristev ha scritto:
> From: Kyrie Wu <kyrie.wu@mediatek.com>
> 
> Add video encoder node.
> 
> Signed-off-by: Kyrie Wu <kyrie.wu@mediatek.com>
> Signed-off-by: Allen-KH Cheng <allen-kh.cheng@mediatek.com>
> Reviewed-by: Hsin-Yi Wang <hsinyi@chromium.org>
> [eugen.hristev@collabora.com: minor cleanup]
> Signed-off-by: Eugen Hristev <eugen.hristev@collabora.com>

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>



