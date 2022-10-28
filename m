Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0CCD8ECAAA1
	for <linux-mediatek@archiver.kernel.org>; Fri, 28 Oct 2022 09:20:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=WB0YSQ/L2Kj4bLE+GXpZX7MZLF99FiddTksnGCzOxs8=; b=bt9LE/X2YURIMEit453LO99TIr
	b5ZpyLzE1FYcZ4gu1bIex079NBtdmT3AGanjprBPIILNgPUDo2FwXnJqBYDT+fCWlk8aKtdHzayW3
	jTC7Ibd2bZl1FOfmZk9ZGcxm4mM9m/uOexHK2NCpZzwBHmeA8sMosiGa76O2zsEW1et89ohYSfVSk
	Eu4IXfTXNeXzCKCC7pCUlqwPk608ziKl7dBuCxNdy13lo9fJyfs+3VrF2iNKKVwYyLSL7hfgaPj9B
	o5t0uYE7/FYt/1oSPtuSRenD1ZVeCHKao1JplaaD6jmXdBphGyIA10+G+4iLPSFbVh4hkh0qNos47
	lZW5Eqvg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ooLX5-00GHLM-SZ; Fri, 28 Oct 2022 09:20:07 +0000
Received: from madras.collabora.co.uk ([46.235.227.172])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ooLWn-00GHFS-9W; Fri, 28 Oct 2022 09:19:50 +0000
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id A223D6602910;
	Fri, 28 Oct 2022 10:19:47 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1666948788;
	bh=MNKmc+jPfq367ieSBuTkIUX4qDSmKXIkbZ7pVJckaLc=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=hpfvFUxs8oHgXMLuos6AueL6YEwUamSpZvCTZhO65voxuEp1IhWkbqU8ltdifQ60y
	 ByI1axyzcoEVuHsR0fgYNlKNAw/kZ7e7ChQ7zEawUBt6WUhAdSlLeGSemJ90F1Ea/o
	 jVhOZ0KkG3nRro9pKlVLvQHlUgLDZPw/kgIb3fpzzjulWwgzfF722xeYE6joK5I5am
	 8kO64ZOpedUV2GrpyE5nQqT/7psdOVtuFMGypaYuojNO+BQZV/yIy+EyLFf9E0u0qw
	 gWGbTD0HrYTnE4QLDVUW/EUMGNvnLJtMNT0dNsC0kOJsJHtMDmAXuBa4NSnwCQraqZ
	 cmoqyFcj3qp6Q==
Message-ID: <020d4a24-9522-c2ab-dd82-f1343b6761be@collabora.com>
Date: Fri, 28 Oct 2022 11:19:45 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.3
Subject: Re: [RFC v2 1/7] arm64: dts: mt7986: harmonize device node order
Content-Language: en-US
To: Frank Wunderlich <linux@fw-web.de>, linux-mediatek@lists.infradead.org
Cc: devicetree@vger.kernel.org, Sam Shih <sam.shih@mediatek.com>,
 linux-kernel@vger.kernel.org, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 linux-arm-kernel@lists.infradead.org
References: <20221026093650.110290-1-linux@fw-web.de>
 <20221026093650.110290-2-linux@fw-web.de>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <20221026093650.110290-2-linux@fw-web.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221028_021949_489698_DB4184E7 
X-CRM114-Status: UNSURE (   7.58  )
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

Il 26/10/22 11:36, Frank Wunderlich ha scritto:
> From: Sam Shih <sam.shih@mediatek.com>
> 
> This arrange device tree nodes in alphabetical order.
> 
> Signed-off-by: Sam Shih <sam.shih@mediatek.com>
> Signed-off-by: Frank Wunderlich <frank-w@public-files.de>

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>



