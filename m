Return-Path: <SRS0=t3QX=MI=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.7 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3F0E7C07E95
	for <linux-mediatek@archiver.kernel.org>; Fri, 16 Jul 2021 06:28:24 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 038F6613EB
	for <linux-mediatek@archiver.kernel.org>; Fri, 16 Jul 2021 06:28:23 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 038F6613EB
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=BaUT/2vysk1xZRl2PB9y6AEjkUYzQwcurblbEPoFie8=; b=p9k5kkMSl+A4Dn
	Mdj6Clq3jM5n2VPZJpbjREhMzz52HTvuUO8bvXTRjxofB3c9J7ZWhJBnYc4cMLfZECdAix1cKBxm2
	PKhZT6y4+9LnmHyWZDv7gpxLi+VLgi0+yYjtUmgNkTxCskjDx6YjYekLITAXP48MJ6NFUhPR9CrLQ
	lDenJ9NLQkxgSJlN5E3LHeDIL6+cgq35+yiWh/lfI9DcQoONZ+5gF4exmIWNotjW0Od0BsJAeuKFA
	95BW4NUMMFkc3hwnVajaCeKQa3TUQtPIEBkwRa7OuED0DgWY9/cw3vfFRLKLbuFT0M0T/kVULOpSq
	lPEBb0TFTJncyhuCM3Mg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1m4HKT-003LQg-8Z; Fri, 16 Jul 2021 06:28:09 +0000
Received: from mail-oi1-x234.google.com ([2607:f8b0:4864:20::234])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1m4HKG-003LNy-61; Fri, 16 Jul 2021 06:27:57 +0000
Received: by mail-oi1-x234.google.com with SMTP id e11so6697555oii.9;
 Thu, 15 Jul 2021 23:27:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=K/pyrr7Vafmg+dkNK/O4hCihXyzzFOW/LxGI4Zbc87U=;
 b=nKg+jweLtsF6DxnI1wFe8sPeoOw4yVlgk4aoKvIxGpvd4YOFmuDEJfUkkTQoMeb29O
 rYAISCiiAD/mmXYVnMFsTAlxU9Zt+JcURj+/zn9RvOcNPzAQWqjw4WWMagtiXRT9rW8f
 3t3KyqtSRVdFc651gj8N+2hIA+P1leWO00tDnIAxahVYS0U41o/AIajj2M94MkYnkNLG
 7hZzktnK10sKmpPE2ETxzS5/ct3mtzrH/KEtjqk1tjLlZg0XUM7IQlVAwQUFFToHTb/V
 dkM0COa+TRxxyiFkU4qHUgnUfg/7dM6nuyVJ9Eae/WxX/hXG/biQfRHzLi3+Tc7lELmG
 G8eg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=K/pyrr7Vafmg+dkNK/O4hCihXyzzFOW/LxGI4Zbc87U=;
 b=AYcTZSphLwS0de4cbXQS7i16UsFJIgrkFhR2Wr5qWVXmmMtCyaFp7PmuG4XfzP7mLO
 WHz8tDNtcVxaOogUUGO+NdwvtgTqAIQRfeRzIkuBSva1+1kEjUwNaEc5tPGCq/Bk09nY
 ViZYSNGQovQkkQwJHu+1VTeoFouVgjrzU0qhwQcmG4RiVQqB+SYqs9RLYDB7h3C1r8ZQ
 UVg3TR9FkNsP9nsO1v66adMRmp86ONo5XzGijeSla+dwSlaiIqs1djjM36tcqdEIc8CO
 jF+nJU/tj0o065+Zq+URBcTOxnRDHp3ttr9ISWMA7BznR/PFq6LFoBtbUIhEQ4ak0Hsy
 3rdQ==
X-Gm-Message-State: AOAM53298Eng+dePl6IrwNWmTcyss2EtWAe98Fc4LDTFfOrWFxr5KZ00
 ZtiqRqGnP9o3pq4VgnBIAD43QDDqZiDs6Sn96yw=
X-Google-Smtp-Source: ABdhPJxW8kycciW2kOm+JGHD/kLp+IQUDWTe6n8MR0tec8pGCbiFVUh1ZLgFHcNOhWBaC4yavKTkFVMQqTeco1ceA1w=
X-Received: by 2002:a05:6808:bc1:: with SMTP id
 o1mr11285145oik.55.1626416874759; 
 Thu, 15 Jul 2021 23:27:54 -0700 (PDT)
MIME-Version: 1.0
References: <20210524152427.123856-1-gene.chen.richtek@gmail.com>
 <CAE+NS37kf1JAJ2Zt7UGsfsubp6O=xBNtnJgVEnz8-mm2rxFa+g@mail.gmail.com>
 <019cde8b-e4db-6ad4-fd71-5ed03f174da3@gmail.com>
In-Reply-To: <019cde8b-e4db-6ad4-fd71-5ed03f174da3@gmail.com>
From: Gene Chen <gene.chen.richtek@gmail.com>
Date: Fri, 16 Jul 2021 14:27:43 +0800
Message-ID: <CAE+NS34PLwP95=85r15_xHOPn-_OfdPWmXZ3MpHKEyO7StGpzw@mail.gmail.com>
Subject: Re: [PATCH v14 0/2] leds: mt6360: Add LED driver for MT6360
To: Jacek Anaszewski <jacek.anaszewski@gmail.com>
Cc: Pavel Machek <pavel@ucw.cz>, Matthias Brugger <matthias.bgg@gmail.com>,
 Dan Murphy <dmurphy@ti.com>, 
 Linux LED Subsystem <linux-leds@vger.kernel.org>, 
 linux-arm Mailing List <linux-arm-kernel@lists.infradead.org>, 
 "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Gene Chen <gene_chen@richtek.com>, 
 Wilma.Wu@mediatek.com, shufan_lee@richtek.com, 
 ChiYuan Huang <cy_huang@richtek.com>, benjamin.chao@mediatek.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210715_232756_284548_ED90AD15 
X-CRM114-Status: GOOD (  22.45  )
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

SmFjZWsgQW5hc3pld3NraSA8amFjZWsuYW5hc3pld3NraUBnbWFpbC5jb20+IOaWvCAyMDIx5bm0
N+aciDEz5pelIOmAseS6jCDkuIrljYg0OjI05a+r6YGT77yaCj4KPiBIaSBHZW5lLAo+Cj4gWW91
IHN0aWxsIGNhbiBjYXJyeSBteSBhY2s6Cj4KPiBBY2tlZC1ieTogSmFjZWsgQW5hc3pld3NraSA8
amFjZWsuYW5hc3pld3NraUBnbWFpbC5jb20+Cj4KCk9rLCB0aGFua3MuIEkgd2lsbCBhZGQgeW91
ciBhY2sgaW4gcGF0Y2ggdjE1LgoKPiBPbiA3LzEyLzIxIDEwOjMzIEFNLCBHZW5lIENoZW4gd3Jv
dGU6Cj4gPiBHZW5lIENoZW4gPGdlbmUuY2hlbi5yaWNodGVrQGdtYWlsLmNvbT4g5pa8IDIwMjHl
ubQ15pyIMjTml6Ug6YCx5LiAIOS4i+WNiDExOjI05a+r6YGT77yaCj4gPj4KPiA+PiBUaGlzIHBh
dGNoIHNlcmllcyBhZGQgTVQ2MzYwIExFRCBzdXBwb3J0IGNvbnRhaW5zIGRyaXZlciBhbmQgYmlu
ZGluZyBkb2N1bWVudAo+ID4+Cj4gPj4gR2VuZSBDaGVuICgyKQo+ID4+ICAgZHQtYmluZGluZ3M6
IGxlZHM6IEFkZCBiaW5kaW5ncyBmb3IgTVQ2MzYwIExFRAo+ID4+ICAgbGVkczogbXQ2MzYwOiBB
ZGQgTEVEIGRyaXZlciBmb3IgTVQ2MzYwCj4gPj4KPiA+PiAgIERvY3VtZW50YXRpb24vZGV2aWNl
dHJlZS9iaW5kaW5ncy9sZWRzL2xlZHMtbXQ2MzYwLnlhbWwgfCAgMTU5ICsrCj4gPj4gICBkcml2
ZXJzL2xlZHMvZmxhc2gvS2NvbmZpZyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIHwgICAx
Mwo+ID4+ICAgZHJpdmVycy9sZWRzL2ZsYXNoL01ha2VmaWxlICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICB8ICAgIDEKPiA+PiAgIGRyaXZlcnMvbGVkcy9mbGFzaC9sZWRzLW10NjM2MC5jICAg
ICAgICAgICAgICAgICAgICAgICAgfCAgOTEwICsrKysrKysrKysrKysrKysKPiA+PiAgIDQgZmls
ZXMgY2hhbmdlZCwgMTA4MyBpbnNlcnRpb25zKCspCj4gPj4KPiA+PiBjaGFuZ2Vsb2dzIGJldHdl
ZW4gdjEgJiB2Mgo+ID4+ICAgLSBhZGQgbGVkIGRyaXZlciB3aXRoIG1mZAo+ID4+Cj4gPj4gY2hh
bmdlbG9ncyBiZXR3ZWVuIHYyICYgdjMKPiA+PiAgIC0gaW5kZXBlbmRlbnQgYWRkIGxlZCBkcml2
ZXIKPiA+PiAgIC0gYWRkIGR0LWJpbmRpbmcgZG9jdW1lbnQKPiA+PiAgIC0gcmVmYWN0b3IgbWFj
cm9zIGRlZmluaXRpb24gZm9yIGVhc3kgdG8gZGVidWcKPiA+PiAgIC0gcGFyc2UgZGV2aWNlIHRy
ZWUgYnkgZndub2RlCj4gPj4gICAtIHVzZSBkZXZtKmV4dCB0byByZWdpc3RlciBsZWQgY2xhc3Mg
ZGV2aWNlCj4gPj4KPiA+PiBjaGFuZ2Vsb2dzIGJldHdlZW4gdjMgJiB2NAo+ID4+ICAgLSBmaXgg
YmluZGluZyBkb2N1bWVudCBkZXNjcmlwdGlvbgo+ID4+ICAgLSB1c2UgR0VOTUFTSyBhbmQgYWRk
IHVuaXQgcG9zdGZpeCB0byBkZWZpbml0aW9uCj4gPj4gICAtIGlzaW5rIHJlZ2lzdGVyIGxlZCBj
bGFzcyBkZXZpY2UKPiA+Pgo+ID4+IGNoYW5nZWxvZ3MgYmV0d2VlbiB2NCAmIHY1Cj4gPj4gICAt
IGNoYW5nZSByZ2IgaXNpbmsgdG8gbXVsdGljb2xvciBjb250cm9sCj4gPj4gICAtIGFkZCBiaW5k
aW5nIHJlZmVyZW5jZSB0byBtZmQgeWFtbAo+ID4+Cj4gPj4gY2hhbmdlbG9ncyBiZXR3ZWVuIHY1
ICYgdjYKPiA+PiAgIC0gVXNlIERUIHRvIGRlY2lkZSBSR0IgTEVEIGlzIG11bHRpY29sb3IgZGV2
aWNlIG9yIGluZGljYXRvciBkZXZpY2Ugb25seQo+ID4+Cj4gPj4gY2hhbmdlbG9ncyBiZXR3ZWVu
IHY2ICYgdjcKPiA+PiAgIC0gQWRkIGJpbmRpbmcgbXVsdGljb2xvciBkZXZpY2Ugc2FtcGxlIGNv
ZGUKPiA+PiAgIC0gQWRkIGZsYXNoIG9wcyBtdXRleCBsb2NrCj4gPj4gICAtIFJlbW92ZSBWNEwy
IGluaXQgd2l0aCBpbmRpY2F0b3IgZGV2aWNlCj4gPj4KPiA+PiBjaGFuZ2Vsb2dzIGJldHdlZW4g
djcgJiB2OAo+ID4+ICAgLSBBZGQgbXV0ZXggZm9yIGxlZCBmYXVsdCBnZXQgb3BzCj4gPj4gICAt
IEZpeCBmbGFzaCBhbmQgbXVsdGljb2xvciBuby1vcHMgcmV0dXJuIDAKPiA+PiAgIC0gQWRkIExF
RF9GVU5DVElPTl9NT09OTElHSFQKPiA+Pgo+ID4+IGNoYW5nZWxvZ3MgYmV0d2VlbiB2OCAmIHY5
Cj4gPj4gICAtIHJldXNlIGFwaSBpbiBmbGFzaCBhbmQgbXVsdGljb2xvciBoZWFkZXIKPiA+Pgo+
ID4+IGNoYW5nZWxvZ3MgYmV0d2VlbiB2OSAmIHYxMAo+ID4+ICAgLSBhZGQgY29tbWVudCBmb3Ig
cmV1c2UgcmVnaXN0cmF0aW9uIGZ1bmN0aW9ucyBpbiBmbGFzaCBhbmQgbXVsdGljb2xvcgo+ID4+
Cj4gPj4gY2hhbmdlbG9ncyBiZXR3ZWVuIHYxMCAmIHYxMQo+ID4+ICAgLSBtYXRjaCBkdC1iaW5k
aW5nIHJlZyBwcm9wZXJ0eSBjb21tZW50IHRvIHRoZSBmdW5jdGlvbmFsaXR5IG5hbWUKPiA+PiAg
IC0gcmVtb3ZlIGV4aXN0IHBhdGNoIGluIGxpbnV4LW5leHQKPiA+PiAgIC0gZGljaWRlIG11bHRp
Y29sb3IgY2hhbm5lbCBieSBjb2xvciBkZWZpbml0aWlvbgo+ID4+Cj4gPj4gY2hhbmdlbG9ncyBi
ZXR3ZWVuIHYxMSAmIHYxMgo+ID4+ICAgLSBGaXggcHJpbnQgc2l6ZV90IGJ5ICV6dQo+ID4+ICAg
LSBGaXggZHQtYmluZGluZyBuYW1lIHJlZ3VsYXIgZXhwZXJzc2lvbgo+ID4+Cj4gPj4gY2hhbmdl
bG9ncyBiZXR3ZWVuIHYxMiAmIHYxMwo+ID4+ICAgLSBGaXgga2J1aWxkIHRlc3QgcmVib3QgYnVp
bGQgZXJyb3IKPiA+Pgo+ID4+IGNoYW5nZWxvZ3MgYmV0d2VlbiB2MTMgJiB2MTQKPiA+PiAgIC0g
TW92ZSBkcml2ZXIgdG8gZmxhc2ggZm9sZGVyCj4gPj4gICAtIFJlbW92ZSBMRUQgRlVOQ1RJT04g
TU9PTkxJR0hUCj4gPj4gICAtIEtlZXAgODAgY2hhciBwZXIgbGluZQo+ID4+Cj4gPj4KPiA+Cj4g
PiBEZWFyIFJldmlld2VycywKPiA+Cj4gPiBQbGVhc2UgbGV0IG1lIGtub3cgaWYgYW55IHVwZGF0
ZS4KPiA+Cj4KPiAtLQo+IEJlc3QgcmVnYXJkcywKPiBKYWNlayBBbmFzemV3c2tpCgpfX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eC1tZWRpYXRlayBt
YWlsaW5nIGxpc3QKTGludXgtbWVkaWF0ZWtAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlz
dHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LW1lZGlhdGVrCg==
