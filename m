Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3EA31C30658
	for <linux-mediatek@archiver.kernel.org>; Fri,  5 Jul 2024 08:15:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=OmkrtfEUdFvozSjfA39p/l3Xsv+cSKAJHI1ylRoY/aw=; b=pKljekw5EmvHqKGJnqq8ju9A12
	6W5wPTMilIpHL5QJ6+tMG0mk/Yp1cos/EhLy+mhiUmfI2qb1PKKWgOvOeUwURC5BLxfiipjxtSuO3
	A7jwk3svXwgqinh6vEg2k73dDZQ5zoWrgl7FTV3Zn4kAVgPixj4sKmATks0ao6veIp0lVPgpLgh0U
	djg5JpvJdFMY8jkLDRcwEMV1U6qO86FtvVm34kdSaFzY/pfjOJeqjmjTYFMkRM+M2i8qFbwIgz6xD
	LnHjK3mYZPIim0QW67opV5LGDWmMfeUeTy9tluNstd10rDMmFBTIJfu9LssaWeWpL4PYS0KxK7hRx
	JP9/dkSQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sPe6Z-0000000FFRq-3Jge;
	Fri, 05 Jul 2024 08:15:43 +0000
Received: from madrid.collaboradmins.com ([46.235.227.194])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sPe6K-0000000FFOX-361Y;
	Fri, 05 Jul 2024 08:15:30 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1720167327;
	bh=v8uY+U/v4+/KYsVNbjOHBixlT8XUI33ol/EaZdCKegM=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=yRftDw44XUiLlWLrX1YfppGXXmiox/G5KErBQtxov/tSW0FpUTaJoq6CfUwQCPKwU
	 edEbkH9tzV+5WggOnuTENFXqsTlYbGlXSbl7L5XeA6fSQrBZdJlqnCp5OCXVeAnEkq
	 3szApDyjE2DtOJNW7TdJBH0N86RAnAgiAjXmTyjIYrXHV9IAtWtI3CHGJiX1bfHnlO
	 5g8pCXwOYRCwr8Y9Hu+qKbkxWH7PYXfVRs80xyiHuQ5NAbltIxSV53/wC3RpakkRRK
	 mD2yWrQLaaPgEYesHj9MtZHcnDYrMF+FG0DS6tHrSG/Xtw72xUV4kaMpMex91QOFJc
	 jOEKdijsOO/ag==
Received: from [100.113.186.2] (cola.collaboradmins.com [195.201.22.229])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madrid.collaboradmins.com (Postfix) with ESMTPSA id F3033378219E;
	Fri,  5 Jul 2024 08:15:26 +0000 (UTC)
Message-ID: <3270d54d-daac-4bb4-87ce-7525d8bf3302@collabora.com>
Date: Fri, 5 Jul 2024 10:15:26 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] i2c: mt7621: Add Airoha EN7581 i2c support
To: Lorenzo Bianconi <lorenzo@kernel.org>, linux-i2c@vger.kernel.org
Cc: sr@denx.de, andi.shyti@kernel.org, matthias.bgg@gmail.com,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 lorenzo.bianconi83@gmail.com, upstream@airoha.com,
 benjamin.larsson@genexis.eu
References: <cover.1720130844.git.lorenzo@kernel.org>
 <a2d319c12b7f4ba561e448e5dc4f0a785a5985c3.1720130844.git.lorenzo@kernel.org>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <a2d319c12b7f4ba561e448e5dc4f0a785a5985c3.1720130844.git.lorenzo@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240705_011528_936744_6C0D21DA 
X-CRM114-Status: UNSURE (   4.71  )
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

Il 05/07/24 00:16, Lorenzo Bianconi ha scritto:
> Introduce i2c support to Airoha EN7581 SoC through the i2c-mt7621
> driver.
> 
> Tested-by: Ray Liu <ray.liu@airoha.com>
> Signed-off-by: Lorenzo Bianconi <lorenzo@kernel.org>

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>



