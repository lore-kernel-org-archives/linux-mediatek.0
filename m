Return-Path: <SRS0=pCB/=ZN=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,URIBL_BLOCKED,USER_AGENT_SANE_2
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EA7E0C432C0
	for <linux-mediatek@archiver.kernel.org>; Thu, 21 Nov 2019 13:09:37 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B563520731
	for <linux-mediatek@archiver.kernel.org>; Thu, 21 Nov 2019 13:09:37 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="V0tCqSme";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="K8JOzSEH"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org B563520731
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=8cs9zASoxqZn4IiwuVE+K1qSzhqbJ+Zu7EHuqqKGEUY=; b=V0tCqSmeRD/dLV
	lb+6mj2qwgD2q4KAPKNJwrFBD3X1aoe7PetRaz/5V+CRw9QVRLqX24TFYD1dEz/ZjcnSVNjQWS58M
	bL2oYJ8ySR4rmILmSLU+cVD7hc2F4rzYMIKERC49wYf9W1BhMsEJSHLGaUiiba7PpTpvJAd+ngHlC
	Q6ht2HEtbGavs74dLLa3MJh4thYywhTSpm6+aVc0aReFGrZ5EuNsj32MIQpDRyZ8/kTlN3lrL6CoG
	DSqReOWUPHo1bAj8Qsk0x5bP9KvKLFvBDhhMz8r93hS7RNEp4cbmP3vERgETjPxZdeHp4p0GrykHF
	tEDmZnY7M3jlFCn2WLww==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1iXmDH-0000Fk-RU; Thu, 21 Nov 2019 13:09:35 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1iXmD5-00006n-QI; Thu, 21 Nov 2019 13:09:25 +0000
X-UUID: e8743b01cd844a68aa452d3cf31c6ac1-20191121
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID;
 bh=GKRpbk2ZaobBcrGmB5jVBprxNIO5Hbu7SfyTwGSrIKk=; 
 b=K8JOzSEHkHL3MO8oyOwdXAKMIDqQpcxBEwEqlODopZEl7MFXIVymzFGDLqKxfOdWdz+LHf5P3vSb6Ev8xRUjc3ht/ru5qp7u3wwEn62wMugngeCHGIBNxYKJrFS3DSsAjRBqZ9xW9UcDmEt38gUd8ubGNI3FuTjP7915/GxBVws=;
X-UUID: e8743b01cd844a68aa452d3cf31c6ac1-20191121
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw02.mediatek.com
 (envelope-from <walter-zh.wu@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLS)
 with ESMTP id 2052480214; Thu, 21 Nov 2019 05:09:16 -0800
Received: from MTKMBS07N2.mediatek.inc (172.21.101.141) by
 MTKMBS62N1.mediatek.inc (172.29.193.41) with Microsoft SMTP Server (TLS) id
 15.0.1395.4; Thu, 21 Nov 2019 05:09:35 -0800
Received: from mtkcas08.mediatek.inc (172.21.101.126) by
 mtkmbs07n2.mediatek.inc (172.21.101.141) with Microsoft SMTP Server (TLS) id
 15.0.1395.4; Thu, 21 Nov 2019 21:09:07 +0800
Received: from [172.21.84.99] (172.21.84.99) by mtkcas08.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1395.4 via Frontend
 Transport; Thu, 21 Nov 2019 21:09:08 +0800
Message-ID: <1574341753.8338.7.camel@mtksdccf07>
Subject: Re: [PATCH v4 1/2] kasan: detect negative size in memory operation
 function
From: Walter Wu <walter-zh.wu@mediatek.com>
To: Andrey Ryabinin <aryabinin@virtuozzo.com>
Date: Thu, 21 Nov 2019 21:09:13 +0800
In-Reply-To: <217bd537-e6b7-3acc-b6bb-ac9c5d94da89@virtuozzo.com>
References: <20191112065302.7015-1-walter-zh.wu@mediatek.com>
 <040479c3-6f96-91c6-1b1a-9f3e947dac06@virtuozzo.com>
 <1574341376.8338.4.camel@mtksdccf07>
 <217bd537-e6b7-3acc-b6bb-ac9c5d94da89@virtuozzo.com>
X-Mailer: Evolution 3.2.3-0ubuntu6 
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20191121_050923_858103_04A527F1 
X-CRM114-Status: GOOD (  10.69  )
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
Cc: wsd_upstream <wsd_upstream@mediatek.com>, linux-kernel@vger.kernel.org,
 kasan-dev@googlegroups.com, linux-mm@kvack.org,
 Alexander Potapenko <glider@google.com>, linux-arm-kernel@lists.infradead.org,
 Matthias Brugger <matthias.bgg@gmail.com>, linux-mediatek@lists.infradead.org,
 Dmitry Vyukov <dvyukov@google.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Thu, 2019-11-21 at 16:03 +0300, Andrey Ryabinin wrote:
> 
> On 11/21/19 4:02 PM, Walter Wu wrote:
> > On Thu, 2019-11-21 at 15:26 +0300, Andrey Ryabinin wrote:
> >>
> >> On 11/12/19 9:53 AM, Walter Wu wrote:
> >>
> >>> diff --git a/mm/kasan/common.c b/mm/kasan/common.c
> >>> index 6814d6d6a023..4bfce0af881f 100644
> >>> --- a/mm/kasan/common.c
> >>> +++ b/mm/kasan/common.c
> >>> @@ -102,7 +102,8 @@ EXPORT_SYMBOL(__kasan_check_write);
> >>>  #undef memset
> >>>  void *memset(void *addr, int c, size_t len)
> >>>  {
> >>> -	check_memory_region((unsigned long)addr, len, true, _RET_IP_);
> >>> +	if (!check_memory_region((unsigned long)addr, len, true, _RET_IP_))
> >>> +		return NULL;
> >>>  
> >>>  	return __memset(addr, c, len);
> >>>  }
> >>> @@ -110,8 +111,9 @@ void *memset(void *addr, int c, size_t len)
> >>>  #undef memmove
> >>>  void *memmove(void *dest, const void *src, size_t len)
> >>>  {
> >>> -	check_memory_region((unsigned long)src, len, false, _RET_IP_);
> >>> -	check_memory_region((unsigned long)dest, len, true, _RET_IP_);
> >>> +	if (!check_memory_region((unsigned long)src, len, false, _RET_IP_) ||
> >>> +	    !check_memory_region((unsigned long)dest, len, true, _RET_IP_))
> >>> +		return NULL;
> >>>  
> >>>  	return __memmove(dest, src, len);
> >>>  }
> >>> @@ -119,8 +121,9 @@ void *memmove(void *dest, const void *src, size_t len)
> >>>  #undef memcpy
> >>>  void *memcpy(void *dest, const void *src, size_t len)
> >>>  {
> >>> -	check_memory_region((unsigned long)src, len, false, _RET_IP_);
> >>> -	check_memory_region((unsigned long)dest, len, true, _RET_IP_);
> >>> +	if (!check_memory_region((unsigned long)src, len, false, _RET_IP_) ||
> >>> +	    !check_memory_region((unsigned long)dest, len, true, _RET_IP_))
> >>> +		return NULL;
> >>>  
> >>
> >> I realized that we are going a wrong direction here. Entirely skipping mem*() operation on any
> >> poisoned shadow value might only make things worse. Some bugs just don't have any serious consequences,
> >> but skipping the mem*() ops entirely might introduce such consequences, which wouldn't happen otherwise.
> >>
> >> So let's keep this code as this, no need to check the result of check_memory_region().
> >>
> >>
> > Ok, we just need to determine whether size is negative number. If yes
> > then KASAN produce report and continue to execute mem*(). right?
> > 
> 
> Yes.

Thanks for your suggestion.
I will send a new v5 patch tomorrow.

Walter

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
