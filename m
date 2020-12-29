Return-Path: <SRS0=bnG6=GB=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 252EFC433E0
	for <linux-mediatek@archiver.kernel.org>; Tue, 29 Dec 2020 06:27:35 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C4CE9207AE
	for <linux-mediatek@archiver.kernel.org>; Tue, 29 Dec 2020 06:27:34 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org C4CE9207AE
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=chromium.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=5sVx3IPA8PJ1Xh6Fl002iYir/4FrHpZ9MWrA3w9IbvI=; b=T0xAy/WYGF2Wni1bciYAEQ2ve
	o/k7Vi76eNPLTAu6HYP05gxxw5JZq/6EhHVB7uplwXO5GE1QvFMXXb9+LG4EQBrhKDfY3YKgC2BBP
	rNh2hws7CRgHCJXKwCGBpJODs6KEr1jMw1D5qon3vv8SUdMFZ4zmtwtMoLjWQY1uB+avtzSDmBkpG
	69VmgaE/WzRVqo0HT5Zbe9yBK4ZPJENH75Sa1PkUs8AtBgEgx4BDf8FzBckBgo9ySiloDkG5SR/ka
	PKcKrEdMd4i1B2MkbyoD8FBQo3IMhs+0nat0mgCkWPEZYMtRYbBuRY0gOHi+s5fVnDhWo6ikGM2kv
	lizA80G8Q==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1ku8Te-0000d7-ED; Tue, 29 Dec 2020 06:27:26 +0000
Received: from mail-pj1-x1031.google.com ([2607:f8b0:4864:20::1031])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1ku8Tb-0000bn-Dl
 for linux-mediatek@lists.infradead.org; Tue, 29 Dec 2020 06:27:24 +0000
Received: by mail-pj1-x1031.google.com with SMTP id v1so965907pjr.2
 for <linux-mediatek@lists.infradead.org>; Mon, 28 Dec 2020 22:27:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=GgdE70V3wvBcQA9RrpEicG3Yu8LjbkyE0wwy+vna/fc=;
 b=Hy1pUncbifpEXVsZ1rsp7zn/GHtS/pfJxMXLP7gCdNqoS60q+g86Q+kirTATC7Hpu5
 74SRiPMwZYMyG2XLA7t6/dFFbP6mJslDrTM3Sl29r8GPdFbYyAQT4nvNid7acab/2/oc
 /OaeMPAHeYduzH616k6Piw74wCmANekupEIY8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=GgdE70V3wvBcQA9RrpEicG3Yu8LjbkyE0wwy+vna/fc=;
 b=nyErZDN/TkQMFjAidv5rdj2bgi952gt7I1z5KS9CLlxDkrJIHiTWdISM36RkZ8/IDI
 pzyifhMI4NN4enHDnAUaE3uiwlgPT5bq1BhGNvoVZVsToB9pBtUd7TtGz59LBJvOpF3+
 KzHB18gEBWpSsJqdlhnPC8qRFyjiyms7kk1sBn1k0zdZBnB6p8TM7928hkY38ZA0MlbS
 8lqF4FbMSyJKGcFjrWDNj6oulkVl9bWoCF5C2L1G7p1RmT+IbKxvvS+fLmaT0iIVvOQj
 O74CZpI7Rw+QkWcXbTsiK6PWDvj+w6KpNqTzBgx/re4GOBVejQ2P6yXv2r+dOzDQFm4y
 NJcQ==
X-Gm-Message-State: AOAM533bHOIrhCIrzf49N2dL8wt66TJWNLVUZssLIyG7DztKB8OayRao
 8NPgaMPdalar+SFjs3z1mzZBPrttiTiH6c6BCgzmzw==
X-Google-Smtp-Source: ABdhPJy0ZjRbXZDk7+wJsqBfIMAP2iVJqXvigcqHG4DG+JiHMg1BQBc5Tv77Mxs3mV3iqOK48E46qGkeIllmeRqI7kE=
X-Received: by 2002:a17:90b:1c10:: with SMTP id
 oc16mr2628210pjb.144.1609223241122; 
 Mon, 28 Dec 2020 22:27:21 -0800 (PST)
MIME-Version: 1.0
References: <20201214131640.v3.1.Id0d31b5f3ddf5e734d2ab11161ac5821921b1e1e@changeid>
 <20201214163945.v4.1.Id0d31b5f3ddf5e734d2ab11161ac5821921b1e1e@changeid>
 <X+nr65vhINCw8fCL@kroah.com>
In-Reply-To: <X+nr65vhINCw8fCL@kroah.com>
From: Ikjoon Jang <ikjn@chromium.org>
Date: Tue, 29 Dec 2020 14:27:10 +0800
Message-ID: <CAATdQgAv_M6-xf1XhQoEnyAwMuXTo-GZ6xog4X1Qu4MtBnncTA@mail.gmail.com>
Subject: Re: [PATCH v4] usb: xhci-mtk: fix unreleased bandwidth data
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201229_012723_508399_06AAEB5E 
X-CRM114-Status: GOOD (  14.56  )
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
 Mathias Nyman <mathias.nyman@intel.com>, linux-usb@vger.kernel.org,
 open list <linux-kernel@vger.kernel.org>,
 Tianping Fang <tianping.fang@mediatek.com>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>,
 Chunfeng Yun <chunfeng.yun@mediatek.com>,
 "moderated list:ARM/Mediatek SoC support"
 <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Mon, Dec 28, 2020 at 10:34 PM Greg Kroah-Hartman
<gregkh@linuxfoundation.org> wrote:
>
> On Mon, Dec 14, 2020 at 04:39:53PM +0800, Ikjoon Jang wrote:
> > xhci-mtk has hooks on add_endpoint() and drop_endpoint() from xhci
> > to handle its own sw bandwidth managements and stores bandwidth data
> > into internal table every time add_endpoint() is called,
> > so when bandwidth allocation fails at one endpoint, all earlier
> > allocation from the same interface could still remain at the table.
> >
> > This patch adds two more hooks from check_bandwidth() and
> > reset_bandwidth(), and make mtk-xhci to releases all failed endpoints
> > from reset_bandwidth().
> >
> > Fixes: 4b0f7a77fb3c ("usb: xhci-mtk: supports bandwidth scheduling with multi-TT")
>
> This is not a git commit id that is in Linus's tree :(
>

Oops, I apologize, I sent a new v5 patch with
Fixes: 08e469de87a2 ("usb: xhci-mtk: supports bandwidth scheduling
with multi-TT")

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
