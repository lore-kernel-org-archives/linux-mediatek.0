Return-Path: <SRS0=BF5s=ZA=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.6 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E9858C5DF60
	for <linux-mediatek@archiver.kernel.org>; Fri,  8 Nov 2019 03:52:51 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id BC37220869
	for <linux-mediatek@archiver.kernel.org>; Fri,  8 Nov 2019 03:52:51 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="tnS6ihiA";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="UhuzaXhw"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org BC37220869
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=pEDz7b/yn56R/QghXjazb6VP2wD1UWsDXEJUE6NXWUQ=; b=tnS6ihiAL1NRKe
	NFiNh9uE1kNpL/JcOJbgPERJYFBztofh/mYHk2CRQhMtCwpIjLRtxEWL2rjiGGRgbLAm9HYKCOZWI
	43/zWPOEJmEBi+B9FbgMOVpWYxWpmPvui9J8jyR7XnWJgPo5NqPfrEQkikYE4g3VUBRqL9f0g6gc8
	covnKX3KesqXWS8beP4T7PBSfeZLTu/dVgA97q4glRtDA60LaNAhP2YiaE1gPqdacjWgl5qpazgGD
	nHmFxpsm1UbK2qswLTWHoYtqWWEe6vjUXPum4txoiAyRsopJZbLjo/TNkLCI9N+B1C1Fau1Pylal0
	iudWNWdBrt27cymo7Q+A==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1iSvKD-00038g-Da; Fri, 08 Nov 2019 03:52:41 +0000
Received: from mail-ot1-x343.google.com ([2607:f8b0:4864:20::343])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1iSvJr-0002mB-1m; Fri, 08 Nov 2019 03:52:20 +0000
Received: by mail-ot1-x343.google.com with SMTP id r24so4021438otk.12;
 Thu, 07 Nov 2019 19:52:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=aivP/GpZ1KGYpMt8cndt6JZJWRBCraXZuvgFzKajp8o=;
 b=UhuzaXhwh4V4OtCNmi00QRY7QIuJNsZY7XkdW++ynVvUV5ipDE+Txo4OVE1lAYeXVp
 HFYurymY/b4axShJS4pi96a4cDFg4XsaEAZuzSDazYZ+xkUuSVfOz7gDMMS5FuNx1I52
 4pYCYZIKgFb3PDPoZZoQCegxROP3vtLnD5FWU6EWJ4Ay3Fb9bzqhklkrt9EDA4BgpJSL
 c3X+TIxl0VX21P7JcSN9qfbQ/2nYxRjh79ikAkYQdFlM/5vRUJdU+SDSV4Ga1sN6DW1w
 InJb+twr0pq9RiCBWOzBp65fPHyJ4wySAymr2YrkSBU1ZtY0cqzuqo6sAfLmA3aY/keC
 89EA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=aivP/GpZ1KGYpMt8cndt6JZJWRBCraXZuvgFzKajp8o=;
 b=OcuxUoqyAt4p2grrOBsDRkYyBi4y4BIB9ZKYdr7sFtQeQRvQYx0CLLJasERyH86jGV
 uI7OiFmtXybJ5Qei6p640P7PTnNtGXNERyhGYq0k6DxJ5plaVRj/hk+Hm85U7l/COF8C
 L0gBmeFgO76b/TfK5RWMRZXgZy4GiYq5bKYtdE53NPX0GUfVcuP7DoHvDRp0YWlEG8CS
 ZW67TJJM5y5apGOcjEcmBAVpOpg5o0/pXe5E/F1KezZsz3tLq3k4GYIALhTQUPJ8U5iq
 SzOnVIqBPWQoej97N8aDmJcE24H7yn4qbsV8Kk1TUR0jmoQSLsfEOjnKa+U6RlLAAsvv
 khaA==
X-Gm-Message-State: APjAAAWmhKwkn9hQtv5rDNNLakoN6hJ2RE6IGNoaYJ1T2dIvREbIpIXm
 xK+5slP2VIeXfccFuDAfbZutwMFKm36Wrdqx6CPCfCZuKFM=
X-Google-Smtp-Source: APXvYqy5Nze/GU5XzkqvIJ38bkcAHVp1VfCQNvotnh9iz5Pbk2Lxb4Ftks1yabXMhPm4deuUl636X1OlG99R3qAShFU=
X-Received: by 2002:a9d:39c8:: with SMTP id y66mr6154192otb.181.1573185138031; 
 Thu, 07 Nov 2019 19:52:18 -0800 (PST)
MIME-Version: 1.0
References: <20191106140748.13100-1-gch981213@gmail.com>
 <20191106140748.13100-2-gch981213@gmail.com>
In-Reply-To: <20191106140748.13100-2-gch981213@gmail.com>
From: Chuanhong Guo <gch981213@gmail.com>
Date: Fri, 8 Nov 2019 11:52:06 +0800
Message-ID: <CAJsYDVK7E-LMyA2eH5VhFu9EQWur_BLRNRg0-YTsOiJ+GyEF4g@mail.gmail.com>
Subject: Re: [PATCH 1/2] mtd: mtk-quadspi: add support for memory-mapped flash
 reading
To: linux-mtd@lists.infradead.org, Yingjoe Chen <yingjoe.chen@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20191107_195219_091332_8BB797F8 
X-CRM114-Status: GOOD (  11.73  )
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
Cc: Mark Rutland <mark.rutland@arm.com>,
 "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
 <devicetree@vger.kernel.org>, Vignesh Raghavendra <vigneshr@ti.com>,
 Tudor Ambarus <tudor.ambarus@microchip.com>,
 Richard Weinberger <richard@nod.at>, open list <linux-kernel@vger.kernel.org>,
 Rob Herring <robh+dt@kernel.org>, linux-mediatek@lists.infradead.org,
 Miquel Raynal <miquel.raynal@bootlin.com>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Brian Norris <computersforpeace@gmail.com>,
 David Woodhouse <dwmw2@infradead.org>, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Hi all!

On Wed, Nov 6, 2019 at 10:08 PM Chuanhong Guo <gch981213@gmail.com> wrote:
>
> PIO reading mode on this controller is ridiculously inefficient
> (one cmd+addr+dummy sequence reads only one byte)
> This patch adds support for reading from memory-mapped flash area
> which increases reading speed from 1MB/s to 5.6MB/s
>
> Signed-off-by: Chuanhong Guo <gch981213@gmail.com>
> ---
>  drivers/mtd/spi-nor/mtk-quadspi.c | 11 +++++++++++
>  1 file changed, 11 insertions(+)
>

I'll abandon this patchset and implement DMA reading instead.

Regards,
Chuanhong Guo

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
