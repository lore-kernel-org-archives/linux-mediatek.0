Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 076B8C433FE
	for <linux-mediatek@archiver.kernel.org>; Thu,  6 Oct 2022 18:44:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=00Rx/FKCWoUiV/UmVC88jaENpGru3BhSDILkeicJ5uI=; b=FI4ox4Lp7QNiENrd2+zE5+fJaX
	goqSRJBHSfm+I6qaKdzX5aKrwCBKEcMd2FMdcXQZM5Nbf/8lixUF0G/zJMa7O5uxSrXGkasdLkKv3
	cinCyVCw9718Zg9cgCroWvbNXGYDUISFD+tC9AlnFutfUSFIByuQqqXn9cWdUJfDND9iu8JgIvv4Z
	Y3S4dhytwGNevcf2JdAy59H/bkMgEmmWSPITVwEqw7poUH2Vy5SES7MwEnbB9A0FRnQcZxRmxLqEs
	nRdW8dfl4iyDpHuHYLJl6PNiTEhqbI3eppoYncbURRBbVlcFD0AsSj8UmVhOJHoiU4M+cUUr4czHU
	wnI+OYGQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ogVrF-004XYl-0e; Thu, 06 Oct 2022 18:44:33 +0000
Received: from madras.collabora.co.uk ([46.235.227.172])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ogVr3-004XSC-C1; Thu, 06 Oct 2022 18:44:22 +0000
Received: from notapiano (unknown [IPv6:2600:4041:5b1a:cd00:524d:e95d:1a9c:492a])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: nfraprado)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id A6DFE6602312;
	Thu,  6 Oct 2022 19:44:16 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1665081857;
	bh=cg5NSP17rilsGIpsqKknfp2eLMs+z2DEvknKPSu0pN0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=lobjwQM1LwYW2az1hlQhzcZHJKqP90wNCxOGrmgivOv8Q26SNG5CSZC3iyeA2x3Ec
	 L9kLYXVh6aC/G7uYzugRMo7kLdC18hB0HM3/c809hmSUlY7YPoGjs75cPFTbgVkvBi
	 Cym83YvcvctQmz3c+w6uyVtx6GvMeYELxQsuRjd+sUXZuZ9x/4KmYvByjYJ+qoDFUy
	 74jnEIZ8LA9yj9VAZLGiIiB417nZbri6QzRNNKRuei+2HTInlVMrUM9+X1anUAzQ1r
	 NZyCHUd1FljpE1oCZH66640CjbRp+nTS5WyjxZC03EzdcorqDJ8+H+iSVz3hfrUp4i
	 BhCIhbtaxfWFQ==
Date: Thu, 6 Oct 2022 14:44:13 -0400
From: =?utf-8?B?TsOtY29sYXMgRi4gUi4gQS4=?= Prado <nfraprado@collabora.com>
To: Allen-KH Cheng <allen-kh.cheng@mediatek.com>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
	Project_Global_Chrome_Upstream_Group@mediatek.com,
	linux-media@vger.kernel.org, devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	linux-mediatek@lists.infradead.org
Subject: Re: [PATCH v4 2/2] arm64: dts: mt8192: Add vcodec lat and core nodes
Message-ID: <20221006184413.kelie7eppmjwptnc@notapiano>
References: <20220930112237.14411-1-allen-kh.cheng@mediatek.com>
 <20220930112237.14411-3-allen-kh.cheng@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20220930112237.14411-3-allen-kh.cheng@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221006_114421_573475_C538ECEA 
X-CRM114-Status: UNSURE (   8.49  )
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

Hi,

On Fri, Sep 30, 2022 at 07:22:37PM +0800, Allen-KH Cheng wrote:
> Add vcodec lat and core nodes for mt8192 SoC.
> 
> Signed-off-by: Allen-KH Cheng <allen-kh.cheng@mediatek.com>
> Tested-by: Chen-Yu Tsai <wenst@chromium.org>
> Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>

Reviewed-by: Nícolas F. R. A. Prado <nfraprado@collabora.com>
Tested-by: Nícolas F. R. A. Prado <nfraprado@collabora.com>

Thanks,
Nícolas

