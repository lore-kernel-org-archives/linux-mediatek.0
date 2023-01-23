Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AAF59C05027
	for <linux-mediatek@archiver.kernel.org>; Mon, 23 Jan 2023 15:08:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=JM1EiOocNtSZA8MsnSOByXfINK+alIpF0Dhm3T9y7wc=; b=oZGhd4C+hOWb6Ws2v7wTgQM2s5
	QbFDFAMw4OEV6HhsV2VtNmSxdHzlxr6Z8xPvtONDik66ZFaYAjXWBt6xfSNkzrDdTyAwYp3EllZQN
	vqU5/zyBjCFKVjgz2xMfPgW9DVePKYXlf6WPcSzajGPI2IWHjgGzR8pG6dHvjph66PXyl052lDXV1
	qsI30aFhl4gwj3Tu8NDfhM7MCESnriK5ScYljH1Ld5jZ23AfsjQWhqTREzCi65Vob2dE9U6crS/n5
	eEhz9TYM8IG0rWwJtN8D6dU5jwrxZxr2mfaIqb1LH8yOoXxqHWUUzEZe4A4XsVwaBrzG7jX2z1Y4d
	8wmMHwDQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pJyQM-0004Ie-Ia; Mon, 23 Jan 2023 15:07:54 +0000
Received: from mail-yb1-xb32.google.com ([2607:f8b0:4864:20::b32])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pJyQJ-0004H3-GY
	for linux-mediatek@lists.infradead.org; Mon, 23 Jan 2023 15:07:53 +0000
Received: by mail-yb1-xb32.google.com with SMTP id p141so12413203ybg.12
        for <linux-mediatek@lists.infradead.org>; Mon, 23 Jan 2023 07:07:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=JM1EiOocNtSZA8MsnSOByXfINK+alIpF0Dhm3T9y7wc=;
        b=M2x2MjTHjmUlY72HKk4rlnXeJkdFfgeXmtMqYIyp8cmQJ8MtURsID4V59mR9+0Cn8U
         stkKjYi7X8vbNQipHx9DzCo5RgQyzvB6dknGpuiE2l1ptYtEc2rzCbOVgw0m7H4XAL8o
         +33Ibf5zFZ7swAPkUpjetRJkoz78HepNsRNWQ6hKfnyVD+7J3g+/TWrKGY9bKjHhpOAB
         UpYZdp852Txr3UQCAxYOFzoCRl8im3RVsf6FIRyK4TTq6k6UUy8cfgqeU7UC2MbTxumt
         Pu1wxP/1iGZTTYVkRqg3vdhp89nB6/obEXACanGagUvroApU7sosjl94Y0xWiiFpDO7k
         v56g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=JM1EiOocNtSZA8MsnSOByXfINK+alIpF0Dhm3T9y7wc=;
        b=m826at/oM8DY0aJmOPOfO5tJ1AqPhslj9t1VhcwnSs6JFFmkqzBNnbjDSDnAL8Bhdd
         A66mIftz0XA20+iZYPst1czutB9fQwFkdyUQkFeLHDrJGEObV6+qfMmFnGg/z2IV6Wum
         XOj529F6aMXT1uaKqWx2AY5oSeNfL4couV1vinl8V5rUYbSIleXuQZV9eHHh6DFNDx0X
         I/8ymXgR1haQe/ntzRdNGFbIYKNCBjXBTbUEBN5stiv3bm14G+ublchnY89ls9PDKs5o
         zHsFT2DwtJVDFZgoU3O5OwwDLa8EEWOOrT7QQpVZcnNkNH7itpS4sxq9RMZbZQrq70zZ
         joow==
X-Gm-Message-State: AFqh2kpcn3y/S6FPxHlPqFPgCjR0AxwzhYsj3P+qNfAjnaqWo+k8nmE/
	WU0Gldt8VAQ6wvVIe73tNd181J+/vU04JPOpXtMP1g==
X-Google-Smtp-Source: AMrXdXtou+r1eGkUjO+yV5sepHYYEBThh559isR/Qxq8Kt/3Do7Ef2BAHj6FQrPgGPw8IKZFv6I1Yuaq3ctMN14OTH4=
X-Received: by 2002:a25:690a:0:b0:70b:87c6:4fe with SMTP id
 e10-20020a25690a000000b0070b87c604femr2900478ybc.550.1674486469535; Mon, 23
 Jan 2023 07:07:49 -0800 (PST)
MIME-Version: 1.0
References: <20230118-mt8365-spi-support-v1-2-842a21e50494@baylibre.com>
 <20230120082054.610626-1-michael@walle.cc> <CAFGrd9qXL-u4XzG9MLK2zbKoDudhTYpr-gJaZPjbysJ9Fo2gnQ@mail.gmail.com>
 <Y857VOG5upNJfpdM@sirena.org.uk>
In-Reply-To: <Y857VOG5upNJfpdM@sirena.org.uk>
From: Alexandre Mergnat <amergnat@baylibre.com>
Date: Mon, 23 Jan 2023 16:07:38 +0100
Message-ID: <CAFGrd9qww=s1iox+cye_-JW=LPpUdKjLfGO1+V_1J92z7eniOw@mail.gmail.com>
Subject: Re: [PATCH 2/2] spi: spidev: add new mediatek support
To: Mark Brown <broonie@kernel.org>
Cc: Michael Walle <michael@walle.cc>, devicetree@vger.kernel.org, 
	krzysztof.kozlowski+dt@linaro.org, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org, 
	linux-spi@vger.kernel.org, matthias.bgg@gmail.com, robh+dt@kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230123_070751_609242_EFBB046E 
X-CRM114-Status: GOOD (  15.02  )
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

Le lun. 23 janv. 2023 =C3=A0 13:19, Mark Brown <broonie@kernel.org> a =C3=
=A9crit :
>
> On Mon, Jan 23, 2023 at 10:37:58AM +0100, Alexandre Mergnat wrote:
>
> > Yes I want to expose the SPI on the pin header for two reasons:
> > - It's an Evaluation Kit board, I believe exposing SPI helps new
> > customers to try/understand it.
>
> That's not how this works.  Anyone connecting something to the
> SPI header will need to update the DT to reflect whatever they
> have connected, if that is something that should be controlled
> with spidev then they should add the compatible for that thing
> to the driver.  If that is something that has a regular driver
> then the regular driver will be used.

Got it. I think this series should be dropped then. If someone needs
the SPI, then he should use overlay (or modify the DTS locally).
I thought I could use spidev to bring SPI into the userspace, to help
future users play with it ("/dev/spidev0.0").

