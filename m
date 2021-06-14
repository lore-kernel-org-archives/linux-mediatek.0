Return-Path: <SRS0=I1M+=LI=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A8304C2B9F4
	for <linux-mediatek@archiver.kernel.org>; Mon, 14 Jun 2021 17:37:47 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7DBD761356
	for <linux-mediatek@archiver.kernel.org>; Mon, 14 Jun 2021 17:37:47 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 7DBD761356
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=lunn.ch
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=AyS5czObQvprLxiisuNZsFCcmfKHRGV0Jllq5YvapTc=; b=iatGpSw5VL7H8h
	VUd5/ezuJF4a6jVHCelyM5ARRfBL6p7OXaJ1ygT7rmY17f9Mcl44NWAIfOFpJ8hNO5M/TL1qww9fY
	n3Rd7Z6d3OPnEsK4jryC7vrTCwyjS3ZQoL11yEzR1fGZyE5nZzeitRjE+XUL02tqk1sh3n4Wkthoy
	2b6qNO5N2fzmJfGMseVC6UjIzyIpdPOLxViunpcr4ljsRzr6jNCqD3gLup1Nmg7Nnwtz5Hz+sGfxW
	w/pkas1BvVU4ITafrl0auFReYv/JVixQEqBQ96VN4CAtkOAI6ogo6yG4QLnVj6E575Fy1YIIHYPMA
	EZQA5HmZ8+BsSI0TZSvw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1lsqWm-00FSRC-5H; Mon, 14 Jun 2021 17:37:36 +0000
Received: from vps0.lunn.ch ([185.16.172.187])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1lsqWN-00FSJj-3Q; Mon, 14 Jun 2021 17:37:12 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
 s=20171124; h=In-Reply-To:Content-Transfer-Encoding:Content-Disposition:
 Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:From:
 Sender:Reply-To:Subject:Date:Message-ID:To:Cc:MIME-Version:Content-Type:
 Content-Transfer-Encoding:Content-ID:Content-Description:Content-Disposition:
 In-Reply-To:References; bh=yNJZdu5e9R9IKJLMXzwlJdT1h35Mb6+Vu9cSblpMexw=; b=ZS
 KVZMYvVbzNUjqEwyxpEivD5BHmDXQdFmXDlwsUAfxEy07XyluMcabpUle5H5ZNTlSvWB4khgr7WwR
 SHWWk/hNzMPcEPeXbB3a2+T5/ZVepAo7dFI1ZQsFWtOdM76xQYQ0j9sV2dFWQdkvxLW/kGtDsIIws
 pA0kkT9QLeZtg8s=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
 (envelope-from <andrew@lunn.ch>)
 id 1lsqVy-009MmX-Ti; Mon, 14 Jun 2021 19:36:46 +0200
Date: Mon, 14 Jun 2021 19:36:46 +0200
From: Andrew Lunn <andrew@lunn.ch>
To: =?utf-8?B?5ZGo55Cw5p2wIChaaG91IFlhbmppZSk=?= <zhouyanjie@wanyeetech.com>
Cc: davem@davemloft.net, kuba@kernel.org, robh+dt@kernel.org,
 peppe.cavallaro@st.com, alexandre.torgue@foss.st.com,
 joabreu@synopsys.com, mcoquelin.stm32@gmail.com,
 matthias.bgg@gmail.com, alexandre.torgue@st.com,
 netdev@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, dongsheng.qiu@ingenic.com,
 aric.pzqi@ingenic.com, rick.tyliu@ingenic.com,
 sihui.liu@ingenic.com, jun.jiang@ingenic.com, sernia.zhou@foxmail.com
Subject: Re: [PATCH v3 2/2] net: stmmac: Add Ingenic SoCs MAC support.
Message-ID: <YMeTrq/j7728lCN0@lunn.ch>
References: <1623690937-52389-1-git-send-email-zhouyanjie@wanyeetech.com>
 <1623690937-52389-3-git-send-email-zhouyanjie@wanyeetech.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1623690937-52389-3-git-send-email-zhouyanjie@wanyeetech.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210614_103711_170495_96128990 
X-CRM114-Status: UNSURE (   8.36  )
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

T24gVHVlLCBKdW4gMTUsIDIwMjEgYXQgMDE6MTU6MzdBTSArMDgwMCwg5ZGo55Cw5p2wIChaaG91
IFlhbmppZSkgd3JvdGU6Cj4gQWRkIHN1cHBvcnQgZm9yIEluZ2VuaWMgU29DIE1BQyBnbHVlIGxh
eWVyIHN1cHBvcnQgZm9yIHRoZSBzdG1tYWMKPiBkZXZpY2UgZHJpdmVyLiBUaGlzIGRyaXZlciBp
cyB1c2VkIG9uIGZvciB0aGUgTUFDIGV0aGVybmV0IGNvbnRyb2xsZXIKPiBmb3VuZCBpbiB0aGUg
Slo0Nzc1IFNvQywgdGhlIFgxMDAwIFNvQywgdGhlIFgxNjAwIFNvQywgdGhlIFgxODMwIFNvQywK
PiBhbmQgdGhlIFgyMDAwIFNvQy4KPiAKPiBTaWduZWQtb2ZmLWJ5OiDlkajnkLDmnbAgKFpob3Ug
WWFuamllKSA8emhvdXlhbmppZUB3YW55ZWV0ZWNoLmNvbT4KClJldmlld2VkLWJ5OiBBbmRyZXcg
THVubiA8YW5kcmV3QGx1bm4uY2g+CgogICAgQW5kcmV3CgpfX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eC1tZWRpYXRlayBtYWlsaW5nIGxpc3QKTGlu
dXgtbWVkaWF0ZWtAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9y
Zy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LW1lZGlhdGVrCg==
