Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6B9CCC433F5
	for <linux-mediatek@archiver.kernel.org>; Sat, 21 May 2022 01:25:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=QMd056pOKm13/+95AEXb9i3tbC3oPvj2Nv6MxqEykR0=; b=HfBsQDNNkPi9xI
	QmDhrPxoU9mVxQjVH8ao+LYghunn2Sve7XrwgOATXeANenyIxYUFxkvIP+3LBguodNoxEqspe2WIZ
	jtdS7I/w3PWkF1rlTCp79LAj/ZfZsEoGAWYQgsM2IccAq//08+Q0innzd95L99IeY8VODtgYfyTOB
	WfIeukYlmA0mPLiN3IS7Esq+07Rx/5YFVpxT9BOMJjy1wNJZrWz4+qwKM6DeMgFCflT/eQIUrg1xg
	cOA9KsyqZCSfAS0JxKbFc1Cl7vnq0eYTHmRkK2PPNnXTjGvgcipcvJcK1V47G65bwf+WEVMhJwwZG
	EN5KPij2op2Qzvt2QBkQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nsDsM-00F8mI-LJ; Sat, 21 May 2022 01:25:50 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nsDsK-00F8lY-Bw
 for linux-mediatek@lists.infradead.org; Sat, 21 May 2022 01:25:49 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id E265861D7D;
 Sat, 21 May 2022 01:25:46 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D933DC385A9;
 Sat, 21 May 2022 01:25:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1653096346;
 bh=yMocOcmC33NsOkfqFgLCpjgPvld2Y6qIGt0yG2xZxT8=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=Ld2JXAiNS2E9dtYRfU0l1Jf9/Ef0Kp18tzj0enX1dCPEJhIbYGbAedQ758PqZsmP7
 WuCtRsaoo6c3iAMf+27A7DmVq86QfZ3WPFS8dzssv4e6OIryYZOsSxJBBb+M3f/4Eo
 SZJPmFsVdPTSksz/sSNVb641Kq6tCy0Hkz87rgdp3iE+rBWiSoBmiJ2LSXWFIv7Mor
 YrBHLQZIw99Xx/jcl17pcqLFMb4zyr9S3734AZwvKHrzM5nRvYD+Cn5CFEUSBLGrgd
 DJPAMaPVNYuBHmjZoAAynhaY+03mr+SomSslpxKRSR0fUF47y7LynTpcHac7Vn+QHs
 K4wZ3KhQfBpsQ==
Date: Fri, 20 May 2022 18:25:44 -0700
From: Jakub Kicinski <kuba@kernel.org>
To: Lorenzo Bianconi <lorenzo@kernel.org>
Cc: netdev@vger.kernel.org, nbd@nbd.name, john@phrozen.org,
 sean.wang@mediatek.com, Mark-MC.Lee@mediatek.com, davem@davemloft.net,
 edumazet@google.com, pabeni@redhat.com, Sam.Shih@mediatek.com,
 linux-mediatek@lists.infradead.org, devicetree@vger.kernel.org,
 robh@kernel.org, lorenzo.bianconi@redhat.com
Subject: Re: [PATCH v3 net-next 00/16] introduce mt7986 ethernet support
Message-ID: <20220520182544.1af8f5bf@kernel.org>
In-Reply-To: <cover.1653069056.git.lorenzo@kernel.org>
References: <cover.1653069056.git.lorenzo@kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220520_182548_515479_F5F94EC8 
X-CRM114-Status: UNSURE (   8.17  )
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

T24gRnJpLCAyMCBNYXkgMjAyMiAyMDoxMToyMyArMDIwMCBMb3JlbnpvIEJpYW5jb25pIHdyb3Rl
Ogo+IEFkZCBzdXBwb3J0IGZvciBtdDc5ODYtZXRoIGRyaXZlciBhdmFpbGFibGUgb24gbXQ3OTg2
IHNvYy4KPiAKPiBDaGFuZ2VzIHNpbmNlIHYyOgo+IC0gcmVseSBvbiBHRlBfS0VSTkVMIHdoZW5l
dmVyIHBvc3NpYmxlCj4gLSBkZWZpbmUgbXRrX3JlZ19tYXAgc3RydWN0IHRvIGludHJvZHVjZSBz
b2MgcmVnaXN0ZXIgbWFwIGFuZCBhdm9pZCBtYWNyb3MKPiAtIGltcHJvdmUgY29tbWVudHMKPiAK
PiBDaGFuZ2VzIHNpbmNlIHYxOgo+IC0gZHJvcCBTUkFNIG9wdGlvbgo+IC0gY29udmVydCByaW5n
LT5kbWEgdG8gdm9pZAo+IC0gY29udmVydCBzY3JhdGNoX3JpbmcgdG8gdm9pZAo+IC0gZW5hYmxl
IHBvcnQ0Cj4gLSBmaXggaXJxIGR0cyBiaW5kaW5ncwo+IC0gZHJvcCBnbWFjMSBzdXBwb3J0IGZy
b20gbXQ3OTg2YS1yZmIgZHRzIGZvciB0aGUgbW9tZW50Cgrwn5GNCgpBY2tlZC1ieTogSmFrdWIg
S2ljaW5za2kgPGt1YmFAa2VybmVsLm9yZz4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fCkxpbnV4LW1lZGlhdGVrIG1haWxpbmcgbGlzdApMaW51eC1tZWRp
YXRla0BsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxt
YW4vbGlzdGluZm8vbGludXgtbWVkaWF0ZWsK
