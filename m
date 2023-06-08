Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8A6ABC7EE23
	for <linux-mediatek@archiver.kernel.org>; Thu,  8 Jun 2023 14:18:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=tLc7heHaso59oc04ySY/Jn0H3Jn2Cn1/joAQyaM0uDU=; b=34KWE7dQwQCXYLFEFCbyoU/GtX
	VlBeGVGnXqjiOIvTHNbGQCHGhY4qWu1v/yCHOoxB4oyyL2uc/ZJlWyqYiy0qR4e+3p13eRJ6xuJ/s
	DSG0zgyNXfO1cjXIt8n3LQHiVzyrON9hJnUGNZItA6Mn/UPrRLchMj6AVetnoZeK/JSsDOmBuVG8E
	cMyjrXdgtzi9e5YEqTMMnI7Qglt8i/iT0CvyEDBpQORVaWgI/dOWqJ95/52Cv+xNlNj2AmIQrD6Z5
	k2O4ZyG0E/9LsLsxcl1/lcIeYskeRQbYUpp3HP3U5XQvIiSRa/aFcc2T896V+gU96CaqNGKdJ4il2
	I3k6MuSQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q7GSa-009bGZ-2h;
	Thu, 08 Jun 2023 14:17:56 +0000
Received: from madras.collabora.co.uk ([46.235.227.172])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1q7GSX-009bFX-09;
	Thu, 08 Jun 2023 14:17:54 +0000
Received: from [IPV6:2001:b07:2ed:14ed:a962:cd4d:a84:1eab] (unknown [IPv6:2001:b07:2ed:14ed:a962:cd4d:a84:1eab])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id 05F336606EC6;
	Thu,  8 Jun 2023 15:17:50 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1686233871;
	bh=776w8Rc+ZB/YuVdJraNCHzBh0XlMM1U4N0G+6pRxdoM=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=JMMbGt1+Nw5ErNNdLFOXuT7JWP+JexiZNm3uVwy2MXjzbjmJ5BL26sRYroV9Tzqfl
	 RBDdJT+HOpzjum+cY5BMHg9q/uHFWbnbM9xfEUvP+kAyUZC9N+LLNS29rWDJ4M1yin
	 C86dIIC76EY44w4oF/BmejOvALRjcriEDfUCNInfwpTR7zwZY/kof7/lpU7MJKoje6
	 h7KwEfnz0jIQis2bYEHXUZ1VbfSGV38gT9XzWS27BdvubhM4lrAeJObTF/5iMfzPv1
	 /8+eN7bKqClVQwSMAKP1Y/snUnGe/X1K12kUZQKYi2re7Dn5wo12QcCAZG6JRUsxAa
	 FaByVIDcYF2bg==
Message-ID: <626ae5b5-ca52-987f-855e-d188fa12511c@collabora.com>
Date: Thu, 8 Jun 2023 16:17:48 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.2
Subject: Re: [PATCH 1/4] arm64: dts: mediatek: mt8186: Add CCI node and CCI
 OPP table
Content-Language: en-US
To: Chen-Yu Tsai <wenst@chromium.org>,
 Matthias Brugger <matthias.bgg@gmail.com>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>
References: <20230607090653.2468317-1-wenst@chromium.org>
 <20230607090653.2468317-2-wenst@chromium.org>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <20230607090653.2468317-2-wenst@chromium.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230608_071753_283945_FB9D30EF 
X-CRM114-Status: UNSURE (   8.40  )
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

Il 07/06/23 11:06, Chen-Yu Tsai ha scritto:
> Add a device node for the CCI (cache coherent interconnect) and an OPP
> table for it. The OPP table was taken from the downstream ChromeOS
> kernel.
> 
> Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>



