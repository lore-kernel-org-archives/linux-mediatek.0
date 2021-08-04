Return-Path: <SRS0=9YCi=M3=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 93A51C4338F
	for <linux-mediatek@archiver.kernel.org>; Wed,  4 Aug 2021 11:33:52 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2DF8C61008
	for <linux-mediatek@archiver.kernel.org>; Wed,  4 Aug 2021 11:33:52 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 2DF8C61008
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=public-files.de
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:References:In-Reply-To:Date:Subject:Cc:
	To:From:Message-ID:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=kUt8onJ3R5+RPRXsU2vB+FwEgg1XxNZlVImi3q+dCP4=; b=w0L0FWZjKARMsw
	JaAH0g2Kc3/wjbtB1uGEStGqEOu/HOy0vC3/sbfu7SH7BmFD703Ctl9D7/dE0jSjifiluRLmfT/HE
	vru3gYXi9u+QMjROiqMCgKoh0eNHn9cVkzOAT2Bsfnd3vUEHFGiFJSqKDY0FhZuKJ41iT7u+KVYEG
	QC6fxIOonMRvD43XqKPXsSAzyyvCcDY5+H6mbEw5y17kMF2Qz8LK4RjcI54O8LOrPcbadcNUKfYDe
	FXnOFDESTVzgvxT+HB3jePnkJy5WYJzb5X9dDEun+0IR5fU5+5dPZ1tjmgInhgKmF4dZ4088VrX7n
	ks5ct6PeZwfFVjwjhOqQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mBF9V-005tgT-Is; Wed, 04 Aug 2021 11:33:37 +0000
Received: from mout.gmx.net ([212.227.17.21])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mBF9I-005tda-US; Wed, 04 Aug 2021 11:33:26 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
 s=badeba3b8450; t=1628076796;
 bh=ff67APoHVniOOMt0cwe7Q/LFXBx0DO1rCUYFjM5SPiU=;
 h=X-UI-Sender-Class:From:To:Cc:Subject:Date:In-Reply-To:References;
 b=A4DpLSMGsTNcJhEVIZIX0JYPz4NLlphYSB/9/6ajkzGVKQYVG6NrMgbX4glOfLB/m
 ZVcNZOnLI3eQXk7bzJ8X4yiX05nY+VtcWw0scXOlvW3Bknjx6EOnrPD1VpZMKnEq5Y
 fWREb0mnmd054k4xpgS6QDESXTKGWVOLwOKMm484=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from [217.61.147.17] ([217.61.147.17]) by web-mail.gmx.net
 (3c-app-gmx-bap67.server.lan [172.19.172.67]) (via HTTP); Wed, 4 Aug 2021
 13:33:16 +0200
MIME-Version: 1.0
Message-ID: <trinity-62b8c96c-2408-46d3-9690-e78af2f0c250-1628076795963@3c-app-gmx-bap67>
From: Frank Wunderlich <frank-w@public-files.de>
To: Sungbo Eo <mans0n@gorani.run>, Min Guo <min.guo@mediatek.com>
Cc: linux-mediatek@lists.infradead.org, Chunfeng Yun
 <chunfeng.yun@mediatek.com>, Greg Kroah-Hartman
 <gregkh@linuxfoundation.org>, Rob Herring <robh+dt@kernel.org>, Matthias
 Brugger <matthias.bgg@gmail.com>, devicetree@vger.kernel.org,
 linux-usb@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org
Subject: Aw: Re:  [PATCH 0/2] Add MUSB for MT7623
Date: Wed, 4 Aug 2021 13:33:16 +0200
Importance: normal
Sensitivity: Normal
In-Reply-To: <f3607979-ea50-fc1c-0afe-a55881aa24f0@gorani.run>
References: <20210803151320.71531-1-mans0n@gorani.run>
 <trinity-0f9449b8-5114-46e5-9a4f-00b62155a938-1628010948338@3c-app-gmx-bs54>
 <f3607979-ea50-fc1c-0afe-a55881aa24f0@gorani.run>
X-UI-Message-Type: mail
X-Priority: 3
X-Provags-ID: V03:K1:aW7aDZrU2GL2RmeyjencG7kyYZUvA3SIsL8kdEa159ahF31Bfc6bcg0se/F1FQJUMRl/7
 fndSvU8W13kKFBOS+y7Zxx3HiDz/L/jTf1WUoEKqL6sqsCc7nu/rs35bbTK+cMI4N/pqYrudzXt7
 mhyKkA+YPBqQpC5mLpDLLYP9WnvhAycD+gJ0RU8ggjVP2YlRVK8sz0BPBtkyN9KDADyZW3oT+p7+
 glqcyfoGX8kYS1On/w9ScM00tOwWtwl9zmcWwd0GqHfLE8QEjXrTIASmfVSyVm7Q+S2BatDCzkmg
 bI=
X-UI-Out-Filterresults: notjunk:1;V03:K0:MWGHEi+iFo0=:/jSc6JzpIdUVdjAoOKpZR8
 ciqXC+A849Qolk/zQmKqUBObRQ9eN6VjaoHXAdPcsOHAh7d0YTcl0OqB+hmYPn9xHbaYlJVMt
 QNHPn16Ud9bJvdDmVuQsnGMsvXD1GbPRvBwkxieevyVl0VOhoxSAeH0rwjKO00/qRMFt1nw2X
 OMiqey8zKkc5BJL3m65/6EiyQqLmDISpGsqU5YHnZuTSYRdadwBqYDxdhX9SlKYb9rv3Lf/ue
 FN8G0y/TS8INTqz0u9alM28NEEXh4HRhKK32bN0q5bGRqWQ81OyMI7kG8f7oE4KqrDlCSXLKw
 sq3V+Dg8IUZknXWu2DprXtX/i1jPGrFR1q9JpME45IVhPDc/pAA6Y32bdJAZMV7qOjGOYYZ40
 lBnvxqmHHPC38R2tT9FSXKm0ib+ROqMQ+hkC5CKmgwRz73kL3nvM91g1hCxSS0lAChnx0bsnA
 dfGSumSiFPPVkow/jWu1W1+OuVTZKbDERxuG9iEGqHEutXX4zraZp2JonP5JTS38If+0Xwhk1
 bcgWFaQHDOCLGuogMznQmN+/SQfv/bdAQ+FWmCSRYBt6doqBFkN8JgtLsUhI2QOhEOMv7rul8
 To66kn2S+R0XyHHJYubCxI0dazzf4jxIcv7cG7Bg/4oLxvhTyYs1epIBaiZUfZxdvZ6IX/7A7
 6aRm45uxQ9kXIQM7/viPoHQafQvGVUAxzBrksJhWIjn3bLa7PpBSKPTGR+SGIwPrApaa04me+
 OOOxFkujAgpk2ZYeEBNnfpsHppxco6jdlEu3TFwK2qZCTYwpBPU2lIgPOCIg3+Ax/na+hMwQM
 JopytI+thP795Nhxi8AUjmMRK8MvA5udnbpzrru1yzMemqhYJ4=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210804_043325_361283_39160AC9 
X-CRM114-Status: UNSURE (   9.25  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Hi,

another strange thing is, after some bootups (i boot kernel from tftp, but also on full power cycle),
musb-driver maps musb-hdrc.4.auto instead of #1

root@bpi-r2:~# dmesg | grep musb
[    5.502914] musb-hdrc musb-hdrc.4.auto: MUSB HDRC host driver
[    5.508782] musb-hdrc musb-hdrc.4.auto: new USB bus registered, assigned bus number 5

and then nothing works (no roleswitch, no power which does not work with pinctl / without regulator).
It's hard to test if things working before, do no more work if device is named differently.

maybe Min Guo can help here?

after bootup mode is b_idle in my case (currently do not change if i connect otg cable)

root@bpi-r2:~# cat /sys/devices/platform/11200000.usb/musb-hdrc.4.auto/mode
b_idle

regards Frank

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
