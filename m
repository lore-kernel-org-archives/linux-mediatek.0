Return-Path: <SRS0=I1M+=LI=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4CE7DC2B9F4
	for <linux-mediatek@archiver.kernel.org>; Mon, 14 Jun 2021 20:21:53 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 13D0C60FEA
	for <linux-mediatek@archiver.kernel.org>; Mon, 14 Jun 2021 20:21:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 13D0C60FEA
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Date:
	Message-Id:From:Subject:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ZP8xZWEjjC2LZIt/TqlywG2XY9Vn8RbiOwr+bjGg2qo=; b=3DouqsBsqki+TP
	lESbvz3xKhFkIgtfRNDjxkl48d7L14XB4mhn4XFo4CtC1uPFjtow9HPzpvZHwGXAMejJU1hEoTawA
	YxanbS1kVEJlqaIYy1WlhvVUrjnCEr0oAOUYkzQcw6uPYI0Ox/ydV+UB+gYyixprAUHKSVSWYBE95
	65C9tV/C7/W3WLayGOWIBe8rc5/iHpOxYEz0L9flx+by1vgpEhV/YnkytPxL/IMz1eyyXdAwkaKJt
	+BsjwAXFGvL1p9TZ6b5yw+g3pQPsqn+rJkRa86g8JajoDQqbkBKPUjYZFU86AmQz59f64XJ17bhU7
	mWfnimltOkl4kYqM4/ZQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1lst5X-00G4gX-3L; Mon, 14 Jun 2021 20:21:39 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1lst43-00G3wq-B0; Mon, 14 Jun 2021 20:20:08 +0000
Received: by mail.kernel.org (Postfix) with ESMTPS id 4FF5C61356;
 Mon, 14 Jun 2021 20:20:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1623702006;
 bh=XOJ3V4TTGOTaNvJ/moAVHGooICyKoo2oFs2dvhRYbdo=;
 h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
 b=Dw/3WhgnC5kqsYSdedfqedS+a+v1Coo7MXZGGQwR0amcs6rDA0o3I60TljQW4r54Z
 AZJEpK/Zd7cFHxUSTDBKoIl1yznyAEFmperHBkJff+zDCP7BVXHHEi2DIViMKTN3Lc
 J2Uezqsc0UsFEcbr//WAvT39jeZ+QfuctvlFQdiexoJ/C91rM70McFFTTL8U0ufjPQ
 w25Ms7XPMwXxzzbkaWMES2rQ3W5LPtfTUQlPfDVsoYH0Bx2bk0rshmZKVOvDdb6olO
 i9gAWaXSeKB5MdARn9IAlh1WwaqZoCTqn/yfepFv9c9f5TB+WZt+4jZaI668owdsrN
 o5lQ8UEMTNfUg==
MIME-Version: 1.0
Subject: Re: [PATCH v3 0/2] Add Ingenic SoCs MAC support.
From: patchwork-bot+netdevbpf@kernel.org
Message-Id: <162370200625.25455.5879439335776203648.git-patchwork-notify@kernel.org>
Date: Mon, 14 Jun 2021 20:20:06 +0000
References: <1623690937-52389-1-git-send-email-zhouyanjie@wanyeetech.com>
In-Reply-To: <1623690937-52389-1-git-send-email-zhouyanjie@wanyeetech.com>
To: =?utf-8?b?5ZGo55Cw5p2wIChaaG91IFlhbmppZSkgPHpob3V5YW5qaWVAd2FueWVldGVjaC5j?=@ci.codeaurora.org,
 =?utf-8?b?b20+?=@ci.codeaurora.org
Cc: davem@davemloft.net, kuba@kernel.org, robh+dt@kernel.org,
 peppe.cavallaro@st.com, alexandre.torgue@foss.st.com, joabreu@synopsys.com,
 mcoquelin.stm32@gmail.com, matthias.bgg@gmail.com, alexandre.torgue@st.com,
 netdev@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 dongsheng.qiu@ingenic.com, aric.pzqi@ingenic.com, rick.tyliu@ingenic.com,
 sihui.liu@ingenic.com, jun.jiang@ingenic.com, sernia.zhou@foxmail.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210614_132007_457479_73ED20FE 
X-CRM114-Status: UNSURE (   8.01  )
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

SGVsbG86CgpUaGlzIHNlcmllcyB3YXMgYXBwbGllZCB0byBuZXRkZXYvbmV0LW5leHQuZ2l0IChy
ZWZzL2hlYWRzL21hc3Rlcik6CgpPbiBUdWUsIDE1IEp1biAyMDIxIDAxOjE1OjM1ICswODAwIHlv
dSB3cm90ZToKPiB2Mi0+djM6Cj4gMS5BZGQgImluZ2VuaWMsbWFjLnlhbWwiIGZvciBJbmdlbmlj
IFNvQ3MuCj4gMi5DaGFuZ2UgdHggY2xrIGRlbGF5IGFuZCByeCBjbGsgZGVsYXkgZnJvbSBoYXJk
d2FyZSB2YWx1ZSB0byBwcy4KPiAzLnJldHVybiAtRUlOVkFMIHdoZW4gYSB1bnN1cHBvcnRlZCB2
YWx1ZSBpcyBlbmNvdW50ZXJlZCB3aGVuCj4gICBwYXJzaW5nIHRoZSBiaW5kaW5nLgo+IDQuU2lt
cGxpZnkgdGhlIGNvZGUgb2YgdGhlIFJHTUlJIHBhcnQgb2YgWDIwMDAgU29DIGFjY29yZGluZyB0
bwo+ICAgQW5kcmV3IEx1bm7igJlzIHN1Z2dlc3Rpb24uCj4gNS5Gb2xsb3cgdGhlIGV4YW1wbGUg
b2YgImR3bWFjLW1lZGlhdGVrLmMiIHRvIGltcHJvdmUgdGhlIGNvZGUKPiAgIHRoYXQgaGFuZGxl
cyBkZWxheXMgYWNjb3JkaW5nIHRvIEFuZHJldyBMdW5u4oCZcyBzdWdnZXN0aW9uLgo+IAo+IFsu
Li5dCgpIZXJlIGlzIHRoZSBzdW1tYXJ5IHdpdGggbGlua3M6CiAgLSBbdjMsMS8yXSBkdC1iaW5k
aW5nczogZHdtYWM6IEFkZCBiaW5kaW5ncyBmb3IgbmV3IEluZ2VuaWMgU29Dcy4KICAgIGh0dHBz
Oi8vZ2l0Lmtlcm5lbC5vcmcvbmV0ZGV2L25ldC1uZXh0L2MvM2I4NDAxMDY2ZTVhCiAgLSBbdjMs
Mi8yXSBuZXQ6IHN0bW1hYzogQWRkIEluZ2VuaWMgU29DcyBNQUMgc3VwcG9ydC4KICAgIGh0dHBz
Oi8vZ2l0Lmtlcm5lbC5vcmcvbmV0ZGV2L25ldC1uZXh0L2MvMmJiNGI5OGI2MGQ3CgpZb3UgYXJl
IGF3ZXNvbWUsIHRoYW5rIHlvdSEKLS0KRGVldC1kb290LWRvdCwgSSBhbSBhIGJvdC4KaHR0cHM6
Ly9rb3JnLmRvY3Mua2VybmVsLm9yZy9wYXRjaHdvcmsvcHdib3QuaHRtbAoKCgpfX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eC1tZWRpYXRlayBtYWls
aW5nIGxpc3QKTGludXgtbWVkaWF0ZWtAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMu
aW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LW1lZGlhdGVrCg==
