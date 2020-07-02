Return-Path: <SRS0=IR42=AN=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,UNPARSEABLE_RELAY,USER_AGENT_SANE_2 autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B9065C433DF
	for <linux-mediatek@archiver.kernel.org>; Thu,  2 Jul 2020 13:26:19 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 887E020672
	for <linux-mediatek@archiver.kernel.org>; Thu,  2 Jul 2020 13:26:19 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="OL3rX0rb";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="ebeCUJBy"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 887E020672
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Date:To:From:
	Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=9u0lhX9PlvVvWAaUSvFe7PVLdkDe+LjjovGKLwhX51o=; b=OL3rX0rbdzmgt77Ed4B3d5R3C
	wIL89rKDEi6QfBOx0LfeN3nnlMRmzdPNMTFc8TI4JuoxGWPcLldnRdApI9N7p+I0aKfN1S47ZHUac
	ElneIWguOOYyI6SYHOoC0gHASTT4EwWQ1Zx0O0mgoQ0CyxvDaso4aUN55CAIe/hxVQydna3+SGAym
	wXtPNvjt2K1SI/9ggyhNNidOrk+Yl2TKYa8hxCwxLMlmN87o4xezebgffodiRZmuvHhRNGd7O+kMc
	A+50EeEA96YsOSWXwytSr+uHXrp7y8vovis+V4JQNx6GPuR87+adQHhBchV3p2YzdOaKmWVS9TygH
	98IxvoT5w==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jqzE9-0004dU-LJ; Thu, 02 Jul 2020 13:26:09 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jqzE7-0004b4-NE
 for linux-mediatek@lists.infradead.org; Thu, 02 Jul 2020 13:26:08 +0000
X-UUID: a34c532e5ac3452ead05b53dd9c3333d-20200702
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID;
 bh=eBTJcCYdyu4P7SpqfiES4jVryEeGPF+hpxQ4vbDiblk=; 
 b=ebeCUJByPXUHpVEyQYy6YNtLe5UC86pOz6pMNkJq/j4XRrnf9M0iWf7R6abpywx5l7zn8/f2UwviCTicfXSRGVFDSqzcA+Ig2cXKpDw5R+igxEI+aQxuNQPhwePPcE0yRKuh9bYVYUXXoCEhGQGA04arEngxbkTf2O2CaBgi8Qs=;
X-UUID: a34c532e5ac3452ead05b53dd9c3333d-20200702
Received: from mtkcas68.mediatek.inc [(172.29.94.19)] by mailgw02.mediatek.com
 (envelope-from <frankie.chang@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLS)
 with ESMTP id 1454721436; Thu, 02 Jul 2020 05:25:53 -0800
Received: from mtkmbs08n2.mediatek.inc (172.21.101.56) by
 MTKMBS62N2.mediatek.inc (172.29.193.42) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Thu, 2 Jul 2020 06:25:56 -0700
Received: from mtkcas08.mediatek.inc (172.21.101.126) by
 mtkmbs08n2.mediatek.inc (172.21.101.56) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Thu, 2 Jul 2020 21:25:54 +0800
Received: from [172.21.77.33] (172.21.77.33) by mtkcas08.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Thu, 2 Jul 2020 21:25:56 +0800
Message-ID: <1593696357.5899.3.camel@mtkswgap22>
Subject: Re: [PATCH v5] binder: transaction latency tracking for user build
From: Frankie Chang <Frankie.Chang@mediatek.com>
To: Todd Kjos <tkjos@google.com>, Greg Kroah-Hartman
 <gregkh@linuxfoundation.org>
Date: Thu, 2 Jul 2020 21:25:57 +0800
In-Reply-To: <1591791827-23871-1-git-send-email-Frankie.Chang@mediatek.com>
References: <20200507085544.GB1097552@kroah.com>
 <1591791827-23871-1-git-send-email-Frankie.Chang@mediatek.com>
X-Mailer: Evolution 3.2.3-0ubuntu6 
MIME-Version: 1.0
X-TM-SNTS-SMTP: 3BBB8660D72F636611F30F1FF60E1224D241F7EABAAF37F1121E045B93560BF32000:8
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200702_092607_951635_21185513 
X-CRM114-Status: GOOD (  12.64  )
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
 LKML <linux-kernel@vger.kernel.org>,
 Arve =?ISO-8859-1?Q?Hj=F8nnev=E5g?= <arve@android.com>,
 Jian-Min Liu <Jian-Min.Liu@mediatek.com>, linux-mediatek@lists.infradead.org,
 Joel Fernandes <joel@joelfernandes.org>, Martijn Coenen <maco@android.com>,
 Christian Brauner <christian@brauner.io>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Hi Greg, Todd and all

Gentle remind of this patch set

Thanks.
Frankie

On Wed, 2020-06-10 at 20:23 +0800, Frankie Chang wrote:
> Frankie.Chang (3):
>   binder: move structs from core file to header file
>   binder: add trace at free transaction.
>   binder: add transaction latency tracer
> 
>  drivers/android/Kconfig                 |   8 +
>  drivers/android/Makefile                |   1 +
>  drivers/android/binder.c                | 408 +----------------------
>  drivers/android/binder_internal.h       | 416 ++++++++++++++++++++++++
>  drivers/android/binder_latency_tracer.c | 108 ++++++
>  drivers/android/binder_trace.h          |  49 +++
>  6 files changed, 586 insertions(+), 404 deletions(-)  create mode 100644 drivers/android/binder_latency_tracer.c
> 
> Change from v5:
>   - change config name to the proper one, CONFIG_BINDER_TRANSACTION_LATENCY_TRACKING.
>   - change tracepoint name to more descriptive one, trace_binder_txn_latency_(alloc|info|free)
>   - enhance some lock protection.
> 
> Change from v4:
>   - split up into patch series.
> 
> Change from v3:
>   - use tracepoints for binder_update_info and print_binder_transaction_ext,
>     instead of custom registration functions.
> 
> Change from v2:
>   - create transaction latency module to monitor slow transaction.
> 
> Change from v1:
>   - first patchset.

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
