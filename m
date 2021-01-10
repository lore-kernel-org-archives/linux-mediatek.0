Return-Path: <SRS0=wO2S=GN=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E266BC433E0
	for <linux-mediatek@archiver.kernel.org>; Sun, 10 Jan 2021 08:36:45 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3DCE2239EF
	for <linux-mediatek@archiver.kernel.org>; Sun, 10 Jan 2021 08:36:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 3DCE2239EF
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=public-files.de
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:Reply-To:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Message-ID:From:To:Subject:MIME-Version:References:
	In-Reply-To:Date:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=nnsXFQMLu9oBf+nXMmja0g7EcFUWzS460JJXtg0ju0g=; b=3YktiHrTWUrf2Szubeus9dJryc
	1YfMLGO/shBJSQuGyUF4klSuXXgPpoxq/JMSwq16lB7282ySMlDiavqUtjSQYRb7KLTS817jSqBz7
	XOV0dxMtWT2raXRQHPmwxlB8o6Yui9CQdPQUAltq2fIaxNBghC9KzraT4f+1GmEGxWw6OJZQ6kSAA
	aSAl8xxSJb+l3HedYaGWm5M+dH32jMupp5QWKd6TKF872qI2Kg7XqUw0DxGmtvuwuf5phkExsCF54
	yogZfXbUjnuqcBt37E6zX7nXEHaABiJOfvIgNC1PlUj2XDk7pVAF6bhiY9THCawtLOwRTSvmX/Tes
	wzFJm2yg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kyWDA-0001uv-Kq; Sun, 10 Jan 2021 08:36:32 +0000
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kyWD7-0001u9-TY; Sun, 10 Jan 2021 08:36:30 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=Message-ID:From:CC:To:Reply-to:Subject:
 Content-Transfer-Encoding:Content-Type:MIME-Version:References:In-Reply-To:
 Date:Sender:Content-ID:Content-Description;
 bh=AYGpEcijaxGgdxbHWEgk3QAzVtE4/IoirszuB5L1Bg8=; b=ceQISp8rqCqfezXSI20fZLaT4l
 mgY77wHZon/k6OKGQdbnprrY0adm6l6sdDT9EMpyrTU+EB2aenakhy4VX14bli6Px0AiWSiCXXJIc
 A0HrnfJDeiaEZ68Umfp32XMBksSCCC4F/UUHEHBgqCLvSh8EbfXIwwM/p9CI9KQ29W/rnOmtf2aPN
 jydygVctAci+kG4vrKttNmRISb12w9L1H+TpmR6MmI7BO7hMVA3YnQyiTOxHUKnelf/trN+oqa0mL
 YnP63pKUJbsDmlZveU0KjgeOCTX+eeCTVR6T2jEKVCxIOao/gi+WZRFSH6oLzcCrBvUc72OFQKanr
 hwHoSDkw==;
Received: from mout.gmx.net ([212.227.15.18])
 by casper.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1kyWCt-001ZB0-EA; Sun, 10 Jan 2021 08:36:17 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
 s=badeba3b8450; t=1610267754;
 bh=AYGpEcijaxGgdxbHWEgk3QAzVtE4/IoirszuB5L1Bg8=;
 h=X-UI-Sender-Class:Date:In-Reply-To:References:Subject:Reply-to:To:
 CC:From;
 b=NLVbQKG+bN4Ab6kgHvSTJhNmmD6otHEk+C2OaUQv6VmltDkud/gIWgNPb6X7skMRS
 pInDmCIm76nvQORNgRawWFUAhXKhvgAfHA+nAXqJ3Z0RurXD6FaFDxnMmsJA/8LAqJ
 g9BxEfkFA6/v2gNNtYh5nFr9SW915NrvFoSrXvwg=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from frank-s9 ([80.208.211.2]) by mail.gmx.com (mrgmx004
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1N7zFZ-1ju8AT26vT-0155dp; Sun, 10
 Jan 2021 09:35:54 +0100
Date: Sun, 10 Jan 2021 09:35:46 +0100
User-Agent: K-9 Mail for Android
In-Reply-To: <20210109190937.42409-1-linux@fw-web.de>
References: <20210109190937.42409-1-linux@fw-web.de>
MIME-Version: 1.0
Subject: Re: [PATCH] dts64: mt7622: fix slow sd card access
To: linux-mediatek@lists.infradead.org,Frank Wunderlich <linux@fw-web.de>
From: Frank Wunderlich <frank-w@public-files.de>
Message-ID: <059279A9-8530-41AB-9997-04B2D22BB11B@public-files.de>
X-Provags-ID: V03:K1:K7/234lirOc+CxkHbj/O/PQPi9gMldKz2CdoGZCHu/nKXvcwLkl
 /EyLYvTxEmDgvO1BI9AiWIPmPVPqzAGIBRlPKDJuzrHceT2YUrG+VLm90SsZjp/1AfnA9xG
 KmSphA73sAc4MuMo+/B9ee8C4o9m8ORoNa2O2xACMfrOjArUtLD4iqPEHpw2B9ADnK2xLYo
 eDaJtWzGbe6GkGVA0TUiA==
X-UI-Out-Filterresults: notjunk:1;V03:K0:JXg5R0fSKYU=:PhAQb/VURv9Qd6VcAQG3eR
 X9P+X4bJdTsSJxO7v/0gVGgiJExZVHLaVr0S1CnXkB74WN+qJtbQRs+xcsdZw4Img0pyQ0KEj
 vGjej3oVjtIaRlRmg/e5imcvsLgvDT5Im/npPJl+XxZ621g4V6sSbgXAQREFMm4SRARwc7IJ0
 poRRx8zZSCoLBh5NqYwlQzteAXfyGg8aVzmC7/nU29Qj6jnZnaV/hbNngn0sU62f0Esqeqtdn
 kR5W8WY7G5xHd+C442nfwqLUKoQIL3zNA5q2EK/BDoiNSU2CUOPTStH6dKOpRN/aaSG7f6jHP
 7+0oSxIlqIWWUnECVOFlJ6WaMWSizgYu4BvJqaxclioYY0Y9e4/Xn8fQ5LOAE0bLS2+VRAUPX
 0o+gSumt1IAlx89VtsIKDcr0xfcZG33w45qUMpq2WNRMIq5F+tuVLU5BVquFZZYVCmHM7sqzM
 NFs2GLFN/owfekiCpzPWo3/PycY8APa2dVHcz4e16NHkXk0UOZJWWhjBnN5pfDt+x+KrMFCqa
 eVr8jblw2cxxlhSQj2EkaReHh2/ndM9cAEBNIiU/YMrFA/VCz/Lpt2/HrNRiR2uM3oR5Cia78
 eBQDooEvnsFJwcBuZqM2MCqO+TC3B5AGZuJWlXF5oE+lJVsaCHeaQpJ+ngRcefK7+9BmHW6Qd
 GYQxRZu0KtIzo73feLbFjMMN9ezcRjrVuo4h2hZlj4oKf3a+nlAzxbUZpTwJcqGS+sLEicZXi
 XpJMgnwzB1qsN3m8+ay0t1nP5TG1Az43vs2uSCLJNSeyn2DrX7iXGIWin8Dq8x+gfZnRfRC1y
 XOACaU3I7TMRW2TFitnJqU0AjAHcl8bpBBigGDCt2iTJbLKDKM9LHt8FbjwyhRyAsF7EgVy1Z
 PR41u3dEmU9GjmZysfzw==
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210110_083617_116438_1361D5EA 
X-CRM114-Status: UNSURE (   7.69  )
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
Reply-To: frank-w@public-files.de
Cc: devicetree@vger.kernel.org, Ryder Lee <ryder.lee@mediatek.com>,
 Wenbin.Mei@mediatek.com, sin_wenjiehu <sin_wenjiehu@mediatek.com>,
 Sean Wang <sean.wang@mediatek.com>, linux-kernel@vger.kernel.org,
 Rob Herring <robh+dt@kernel.org>, Jimin Wang <jimin.wang@mediatek.com>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

I guess issue is caused by incompatible setting in uboot,but have not found which exactly so i handled it like emmc.

If patch is ready to be applied please add 

Cc: stable@vger.kernel.org

because all kernel versions are affected (tested at least in 5.4 and 5.9). If i need to create a v2,i will add it

@sean/ryder/wenbin can you tell me if sd on mt7622/bpi-r64 is maybe capable of hs400?
regards Frank

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
