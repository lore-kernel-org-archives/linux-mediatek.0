Return-Path: <SRS0=fhAu=QD=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 95693C433EF
	for <linux-mediatek@archiver.kernel.org>; Tue, 16 Nov 2021 08:52:14 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 59D2D63214
	for <linux-mediatek@archiver.kernel.org>; Tue, 16 Nov 2021 08:52:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 59D2D63214
Authentication-Results: mail.kernel.org; dmarc=fail (p=reject dis=none) header.from=bizjoindeal.pl
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Subject:To:From:Date:
	Message-ID:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From
	:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=4Vc3/FVBZvobCTo/QMWWINQZNfr8CyVRDs+foeaH210=; b=RBr3C0AdaJjwCx
	LxgXMH805AuC5GApaJt/gSPEakBXNiqM/bMaJKuqFETbJn41vY/oVXXETqo5ZqWgHfi+pj1YDIYN6
	LiF/iczGzIuUVU9V5j+gOQW1caZ5T75j6PcVXl/K2VDxT8O/xl5FlVq0fBkwhxsUdP5v18v58aDHk
	asgGhIxyswtPUFeDPn16WHZLsOLki9wB/dYkjK+39kbVoHIJfl+dxllGnZTA+GNxgt/wkbpkfu7g+
	elYvVZllcv6rDqtF0taQyQ+Ku1K5c6o4/vQye0iqJWEZINnEFLaK98gXaTIwCHAgQ9Y0w7ZufJxdj
	XuVp5x9Hmj20D2+NYiNQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mmuCF-000oHM-5B; Tue, 16 Nov 2021 08:52:07 +0000
Received: from mail.bizjoindeal.pl ([80.211.97.164])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mmuBx-000oAg-14
 for linux-mediatek@lists.infradead.org; Tue, 16 Nov 2021 08:51:50 +0000
Received: by mail.bizjoindeal.pl (Postfix, from userid 1001)
 id A1C0DA25C8; Tue, 16 Nov 2021 08:51:27 +0000 (GMT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=bizjoindeal.pl;
 s=mail; t=1637052707;
 bh=JZuQ1fK7zFtz2oeUB7Xfid9vb7kUywdmDd2OluR8ywA=;
 h=Date:From:To:Subject:From;
 b=ciTmjkPDRsvWErH2ZJstTCqu7IVs7WjWbFacJeOvlG0ZSNatn1I3jvajB2Y0TXpA7
 1qdX4fUWeH+umr8GP1mX5hC34nk+kdKEi9MVDgBrNz6sAiB9UO4/AlihIbAd9lf4QG
 tYQTqU5drgDNRgMK59R2a6iDBm+MmE600KbSik6abp09A20Pw8WkrVL1A7+zqHhPGU
 ou8bOqlgxu8qRhrYIcngNRpN33J39jN9YfCiQhCZyp9if771qapQEmUQhU5UTs3zrj
 nZVvF7znnZk9SQptYmsg3PMoIZ7tbqSVMlc7VIcCqWVRgcegjb8E5Bd2g80Ut6EG0c
 hL0PP1aRm8R7A==
Received: by mail.bizjoindeal.pl for <linux-mediatek@lists.infradead.org>;
 Tue, 16 Nov 2021 08:51:12 GMT
Message-ID: <20211116074500-0.1.60.f0wv.0.qslyikj140@bizjoindeal.pl>
Date: Tue, 16 Nov 2021 08:51:12 GMT
From: "Dorian Kwiatkowski" <dorian.kwiatkowski@bizjoindeal.pl>
To: <linux-mediatek@lists.infradead.org>
Subject: Fotowoltaika dla firm
X-Mailer: mail.bizjoindeal.pl
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211116_005149_232194_707102EC 
X-CRM114-Status: UNSURE (   1.58  )
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

RHppZcWEIGRvYnJ5LAoKa29udGFrdHVqxJkgc2nEmSB6IFBhxYRzdHdlbSwgcG9uaWV3YcW8IGRv
c3RyemVnYW0gbW/FvGxpd2/Fm8SHIHJlZHVrY2ppIG9wxYJhdCB6YSBwcsSFZC4KCk9kcG93aWVk
bmlvIGRvYnJhbmEgaW5zdGFsYWNqYSBmb3Rvd29sdGFpY3puYSB0byByb3p3acSFemFuaWUsIGt0
w7NyZSBwb3p3YWxhIHd5Z2VuZXJvd2HEhyBzcG9yZSBvc3pjesSZZG5vxZtjaSB3IHNrYWxpIHJv
a3UuCgpDaGNpYcWCYnltIHBvcm96bWF3aWHEhyB6IFBhxYRzdHdlbSBvIHRlZ28gdHlwdSByb3p3
acSFemFuaXUsIGEgdGFrxbxlIHByemVkc3Rhd2nEhyB3c3TEmXBuZSBrYWxrdWxhY2plLgoKQ3p5
IHPEhSBQYcWEc3R3byB6YWludGVyZXNvd2FuaT8KClBvemRyYXdpYW0sCkRvcmlhbiBLd2lhdGtv
d3NraQoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGlu
dXgtbWVkaWF0ZWsgbWFpbGluZyBsaXN0CkxpbnV4LW1lZGlhdGVrQGxpc3RzLmluZnJhZGVhZC5v
cmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1tZWRp
YXRlawo=
