Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2EB24C0502C
	for <linux-mediatek@archiver.kernel.org>; Mon, 29 Aug 2022 14:05:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Etg8ZHwp7/iTySLtvgiSCHfgG75fIdOo/Kv2LUFZung=; b=ZsKYhWdTyv+xRVgsdqcOrmr3XA
	OHV8jZRBxl9Y2ICZfqKNVS70NG+q8YGZeejzGAq32DLs+IlxxTWSj0eJAVb/4h2t0R9tCnfEothHf
	p8jyRIrDtFjo652aov/oaZ4ccD90BNZb8QDWvUVFXJ3Zqixas9/JckzS4lbk66Cj6h+EtkLupc5Jv
	o+osq01Wov089ypEBEOt1fPZpudwoz5rUk2QkRecUSFFtoibS+tIOHvjIfYgiCuDQB9PLzK128aBM
	JsPR1gmx/Emsko+PsZs+x/i2Z1aJLcsxgTc5IMA2cimQfRZg7QgsegIw/PiBEAuI7A12S1RmCDDdg
	/akrCW1w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oSfO3-00Awb0-Vh; Mon, 29 Aug 2022 14:05:12 +0000
Received: from madras.collabora.co.uk ([2a00:1098:0:82:1000:25:2eeb:e5ab])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oSf9H-00Apxk-7t; Mon, 29 Aug 2022 13:49:59 +0000
Received: from notapiano (unknown [70.107.189.129])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: nfraprado)
	by madras.collabora.co.uk (Postfix) with ESMTPSA id E2C6A6601DC4;
	Mon, 29 Aug 2022 14:49:47 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1661780989;
	bh=INGbphvqng/9YH+Uc8bMKz/do1TcHYSTNqW55zHsUwQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=fbIIK+JUF9TglZipH4EnVCozhC+uFmadTrTjvS4WSuRd/Tu8QcrhxhabNPE2YZwME
	 NVvq/jWIyd/YnMG1lkmULUzdRaX6OXi/Pm0LiEZV49bE9vScG7OIgRCP8XnjbtGjPU
	 iDXuAhvhKROs5bUJkHfCcxHU0CsZZxmc7Ht9eoz1+PTG7OFjBiPWDe7woHOhlVQwup
	 sOyBO9Ds7MpIyZ167RwCrNgugVHIDC9XBe0vux1SiLx0QodyLQCOQL65DDr2zGRiYZ
	 eKuoz3bGSIbERwiBe+VU4F75e8Xk0evAwSOXeJ+R2DbA+1+FAZmQWMO5Q7gxOjAqOm
	 fxZLHDigta+BA==
Date: Mon, 29 Aug 2022 09:49:44 -0400
From: =?utf-8?B?TsOtY29sYXMgRi4gUi4gQS4=?= Prado <nfraprado@collabora.com>
To: xinlei.lee@mediatek.com
Cc: matthias.bgg@gmail.com, angelogioacchino.delregno@collabora.com,
	rex-bc.chen@mediatek.com, jason-jh.lin@mediatek.com,
	yongqiang.niu@mediatek.com, chunkuang.hu@kernel.org,
	p.zabel@pengutronix.de, airlied@linux.ie, daniel@ffwll.ch,
	jitao.shi@mediatek.com, dri-devel@lists.freedesktop.org,
	linux-mediatek@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	Project_Global_Chrome_Upstream_Group@mediatek.com
Subject: Re: [PATCH v4,2/2] drm: mediatek: Adjust the dpi output format to
 MT8186
Message-ID: <20220829134751.kvljnlsjwvmxhve7@notapiano>
References: <1661743308-29120-1-git-send-email-xinlei.lee@mediatek.com>
 <1661743308-29120-3-git-send-email-xinlei.lee@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <1661743308-29120-3-git-send-email-xinlei.lee@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220829_064955_503311_8FA5F32A 
X-CRM114-Status: UNSURE (   7.51  )
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

On Mon, Aug 29, 2022 at 11:21:48AM +0800, xinlei.lee@mediatek.com wrote:
> From: Xinlei Lee <xinlei.lee@mediatek.com>
> 
> Dpi output needs to adjust the output format to dual edge for MT8186.
> 
> Co-developed-by: Jitao Shi <jitao.shi@mediatek.com>
> Signed-off-by: Jitao Shi <jitao.shi@mediatek.com>
> Signed-off-by: Xinlei Lee <xinlei.lee@mediatek.com>

Reviewed-by: Nícolas F. R. A. Prado <nfraprado@collabora.com>

Thanks,
Nícolas

