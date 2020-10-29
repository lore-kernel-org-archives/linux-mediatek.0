Return-Path: <SRS0=uLCs=EE=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9A933C4363A
	for <linux-mediatek@archiver.kernel.org>; Thu, 29 Oct 2020 17:10:18 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1115A20759
	for <linux-mediatek@archiver.kernel.org>; Thu, 29 Oct 2020 17:10:18 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="xvFMc3kz";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="DDd66bqB"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 1115A20759
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linaro.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=Rcwf1XS8N5Fh0nR5uufKbdhT3ra3yMqYXYGEdSXOMlI=; b=xvFMc3kzfECaEgT9IA2IqyXvr
	AVwu8oP6jom24I3dE37RS+E2IRF9c3fpuIV3Lx7iK/NNzx/d4UBNGzRGXij5z08U2Yi98Voio5PVZ
	yqzZzH+Q7pqvnqfMNEq/SZ1eBoHCmA66tutiKIHGkt73oW8pSYYMzYGuaqVWTY2Oo59tgg5rBQp7Q
	IQchTn4nsOYF4elPPrm+KRB0fNJW5p6yDjUVKA/aC4c5v+vBHcXcxAwSU1EAYv3X2RBzRXY00/3Qb
	0NEE/bamSDHOSHgje8aPb4/rlpZ4nvyc0vTEq7O2iVEsQfyIQbwgAJD42bndChSE/M07RSaEnx8DI
	KQsN9njfw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kYBRB-0004Iy-6i; Thu, 29 Oct 2020 17:10:09 +0000
Received: from mail-ej1-x643.google.com ([2a00:1450:4864:20::643])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kYBR6-0004Hf-3o
 for linux-mediatek@lists.infradead.org; Thu, 29 Oct 2020 17:10:05 +0000
Received: by mail-ej1-x643.google.com with SMTP id p5so4873847ejj.2
 for <linux-mediatek@lists.infradead.org>; Thu, 29 Oct 2020 10:10:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=Ej4yS8ap+XBOqnlNcXdzMhK0bt1ESoPkZ/WRIP+D8yc=;
 b=DDd66bqBN1ECj9L7lWlj37myfrINHdMBpv63J+bS8aWXeAfBK/P5nE0rviy8tYpH7Y
 uVHqrH6p0rtBtg9QCftuWvpY3UkBuOMyEF+VD4hCRNKHgVJNX5vtueK5opREhi9CDX0m
 1nczMRf9AmGRIK9t7c9zotkAN36F7rdAVN9pVADXrRgd8BzTxf/uaZp3zr4F3FSgmcBF
 2vsrqt5o0Px9ppDKjJEi8ROmlwAxNv/yWhljknZY5oxDUXQeaJAXv7ZVts0z0QPuVLmC
 uSJpMlW+3rLCyuKMdm+vaMF5KEljmxtZijiZH+aqYSA5XHtLyqn+bhlAOTaIg66h8Xq4
 q61g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=Ej4yS8ap+XBOqnlNcXdzMhK0bt1ESoPkZ/WRIP+D8yc=;
 b=WfIk4KeZx3gaXOizj04yQjjCl5Yyt807r9OfVP4KIfp8uGtAkGeo5KTfK0z8su4VtU
 X4nrV+Azlaar1pv4eGXHaBq++3B7yenM/BusBo1/PvNR/3UjYRAvYFPWvBmn21wBgOxf
 NfNhlrce/xVq86ebJM5aWHiI0Xp12wK2CB/yGUYZvGjNC7D5GqTsYvWbzCpUGe5R7xa1
 9jopYvhIaICTgvXZnoBsbYSsyY129xfTR1glqPrxDQ7E61oiWV2zskBUdO1+dW/SLf71
 Ky/SJvmqAWDV3os6JoqghJRSlWAqru1B4C3TLjwhoRxLNV921VlJrJVxQTKhJ62nDRxO
 2/kQ==
X-Gm-Message-State: AOAM532GgLdfpf/EzHhYZiYV8M6ehqDkRf3ZuzRQOBCXjtvegXQrhasI
 fD3aAPM6AbWrE7dlWFPhS0yeLmHVcta2MdP5wZycOA==
X-Google-Smtp-Source: ABdhPJwcHY+CitZath3dnhj/ZcwIgEU6KICkCLfFowci9FCg06L2RDtO5nVLQfnlWOHXhYrnIH6OZE8ciH9/BukpzUA=
X-Received: by 2002:a17:906:b110:: with SMTP id
 u16mr4977640ejy.55.1603991402119; 
 Thu, 29 Oct 2020 10:10:02 -0700 (PDT)
MIME-Version: 1.0
References: <20201016204019.2606-1-linux@fw-web.de>
 <20201016204019.2606-4-linux@fw-web.de>
In-Reply-To: <20201016204019.2606-4-linux@fw-web.de>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Thu, 29 Oct 2020 18:09:50 +0100
Message-ID: <CACRpkdZrUbq6h4uDoxfN70mzfbeWAeqo5KAdTWhiHbsb7VTbJg@mail.gmail.com>
Subject: Re: [RFC 3/3] pinctl: mt7622: drop pwm ch7 as mt7622 only has 6
 channels
To: Frank Wunderlich <linux@fw-web.de>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201029_131004_423461_8F8E711B 
X-CRM114-Status: UNSURE (   9.92  )
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
Cc: "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
 <devicetree@vger.kernel.org>, Frank Wunderlich <frank-w@public-files.de>,
 Sean Wang <sean.wang@kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
 Rob Herring <robh+dt@kernel.org>,
 "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Fri, Oct 16, 2020 at 10:40 PM Frank Wunderlich <linux@fw-web.de> wrote:

> From: Frank Wunderlich <frank-w@public-files.de>
>
> mt7622 is reported by mediatek to have only 6 pwm channels
> so drop pindefines for 7th channel
>
> Signed-off-by: Frank Wunderlich <frank-w@public-files.de>

I can merge this patch to the pinctrl tree if I get some kind of
review response from one of the Mediatek maintainers.

The rest should probably go through ARM SoC.

Yours,
Linus Walleij

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
