Return-Path: <SRS0=Fikf=MV=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D5B72C4338F
	for <linux-mediatek@archiver.kernel.org>; Thu, 29 Jul 2021 12:25:13 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9068360C3F
	for <linux-mediatek@archiver.kernel.org>; Thu, 29 Jul 2021 12:25:13 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 9068360C3F
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=canonical.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:Cc:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=6bq/LJksibJQOxPVvsGh05RPjCDQg04B5dKqSxQCVpU=; b=upkC1yODpiyMHh2r1hNdPx8KJb
	m/7lypD1ictLbx5XtjlpsS5bpAnbXKtNNEu0GfBSgncy7h3JvwhlTqJIHbFq9nWXGmk/2KmGPPO1h
	MZQv3G3fjTrWkMIl7VI3gVaJ7DxjZD1mZyZR7ONMsdtMc7ZEbafv0wI0tauajViaOTr60R8hktte+
	ABaTE2kA4ukJc3ieGyuILlb6TOjm3lyshjTXy2xGWw6GXKDJg0ZMod/yrFZWJybapfDJ4BbthqfIn
	wu6By/FPRsisxTK0AFyKm/dbINmfF11V42sWul5mSHF3Eos2uMPgQJ7MxOePJWir0B0z+fEj6VaiM
	/uy8m5/A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1m955x-00474K-N4; Thu, 29 Jul 2021 12:25:01 +0000
Received: from smtp-relay-canonical-1.canonical.com ([185.125.188.121])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1m955u-00473M-VM
 for linux-mediatek@lists.infradead.org; Thu, 29 Jul 2021 12:25:00 +0000
Received: from [192.168.1.18] (unknown [222.129.38.241])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-relay-canonical-1.canonical.com (Postfix) with ESMTPSA id BC0953F079; 
 Thu, 29 Jul 2021 12:24:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
 s=20210705; t=1627561490;
 bh=+FXY2wcHq76jBObAXyKLbqyvrnML5nfK/kXk9WmeV+k=;
 h=Subject:To:Cc:References:From:Message-ID:Date:MIME-Version:
 In-Reply-To:Content-Type;
 b=HwSvs3V5bC+WQ7a8ZWzSd+PslPpPWSroGLKnRIG3gLKc/SB4Itx0x7pnDIn3VuXn/
 tOJXGuqEryoPuS8j8ei5gK1HuIiGsztRDsShM6Y1ucWoRJij5ywNJLVEHpOK/rvI9y
 OuGIzHV92dj2uLW2/qcd03wWmgEE0NF+tTRFSGeRSdrssXKW2KKBfimzTHN9Js7Cyl
 jmqm1z/dzZdxQPkhVVzuKyTa0/tjJWNOaHt14FXiQfL+Teol/5Hcw9dlCIdxl2Am3m
 nOwZ+nMG9ZxH5SMjkCcrWNFIrjkGn6zCJlR+SsG0TGl651m81+SJhJJ7qpKBilxpiN
 Vu/D1RZ7VuF6A==
Subject: Re: [PATCH v2] Bluetooth: btusb: Add support for Foxconn Mediatek Chip
To: Marcel Holtmann <marcel@holtmann.org>
Cc: Johan Hedberg <johan.hedberg@gmail.com>,
 Luiz Augusto von Dentz <luiz.dentz@gmail.com>, matthias.bgg@gmail.com,
 linux-bluetooth <linux-bluetooth@vger.kernel.org>,
 open list <linux-kernel@vger.kernel.org>, linux-mediatek@lists.infradead.org
References: <E6EC3615-DAC0-4267-AD9B-3B0604EDAD87@holtmann.org>
 <20210722171718.134034-1-aaron.ma@canonical.com>
 <117CE889-33B8-4D1D-A81F-AC2AC9A0371D@holtmann.org>
From: Aaron Ma <aaron.ma@canonical.com>
Message-ID: <333d6607-a364-8f3d-be6b-1bb12c64815c@canonical.com>
Date: Thu, 29 Jul 2021 20:24:34 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <117CE889-33B8-4D1D-A81F-AC2AC9A0371D@holtmann.org>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210729_052459_250863_12FF7DB7 
X-CRM114-Status: UNSURE (   9.28  )
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

SGkgTWFyY2VsOgoKT24gNy8yOS8yMSA3OjQ4IFBNLCBNYXJjZWwgSG9sdG1hbm4gd3JvdGU6Cj4g
SSBjYW7igJl0IGFwcGx5IHRoaXMgY2xlYW5seSB0byBibHVldG9vdGgtbmV4dCB0cmVlLiBQbGVh
c2UgcmViYXNlIGl0Lgo+IAoKWW91IGhhdmUgYWxyZWFkeSBhcHBsaWVkIGluIGJsdWV0b290aC1u
ZXh0IGJyYW5jaCBtYXN0ZXIuCgpBYXJvbgoKPiBSZWdhcmRzCj4gCj4gTWFyY2VsCj4gCgpfX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eC1tZWRpYXRl
ayBtYWlsaW5nIGxpc3QKTGludXgtbWVkaWF0ZWtAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8v
bGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LW1lZGlhdGVrCg==
