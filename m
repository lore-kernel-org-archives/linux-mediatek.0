Return-Path: <SRS0=EINh=AK=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.5 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5D0C5C433DF
	for <linux-mediatek@archiver.kernel.org>; Mon, 29 Jun 2020 08:15:52 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2C65723355
	for <linux-mediatek@archiver.kernel.org>; Mon, 29 Jun 2020 08:15:52 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="V4EG3Qy0";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=web.de header.i=@web.de header.b="q8yGgRVk"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 2C65723355
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=web.de
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=eJUYmaX65w/V96bfdnhfequgQdWpipNwnwvNVmbRSvs=; b=V4EG3Qy0ZgCRkwHVN+V3cuB+C
	KsrgTNiB8f+IZlUpRImWtLylQC5sU2VEZySo2TIVsJ1AvB4nj+VBA9X9GLJyhINlENTnNs5l/SvN+
	XlOkCulMohsiZIkRbqsEsFz0BvbVv+eov5bIkWb/esQTFmwPtgs3fiEBmroSfvkvisuCPxUQRy/Up
	b7XE8wnEz89BOPVqYoAY94c9oeyYXYNDQH2RvrNKXS7Lr+pNqxtjN53K9F4QNrdPb2unHD1X0mHhl
	Mm88jJ26Kz/BwXg5Gfak2q/7zvwA5OdDBV4zj6LWOVSVTIg3drWyKcUeJHm9sIvc6jof68vb9T8iM
	jEzGiQt2Q==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jpox4-0001m9-42; Mon, 29 Jun 2020 08:15:42 +0000
Received: from mout.web.de ([212.227.15.14])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jpox1-0001lV-Tp; Mon, 29 Jun 2020 08:15:41 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=web.de;
 s=dbaedf251592; t=1593418524;
 bh=S8T29fkcYiXDkPn/9lQ+45R4Jkq71F8qlpyc/mIFxpc=;
 h=X-UI-Sender-Class:Subject:To:Cc:References:From:Date:In-Reply-To;
 b=q8yGgRVk60ZR75l3yw4WYG+T57dYshnZh37DdMaG5Usqob+amVYZCiK/LkHVTawFy
 6l8eIcWM1DxU9+cxQXNKoWDzsYSJrmf/asDHgz4MjY1COL0hyt1YerB9iCcQo8/w/R
 3WzevQsE6rgUUbpDnLAckoyIV3ObgpipVltM/o00=
X-UI-Sender-Class: c548c8c5-30a9-4db5-a2e7-cb6cb037b8f9
Received: from [192.168.1.2] ([93.131.123.16]) by smtp.web.de (mrweb001
 [213.165.67.108]) with ESMTPSA (Nemesis) id 0M73o5-1ivOy91X5Z-00wpRo; Mon, 29
 Jun 2020 10:15:24 +0200
Subject: Re: [PATCH 1/2] usb: mtu3: disable USB2 LPM
To: Chunfeng Yun <chunfeng.yun@mediatek.com>, linux-usb@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org
References: <1593410434-19406-1-git-send-email-chunfeng.yun@mediatek.com>
From: Markus Elfring <Markus.Elfring@web.de>
Autocrypt: addr=Markus.Elfring@web.de; prefer-encrypt=mutual; keydata=
 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 FEE=
Message-ID: <390dab28-2798-ee5a-ece3-bf7f2cd3f175@web.de>
Date: Mon, 29 Jun 2020 10:15:21 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.9.0
MIME-Version: 1.0
In-Reply-To: <1593410434-19406-1-git-send-email-chunfeng.yun@mediatek.com>
Content-Language: en-GB
X-Provags-ID: V03:K1:t7V1F9kLqdX3GUIUap/U2aETmgPmRTpVr/MUNxvCH7AMYtaueRz
 L1/p/GHjsaoxRpo0i8waXAtAE3ppx7cfQf4rbsAxDFsoZS//+HziGbu4MhLzC0OGy1baAIC
 l/7ylzASryC5Le95u5bRV0XQFwkeG2JLit+p5clZLlv/xpX+c5t25vH1pntTFkIj0N/K8C9
 G5q1SOKR4AaUZaZK72L6w==
X-UI-Out-Filterresults: notjunk:1;V03:K0:t29BCTKpczA=:KR70siR1l0x51xzKwqtgGe
 dGnIaN9gfFpNrgbqhRCJiaORCfoJ3dvBl1h7T/l0LAy5ExATkQsE3qA9cbTjk9amEKJ9t2PUa
 OFlioJufJcIBTydgSk36rAkthZ4tBSt6qsSi3v+1Ka7STXQlJP7zH0CPhGJhJohvmAfeOKSaK
 5bnjXAFYLm2+WtKnXhVMJEqdhWN7yKqW4jQAelaP0zxKm9lwfjvpmURfgUrCWLJAD40f/IXa3
 Q62Qmi+Dc0h1hlbCaWMG+KfGIyrSfyL20kM7t5Y91SevsCZFFiru5cGgTAr1VA2c8QLevK5Cw
 I8JvPxScW+vY7ubUyAvI57QIpGs266VAFHJXvrgbCydRupQoeqMo5YbKmVdcng926GsryXKHL
 1KVEthEVDehGNJjOI2Fut73wEOPiuG70RW1K4CH9IY9aea7Kos61weEgMMHajed0NOYB2oMKM
 hMcukAVFf0HUhRtS1FXMT6YoDQ7A15VxunO3y/w5pHvjr7i59lTgTQf0gAFe++gNKHQwdNk4I
 r2Zm/d+VQ2gVHAkCUN+YVEUWz7tr/pA3M8BhXJhuGIiY+I26d6fMS5cGwka+Mu9oDgrI2bYhL
 t3ecW1HnqD9I35uX0T54wavM9NXRhqRYCujWRvn47sMbEHU9sfihKL1KeZ3H1Mvb9yksrLert
 NrNTjCNvMTZuy/OhlNDCRopnwGXvrqZhUiEI4jn36PXhBN2hPIYZh4AIDAtrVyiGLZAskSzGR
 jCJQRFQHUI/oV8K1q1rQ07K7P3JhVcII+kTScnvhlM6vKB+MMeVzyEaJEAIdTPKxqHbHDtCQS
 hN0/DWhyvu5xLjrQ7/Kb1zeEiYXk5Xf2i1rB12pmHcEA810yB4yWxS5pn4pQjLN0UTvhg4ral
 UK7Yn4aJVFFuiilkOec20HKvHzrNnNwk22EY4zqlKSujyDSohvBfq79t33eE/HfQGlj1M38o9
 oLrKysnl/xrUhqDKICYJUtIngLqfNiUjnE2r++fNNLmKuXIQLrdr2KeaIjBBys3RmMKa8ubUA
 UV6j7bqfJc5vE0Ck/C3KlNzJCoHRmZbAr6/RtHj8qByORNsHhAORa3kqDWhT58W2OjgpmowQG
 pEr31prilR9PIw1JFK6OpptLmxd9vFJJeMmVlvgRVaOSD27fw2DNTwbpuray7BC739L7aRHeN
 8dVoTlQzvYlMwoEZ2xMaRqUSzZbzLabjwa3eVlnkzUBtgttioQnHCn3WofwlvPi9FgKjumHHD
 2Ll7+s8wIqZDbqp5kH0N4fP/sCHApRKDcQOAWiQ==
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
Cc: Matthias Brugger <matthias.bgg@gmail.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Peter Chen <hzpeterchen@gmail.com>,
 Felipe Balbi <felipe.balbi@linux.intel.com>, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

PiBBIFN1cGVyU3BlZWQgZGV2aWNlIHNoYWxsIGluY2x1ZGUgdGhlIFVTQiAyLjAgZXh0ZW5zaW9u
IGRlc2NyaXB0b3IK4oCmCgpJZiB5b3Ugd291bGQgaW5zaXN0IHRvIGNvbWJpbmUgdGhlIHByZXNl
bnRlZCB1cGRhdGUgc3RlcHMgZm9yIHRoaXMgc29mdHdhcmUgbW9kdWxlLAphIGNvdmVyIGxldHRl
ciB3b3VsZCBiZSBoZWxwZnVsIHRvZ2V0aGVyIHdpdGggZm9sbG93aW5nIGltcHJvdmVtZW50cy4K
aHR0cHM6Ly9naXQua2VybmVsLm9yZy9wdWIvc2NtL2xpbnV4L2tlcm5lbC9naXQvdG9ydmFsZHMv
bGludXguZ2l0L3RyZWUvRG9jdW1lbnRhdGlvbi9wcm9jZXNzL3N1Ym1pdHRpbmctcGF0Y2hlcy5y
c3Q/aWQ9OWViY2ZhZGIwNjEwMzIyYWM1MzdkZDdhYTVkOWNiYzJiMjg5NGM2OCNuNzg1CgpSZWdh
cmRzLApNYXJrdXMKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fCkxpbnV4LW1lZGlhdGVrIG1haWxpbmcgbGlzdApMaW51eC1tZWRpYXRla0BsaXN0cy5pbmZy
YWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGlu
dXgtbWVkaWF0ZWsK
