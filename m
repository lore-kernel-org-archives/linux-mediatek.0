Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B1597C46CD2
	for <linux-mediatek@archiver.kernel.org>; Tue,  2 Jan 2024 09:48:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=LCMS7iAzxzmZ1wpUUo7D6kq8mQf1v4SfXNjzsd3EXA0=; b=Ex/djjrVbvc6rcZ9bYre1/GhhG
	GFUGMGpyosAA70WvC8BdQCFFD7/sBX9Dc/1yIBIklwPYC/JkvOx4o14q9JyKBeAUrL8GTP+6/4mAp
	0IyRYQVigAFLfoYLhBQoNArmtQL6XnpixvvmSj8YOa0r5c+CO9FWo6HWtkWdzCVoihD86GSoRo8i6
	gYhERdO/gSLsX+ndtoj9MVjqdIKguE0TSFOhfwf8h+uLrUJhxWzLGYYtZ+wGqv92adtSYVQOhEqU1
	zaVPCPG7Y6xCIGOxVxJnvNYerJouGI/b9/n0tHo/E3/slnYzeE8hYClNUGt0XNCA5QUc2J+FLC/X1
	XaCIQ9lw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rKbOK-007VFz-2L;
	Tue, 02 Jan 2024 09:48:56 +0000
Received: from madrid.collaboradmins.com ([46.235.227.194])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rKbOG-007VE4-37;
	Tue, 02 Jan 2024 09:48:54 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1704188931;
	bh=lcIOgXE6OIn9Fcsrj3oASGuidAvBxdVMC9raUI1LSV4=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=r6nhnP0ZNJC/FtMrd+420G2H6IbzGwqeHXsRSbuhKbhzTzPXcGE8Zcw/ATuLKJAFM
	 //wUCCeNKoanmY/YBdX5Ah7+F1EU1hqtPJXvJU+xWpnXF1qzQPHzXW+nG5q4QP7o2N
	 vASLRXN0txjetnJBhBZSPG5XjdxgxoxIKiFYkVMx7WfBtJQbbAKQ+5iof9P36t/Iso
	 UwBqvxAZ8YSQilta6ADtKYOfoJU2IeH/fT/yeGrPMBlrwtiYEQS2kjIWro8kWZxZeF
	 FsVteTT1rx5Q8XuG2O0FqE7TJdp6ttG2cujiA/RrLBsHZnH/nimUbLJPp5cFSHUTHq
	 gBh8VDEkquhTg==
Received: from [100.113.186.2] (cola.collaboradmins.com [195.201.22.229])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madrid.collaboradmins.com (Postfix) with ESMTPSA id 82CCD37813DB;
	Tue,  2 Jan 2024 09:48:50 +0000 (UTC)
Message-ID: <94bbcec7-b587-4c19-8d81-44749885968c@collabora.com>
Date: Tue, 2 Jan 2024 10:48:49 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 3/3] nvmem: mtk-efuse: Register MediaTek socinfo driver
 from efuse
Content-Language: en-US
To: William-tw Lin <william-tw.lin@mediatek.com>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>, Matthias Brugger
 <matthias.bgg@gmail.com>,
 Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org
References: <20231222080739.21706-1-william-tw.lin@mediatek.com>
 <20231222080739.21706-4-william-tw.lin@mediatek.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <20231222080739.21706-4-william-tw.lin@mediatek.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240102_014853_129923_3FD5B0CA 
X-CRM114-Status: UNSURE (   8.88  )
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

Il 22/12/23 09:07, William-tw Lin ha scritto:
> The socinfo driver reads chip information from eFuses and does not need
> any devicetree node. Register it from mtk-efuse.
> 
> While at it, also add the name for this driver's nvmem_config.
> 
> Signed-off-by: William-tw Lin <william-tw.lin@mediatek.com>

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>



