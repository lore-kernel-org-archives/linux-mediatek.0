Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2B40CC43334
	for <linux-mediatek@archiver.kernel.org>; Fri, 22 Jul 2022 03:08:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-ID:MIME-Version:
	Content-Type:Content-Transfer-Encoding:References:In-Reply-To:Subject:To:From
	:Date:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=1/E0H0TmO+gxEJVfIoqe/RbQ9XBYrTm3/vdud2juwNQ=; b=xdo1+l7FN2eE715DRAjsSxW6E4
	ivmSuSw0IOdVxO7xcd0pNtkkGC7oZZXKmpMyGHFFd51uQzCUNX3n/r678gvtUzTJ+myN3dfHFRgor
	BlTzikf846dBMhjxH3+XSdIZNs49crxB56cDlabM04zowXjzTpjI8kwjLIbQ7Y+fksMW6X2vtYxHy
	nCPZDS8HXNlDm/hTzs9m+dyQ+qQSL59/HVcPd9LURiITk9IJ2yMq65WP9jCIcPste/SZwGm1FNZbX
	hpW651CealgTDiktI/TgXPjx3j0cNvkQgXtdxbI8Ng5UtO7eKkswTRHwsqA4Y7sYodlHUeP90XWYb
	5piWOjrQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oEj1V-00H6No-Vu; Fri, 22 Jul 2022 03:08:17 +0000
Received: from spam.zju.edu.cn ([61.164.42.155] helo=zju.edu.cn)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oEj1S-00H6J0-HF; Fri, 22 Jul 2022 03:08:16 +0000
Received: by ajax-webmail-mail-app3 (Coremail) ; Fri, 22 Jul 2022 11:08:01
 +0800 (GMT+08:00)
X-Originating-IP: [10.192.176.244]
Date: Fri, 22 Jul 2022 11:08:01 +0800 (GMT+08:00)
X-CM-HeaderCharset: UTF-8
From: "Lin Ma" <linma@zju.edu.cn>
To: dongchun.zhu@mediatek.com, zhengsq@rock-chips.com, mchehab@kernel.org, 
	matthias.bgg@gmail.com, linux-media@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-mediatek@lists.infradead.org
Subject: Re: [PATCH v0] media: i2c: fix the erroneous pointer initializer
X-Priority: 3
X-Mailer: Coremail Webmail Server Version XT5.0.13 build 20210104(ab8c30b6)
 Copyright (c) 2002-2022 www.mailtech.cn zju.edu.cn
In-Reply-To: <20220722022459.5030-1-linma@zju.edu.cn>
References: <20220722022459.5030-1-linma@zju.edu.cn>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset=UTF-8
MIME-Version: 1.0
Message-ID: <693a3b3e.519a0.18223e0575b.Coremail.linma@zju.edu.cn>
X-Coremail-Locale: zh_CN
X-CM-TRANSID: cC_KCgD3_6uSFNpiD7U3AQ--.18250W
X-CM-SenderInfo: qtrwiiyqvtljo62m3hxhgxhubq/1tbiAwMTElNG3HhAaAACsa
X-Coremail-Antispam: 1Ur529EdanIXcx71UUUUU7IcSsGvfJ3iIAIbVAYjsxI4VWUCw
	CS07vEb4IE77IF4wCS07vE1I0E4x80FVAKz4kxMIAIbVAFxVCaYxvI4VCIwcAKzIAtYxBI
	daVFxhVjvjDU=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220721_200814_879791_68F1BA3B 
X-CRM114-Status: UNSURE (   2.83  )
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

SGVsbG8gdGhlcmUsCgoKPiAKPiBUaGVyZSBhcmUgb2J2aW91cyBlcnJvcnMgZm9yIHRoZSBpbml0
aWFsaXplciBvZiBvdjAyYTEwX2kyY19kcml2ZXIsCj4gb3YyNjgyX2kyY19kcml2ZXIsIGFuZCBv
djU2OTVfaTJjX2RyaXZlciBhcyB0aGUgY29kZSBpbnRlbmRlZCB0byBhc3NpZ24KPiAiYWRkcmVz
cyBvZiBmdW5jdGlvbiBwb2ludGVyIiB0byBmdW5jdGlvbiBwb2ludGVyLiBUaGlzIHBhdGNoIGZp
eGVzIHRoZW0KPiBieSByZW1vdmluZyByZWR1bmRhbnQgJiBvcGVyYXRvcnMuCj4gCj4gU2lnbmVk
LW9mZi1ieTogTGluIE1hIDxsaW5tYUB6anUuZWR1LmNuPgoKU29ycnkgYXMgdGhpcyBpcyBhIGZh
bHNlIGFsYXJtIDooCkkganVzdCBnZXQgY29uZnVzZWQgYnkgdGhlIGZ1bmN0aW9uIHBvaW50ZXJz
IGFuZCBmdW5jdGlvbiBhZGRyZXNzZXMgYW5kCnRoZSBvcmlnaW5hbCBjb2RlIHdvcmtzIGZpbmUu
CgpSZWdhcmRzCkxpbg==

