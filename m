Return-Path: <SRS0=uiJf=BH=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 977D9C433E5
	for <linux-mediatek@archiver.kernel.org>; Tue, 28 Jul 2020 15:54:14 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 65F7A2065C
	for <linux-mediatek@archiver.kernel.org>; Tue, 28 Jul 2020 15:54:14 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="CFdX0xsw";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="heA20mt5"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 65F7A2065C
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-ID:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=KJfHbGLfqU2Y/GSYgEBzT/vrEfaMF/ljyis/n8q4aNQ=; b=CFdX0xswhU1JV9Ux3RjlPdbti
	GTBoA7yDeNA2pX4ZUO+nxySEGuYPKX1eqlCvapoFcvpa+Zop8sppXyQe16KtFT7aDvFfAVctXkuiC
	OMs6VJRReOuNo23dxDREnWWvZBTyHTc4xNfctiCVFTvjCKhRCCfAthC2FtGeTcacHw+YXUF/v4BJc
	TSzStl3EPr2cnCxpje36y1uF6hGDIwg/QPRh/++igoEsYfI/g1D8Yw7x64WgRYEq260N+0kPf7BP8
	duUCQ+zy09vu0JvW+Ou+/NCjQYdPVbn15oFMJBNREe9rQ3NJ0UYtI2icuBpFmui2oWoW9vc7Tqkqd
	kHJXABcqg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1k0RvY-0007Ed-5A; Tue, 28 Jul 2020 15:54:04 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1k0RvS-0007Ca-RE; Tue, 28 Jul 2020 15:53:59 +0000
Received: from kicinski-fedora-pc1c0hjn.dhcp.thefacebook.com (unknown
 [163.114.132.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id C89CE2065C;
 Tue, 28 Jul 2020 15:53:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1595951637;
 bh=gWJFQ7KbXU4CB3E5IPadofiuBeWM1QedR1jU6yv1biM=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=heA20mt5mf/z6pFz72zn89Qr++Gzwv2c4eygc0T76bA2GbHXJl+94jkV9+XbuLMGE
 zm3Z3xbwiQzuP8FngT8FZuTQDC4SvJ77wBYuyG4jb1KRSbC7Oaehy1+JH169usMnVB
 ouDqP4k17TtZIOLH/o8P9w/kx5JswzclkDTAPBjI=
Date: Tue, 28 Jul 2020 08:53:55 -0700
From: Jakub Kicinski <kuba@kernel.org>
To: Frank Wunderlich <frank-w@public-files.de>
Subject: Re: [PATCH v3] net: ethernet: mtk_eth_soc: fix mtu warning
Message-ID: <20200728085355.7de7c14e@kicinski-fedora-pc1c0hjn.dhcp.thefacebook.com>
In-Reply-To: <20200728122743.78489-1-frank-w@public-files.de>
References: <20200728122743.78489-1-frank-w@public-files.de>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200728_115359_001472_3E6BBBF4 
X-CRM114-Status: GOOD (  10.01  )
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
Cc: Landen Chao <landen.chao@mediatek.com>, netdev@vger.kernel.org,
 Sean Wang <sean.wang@mediatek.com>, linux-kernel@vger.kernel.org,
 "David S. Miller" <davem@davemloft.net>,
 =?UTF-8?B?UmVuw6k=?= van Dorst <opensource@vdorst.com>,
 linux-mediatek@lists.infradead.org, John Crispin <john@phrozen.org>,
 Matthias Brugger <matthias.bgg@gmail.com>, Mark Lee <Mark-MC.Lee@mediatek.com>,
 linux-arm-kernel@lists.infradead.org, Felix Fietkau <nbd@nbd.name>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

T24gVHVlLCAyOCBKdWwgMjAyMCAxNDoyNzo0MyArMDIwMCBGcmFuayBXdW5kZXJsaWNoIHdyb3Rl
Ogo+IEZyb206IExhbmRlbiBDaGFvIDxsYW5kZW4uY2hhb0BtZWRpYXRlay5jb20+CgpIaSBnZW50
cywKCmlmIHRoZSBwYXRjaCBpcyBmcm9tIExhbmRlbiB3ZSBuZWVkIGhpcyBzaWduLW9mZiBvbiBp
dC4KCj4gaW4gcmVjZW50IEtlcm5lbC1WZXJzaW9ucyB0aGVyZSBhcmUgd2FybmluZ3MgYWJvdXQg
aW5jb3JyZWN0IE1UVS1TaXplCj4gbGlrZSB0aGVzZToKPiAKPiBldGgwOiBtdHUgZ3JlYXRlciB0
aGFuIGRldmljZSBtYXhpbXVtCj4gbXRrX3NvY19ldGggMWIxMDAwMDAuZXRoZXJuZXQgZXRoMDog
ZXJyb3IgLTIyIHNldHRpbmcgTVRVIHRvIGluY2x1ZGUgRFNBIG92ZXJoZWFkCj4gCj4gRml4ZXM6
IGJmY2I4MTMyMDNlNiAoIm5ldDogZHNhOiBjb25maWd1cmUgdGhlIE1UVSBmb3Igc3dpdGNoIHBv
cnRzIikKPiBGaXhlczogNzI1NzllMTRhMWQzICgibmV0OiBkc2E6IGRvbid0IGZhaWwgdG8gcHJv
YmUgaWYgd2UgY291bGRuJ3Qgc2V0IHRoZSBNVFUiKQo+IEZpeGVzOiA3YTRjNTNiZWUzMzIgKCJu
ZXQ6IHJlcG9ydCBpbnZhbGlkIG10dSB2YWx1ZSB2aWEgbmV0bGluayBleHRhY2siKQo+IFNpZ25l
ZC1vZmYtYnk6IFJlbsOpIHZhbiBEb3JzdCA8b3BlbnNvdXJjZUB2ZG9yc3QuY29tPgo+IFNpZ25l
ZC1vZmYtYnk6IEZyYW5rIFd1bmRlcmxpY2ggPGZyYW5rLXdAcHVibGljLWZpbGVzLmRlPgoKCl9f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4LW1lZGlh
dGVrIG1haWxpbmcgbGlzdApMaW51eC1tZWRpYXRla0BsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6
Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtbWVkaWF0ZWsK
