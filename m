Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4EBF1CE7AE0
	for <linux-mediatek@archiver.kernel.org>; Fri,  6 Sep 2024 08:15:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=RZOPnIhWtFX3uCEDcD5VPfJhp13BsZ3mcHU/l6ek8dE=; b=FukIeUZo9Gw/+mgLeTwO3Mq2LJ
	bFWNnjUUMXp+v8GBNRZErgWLbT4S39xmbOEmFEFWlQzdhMJG4SAQwga2/MJArjPcRjCEYasztuUOg
	r1b8Z5kye8KGwBlCQqtsP2hLXTx0ewpEUhhQKmqu7aO8vZLOLI44R1xfqWDFaCKeNbHwhR8gM6Nl8
	K37y23xQQHHnaiyAjREOscfWCtQkEa0pBjA/eNAV6TTOLafi1+RAg7RREbEWmz8eWfSV6lAuHTYtY
	8HRQ8RHEDXsXoja5Qy+YQKObm2eq/2viSNM44PR90yoxKaUEANcJDuzt4wkLWiu5uMgOC1Y6pXiAz
	WYo46EsA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1smU8M-0000000BGMW-3dWV;
	Fri, 06 Sep 2024 08:15:58 +0000
Received: from a7-48.smtp-out.eu-west-1.amazonses.com ([54.240.7.48])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1smU6Z-0000000BFkt-44kU;
	Fri, 06 Sep 2024 08:14:09 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=4232tfv5ebdrjdwkr5zzm7kytdkokgug; d=collabora.com; t=1725610443;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:In-Reply-To:Content-Type:Content-Transfer-Encoding;
	bh=VX7OlLnBt7jfAMupnrzu9AoSfcrke19/MgnbQULyPN0=;
	b=eFD/OAhUGa5sw9pLaicdiqtoY6wLOPI1biF5Wxi58nit79YB+YR36Rv6jMej/GEq
	IciE4Q6NLUxLH//4vNXgmxFlvx+yJ8LnQl/IwqDvNZpPb6VJKPfDbiOkPuffaaMpZHT
	t4trHzi8nnYw3YQETnln1kIJ0NhBRZG53rrMX+vozzla1B6GL2rvIEz9D6uKpTnaaar
	DU/y8yuvLlMoKID0KJsl9CE5oTRgQ5iaQe9gfHVzJncnTUnS/1s9xEHjg58cUJ2g4lj
	WnHFOeHtmg+XcZQL6hRM1EuUK/ZhzT+zRI2LFqeHHOgD8e1RcJEuSNEmjieO36naPuE
	CTz9DvUBnA==
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=uku4taia5b5tsbglxyj6zym32efj7xqv; d=amazonses.com; t=1725610443;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:In-Reply-To:Content-Type:Content-Transfer-Encoding:Feedback-ID;
	bh=VX7OlLnBt7jfAMupnrzu9AoSfcrke19/MgnbQULyPN0=;
	b=fX/Jydk1y6+dVBlfSvKcrqhkAlAVAqdnPwf7EzAfbEiZtIQjuMfTKcUauJp/j99e
	vYsA8VTOqrT93Ll54NNjVHeOYlqwER/vyYQ4YWuKgMdmOZCCEvqDyAP+CS6SxPl3jsJ
	s65MA5jq66MD715cIMZDdIrJFo5oA+JWsgDSPcz8=
Message-ID: <01020191c665c261-8b839b39-d297-441f-8b83-49edd60ba752-000000@eu-west-1.amazonses.com>
Date: Fri, 6 Sep 2024 08:14:03 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/1] drm/mediatek: Fix get efuse issue for MT8188 DPTX
To: Liankun Yang <liankun.yang@mediatek.com>, chunkuang.hu@kernel.org, 
	p.zabel@pengutronix.de, airlied@gmail.com, daniel@ffwll.ch, 
	matthias.bgg@gmail.com, ck.hu@mediatek.com, shuijing.li@mediatek.com, 
	jitao.shi@mediatek.com, mac.shen@mediatek.com
Cc: Project_Global_Chrome_Upstream_Group@mediatek.com, 
	dri-devel@lists.freedesktop.org, linux-mediatek@lists.infradead.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
References: <20240902133736.16461-1-liankun.yang@mediatek.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <20240902133736.16461-1-liankun.yang@mediatek.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Feedback-ID: ::1.eu-west-1.YpP9ZbxnARFfy3Cb5pfsLd/pdsXBCNK0KEM7HforL4k=:AmazonSES
X-SES-Outgoing: 2024.09.06-54.240.7.48
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240906_011408_188533_0B60CF5E 
X-CRM114-Status: UNSURE (   7.91  )
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

Il 02/09/24 15:36, Liankun Yang ha scritto:
> Update efuse data for MT8188 displayport.
> 
> The DP monitor can not display when DUT connected to USB-c to DP dongle.
> Analysis view is invalid DP efuse data.
> 
> Fixes: 350c3fe907fb ("drm/mediatek: dp: Add support MT8188 dp/edp function")
> 
> Changes in V2:
> - Add Fixes tag.
> - Update the commit title.
> - Update the commit description.
> Per suggestion from the previous thread:
> https://patchwork.kernel.org/project/linux-mediatek/patch/
> 20240510061716.31103-1-liankun.yang@mediatek.com/
> 
> Signed-off-by: Liankun Yang <liankun.yang@mediatek.com>

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>


