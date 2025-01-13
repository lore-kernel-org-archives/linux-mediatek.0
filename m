Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AC44FC02183
	for <linux-mediatek@archiver.kernel.org>; Mon, 13 Jan 2025 12:46:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=rQCKXud3Gt7BN2yCd8mJj0aQTB06a+gtHWhuXIGA1Xw=; b=VgxxvwUo1+M1e5pEr1CTBrEoov
	dT5+bGTjOodc0xfOITMb2hyneFVHHgMCqeEJbWA13YSLbsJww0/KFOzCgyn66PO9K83ga7AHWskTx
	LGGAByrK16l0MF21C41T++P5BVBVYqwe2xsMBmCthOb9EBoKuAi21zbQoDK6SxlYqBOGvDmF2nMLE
	93v9jyB4PKu6PBECne5Tvba3W2yvLBYIp3mATolgtI/iR6UwHi7ObvmHyl12YRTFwA+F2d/j2+3Sb
	xHVVP8H4WziHjlemHzgDNIWRR85BGVd2vQAvKc5jONicdK1rFV71Nx6cFHXjiJev8qJTkBzTU4Wf/
	8z/P4a5A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tXJqG-000000059CX-3QzK;
	Mon, 13 Jan 2025 12:46:52 +0000
Received: from bali.collaboradmins.com ([148.251.105.195])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tXJn6-000000058Ss-04Y8;
	Mon, 13 Jan 2025 12:43:37 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1736772214;
	bh=gF0OUfbmCD2nysegX5m1tk0t3k6MTKfXlcfY4zn1JgY=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=FT+svy572GbPZx7XZ13tDlZOr2mejjSx9PRu1QUAWfS/B4bDk4f7EROG1R0aZrOEp
	 dFzVbTmin57tuFZbXrgBMR6rTN7kqbABwtd9ItjPoO/pJDxWlSBX0Hdd+VTjT9S/Qr
	 hEEfsZ+nFH7mjzCSVSDfmVBUV4mw3d+fyzowy6XMGoTY8Ez4XowRU5vYIqq9xvECIE
	 wp1kUa5Y1BHWOnzK2+ltcMSG0OhxFIzgtlmnOskWKPbSEZT10mX7APwvRosA30/qVj
	 obro6+abbJUaqXHWLrzGE2prgTxCKIlgL6/wvOoGsJMu0fgJnoI+G/Hq+iF6+sSh0L
	 ooXF13KyeqQQA==
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 101F517E0DD3;
	Mon, 13 Jan 2025 13:43:34 +0100 (CET)
Message-ID: <19970db5-47ba-4e13-8f55-e5329775da2f@collabora.com>
Date: Mon, 13 Jan 2025 13:43:33 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RESEND PATCH 2/2] phy: mediatek: xsphy: add support to set
 disconnect threshold
To: Chunfeng Yun <chunfeng.yun@mediatek.com>, Vinod Koul <vkoul@kernel.org>,
 Rob Herring <robh@kernel.org>
Cc: Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Matthias Brugger
 <matthias.bgg@gmail.com>, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, linux-phy@lists.infradead.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20250111141542.5007-1-chunfeng.yun@mediatek.com>
 <20250111141542.5007-2-chunfeng.yun@mediatek.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <20250111141542.5007-2-chunfeng.yun@mediatek.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250113_044336_205392_DDCF1539 
X-CRM114-Status: UNSURE (   4.36  )
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

Il 11/01/25 15:15, Chunfeng Yun ha scritto:
> Add a property to tune usb2 phy's disconnect threshold.
> 
> Signed-off-by: Chunfeng Yun <chunfeng.yun@mediatek.com>

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>


