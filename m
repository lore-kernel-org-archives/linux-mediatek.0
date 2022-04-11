Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 56B8DC433F5
	for <linux-mediatek@archiver.kernel.org>; Mon, 11 Apr 2022 09:47:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Date:Message-Id:MIME-Version:Subject:Cc
	:To:From:References:In-Reply-To:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=vmtifnIL3wNOo6LfR7tWmec2B24wkdEiWHFNCJ7YJec=; b=y39bJyj14vjOFg
	HOMDRu/H1hdvbTCws+wgQ2y3r7n3XYRhFA9UKcp0QzZO4LrBYgExtE2iSxe7q+ckMP/oX95GkLqMy
	hNfuSZ+HW7ayqUXt4QFFvZyLstx8fjwUOKCj1WiLJrKyZT62VI14vWBloAh63Rq1n1PxWTHE+S8yr
	uHNdJep4kT9GcpAzZeT4I8hIvqilZHtoAbLpXy9vRY3ldoo7iOwMfnjZrqZgSE/6CCfPzsMqmvMUD
	4ARWUweNZykwu/GjOTEyf2AUae7HCwAi8RcTjA3BEtD0RrBYYDfN7JNXuZCkvf3+/T1PaUn9qK19B
	fAzXeZS7BKH73jr/Mz7A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ndqdi-0081BZ-61; Mon, 11 Apr 2022 09:47:18 +0000
Received: from pandora.armlinux.org.uk ([2001:4d48:ad52:32c8:5054:ff:fe00:142])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1ndqcj-0080eG-1s; Mon, 11 Apr 2022 09:46:18 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=armlinux.org.uk; s=pandora-2019; h=Date:Sender:Message-Id:Content-Type:
 Content-Transfer-Encoding:MIME-Version:Subject:Cc:To:From:References:
 In-Reply-To:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
 Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
 List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=/QFgek31WZKKhHIeYB7HtM9AIlDa5tiHe5pdziNT4u0=; b=x7pB4/9Cxkj1cGo9pmbgIMg4E8
 GvddEiWDNj8tQqDYAVRaDCSGU5s1pSE2GeFnbsL1pZ3tZdzO8DYQ1HINlJ5GFMngYniY7KLJMdRKN
 pOGXGmEQzZq+9bhVHCJt8IBC07JZ1Axw8o20dp92SPUNDNpOM86Vf5BlWmjk3IxdiXpoFTGHF2flI
 BS7jpt6r4gsNaJ/H+ZcwgQzjSY2wvTBlfd/+ql+K5kd/WO/V3j1uXPow/DYyTcV/6rHz1RxjLLCXt
 wgMSHyfYBSwCLdjb8c5D7cinYKvsIeyW30/2jGlr6rxXtqyzd1UnucIqndQCZIhzI5wS3o5gHqtY2
 BZ4MZsYg==;
Received: from e0022681537dd.dyn.armlinux.org.uk
 ([fd8f:7570:feb6:1:222:68ff:fe15:37dd]:52856 helo=rmk-PC.armlinux.org.uk)
 by pandora.armlinux.org.uk with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <rmk@armlinux.org.uk>)
 id 1ndqce-0000Gq-W0; Mon, 11 Apr 2022 10:46:12 +0100
Received: from rmk by rmk-PC.armlinux.org.uk with local (Exim 4.94.2)
 (envelope-from <rmk@rmk-PC.armlinux.org.uk>)
 id 1ndqce-0055Qv-3L; Mon, 11 Apr 2022 10:46:12 +0100
In-Reply-To: <YlP4vGKVrlIJUUHK@shell.armlinux.org.uk>
References: <YlP4vGKVrlIJUUHK@shell.armlinux.org.uk>
From: "Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>
To: Landen Chao <Landen.Chao@mediatek.com>, DENG Qingfang <dqfext@gmail.com>,
 Sean Wang <sean.wang@mediatek.com>
Cc: Andrew Lunn <andrew@lunn.ch>, Vivien Didelot <vivien.didelot@gmail.com>,
 Florian Fainelli <f.fainelli@gmail.com>,
 Vladimir Oltean <olteanv@gmail.com>,
 "David S. Miller" <davem@davemloft.net>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, Matthias Brugger <matthias.bgg@gmail.com>,
 netdev@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org
Subject: [PATCH net-next v2 4/9] net: dsa: mt7530: drop use of
 phylink_helper_basex_speed()
MIME-Version: 1.0
MIME-Version: 1.0
Content-Disposition: inline
Message-Id: <E1ndqce-0055Qv-3L@rmk-PC.armlinux.org.uk>
Date: Mon, 11 Apr 2022 10:46:12 +0100
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220411_024617_143894_046CA9B4 
X-CRM114-Status: UNSURE (   9.86  )
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

Tm93IHRoYXQgd2UgaGF2ZSBhIGJldHRlciBtZXRob2QgdG8gc2VsZWN0IFNGUCBpbnRlcmZhY2Ug
bW9kZXMsIHdlCm5vIGxvbmdlciBuZWVkIHRvIHVzZSBwaHlsaW5rX2hlbHBlcl9iYXNleF9zcGVl
ZCgpIGluIGEgZHJpdmVyJ3MKdmFsaWRhdGlvbiBmdW5jdGlvbi4KClRlc3RlZC1ieTogTWFyZWsg
QmVow7puIDxrYWJlbEBrZXJuZWwub3JnPgpTaWduZWQtb2ZmLWJ5OiBSdXNzZWxsIEtpbmcgKE9y
YWNsZSkgPHJtaytrZXJuZWxAYXJtbGludXgub3JnLnVrPgotLS0KIGRyaXZlcnMvbmV0L2RzYS9t
dDc1MzAuYyB8IDUgLS0tLS0KIDEgZmlsZSBjaGFuZ2VkLCA1IGRlbGV0aW9ucygtKQoKZGlmZiAt
LWdpdCBhL2RyaXZlcnMvbmV0L2RzYS9tdDc1MzAuYyBiL2RyaXZlcnMvbmV0L2RzYS9tdDc1MzAu
YwppbmRleCA0ZmRkNzVlODhiMWIuLmRlOWNmZDIwY2NiZiAxMDA2NDQKLS0tIGEvZHJpdmVycy9u
ZXQvZHNhL210NzUzMC5jCisrKyBiL2RyaXZlcnMvbmV0L2RzYS9tdDc1MzAuYwpAQCAtMjk0Niwx
MSArMjk0Niw2IEBAIG10NzUzeF9waHlsaW5rX3ZhbGlkYXRlKHN0cnVjdCBkc2Ffc3dpdGNoICpk
cywgaW50IHBvcnQsCiAKIAlsaW5rbW9kZV9hbmQoc3VwcG9ydGVkLCBzdXBwb3J0ZWQsIG1hc2sp
OwogCWxpbmttb2RlX2FuZChzdGF0ZS0+YWR2ZXJ0aXNpbmcsIHN0YXRlLT5hZHZlcnRpc2luZywg
bWFzayk7Ci0KLQkvKiBXZSBjYW4gb25seSBvcGVyYXRlIGF0IDI1MDBCYXNlWCBvciAxMDAwQmFz
ZVguICBJZiByZXF1ZXN0ZWQKLQkgKiB0byBhZHZlcnRpc2UgYm90aCwgb25seSByZXBvcnQgYWR2
ZXJ0aXNpbmcgYXQgMjUwMEJhc2VYLgotCSAqLwotCXBoeWxpbmtfaGVscGVyX2Jhc2V4X3NwZWVk
KHN0YXRlKTsKIH0KIAogc3RhdGljIGludAotLSAKMi4zMC4yCgoKX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXgtbWVkaWF0ZWsgbWFpbGluZyBsaXN0
CkxpbnV4LW1lZGlhdGVrQGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVh
ZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1tZWRpYXRlawo=
