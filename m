Return-Path: <SRS0=tvhu=GL=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C7509C433E0
	for <linux-mediatek@archiver.kernel.org>; Fri,  8 Jan 2021 10:51:11 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 6C4A1238E2
	for <linux-mediatek@archiver.kernel.org>; Fri,  8 Jan 2021 10:51:11 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 6C4A1238E2
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=chromium.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=3pjnbTpchb1qnS05PI9ilyIE/ykQKViR+0wirUjzgb8=; b=yY9O2wiqKWsAaoiyPuJeNZTyC
	ylyxJJe1moxqIr25hEz4q5LI3KIybz6THSFIAHLl3LfBOpdcV4c50wybVmb5xeGGAMqiVMYA67yyl
	2ZAbiPUDy0VeaCVy+sQGZXkl/1fNpg2VXgUBwyyJjs7XZ5VSz4RhxtjKbD9hacmEV8WtYE9HL/bdf
	eDxDSmPoF8FHPdHUTG8EidrQYdezfytOQdpQhcwTxtOAcIQ6PypIz+GDME8oC12MFQ8e+nfdzjaM+
	2O/M0pRuofHYPD45amwVKu0njyFcVbneIuMNEUzjsBAgoE1A80WVik2f+Q4hT/h8zzVyUeRyRaxxr
	zwz1HwYVw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kxpM2-0006bM-KN; Fri, 08 Jan 2021 10:50:50 +0000
Received: from mail-pf1-x433.google.com ([2607:f8b0:4864:20::433])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kxpLu-0006X3-3Z
 for linux-mediatek@lists.infradead.org; Fri, 08 Jan 2021 10:50:44 +0000
Received: by mail-pf1-x433.google.com with SMTP id m6so437284pfk.1
 for <linux-mediatek@lists.infradead.org>; Fri, 08 Jan 2021 02:50:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=hUYexvGQkq4ls/OimwsO5Jd0RZqGFOW3s7MoFq9zFTo=;
 b=YJkyuQWXhbFLgxwObjUfAmF83zKljdj7aMi/D0QeB/d+QLVbsGCvwyase5VS/GWSpg
 Es1unRr4cp3Fvy24ZBffOLz0Lfh11nBkmofiM2flPrgjewamfaSpMXKulclYD2Pltylo
 jrH2DnIwA96hZC5n+910xx3mFFG4aCgPnl1+Q=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=hUYexvGQkq4ls/OimwsO5Jd0RZqGFOW3s7MoFq9zFTo=;
 b=JzoJYM6vf8BU7+li+LjYtkcq1MOW42cvMw5GAczyovNqobuM8A39CCQXGxZfwU4jpT
 3Iwxbop30F60ul09hbLAcdn80LdiI/cB2FT4wa1gWvvhLesr/tfs9jN6j/XywUIlTaOE
 HAO35lGw0XOo3RN9S7MPiavUtujPdQXE6tPgHbU0OMOGrEklj8Gnav7KYstNJ75I4QZ5
 jpWyCRp1hoETPR+lc3x1xRmVQcgjOj05LIJ2Wjd/x4eyQCljNWNQ5DAYDvfYRCSZdo1S
 5U9J1GIDfQL+/iEp8le/T6s1UdxsLUrzFkCkxb1Y4Qlqz88QuMWzYI6cUvWu4jYuwtCR
 YWrw==
X-Gm-Message-State: AOAM5302fQ8izSP9nIUbTTEIm9JvVwboejkcPvACpTGnoEixgiZktgQm
 HYZkSOeJASlkekbUjkjeGoPuSXeXrBfONQD26Ae7Dw==
X-Google-Smtp-Source: ABdhPJznWhv1cTUN3HY6O/t1DpDD7sg3cxH33OEwBKtFZhXYshd0vUiYpemVN8VSwVvSOQqG6eW9FQ92uaiCom4uJ+4=
X-Received: by 2002:aa7:8813:0:b029:19d:cd3b:6f89 with SMTP id
 c19-20020aa788130000b029019dcd3b6f89mr3048408pfo.42.1610103039797; Fri, 08
 Jan 2021 02:50:39 -0800 (PST)
MIME-Version: 1.0
References: <20201229142406.v5.1.Id0d31b5f3ddf5e734d2ab11161ac5821921b1e1e@changeid>
 <1610087648.24856.41.camel@mhfsdcap03>
In-Reply-To: <1610087648.24856.41.camel@mhfsdcap03>
From: Ikjoon Jang <ikjn@chromium.org>
Date: Fri, 8 Jan 2021 18:50:29 +0800
Message-ID: <CAATdQgAfRTxbzG4tJ-ftX7M6wrYFR6v+ji+-nSk_dTRTMXzXwQ@mail.gmail.com>
Subject: Re: [PATCH v5] usb: xhci-mtk: fix unreleased bandwidth data
To: Chunfeng Yun <chunfeng.yun@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210108_055042_203311_9C1F13ED 
X-CRM114-Status: GOOD (  16.01  )
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
Cc: Zhanyong Wang <zhanyong.wang@mediatek.com>,
 Mathias Nyman <mathias.nyman@intel.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-usb@vger.kernel.org,
 open list <linux-kernel@vger.kernel.org>,
 Tianping Fang <tianping.fang@mediatek.com>,
 "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 "moderated list:ARM/Mediatek SoC support"
 <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Fri, Jan 8, 2021 at 2:34 PM Chunfeng Yun <chunfeng.yun@mediatek.com> wrote:
>
> On Tue, 2020-12-29 at 14:24 +0800, Ikjoon Jang wrote:
> > xhci-mtk has hooks on add_endpoint() and drop_endpoint() from xhci
> > to handle its own sw bandwidth managements and stores bandwidth data
> > into internal table every time add_endpoint() is called,
> > so when bandwidth allocation fails at one endpoint, all earlier
> > allocation from the same interface could still remain at the table.
> If failed to add an endpoint, will cause failure of its interface
> config, then the other endpoints in the same interface will be dropped
> later? you mean some endpoints in an interface may fail but without
> affecting its function?

Yes, drop_endpoint() is called for a failed interface when set_interface()
fails to switch alt settings, but set_configuration() does not call
drop_endpoint().
TT data seems to remain allocated until a device gets removed.

>
> >
> > This patch adds two more hooks from check_bandwidth() and
> > reset_bandwidth(), and make mtk-xhci to releases all failed endpoints
> > from reset_bandwidth().
> >
> > Fixes: 08e469de87a2 ("usb: xhci-mtk: supports bandwidth scheduling with multi-TT")
> > Signed-off-by: Ikjoon Jang <ikjn@chromium.org>
>

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
