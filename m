Return-Path: <SRS0=I1M+=LI=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7E0A1C47094
	for <linux-mediatek@archiver.kernel.org>; Mon, 14 Jun 2021 17:37:49 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 51ECC61350
	for <linux-mediatek@archiver.kernel.org>; Mon, 14 Jun 2021 17:37:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 51ECC61350
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=lunn.ch
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=nOcL2XuqDFwW0XiHGdTkX9YTGz2YcO0q/GXVOcXZe7c=; b=f2RnSkc07oCrRA
	2I51rXLROUeYgGhSgHXNVfA57HI+KUP8pzFfMG6XsRDKQTod+4L3KO+QaWXWBs4R4qgtbuNlQ+ARa
	JCXh1FAE/8ENIGnaIIkB6RYX0DwdXf6Il+J4betxXKSHM6Cy+GW9TW/3CVK+f7C26A7Pnz7906rAX
	d9zNdJqdEXGs56/EOiwvv4VhYIGITa57yT8k/5A3lDxceUMiGepUoURug1t9UNso99b35bTwMaJHR
	XEF6MVe6rKjojWZP5h6XTqu0cufvt72Dy6q+1YJwFEHx+K9TDFL670+Fzj7F3lKMTWj5lp0+ziwfh
	HstrRLHssLr2VJlGqmvQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1lsqWm-00FSRT-W8; Mon, 14 Jun 2021 17:37:37 +0000
Received: from vps0.lunn.ch ([185.16.172.187])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1lsqWN-00FSJb-3a; Mon, 14 Jun 2021 17:37:12 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
 s=20171124; h=In-Reply-To:Content-Transfer-Encoding:Content-Disposition:
 Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:From:
 Sender:Reply-To:Subject:Date:Message-ID:To:Cc:MIME-Version:Content-Type:
 Content-Transfer-Encoding:Content-ID:Content-Description:Content-Disposition:
 In-Reply-To:References; bh=cONCX2OHCfk2/XaURxX1uWtX4MnH7IVZGQBhzW25uws=; b=us
 ds8I821Kurup69t/J7weKC3U5A9SmnaIbvOtCBMJGXNfzOUN+10F/6v3RpJF6wrX9WQbziMcY5MRA
 5H8fM8q+pLY/lB/yoNI6e3KdCmPf/Q1DsiCQ/LdeGsJ7+pNwtRKaBPYhvpBpxZpQHwo0L2lbSz91D
 PTsmCsxHTxTsQHM=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
 (envelope-from <andrew@lunn.ch>)
 id 1lsqW7-009Mmp-M8; Mon, 14 Jun 2021 19:36:55 +0200
Date: Mon, 14 Jun 2021 19:36:55 +0200
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
Subject: Re: [PATCH v3 1/2] dt-bindings: dwmac: Add bindings for new Ingenic
 SoCs.
Message-ID: <YMeTt35Q6gTG8UL/@lunn.ch>
References: <1623690937-52389-1-git-send-email-zhouyanjie@wanyeetech.com>
 <1623690937-52389-2-git-send-email-zhouyanjie@wanyeetech.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1623690937-52389-2-git-send-email-zhouyanjie@wanyeetech.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210614_103711_171276_E9BD260C 
X-CRM114-Status: UNSURE (   6.73  )
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

T24gVHVlLCBKdW4gMTUsIDIwMjEgYXQgMDE6MTU6MzZBTSArMDgwMCwg5ZGo55Cw5p2wIChaaG91
IFlhbmppZSkgd3JvdGU6Cj4gQWRkIHRoZSBkd21hYyBiaW5kaW5ncyBmb3IgdGhlIEpaNDc3NSBT
b0MsIHRoZSBYMTAwMCBTb0MsCj4gdGhlIFgxNjAwIFNvQywgdGhlIFgxODMwIFNvQyBhbmQgdGhl
IFgyMDAwIFNvQyBmcm9tIEluZ2VuaWMuCj4gCj4gU2lnbmVkLW9mZi1ieTog5ZGo55Cw5p2wICha
aG91IFlhbmppZSkgPHpob3V5YW5qaWVAd2FueWVldGVjaC5jb20+CgpSZXZpZXdlZC1ieTogQW5k
cmV3IEx1bm4gPGFuZHJld0BsdW5uLmNoPgoKICAgIEFuZHJldwoKX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXgtbWVkaWF0ZWsgbWFpbGluZyBsaXN0
CkxpbnV4LW1lZGlhdGVrQGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVh
ZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1tZWRpYXRlawo=
