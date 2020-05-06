Return-Path: <SRS0=yMRY=6U=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.2 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,UNPARSEABLE_RELAY,URIBL_BLOCKED,USER_AGENT_SANE_2 autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8F246C47247
	for <linux-mediatek@archiver.kernel.org>; Wed,  6 May 2020 02:18:46 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5CC6B206A4
	for <linux-mediatek@archiver.kernel.org>; Wed,  6 May 2020 02:18:46 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="NinR822f";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="dW0KNPrS"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 5CC6B206A4
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=KfXl98WkIkICRZQQraWn4cYFyAcj6cYVt3u/3IZur9s=; b=NinR822fz0L/dk
	DvTarsHYqK54udzRCKPA6K+oGjQ68HB+/Eu5QLo9aDnumFgYtDXreXsowwxPqyFPx1R02Ro+ZALmJ
	Gj2DC81XZ+SjjzZQq+14xmMzkKQ2Y+NZiJFMIMn+5UXGH00YJWbkuMlnkpqLpXmHjeliZML6VzFhP
	CnOcgoQQkZU4srs6tIm76USXtZgGnTh+L/EwjmXVEDANDFiIV8ujN5cfcKahzmgq16YKbLLfCpwPW
	Am+GWL+OjXfHxA3oegndOIfp0tzxc7vIlkQZ8BwUwPan2y5+qBzYC4JuGFcb9QOdtj47vuFE06hPy
	CxWsvbRYpwONMwUooozQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jW9ds-0005zl-3m; Wed, 06 May 2020 02:18:36 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jW9dp-0005y2-1w; Wed, 06 May 2020 02:18:34 +0000
X-UUID: 2d62579d8c4440068eaaa368bbf7e98b-20200505
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID;
 bh=4S4SLonUCeNW5fuMA+NMKxm1B76GCYdDl1j3L5SVHFc=; 
 b=dW0KNPrSZhZM173NBSclYZ1tJTvc44e9LJrIEP270ljD0AA3YnvMy1bhrzbNZE6DQqpEV5fpGcsXftAjtA36mgqTZ0/smMm6xmizEK4uwLOrE5XOUzSlgyEOe9v10u569pZRB5hORt/M+2NjUFcrIunjVrk8pUVYCUDI5ywW0Is=;
X-UUID: 2d62579d8c4440068eaaa368bbf7e98b-20200505
Received: from mtkcas67.mediatek.inc [(172.29.193.45)] by mailgw01.mediatek.com
 (envelope-from <walter-zh.wu@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLS)
 with ESMTP id 970930062; Tue, 05 May 2020 18:18:27 -0800
Received: from MTKMBS01N2.mediatek.inc (172.21.101.79) by
 MTKMBS62DR.mediatek.inc (172.29.94.18) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Tue, 5 May 2020 19:18:26 -0700
Received: from MTKCAS06.mediatek.inc (172.21.101.30) by
 mtkmbs01n2.mediatek.inc (172.21.101.79) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Wed, 6 May 2020 10:18:23 +0800
Received: from [172.21.84.99] (172.21.84.99) by MTKCAS06.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Wed, 6 May 2020 10:18:19 +0800
Message-ID: <1588731504.7745.3.camel@mtksdccf07>
Subject: Re: [PATCH v2] stacktrace: cleanup inconsistent variable type
From: Walter Wu <walter-zh.wu@mediatek.com>
To: Bart Van Assche <bvanassche@acm.org>, Andrew Morton
 <akpm@linux-foundation.org>
Date: Wed, 6 May 2020 10:18:24 +0800
In-Reply-To: <d2a9f155-f309-0182-73c9-5c02d7014574@acm.org>
References: <20200421013511.5960-1-walter-zh.wu@mediatek.com>
 <d2a9f155-f309-0182-73c9-5c02d7014574@acm.org>
X-Mailer: Evolution 3.2.3-0ubuntu6 
MIME-Version: 1.0
X-TM-SNTS-SMTP: B18FF41D50DAA5A8BBADA9C39DDC3D29DECCB526F72A79F9EBA7F71DB48F5D192000:8
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200505_191833_104517_3B61EEBF 
X-CRM114-Status: GOOD (  10.82  )
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
 Peter Zijlstra <peterz@infradead.org>, linux-kernel@vger.kernel.org,
 linux-mm@kvack.org, linux-mediatek@lists.infradead.org,
 Josh Poimboeuf <jpoimboe@redhat.com>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@kernel.org>,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

On Wed, 2020-04-22 at 18:21 -0700, Bart Van Assche wrote:
> On 4/20/20 6:35 PM, Walter Wu wrote:
> > Modify the variable type of 'skip' member of struct stack_trace.
> > In theory, the 'skip' variable type should be unsigned int.
> > There are two reasons:
> > - The 'skip' only has two situation, 1)Positive value, 2)Zero
> > - The 'skip' of struct stack_trace has inconsistent type with struct
> >    stack_trace_data, it makes a bit confusion in the relationship between
> >    struct stack_trace and stack_trace_data.
> 
> Reviewed-by: Bart Van Assche <bvanassche@acm.org>

Hi Andrew,

Would you know why not to be picked up this patch yet?
Do I miss somethings?


Thank you for your help.

Walter

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
