Return-Path: <SRS0=vV1m=M2=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A9F95C4338F
	for <linux-mediatek@archiver.kernel.org>; Tue,  3 Aug 2021 20:17:53 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 737F760F45
	for <linux-mediatek@archiver.kernel.org>; Tue,  3 Aug 2021 20:17:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 737F760F45
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Message-ID:Date:To:Cc:From:Subject:
	References:In-Reply-To:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=zNaQqU6uAEZ3NFGB95WRwhCtC3FmqsvZjs5o/NmqJhc=; b=29+fMchcQUvnTT
	aidlCwSnrvSmXrc+2jIM2eR8sPGwoKKgKd5iYx1kgIMmiMlPde4kZzL1o71WaVbDenjWLEzAUtgNh
	pejZh7AfUXwreYXw/EgWkLSydKkw6jT4HJXT2UIw7O4TgR0tMthLB3+8+qVDQF/hBiepzmzCD5C5+
	e37W/qMLDhEjact32Phjz1lhInnLxPxYmwcYEcl2VqhbTf+vqhLuLAvQC88EI8weL39/CeEP4isTT
	8I+6CQIedSbgzxMfcxe9n086PkxWmvNJlqV+7g9XJ04fjhV8x97BgbE7WOPm0yjmh7+xAYRUvYq09
	emDgG9ywZpZhYiJj8DeA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mB0r9-004A2r-Rv; Tue, 03 Aug 2021 20:17:43 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mB0qw-004A0P-Fw; Tue, 03 Aug 2021 20:17:31 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id F417260F45;
 Tue,  3 Aug 2021 20:17:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1628021850;
 bh=XTY6UB22so0/DVKfLu1mpMtUhtLH6Sk2bDv9rtYPFuw=;
 h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
 b=kDV+fafGWRc9HRtQpMMuNBgfkqjwbrUW/9dncn55koAK1K0WYo5IWAt9pR6towgvE
 PJ1rLKzhic0uMhonErS/TS3FdmVoPZL+dVVjTf9cHaH9yBbAW0OnTWNEj4zgPTAxnz
 3+G5t6DBI23y5tWwLTHV66pcxlTy6LYpXoOCw9zSo9SeJBriL2IOlpNKLMLh5WO3FY
 1lil1PAXOXuGzxJft2AAWT3khWgvGi2er17ts4WMQSMkYZVQEJpLul47jPQQ/eP2Ww
 4i7aNseAlg3F5mViKZcE0xnMLKX/aOVAvckFxEGaHYQrYkpfBn8gU7MHkc0YAcggEp
 l0wRNOPlWoEnQ==
MIME-Version: 1.0
In-Reply-To: <CAFqH_51D0A_Oht785cxvWjuNFYgLL25-qX1QEpLhWBARtTgVMA@mail.gmail.com>
References: <20210726105719.15793-1-chun-jie.chen@mediatek.com>
 <20210726105719.15793-3-chun-jie.chen@mediatek.com>
 <162740843452.2368309.13157283201271440368@swboyd.mtv.corp.google.com>
 <CAFqH_51D0A_Oht785cxvWjuNFYgLL25-qX1QEpLhWBARtTgVMA@mail.gmail.com>
Subject: Re: [v14 02/21] dt-bindings: ARM: Mediatek: Add mmsys document
 binding for MT8192
From: Stephen Boyd <sboyd@kernel.org>
Cc: Chun-Jie Chen <chun-jie.chen@mediatek.com>, Matthias Brugger
 <matthias.bgg@gmail.com>, Nicolas Boichat <drinkcat@chromium.org>, Rob
 Herring <robh+dt@kernel.org>, Linux ARM
 <linux-arm-kernel@lists.infradead.org>, linux-kernel
 <linux-kernel@vger.kernel.org>, moderated list:ARM/Mediatek SoC support
 <linux-mediatek@lists.infradead.org>, linux-clk@vger.kernel.org, devicetree
 <devicetree@vger.kernel.org>, srv_heupstream <srv_heupstream@mediatek.com>,
 Project_Global_Chrome_Upstream_Group@mediatek.com; 
To: Enric Balletbo Serra <eballetbo@gmail.com>
Date: Tue, 03 Aug 2021 13:17:28 -0700
Message-ID: <162802184879.3896750.16823365734333299735@swboyd.mtv.corp.google.com>
User-Agent: alot/0.9.1
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210803_131730_594886_4AA4C32C 
X-CRM114-Status: GOOD (  10.66  )
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

Quoting Enric Balletbo Serra (2021-07-28 01:47:21)
> Hi Chun-Jie and Stephen,
> 
> Missatge de Stephen Boyd <sboyd@kernel.org> del dia dt., 27 de jul.
> 2021 a les 19:54:
> >
> > Quoting Chun-Jie Chen (2021-07-26 03:57:00)
> > > This patch adds the mmsys document binding for MT8192 SoC.
> > >
> > > Signed-off-by: Chun-Jie Chen <chun-jie.chen@mediatek.com>
> > > Reviewed-by: Chun-Kuang Hu <chunkuang.hu@kernel.org>
> > > Reviewed-by: Matthias Brugger <matthias.bgg@gmail.com>
> > > Acked-by: Rob Herring <robh@kernel.org>
> > > ---
> >
> > Applied to clk-next
> >
> 
> This will conflict in linux-next as the binding was already converted
> to yaml. See
> 
> https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git/commit/Documentation/devicetree/bindings/arm/mediatek/mediatek,mmsys.yaml?id=63e1125e6bb8eae3cd20292f6a10ee421dd574ae
> 

Looks like it has been resolved in linux-next. Is there anything to do?

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
