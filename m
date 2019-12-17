Return-Path: <SRS0=Z+8g=2H=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.2 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,UNPARSEABLE_RELAY,USER_AGENT_SANE_2 autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EB65FC43603
	for <linux-mediatek@archiver.kernel.org>; Tue, 17 Dec 2019 03:56:48 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B8E962072B
	for <linux-mediatek@archiver.kernel.org>; Tue, 17 Dec 2019 03:56:48 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="cTjrRvos";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="AQu47qdP"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org B8E962072B
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=HKBTLavZCydt2Tc6U0EX75kjyaYH5l+i8OCeUiJNb7s=; b=cTjrRvosSumYza
	fWqf1dC21MEwCnviObgQqeA7CHW9Vdsy2anl4NKzqRfhtn1BzOM9gMiTPYKN1PcQqhVCmJ0QySbNr
	KV5wNrp8QiGlvm/8OgHlMswMJ3ExQTE96ECuJ5qsBlJg4upBeaSx0xQGy9knRZRTJnAev1AzbAo8N
	9sIQgMksF77mkknGwIUbE1lI7YRSLRlMNjlTb59xJU2kLkJZdlbyrzXDbNVqn22rvG1hLl+Rizf94
	6qEfzKR/aiKzTVQDxoF6SHHk0t/S/PSxBOl0YG2II/7eZd04U/6yMWysSlFC+GRdMq75wcAcDLZo4
	JznxX/TlJPTiwEdCI1wQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1ih3yV-000581-JY; Tue, 17 Dec 2019 03:56:43 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1ih3yK-000501-I9; Tue, 17 Dec 2019 03:56:34 +0000
X-UUID: 3cf023cee9f841eaab3a3e9e9f705b5f-20191216
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID;
 bh=KkmyAsKPyDcGBnKBUKfiIEN/q+ZFhqtz1dZUrUzasmY=; 
 b=AQu47qdPYZ4rF19lIlMz96C/lzXnNcMWCmHvcKFBkN7ia+QDja/BWIQIJW7UscKdZo3hO4NxmAstqoAkxAbdoihaaUCMBxVawqE+Mxhl3qXjOH0tqFx87ArUwOMysDtM+cMOaxahDPJDxXDGBut14LYojDIF9NdizBocgGR+ibU=;
X-UUID: 3cf023cee9f841eaab3a3e9e9f705b5f-20191216
Received: from mtkcas68.mediatek.inc [(172.29.94.19)] by mailgw01.mediatek.com
 (envelope-from <jitao.shi@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLS)
 with ESMTP id 245397378; Mon, 16 Dec 2019 19:56:24 -0800
Received: from mtkmbs05n2.mediatek.inc (172.21.101.140) by
 MTKMBS62N2.mediatek.inc (172.29.193.42) with Microsoft SMTP Server (TLS) id
 15.0.1395.4; Mon, 16 Dec 2019 19:57:33 -0800
Received: from MTKCAS36.mediatek.inc (172.27.4.186) by mtkmbs05n2.mediatek.inc
 (172.21.101.140) with Microsoft SMTP Server (TLS) id 15.0.1395.4;
 Tue, 17 Dec 2019 11:55:59 +0800
Received: from [10.16.6.141] (172.27.4.253) by MTKCAS36.mediatek.inc
 (172.27.4.170) with Microsoft SMTP Server id 15.0.1395.4 via Frontend
 Transport; Tue, 17 Dec 2019 11:55:59 +0800
Message-ID: <1576554988.19567.3.camel@mszsdaap41>
Subject: Re: [PATCH v3 0/2] clocks don't disable when pwm_mtk_disp suspend
From: Jitao Shi <jitao.shi@mediatek.com>
To: Chen-Yu Tsai <wens@kernel.org>
Date: Tue, 17 Dec 2019 11:56:28 +0800
In-Reply-To: <CAGb2v65v+W3-fNwiC_0uN2RpFUBRu3iL2t+OaGHLjVHHWFJVwQ@mail.gmail.com>
References: <20191217030438.26657-1-jitao.shi@mediatek.com>
 <CAGb2v65v+W3-fNwiC_0uN2RpFUBRu3iL2t+OaGHLjVHHWFJVwQ@mail.gmail.com>
X-Mailer: Evolution 3.10.4-0ubuntu2 
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20191216_195632_610872_E44CA9F8 
X-CRM114-Status: GOOD (  12.51  )
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
Cc: linux-pwm@vger.kernel.org, linux-kernel <linux-kernel@vger.kernel.org>,
 CK Hu <ck.hu@mediatek.com>, sj.huang@mediatek.com,
 Thierry Reding <thierry.reding@gmail.com>,
 "moderated list:ARM/Mediatek SoC..." <linux-mediatek@lists.infradead.org>,
 Uwe Kleine-Koenig <u.kleine-koenig@pengutronix.de>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 linux-arm-kernel <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Tue, 2019-12-17 at 11:26 +0800, Chen-Yu Tsai wrote:
> Hi,
> 
> On Tue, Dec 17, 2019 at 11:08 AM Jitao Shi <jitao.shi@mediatek.com> wrote:
> >
> > Changes since to v2:
> >  - Edit commit msg.
> >
> > Changes since to v1:
> >  - Edit commit msg.
> >  - Remove the register trigger in probe.
> >  - Rebase to v5.5-rc1.
> >
> > Changes in patches:
> >  - match pwm_mtk_disp clock when suspend/resume
> >  - trigger pwm_mtk_disp reg working after config
> >
> > Jitao Shi (2):
> >   pwm: fix pwm clocks not poweroff when disable pwm
> >   pwm: keep the trigger register after pwm setting.
> 
> Please add appropriate tags to your patches. These are not generic pwm
> patches, but are specific to one driver.
> 
> Consider the prefix: "pwm: mtk-disp: " so others can filter out the
> noise without looking at the content.
> 
> ChenYu

OK. I'll fix this prefix.

Best Regards
Jitao
> 
> >
> >  drivers/pwm/pwm-mtk-disp.c | 63 ++++++++++++--------------------------
> >  1 file changed, 19 insertions(+), 44 deletions(-)
> >
> > --
> > 2.21.0
> > _______________________________________________
> > linux-arm-kernel mailing list
> > linux-arm-kernel@lists.infradead.org
> > http://lists.infradead.org/mailman/listinfo/linux-arm-kernel

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
