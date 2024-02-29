Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E1B30C54E41
	for <linux-mediatek@archiver.kernel.org>; Thu, 29 Feb 2024 14:52:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:To:Subject
	:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=jxc7rNcgRmg0ea2Z4hUKuYtXLmQ3BDoVcH4+SGI/Ik0=; b=lZBq85I9vWHhSp
	XOBCALPV89R/d1Bn2lz5No0L1GWj8hmnbjoYgoXCdQquwDmjPrAnrnWmFGG4UFDj+5JFpM4Djx9Ih
	2iwzgPo5OL92qNr/29Ssc7OmPSRgcBTy9EOcQkFVE8Tot/6oZ4wET6QhP6NsTCWRXD6IqSHz+STBO
	2MOROIvEs865Z8Zu3QAQfKGjQFWUstulOLQ+/yMM08Jb7cdQ1NIG8BZPy+1IpsCCA8gjop3y7RREV
	Op75cLSSClLwYXBTm4tLAw1C2hmnPLeM9EZuNJwVJErvKIqUwdGmWrDSiF5zkHdBqT6aIFjO1IcXD
	7rfJVANIp3jAYDEDAafw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rfhlR-0000000Dwy8-20ea;
	Thu, 29 Feb 2024 14:52:01 +0000
Received: from madrid.collaboradmins.com ([2a00:1098:ed:100::25])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rfhlM-0000000DwvB-2Dlf;
	Thu, 29 Feb 2024 14:51:57 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1709218311;
	bh=wrjX1gCWYg6nSC7PmaC6lhYpHs6jGe36eMWuYBSxilk=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=plEqwVnxYxepv2JEG/f9Bg/Gb93C9CmKhxp5jfucjO/sbNALZYICMpViFrBJ4r7xd
	 gnFN14JTKU2IOG3sbHdI0Az0Ckzapl0TEFAGw0oWyTtn8QdGUGmCMFvBdn8tvbPGQR
	 7JH4fOCOY4CkTB+0plwtFdBKVIVPMeKTa38Z6C8zBmXYXzK5BqBbTPAzDn+WXy0Caw
	 d4G5IXOdhVR/6XJy9Vie+p60BEEB02y7OTFGcWZugI0+83J3IHMPU7nzaG084tda0e
	 rLkJ7My88caQ6FW27ofQF45v6mM3g3wHuSj5EnOx+V5hkW/pWhRjmNSnPboOUzLOKp
	 ZZnJgmSZ8gb8Q==
Received: from [100.113.186.2] (cola.collaboradmins.com [195.201.22.229])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madrid.collaboradmins.com (Postfix) with ESMTPSA id 1EDE33782079;
	Thu, 29 Feb 2024 14:51:50 +0000 (UTC)
Message-ID: <9e7e840d-59bf-42fb-8e7b-224afb9f27d8@collabora.com>
Date: Thu, 29 Feb 2024 15:51:49 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/3] dt-bindings: display: mediatek: gamma: Change
 MT8195 to single enum group
Content-Language: en-US
To: "Jason-JH.Lin" <jason-jh.lin@mediatek.com>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>, Matthias Brugger
 <matthias.bgg@gmail.com>, Chun-Kuang Hu <chunkuang.hu@kernel.org>
References: <20240229144844.1688-1-jason-jh.lin@mediatek.com>
 <20240229144844.1688-2-jason-jh.lin@mediatek.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <20240229144844.1688-2-jason-jh.lin@mediatek.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240229_065156_806977_BFF25FD3 
X-CRM114-Status: UNSURE (   8.62  )
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
Cc: devicetree@vger.kernel.org, Project_Global_Chrome_Upstream_Group@mediatek.com, Singo Chang <singo.chang@mediatek.com>, linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org, Jason-ch Chen <jason-ch.chen@mediatek.com>, Nancy Lin <nancy.lin@mediatek.com>, linux-mediatek@lists.infradead.org, Shawn Sung <shawn.sung@mediatek.com>, Johnson Wang <johnson.wang@mediatek.com>, linux-arm-kernel@lists.infradead.org, linux-media@vger.kernel.org
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Il 29/02/24 15:48, Jason-JH.Lin ha scritto:
> Since MT8195 gamma has multiple bank for 12 bits LUT and it is
> different from any other SoC LUT setting.
> 
> So we add MT8195 compatible to the single enum group to make its
> driver data settings can be reused by other SoC.
> 
> Signed-off-by: Jason-JH.Lin <jason-jh.lin@mediatek.com>
> Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>



