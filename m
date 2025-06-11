Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1F182C61CE7
	for <linux-mediatek@archiver.kernel.org>; Wed, 11 Jun 2025 09:53:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:To:Subject
	:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ccxNtrvIzEpdDUUgcBs30bPJOyasf9xZHHkJqeojH7c=; b=Xx4FyrGERl7ClR
	5ynpAVpZM0FMeUJ0oBqDi/1ajKfHVDmnocNHI5EHUGRv682+SpYoE4SrCoCVv230BRFy3bqOhhG+X
	alJOxrnz6xi9Bi1MsMIw4r1joSOIDasDa6TG/5Hjrin49G5O3f7We8sycnPytxPSPMaYS31FjYlfA
	Rawg+BVitClR2Rhq93HgqfW+TA2rFzgReMNfLTK8gosZyS66edlD11wqilH20VU5gJB22phS8nRrs
	I5Gi+Xj49GCJjcGVZmFMJ3owb6cN8xQfY+XXa6/J0PRMmziSqoBRoRFqJRHYsQDXNBzxLQAn+uFKu
	Tk8/mfjm1u1JVm0fY7+g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uPI8o-00000009XoY-0eME;
	Wed, 11 Jun 2025 09:53:06 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uPHqD-00000009UAh-1lLH;
	Wed, 11 Jun 2025 09:33:53 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=ccxNtrvIzEpdDUUgcBs30bPJOyasf9xZHHkJqeojH7c=; b=IewU4Mdv9xt2TeqgLWnwiVbs+q
	6XSA6haNQP9RFdTvtL7jGfk6/sNqusLIjnVkHeLi6yuN2xK91m+0cr19Mt0BwCMgAoB29FV16C1L6
	e0GztY8iW1OLy5QrnaUjsTzeJmKHRZ//qw9Tu7LO+rBTdGy5BWFy7FuY5GgKJFRdkZQsyQOQzbGt0
	X8KxvscrdX046YKP4NkRK2sGXLj8a6TkgsFOA0XY7+R6LKaNR16irFsCu5VRuZZzvBqyDrFTiwr8A
	ARxXcetp1rN1dDj/pAeLDWbt43j/9SIurNgmdajhKUKWpN/u5l9a5MoY0lETzlni8SdXeVjkiquzu
	e4h/3ppQ==;
Received: from bali.collaboradmins.com ([148.251.105.195])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uPHqB-00000002EZd-2Yx9;
	Wed, 11 Jun 2025 09:33:53 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1749634429;
	bh=zCCyZx0OYW+yvOTE8Ci6a80riXGgIIfyVSbsjo4X6m4=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=nqfkRAAy682u+Zdra5IbBIOtKVicuau8Bqv51dmGLvltbOZuF+adcBmAxNZHMdaZ7
	 cDqFqnCtkA/DEmAf9ZeNNs4ujX40m3PTRkQiRBIwbl7xUe2CkjvYRXCtUbgS4Il8I8
	 mlI3LAjxCFVcsGJXMb9dzb+DcE+0yJSOkUJBpLAQj5PX573l4WLm2ViIEgwfd1WGOm
	 OscA08n9U/Y1x9pI4pxDXTQObOa0E/+rV49oGsXO/+9+AW37l1SOoLknadhHR7JFAA
	 gkK4ODNoPpUY6SilMyccCyoLVFfUnyQW1HJjXUfmAkF2Vpp4pLx0F7ivfXCOLIRzcS
	 dnqG/J2HWTWOg==
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id ECFE817E36D4;
	Wed, 11 Jun 2025 11:33:47 +0200 (CEST)
Message-ID: <d9811928-5236-43d7-8343-2cd26cf873f2@collabora.com>
Date: Wed, 11 Jun 2025 11:33:40 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 09/13] arm64: dts: mediatek: mt7988a-bpi-r4: drop
 unused pins
To: Frank Wunderlich <linux@fw-web.de>,
 MyungJoo Ham <myungjoo.ham@samsung.com>,
 Kyungmin Park <kyungmin.park@samsung.com>,
 Chanwoo Choi <cw00.choi@samsung.com>, Georgi Djakov <djakov@kernel.org>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Andrew Lunn <andrew@lunn.ch>,
 Vladimir Oltean <olteanv@gmail.com>, "David S. Miller"
 <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 Matthias Brugger <matthias.bgg@gmail.com>
References: <20250608211452.72920-1-linux@fw-web.de>
 <20250608211452.72920-10-linux@fw-web.de>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <20250608211452.72920-10-linux@fw-web.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250611_103351_751440_94C62FF3 
X-CRM114-Status: UNSURE (   6.45  )
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
Cc: devicetree@vger.kernel.org, Landen Chao <Landen.Chao@mediatek.com>, Sean Wang <sean.wang@mediatek.com>, =?UTF-8?B?QXLEsW7DpyDDnE5BTA==?= <arinc.unal@arinc9.com>, netdev@vger.kernel.org, linux-pm@vger.kernel.org, Daniel Golle <daniel@makrotopia.org>, linux-kernel@vger.kernel.org, DENG Qingfang <dqfext@gmail.com>, Johnson Wang <johnson.wang@mediatek.com>, linux-mediatek@lists.infradead.org, Jia-Wei Chang <jia-wei.chang@mediatek.com>, Lorenzo Bianconi <lorenzo@kernel.org>, linux-arm-kernel@lists.infradead.org, Felix Fietkau <nbd@nbd.name>
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Il 08/06/25 23:14, Frank Wunderlich ha scritto:
> From: Frank Wunderlich <frank-w@public-files.de>
> 
> Pins were moved from SoC dtsi to Board level dtsi without cleaning up
> to needed ones. Drop the unused pins now.
> 
> Signed-off-by: Frank Wunderlich <frank-w@public-files.de>

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>



