Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 54850C7EE31
	for <linux-mediatek@archiver.kernel.org>; Mon, 29 May 2023 08:02:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=3QB0jHp6XOlmij0Pmb7qRsv87DzKqkHIV4apLBqGmUQ=; b=R6o+ZUFsI96e90gk79YnBHkEK7
	PsDcZgPNHsgHrMbJJflObz6j90mVb6ZxiodK+lJRZCWBPFNRc0u4L0/s1LgyhX31JnwAzczyi4pmm
	M2CxpbglXaAXCXhpPP1LTfqwhiMZ79HNAbjMyx4x4runXpjQSlHRq2GpG/zpwV/CV534+UvkGS/IT
	NU6imX+2iKRcii7zNMsE+cITsJjcG+/04xqVtP091amrDTDcJAcrnnKx5ePYdKXrbltCwnFD732jt
	5UvJ/I+VO5I6TvG/zUjlpjGZ0SYGnTiALqXe8Da32N1K/XxMRsFjucH9gSE6WTywAJ1SgvmEOIed7
	oyXZBJBg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q3Xpt-009ecc-2U;
	Mon, 29 May 2023 08:02:37 +0000
Received: from madras.collabora.co.uk ([2a00:1098:0:82:1000:25:2eeb:e5ab])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1q3Xpq-009eb7-0y;
	Mon, 29 May 2023 08:02:35 +0000
Received: from [IPV6:2001:b07:2ed:14ed:a962:cd4d:a84:1eab] (unknown [IPv6:2001:b07:2ed:14ed:a962:cd4d:a84:1eab])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id 79C1C6605961;
	Mon, 29 May 2023 09:02:31 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1685347352;
	bh=A4ZNREQoh5/KC7x7Aai+h2epscmtPk1u6BBSzcPw1yE=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=dX6SHWyOxgUzPCOpqEMFwfU+oDrE2Q9SSL6ricQ3zd7lGcaD3r9IwZdbfbjLB40Ik
	 Sp4UqpDoKXrblE28lnsvwltd+8w2d1o57AMCrzERi6Zr3wrjVGUhC+zN5y5Tpk1kD6
	 eOpc8OW1TZ+ytBLa4U0aLa/o2vJCU+gXldjU5EoOJB8mUwz08lgUMnRqyw811AxiRX
	 k4EIiiMVX3rQP1iElyi+w4xNvoFcIfxZAzWHGN+5I1x9LAg0ZCUnAp+6f3dN5rJ7BN
	 X6qv/9KC+Oc3PFU/EKQzH+OcXUw0LAmu+4wh/6fRoIt/mkdD5khf6bc9v01SLa+C3B
	 fLDu65wLzWeSg==
Message-ID: <f4a9e090-3712-200e-bd09-70090c9cccbc@collabora.com>
Date: Mon, 29 May 2023 10:02:28 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.1
Subject: Re: [PATCH] arm64: dts: mediatek: mt8173-elm: remove panel model
 number in DT
Content-Language: en-US
To: Doug Anderson <dianders@chromium.org>, Icenowy Zheng <uwu@icenowy.me>,
 Pin-yen Lin <treapking@chromium.org>
Cc: Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Matthias Brugger <matthias.bgg@gmail.com>, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, dri-devel@lists.freedesktop.org
References: <20230526100801.16310-1-uwu@icenowy.me>
 <CAD=FV=UxrFVZXn+dtgamttTVopWMSVbxYsHCGG_tS+3OTXbHiw@mail.gmail.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <CAD=FV=UxrFVZXn+dtgamttTVopWMSVbxYsHCGG_tS+3OTXbHiw@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230529_010234_500076_AEC87F84 
X-CRM114-Status: GOOD (  26.22  )
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

Il 26/05/23 16:24, Doug Anderson ha scritto:
> Hi,
> 
> On Fri, May 26, 2023 at 3:09 AM Icenowy Zheng <uwu@icenowy.me> wrote:
>>
>> Currently a specific panel number is used in the Elm DTSI, which is
>> corresponded to a 12" panel. However, according to the official Chrome
>> OS devices document, Elm refers to Acer Chromebook R13, which, as the
>> name specifies, uses a 13.3" panel, which comes with EDID information.
>>
>> As the kernel currently prioritizes the hardcoded timing parameters
>> matched with the panel number compatible, a wrong timing will be applied
>> to the 13.3" panel on Acer Chromebook R13, which leads to blank display.
>>
>> Because the Elm DTSI is shared with Hana board, and Hana corresponds to
>> multiple devices from 11" to 14", a certain panel model number shouldn't
>> be present, and driving the panel according to its EDID information is
>> necessary.
>>
>> Signed-off-by: Icenowy Zheng <uwu@icenowy.me>
>> ---
>>   arch/arm64/boot/dts/mediatek/mt8173-elm.dtsi | 2 +-
>>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> We went through a bunch of back-and-forth here but in the end in the
> ChromeOS tree we have "edp-panel" as the "compatible" here in the
> ChromeOS 5.15 tree and this makes sense.
> 
> Reviewed-by: Douglas Anderson <dianders@chromium.org>
> 
> ...in theory one would wish for a "Fixes" tag, but I think in previous
> discussions it was decided that it was too complicated. Hardcoding the
> other compatible string has always been technically wrong, but I guess
> it worked at some point in time. The more correct way (as you're doing
> here) needs the DP AUX bus support and the generic eDP panels, both of
> which are significantly newer than the elm dts. So I guess leaving no
> "Fixes" tag is OK, or perhaps you could do the somewhat weak:
> 
> Fixes: c2d94f72140a ("arm64: dts: mediatek: mt8173-elm: Move display
> to ps8640 auxiliary bus")

I remember I didn't change the compatible to panel-edp because it didn't
work at that time, but it does now... I'm not sure what actually fixed that
and if the commit(s) was/were backported to that suggested point, so I
would leave the Fixes tag out, as that may break older kernels.

Anyway, for this commit:

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>

