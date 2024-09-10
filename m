Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A6C1AECE564
	for <linux-mediatek@archiver.kernel.org>; Tue, 10 Sep 2024 08:29:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=6A/jOsZz0DNJFxZHJIVwOo8s6QJgFD0JwwVF3SwE4CY=; b=UbrBJNm/W8dsWWcDhHgYHvoGJq
	cFsKM+V27MmUhV9Q2U6mCbgKFQIZ7zUnhgDsDPcso1X5j5tiWIfuS7crz7AbbUyc4IdALllue7UzB
	WBW66K5GNAGhJae2Roet5SW7p6DKlLh0bVbEsLuBaFwSJg24VQcoz8ywkfJMXj35vCoIStctmD5yl
	d53qLaODjOEzOOX+V5q+lNMqKKt1+jIjTxepA+0/FEWX5h3oY4hSDAhu+q90hXyfWsQmyhlWOmZEM
	c2KHKiBa6NE6APadr1+HGQ5mE6TLtmqiHR3kbQpU6eFJ7Igrq+v1KACQHeKyIIfSEZ8VI0y1/VILg
	Apd+qGBg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1snwFE-00000004p4v-49zj;
	Tue, 10 Sep 2024 08:29:04 +0000
Received: from a7-46.smtp-out.eu-west-1.amazonses.com ([54.240.7.46])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1snwEk-00000004p0P-2iB9;
	Tue, 10 Sep 2024 08:29:03 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=4232tfv5ebdrjdwkr5zzm7kytdkokgug; d=collabora.com; t=1725956910;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:In-Reply-To:Content-Type:Content-Transfer-Encoding;
	bh=hlHx2tkxJmJVKOYtsBb2FRbgi+CEkoEUjUh4lVTrpBM=;
	b=alAdWhC5X8+zfLdVTCk+QCYsyHg5+zm68bg+jy+x7vOoDAecCcVd+RQuz4v3a2g2
	xv8k+cBg9eWYEWShSR96ay+spnU6JQIR5jfaSWw5aknkSDXOsJAWvUtZXq+ngFk06J+
	S3kH8gqhJbTcGi5yo3Uxy2ejDlx6+xI1S4aW8nfpnol3SF0EdIIZzL5OJAT75B0VPf6
	hwwSR97mnjVxL4vmd+KkXmqrYRrh3hf26I2wnSXzWqTQF2HYb/AXSrplL+9v7Zg7Utw
	h6V4vX7MnkJGUBitPN1Ph6c1KTpkCVZQFDhy/LYI3Vz+oWhLr1bHcS5BGpwDnTN8g9/
	5pBm+4xmBA==
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=uku4taia5b5tsbglxyj6zym32efj7xqv; d=amazonses.com; t=1725956910;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:In-Reply-To:Content-Type:Content-Transfer-Encoding:Feedback-ID;
	bh=hlHx2tkxJmJVKOYtsBb2FRbgi+CEkoEUjUh4lVTrpBM=;
	b=HatTb9VqE8+wHu/NSH8zD95azyzpeetDjAmLVjhbSL6Py46DAxdSYsgRqxtV3zlf
	Xt2ozlYzQxdJT/GLoJZpRVJMEQuoKrvOWHCiQE6RWiK11RL9s2v5URcRgX2VMxr2Xj/
	XUNY/d2sVwfLEZ1XDetUQ67S8nYJXeRZIRdxXqxw=
Message-ID: <01020191db0c6d91-0c23da5b-eb4d-4869-a27b-d1d3b14afb3b-000000@eu-west-1.amazonses.com>
Date: Tue, 10 Sep 2024 08:28:30 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] arm64: dts: mt8183: set DMIC one-wire mode on Damu
To: Hsin-Te Yuan <yuanhsinte@chromium.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, 
	Matthias Brugger <matthias.bgg@gmail.com>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, 
	linux-mediatek@lists.infradead.org, 
	Hsin-Yi Wang <hsinyi@chromium.org>
References: <20240910-one-wire-v1-1-d25486a6ba6d@chromium.org>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <20240910-one-wire-v1-1-d25486a6ba6d@chromium.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Feedback-ID: ::1.eu-west-1.YpP9ZbxnARFfy3Cb5pfsLd/pdsXBCNK0KEM7HforL4k=:AmazonSES
X-SES-Outgoing: 2024.09.10-54.240.7.46
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240910_012835_252429_3D02C01A 
X-CRM114-Status: GOOD (  12.42  )
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

Il 10/09/24 08:33, Hsin-Te Yuan ha scritto:
> From: Hsin-Yi Wang <hsinyi@chromium.org>
> 
> Sets DMIC one-wire mode on Damu.
> 
> Signed-off-by: Hsin-Te Yuan <yuanhsinte@chromium.org>

Isn't this a fix? (fixes tag!)

Cheers,
Angelo

> ---
>   arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-damu.dts | 4 ++++
>   1 file changed, 4 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-damu.dts b/arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-damu.dts
> index 0b45aee2e29953b6117b462034a00dff2596b9ff..06a689feff52945d141d196d439cba034f25fdf6 100644
> --- a/arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-damu.dts
> +++ b/arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-damu.dts
> @@ -26,6 +26,10 @@ &touchscreen {
>   	hid-descr-addr = <0x0001>;
>   };
>   
> +&mt6358codec {
> +	mediatek,dmic-mode = <1>; /* one-wire */
> +};
> +
>   &qca_wifi {
>   	qcom,ath10k-calibration-variant = "GO_DAMU";
>   };
> 
> ---
> base-commit: da3ea35007d0af457a0afc87e84fddaebc4e0b63
> change-id: 20240910-one-wire-2d0f7113dc8b
> 
> Best regards,


