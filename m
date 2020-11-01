Return-Path: <SRS0=ZPt7=EH=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A312DC2D0A3
	for <linux-mediatek@archiver.kernel.org>; Sun,  1 Nov 2020 18:27:43 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E518B2224F
	for <linux-mediatek@archiver.kernel.org>; Sun,  1 Nov 2020 18:27:42 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="LBVmrUtV";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=gmx.net header.i=@gmx.net header.b="L5KAIuUO"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org E518B2224F
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=public-files.de
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:References:In-Reply-To:Date:Subject:To:From:
	Message-ID:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=JyGC135p2Qi0VM0BTDut63T7J/EyK+vN098Tzx/QIZg=; b=LBVmrUtVGn2rglbkXe7jHOSFG
	p+o8x+63Q2yYj6gRZ1Wi0byXOSEnRZ5auT0fsEdDhp6wCsRu1szvZK8E0HON5srucFpwBd+IadjFB
	Tyc8CO1y1RbC/kUUrHpOaRxVfT+yj/Rg0UZZlbKWWsPfZRDk28yZGXhH+EwsKvqHkDIQ2X9DjJrgr
	JpJwhsuaSdX8jE/H+1kx+w+LrFle9mKQl0HXBfVXHw4qGVMCABXoa73WZONrB46lb7x6/J6T0gNen
	zukkalCoDJ78CinFeatalDkebPS8RU67nQjKI1qAell1etlMDAKv+1oAro2rERZMkYpxf1C3crizD
	Ss51pL3fw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kZI4j-0004WJ-0u; Sun, 01 Nov 2020 18:27:33 +0000
Received: from mout.gmx.net ([212.227.17.21])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kZI4f-0004Vh-Tf
 for linux-mediatek@lists.infradead.org; Sun, 01 Nov 2020 18:27:31 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
 s=badeba3b8450; t=1604255233;
 bh=/L+w0lrholo1kMZ1eJSk7XoUYmf7kf9uAE6zDybJJI0=;
 h=X-UI-Sender-Class:From:To:Cc:Subject:Date:In-Reply-To:References;
 b=L5KAIuUO81PNWC/Xk++LpHjA76nZTilRpxasjMgiFnoG4Su6U1tSvfMEy0KdVqud5
 g3SZMC37zFZc0FNanqRetBNkJ/Yi0oi/9hbBXGMd5zm1tGKOoS29gQhRfA+YRuIagh
 H3o3wGEu5Hg2FMSyc7rHn0FXASNgPygzCQTM1IBo=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from [217.61.144.204] ([217.61.144.204]) by web-mail.gmx.net
 (3c-app-gmx-bap08.server.lan [172.19.172.78]) (via HTTP); Sun, 1 Nov 2020
 19:27:13 +0100
MIME-Version: 1.0
Message-ID: <trinity-9eb2a213-f877-4af3-87df-f76a9c093073-1604255233122@3c-app-gmx-bap08>
From: Frank Wunderlich <frank-w@public-files.de>
To: Ryder Lee <ryder.lee@mediatek.com>
Subject: Aw: Re: [PATCH] pci: mediatek: fix warning in msi.h
Date: Sun, 1 Nov 2020 19:27:13 +0100
Importance: normal
Sensitivity: Normal
In-Reply-To: <1604253261.22363.0.camel@mtkswgap22>
References: <20201031140330.83768-1-linux@fw-web.de>
 <878sbm9icl.fsf@nanos.tec.linutronix.de>
 <EC02022C-64CF-4F4B-A0A2-215A0A49E826@public-files.de>
 <87lfflti8q.wl-maz@kernel.org> <1604253261.22363.0.camel@mtkswgap22>
X-UI-Message-Type: mail
X-Priority: 3
X-Provags-ID: V03:K1:A5wNCGAfPYLBaq4vJipjLleYOK2TEelZNZEUKtqbujq6fXPEHUJyM0Zu35pMgzDT25BbJ
 kpk2ZzBEXrgUPaVYwzUFA76f/1LV5/Bs+JrDAKdYH1bawVRT0MRsFyFVZdPcyeOsXSn9L7fExOIX
 XxEjXxz+ZWo+j9fTFqBBUgwTjiYhn0iA6S+PyNuqe9r0f1zyFVmTHe8NJl8eI2SGUnp0efee215W
 fa+BfNjD90nPZ7fAaHBqJcyJXTp2UarxGHzesQBU3Vp/1ipKQFfGvwgXifsrRfjVbOxitOaY/ner
 Kc=
X-UI-Out-Filterresults: notjunk:1;V03:K0:JVV58eDgfxM=:/UUrFFmGUI3vP5RJJLYjN8
 pNg+2F2WvIn0Ncgs6ZUNr0CrtEBo2UsgT2dn8AJiU2MnPwq0gtO7Q6ftfcUsCrPxMr64TVUBB
 RW8cS1lQu1bt1aARV3Z60mRWOANmWMrfIoNnflSUMSBNEs5edbygyaznaCYVqXWXioE2W52je
 oiFvBYQQEH3hVas6XS6P/airpdo3oe8QbA/T9cBktYSV4v7BzGe8GaVBrowkVc9ZtJuyYNzsf
 mR/ZfkisM0M4H8FVNySlHBS7FCVfMllPYAJ5eb14yiU48eL6gfxHmMiTNsgU29v+VLSGOFDsK
 mwtfnWljdb2gO3ClZ9kLDbDlmLOLpa1bJ6h6whyEpIa3ViBxsdzcvWTEJAPCSoFGsLWT8lV+P
 AxTbYmyQl+aBr5EcoZm1ohkiMkIUC/DMU+1pEhp1LgwZR4352FeMemQpbhV1wz71kTKh46sxy
 hQg9Ck0F/smm5ajfAs5DrxjwHrs/ftt1XSQ99Dc5qc7aHC0SD6Wm0efd0+AR5wcrhq9wTXixw
 mPRfgdB6qN0FZhCkNzsmn1fvXGtBR7HuW7P515dAQ/O71Xe+bx7gMGu20P61hd0aJ4T3OY51V
 X8HznK3PbfN5w=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201101_132730_245543_06AA7FF4 
X-CRM114-Status: UNSURE (   9.67  )
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
Cc: Marc Zyngier <maz@kernel.org>, linux-kernel@vger.kernel.org,
 Bjorn Helgaas <bhelgaas@google.com>, linux-mediatek@lists.infradead.org,
 linux-pci@vger.kernel.org, Matthias Brugger <matthias.bgg@gmail.com>,
 Thomas Gleixner <tglx@linutronix.de>, Frank Wunderlich <linux@fw-web.de>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

> Gesendet: Sonntag, 01. November 2020 um 18:54 Uhr
> Von: "Ryder Lee" <ryder.lee@mediatek.com>

> Yea, mt7623 (mtk_pcie_soc_v1) does not support MSI, so that's a way to
> handle it.
>
> @Frank, could you help to test it?
>
> Ryder

compiles clean for mt7623/armhf and mt7622/aarch64 so far

at least bananapi-r2/mt7623 booting is clean now - no warning
pcie and sata/ahci seems still working as expected. I have a mt7615 card in pcie-slot (firmware-load and init without errors) and hdd connected to outer sata port (can access partitions witout errors)

booted r64 too, still see no warning, but have not yet connected hdd/pcie-device, but i guess this should not break anything here

so Marc, if you post the patch separately, you can add my tested-by ;) thank you for this

regards Frank


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
