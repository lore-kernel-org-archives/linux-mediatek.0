Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 977F9C433FE
	for <linux-mediatek@archiver.kernel.org>; Fri, 25 Feb 2022 11:08:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=q0RZhubH53YlCnAs+0B9qMdHcAcHsqNb80gTQgCVtQE=; b=pFRzSvx4473HYI
	ECq4o7a3q+8YKrDZC8Ej4hwn1/JFdrupg8+GqfFAXKR52U+qiOHrNzacHQ/ceqjX6ORWL+tZq8jLd
	vs7gj/WsE2jphKI1VZPTzWp1Y78TimgaLt3gAkNNP2aFvyUFL9ocpVzek/H9jPGj9kxv5wIz0Jmwj
	kwHvpGBs/FHebLKoVnVYHDXL3nNwCbTGJzQldnyHXr+hTbpj3uDsHN/kxgwTHb3fTPd9oeN3TVwAz
	zFu+pJgw40I2lbPAUop3wAdjVdeas4o37aO4a7sI7Lv2I1+leSRkk7VPwbizQmBSUgkn9IS9peh13
	8xw8W8KoYpfPjuZ57+8w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nNYS1-004cCv-TD; Fri, 25 Feb 2022 11:07:53 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nNYRq-004cA2-1u; Fri, 25 Feb 2022 11:07:43 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 6ED9160ECB;
 Fri, 25 Feb 2022 11:07:41 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 584D7C340E7;
 Fri, 25 Feb 2022 11:07:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
 s=korg; t=1645787260;
 bh=oLPnU/B1EfAHSSx2pwR9mNAhPWw9h8esfJmG0nixOJ4=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=youXPU4HsasCohDyHjU+UExa7esUpBXqe83BkpO4oys3ggTwaVwU0EqcoU9p7OJFz
 zGObCtr4r04McxUGh6hTF96Id21c4DxsOjZZkFLvs23Le5pH7mzB/BiPhsmwE1eJtj
 oCn2NhOtflKcUj11rzp9mZivMS6eMmmPjaovNUjk=
Date: Fri, 25 Feb 2022 12:07:38 +0100
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Helge Deller <deller@gmx.de>
Cc: Yong Wu <yong.wu@mediatek.com>, David Airlie <airlied@linux.ie>,
 Daniel Vetter <daniel@ffwll.ch>, dri-devel@lists.freedesktop.org,
 James Wang <james.qian.wang@arm.com>,
 Liviu Dudau <liviu.dudau@arm.com>, iommu@lists.linux-foundation.org,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
 linux-kernel@vger.kernel.org, Joerg Roedel <joro@8bytes.org>,
 Will Deacon <will@kernel.org>, Arnd Bergmann <arnd@arndb.de>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 linux-mediatek@lists.infradead.org,
 Chun-Kuang Hu <chunkuang.hu@kernel.org>,
 linux-arm-kernel@lists.infradead.org, Stephen Boyd <sboyd@kernel.org>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Hsin-Yi Wang <hsinyi@chromium.org>, Robin Murphy <robin.murphy@arm.com>,
 Tomasz Figa <tfiga@chromium.org>, srv_heupstream@mediatek.com,
 Rob Clark <robdclark@gmail.com>,
 Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
 Sebastian Reichel <sre@kernel.org>, linux-omap@vger.kernel.org,
 linux-fbdev@vger.kernel.org
Subject: Re: [PATCH 22/23] video: omapfb: dss: Make use of the helper
 component_compare_dev
Message-ID: <Yhi4errwyhNi6pFw@kroah.com>
References: <20220214060819.7334-1-yong.wu@mediatek.com>
 <20220214060819.7334-23-yong.wu@mediatek.com>
 <7e60cd01-8afc-ddb5-a1bb-6e9f53ccfba5@gmx.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <7e60cd01-8afc-ddb5-a1bb-6e9f53ccfba5@gmx.de>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220225_030742_155924_19463043 
X-CRM114-Status: GOOD (  12.21  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Tue, Feb 15, 2022 at 09:46:24PM +0100, Helge Deller wrote:
> On 2/14/22 07:08, Yong Wu wrote:
> > Use the common compare helper from component.
> >
> > Cc: Helge Deller <deller@gmx.de>
> > Cc: linux-omap@vger.kernel.org
> > Cc: linux-fbdev@vger.kernel.org
> > Signed-off-by: Yong Wu <yong.wu@mediatek.com>
> 
> Applied to the fbdev for-next branch.

That will break the build, it needs patch 1/23 to build properly :(


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
