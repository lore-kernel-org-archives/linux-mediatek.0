Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4B41FC636D4
	for <linux-mediatek@archiver.kernel.org>; Fri, 17 Feb 2023 07:26:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=BHRAZTI5o+dIepaH+DVIh3O3w2k6AHu6HuSzNSZZ51M=; b=3p3kVMIRfVkA1QZ7mZUtIllg8m
	UJb9daKL+Hxfu+QDGwedGmJhNTJKa986QlLD8AwU5cuSXCXYhVCat/U+O2JpvrGCU93W6zx+qegyJ
	qrTBBMLH4YPe/S4KumH3f33Yj82y+fY2r4xvhvS34+cUGXwfyPw1Hrqn3ztccqrjJ5ZKI97RbY0pS
	DHE8WH2pQiyC2NFqz8bAp1430AMBPd1C/wwzxPFpYzRYZR9UMhng1QYTuXGNt7RtV49txqIiKiX7u
	13nYspHAU2sjMa/zFTw8q585dctC7e1nVlXUEEnoPR9GkKPLDJzN1Qch8TkICql6biM8McaBMLHbw
	kyufsj/g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pSv8E-00D4k7-TM; Fri, 17 Feb 2023 07:26:10 +0000
Received: from mail-vs1-xe32.google.com ([2607:f8b0:4864:20::e32])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pSv84-00D4hu-NJ
	for linux-mediatek@lists.infradead.org; Fri, 17 Feb 2023 07:26:01 +0000
Received: by mail-vs1-xe32.google.com with SMTP id d66so4654773vsd.9
        for <linux-mediatek@lists.infradead.org>; Thu, 16 Feb 2023 23:25:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=BHRAZTI5o+dIepaH+DVIh3O3w2k6AHu6HuSzNSZZ51M=;
        b=Eko4ttpHVL1yeaHVnXgT9itW5hX67NJh+/jUqhymVCKYf/deffoul4apjR/ukMEVSA
         AglCf2II8MP9RabSLDu9hJhwe8ak/89aqloZv2/aBhrHeqlSxm2BBSxtyFkQKUAydAsy
         Ssh/dE83khtqThZqiq9waclHTVhUt3PSlf22s=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=BHRAZTI5o+dIepaH+DVIh3O3w2k6AHu6HuSzNSZZ51M=;
        b=bKF79dMTa7zxCBLBNrfAc8j5MZWy85XEwim8TOzr7CohqPhxTnzKlBOqowqSOEKMlM
         m1InxAX1BYVubbVSombsTIK/sI+Jdik9Q/wk24iceIBET6eiQCHsIOrTCVUuKWz+hviF
         ae//Bhabf0l//5LjUSbr1XYRRPWWSG37u+EqmpVQYmIcDuPl/sLlWkuVtmgBwd47J7EE
         DuJ7ubRvNpz3xgo9O8y2n6lyIWHsl5H9kmWEqXpL/lpOmF+p4AvuC6E0MvAXbFc5dep2
         KdafPDmCKV/RAXUkZ0X4K5kLrQQAwOaMr5pKsx9omWW4Fkiard2IRz1fB3QE2UHMARE8
         mQbg==
X-Gm-Message-State: AO0yUKUrWLjCUbf0JwRMScAWXyrRazMtWd294Nj9TYlVu2o4OXuGuyBj
	sy1ASUf5gBQvnKpGV6xfkhRji+qsvWHVgYux+2eoHA==
X-Google-Smtp-Source: AK7set+op5NKsZfnuTNwqTZsyjzkykGdrpEkYtkLelEWoJ7H0NvKBaaCN/fWgfRlW4RSk414IyvaAmkJ7R5mnd2mMH4=
X-Received: by 2002:a67:f749:0:b0:3fc:58d:f90f with SMTP id
 w9-20020a67f749000000b003fc058df90fmr1598873vso.60.1676618755906; Thu, 16 Feb
 2023 23:25:55 -0800 (PST)
MIME-Version: 1.0
References: <20230214134127.59273-1-angelogioacchino.delregno@collabora.com> <20230214134127.59273-41-angelogioacchino.delregno@collabora.com>
In-Reply-To: <20230214134127.59273-41-angelogioacchino.delregno@collabora.com>
From: Chen-Yu Tsai <wenst@chromium.org>
Date: Fri, 17 Feb 2023 15:25:44 +0800
Message-ID: <CAGXv+5HJx37Yz-8JQscN2=6+yjhrAdUoQUCG8bHjH1=w=srC1Q@mail.gmail.com>
Subject: Re: [PATCH v2 40/47] clk: mediatek: Allow all MT8167 clocks to be
 built as modules
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: mturquette@baylibre.com, sboyd@kernel.org, matthias.bgg@gmail.com, 
	johnson.wang@mediatek.com, miles.chen@mediatek.com, 
	chun-jie.chen@mediatek.com, daniel@makrotopia.org, fparent@baylibre.com, 
	msp@baylibre.com, nfraprado@collabora.com, rex-bc.chen@mediatek.com, 
	zhaojh329@gmail.com, sam.shih@mediatek.com, edward-jw.yang@mediatek.com, 
	yangyingliang@huawei.com, granquet@baylibre.com, pablo.sun@mediatek.com, 
	sean.wang@mediatek.com, chen.zhong@mediatek.com, linux-kernel@vger.kernel.org, 
	linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-mediatek@lists.infradead.org, kernel@collabora.com
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230216_232600_829122_0488F204 
X-CRM114-Status: UNSURE (   7.18  )
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
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Tue, Feb 14, 2023 at 9:42 PM AngeloGioacchino Del Regno
<angelogioacchino.delregno@collabora.com> wrote:
>
> Almost all MT8167 clocks have been converted to use the common probe
> mechanism, moreover, now all of them are platform drivers: allow
> building as modules.
>
> Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>

Reviewed-by: Chen-Yu Tsai <wenst@chromium.org>

