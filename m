Return-Path: <SRS0=mu4u=HG=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D246CC433DB
	for <linux-mediatek@archiver.kernel.org>; Thu,  4 Feb 2021 12:57:12 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5FEF364F3F
	for <linux-mediatek@archiver.kernel.org>; Thu,  4 Feb 2021 12:57:10 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 5FEF364F3F
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=holtmann.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:References:Message-Id:Date:In-Reply-To:From:
	Subject:Mime-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=KMUStH/gYP306t8AYJk9/i3ywRD+auvzfi498EPZYFc=; b=wp9tl1sxqMXN/pufFLOVSsaM/
	JNgi+S3U768OM8rXMVgsqneh44iL5f2bMEiGASeoQeL2fu/1AMHeq/YnJxNKfLTjEP+lUF2HM5/Bt
	egHdD/7QJ2Ih+TwyU7jhUYqCYmBrPkaE7SDeT/o8epk9co5GrpArM9w7f7SXwUcFd03duNfwKiuJa
	dTxnXZERMkGX7hzCTpXnlMvS9yUb5aUfJbqyleXv+4sogiHW3XAMAfxYOoNuks1dTrHapdpQN9p+6
	IRZP5EQzn5hduR5A+68f+HWIf6W+RiornThPXcN4DcloXwqKT3PfA6R9EGICKMFXZ64lDzlLS2TF7
	MZeYjdiOQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1l7eBt-0003GO-4Q; Thu, 04 Feb 2021 12:56:57 +0000
Received: from coyote.holtmann.net ([212.227.132.17] helo=mail.holtmann.org)
 by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
 id 1l7eBo-0003Eu-1V; Thu, 04 Feb 2021 12:56:53 +0000
Received: from marcel-macbook.holtmann.net (p4fefcdd8.dip0.t-ipconnect.de
 [79.239.205.216])
 by mail.holtmann.org (Postfix) with ESMTPSA id 5204ECED16;
 Thu,  4 Feb 2021 14:04:13 +0100 (CET)
Mime-Version: 1.0 (Mac OS X Mail 14.0 \(3654.40.0.2.32\))
Subject: Re: [PATCH] Bluetooth: btusb: remove set but not used variable in
 btusb_mtk_setup_firmware_79xx
From: Marcel Holtmann <marcel@holtmann.org>
In-Reply-To: <20210204011856.3685334-1-yebin10@huawei.com>
Date: Thu, 4 Feb 2021 13:56:45 +0100
Message-Id: <CDB7E085-EE43-4AC7-838E-DA2BA56ED70C@holtmann.org>
References: <20210204011856.3685334-1-yebin10@huawei.com>
To: Ye Bin <yebin10@huawei.com>
X-Mailer: Apple Mail (2.3654.40.0.2.32)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210204_075652_192671_8445E792 
X-CRM114-Status: UNSURE (   8.15  )
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
Cc: Johan Hedberg <johan.hedberg@gmail.com>, Hulk Robot <hulkci@huawei.com>,
 LKML <linux-kernel@vger.kernel.org>,
 Bluetooth Kernel Mailing List <linux-bluetooth@vger.kernel.org>,
 linux-mediatek@lists.infradead.org,
 Luiz Augusto von Dentz <luiz.dentz@gmail.com>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

SGkgWWUsCgo+IEZpeCBmb2xsb3cgd2FybmluZzoKPiBkcml2ZXJzL2JsdWV0b290aC9idHVzYi5j
OjM0Nzk6OTogd2FybmluZzogdmFyaWFibGUg4oCYZndfc2l6ZeKAmSBzZXQgYnV0IG5vdCB1c2Vk
IFstV3VudXNlZC1idXQtc2V0LXZhcmlhYmxlXQo+ICBzaXplX3QgZndfc2l6ZTsKPiAgICAgICAg
IF5+fn5+fn4KPiBkcml2ZXJzL2JsdWV0b290aC9idHVzYi5jOjM0NzM6Mjk6IHdhcm5pbmc6IHZh
cmlhYmxlIOKAmHBhdGNoaGRy4oCZIHNldCBidXQgbm90IHVzZWQgWy1XdW51c2VkLWJ1dC1zZXQt
dmFyaWFibGVdCj4gIHN0cnVjdCBidG10a19wYXRjaF9oZWFkZXIgKnBhdGNoaGRyID0gTlVMTDsK
PiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgXn5+fn5+fn4KPiAKPiBSZXBvcnRlZC1ieTog
SHVsayBSb2JvdCA8aHVsa2NpQGh1YXdlaS5jb20+Cj4gU2lnbmVkLW9mZi1ieTogWWUgQmluIDx5
ZWJpbjEwQGh1YXdlaS5jb20+Cj4gLS0tCj4gZHJpdmVycy9ibHVldG9vdGgvYnR1c2IuYyB8IDQg
LS0tLQo+IDEgZmlsZSBjaGFuZ2VkLCA0IGRlbGV0aW9ucygtKQoKcGF0Y2ggaGFzIGJlZW4gYXBw
bGllZCB0byBibHVldG9vdGgtbmV4dCB0cmVlLgoKUmVnYXJkcwoKTWFyY2VsCgoKX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXgtbWVkaWF0ZWsgbWFp
bGluZyBsaXN0CkxpbnV4LW1lZGlhdGVrQGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3Rz
LmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1tZWRpYXRlawo=
