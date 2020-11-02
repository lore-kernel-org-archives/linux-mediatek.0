Return-Path: <SRS0=vtlS=EI=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 54BEFC00A89
	for <linux-mediatek@archiver.kernel.org>; Mon,  2 Nov 2020 12:11:46 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 66F1F223B0
	for <linux-mediatek@archiver.kernel.org>; Mon,  2 Nov 2020 12:11:45 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="xvN2sPDe";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="pwPddPG6";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=gmx.net header.i=@gmx.net header.b="WOPzX3cl"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 66F1F223B0
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=public-files.de
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:References:In-Reply-To:Date:Subject:To:From:
	Message-ID:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=xLufDjYbOBXYhKiqMgjiWE9tNU2rFtdZu73ItkjCZdQ=; b=xvN2sPDe66hB+tAsEvLbrtW/2
	91T9UvOVteGBxeUfW+4gx4BkxS/cvkYDXLEb92X5CywwY0xSxSyz2n1YLzur+KyKmVjJpOA0+4TEW
	YxYqMIVf38g5XQBPVSPWlUt1dLlCl/SMygvQtg45jfiq/U56h1YGQPPkfTFzWM1Ri1MY550UKQrpd
	uC04YYM6h9vMbwa6N0qlTXh1rkGNnvh5gh2fVe+Cz3kQV9yaEEtggxiWl4isCWt2Y7ktu7quIhe93
	/Jwq7WFxHEQWjAEWW3hjjMKR9ex01UX3HnlWn65R+vHvXuwSiS99MPr4q/n/zNpc9QIm3ZK48BO1C
	IkY12ZhNQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kZYgR-0003qB-2t; Mon, 02 Nov 2020 12:11:35 +0000
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kZYgQ-0003p2-8m
 for linux-mediatek@merlin.infradead.org; Mon, 02 Nov 2020 12:11:34 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:References:
 In-Reply-To:Date:Content-Type:Subject:Cc:To:From:Message-ID:MIME-Version:
 Sender:Reply-To:Content-ID:Content-Description;
 bh=COlY1Z9JTlziHRckXInvL6YPMd8otPIw1L1qTPONsB0=; b=pwPddPG6rQldD6e/tpx/g3RhCL
 7nT7G6e0BNdhiwxB7rkySIc2e93wdxiI3hVWuEi4yDkqWOcXOGuC+qP8WQFe7WcLGxhqLUhB2uN8/
 k4FY/sW4PPD39tkzzKMGDN3D0Nwf5pjhjshl3eizMEiFsFZ5Tqk9AKYDvsSMrzvK/RHO//+C9abZF
 MXu0tFzMfbwbWz9V5XU8ZbZH1h/DlzkQKDx3IWRgcm9s8X1Jh21hmunoCbSumVnFCiO0NR0Xs4Uau
 5E6D7OL8tJ8WhWx/qjqhrDEtnbJqIjJAQzxTCHa7k4GzhC62dc5Ef0W7q12svGL6UWmzQkHjVSccU
 wU7oDw0g==;
Received: from mout.gmx.net ([212.227.17.22])
 by casper.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kZYSN-0005B5-Os
 for linux-mediatek@lists.infradead.org; Mon, 02 Nov 2020 11:57:07 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
 s=badeba3b8450; t=1604318207;
 bh=ulH0yL49Zs5eNoVaKp+OGHU1yD5vDappgjihQPEn7Ks=;
 h=X-UI-Sender-Class:From:To:Cc:Subject:Date:In-Reply-To:References;
 b=WOPzX3clf18xjkG6cpbmvAufRSL4BLR7SHWar27PIxCzjzFD4OAWAbwOBaijiK7aF
 yKvKL+BBepNKKPW0bg8OqzmUlcriOPZlfG6rbW+e26OwOHS7U3laNOv6lvuVS3IiMl
 o3gkhAmcSMH3zLVcENL8ChVdjwx/i/zUndQbOJXA=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from [185.76.97.212] ([185.76.97.212]) by web-mail.gmx.net
 (3c-app-gmx-bap57.server.lan [172.19.172.127]) (via HTTP); Mon, 2 Nov 2020
 12:56:47 +0100
MIME-Version: 1.0
Message-ID: <trinity-4313623b-1adf-4cc3-8b50-2d0593669995-1604318207058@3c-app-gmx-bap57>
From: Frank Wunderlich <frank-w@public-files.de>
To: Marc Zyngier <maz@kernel.org>
Subject: Aw: Re:  Re: [PATCH] pci: mediatek: fix warning in msi.h
Date: Mon, 2 Nov 2020 12:56:47 +0100
Importance: normal
Sensitivity: Normal
In-Reply-To: <df5565a2f1e821041c7c531ad52a3344@kernel.org>
References: <20201031140330.83768-1-linux@fw-web.de>
 <878sbm9icl.fsf@nanos.tec.linutronix.de>
 <EC02022C-64CF-4F4B-A0A2-215A0A49E826@public-files.de>
 <87lfflti8q.wl-maz@kernel.org> <1604253261.22363.0.camel@mtkswgap22>
 <trinity-9eb2a213-f877-4af3-87df-f76a9c093073-1604255233122@3c-app-gmx-bap08>
 <87k0v4u4uq.wl-maz@kernel.org> <87pn4w90hm.fsf@nanos.tec.linutronix.de>
 <df5565a2f1e821041c7c531ad52a3344@kernel.org>
X-UI-Message-Type: mail
X-Priority: 3
X-Provags-ID: V03:K1:jYyejVeaj2brOcs4Q4UH22OqS7aiIjBeum4maSh2Zmyo+vBA0JlOayRM2AcnNYk4HcVN6
 p7yRyg/7PGHgiaviKxOOHfQIKOxIFhzucxw8UajnwnTy8ZanOEBLEXJ1b3V7MbnBnH6TmVOwOCV9
 xFUpNVFsnW996VhE7e7jSmHvVKSmVEo9neamw4RFiAWPSA3PB7CR68xGvQR7yoZiw4OeMyA/UYLv
 sLSpUt86s8JSawinnsQBP85qyWaXa2vF0Rr50ofRE7d5u9q9jY1q3GQ20290lUy5FL5mwCoEehs3
 X8=
X-UI-Out-Filterresults: notjunk:1;V03:K0:S3IivwM+kT4=:xaI1fXywJdp+SJdYRytlKF
 Vn2q1E3VySGKmOtACNRSqAv7fHe1soTH1bRUgz6FC5P4twwJIDoXh16+fi+p1g22oCpY53E7+
 uzZgDn+b+T8GkGeZhEWUc/Tq4zg1pEQAxbnSuQCAiEKEwnHpT+BlVicNp9gymfp5H+QTwhCKo
 uPa3YmwBuxy7L0rBYmsJhNoLexBsfrDoSVpC38qpej84z351HXtTVt8AV4lFIsGYF9dMjsp4j
 AZUmjocOHKpFMXuxk8rH0bXm6MdZeyEQb43dt58yMVaO2m+eWjsLb2T0bpMU5AlJ1ncH2MpIp
 H9kPQd4afMChDz9YCUWXN47C1lINzhOW5HAc2PSJpnbKHNcMpOyvPFXbA+sNhs1CVCb6bDwkI
 cpFUtwTvXMmoM60df0UXNiDdJZsELiN67qXDgPhYiUmVrKUdS8X3TWv0j8dHyo2MO1FpobXN3
 788r1lzrRT10QDBFK7Q2gdljLqROoofyJkHhIyZ/TKbLDcbZVoVzL3jNHhzuwETBI0hDxZ85R
 kd/Dxt8YpzqL7iJXBYoqWgW21Zk7CU5Q9xJQ6AghZeIUCpRPDaYN0A6pRabqjU2Di1+B524Ll
 F+/t3f787BOeE=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201102_115704_544965_1B3798D0 
X-CRM114-Status: GOOD (  11.02  )
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
Cc: Ryder Lee <ryder.lee@mediatek.com>, linux-pci@vger.kernel.org,
 linux-kernel@vger.kernel.org, Bjorn Helgaas <bhelgaas@google.com>,
 linux-mediatek@lists.infradead.org, Matthias Brugger <matthias.bgg@gmail.com>,
 Thomas Gleixner <tglx@linutronix.de>, Frank Wunderlich <linux@fw-web.de>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

looks good on bananapi-r2, no warning, pcie-card and hdd recognized

regards Frank


> diff --git a/drivers/pci/probe.c b/drivers/pci/probe.c
> index 4289030b0fff..bb363eb103a2 100644
> --- a/drivers/pci/probe.c
> +++ b/drivers/pci/probe.c
> @@ -871,6 +871,8 @@ static void pci_set_bus_msi_domain(struct pci_bus
> *bus)
>   		d = pci_host_bridge_msi_domain(b);
>
>   	dev_set_msi_domain(&bus->dev, d);
> +	if (!d)
> +		bus->bus_flags |= PCI_BUS_FLAGS_NO_MSI;
>   }
>
>   static int pci_register_host_bridge(struct pci_host_bridge *bridge)


_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
