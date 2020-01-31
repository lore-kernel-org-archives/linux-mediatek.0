Return-Path: <SRS0=2SDw=3U=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.5 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,URIBL_DBL_ABUSE_MALW autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 54052C2D0DB
	for <linux-mediatek@archiver.kernel.org>; Fri, 31 Jan 2020 01:07:07 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 26CF1214D8
	for <linux-mediatek@archiver.kernel.org>; Fri, 31 Jan 2020 01:07:07 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="iLubCkeK";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="EAVQXk1u"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 26CF1214D8
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:From:To:Subject:
	References:In-Reply-To:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=veni+PtVhGfEKY63szABml0tifT0KOqK1xLJp7PAtUk=; b=iLubCkeKu/zSim
	holsJvmEaL1v5t8VEu4naJeucYUrRenxxzPrKr2sFWt1I3CozTq9ONOLXYlTyyeCRfy8bSXCQFiKO
	A1yTF7c9TQEGALvOvFVy3OrMIqPAmBgyyfLaYID+LgpzfAmHYOEpfwt05cZeHDAVpv1a+DhJLvYX1
	G2ElL85fvqyeyFHyssCAQccd2TMaYJ/ITl2pcGZk63b4FsOqctEIx8ohmGK1oMfm7TMMKTD1aMAwI
	2zqZ+WYeBjL2wZsxEXxzgh2YRE7j9G0a+OtEN8hE6+7/EBN6sm88m9RYzrXvM2qpiMjC2/d+VtUoF
	IoLSJ82GlqEkgXdcGFEA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1ixKlv-00057a-1O; Fri, 31 Jan 2020 01:06:59 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1ixKlr-000578-OE; Fri, 31 Jan 2020 01:06:56 +0000
Received: from kernel.org (unknown [104.132.0.74])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 3336320678;
 Fri, 31 Jan 2020 01:06:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1580432814;
 bh=jsJEjfvvosoNzF+1nP8nbj7092fwdtBhOz2X+N5rSYc=;
 h=In-Reply-To:References:Subject:To:From:Cc:Date:From;
 b=EAVQXk1uO5WynQ7Wtd1arSl2mIu7+KTMUvTyGUtP+CBTahefWsrjBU/w5+WVG5pbJ
 6oeJf0VKlrt/bX9mb5sNu4yXZTeLRu/m8+rnihFdYrPqyT+y1zbbhNQrvRbDOAHQvT
 kM55lR9ogO4s8yk5mrgvNveWr+uooWYXRl/S1ipM=
MIME-Version: 1.0
In-Reply-To: <20191209195749.868-1-tiny.windzz@gmail.com>
References: <20191209195749.868-1-tiny.windzz@gmail.com>
Subject: Re: [PATCH 01/17] clk: sunxi: sunxi-ng: convert to
 devm_platform_ioremap_resource
To: Eugeniy.Paltsev@synopsys.com, Yangtao Li <tiny.windzz@gmail.com>,
 afaerber@suse.de, agross@kernel.org, aisheng.dong@nxp.com, allison@lohutok.net,
 chunhui.dai@mediatek.com, cw00.choi@samsung.com, daniel.baluta@nxp.com,
 dinguyen@kernel.org, emilio@elopez.com.ar, festevam@gmail.com,
 geert+renesas@glider.be, gregkh@linuxfoundation.org, heiko@sntech.de,
 jcmvbkbc@gmail.com, john@phrozen.org, jonathanh@nvidia.com,
 kernel@pengutronix.de, kgene@kernel.org, krzk@kernel.org,
 kstewart@linuxfoundation.org, linux-imx@nxp.com,
 manivannan.sadhasivam@linaro.org, matthias.bgg@gmail.com,
 miquel.raynal@bootlin.com, mripard@kernel.org, mturquette@baylibre.com,
 nsekhar@ti.com, palmer@sifive.com, paul.walmsley@sifive.com,
 pdeschrijver@nvidia.com, pgaikwad@nvidia.com, rfontana@redhat.com,
 robh@kernel.org, s.hauer@pengutronix.de, s.nawrocki@samsung.com,
 shawnguo@kernel.org, swinslow@gmail.com, t-kristo@ti.com, tglx@linutronix.de,
 thierry.reding@gmail.com, tomasz.figa@gmail.com, wangyan.wang@mediatek.com, 
 weiyongjun1@huawei.com, wens@csie.org
From: Stephen Boyd <sboyd@kernel.org>
User-Agent: alot/0.8.1
Date: Thu, 30 Jan 2020 17:06:53 -0800
Message-Id: <20200131010654.3336320678@mail.kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200130_170655_818638_CD76F0CF 
X-CRM114-Status: UNSURE (   5.17  )
X-CRM114-Notice: Please train this message.
X-BeenThere: linux-mediatek@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-mediatek.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mediatek>, 
 <mailto:linux-mediatek-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mediatek/>
List-Post: <mailto:linux-mediatek@lists.infradead.org>
List-Help: <mailto:linux-mediatek-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mediatek>, 
 <mailto:linux-mediatek-request@lists.infradead.org?subject=subscribe>
Cc: linux-samsung-soc@vger.kernel.org, Yangtao Li <tiny.windzz@gmail.com>,
 linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-mediatek@lists.infradead.org, linux-tegra@vger.kernel.org,
 linux-riscv@lists.infradead.org, linux-clk@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Quoting Yangtao Li (2019-12-09 11:57:33)
> Use devm_platform_ioremap_resource() to simplify code.
> 
> Signed-off-by: Yangtao Li <tiny.windzz@gmail.com>

Please add a cover letter, resend this series picking up any acks and
dropping any patches that were rejected by maintainers of the drivers.
There was significant discussion on one patch that was rejected, so I'll
only pick up patches for the next cycle that are acked/reviewed-by
relevant folks.


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
