Return-Path: <SRS0=QnWu=IY=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0BD04C433DB
	for <linux-mediatek@archiver.kernel.org>; Fri, 26 Mar 2021 15:51:42 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id AE13761A28
	for <linux-mediatek@archiver.kernel.org>; Fri, 26 Mar 2021 15:51:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org AE13761A28
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=arm.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=tUZZAqZRLWZV+AzSnaR80dNKlQHxRm2WYxV8jtpGhGo=; b=osZTdYti2rpn3o1hXoBAu9LMK
	yPKGM7lJXpLhACZo5ylEt7YE+WfcKYA+ZXX+6aOGrC6bjzYniajeJz2vyx8zu7/63rmWmSOf4kcyK
	lcWtrKk2neJnxJvv1mP+7e+BpkRNg1oDsm+oXieY7QL59/6hyIcauhGEYmCXOKkd0cfgEdcc3HC6H
	zP8q1ns+8N3EHGEYiZRYl7uIQzY/SJHhcEcFZpijYRwae3p6ACe2eCfGKI/FUwb9g26X8OP1kt+l7
	KO7OzBOLzZarTFZ4Z8g/HqqhJuNFMpA1vttwI9OMr7W7uzP8vnKiFxai8whyRwVDtbuAAknam1wFG
	Q5WJSFCPA==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lPokF-003uzy-Ky; Fri, 26 Mar 2021 15:51:31 +0000
Received: from foss.arm.com ([217.140.110.172])
 by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
 id 1lPokB-003uz9-SF
 for linux-mediatek@lists.infradead.org; Fri, 26 Mar 2021 15:51:30 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 01D321474;
 Fri, 26 Mar 2021 08:51:23 -0700 (PDT)
Received: from e121166-lin.cambridge.arm.com (e121166-lin.cambridge.arm.com
 [10.1.196.255])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 34E243F792;
 Fri, 26 Mar 2021 08:51:22 -0700 (PDT)
Date: Fri, 26 Mar 2021 15:51:12 +0000
From: Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>
To: Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kw@linux.com>
Cc: Ryder Lee <ryder.lee@mediatek.com>, Bjorn Helgaas <helgaas@kernel.org>,
 linux-pci@vger.kernel.org, linux-mediatek@lists.infradead.org
Subject: Re: [PATCH v3] PCI: mediatek: Configure FC and FTS for functions
 other than 0
Message-ID: <20210326155104.GA8190@e121166-lin.cambridge.arm.com>
References: <c529dbfc066f4bda9b87edbdbf771f207e69b84e.1604510053.git.ryder.lee@mediatek.com>
 <YDK0fr/UiKjit+ty@rocinante>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <YDK0fr/UiKjit+ty@rocinante>
User-Agent: Mutt/1.9.4 (2018-02-28)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210326_155128_058792_3DE083CA 
X-CRM114-Status: UNSURE (   9.63  )
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

T24gU3VuLCBGZWIgMjEsIDIwMjEgYXQgMDg6Mjk6MDJQTSArMDEwMCwgS3J6eXN6dG9mIFdpbGN6
ecWEc2tpIHdyb3RlOgo+IFsrY2MgTG9yZW56byBmb3IgdmlzaWJsaXR5XQo+IAo+IEhpLAo+IAo+
IFRoYW5rIHlvdSBmb3IgdGFraW5nIGNhcmUgb2YgdGhpcyEKPiAKPiBbLi4uXQo+ID4gUENJX0ZV
TkMocG9ydC0+c2xvdCA8PCAzKSIgaXMgYWx3YXlzIDAsIHNvIHByZXZpb3VzbHkKPiA+IG10a19w
Y2llX3N0YXJ0dXBfcG9ydCgpIG9ubHkgY29uZmlndXJlZCBGQyBjcmVkaXRzIGFuZCBGVHMgZm9y
Cj4gPiBmdW5jdGlvbiAwLgo+IFsuLi5dCj4gCj4gQSBzbWFsbCBuaXQuICBUaGUgY29tbWl0IG1l
c3NhZ2UgaXMgbWlzc2luZyB0aGUgb3BlbmluZyBxdW90ZSwgc2VlCj4gQmpvcm4ncyBzdWdnZXN0
aW9uOgo+IAo+ICAgaHR0cHM6Ly9sb3JlLmtlcm5lbC5vcmcvbGludXgtcGNpLzIwMjAxMTA0MTMx
MDU0LkdBMzA3OTg0QGJqb3JuLVByZWNpc2lvbi01NTIwLwo+IAo+IEJ1dCwgaXQncyBwcm9iYWJs
eSBub3Qgd29ydGggc2VuZGluZyBhbm90aGVyIHBhdGNoLCBhbmQgcGVyaGFwcyBlaXRoZXIKPiBC
am9ybiBvciBMb3JlbnpvIGNvdWxkIGZpeCB0aGlzIHdoZW4gYXBwbHlpbmcgY2hhbmdlcy4KPiAK
PiBSZXZpZXdlZC1ieTogS3J6eXN6dG9mIFdpbGN6ecWEc2tpIDxrd0BsaW51eC5jb20+CgpUaGFu
a3MsIEkgd2lsbCBkby4gQ2FuIEkgYXBwbHkgaXQgb3IgdGhlcmUgYXJlIHN0aWxsIHBlbmRpbmcg
cmV2aWV3CmNvbW1lbnRzIHRvIGFkZHJlc3MgPwoKTG9yZW56bwoKX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXgtbWVkaWF0ZWsgbWFpbGluZyBsaXN0
CkxpbnV4LW1lZGlhdGVrQGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVh
ZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1tZWRpYXRlawo=
