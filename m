Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 13D49C4332F
	for <linux-mediatek@archiver.kernel.org>; Wed,  2 Nov 2022 20:21:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=TKgyGmLGns/J1WdWysRqsMuhFzk7BQnfz2/MOei0wJc=; b=1prbYmwFC87rnxlPga0w3XsQCF
	xxgDbzXQf6CcmIRuIAhBpbHuRPJx9wuQ+gm0aqvuvTrUBUE4xpyZocunTgjfwJdsdO0GkSiDLJ+wy
	4KPq2HG4LvS9G34fslMOSRSZrzjmiZjoPMEAZMvCVvwV1YefdcE+8rndS22sLtZvMQay8sVnuLLk4
	XhtqLyaJshwE03HefegzS3fsQGMCuAsJkyMFxyUMz6tndABufDVnS/8Ew8XRxIfJHR/cgi35FuL9f
	n8tq4ETwVVrJnb6PEwdvW3WBNngoBlkEqYGXkzIX7b731bXHmK1NYH1iCrQ7ldAZzKZjyd+Odt2UJ
	Q7aCwTaQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oqKEt-00EDau-KE; Wed, 02 Nov 2022 20:21:31 +0000
Received: from madras.collabora.co.uk ([2a00:1098:0:82:1000:25:2eeb:e5ab])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oqKEh-00EDV6-92; Wed, 02 Nov 2022 20:21:20 +0000
Received: from notapiano (unknown [IPv6:2600:4041:5b1a:cd00:524d:e95d:1a9c:492a])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: nfraprado)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id 8FB4F66028C5;
	Wed,  2 Nov 2022 20:21:16 +0000 (GMT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1667420477;
	bh=NE948HkjaezAzBYfOXSQ7XoQiVmIbeuewynXUFErcXc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=hMqp992oQRDgBOvterq95Nb0XTsFLMFcAvDB4RDDqPvyJqAuBXfOJaa4ESr859qbh
	 7hXc0Rur93SwOVtstppierl9qRIHJuu4c3vw/w3fdDEWy6cIyJmPXF2AVDVvcZYbKd
	 /wtiyR8A78I08v2jtrTp1muHrjuEbydfL07ODxnE1uo4dFi41JvWv4vE3sxmeSPtio
	 AT0idVOognVchYJ2DAbvv5e7osCqhwSK5ScJyZtPt2AMtERw2/MrIFd2g8lDLXt/1Y
	 ejtOU9QIOOsXAslYkUcgQhUD5OjmVGRlergwbaLIiKHMV01NWe5o139CB/EpPakvls
	 qRKhpTxiz7Nlg==
Date: Wed, 2 Nov 2022 16:21:12 -0400
From: =?utf-8?B?TsOtY29sYXMgRi4gUi4gQS4=?= Prado <nfraprado@collabora.com>
To: Allen-KH Cheng <allen-kh.cheng@mediatek.com>
Cc: Wim Van Sebroeck <wim@linux-watchdog.org>,
	Guenter Roeck <linux@roeck-us.net>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	Rob Herring <robh+dt@kernel.org>,
	angelogioacchino.delregno@collabora.com,
	Project_Global_Chrome_Upstream_Group@mediatek.com,
	devicetree@vger.kernel.org, linux-watchdog@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	linux-mediatek@lists.infradead.org
Subject: Re: [PATCH v3 4/7] arm64: dts: mediatek: mt8516: Fix the watchdog
 node name
Message-ID: <20221102202112.w77otebl23wesdaq@notapiano>
References: <20221101090116.27130-1-allen-kh.cheng@mediatek.com>
 <20221101090116.27130-5-allen-kh.cheng@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20221101090116.27130-5-allen-kh.cheng@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221102_132119_467261_F0432CA3 
X-CRM114-Status: GOOD (  15.75  )
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

On Tue, Nov 01, 2022 at 05:01:13PM +0800, Allen-KH Cheng wrote:
> The proper name is 'watchdog', not 'toprgu'.
> 
> Signed-off-by: Allen-KH Cheng <allen-kh.cheng@mediatek.com>
> Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
> ---
>  arch/arm64/boot/dts/mediatek/mt8516.dtsi | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/arch/arm64/boot/dts/mediatek/mt8516.dtsi b/arch/arm64/boot/dts/mediatek/mt8516.dtsi
> index d1b67c82d761..fff59dc1b4d7 100644
> --- a/arch/arm64/boot/dts/mediatek/mt8516.dtsi
> +++ b/arch/arm64/boot/dts/mediatek/mt8516.dtsi
> @@ -202,7 +202,7 @@
>  			#clock-cells = <1>;
>  		};
>  
> -		toprgu: toprgu@10007000 {
> +		toprgu: watchdog@10007000 {

Rename the label to watchdog as well. It's not used elsewhere yet anyway, so
won't add to the diff.

Otherwise,

Reviewed-by: Nícolas F. R. A. Prado <nfraprado@collabora.com>

Thanks,
Nícolas

