Return-Path: <SRS0=2SDw=3U=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.7 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,URIBL_BLOCKED,URIBL_DBL_ABUSE_MALW,
	USER_AGENT_SANE_2 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 70231C33C9E
	for <linux-mediatek@archiver.kernel.org>; Fri, 31 Jan 2020 03:04:12 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 418CD206F0
	for <linux-mediatek@archiver.kernel.org>; Fri, 31 Jan 2020 03:04:12 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="Q2hm/1Lw";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="kU2cMA3o"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 418CD206F0
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=6dZk+K7z/XSmBnL0UrO6nLBPOF3foMjZr8hqYoDDx6c=; b=Q2hm/1LwYnPCOn
	R7F63bhp/1H4SlZVAs9E6hPvkaXifrPWGmmTGvsd1KnBSfHpT93eT5QqL4kSIhUvtzHo8QnHeVyUy
	ZFzdYIoviray6STn6rCA3WMxA9jKhsu3fvpTY3gib44+rC4x6borh/WctXqs+/TpvFsHTodPrw8Vh
	xTqf6g7OIttEH3u2WLWJHrfGXdK3/tyBBv9U/kWcErg/+s6rQmhkMa/wyChY9h0Yo6ciEDCXr4jNh
	9N3v5Rky+2vgJlsAxHsu8jKt6gPUkMji7Rf/R5OGICba3Vp8Y6w2vdEEQ+j5uX031E5gKyFRYrRVL
	R9di/Vh9v60d6QoOhNRw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1ixMbB-0000jN-FG; Fri, 31 Jan 2020 03:04:01 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1ixMb1-0000dQ-T0; Fri, 31 Jan 2020 03:03:54 +0000
X-UUID: 2a9289a6ce88494f81af2130be738f48-20200130
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID;
 bh=J/YS9xrz7SE39sg55EiuDt9slMVYOmJaP+90r0kGMF8=; 
 b=kU2cMA3os+/I6YXPqwB3/BHr2hvZiLyvU2Lj+5VvB8TH8KSVmTqGsWBo8WkSqev0Fo5qa5lCyQIDWwweOUrgjZzbKq6msuR9cHtm2SEB4ldme0hpsCOJXOmL4s7fTazW5y3IVtZk1Sb42cy/+JsG7g5lQYKgsQGWtP4Otbog4FI=;
X-UUID: 2a9289a6ce88494f81af2130be738f48-20200130
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw02.mediatek.com
 (envelope-from <walter-zh.wu@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLS)
 with ESMTP id 2014001226; Thu, 30 Jan 2020 19:03:48 -0800
Received: from mtkmbs07n1.mediatek.inc (172.21.101.16) by
 MTKMBS62N1.mediatek.inc (172.29.193.41) with Microsoft SMTP Server (TLS) id
 15.0.1395.4; Thu, 30 Jan 2020 18:54:12 -0800
Received: from MTKCAS06.mediatek.inc (172.21.101.30) by
 mtkmbs07n1.mediatek.inc (172.21.101.16) with Microsoft SMTP Server (TLS) id
 15.0.1395.4; Fri, 31 Jan 2020 10:53:02 +0800
Received: from [172.21.84.99] (172.21.84.99) by MTKCAS06.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1395.4 via Frontend
 Transport; Fri, 31 Jan 2020 10:51:23 +0800
Message-ID: <1580439225.11126.34.camel@mtksdccf07>
Subject: Re: [PATCH v4 2/2] kasan: add test for invalid size in memmove
From: Walter Wu <walter-zh.wu@mediatek.com>
To: Andrew Morton <akpm@linux-foundation.org>
Date: Fri, 31 Jan 2020 10:53:45 +0800
In-Reply-To: <20200130181613.1bfb8df8e73a280512cab8ef@linux-foundation.org>
References: <20191112065313.7060-1-walter-zh.wu@mediatek.com>
 <619b898f-f9c2-1185-5ea7-b9bf21924942@virtuozzo.com>
 <1580355838.11126.5.camel@mtksdccf07>
 <20200130181613.1bfb8df8e73a280512cab8ef@linux-foundation.org>
X-Mailer: Evolution 3.2.3-0ubuntu6 
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200130_190352_002694_4905CF59 
X-CRM114-Status: GOOD (  12.29  )
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
Cc: wsd_upstream <wsd_upstream@mediatek.com>,
 "linux-mediatek@lists.infradead.org" <linux-mediatek@lists.infradead.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "kasan-dev@googlegroups.com" <kasan-dev@googlegroups.com>,
 "linux-mm@kvack.org" <linux-mm@kvack.org>,
 Alexander Potapenko <glider@google.com>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
 Matthias
 Brugger <matthias.bgg@gmail.com>, Andrey Ryabinin <aryabinin@virtuozzo.com>,
 Dmitry Vyukov <dvyukov@google.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Thu, 2020-01-30 at 18:16 -0800, Andrew Morton wrote:
> On Thu, 30 Jan 2020 11:43:58 +0800 Walter Wu <walter-zh.wu@mediatek.com> wrote:
> 
> > On Fri, 2019-11-22 at 06:21 +0800, Andrey Ryabinin wrote:
> > > 
> > > On 11/12/19 9:53 AM, Walter Wu wrote:
> > > > Test negative size in memmove in order to verify whether it correctly
> > > > get KASAN report.
> > > > 
> > > > Casting negative numbers to size_t would indeed turn up as a large
> > > > size_t, so it will have out-of-bounds bug and be detected by KASAN.
> > > > 
> > > > Signed-off-by: Walter Wu <walter-zh.wu@mediatek.com>
> > > > Reviewed-by: Dmitry Vyukov <dvyukov@google.com>
> > > 
> > > Reviewed-by: Andrey Ryabinin <aryabinin@virtuozzo.com>
> > 
> > Hi Andrey, Dmitry, Andrew,
> > 
> > Would you tell me why this patch-sets don't merge into linux-next tree?
> > We lost something?
> > 
> 
> In response to [1/2] Andrey said "So let's keep this code as this" and
> you said "I will send a new v5 patch tomorrow".  So we're awaiting a v5
> patchset?
> 

Hi Andrew,

The [1/2] patch discussion shows below. Thanks for Dimitry help to
explain it. So that v4 patchset got Andrey's signature. Because I see
Andrey said "But I see you point now. No objections to the patch in that
case."

@Andrey, if I have an incorrect understanding, please let me know. 
Thanks for your help.

https://lkml.org/lkml/2019/11/21/1019
https://lkml.org/lkml/2019/11/21/1020


Walter
_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
