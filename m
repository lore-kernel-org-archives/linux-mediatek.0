Return-Path: <SRS0=VpQz=L2=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=0.6 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	UNWANTED_LANGUAGE_BODY,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7B215C11F68
	for <linux-mediatek@archiver.kernel.org>; Fri,  2 Jul 2021 13:49:52 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3563C61279
	for <linux-mediatek@archiver.kernel.org>; Fri,  2 Jul 2021 13:49:52 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 3563C61279
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=free.fr
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Date:Message-ID:Subject:From:To:
	Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=NhAaZgWaQC8JjWN7u2U3WIxT9evMNnj8jomMVA8sHCQ=; b=cfWUBx7fjSdF+j
	aBhW8vN1JNb4ngoYTemDLi3suJJdHCJyrRYk8IRfJPgMuFpqnjLgPHbU/ZaFFVqBx8bCbtPzvIOAi
	BTbJ6S7ZdNd2ydvoUJpMtfX2rYPUwaWgVgiz2F4xygI1BJbaW/DrFOJl2jKqS9kMT+zhA4Nnra4RG
	TG9MwygBx1eSQWmeRRs8hJk4ieZdy4C/22hpQOSLufMm4Vb12RK1GbNzOhTxM7H0XI4pd1oMhfiGc
	Pw2u0n/604F0cXrS90cGtUVFNpPy4tyyI62bzGjdOQrQ7QyZx1R+4698QK/WjXVRvcsXcDyFAqQGk
	LD2MXoj+qdf9ToMxwStg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1lzJY4-003BnD-61; Fri, 02 Jul 2021 13:49:40 +0000
Received: from smtp3-g21.free.fr ([212.27.42.3])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1lzJY1-003Bl6-8C
 for linux-mediatek@lists.infradead.org; Fri, 02 Jul 2021 13:49:38 +0000
Received: from [IPv6:2a01:e0a:935:c590:c415:d306:e6cc:6763] (unknown
 [IPv6:2a01:e0a:935:c590:c415:d306:e6cc:6763])
 by smtp3-g21.free.fr (Postfix) with ESMTP id F2CF513F8AE
 for <linux-mediatek@lists.infradead.org>;
 Fri,  2 Jul 2021 15:49:00 +0200 (CEST)
To: linux-mediatek@lists.infradead.org
From: CREMOUX Guy <gcremoux@free.fr>
Subject: Pilote
Message-ID: <8aca6598-3dfc-d4bf-c3fa-ce33adc8903c@free.fr>
Date: Fri, 2 Jul 2021 15:49:00 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
Content-Language: fr
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210702_064937_483609_21E03DB9 
X-CRM114-Status: UNSURE (   3.61  )
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
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

Qm9uam91ciwKCkplIGNoZXJjaGUgdW4gZHJpdmVyIHBvdXIgTWVkaWFUZWsgNzYwMyBJbmMgODAy
LjExbiBXTEFOwqAgcG91ciBMaW51eCAKVWJ1bnR1IC4KCkMnZXN0IHVuZSBhbnRlbm5lIHdpZmkg
LgoKTWVyY2kKCkNvcmRpYWxlbWVudAoKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fXwpMaW51eC1tZWRpYXRlayBtYWlsaW5nIGxpc3QKTGludXgtbWVkaWF0
ZWtAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFu
L2xpc3RpbmZvL2xpbnV4LW1lZGlhdGVrCg==
