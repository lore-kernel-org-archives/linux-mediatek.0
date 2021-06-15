Return-Path: <SRS0=q7ss=LJ=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,
	SPF_PASS autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 10859C48BE5
	for <linux-mediatek@archiver.kernel.org>; Tue, 15 Jun 2021 23:26:35 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9C94A608FC
	for <linux-mediatek@archiver.kernel.org>; Tue, 15 Jun 2021 23:26:34 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 9C94A608FC
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Vsw72tXpnwQn3gnh3cOQ++9DwrFhStkoN7omw/CyIEQ=; b=44rkOY4CT3kzSv
	ttvRxwxtff9fQ3ZFRssK3C8M0kguPm2kbUFdvRGBzPesR1GN3xTcMtG1KiHnd9eH0sZBBZp/0n+lF
	Me7bzcg2OIKD4uC7xmQmz1y8WFHy6HmE4/57DTHAliyJVGEr9jp9IZC3UaRFw/qj+UcUHLGom8TOv
	U2gOfvdcpeeGon3UPUYUDKuwuT9njzwhYQjH0wjZOxtZhJMBl74uYs+RKL6tAnXthSLhnKu2RHRlq
	5fsVB7MIJ/2K1vMCyoGNLW9y0vdRItb7EEmXs3In/ee4if7P7xwKLf10hnWvPZ7AzDwL84Fv9IPxJ
	/d8P4pqsZ7vWRHEf0WJw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ltIRo-003qxl-S5; Tue, 15 Jun 2021 23:26:20 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1ltI5x-003kxB-0X; Tue, 15 Jun 2021 23:03:46 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id 5F481613B3;
 Tue, 15 Jun 2021 23:03:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1623798224;
 bh=WBK8GrpEprcghWnNyrwT6kWzXp/Jz94GFIqC2zWgDrU=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=JXoMx6Y2oMLxMqKL7zqFlVWTitbKCiUckeputPz0XKOeRPd11tgbmF8IMT9k3Itie
 a8yy5bnccggqx1peCtnh6ghNE8kCi82VZ3h2SUfPdzQ4eCqrkFtvJH8upq7rCqY1cx
 1JHplTBdj3/Ui4bIt+e7TTg+nQ0EAwLF6hOza0eMww+OPYWiCm5NGZBkFSDbFep8JN
 lqC8uDv86aDNREX9+L1Si98ErCzbw9rEXP65PDw/9kJ4FW+odZglX+NLaCSlZYK/ng
 3AYwJ/KWRPdHzJ5g5JR5ne8/kxb4xlwgX/TUx4rPbqtZllI+wBIykTUTNWHlixrnwc
 SsFz9pN8BcZfQ==
Received: by mail-ej1-f54.google.com with SMTP id l1so437133ejb.6;
 Tue, 15 Jun 2021 16:03:44 -0700 (PDT)
X-Gm-Message-State: AOAM531sgEE+e4kYLOga2O9kLLEO6b8NLF4Ii2Udp182SeAf1sQLnzU0
 8rvvs7IxtWpmRJIdZGWI5PC2P7xdII3A0k0TWg==
X-Google-Smtp-Source: ABdhPJyisgkjgLkaN0APZhInDthw5akaPjM+7qJQBi6KzOQnueY8+xWAafZiP63UckFpAWPh5P503AOeKqS2A81d82w=
X-Received: by 2002:a17:906:9419:: with SMTP id
 q25mr1916674ejx.341.1623798222868; 
 Tue, 15 Jun 2021 16:03:42 -0700 (PDT)
MIME-Version: 1.0
References: <1623690937-52389-1-git-send-email-zhouyanjie@wanyeetech.com>
 <162370200625.25455.5879439335776203648.git-patchwork-notify@kernel.org>
In-Reply-To: <162370200625.25455.5879439335776203648.git-patchwork-notify@kernel.org>
From: Rob Herring <robh+dt@kernel.org>
Date: Tue, 15 Jun 2021 17:03:31 -0600
X-Gmail-Original-Message-ID: <CAL_JsqKEwrtZKK3viOzY8nW8fPmqnJO+WANvBfMzNYhg_aRrmg@mail.gmail.com>
Message-ID: <CAL_JsqKEwrtZKK3viOzY8nW8fPmqnJO+WANvBfMzNYhg_aRrmg@mail.gmail.com>
Subject: Re: [PATCH v3 0/2] Add Ingenic SoCs MAC support.
To: patchwork-bot+netdevbpf@kernel.org, David Miller <davem@davemloft.net>, 
 Jakub Kicinski <kuba@kernel.org>
Cc: Giuseppe CAVALLARO <peppe.cavallaro@st.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>, 
 Jose Abreu <joabreu@synopsys.com>, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 Alexandre Torgue <alexandre.torgue@st.com>, 
 netdev <netdev@vger.kernel.org>, devicetree@vger.kernel.org, 
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, 
 "moderated list:ARM/STM32 ARCHITECTURE"
 <linux-stm32@st-md-mailman.stormreply.com>, 
 linux-arm-kernel <linux-arm-kernel@lists.infradead.org>, 
 "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>,
 dongsheng.qiu@ingenic.com, 
 aric.pzqi@ingenic.com, rick.tyliu@ingenic.com, sihui.liu@ingenic.com, 
 jun.jiang@ingenic.com, sernia.zhou@foxmail.com, 
 =?UTF-8?B?5ZGo55Cw5p2wIChaaG91IFlhbmppZSk=?= <zhouyanjie@wanyeetech.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210615_160345_120325_82BA55CC 
X-CRM114-Status: GOOD (  15.40  )
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

T24gTW9uLCBKdW4gMTQsIDIwMjEgYXQgMjoyMCBQTSA8cGF0Y2h3b3JrLWJvdCtuZXRkZXZicGZA
a2VybmVsLm9yZz4gd3JvdGU6Cj4KPiBIZWxsbzoKPgo+IFRoaXMgc2VyaWVzIHdhcyBhcHBsaWVk
IHRvIG5ldGRldi9uZXQtbmV4dC5naXQgKHJlZnMvaGVhZHMvbWFzdGVyKToKPgo+IE9uIFR1ZSwg
MTUgSnVuIDIwMjEgMDE6MTU6MzUgKzA4MDAgeW91IHdyb3RlOgo+ID4gdjItPnYzOgo+ID4gMS5B
ZGQgImluZ2VuaWMsbWFjLnlhbWwiIGZvciBJbmdlbmljIFNvQ3MuCj4gPiAyLkNoYW5nZSB0eCBj
bGsgZGVsYXkgYW5kIHJ4IGNsayBkZWxheSBmcm9tIGhhcmR3YXJlIHZhbHVlIHRvIHBzLgo+ID4g
My5yZXR1cm4gLUVJTlZBTCB3aGVuIGEgdW5zdXBwb3J0ZWQgdmFsdWUgaXMgZW5jb3VudGVyZWQg
d2hlbgo+ID4gICBwYXJzaW5nIHRoZSBiaW5kaW5nLgo+ID4gNC5TaW1wbGlmeSB0aGUgY29kZSBv
ZiB0aGUgUkdNSUkgcGFydCBvZiBYMjAwMCBTb0MgYWNjb3JkaW5nIHRvCj4gPiAgIEFuZHJldyBM
dW5u4oCZcyBzdWdnZXN0aW9uLgo+ID4gNS5Gb2xsb3cgdGhlIGV4YW1wbGUgb2YgImR3bWFjLW1l
ZGlhdGVrLmMiIHRvIGltcHJvdmUgdGhlIGNvZGUKPiA+ICAgdGhhdCBoYW5kbGVzIGRlbGF5cyBh
Y2NvcmRpbmcgdG8gQW5kcmV3IEx1bm7igJlzIHN1Z2dlc3Rpb24uCj4gPgo+ID4gWy4uLl0KPgo+
IEhlcmUgaXMgdGhlIHN1bW1hcnkgd2l0aCBsaW5rczoKPiAgIC0gW3YzLDEvMl0gZHQtYmluZGlu
Z3M6IGR3bWFjOiBBZGQgYmluZGluZ3MgZm9yIG5ldyBJbmdlbmljIFNvQ3MuCj4gICAgIGh0dHBz
Oi8vZ2l0Lmtlcm5lbC5vcmcvbmV0ZGV2L25ldC1uZXh0L2MvM2I4NDAxMDY2ZTVhCj4gICAtIFt2
MywyLzJdIG5ldDogc3RtbWFjOiBBZGQgSW5nZW5pYyBTb0NzIE1BQyBzdXBwb3J0Lgo+ICAgICBo
dHRwczovL2dpdC5rZXJuZWwub3JnL25ldGRldi9uZXQtbmV4dC9jLzJiYjRiOThiNjBkNwoKUGVy
aGFwcyAzIGhvdXJzIGlzIG5vdCBzdWZmaWNpZW50IHRpbWUgdG8gcmV2aWV3LiBJdCBtYXkgYmUg
YSB2MywgYnV0CnRoZSBiaW5kaW5nIGFwcGVhcnMgdG8gaGF2ZSBjaGFuZ2VkIHF1aXRlIGEgYml0
IGluIGFkZGl0aW9uIHRvIGJlaW5nCmJyb2tlbi4KClJvYgoKX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXgtbWVkaWF0ZWsgbWFpbGluZyBsaXN0Ckxp
bnV4LW1lZGlhdGVrQGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5v
cmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1tZWRpYXRlawo=
