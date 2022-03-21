Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C6FAFC433EF
	for <linux-mediatek@archiver.kernel.org>; Mon, 21 Mar 2022 12:08:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Ius2LzAt6OfOXCvXeW5Qp5BJoMnJwPD+Flmvgqiq7NQ=; b=XiBVx7k+LFs6Js
	geGK+5g8zOcGug854drmyWBJHI3/d8Mvkggc1XMWx5MwFMlXoeNQj/YcoL+NCuKTWb7PRMTBAIl7N
	insvJqlQDrlZsnJYYoZ2XBBz366lMuMeVoN5lPjoBD9RzW7z8Fcvma4Lj3igm3WVAMaTPVC1pHc3P
	QNkZXaN4OI73e3+Umz6tOGdYA3uEYAr5za5AJIxUP+GkbUZRigd5BYMg6fABNvP/+0a8UfVP5Z4vc
	updAWZXTiCyOg2qN7KGTuNGWS//wZHJCpoKAfw/tJ3ipt+UjAY+E1bLXjzVdIPeJdLGqAfxSQqG/Y
	sxJZsySmMtmfK2uQYvVg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nWGpK-007bdc-PH; Mon, 21 Mar 2022 12:07:58 +0000
Received: from bhuna.collabora.co.uk ([2a00:1098:0:82:1000:25:2eeb:e3e3])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nWGm6-007a47-0A; Mon, 21 Mar 2022 12:04:41 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (Authenticated sender: kholk11) with ESMTPSA id AD7E51F41AD2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1647864276;
 bh=0E32hCpKZSjwFbFTCvOAEWGN8AIQLFIpV4hPlNASIcE=;
 h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
 b=cGN9nFhnl42bymm/guEJ6/uMryF7ZEaowWYENrNFzoUlzhkv5e0hSHe2bCeU7Er7O
 cb8+WwbewvrUoIq7/lfr8XBWp8GF6vTp0lPcfDLNA7jc/rb+SkgQvaOO+8M9r/ajyT
 gysxJugo9Ug354bD/Dmb8JFv+yTWC9VgulEiK/8kZol4q21kf510lJ7TE9Zs3Z/hob
 Vxh/zYolyjNRv3Eorls2mHogygFHzffPWH2C/wr+v15oOdoFh8sULTWJ+8H1PCTX+d
 S4QbcxKQBVD35lToylbjURjqhKHIHVWbV7SCs2cFLeRAEbXFeM1+hGIQQe+rhuwDHo
 dAXOlX4giFzLA==
Message-ID: <1e2a6251-72e0-e8b4-eebe-2a46c1e98738@collabora.com>
Date: Mon, 21 Mar 2022 13:04:33 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.1
Subject: Re: [PATCH v4 11/22] arm64: dts: mt8192: Add efuse node
Content-Language: en-US
To: Allen-KH Cheng <allen-kh.cheng@mediatek.com>,
 Matthias Brugger <matthias.bgg@gmail.com>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
Cc: Project_Global_Chrome_Upstream_Group@mediatek.com,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org,
 Chen-Yu Tsai <wenst@chromium.org>, Ryder Lee <ryder.lee@kernel.org>,
 Hui Liu <hui.liu@mediatek.com>
References: <20220318144534.17996-1-allen-kh.cheng@mediatek.com>
 <20220318144534.17996-12-allen-kh.cheng@mediatek.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
In-Reply-To: <20220318144534.17996-12-allen-kh.cheng@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220321_050438_261374_2979E067 
X-CRM114-Status: UNSURE (   9.54  )
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Il 18/03/22 15:45, Allen-KH Cheng ha scritto:
> Add efuse node for mt8192 SoC
> 
> Signed-off-by: Allen-KH Cheng <allen-kh.cheng@mediatek.com>

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>

> ---
>   arch/arm64/boot/dts/mediatek/mt8192.dtsi | 15 +++++++++++++++
>   1 file changed, 15 insertions(+)
> 

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
