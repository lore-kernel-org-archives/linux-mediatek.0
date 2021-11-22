Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2646EC433EF
	for <linux-mediatek@archiver.kernel.org>; Mon, 22 Nov 2021 12:51:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:CC
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=xQuXkRt/BoyRaRxhDqH80TNdPtDOPem6+zCRf8nlU1I=; b=OHwWrXzyQqCTnX
	mF0d0Ap9Ycgymsgp6hL8dqnk6l+omcGfBqJ0/ayttiWf1pQPQ/sJMDSh+SWbDMu44IbX6zSRkJuad
	wRrnMmRxd5KL3mldN5UZJJDEaj7cO3d/R9yR/V/5ViBKUvNM8FS1KLCuK6ACtWiP0tValnxv3U/0S
	gyQuwKCP/DSV6fSVr56ev9ku8navAnJgnT4u7WXWVmeXkhBNxJF+YeVhkuxsSCAxINQBU0Otpa6bE
	cBS0Zi/dbcmmmuoR5JWeiQGruhGq5U/KTsnKeB03mW+72xbNFiH0nWQaswXU0IKma0eMlobB2H8+u
	sBbMJbxM42Ta2lZMRQHQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mp8nH-00GTze-3M; Mon, 22 Nov 2021 12:51:35 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mp8em-00GQVF-1q; Mon, 22 Nov 2021 12:42:49 +0000
X-UUID: 3262bab2e8df487f91196c6b9e0b64c4-20211122
X-UUID: 3262bab2e8df487f91196c6b9e0b64c4-20211122
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw02.mediatek.com
 (envelope-from <sam.shih@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-SHA384 256/256)
 with ESMTP id 1206234206; Mon, 22 Nov 2021 05:42:42 -0700
Received: from mtkmbs10n2.mediatek.inc (172.21.101.183) by
 MTKMBS62N1.mediatek.inc (172.29.193.41) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Mon, 22 Nov 2021 04:35:58 -0800
Received: from mtkcas11.mediatek.inc (172.21.101.40) by
 mtkmbs10n2.mediatek.inc (172.21.101.183) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.2.792.3; 
 Mon, 22 Nov 2021 20:35:57 +0800
Received: from mtksdccf07.mediatek.inc (172.21.84.99) by mtkcas11.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via
 Frontend Transport; Mon, 22 Nov 2021 20:35:57 +0800
From: Sam Shih <sam.shih@mediatek.com>
To: Matthias Brugger <matthias.bgg@gmail.com>, Rob Herring
 <robh+dt@kernel.org>, <linux-arm-kernel@lists.infradead.org>,
 <linux-mediatek@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
 <devicetree@vger.kernel.org>
CC: John Crispin <john@phrozen.org>, Ryder Lee <Ryder.Lee@mediatek.com>, "Sam
 Shih" <sam.shih@mediatek.com>
Subject: [PATCH v10 0/2] Mediatek MT7986 pinctrl support
Date: Mon, 22 Nov 2021 20:35:50 +0800
Message-ID: <20211122123552.8218-1-sam.shih@mediatek.com>
X-Mailer: git-send-email 2.18.0
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211122_044248_169996_CA8B190F 
X-CRM114-Status: GOOD (  11.73  )
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

VGhpcyBwYXRjaCBzZXJpZXMgYWRkIHBpbmN0cmwgc3VwcG9ydCBmb3IgbWVkaWF0ZWsgbXQ3OTg2
IFNvQyBzZXJpZXMuCkl0IGlzIGJhc2VkIG9uIHBhdGNoIHNlcmllcyAiQWRkIGJhc2ljIFNvQyBz
dXBwb3J0IGZvciBtZWRpYXRlayBtdDc5ODYiCmh0dHBzOi8vbG9yZS5rZXJuZWwub3JnL2FsbC8y
MDIxMTEyMjEyMzIyMi44MDE2LTEtc2FtLnNoaWhAbWVkaWF0ZWsuY29tLwoKVGhpcyBwYXRjaCBz
ZXJpZXMgYmFzZSBvbiB0aGUgZm9sbG93aW5nIHBhdGNoZXMKaHR0cHM6Ly9sb3JlLmtlcm5lbC5v
cmcvYWxsLzIwMjExMDIyMTI0MDM2LjUyOTEtMi1zYW0uc2hpaEBtZWRpYXRlay5jb20vCmh0dHBz
Oi8vbG9yZS5rZXJuZWwub3JnL2FsbC8yMDIxMTAyMjEyNDAzNi41MjkxLTMtc2FtLnNoaWhAbWVk
aWF0ZWsuY29tLwp0aGF0IGhhdmUgYmVlbiBhcHBsaWVkIHRvIHRoZSBwaW4gY29udHJvbCB0cmVl
CgotLS0KdjEwOiB1c2VkIG10Nzk4NmIuZHRzaSB0byBpbmNsdWRlIG10Nzk4NmEuZHRzaSB0byBy
ZWR1Y2UgZHVwbGljYXRlIGR0cyBub2Rlcwp2OTogYWRkZWQgQWNrZWQtYnkgYW5kIFJldmlld2Vk
LWJ5IHRhZwp2ODogZml4ZWQgdWFydCBub2RlIGluIHlhbWwgZHRzIGV4YW1wbGUKdjc6IHNlcGFy
YXRlIHBpbmN0cmwgcGFydCBpbnRvIGEgc2luZ2xlIHBhdGNoIHNlcmllcwoKQWNjb3JkaW5nIHRv
IHRoZSBtYWludGFpbmVy4oCZcyBzdWdnZXN0aW9uLCB0aGlzIHBhdGNoIHNwbGl0cyB0aGUgcHJl
dmlvdXMKdGhyZWFkIGludG8gaW5kZXBlbmRlbnQgcGF0Y2ggc2VyaWVzLgpUaGlzIHBhdGNoIGlu
Y2x1ZGUgY2xvY2sgZHJpdmVyIGFuZCBkZXZpY2UgdHJlZSB1cGRhdGUKCk9yaWdpbmFsIHRocmVh
ZDoKaHR0cHM6Ly9sb3JlLmtlcm5lbC5vcmcvYWxsLzIwMjEwOTE0MDg1MTM3LjMxNzYxLTEtc2Ft
LnNoaWhAbWVkaWF0ZWsuY29tLwotLS0KClNhbSBTaGloICgyKToKICBhcm02NDogZHRzOiBtZWRp
YXRlazogYWRkIHBpbmN0cmwgc3VwcG9ydCBmb3IgbXQ3OTg2YQogIGFybTY0OiBkdHM6IG1lZGlh
dGVrOiBhZGQgcGluY3RybCBzdXBwb3J0IGZvciBtdDc5ODZiCgogYXJjaC9hcm02NC9ib290L2R0
cy9tZWRpYXRlay9NYWtlZmlsZSAgICAgICAgfCAgMSArCiBhcmNoL2FybTY0L2Jvb3QvZHRzL21l
ZGlhdGVrL210Nzk4NmEtcmZiLmR0cyB8IDIwICsrKysrKysrKysrKysrCiBhcmNoL2FybTY0L2Jv
b3QvZHRzL21lZGlhdGVrL210Nzk4NmEuZHRzaSAgICB8IDIxICsrKysrKysrKysrKysrCiBhcmNo
L2FybTY0L2Jvb3QvZHRzL21lZGlhdGVrL210Nzk4NmItcmZiLmR0cyB8IDI5ICsrKysrKysrKysr
KysrKysrKysrCiBhcmNoL2FybTY0L2Jvb3QvZHRzL21lZGlhdGVrL210Nzk4NmIuZHRzaSAgICB8
IDEyICsrKysrKysrCiA1IGZpbGVzIGNoYW5nZWQsIDgzIGluc2VydGlvbnMoKykKIGNyZWF0ZSBt
b2RlIDEwMDY0NCBhcmNoL2FybTY0L2Jvb3QvZHRzL21lZGlhdGVrL210Nzk4NmItcmZiLmR0cwog
Y3JlYXRlIG1vZGUgMTAwNjQ0IGFyY2gvYXJtNjQvYm9vdC9kdHMvbWVkaWF0ZWsvbXQ3OTg2Yi5k
dHNpCgotLSAKMi4yOS4yCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX18KTGludXgtbWVkaWF0ZWsgbWFpbGluZyBsaXN0CkxpbnV4LW1lZGlhdGVrQGxpc3Rz
LmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5m
by9saW51eC1tZWRpYXRlawo=
