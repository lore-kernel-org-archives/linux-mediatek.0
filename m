Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4D8CFC4332F
	for <linux-mediatek@archiver.kernel.org>; Mon,  5 Dec 2022 20:32:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=TVK30NbmRI4tkvUrlf2sCSFXlTNJaX3gj/Dwn60kiyY=; b=gxRWZ70YUaxRl1775jffuEEitc
	Ol1uuyhjwF+M0Mnck6EZxnh8w1ID+7QVy41Mug9WMOrzwcx1oVNiNQd3j0msHYYX87Na7zvKIQklG
	OY8rnrXWIEbIZh47N2iI4JmGhI2lUBjUvJHmdUph33MNxOXP8hBD4cpWMAdJZGot9/V0RUg0kgtND
	Lv+Urv9D/XBrOaZIcgYiN7O85bTXfd34n3XaUW3ttohq9dJBzOZTDivNxsx4vSwPyr1+4SZuBRlpq
	m9V8m6ldG2ohqlWKElLbCsXDBokdDvxVB8ajRNSXlNnIImOA1Lvwtd3LYpSZN11H1GlevxRleLqkO
	/0Hkc0/Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p2I8p-00AItn-LF; Mon, 05 Dec 2022 20:32:43 +0000
Received: from madras.collabora.co.uk ([2a00:1098:0:82:1000:25:2eeb:e5ab])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p2I8d-00AIp9-14; Mon, 05 Dec 2022 20:32:32 +0000
Received: from notapiano (unknown [IPv6:2804:14c:1a9:3b3c::1000])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: nfraprado)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id 6A77166015B4;
	Mon,  5 Dec 2022 20:32:19 +0000 (GMT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1670272343;
	bh=T4jEOj3MX4O9ybwnACjigBqd5HrWbxgMvQT+OXT7Qxk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=fh0QsJ4GR6deGY2L6Vkcewz5FdvFD+iF+Dm4aQ01N4TzbW2YZ2A4+o9YVy+GNToGF
	 ZD6BhwRSV5qSfie3oinKOdFuwrNJjzxQJWsa+yGhLFd+7Xq35kMU8EyUzwbmVfNPVH
	 7KAvzPEtAqTa6zH5kufv8rY5C8vyptJiIYDGcGVtq+ZeKXLW2eaVl+HSPnSt18v3aU
	 kiOgFe/DhyBaeeO6j3F9dKzqWkcJ+qHc2U0ugmpT5KWiPnWzlg5ROJPK8h4WyhnJ73
	 4ul80sF820fkOVZOxzL60/wh+a7DbuXMDWHeRE2sZ0JrpANDNSl0jScEEpWPHN731e
	 QrRgtuqd5e9Og==
Date: Mon, 5 Dec 2022 17:32:14 -0300
From: =?utf-8?B?TsOtY29sYXMgRi4gUi4gQS4=?= Prado <nfraprado@collabora.com>
To: Allen-KH Cheng <allen-kh.cheng@mediatek.com>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Project_Global_Chrome_Upstream_Group@mediatek.com,
	linux-media@vger.kernel.org, devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	linux-mediatek@lists.infradead.org, yunfei.dong@mediatek.com
Subject: Re: [PATCH v5 2/3] media: dt-bindings: media: mediatek: Remove
 "dma-ranges" property for decoder
Message-ID: <20221205203214.megeq5nr7ksvb5vw@notapiano>
References: <20221128143832.25584-1-allen-kh.cheng@mediatek.com>
 <20221128143832.25584-3-allen-kh.cheng@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20221128143832.25584-3-allen-kh.cheng@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221205_123231_263037_C7D2F327 
X-CRM114-Status: UNSURE (   8.89  )
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

On Mon, Nov 28, 2022 at 10:38:31PM +0800, Allen-KH Cheng wrote:
> Since commit f1ad5338a4d5 ("of: Fix "dma-ranges" handling for bus
> controllers") was merge, we don't need a dma-ranges property for IOMMU
> in mediatek video codec.

This description isn't right, as it gives the impression that the mentioned
commit removed the need for having a dma-ranges property, but that isn't the
case, the property wasn't needed even before that commit. That commit did
however expose the fact that having this property didn't make sense in the first
place.

Here's a suggestion:

	The decoder nodes already make use of the iommus property to configure the IOMMU
	for address translations, so also having a dma-ranges property doesn't make
	sense.

	In fact, after commit f1ad5338a4d5 ("of: Fix "dma-ranges" handling for bus
	controllers"), having a dma-ranges property causes IOMMU faults.

	Remove the dma-ranges property and update the example.

Reviewed-by: Nícolas F. R. A. Prado <nfraprado@collabora.com>

Thanks,
Nícolas

