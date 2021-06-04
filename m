Return-Path: <SRS0=7C4w=K6=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.6 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,URIBL_BLOCKED,USER_AGENT_SANE_2
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7DDF8C07E94
	for <linux-mediatek@archiver.kernel.org>; Fri,  4 Jun 2021 10:44:04 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1AB0D61417
	for <linux-mediatek@archiver.kernel.org>; Fri,  4 Jun 2021 10:44:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 1AB0D61417
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:CC:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=tKFOcPb/DkU1OKx4A3lq4QWlkq/oyPQaK4ShwXB9bzU=; b=jAHU9ZV8nIdE5G
	8pVAdt2RUsMfW4C/HSm0UYs+5Z/wz0GYl+0/64z3ZCj6k/IO3D5MqSPi4ctT3W6DQYx2wk4EyMwY8
	GR/VFvvDM9i/1L4YllQ/CkwjzCHjR5pZw7qv9Mtr8fZevEaegoGTAEcutbaFFTTThnv43BKyexIAm
	QKqKLSSNyh9X0UfgcxDg0aJm2IDt265XPP6cIWM6FTuGc0yJ5DRhxa1YNzXbaIXf/MtzZ095EscFe
	dneZWP8bpugnqkRqxiuzJymMzTGi+uMnDv7ZA1bshM3V2YlYE2n3Nr6h1WdX/dpyvy76Z6+ScMMGC
	GiuSWev3FaOMjOsV2yvg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1lp7Ir-00D2Dt-Ui; Fri, 04 Jun 2021 10:43:49 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1lp6yQ-00CvuZ-Km; Fri, 04 Jun 2021 10:22:46 +0000
X-UUID: 82b82c438653426b817f8b2966afdd2b-20210604
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID;
 bh=ejuq5SlmfT6xWK2lKEuK37+s2rh96rXwkYOgTP8rwM8=; 
 b=reDmGyp7LkkMAbv4ho1Yv6ufmFFxJHZJfHckQF+mrc3CGfDWHvZntMjBnj8Vy5xb1LujBfYIsl3ILBnSlMkYHMh/SwXRlENtTQC34vgIcO6jidIDs88GYerosKR/DQ/gl8AM66qr/IGDd3jdg/hkoCX8Ij/MEDcncjAH8qJ9RnQ=;
X-UUID: 82b82c438653426b817f8b2966afdd2b-20210604
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw01.mediatek.com
 (envelope-from <wendell.lin@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1785469155; Fri, 04 Jun 2021 03:22:36 -0700
Received: from MTKMBS01N1.mediatek.inc (172.21.101.68) by
 MTKMBS62DR.mediatek.inc (172.29.94.18) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Fri, 4 Jun 2021 03:22:03 -0700
Received: from mtkcas10.mediatek.inc (172.21.101.39) by
 mtkmbs01n1.mediatek.inc (172.21.101.68) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Fri, 4 Jun 2021 18:22:01 +0800
Received: from [172.21.77.33] (172.21.77.33) by mtkcas10.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Fri, 4 Jun 2021 18:22:01 +0800
Message-ID: <1622802121.26830.22.camel@mtkswgap22>
Subject: Re: [PATCH 1/1] clk: Export clk_register_composite
From: Wendell Lin <wendell.lin@mediatek.com>
To: Lee Jones <lee.jones@linaro.org>
CC: Stephen Boyd <sboyd@kernel.org>, Matthias Brugger
 <matthias.bgg@gmail.com>, Michael Turquette <mturquette@baylibre.com>,
 linux-clk <linux-clk@vger.kernel.org>, open list
 <linux-kernel@vger.kernel.org>, ARM/Mediatek SoC support
 <linux-mediatek@lists.infradead.org>, linux-arm-kernel
 <linux-arm-kernel@lists.infradead.org>, "open list:OPEN FIRMWARE AND
 FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, wsd_upstream
 <wsd_upstream@mediatek.com>
Date: Fri, 4 Jun 2021 18:22:01 +0800
In-Reply-To: <20210604082524.GF2435141@dell>
References: <1595493126-21611-1-git-send-email-wendell.lin@mediatek.com>
 <1597052186.27843.1.camel@mtkswgap22>
 <CAF2Aj3hZB08d8x6XOqsP4m5fv76fWH48U95j8ugLt-YWFJ-kkA@mail.gmail.com>
 <162276982204.1835121.10976600065855289763@swboyd.mtv.corp.google.com>
 <20210604082427.GE2435141@dell> <20210604082524.GF2435141@dell>
X-Mailer: Evolution 3.2.3-0ubuntu6 
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210604_032242_724745_1BB84307 
X-CRM114-Status: GOOD (  22.83  )
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

On Fri, 2021-06-04 at 09:25 +0100, Lee Jones wrote:
> On Fri, 04 Jun 2021, Lee Jones wrote:
> 
> > On Thu, 03 Jun 2021, Stephen Boyd wrote:
> > 
> > > Quoting Lee Jones (2021-05-20 09:07:42)
> > > > On Mon, 10 Aug 2020 at 10:36, Wendell Lin <wendell.lin@mediatek.com> wrote:
> > > > 
> > > >     Hi Matthias and all,
> > > > 
> > > >     Gentle ping on this patch.
> > > > 
> > > > 
> > > > What about a not-so-gentle ping on this patch?  Grrrr... :)
> > > > 
> > > > FYI, this is still required by more than one source.
> > > > 
> > > > Please help get this out of all of the vendor trees please.
> > > > 
> > > 
> > > Is there an in-kernel user?
> > 
> > How can there be?  It's not exported yet. :)
> > 
> > However there shouldn't be any barriers for vendors represented in
> > Mainline to build their drivers as modules if they so wish.  If/when
> > they do, this will need to be exported.
> 
> Wendell Lin, is this what you wish to do with the in-kernel MediaTek
> driver?
> 
This is because Mediatek clock driver would be built as kernel module,
so clk_register_composite() used should be exported, then we could use
it. 

Please refer:
[PATCH 2/2] clk: mediatek: Add EXPORT_SYMBOL for kernel module support 
https://lkml.org/lkml/2020/7/1/124
+EXPORT_SYMBOL(mtk_clk_register_composites);

clk_register_composite() is used by Mediatek clk kernel module.
From export symbol: mtk_clk_register_composites. 

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
