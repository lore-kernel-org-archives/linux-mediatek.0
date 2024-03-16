Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8D306C54E5D
	for <linux-mediatek@archiver.kernel.org>; Sat, 16 Mar 2024 09:22:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=b8QIHCmNx7i/YQHcmrZytkPV0r8PHOyaKNLruF6ZVFk=; b=u4xRsl0AymW0yZWwoITN3ZLOPw
	paZR0oa3ObcTd10VNT/yz898z8PoLrwHl79ehGG89HsgLfsJFt2yuMe56/dyyN8S1qHNugRwhrzp/
	kmluso+oXx75YPOo9j79hsa54ZoQyluJGgYgM9jmAAjgnyyK+/fgk9aA0Wjd40/CoAEh8h/0XNbGk
	d5gp89UcPSxeF6qyzz0Elm0b+2P8kAjSG6cutJfJVLVeEIU9PVaPhU/hFU/PLpsXa2hcvZDMY7K0Z
	xB/R1XMBA3hNhkBc2eMbmPrAbsItMj7b7/7Nr58E1OUY8+/ILQfa/d9QAz/EAowOCKexPlyR1tHRt
	pCqKNsTA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rlQF4-00000002qSo-24z5;
	Sat, 16 Mar 2024 09:22:14 +0000
Received: from relay7-d.mail.gandi.net ([2001:4b98:dc4:8::227])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rlQEz-00000002qQI-1xeG;
	Sat, 16 Mar 2024 09:22:11 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id 3371820004;
	Sat, 16 Mar 2024 09:22:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arinc9.com; s=gm1;
	t=1710580927;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=b8QIHCmNx7i/YQHcmrZytkPV0r8PHOyaKNLruF6ZVFk=;
	b=SEqZ88Ecred72uF5zEPxsjxIjDZ9nsdBQm1nsbxu4WQ1NuoBxJ+QWuS5leLg2V7QK5YTok
	SmEYKza0fRtj+c7YEEdVfZvZ5/58zg/ZIRvUtI6eqvnmB+6aApk9zGldWNfw1POn5cMWfe
	PYLeDQpu32VOgKuMzVo42XVa4qJhHNmEZQYBVoEE/6dghyvPIOvbnX7cQZIAGZIQEetPy9
	cPAr+TNWpMA37z6HZyaqWyMl8X2CvvIHq1qEE8SzrjBO6EEuQPo3ltREFpEfoc2oKSx6T0
	xBL/PMaEs2oYBINPU3SvGf64cScui2Xg1USo3R7XlIJsM13pzgcJoRNeVgut+Q==
Message-ID: <4e8bcb9b-8df1-40f6-a0ad-6ef4ff4339a5@arinc9.com>
Date: Sat, 16 Mar 2024 12:21:50 +0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 06/14] mips: dts: ralink: mt7621: reorder i2c node
 attributes
Content-Language: en-US
To: Justin Swartz <justin.swartz@risingedge.co.za>,
 Sergio Paracuellos <sergio.paracuellos@gmail.com>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: linux-mips@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org
References: <20240316045442.31469-1-justin.swartz@risingedge.co.za>
 <20240316045442.31469-7-justin.swartz@risingedge.co.za>
From: =?UTF-8?B?QXLEsW7DpyDDnE5BTA==?= <arinc.unal@arinc9.com>
In-Reply-To: <20240316045442.31469-7-justin.swartz@risingedge.co.za>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-GND-Spam-Score: 400
X-GND-Status: SPAM
X-GND-Sasl: arinc.unal@arinc9.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240316_022210_190910_02EBD37A 
X-CRM114-Status: UNSURE (   5.53  )
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

On 16.03.2024 07:54, Justin Swartz wrote:
> Rearrange the order of the i2c node's attributes so that they
> are inline with the DTS style guide.
> 
> Signed-off-by: Justin Swartz <justin.swartz@risingedge.co.za>

Reviewed-by: Arınç ÜNAL <arinc.unal@arinc9.com>

Arınç

