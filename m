Return-Path: <SRS0=cZv3=AS=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E2CB0C433E0
	for <linux-mediatek@archiver.kernel.org>; Tue,  7 Jul 2020 11:31:51 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B1C5920720
	for <linux-mediatek@archiver.kernel.org>; Tue,  7 Jul 2020 11:31:51 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="K/a4KNrv";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Ur+VVUqE"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org B1C5920720
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linaro.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=KZNa43WvTi3XIL2oF0kHP/O+sxDcT0yoDlLNveQ0J9I=; b=K/a4KNrvOVEAdsMSbvrPs3UPn
	UyfGSkEu0j6bjTWY412ioaSOKor1gam2kbm3wM77RLgxa1EQQutRjOrN7cLV8w03q8IcZ380muScp
	dCc3GblG+SdrmCKFI6uhZbpIITTqTg16SH5Mh3g9g9/fbo7vSxLAnve1u1Z3iFYMiUkF4cCtYD24R
	08zjzDWuONJeRdmflVXMSAWgAwGHtdJVl2DgPKU7UjQ9MC3cT57R1USN6pI68gKBEY524Fyx2+ade
	DoIR6GBavR/jbSA6R6+KS/RnuA+t5K5CyjV9ojAcA6e0tQTuSCyhKUsRNfUT0tohlvQ8Raoo5K/SD
	FBWKynsNg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jslp7-0005Nc-RN; Tue, 07 Jul 2020 11:31:41 +0000
Received: from mail-lj1-x244.google.com ([2a00:1450:4864:20::244])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jslp1-0005Kj-Se
 for linux-mediatek@lists.infradead.org; Tue, 07 Jul 2020 11:31:36 +0000
Received: by mail-lj1-x244.google.com with SMTP id z24so24575618ljn.8
 for <linux-mediatek@lists.infradead.org>; Tue, 07 Jul 2020 04:31:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=B2KdhuMT6KQW+/r9swGRwgIp0M+oChkiV6W0CrMAxNg=;
 b=Ur+VVUqE3bYZZ9r2VMSQL6CBGFMzXAgsMnDYz/2TV0WzlNWb6WMQtSDMbYtLt4kWdf
 KiV/QoHYbRbKQDF5piV/CJ7dFU6096XxgZZDUeHaMgBdMjFAyHfNmaE1ISmW60e2S8Xj
 iT86k/aJIumKjx4rg82kWTWdOHiU1xy5RfnFqpoCRflyaOSryvLH9xHc09NuOPM+ZR38
 I/rpqIeTSmDwls3IAWeT8WpfajixmQYegnjgV0YD6OHt4OOQbr2/JI4wEC/SjqgDvqsX
 jTnuWRX7FK5vJTpjpTZ5ISeljGbMF5o6B+IxKdKLadDv8if+mNZ8g/Amcf4H2jQyw+2n
 FOYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=B2KdhuMT6KQW+/r9swGRwgIp0M+oChkiV6W0CrMAxNg=;
 b=YFjlI0jwNqleIaChJxnkmAFEKzZ0kOFSSXA3Xa9NiVQPfRaIO/RBVCqEaq+HQuOCkB
 KUAedIi5iTI5+fHhmUZlYyBxmAct1LIU+PXvYi6vLMGlXD/NMs+xBJvRQJ9sT4veLpBH
 lvuyF7QS3GcCiAYXx3750mWx5US3tkn66wHje+AMCK2I4PjoEubI6ox2+itkwXqXGaMj
 qOCmaZoltEVvg/6h7123XyjeWCBg7ryzOjFUNhZfZ55GWDRirAZV0/m8IIzkPYCwXkp8
 jGdJvW9uHeKJjHOUpL9LNXQItj9789ewbNRtd9CeR8ev93HBoJQtl/6Wsiqyo2WpAE3R
 XFXA==
X-Gm-Message-State: AOAM531rDBUdnMgAWbahsjxSMRAF9cx4vz5TwNRykfEfijVh33g0bZua
 BGlBw3ewJ4xc/FmZ2JtLvyjEwJ8MlxmI0slb9jnnCg==
X-Google-Smtp-Source: ABdhPJxwu8LPZEcE6xITo3PK+ibXfZvzirfjgqwItXPsC33ipJdTwUPc3z5pWyDOFbMFJ/yL2oznPfkMolkPAi63JMM=
X-Received: by 2002:a2e:8046:: with SMTP id p6mr15925694ljg.100.1594121492164; 
 Tue, 07 Jul 2020 04:31:32 -0700 (PDT)
MIME-Version: 1.0
References: <1592480018-3340-1-git-send-email-hanks.chen@mediatek.com>
 <1592480018-3340-4-git-send-email-hanks.chen@mediatek.com>
In-Reply-To: <1592480018-3340-4-git-send-email-hanks.chen@mediatek.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Tue, 7 Jul 2020 13:31:21 +0200
Message-ID: <CACRpkdavqjcma8A1y9Sh=WWLu-n0+mQOhyNw2dHenA8ZnQkvgg@mail.gmail.com>
Subject: Re: [PATCH v6 3/7] pinctrl: mediatek: avoid virtual gpio trying to
 set reg
To: Hanks Chen <hanks.chen@mediatek.com>, Sean Wang <sean.wang@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200707_073135_952432_3483E8BB 
X-CRM114-Status: UNSURE (   7.20  )
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
 <devicetree@vger.kernel.org>, CC Hwang <cc.hwang@mediatek.com>,
 wsd_upstream@mediatek.com, Stephen Boyd <sboyd@kernel.org>,
 Andy Teng <andy.teng@mediatek.com>,
 Michael Turquette <mturquette@baylibre.com>,
 Loda Chou <loda.chou@mediatek.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
 Rob Herring <robh+dt@kernel.org>,
 "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>,
 Mars Cheng <mars.cheng@mediatek.com>,
 Matthias Brugger <matthias.bgg@gmail.com>, mtk01761 <wendell.lin@mediatek.com>,
 linux-clk <linux-clk@vger.kernel.org>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Thu, Jun 18, 2020 at 1:34 PM Hanks Chen <hanks.chen@mediatek.com> wrote:

> for virtual gpios, they should not do reg setting and
> should behave as expected for eint function.
>
> Signed-off-by: Hanks Chen <hanks.chen@mediatek.com>
> Signed-off-by: Mars Cheng <mars.cheng@mediatek.com>

Sean if you're OK with this patch I can just apply it separately.

Yours,
Linus Walleij

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
