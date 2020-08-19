Return-Path: <SRS0=3kTb=B5=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,URIBL_BLOCKED,USER_AGENT_SANE_2
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DBAC1C433DF
	for <linux-mediatek@archiver.kernel.org>; Wed, 19 Aug 2020 09:50:56 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A439620658
	for <linux-mediatek@archiver.kernel.org>; Wed, 19 Aug 2020 09:50:56 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="yDYFTEo0";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=mediatek.com header.i=@mediatek.com header.b="dO+ybYB+"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org A439620658
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=mediatek.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Date:To:From:
	Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=6RyIFuKAVR4CXqrcVx2O4j8E+1N4/ZyaJVlsaFFiYf4=; b=yDYFTEo0904Su+ZS/THI3BQk3
	RK0Xxs6pS1DCJ0/Y9qSewPSYfJPRvaqv2W+zR1oBNjuW+KcjkbchbcfDdsH57XKGCPa2dZwewsdiC
	VlSxHfs7SAC6jd2HK7iNUE1F8S0GXppG0jlhe7cthU3OEMbxo5oPISzXemInnRz9+87GTa5d/ZEsa
	qz30peTalHdliJzT06Kuo0AEUDR7UzbWAfH5bgWtGQV5pvJsF3+cWQsV1jFok49unX0QCIQm/+6rC
	P80QDXB85qGQRYsWQvigEPOTYDloRKk1fQNK6x9I6lFFr/ntCbTPaCfYdnbPjsiEZnOZYfFxkR3RW
	sUo4C6aIg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1k8Kk2-0000BM-O1; Wed, 19 Aug 2020 09:50:46 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1k8Kk0-0000AM-3t
 for linux-mediatek@lists.infradead.org; Wed, 19 Aug 2020 09:50:45 +0000
X-UUID: 89286ff8e125496b998d3b712801f0ec-20200819
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com;
 s=dk; 
 h=Content-Transfer-Encoding:MIME-Version:Content-Type:References:In-Reply-To:Date:CC:To:From:Subject:Message-ID;
 bh=uVPKfloKa5GwHkVwJn0RmJIN/Tl5KQ2eePuutn7nOAQ=; 
 b=dO+ybYB+ZMfqyhqSrEgUhWB1eHCNrnIY6xxoB3vofGTLCkPYzK6UTQ5+eX7J5fAjYkReioch2SFCdpfxTbheDMfYAHtdAJqlPmzqgKoFqByQrNJyroDW9XgOBdBoMgGxcQMUKJBwOvfvgIu3GWaW5hRnoKZeF/CAqdHthkbPO0w=;
X-UUID: 89286ff8e125496b998d3b712801f0ec-20200819
Received: from mtkcas66.mediatek.inc [(172.29.193.44)] by mailgw01.mediatek.com
 (envelope-from <landen.chao@mediatek.com>)
 (musrelay.mediatek.com ESMTP with TLS)
 with ESMTP id 714024912; Wed, 19 Aug 2020 01:50:39 -0800
Received: from mtkcas08.mediatek.inc (172.21.101.126) by
 MTKMBS62N2.mediatek.inc (172.29.193.42) with Microsoft SMTP Server (TLS) id
 15.0.1497.2; Wed, 19 Aug 2020 02:50:29 -0700
Received: from [172.21.84.99] (172.21.84.99) by mtkcas08.mediatek.inc
 (172.21.101.73) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Wed, 19 Aug 2020 17:50:28 +0800
Message-ID: <1597830629.31846.83.camel@mtksdccf07>
Subject: Re: [PATCH net-next v2 5/7] net: dsa: mt7530: Add the support of
 MT7531 switch
From: Landen Chao <landen.chao@mediatek.com>
To: Jakub Kicinski <kuba@kernel.org>
Date: Wed, 19 Aug 2020 17:50:29 +0800
In-Reply-To: <20200818082347.353fe926@kicinski-fedora-pc1c0hjn.dhcp.thefacebook.com>
References: <cover.1597729692.git.landen.chao@mediatek.com>
 <e980fda45e0fb478f55e72765643bb641f352c65.1597729692.git.landen.chao@mediatek.com>
 <20200818082347.353fe926@kicinski-fedora-pc1c0hjn.dhcp.thefacebook.com>
X-Mailer: Evolution 3.2.3-0ubuntu6 
MIME-Version: 1.0
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200819_055044_323142_E04E497A 
X-CRM114-Status: GOOD (  10.29  )
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
Cc: "mark.rutland@arm.com" <mark.rutland@arm.com>,
 "andrew@lunn.ch" <andrew@lunn.ch>,
 "frank-w@public-files.de" <frank-w@public-files.de>,
 "f.fainelli@gmail.com" <f.fainelli@gmail.com>,
 "dqfext@gmail.com" <dqfext@gmail.com>,
 "vivien.didelot@savoirfairelinux.com" <vivien.didelot@savoirfairelinux.com>,
 "netdev@vger.kernel.org" <netdev@vger.kernel.org>,
 Sean Wang <Sean.Wang@mediatek.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "opensource@vdorst.com" <opensource@vdorst.com>,
 "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 "robh+dt@kernel.org" <robh+dt@kernel.org>,
 "linux-mediatek@lists.infradead.org" <linux-mediatek@lists.infradead.org>,
 "matthias.bgg@gmail.com" <matthias.bgg@gmail.com>,
 "davem@davemloft.net" <davem@davemloft.net>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

SGkgSmFrdWIsDQoNClRoZXNlIDIgZnVuY3Rpb24gYXJlIHVzZWQgaW4gdGhlIHNhbWUgZmlsZSBv
bmx5Lg0KSSdsbCBmaXggd2FybmluZ3MgYnkgbWFraW5nIDIgZnVuY3Rpb25zICdzdGF0aWMnIGlu
IHYzLg0KDQpMYW5kZW4NCk9uIFR1ZSwgMjAyMC0wOC0xOCBhdCAyMzoyMyArMDgwMCwgSmFrdWIg
S2ljaW5za2kgd3JvdGU6DQpbc25pcF0NCj4gUGxlYXNlIGZpeCB0aGVzZSBXPTEgd2FybmluZ3M6
DQo+IA0KPiAuLi9kcml2ZXJzL25ldC9kc2EvbXQ3NTMwLmM6MTk3NjoxOiB3YXJuaW5nOiBubyBw
cmV2aW91cyBwcm90b3R5cGUgZm9yIOKAmG10NzUzMV9zZ21paV9saW5rX3VwX2ZvcmNl4oCZIFst
V21pc3NpbmctcHJvdG90eXBlc10NCj4gIDE5NzYgfCBtdDc1MzFfc2dtaWlfbGlua191cF9mb3Jj
ZShzdHJ1Y3QgZHNhX3N3aXRjaCAqZHMsIGludCBwb3J0LA0KPiAgICAgICB8IF5+fn5+fn5+fn5+
fn5+fn5+fn5+fn5+fn5+DQo+IC4uL2RyaXZlcnMvbmV0L2RzYS9tdDc1MzAuYzoyMDgxOjY6IHdh
cm5pbmc6IG5vIHByZXZpb3VzIHByb3RvdHlwZSBmb3Ig4oCYbXQ3NTMxX3NnbWlpX3Jlc3RhcnRf
YW7igJkgWy1XbWlzc2luZy1wcm90b3R5cGVzXQ0KPiAgMjA4MSB8IHZvaWQgbXQ3NTMxX3NnbWlp
X3Jlc3RhcnRfYW4oc3RydWN0IGRzYV9zd2l0Y2ggKmRzLCBpbnQgcG9ydCkNCj4gICAgICAgfCAg
ICAgIF5+fn5+fn5+fn5+fn5+fn5+fn5+fn5+DQo+IC4uL2RyaXZlcnMvbmV0L2RzYS9tdDc1MzAu
YzoxOTc2OjE6IHdhcm5pbmc6IHN5bWJvbCAnbXQ3NTMxX3NnbWlpX2xpbmtfdXBfZm9yY2UnIHdh
cyBub3QgZGVjbGFyZWQuIFNob3VsZCBpdCBiZSBzdGF0aWM/DQo+IC4uL2RyaXZlcnMvbmV0L2Rz
YS9tdDc1MzAuYzoyMDgxOjY6IHdhcm5pbmc6IHN5bWJvbCAnbXQ3NTMxX3NnbWlpX3Jlc3RhcnRf
YW4nIHdhcyBub3QgZGVjbGFyZWQuIFNob3VsZCBpdCBiZSBzdGF0aWM/DQoNCl9fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4LW1lZGlhdGVrIG1haWxp
bmcgbGlzdApMaW51eC1tZWRpYXRla0BsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5p
bmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtbWVkaWF0ZWsK
