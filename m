Return-Path: <SRS0=2U4T=YU=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EAE73CA9EAF
	for <linux-mediatek@archiver.kernel.org>; Sun, 27 Oct 2019 06:32:42 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A4916205C9
	for <linux-mediatek@archiver.kernel.org>; Sun, 27 Oct 2019 06:32:42 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="C9I0mqnS";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=gmx.net header.i=@gmx.net header.b="XglZzy/W"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org A4916205C9
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=public-files.de
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:References:In-Reply-To:Date:Subject:To:
	From:Message-ID:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=5QEdmLm4aKYPhZYkzKL/+KCcii0dR5S2xaLSRxVvutM=; b=C9I0mqnSMbXF5P
	cnsoZH1VXtTpilz6hg5GX49tydE3E+350IWBLTmu2FJfbe3y3GU/aLKVGzf8ONWjTAUcO35kZHS5K
	UGJfJXbm967ICmEkVUdFsYD4ZHB/KnliRW9yIdm8NJY0V/4tcrCnAsY3QGF/49CyL1gD2AeCK4WF8
	hQG1Fi5YPsn74MnLo5rvofv1+QSZwuR48n2nFoEz6Cnsgp+fidx3s/tVHS0VNhWv7QrRmD37zN9nP
	Gjconv5+aApEjFvYAO613RPk/ibVVjGIuuX2WgNzd2kzZBtqG8BCKhPrrVwwee0+6Jk5JXXjK74vB
	OYYBaGv1+vENxNIlwruQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1iOc6U-0006Pw-0X; Sun, 27 Oct 2019 06:32:42 +0000
Received: from mout.gmx.net ([212.227.17.21])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1iOc6R-0006PN-NG; Sun, 27 Oct 2019 06:32:41 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
 s=badeba3b8450; t=1572157953;
 bh=URb4ktMfUpL1dbYIat3/0f/YdBmBlVy9KjAM/7UpLI0=;
 h=X-UI-Sender-Class:From:To:Cc:Subject:Date:In-Reply-To:References;
 b=XglZzy/WMm59HtyMddVqjE6ZR2+RaxPmfwEmYCXzobfiJeL01Z4U7Obw90woqrfgb
 U4GeXgWqrDWPrbBr+eMNLB+IHQEsYMZrhgincWFuJy401uyX7T8HutSvALTIyFQ8dK
 tKIlCC23G/wAFx9sUPnqKvPQGmWMEAp2MU3Pddww=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from [217.61.153.185] ([217.61.153.185]) by web-mail.gmx.net
 (3c-app-gmx-bap44.server.lan [172.19.172.114]) (via HTTP); Sun, 27 Oct 2019
 07:32:32 +0100
MIME-Version: 1.0
Message-ID: <trinity-c8e754a2-3369-4915-91dd-4e328c8d8a54-1572157952924@3c-app-gmx-bap44>
From: "Frank Wunderlich" <frank-w@public-files.de>
To: "Fabio Estevam" <festevam@gmail.com>
Subject: Aw: Re: [PATCH, RESEND] serial: 8250-mtk: Ask for IRQ-count before
 request one
Date: Sun, 27 Oct 2019 07:32:32 +0100
Importance: normal
Sensitivity: Normal
In-Reply-To: <CAOMZO5Bb=1CUpw__xxS2N0w+ZP0+LnBBW9+JLVr03x6TC2Z7=g@mail.gmail.com>
References: <20191026194522.28293-1-frank-w@public-files.de>
 <CAOMZO5Bb=1CUpw__xxS2N0w+ZP0+LnBBW9+JLVr03x6TC2Z7=g@mail.gmail.com>
X-UI-Message-Type: mail
X-Priority: 3
X-Provags-ID: V03:K1:ZwFWc4VD9dcVeZ8c7PaQyxCHzgAqT53gsWj2AJnSZjBgsFAC2j82vL5w/gSwf6To88DKA
 0JVhXeQGn6v1xg0j6H+pFB8vA8+G3TYvM7Slk1tW8sLbSXnjKM8T+P7wBcDqXssvwR9ws1e+sTQe
 aJqoVJNc+XDlrH9pnB4HQeTnFTiiEP+UoM5ROLtw/5h8kkLPEbD+UxQrLCp8YTZ97jRaW5MJh0ZW
 bM4K1Wgk1DmIF2UCcsSQP8MQP3/WRsna/nRScowwiffo8+6oaCX4zehW3QPQlNUqjonbdPOZJk+w
 N0=
X-UI-Out-Filterresults: notjunk:1;V03:K0:AFsynnJYb5U=:KBDbqLyPbYU5CLeqGZx3Vo
 Sfnot+l7NRHzME8agB4fxaK7Rf01wkVSaeg1QGQ+dzmIKGc0efJ/YlsvMg9TZZRiQfx4ej1V9
 Zo/2BChttYcdZZsI2tZheHb2tu0Izlf6WvHdTE6Dwi97qWNg7bPaHtgHuHwfFmpBNtJnHrpCG
 fr2tpnbNC2TOjr+Exx02YsaHbmmIRMPAWSuPDMuwjQXRvR4ffqa+BECFzZUhmYjzhbit36Qyt
 ZakEpDe9Kh9YUXJW9aXAJztfq+66NJJuZMzEYicOR9bGB2R+lhea04uxcnNhWKq6CB4q3zwq+
 GRX3mr+KdMgOKLhrahiMZ+8eugpCP3Ldrl0RY0hjPrXEKX6+De4W0n2saAfp9H45+uQTXPCzg
 BI1tfs7KMJG6kSsuKLInuWV5O2/b7pcM2pLXYbJNPDCUHc8kDFixkYrHBq10obM3MCW+w4/1K
 11XyCKqW9iDB4HsGO2W/MsweDQ82iA+eRMe7XdX1xmJQmRfLLZaKHb6VEc69Mk4BPOMf/O1HP
 gstDfHykbv+cMcfOaTz4XFsMpb6T+KNeA2yPd2PTXAYyoadOusBMiPCRQhJvYSULYTLHu9J5w
 w/WboqFnJlp0Xvk2Ekh7KvzjsD0KhKJ37v6cpAlBsJr1E4efWL+3XcE/awA+s1KhFAB6LPo1W
 OFE9pK3qpw72iSLZJDdFmKl5quWbLc5xGULgM5MET6guvM5N/poP7PhPszZcKQaDM+3c=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20191026_233240_094056_5D2E2952 
X-CRM114-Status: UNSURE (   5.92  )
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
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 linux-kernel <linux-kernel@vger.kernel.org>,
 linux-mediatek@lists.infradead.org, linux-serial@vger.kernel.org,
 Matthias Brugger <matthias.bgg@gmail.com>,
 "moderated list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE"
 <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Hi,

thank you, seems to work too

have posted v2 here: https://patchwork.kernel.org/patch/11213957/

regards Frank

> Gesendet: Samstag, 26. Oktober 2019 um 21:31 Uhr
> Von: "Fabio Estevam" <festevam@gmail.com>

> The solution that was accepted for this case was to use
> platform_get_irq_optional() instead.
>
> You could try using platform_get_irq_optional() here as well.


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
