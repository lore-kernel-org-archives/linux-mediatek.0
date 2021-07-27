Return-Path: <SRS0=KH1D=MT=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3DC53C4338F
	for <linux-mediatek@archiver.kernel.org>; Tue, 27 Jul 2021 04:39:42 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 0503460E09
	for <linux-mediatek@archiver.kernel.org>; Tue, 27 Jul 2021 04:39:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 0503460E09
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=chromium.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ozBWwx4ZZD2bYe9i3CNpVgHnXmGPYJCbHpKo6qWkerQ=; b=dY4FaOyp+B98BY
	9w8uD18P7YjWymGQ2pLaJghK+NerwJsYIsFrNUaLAUMrdtXdiVO6Ij0M35nml8JLzAfTYIvpIsB19
	zdm6JgfR3NnLfVXzo6d8GT9DpywqOtkZD3Vpb3XX30Vvmd7wMjdA7CMZDCb7q0n2Kdm1PCUcQMdR7
	ReQVN3a9yJ6WaOMkvugLcUoTRrA0D1Y7jQZ8vLUav688ZBPLCxHR+GyUcpsNXfCsgwh5jbHg3W200
	HGR5lkxTRy6fi9neVPLaHALHB2Cx12fw/Met+NHOyHtJ91b8fHC2wPHtDSl8fIgdDKtcLIC6MiRNI
	+KB7z2A0c7B0dod64AAQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1m8EsN-00DCNx-3O; Tue, 27 Jul 2021 04:39:31 +0000
Received: from mail-pj1-x102f.google.com ([2607:f8b0:4864:20::102f])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1m8Es9-00DCJY-Hr
 for linux-mediatek@lists.infradead.org; Tue, 27 Jul 2021 04:39:18 +0000
Received: by mail-pj1-x102f.google.com with SMTP id
 e2-20020a17090a4a02b029016f3020d867so3172284pjh.3
 for <linux-mediatek@lists.infradead.org>; Mon, 26 Jul 2021 21:39:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=PXqkOOR1pOtYMzsgwXDzf42bCaKreSWxIwhWwvEeqtI=;
 b=AG59QGBYG2d8MJl+DmYb3WwVZKqVqgzyq3bnKbAV3gdhJeC91VtLz4113YUwJCoQO2
 Ct39sGCQGldasZApaM/KRIgysBJ9pVrgbJOVYVEgnlU1m/CalsRwAnIXsQNVX/lFkB+N
 bLBfyxvcMlkA0M8Dq7eyk8XbnByWU0n/wYTRg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=PXqkOOR1pOtYMzsgwXDzf42bCaKreSWxIwhWwvEeqtI=;
 b=FOyrB29o7u3tWYODY2uTREL4SIzi4fWsbqYnPDYd8TYScSTHSCSseocyM6YVfN332T
 9OiWfCZXkd6K/xWa6rPx06CUz2zgd3txPdu2E5jW9pvECtBUPaLJZtiNntZD9txkA+VT
 Hnkwmxjskez5Ylgl8ByjdpednLuwbDQjNqXuFJj6Cfha06jnkW3W3gowD7AC/U70u1uC
 ugwEtNX5Ozo/BDCvB7j/LfE4bEqle9hQwOBGrNFcyWJHhpHjvXKFv97hY1V0oNW5DN+z
 GJM+6DDTqYCgACw6o9r32Wx3w5rKaURRewjCtgIkaf58teL6hKks7L8CPT2e2CQB0HEv
 2oWA==
X-Gm-Message-State: AOAM532hBRXtOqHiyv0jk45T4Fe69dVvp+B4N3f1UFiqrtr2Lsv8ccu1
 lXH9ZSXZ76wJzaCBLGf1CX++uqBTnhEi525peWtmJQ==
X-Google-Smtp-Source: ABdhPJzk2XckOwQ6RCK2+Om3VQvLRLUz2rIVS0DubiOZfADOQ28pfm6zggkraLwAfixhBtKFGDUi7GmMyCICb0wLD1U=
X-Received: by 2002:a63:8f04:: with SMTP id n4mr21076455pgd.317.1627360756729; 
 Mon, 26 Jul 2021 21:39:16 -0700 (PDT)
MIME-Version: 1.0
References: <20210726105719.15793-1-chun-jie.chen@mediatek.com>
 <20210726105719.15793-10-chun-jie.chen@mediatek.com>
In-Reply-To: <20210726105719.15793-10-chun-jie.chen@mediatek.com>
From: Ikjoon Jang <ikjn@chromium.org>
Date: Tue, 27 Jul 2021 12:39:05 +0800
Message-ID: <CAATdQgAGEqDyPJ7bnPsCow+BAFYJMdOs_mk8XCkz5Yy66x07mw@mail.gmail.com>
Subject: Re: [v14 09/21] clk: mediatek: Add MT8192 basic clocks support
To: Chun-Jie Chen <chun-jie.chen@mediatek.com>
Cc: Matthias Brugger <matthias.bgg@gmail.com>, Stephen Boyd <sboyd@kernel.org>,
 Nicolas Boichat <drinkcat@chromium.org>, Rob Herring <robh+dt@kernel.org>, 
 "moderated list:ARM/Mediatek SoC support"
 <linux-arm-kernel@lists.infradead.org>, 
 open list <linux-kernel@vger.kernel.org>, 
 "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>,
 linux-clk@vger.kernel.org, 
 "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
 <devicetree@vger.kernel.org>, srv_heupstream <srv_heupstream@mediatek.com>, 
 Project_Global_Chrome_Upstream_Group
 <Project_Global_Chrome_Upstream_Group@mediatek.com>, 
 Weiyi Lu <weiyi.lu@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210726_213917_616516_331395FA 
X-CRM114-Status: UNSURE (   7.39  )
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

On Mon, Jul 26, 2021 at 7:03 PM Chun-Jie Chen
<chun-jie.chen@mediatek.com> wrote:
>
> Add MT8192 basic clock providers, include topckgen, apmixedsys,
> infracfg and pericfg.
>
> Signed-off-by: Weiyi Lu <weiyi.lu@mediatek.com>
> Signed-off-by: Chun-Jie Chen <chun-jie.chen@mediatek.com>

Reviewed-by: Ikjoon Jang <ikjn@chromium.org>

(snip)

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
