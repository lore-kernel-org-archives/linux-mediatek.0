Return-Path: <SRS0=gkfg=6L=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: **
X-Spam-Status: No, score=2.5 required=3.0 tests=DEAR_SOMETHING,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_REPLYTO_END_DIGIT,
	HEADER_FROM_DIFFERENT_DOMAINS,HK_NAME_MR_MRS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8019DC4CECC
	for <linux-mediatek@archiver.kernel.org>; Mon, 27 Apr 2020 18:58:36 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5AE33205C9
	for <linux-mediatek@archiver.kernel.org>; Mon, 27 Apr 2020 18:58:36 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="VQefR1CZ"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 5AE33205C9
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=ttx-group.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Message-ID:Sender:
	Content-Transfer-Encoding:Content-Type:Reply-To:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Date:From:To:Subject:
	Content-Description:MIME-Version:Cc:Content-ID:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=euFUf6f2QK0GsxfDXtiBxHvWEf2L8OuQtEIfQKvh3k0=; b=VQefR1CZ4tVIGH
	xIRsAPwb/VI+zP5kdGIwC9eN2Ggwp36P6pmmAskIEc47Uewry+SOl8ZqX4lZmkQeetL+iZET+N6Uu
	Mk6aqdFEMvp273Uw8LetT7nmdvuJVCt7MMBhBqhfBmSs8RHQv5f9dD1CwtUw4UkMuCc4jsKr0eZ0f
	tVkf0M3o+i8bU7VmY5MrZFFvl9AZJpddsKzRacQf1SnGXyqvOtwRmi2TW+dyg+/UrH2rYFQzOv+bh
	oGKJxsR2UXj1t3qnmMlMQoRfgbXZMGNarLkeNHihSI0Dvz3nw/9PZfGfo9FcROXdtLtBtVKzk3Wt2
	wbg0SKELpGPmvTd07Vxw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jT8xY-0000a7-IJ; Mon, 27 Apr 2020 18:58:28 +0000
Received: from mail.ttx-group.com ([182.160.106.194] helo=ttx-group.com)
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jT8xL-0000OB-Mq
 for linux-mediatek@lists.infradead.org; Mon, 27 Apr 2020 18:58:17 +0000
Received: (qmail 24736 invoked by uid 1008); 27 Apr 2020 05:19:56 +0600
Received: from unknown (HELO ?204.10.162.134?)
 (masud.m@ttx-group.com@204.10.162.134)
 by ttx-group.com with SMTP; 27 Apr 2020 05:19:56 +0600
MIME-Version: 1.0
Content-Description: Mail message body
Subject: Product Inquiry
To: linux-mediatek@lists.infradead.org
From: "Mr. Okrapah Adjei" <masud.m@ttx-group.com>
Date: Sun, 26 Apr 2020 16:17:33 -0700
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200427_115816_064316_F763F135 
X-CRM114-Status: UNSURE (  -4.24  )
X-CRM114-Notice: Please train this message.
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
Reply-To: okrapahadjei233@gmail.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Message-ID: <E1jT8xY-0000a7-IJ@bombadil.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Dear Sir,

We got your company information through an exhaustive search.

Our scope is basically to search for foreign companies to bid for contract supply on commission basis.

We are interested in buying your products in a larger quantity if only you can supply and open for business.

Best Regard,
Mr. Okrapah Adjei
CEO
OK-Adjei Sourcing Ltd
Accra,Ghana

_______________________________________________
Linux-mediatek mailing list
Linux-mediatek@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-mediatek
