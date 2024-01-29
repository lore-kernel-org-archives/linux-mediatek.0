Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 36289C47DA9
	for <linux-mediatek@archiver.kernel.org>; Mon, 29 Jan 2024 10:28:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=F8ptq+/xo1iMB8725zNqlWCCxNFfkn5yx0kGrdLN6l0=; b=jdbzhwhehmZ/COyZdlWuu2C+Hk
	P/yPc3Ni1cM7YkFdxIxufoq947cG3sZuOZJO2w0wMWixs+0Np1PTPwCixr6nGOP9NVdBamR5VOU9B
	tPKNqCke06/FRr5ToUn73jOIOO19UpFRMw7mbrsiVLAh62qgkGQwx/kEAfBUCoHvk2jcqYpdkj2cv
	4EqNMkZMx5lADTMst000FpsntzuVq/W84Ki/KYGSLFJmK5mxtjSr09ER9agYK79tHAkDfqaVjk6Za
	xj3Fr7xlwgP/L4SskuOCKqins3/61ws8V9/mDprG81MZtp7/j9VnYs3bn+GG3219es4bfIAp2GcP3
	sIrXOKrw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rUOrv-0000000CDXb-3KGy;
	Mon, 29 Jan 2024 10:27:59 +0000
Received: from madrid.collaboradmins.com ([2a00:1098:ed:100::25])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rUOrh-0000000CDR8-1YNZ;
	Mon, 29 Jan 2024 10:27:46 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1706524063;
	bh=ajpfWU56N4RiwDnamz+uZJp8PwvIobXur3OZBlUPeCM=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=x0PVYpGv8qE8Ji2aqHvfglZO6ogSUhFasmuKtiPZu9dHFW/yKofiFIyqpvnbJnryk
	 ZWyvEwzfBBD+La0u0vIRkeANJWjaNvYKn8SoS0O64ek9xwpRS+h9iXdJirCRyO3cWI
	 AOA95AH5TSIz5A7xKTHr/DOtDaML4KagP0KnWHD1TbLPfbr2FkZvVIwjiLMRinn3yD
	 Z5jK680MEjzcJvNm1+DlejpJ5yBpVr5Oxz35BLAOwSM8HQQXSqOY1ilAbmKn26Hchl
	 Hfcl/OC891mvthb4HihMFNm+5elBm/ca1iA3hqxnbylN+5ta2IX5SWO4ryNN47XXk+
	 7Q/FMSg8lcyLw==
Received: from [100.113.186.2] (cola.collaboradmins.com [195.201.22.229])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madrid.collaboradmins.com (Postfix) with ESMTPSA id 4F9DC3781FCF;
	Mon, 29 Jan 2024 10:27:43 +0000 (UTC)
Message-ID: <861b9921-1869-4341-8299-f25215cfebbb@collabora.com>
Date: Mon, 29 Jan 2024 11:27:43 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 2/3] soc: mediatek: mtk-socinfo: Add driver for getting
 chip information
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
 <20231222080739.21706-3-william-tw.lin@mediatek.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <20231222080739.21706-3-william-tw.lin@mediatek.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240129_022745_587536_DA8A88C8 
X-CRM114-Status: UNSURE (   8.13  )
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
> Add driver for socinfo retrieval. This patch includes the following:
> 1. mtk-socinfo driver for chip info retrieval
> 2. Related changes to Makefile and Kconfig
> 
> Signed-off-by: William-tw Lin <william-tw.lin@mediatek.com>

Applied to v6.4-next/soc

Thanks!
Angelo



