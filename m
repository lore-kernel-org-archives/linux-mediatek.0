Return-Path: <SRS0=K1YL=GT=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1B110C433E0
	for <linux-mediatek@archiver.kernel.org>; Sat, 16 Jan 2021 01:34:55 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id AD8CE23370
	for <linux-mediatek@archiver.kernel.org>; Sat, 16 Jan 2021 01:34:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org AD8CE23370
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmx.net
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=r8YJmv2rSSh0/Vcs79fSRbtexqdcbrYohx2a9XktghQ=; b=bOIWedkRn7yCyzvvfKSDWoNTzF
	6F2FNX6PQuT/c797nctez0qtZNcHxJDs5Wy5iNOcRI7ETIMp39AkBsyVK9p7yAoF0O2m5/2cSQcX+
	WhaLi7iqXhhctlK+E1z8RgFkfFFMj9eeWlEJa3ffjk74H7bxoLoAdyzbyOlok/krl/HvP0IHWJq90
	HC70wp2WjpCy4Jm71JN6zhIhWInlTG8ojujUP0PNMHAYUdTqVYvEmD5wzu0go5Fd7GVmYFUyRb+3E
	UgAhnbp2EdBy5XmsHj4FZGg6HWEL2rDHY325lnCYWe1adyZOR+3jEkAHq6uk+058ugKqGhrS+20RB
	zCvgtcQg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1l0aUB-0003RQ-Ca; Sat, 16 Jan 2021 01:34:39 +0000
Received: from mout.gmx.net ([212.227.17.21])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1l0aU8-0003QO-DR; Sat, 16 Jan 2021 01:34:37 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
 s=badeba3b8450; t=1610760854;
 bh=DQQZnUMbUtwZPh7yTU29MprFxwRzkiuslGETPcaqJo8=;
 h=X-UI-Sender-Class:From:To:Cc:Subject:Date;
 b=cog9hvUmq55W6byV1TS48av1bEZ7PXysxyCGgKApmcCYynqhCO2lQn+h+AiGRA94t
 OgFJF5T/QNSzaxG0TCp9IELKiKgIHidDZDYj4TI+sSO2r45QpCqrFoVM+uCAX92MlI
 QQK0T1mGyDe8XSmyupOPDj5Zc6wq9neOT53Ctsk0=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from longitude ([37.201.215.209]) by mail.gmx.com (mrgmx104
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1N0X8u-1lwyQ61BB6-00wRfe; Sat, 16
 Jan 2021 02:34:14 +0100
From: =?UTF-8?q?Jonathan=20Neusch=C3=A4fer?= <j.neuschaefer@gmx.net>
To: devicetree@vger.kernel.org
Subject: [PATCH] ASoC: dt-bindings: mt8192-mt6359: Fix indentation
Date: Sat, 16 Jan 2021 02:34:03 +0100
Message-Id: <20210116013403.3490518-1-j.neuschaefer@gmx.net>
X-Mailer: git-send-email 2.29.2
MIME-Version: 1.0
X-Provags-ID: V03:K1:Pw6fFpTH4JgulBV4NAW8Xpyamk7kKZTHxe+JZ4cc993vURc1kCj
 7EySxi7Gz78sAu5+8TKulKiDoT2+ooilj9mV/eUYqsZNVDTaK24TueQik0HEwxhLaiYO4bk
 6n97hGj7Ss3y2IbPuuhsoi+0Y7OHlbRAyMvn1FGGtfqknwAbxeDQFeYqVdcaCOMfFkAxczn
 RCvSujcPzFrr4RsfqbLEg==
X-UI-Out-Filterresults: notjunk:1;V03:K0:IPBpfBkRmAk=:zl2DPbIfK5owXrw1MFdPo9
 jw90m3gH6cgXufM313n574GMBIwSMGynz3n+S/ZuZrze3DN9v/dcqv2O14pJ8o3VACuorRSKk
 V9u8sgGEE+cLqabZrDM5mkn73R7Vdh6NyuNfCkglJHBsI92A4gifOTCDmqV1AlsaMm0zn/p2e
 rIC+ddHeq4x73wQxbeEkyvjI0YTb+9ffoJbfKaKxSWcRZNdfOlPD+L4ytL/w7bTJR7KTiQJot
 V4wglot2Gu/IHfIREXDDg4+RgrpmhpAX47LOmpHgBH/avkJeVUp8XKHdyFAGCOZ4Tkk/y0W++
 0ZOyQgtTQnAY43gkhofYd/Uuuy/xnu7zS7aR/7iP7zUguOifpre9pcAEIvaxG6/fVe01XOd0N
 6bODbQRUBlkpOv3oRYABJ9DVqxD06cuF49mkEPQFCVyY5nd96mGyZxYfGiu2yRR/jDr7RIQFC
 dB67pKUqHKj9VyNkzefS2hCL0X3lYpECvsu9T5J5o0IM9edWdmW2DJD6uPxsv+rjAO0CEdR4R
 Pp6eOGTrZTQgsPAWjWO1EUZ6kXz7FePk4bObyR3e1qPsE1BjqoaDfmJSqNVXd72njM9HoUZK3
 P0M1DirTom+CxISI0hHxtrSwrZwX2LjV3Mb+9FQQRdh1mgr1xqH3AaQB5pD1zzzIDUjzVuT1W
 cTLIJos3piVPQNdVWUQH6MLx95Mz8rtSkHDejh1QsdoaUX+QHrq3tdzQR3BCPq5ozhZaGBgXf
 /lFubO7bQExU69QcPWDKW0CHjMsRPBTCkYCM3k8mxYE6PEXQSJ1SMPI4dixbQTcyJDVRgnq3S
 sL/xCXPGVgb95m9DOp+jPVwLJkwLVFFJl2U3FRCKRUGzce2snZth40I2UG7vZw/18rat8XlI9
 wzNrHJFgtZIJY4hMc7NQ==
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210115_203436_674512_FA30B09F 
X-CRM114-Status: UNSURE (   9.45  )
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
Cc: alsa-devel@alsa-project.org, Shane Chien <shane.chien@mediatek.com>,
 linux-kernel@vger.kernel.org,
 =?UTF-8?q?Jonathan=20Neusch=C3=A4fer?= <j.neuschaefer@gmx.net>,
 Jiaxin Yu <jiaxin.yu@mediatek.com>, Liam Girdwood <lgirdwood@gmail.com>,
 Rob Herring <robh+dt@kernel.org>, Mark Brown <broonie@kernel.org>,
 linux-mediatek@lists.infradead.org, Matthias Brugger <matthias.bgg@gmail.com>,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

VGhlIGl0ZW1zIG9mIHRoZSAnbWFpbnRhaW5lcnMnIGxpc3QgYXJlIGluZGVudGVkIHdpdGggdGhy
ZWUgc3BhY2VzLgpVc2UgdGhlIHVzdWFsIHR3byBzcGFjZXMgaW5zdGVhZCwgZm9yIGNvbnNpc3Rl
bmN5IGFuZCB0byBzaWxlbmNlCnlhbWxsaW50LgoKU2lnbmVkLW9mZi1ieTogSm9uYXRoYW4gTmV1
c2Now6RmZXIgPGoubmV1c2NoYWVmZXJAZ214Lm5ldD4KLS0tCiAuLi4vYmluZGluZ3Mvc291bmQv
bXQ4MTkyLW10NjM1OS1ydDEwMTUtcnQ1NjgyLnlhbWwgICAgICAgICAgIHwgNCArKy0tCiAxIGZp
bGUgY2hhbmdlZCwgMiBpbnNlcnRpb25zKCspLCAyIGRlbGV0aW9ucygtKQoKZGlmZiAtLWdpdCBh
L0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9zb3VuZC9tdDgxOTItbXQ2MzU5LXJ0
MTAxNS1ydDU2ODIueWFtbCBiL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9zb3Vu
ZC9tdDgxOTItbXQ2MzU5LXJ0MTAxNS1ydDU2ODIueWFtbAppbmRleCBiZjhjOGJhMjUwMDlkLi41
NDY1MDgyM2IyOWE0IDEwMDY0NAotLS0gYS9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGlu
Z3Mvc291bmQvbXQ4MTkyLW10NjM1OS1ydDEwMTUtcnQ1NjgyLnlhbWwKKysrIGIvRG9jdW1lbnRh
dGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL3NvdW5kL210ODE5Mi1tdDYzNTktcnQxMDE1LXJ0NTY4
Mi55YW1sCkBAIC03LDggKzcsOCBAQCAkc2NoZW1hOiBodHRwOi8vZGV2aWNldHJlZS5vcmcvbWV0
YS1zY2hlbWFzL2NvcmUueWFtbCMKIHRpdGxlOiBNZWRpYXRlayBNVDgxOTIgd2l0aCBNVDYzNTks
IFJUMTAxNSBhbmQgUlQ1NjgyIEFTb0Mgc291bmQgY2FyZCBkcml2ZXIKCiBtYWludGFpbmVyczoK
LSAgIC0gSmlheGluIFl1IDxqaWF4aW4ueXVAbWVkaWF0ZWsuY29tPgotICAgLSBTaGFuZSBDaGll
biA8c2hhbmUuY2hpZW5AbWVkaWF0ZWsuY29tPgorICAtIEppYXhpbiBZdSA8amlheGluLnl1QG1l
ZGlhdGVrLmNvbT4KKyAgLSBTaGFuZSBDaGllbiA8c2hhbmUuY2hpZW5AbWVkaWF0ZWsuY29tPgoK
IGRlc2NyaXB0aW9uOgogICBUaGlzIGJpbmRpbmcgZGVzY3JpYmVzIHRoZSBNVDgxOTIgc291bmQg
Y2FyZC4KLS0KMi4yOS4yCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX18KTGludXgtbWVkaWF0ZWsgbWFpbGluZyBsaXN0CkxpbnV4LW1lZGlhdGVrQGxpc3Rz
LmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5m
by9saW51eC1tZWRpYXRlawo=
