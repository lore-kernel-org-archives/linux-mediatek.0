Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1B345C43334
	for <linux-mediatek@archiver.kernel.org>; Wed, 29 Jun 2022 09:33:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Content-Type:Date:CC:To:From:Subject:Message-ID:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=ZrRlqcV9q3ObPn6I5hZ4nUuXLUhYveVBZjfVinIuuFo=; b=GLFLred6tqfxHCA6SJ8WRKYMsC
	2SnSQiocMlWsFcJFUOOTZQL7NKozIfvyedmIYHqlyXm4vV2z5dT7Tqrh/ZeY6mPQf+cIQlJ264JnE
	8ap3TIL89tRUHv5Zpi1GK+GjU9EJmNwpgYEACFzRMB9kfF6DmaN0i9SyXVLv/U3AtIXsYRfTftWQh
	ScjKgsg2k2PF4d3UK0zisSTh0SZImlyTSyoT1GGNicP1/sgdWE0a6YPuHuCJ2rDY8emT7Ei7EyG/l
	gKVK16wigaiwbIjieCYgt1noP+rELCXy/yPL9+Lx6RLRgCoM1Y1RFx13f5XaR35S/PBb+Vfs/ayPi
	RGEm/gdA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o6U4n-00AhJ2-Kb; Wed, 29 Jun 2022 09:33:37 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o6U4j-00AhHS-A8
	for linux-mediatek@lists.infradead.org; Wed, 29 Jun 2022 09:33:36 +0000
X-UUID: 32057c6c386e464b9c877b44580b0995-20220629
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Transfer-Encoding:MIME-Version:Content-Type:Date:CC:To:From:Subject:Message-ID; bh=ZrRlqcV9q3ObPn6I5hZ4nUuXLUhYveVBZjfVinIuuFo=;
	b=gwQ60wW9fqf5YNr0gQhO8A/aT4UJ9nyWEDO3k2VvnbsVTTYwGpx3gxb0ORZvJ27ipTwFsHPDXoAXAWppaJLoxP87pN8KhmiVljYcMtF8lzcEJS5JDoyPdpS5EWh9grmg0r0Y+CqH9xTl+eTrHNexlLZPbiunRr6i14zdiZZ66fg=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.1.7,REQID:5773fc93-9891-4f90-bd98-b3ca4afdf5ac,OB:0,LO
	B:0,IP:0,URL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,RULE:Release_Ham,ACTI
	ON:release,TS:0
X-CID-META: VersionHash:87442a2,CLOUDID:6d571686-57f0-47ca-ba27-fe8c57fbf305,C
	OID:IGNORED,Recheck:0,SF:nil,TC:nil,Content:0,EDM:-3,IP:nil,URL:0,File:nil
	,QS:nil,BEC:nil,COL:0
X-UUID: 32057c6c386e464b9c877b44580b0995-20220629
Received: from mtkmbs11n1.mediatek.inc [(172.21.101.185)] by mailgw02.mediatek.com
	(envelope-from <chunfeng.yun@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 252965761; Wed, 29 Jun 2022 02:33:21 -0700
Received: from mtkcas11.mediatek.inc (172.21.101.40) by
 mtkmbs11n2.mediatek.inc (172.21.101.187) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.2.792.3;
 Wed, 29 Jun 2022 17:02:56 +0800
Received: from mhfsdcap04 (10.17.3.154) by mtkcas11.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Wed, 29 Jun 2022 17:02:54 +0800
Message-ID: <cd7169df640fe6dab85f6d94cb8f40c181e08d2b.camel@mediatek.com>
Subject: support USB 3.2 function remote wake
From: Chunfeng Yun <chunfeng.yun@mediatek.com>
To: Felipe Balbi <balbi@kernel.org>
CC: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Alan Stern
	<stern@rowland.harvard.edu>, <linux-usb@vger.kernel.org>,
	<linux-mediatek@lists.infradead.org>
Date: Wed, 29 Jun 2022 17:02:54 +0800
Content-Type: text/plain; charset="UTF-8"
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.2 
MIME-Version: 1.0
X-MTK: N
Content-Transfer-Encoding: base64
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220629_023333_400335_0F4865F7 
X-CRM114-Status: UNSURE (   6.36  )
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
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

SGksDQoNCkkgcGxhbiB0byBzdXBwb3J0IGZ1bmN0aW9uIHJlbW90ZSB3YWtldXAgb24gb3VyIHVz
YjMgZGV2aWNlIGNvbnRyb2xsZXINCmRyaXZlci4NCg0KQSBmdW5jdGlvbiBtYXkgc2lnbmFsIHRo
YXQgaXQgd2FudHMgdG8gZXhpdCBmcm9tIEZ1bmN0aW9uIFN1c3BlbmQgYnkNCnNlbmRpbmcgYSBG
dW5jdGlvbiBXYWtlIE5vdGlmaWNhdGlvbiB0byB0aGUgaG9zdCwgYW5kIHRoZSBub3RpZmljYXRp
b24NCm5lZWQga25vd3MgdGhlIGZpcnN0IGludGVyZmFjZSBudW1iZXIgaW4gdGhpcyBmdW5jdGlv
bi4NCkJ1dCB0aGUgY3VycmVudCBnYWRnZXQgb3BzOg0KICAgIGludCAoKndha2V1cCkoc3RydWN0
IHVzYl9nYWRnZXQgKik7DQpkb2VzIG5vdCBwcm92aWRlIGluZm9ybWF0aW9uIGFib3V0IGludGVy
ZmFjZSBudW1iZXI7DQoNClRoZXJlIHNlZW1zIHRvIGJlIHR3byB3YXlzOg0KMS4gYWRkIGEgbmV3
IHBhcmFtZXRlciBhcyBiZWxvdywNCiAgICBpbnQgKCp3YWtldXApKHN0cnVjdCB1c2JfZ2FkZ2V0
ICosIHU4IGludGYpOw0KMi4gYWRkIGEgbmV3IG9wcywgc3VjaCBhcywNCiAgICBpbnQgKCpmdW5j
dGlvbl93YWtldXApKHN0cnVjdCB1c2JfZ2FkZ2V0ICosIHU4IGludGYpOw0KDQpEbyB5b3UgaGF2
ZSBhbnkgc3VnZ2VzdGlvbnM/DQoNClRoYW5rcyBhIGxvdA0K


