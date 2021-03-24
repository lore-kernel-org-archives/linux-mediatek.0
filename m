Return-Path: <SRS0=Ntwg=IW=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,URIBL_BLOCKED,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0AB23C433DB
	for <linux-mediatek@archiver.kernel.org>; Wed, 24 Mar 2021 10:59:13 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8A558619B1
	for <linux-mediatek@archiver.kernel.org>; Wed, 24 Mar 2021 10:59:12 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 8A558619B1
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=collabora.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=t9plKp0Tn14wX9e7AupW4Dth3RJIQHI0I+dSC1/O4Jg=; b=EgzAPD/sK0xlfZjrsSbVcjyBT
	DiN9bV49q+ZTN40Vrz99mO9y4p1EneFjdbE8JlCwytf/2nDZaR+29Y5yj0rUeFcW36J8/095PQLEX
	AFVznn42v9JndykRjhgepzatN8i0/PdBq4zXBhO/MWpTQPw8THDbBrjYUHw2ob6qG7EziwoHx49xH
	Qcp4X3/gB+sNiLT7JkX/g+G9LZNv4zDnGTGcD9VQDW/CBQw41nI70AGf3vn7ckPZlQM3YzMWIgtUO
	6NZgy8asZYJNaivOGYJN/R5VYyrgTql9Xd2hnb/jrXR7Bh+9Hlx1wCP9UJmsJdayPdtCDrbvK8wD1
	rqSG7zMFQ==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lP1E3-00Gx9b-PI; Wed, 24 Mar 2021 10:59:00 +0000
Received: from bhuna.collabora.co.uk ([46.235.227.227])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lP1Dp-00Gx6n-S1; Wed, 24 Mar 2021 10:58:48 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1]) (Authenticated sender: rcn)
 with ESMTPSA id BE82D1F4598C
Date: Wed, 24 Mar 2021 11:58:41 +0100
From: Ricardo =?utf-8?Q?Ca=C3=B1uelo?= <ricardo.canuelo@collabora.com>
To: Hsin-Yi Wang <hsinyi@chromium.org>
Cc: linux-kernel@vger.kernel.org, Rob Herring <robh+dt@kernel.org>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Enric Balletbo i Serra <enric.balletbo@collabora.com>,
 Fabien Parent <fparent@baylibre.com>,
 Sean Wang <sean.wang@mediatek.com>, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, Ben Ho <Ben.Ho@mediatek.com>
Subject: Re: [PATCH v4 4/4] arm64: dts: mt8183: Add kukui-jacuzzi-juniper board
Message-ID: <20210324105841.anhogvmawrlpnyqy@rcn-XPS-13-9360>
Mail-Followup-To: Hsin-Yi Wang <hsinyi@chromium.org>,
 linux-kernel@vger.kernel.org, Rob Herring <robh+dt@kernel.org>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Enric Balletbo i Serra <enric.balletbo@collabora.com>,
 Fabien Parent <fparent@baylibre.com>,
 Sean Wang <sean.wang@mediatek.com>, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, Ben Ho <Ben.Ho@mediatek.com>
References: <20210319035245.2751911-1-hsinyi@chromium.org>
 <20210319035245.2751911-4-hsinyi@chromium.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210319035245.2751911-4-hsinyi@chromium.org>
User-Agent: NeoMutt/20171215
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210324_105845_988641_9E67E014 
X-CRM114-Status: UNSURE (   8.27  )
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

SGkgYWxsLAoKT24gdmllIDE5LTAzLTIwMjEgMTE6NTI6NDUsIEhzaW4tWWkgV2FuZyB3cm90ZToK
PiBKdW5pcGVyIGlzIGtub3duIGFzIEFjZXIgQ2hyb21lYm9vayBTcGluIDMxMSAoQ1AzMTEtM0gp
Lgo+IAo+IFNpZ25lZC1vZmYtYnk6IEhzaW4tWWkgV2FuZyA8aHNpbnlpQGNocm9taXVtLm9yZz4K
CkkgcGlja2VkIHRoaXMgcGF0Y2ggaW4gdGhlIGN1cnJlbnQgcmM0IGtlcm5lbCBhbmQgYm9vdGVk
IGl0IHN1Y2Nlc3NmdWxseQpvbiBhbiBBY2VyIENocm9tZWJvb2sgU3BpbiAzMTEgd2l0aCBubyBu
b3RpY2VhYmxlIHByb2JsZW1zLCBzbzoKClRlc3RlZC1ieTogUmljYXJkbyBDYcOxdWVsbyA8cmlj
YXJkby5jYW51ZWxvQGNvbGxhYm9yYS5jb20+CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fXwpMaW51eC1tZWRpYXRlayBtYWlsaW5nIGxpc3QKTGludXgtbWVk
aWF0ZWtAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWls
bWFuL2xpc3RpbmZvL2xpbnV4LW1lZGlhdGVrCg==
