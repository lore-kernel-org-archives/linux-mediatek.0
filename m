Return-Path: <SRS0=DbAw=DJ=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 52B8FC4363D
	for <linux-mediatek@archiver.kernel.org>; Fri,  2 Oct 2020 08:00:00 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id F36D0206A5
	for <linux-mediatek@archiver.kernel.org>; Fri,  2 Oct 2020 07:59:59 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="BU/TeG35"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org F36D0206A5
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Date:To:From:
	Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=vVfQJgYfGEikjeqNfYrl8Cl8XPOSRPzJoan9jeoQa+I=; b=BU/TeG35Tljh/5CQJvt+qQr8v
	IlOL8abfTKalL74bbiHWXbOn70vZkMyvCWRcfKYWCfkpD+d0Z3H8lPYwGcMFqUrICeCqvitJqWWZ9
	WbTx9Hc6KyDMpM9rYZ0fa+8njmJgkX2Q+EG9W1f0PuZ0fEe9hjpmc945jgFizH9ZIzlDBdeA9KSyy
	Zo657HYTFmRQBYQ7UVRFcqbnzbXB+T/nzlSvoDbDFChF73qwZVLlod4JR3xG2wLdIhEYKc3RvYGLh
	elaFUoojK4iT+sCYr5VDIW7jAL4mvVCrmUnSSI+9HK2cFjr4KMuD9Io3EE65PeVRphPDxiTLtgDtq
	iQvsJ/fsA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kOFyq-00034f-H9; Fri, 02 Oct 2020 07:59:52 +0000
Received: from metis.ext.pengutronix.de ([2001:67c:670:201:290:27ff:fe1d:cc33])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kOFyo-00034B-6P
 for linux-mediatek@lists.infradead.org; Fri, 02 Oct 2020 07:59:51 +0000
Received: from lupine.hi.pengutronix.de
 ([2001:67c:670:100:3ad5:47ff:feaf:1a17] helo=lupine)
 by metis.ext.pengutronix.de with esmtps
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <p.zabel@pengutronix.de>)
 id 1kOFyg-0006uu-9r; Fri, 02 Oct 2020 09:59:42 +0200
Received: from pza by lupine with local (Exim 4.92)
 (envelope-from <p.zabel@pengutronix.de>)
 id 1kOFyX-0002aC-Sz; Fri, 02 Oct 2020 09:59:33 +0200
Message-ID: <3e6248770b881181353a00cf2a7087485d1ae0c1.camel@pengutronix.de>
Subject: Re: [PATCH 2/5] ASoC: mediatek: mt8192: add platform driver
From: Philipp Zabel <p.zabel@pengutronix.de>
To: Jiaxin Yu <jiaxin.yu@mediatek.com>, broonie@kernel.org, tiwai@suse.com, 
 matthias.bgg@gmail.com, robh+dt@kernel.org, tzungbi@google.com, 
 alsa-devel@alsa-project.org, linux-arm-kernel@lists.infradead.org, 
 linux-mediatek@lists.infradead.org, devicetree@vger.kernel.org
Date: Fri, 02 Oct 2020 09:59:33 +0200
In-Reply-To: <1601624142-18991-3-git-send-email-jiaxin.yu@mediatek.com>
References: <1601624142-18991-1-git-send-email-jiaxin.yu@mediatek.com>
 <1601624142-18991-3-git-send-email-jiaxin.yu@mediatek.com>
User-Agent: Evolution 3.30.5-1.1 
MIME-Version: 1.0
X-SA-Exim-Connect-IP: 2001:67c:670:100:3ad5:47ff:feaf:1a17
X-SA-Exim-Mail-From: p.zabel@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de);
 SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-mediatek@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201002_035950_305507_54B8294F 
X-CRM114-Status: UNSURE (   7.79  )
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
Cc: shane.chien@mediatek.com, maowenan@huawei.com,
 kuninori.morimoto.gx@renesas.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Hi Jiaxin,

On Fri, 2020-10-02 at 15:35 +0800, Jiaxin Yu wrote:
> +static int mt8192_afe_pcm_dev_probe(struct platform_device *pdev)
> +{
[...]
> +       /* reset controller to reset audio regs before regmap cache */
> +       rstc = devm_reset_control_get(dev, "audiosys");

Please use devm_reset_control_get_exclusive() instead.

regards
Philipp

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
