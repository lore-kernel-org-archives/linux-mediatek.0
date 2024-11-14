Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3D7B0D65C79
	for <linux-mediatek@archiver.kernel.org>; Thu, 14 Nov 2024 11:30:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=JwAKdypYDhqItAtoLXP9Xzn4cU81fG62oSG3WelyEqY=; b=IUUHcgmpwM42sLsLEaOMlHMH43
	fWOZ/ZTCc8ayuTj/fTZ5JQkh07b5MLajvpFWVkAMg2GV2FLP+BVVdtILo0Q9wfIg+/jWdDqNBe4PQ
	XnqMJs6ZUUtVZ12SgibUZCCAu2SWEpeY+AoHFBxu04/AR+c97KjFH+Lly4/5uy5RqlzknTXd/kPmU
	vfxPGyF6oCYGiSNlD9qMNeFhYGXmB4UVfWb25Hvi7FI2efWNx5wHz2sCPUYC6CyO2K+EAL/aDIwEw
	e3dDk9ANiCfIWBsZaE13+RtY6tULmuTyf0jnrh9JYH5DX5471/UkJsvLGqSzgVmv3N2oJc45Hr0u6
	OK85uoIg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tBY3p-00000009jZO-3uEL;
	Thu, 14 Nov 2024 11:30:53 +0000
Received: from bali.collaboradmins.com ([2a01:4f8:201:9162::2])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tBXDg-00000009ZEO-3gcT;
	Thu, 14 Nov 2024 10:37:03 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1731580619;
	bh=4woJSjD/ZDXAHhgz8oC1hGFxBo/MsEypfEZsBUh6mx0=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=P+kTLKbg57gyQVaXkta4Dj+WKEOhnH+Jhn9iXfY/zNkla/x8gmn+uHPygWV0009PX
	 OUGe7FevFwQ9rljN6atba5fEscFRs9OBr7ucSebdYrnOvU7I6+TC9DAo65WNF0LNEq
	 pyvXn29QioNxi82F6G8i6AaMnI4YbY0xShr0lzqixIWXZP/UFr6cYm8OikdQ/yNku0
	 Sg+xTnWGN4RmxPq76dvhJgG9BNSilXFTM08jY/GlNTBvYR8ABf9VwKIbiGSJJuwPia
	 hCPIM6+Qt7mMTc56kIhpOGJ6XeTgGAIi2H7tDR3haa5WWKMtbo4S2ssNv+1gLo/5EL
	 lAqb1LvqlZ85Q==
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 5419717E35E9;
	Thu, 14 Nov 2024 11:36:58 +0100 (CET)
Message-ID: <1246d672-4370-4db7-b4d0-368524809435@collabora.com>
Date: Thu, 14 Nov 2024 11:36:57 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v11 7/7] arm64: dts: mediatek: mt8173-elm-hana: Mark
 touchscreens and trackpads as fail
To: Chen-Yu Tsai <wenst@chromium.org>,
 Matthias Brugger <matthias.bgg@gmail.com>, Wolfram Sang <wsa@kernel.org>
Cc: Rob Herring <robh@kernel.org>, Saravana Kannan <saravanak@google.com>,
 Benson Leung <bleung@chromium.org>, Tzung-Bi Shih <tzungbi@kernel.org>,
 chrome-platform@lists.linux.dev, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 linux-kernel@vger.kernel.org, Douglas Anderson <dianders@chromium.org>,
 Johan Hovold <johan@kernel.org>, Jiri Kosina <jikos@kernel.org>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 linux-i2c@vger.kernel.org, Andrey Skvortsov <andrej.skvortzov@gmail.com>,
 stable+noautosel@kernel.org
References: <20241106093335.1582205-1-wenst@chromium.org>
 <20241106093335.1582205-8-wenst@chromium.org>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <20241106093335.1582205-8-wenst@chromium.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241114_023701_133090_1AF47DA1 
X-CRM114-Status: UNSURE (   8.99  )
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

Il 06/11/24 10:33, Chen-Yu Tsai ha scritto:
> Instead of having them all available, mark them all as "fail-needs-probe"
> and have the implementation try to probe which one is present.
> 
> Also remove the shared resource workaround by moving the pinctrl entry
> for the trackpad interrupt line back into the individual trackpad nodes.
> 
> Cc: <stable+noautosel@kernel.org> # Needs accompanying new driver to work
> Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>
> Reviewed-by: Douglas Anderson <dianders@chromium.org>

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>


