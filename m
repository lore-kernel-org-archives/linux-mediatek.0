Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 55F34CF0449
	for <linux-mediatek@archiver.kernel.org>; Wed,  9 Oct 2024 10:42:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=HpSn54Mtx/T4nES+YdYfiekuHxXWBHhL9VDQmsdVb4c=; b=q6KnB1n/Vk1EFEmb667QzLiJm1
	e6DwDFwgl3of9TScT4Mus0E8Z1QMzhfLH6uFeyIkyvou4DuE/7nDbEYmRZEDHxSvzslM9wTNgA/Ay
	gsnkZ3S8q06yBSQAmVBWxucJgXLnCGOMk07aF9UeqivpPkLpCEHKVrrPBhEIZ4Ofb5cCL2S+PDT58
	bcJ/j/5LPEzgxQ3ZIlDq9gRYmT8jwgJl+30dOSm7um1Xf3HME0dA/uKelvu2JE7xX4JFrFNGU+ZCl
	Nq75swOTkED4jCuwfT0NxCTm3fQ0DbCZMmK2vNslHvXvdLtXFG8zcqm3CDo/uh27UgjCfrMrrjwCi
	giNMAcCw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1syU9L-00000008vFE-1qhB;
	Wed, 09 Oct 2024 10:42:35 +0000
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1syU0M-00000008thY-3UN5;
	Wed, 09 Oct 2024 10:33:20 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id A00B0A43759;
	Wed,  9 Oct 2024 10:33:08 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BCBFCC4CEC5;
	Wed,  9 Oct 2024 10:33:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1728469996;
	bh=E0Ok0ODNbKtR756I4dYvGK/9d++arfILtePnfodKJdw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=U9yR8gF3VlvOPQ3aI/EAxJyyKxvV+0CYS69eVQISX6rszh98YeFEfYXmRw/si29IE
	 uk9S/wHJJTdavZNi1tfX6Nap9aumFFh8E0IGFs9ozGrvkta5jzNIAF21PNZ68rk98J
	 iUboYRO4b45CUR1jCtu9qwQnf9yLaHJbl5OmvxxmfwSRpSKOk1HmnWxjCMpaS/uTyx
	 vRUMdcyfxoH0io4mod0sNx8y3fH2HoNh72FipYunUsWxFEkQqb694fcUpiX5OpI9bL
	 EM0CF9K7Q6GOhxhKfzrdSgJyrjfsLGHWXvm/YYLYfPXSUuf2/kmN44FmOd3MV+FeeN
	 TWrLYW+NZwUnQ==
Date: Wed, 9 Oct 2024 11:33:07 +0100
From: Lee Jones <lee@kernel.org>
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
	matthias.bgg@gmail.com, eddie.huang@mediatek.com,
	sean.wang@mediatek.com, alexandre.belloni@bootlin.com,
	sen.chu@mediatek.com, macpaul.lin@mediatek.com,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org, linux-rtc@vger.kernel.org,
	kernel@collabora.com
Subject: Re: [PATCH v1 1/3] dt-bindings: mfd: mediatek: mt6397: Add
 start-year property to RTC
Message-ID: <20241009103307.GD276481@google.com>
References: <20240923100010.97470-1-angelogioacchino.delregno@collabora.com>
 <20240923100010.97470-2-angelogioacchino.delregno@collabora.com>
 <20241009101549.GB276481@google.com>
 <e0de3810-38b0-40a3-872d-678e9d4f72e5@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <e0de3810-38b0-40a3-872d-678e9d4f72e5@collabora.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241009_033318_973148_C07D34FC 
X-CRM114-Status: GOOD (  12.41  )
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

On Wed, 09 Oct 2024, AngeloGioacchino Del Regno wrote:

> Il 09/10/24 12:15, Lee Jones ha scritto:
> > On Mon, 23 Sep 2024, AngeloGioacchino Del Regno wrote:
> > 
> > > Enable evaluating the start-year property to allow shifting the
> > > RTC's HW range.
> > > 
> > > Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
> > > ---
> > >   Documentation/devicetree/bindings/mfd/mediatek,mt6397.yaml | 2 ++
> > 
> > No such file.
> > 
> 
> In the cover letter, I wrote:
> 
> 
> For the bindings commit, this series goes on top of the MT6397 schema
> conversion from Macpaul Lin [1].
> 
> This series was tested on a MT8195 Cherry Tomato Chromebook.
> 
> [1]: https://lore.kernel.org/all/20240918064955.6518-1-macpaul.lin@mediatek.com/
> 
> 
> So, that's why. :-)

Nope, try again. :)

-- 
Lee Jones [李琼斯]

