Return-Path: <SRS0=I26f=7I=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.2 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,URIBL_BLOCKED,
	USER_AGENT_SANE_2 autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4F505C433E0
	for <linux-mediatek@archiver.kernel.org>; Tue, 26 May 2020 02:43:24 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9CFC920723
	for <linux-mediatek@archiver.kernel.org>; Tue, 26 May 2020 02:43:23 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="sen3q/nN";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="jrwl5nQm"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 9CFC920723
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=/zwcvqpoQ9ps+zMEh49PcQ7o8Ch5GjXcn5p13UZ47bE=; b=sen3q/nNO+BQhG
	rxf/zi/UsSXfkFd5YN+bspp4Yi3/uN+t5ztPIvjcNQR5E1jDOUhlK8LDN33b5G9on1ejkZpSCpywP
	MKz5S0GR2XNb77AY03RmgT+z6QA4UiFwSHEmKlXN8NInn9MTmQe/AxcAwyxh/asmkzqKKyYKu1rMt
	j/DE6+S5gEHu+Zg2y40b+rc/95Ej0KEiBt6FVXQdGCUdg80gmGQP2599U0BQM/nubhz6qediPHmyE
	SbyzB33dkxpOHvyJUiHezLMN06VJrCEaqPiZ86SQhZIgFLz2aXDWJwUuIjjt/jEhsZxLCnQOHcCIC
	MFsAi5EPcCEIrvqKh+fw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jdPYh-0000NJ-8H; Tue, 26 May 2020 02:43:15 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jdPYe-0000MP-JN; Tue, 26 May 2020 02:43:14 +0000
X-UUID: e3c53dcb785841349dc2eef38a912f28-20200525
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID;
 bh=diGs7P/c4KSIhXYc7oj93Qp0T+jxxg9AoG2TnBsAgcc=; 
 b=jrwl5nQmSk9CjJiebW6NI+m7HX6Z/CkhYX75eqncInbLj+uu3ULF4PgQZrT4HmiPsohy2VUtzv0CoJ3sKRQEUU1d+4+OHss1CqFoIJKAlpjmWFAaojTFtUauOmKUwonHxraNNYw91ubXBD8QrMQhbQkZNovafXBsqlHGCPY2vv8=;
X-UUID: e3c53dcb785841349dc2eef38a912f28-20200525
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw01.mediatek.com
 (envelope-from <weiyi.lu@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLS)
 with ESMTP id 712467279; Mon, 25 May 2020 18:43:08 -0800
Received: from MTKMBS02N2.mediatek.inc (172.21.101.101) by
 MTKMBS62DR.mediatek.inc (172.29.94.18) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Mon, 25 May 2020 19:43:06 -0700
Received: from mtkcas08.mediatek.inc (172.21.101.126) by
 mtkmbs02n2.mediatek.inc (172.21.101.101) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Tue, 26 May 2020 10:42:57 +0800
Received: from [172.21.77.4] (172.21.77.4) by mtkcas08.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Tue, 26 May 2020 10:43:03 +0800
Message-ID: <1590460982.28324.17.camel@mtksdaap41>
Subject: Re: [PATCH v1] clk: mediatek: assign the initial value to
 clk_init_data of mtk_mux
From: Weiyi Lu <weiyi.lu@mediatek.com>
To: Matthias Brugger <matthias.bgg@gmail.com>
Date: Tue, 26 May 2020 10:43:02 +0800
In-Reply-To: <1abb3571-75ad-10d8-ff62-17be270b5b71@gmail.com>
References: <1590388889-28382-1-git-send-email-weiyi.lu@mediatek.com>
 <1abb3571-75ad-10d8-ff62-17be270b5b71@gmail.com>
X-Mailer: Evolution 3.10.4-0ubuntu2 
MIME-Version: 1.0
X-TM-SNTS-SMTP: DDDB6C0F3A8AA9AC19A3F7982F4108E532DADCCD36F602FF9C91EF042C7AAF1B2000:8
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200525_194312_647908_F2134F2F 
X-CRM114-Status: GOOD (  17.35  )
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
Cc: James Liao <jamesjj.liao@mediatek.com>,
 Nicolas Boichat <drinkcat@chromium.org>, srv_heupstream@mediatek.com,
 Stephen Boyd <sboyd@kernel.org>, linux-kernel@vger.kernel.org,
 stable@vger.kernel.org, Fan Chen <fan.chen@mediatek.com>,
 linux-mediatek@lists.infradead.org, Owen Chen <owen.chen@mediatek.com>,
 linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Mon, 2020-05-25 at 11:08 +0200, Matthias Brugger wrote:
> 
> On 25/05/2020 08:41, Weiyi Lu wrote:
> > It'd be dangerous when struct clk_core have new memebers.
> > Add the missing initial value to clk_init_data.
> > 
> 
> Sorry I don't really understand this commit message, can please explain.
> In any case if this is a problem, then we probably we should fix it for all drivers.
> Apart from drivers/clk/mediatek/clk-cpumux.c
> 

Actually, we were looking into an android kernel patch "ANDROID: GKI:
clk: Add support for voltage voting" [1]

In this patch, there adds a new member struct clk_vdd_class	*vdd_class;
in struct clk_init_data and struct clk_core

And then in clk_register(...)
core->vdd_class = hw->init->vdd_class;

In many clock APIs, it will check the core->vdd_class to select the
correct control flow.
So, if we don't assign an initial value to clk_init_data of mtk_mux
clock type, something might go wrong. And assigning an initial value
might be the easiest and good way to avoid such problem if any new clock
support added in the future.

[1] https://android-review.googlesource.com/c/kernel/common/+/1278046

> It's a widely used pattern:
> $ git grep "struct clk_init_data init;"| wc -l
> 235
> 
> Regards,
> Matthias
> 
> > Fixes: a3ae549917f1 ("clk: mediatek: Add new clkmux register API")
> > Cc: <stable@vger.kernel.org>
> > Signed-off-by: Weiyi Lu <weiyi.lu@mediatek.com>
> > ---
> >  drivers/clk/mediatek/clk-mux.c | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> > 
> > diff --git a/drivers/clk/mediatek/clk-mux.c b/drivers/clk/mediatek/clk-mux.c
> > index 76f9cd0..14e127e 100644
> > --- a/drivers/clk/mediatek/clk-mux.c
> > +++ b/drivers/clk/mediatek/clk-mux.c
> > @@ -160,7 +160,7 @@ struct clk *mtk_clk_register_mux(const struct mtk_mux *mux,
> >  				 spinlock_t *lock)
> >  {
> >  	struct mtk_clk_mux *clk_mux;
> > -	struct clk_init_data init;
> > +	struct clk_init_data init = {};
> >  	struct clk *clk;
> >  
> >  	clk_mux = kzalloc(sizeof(*clk_mux), GFP_KERNEL);
> > 

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
