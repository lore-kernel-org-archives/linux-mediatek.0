Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1947DC433FE
	for <linux-mediatek@archiver.kernel.org>; Fri, 17 Dec 2021 15:47:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=e6U5mv87114xw5fCRUf9B/IRyGgj5PVGv4zKINPko0g=; b=Pp0gTdMAjO/bnw
	l1Esx7ZFz3JyYIWDMml2ZrnMxCeZ1Nrol+c2hVsLiwVBkWmPsKtFBmVKagGqslFGEFnrYLuzdVxpv
	oM5wdYuIwI9/iFU1Gf+XOKaK/N8D8UD1UYX0zCLBrgVfBnh4zfuXbXEmh59xh9KtaRPQ6RRCL9Vfh
	UqDn15ZhUgehQ+Ysf2ITTQwt2GOmdRczyuGW1TCIT1KFFrZvww4MtcaY02lNCTvTBBD81ALtsLGXk
	CPdAN892MX21dASGFj3OS8VCXIVo9lbsMirhkx+S6p3CT6897ZLCdsGQ3f381ftm3zqjQGOWedEcA
	/YSNe38qA+16fCd3eYoA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1myFSU-00Axif-AX; Fri, 17 Dec 2021 15:47:46 +0000
Received: from bhuna.collabora.co.uk ([46.235.227.227])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1myFQs-00Awul-Nh; Fri, 17 Dec 2021 15:46:08 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (Authenticated sender: nfraprado) with ESMTPSA id A9E8D1F470D2
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=collabora.com; s=mail;
 t=1639755963; bh=g8FzHrZONn+sq9yOxyyO15ASj7LcA+jTCZr3Ns4ferM=;
 h=From:To:Cc:Subject:Date:From;
 b=nlMI2xDSeiHBllF1vsZmXyGv5d2IAsLBYIPL0wQQWGfBPsd2HROAFZ+xUNU5Wxp1E
 mn3cSZQ47JnpIRrBD4O/x7kLbF/5mFfgEa7Z/7OQosw15fm5hpnYy8jGOq97az7oqO
 v1cFNmah41dGEaqrn/5dXt9bVZ6uwLvVAAnYh43ZqfzXP3YQo4lg2Vrh0RYKDeVvI5
 lxcHMKydJVUHHT4RWaafnfr1/0CZds3/h/AV2FGZJPfv4BbIOXVNrjXQxCAFZSc4QT
 z3OeqGv8P/N63tsZFyoxle0yesiS1xyE08UIqfM4cYYf0RG6cFflvcM9t9Pc4MpN6q
 nbnwqcrp/gw9w==
From: =?UTF-8?q?N=C3=ADcolas=20F=2E=20R=2E=20A=2E=20Prado?=
 <nfraprado@collabora.com>
To: matthias.bgg@gmail.com
Cc: linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 linux-kernel@vger.kernel.org, kernel@collabora.com,
 =?UTF-8?q?N=C3=ADcolas=20F=2E=20R=2E=20A=2E=20Prado?=
 <nfraprado@collabora.com>
Subject: [PATCH] arm64: defconfig: Enable cpufreq for MediaTek
Date: Fri, 17 Dec 2021 10:44:52 -0500
Message-Id: <20211217154452.868419-1-nfraprado@collabora.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211217_074606_968964_0C51D1D5 
X-CRM114-Status: UNSURE (   7.28  )
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

VGhlIE1lZGlhVGVrIENQVUZyZXEgZHJpdmVyIHByb3ZpZGVzIGNvbnRyb2wgb2YgQ1BVIGZyZXF1
ZW5jeS92b2x0YWdlCm9uIE1lZGlhVGVrIFNvQ3MuIFNpbmNlIHRoZXJlJ3Mgbm8gZGV2aWNlLXRy
ZWUgbm9kZSB0byBiaW5kIGl0IHRvLCB0aGUKZHJpdmVyIG5lZWRzIHRvIGJlIGVuYWJsZWQgYnVp
bHQtaW4uIEVuYWJsZSBpdCBzby4KClNpZ25lZC1vZmYtYnk6IE7DrWNvbGFzIEYuIFIuIEEuIFBy
YWRvIDxuZnJhcHJhZG9AY29sbGFib3JhLmNvbT4KLS0tCiBhcmNoL2FybTY0L2NvbmZpZ3MvZGVm
Y29uZmlnIHwgMSArCiAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKykKCmRpZmYgLS1naXQg
YS9hcmNoL2FybTY0L2NvbmZpZ3MvZGVmY29uZmlnIGIvYXJjaC9hcm02NC9jb25maWdzL2RlZmNv
bmZpZwppbmRleCBmMmUyYjliZGQ3MDIuLjgyOWU4YmMwNDVmNyAxMDA2NDQKLS0tIGEvYXJjaC9h
cm02NC9jb25maWdzL2RlZmNvbmZpZworKysgYi9hcmNoL2FybTY0L2NvbmZpZ3MvZGVmY29uZmln
CkBAIC05Niw2ICs5Niw3IEBAIENPTkZJR19BUk1fUUNPTV9DUFVGUkVRX0hXPXkKIENPTkZJR19B
Uk1fUkFTUEJFUlJZUElfQ1BVRlJFUT1tCiBDT05GSUdfQVJNX1NDTUlfQ1BVRlJFUT15CiBDT05G
SUdfQVJNX1RFR1JBMTg2X0NQVUZSRVE9eQorQ09ORklHX0FSTV9NRURJQVRFS19DUFVGUkVRPXkK
IENPTkZJR19RT1JJUV9DUFVGUkVRPXkKIENPTkZJR19BUk1fU0NNSV9QUk9UT0NPTD15CiBDT05G
SUdfQVJNX1NDUElfUFJPVE9DT0w9eQotLSAKMi4zNC4xCgoKX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXgtbWVkaWF0ZWsgbWFpbGluZyBsaXN0Ckxp
bnV4LW1lZGlhdGVrQGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5v
cmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1tZWRpYXRlawo=
