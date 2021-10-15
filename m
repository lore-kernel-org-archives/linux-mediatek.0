Return-Path: <SRS0=QAkp=PD=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A7D01C433EF
	for <linux-mediatek@archiver.kernel.org>; Fri, 15 Oct 2021 23:43:09 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7163260F39
	for <linux-mediatek@archiver.kernel.org>; Fri, 15 Oct 2021 23:43:09 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 7163260F39
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=UZAOpfjyY516cE/Qd/wGIrTSEN9vHHQ2GIi08s0YiCE=; b=LMO+8pTqLZA4o/
	oQkErWSRD1VUIC9/AVsJxrObZZV9KsaoPkfMGwAl0STQd1iV+WEv0+0bHAQ/lNYfomokmyO8P0nQt
	xdXneL/XbrFHvdWcSANZ7iS0ctKV425hs0t2lWbU6heqYXH3OFbkEXsMzO3dcfg/h4XPmDCvvmg1p
	WsNqbMjesc2HCSwTXOvZZW8afMsdOrC56R0yNGUCvYUnu/bouYixmJ4ea2RVo7k48dQxVOzduitBx
	TrE7aZEXdnkxrizlXcIVJCt3YErkl+WSydnfjQ4SA2uTweEPdEytp0nnbsG40LjQ8tIb8qq+iAts/
	Txv4fzl8bOO3V0SL6Dww==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mbWqq-009AIa-Dg; Fri, 15 Oct 2021 23:43:00 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mbWpx-009A45-D3; Fri, 15 Oct 2021 23:42:06 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id E6B54611C1;
 Fri, 15 Oct 2021 23:42:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1634341324;
 bh=s/EKmy4kdrec5wksozYJUijeVa7Z4VkDJ4Jz3S63i6g=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=HWOTazNEmWXmflTU4ywm4CJw1r7kVV8XwRuOJUSLHV3/5S7I8jMMvszvF2fC5WQXP
 z/YkyJWuLWvOsTubnysoIbdN57ujTVO1zHTqsZk8VdtA8X1kdyCiJI3gGc5JW6VXvt
 6f0OBhDeghrUvlIfp+UEJcBOwa77RtvmwNO6HHiyYOYAUrowh9OP54zS7yZRxULQDl
 OELv3W3zuIiXeWLUGJrl1UktkFRlQZLTkO+v0ouffDDX/X7X8CSnENIYaq0h/c64Yb
 ckT6TWzW3OOvL83u6wVvrX6CKWbKx7ncUbWsa3EoX0XriCow02rV4zqV/s8JtWicJT
 nuYFlVOyGJwCg==
Received: by mail-ed1-f53.google.com with SMTP id a25so44009031edx.8;
 Fri, 15 Oct 2021 16:42:04 -0700 (PDT)
X-Gm-Message-State: AOAM53275eFoPszk9GsjS+CKxoyFJ0s0rqv+juq5xWy+G7gqmrvvLDLk
 coIRax6FHFcVO3KxMQtgh5sj8eEQXVVMSNyusw==
X-Google-Smtp-Source: ABdhPJyifvWmqLk+jf2zlKQO8auioR0IRMCDcZBa/PLm7kRW/yXYG9c21iyijoGl/XAXZ85nuyr2xQmP2KuizDr574k=
X-Received: by 2002:a50:9993:: with SMTP id m19mr21431023edb.357.1634341323225; 
 Fri, 15 Oct 2021 16:42:03 -0700 (PDT)
MIME-Version: 1.0
References: <20211004062140.29803-1-nancy.lin@mediatek.com>
 <20211004062140.29803-5-nancy.lin@mediatek.com>
In-Reply-To: <20211004062140.29803-5-nancy.lin@mediatek.com>
From: Chun-Kuang Hu <chunkuang.hu@kernel.org>
Date: Sat, 16 Oct 2021 07:41:52 +0800
X-Gmail-Original-Message-ID: <CAAOTY_-9JdZfzF49E81Z046w=t0wDW7DScsVQQ2-L72mLXbjdg@mail.gmail.com>
Message-ID: <CAAOTY_-9JdZfzF49E81Z046w=t0wDW7DScsVQQ2-L72mLXbjdg@mail.gmail.com>
Subject: Re: [PATCH v6 04/16] dt-bindings: reset: mt8195: add vdosys1 reset
 control bit
To: "Nancy.Lin" <nancy.lin@mediatek.com>
Cc: CK Hu <ck.hu@mediatek.com>, Chun-Kuang Hu <chunkuang.hu@kernel.org>, 
 Philipp Zabel <p.zabel@pengutronix.de>, David Airlie <airlied@linux.ie>, 
 Daniel Vetter <daniel@ffwll.ch>, Rob Herring <robh+dt@kernel.org>, 
 Matthias Brugger <matthias.bgg@gmail.com>,
 "jason-jh . lin" <jason-jh.lin@mediatek.com>, 
 Yongqiang Niu <yongqiang.niu@mediatek.com>, 
 DRI Development <dri-devel@lists.freedesktop.org>, 
 "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>,
 DTML <devicetree@vger.kernel.org>, 
 linux-kernel <linux-kernel@vger.kernel.org>, 
 Linux ARM <linux-arm-kernel@lists.infradead.org>, singo.chang@mediatek.com, 
 srv_heupstream <srv_heupstream@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211015_164205_509326_264FEFCC 
X-CRM114-Status: GOOD (  11.76  )
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

SGksIE5hbmN5OgoKTmFuY3kuTGluIDxuYW5jeS5saW5AbWVkaWF0ZWsuY29tPiDmlrwgMjAyMeW5
tDEw5pyINOaXpSDpgLHkuIAg5LiL5Y2IMjoyMeWvq+mBk++8mgo+Cj4gQWRkIHZkb3N5czEgcmVz
ZXQgY29udHJvbCBiaXQgZm9yIE1UODE5NSBwbGF0Zm9ybS4KClJldmlld2VkLWJ5OiBDaHVuLUt1
YW5nIEh1IDxjaHVua3VhbmcuaHVAa2VybmVsLm9yZz4KCj4KPiBTaWduZWQtb2ZmLWJ5OiBOYW5j
eS5MaW4gPG5hbmN5LmxpbkBtZWRpYXRlay5jb20+Cj4gLS0tCj4gIGluY2x1ZGUvZHQtYmluZGlu
Z3MvcmVzZXQvbXQ4MTk1LXJlc2V0cy5oIHwgMTIgKysrKysrKysrKysrCj4gIDEgZmlsZSBjaGFu
Z2VkLCAxMiBpbnNlcnRpb25zKCspCj4KPiBkaWZmIC0tZ2l0IGEvaW5jbHVkZS9kdC1iaW5kaW5n
cy9yZXNldC9tdDgxOTUtcmVzZXRzLmggYi9pbmNsdWRlL2R0LWJpbmRpbmdzL3Jlc2V0L210ODE5
NS1yZXNldHMuaAo+IGluZGV4IGEyNmJjY2M4Yjk1Ny4uYWFiOGQ3NDQ5NmE2IDEwMDY0NAo+IC0t
LSBhL2luY2x1ZGUvZHQtYmluZGluZ3MvcmVzZXQvbXQ4MTk1LXJlc2V0cy5oCj4gKysrIGIvaW5j
bHVkZS9kdC1iaW5kaW5ncy9yZXNldC9tdDgxOTUtcmVzZXRzLmgKPiBAQCAtMjYsNCArMjYsMTYg
QEAKPgo+ICAjZGVmaW5lIE1UODE5NV9UT1BSR1VfU1dfUlNUX05VTSAgICAgICAgICAgICAgIDE2
Cj4KPiArLyogVkRPU1lTMSAqLwo+ICsjZGVmaW5lIE1UODE5NV9WRE9TWVMxX1NXMF9SU1RfQl9N
RVJHRTBfRExfQVNZTkMgICAgICAgICAgMjUKPiArI2RlZmluZSBNVDgxOTVfVkRPU1lTMV9TVzBf
UlNUX0JfTUVSR0UxX0RMX0FTWU5DICAgICAgICAgIDI2Cj4gKyNkZWZpbmUgTVQ4MTk1X1ZET1NZ
UzFfU1cwX1JTVF9CX01FUkdFMl9ETF9BU1lOQyAgICAgICAgICAyNwo+ICsjZGVmaW5lIE1UODE5
NV9WRE9TWVMxX1NXMF9SU1RfQl9NRVJHRTNfRExfQVNZTkMgICAgICAgICAgMjgKPiArI2RlZmlu
ZSBNVDgxOTVfVkRPU1lTMV9TVzBfUlNUX0JfTUVSR0U0X0RMX0FTWU5DICAgICAgICAgIDI5Cj4g
KyNkZWZpbmUgTVQ4MTk1X1ZET1NZUzFfU1cxX1JTVF9CX0hEUl9WRE9fRkUwX0RMX0FTWU5DICAg
ICA1MQo+ICsjZGVmaW5lIE1UODE5NV9WRE9TWVMxX1NXMV9SU1RfQl9IRFJfVkRPX0ZFMV9ETF9B
U1lOQyAgICAgNTIKPiArI2RlZmluZSBNVDgxOTVfVkRPU1lTMV9TVzFfUlNUX0JfSERSX0dGWF9G
RTBfRExfQVNZTkMgICAgIDUzCj4gKyNkZWZpbmUgTVQ4MTk1X1ZET1NZUzFfU1cxX1JTVF9CX0hE
Ul9HRlhfRkUxX0RMX0FTWU5DICAgICA1NAo+ICsjZGVmaW5lIE1UODE5NV9WRE9TWVMxX1NXMV9S
U1RfQl9IRFJfVkRPX0JFX0RMX0FTWU5DICAgICAgNTUKPiArCj4gICNlbmRpZiAgLyogX0RUX0JJ
TkRJTkdTX1JFU0VUX0NPTlRST0xMRVJfTVQ4MTk1ICovCj4gLS0KPiAyLjE4LjAKPgoKX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXgtbWVkaWF0ZWsg
bWFpbGluZyBsaXN0CkxpbnV4LW1lZGlhdGVrQGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xp
c3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1tZWRpYXRlawo=
