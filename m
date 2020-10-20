Return-Path: <SRS0=YCpt=D3=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.5 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 67FFEC433DF
	for <linux-mediatek@archiver.kernel.org>; Tue, 20 Oct 2020 06:44:33 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 0AC662237B
	for <linux-mediatek@archiver.kernel.org>; Tue, 20 Oct 2020 06:44:32 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="DKaOKOAV";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="rE9NI/S/"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 0AC662237B
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=yCpReQ2Yamqu1mLv1geQrdH/xC5KeOhwIKAsRmq9YlQ=; b=DKaOKOAVb1UfMIWCXWvf0sKEC
	/Rx3h7KEd8zwcQKN4xbLmtDno16/IYBsYrJmU4Jt4q/YwOaWMDgx5mjjtWTGvVfLunxpCQwr3b2Ok
	lQ46WZqkwZn2VUUw8vTI/SEq7j9eAWUsoHNqZGW+CpahEccnh15JPNLTzIN3YQvVpXXnBgYHcRaUM
	GWJH3cJvN6ldmcOkJXqGV5yRxchAkkDlMvoK3u7KvG/wvGKQbMYaK1AxtRhhMe5blOP5lXY/jDO89
	B5ID69rXiM53U2+rnJGN7PxEagxCaXSaukNQqHrAlCr2BJlzFzBcKNvTpCnl5rch2ZA0XLjlDP+iG
	Ji1R8FKyA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kUlNf-0005Rj-Jl; Tue, 20 Oct 2020 06:44:23 +0000
Received: from mail-oi1-x243.google.com ([2607:f8b0:4864:20::243])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kUlNb-0005QR-UL; Tue, 20 Oct 2020 06:44:20 +0000
Received: by mail-oi1-x243.google.com with SMTP id u127so1075575oib.6;
 Mon, 19 Oct 2020 23:44:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=MFOC5MSfgXpVUcpJFvepm9LoCBUyxU58dQ3kENmA2dU=;
 b=rE9NI/S/p9SvnsP2ThZmuLSQCes4KW77g+ZROKqi9zQ4BRyD7j8L3qAXRGY48tDEXB
 DVCVdi+bIimBHadB2S37aNu3DzzFKphM/kG45PJO7l+kd734QFl9innU/HfWG6kCwDzw
 l0HKuSwIx5NEiJnNS2n4U3+DwbVgAhSFfhZpu0uVBWFRBFhlyr7NqU1bbxKl1z/H4UE4
 aTQrp+jajh0mCnsH8CIqNDg7aegBRdbhH6RCkCS4DxseTzhxvjECNzfp2VlQOgAJlpfi
 +uQdkC8pS6xfGU5wiOJx6m5loPyY7Kod6LTMdP+wf3Li0aORhXNL3t+aIHmZBz+TNE7M
 l/mA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=MFOC5MSfgXpVUcpJFvepm9LoCBUyxU58dQ3kENmA2dU=;
 b=dYE0+kGanqNKbYF9P8HH+y5arsr3+r9L1NNdK3fbtvl8PKRij8fzBqw8QgMA2uqKcM
 nBs0D2HWeW5dOo2T+9hkdjMl1x3gQW6OK4cRpB0ht6hRDQXN2+I3vYrFbxKXY1580B0C
 OVop34/dn5auwE2GlL+syuI/+wK/+akIVNRwkyUZvT9x1k8wog7meAuuAGfDSIAkqK1b
 zOofkcEdwcJvYcWiCsSVt8AbQJfZEqIdIoTd9Bjt8bQJL7aj8591mVEBbbr+5ls1PkFl
 0Gw0bq2ydfhXV2kFOi6H7XUlIhddk4yKkoUtEKjNuIzagKYEbMSlkBDJOGqs6NUG+zK3
 QLTQ==
X-Gm-Message-State: AOAM533g/o2vfmuTdjDs7aWfyjSS1Z8sPj/beBpt9jy7qYYIZfl+4nZz
 FJ/DBDHmgigDxcNDEY+IPGm75iY3c4H/aCYKddg=
X-Google-Smtp-Source: ABdhPJzG7nn0LcryOMolANMp07rqbpB+dGxlfZixfoXAINNXhstjyOp90IJVHVwDvcF55dsz8L/CfOf3slRK9oAkKDo=
X-Received: by 2002:aca:518b:: with SMTP id f133mr920277oib.23.1603176256498; 
 Mon, 19 Oct 2020 23:44:16 -0700 (PDT)
MIME-Version: 1.0
References: <1602034966-3524-1-git-send-email-gene.chen.richtek@gmail.com>
 <1602034966-3524-3-git-send-email-gene.chen.richtek@gmail.com>
 <5a9b31c4-739c-06fc-2015-ed474993ad22@gmail.com>
In-Reply-To: <5a9b31c4-739c-06fc-2015-ed474993ad22@gmail.com>
From: Gene Chen <gene.chen.richtek@gmail.com>
Date: Tue, 20 Oct 2020 14:44:04 +0800
Message-ID: <CAE+NS35Y41mFKNhj+54BeeSYFu2J9BtvMWOxyMcf9a==39cbdA@mail.gmail.com>
Subject: Re: [PATCH v5 2/2] leds: mt6360: Add LED driver for MT6360
To: Jacek Anaszewski <jacek.anaszewski@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201020_024419_986197_DCA2C108 
X-CRM114-Status: GOOD (  22.91  )
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
Cc: linux-arm Mailing List <linux-arm-kernel@lists.infradead.org>,
 devicetree <devicetree@vger.kernel.org>, cy_huang@richtek.com,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Gene Chen <gene_chen@richtek.com>, benjamin.chao@mediatek.com,
 Rob Herring <robh+dt@kernel.org>,
 "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>,
 Dan Murphy <dmurphy@ti.com>, Pavel Machek <pavel@ucw.cz>,
 Matthias Brugger <matthias.bgg@gmail.com>, Wilma.Wu@mediatek.com,
 Linux LED Subsystem <linux-leds@vger.kernel.org>, shufan_lee@richtek.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

SmFjZWsgQW5hc3pld3NraSA8amFjZWsuYW5hc3pld3NraUBnbWFpbC5jb20+IOaWvCAyMDIw5bm0
MTDmnIg55pelIOmAseS6lCDkuIrljYg1OjUx5a+r6YGT77yaCj4KPiBIaSBHZW5lLAo+Cj4gT24g
MTAvNy8yMCAzOjQyIEFNLCBHZW5lIENoZW4gd3JvdGU6Cj4gPiBGcm9tOiBHZW5lIENoZW4gPGdl
bmVfY2hlbkByaWNodGVrLmNvbT4KPiA+Cj4gPiBBZGQgTVQ2MzYwIExFRCBkcml2ZXIgaW5jbHVk
ZSAyLWNoYW5uZWwgRmxhc2ggTEVEIHdpdGggdG9yY2gvc3Ryb2JlIG1vZGUsCj4gPiAzLWNoYW5u
ZWwgUkdCIExFRCBzdXBwb3J0IFJlZ2lzdGVyL0ZsYXNoL0JyZWF0aCBNb2RlLCBhbmQgMS1jaGFu
bmVsIGZvcgo+ID4gbW9vbmxpZ2h0IExFRC4KPiA+Cj4gPiBTaWduZWQtb2ZmLWJ5OiBHZW5lIENo
ZW4gPGdlbmVfY2hlbkByaWNodGVrLmNvbT4KPiA+IC0tLQo+ID4gICBkcml2ZXJzL2xlZHMvS2Nv
bmZpZyAgICAgICB8ICAxMiArCj4gPiAgIGRyaXZlcnMvbGVkcy9NYWtlZmlsZSAgICAgIHwgICAx
ICsKPiA+ICAgZHJpdmVycy9sZWRzL2xlZHMtbXQ2MzYwLmMgfCA3ODMgKysrKysrKysrKysrKysr
KysrKysrKysrKysrKysrKysrKysrKysrKysrKysrCj4gPiAgIDMgZmlsZXMgY2hhbmdlZCwgNzk2
IGluc2VydGlvbnMoKykKPiA+ICAgY3JlYXRlIG1vZGUgMTAwNjQ0IGRyaXZlcnMvbGVkcy9sZWRz
LW10NjM2MC5jCj4gPgo+ID4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvbGVkcy9LY29uZmlnIGIvZHJp
dmVycy9sZWRzL0tjb25maWcKPiA+IGluZGV4IDFjMTgxZGYuLmM3MTkyZGQgMTAwNjQ0Cj4gPiAt
LS0gYS9kcml2ZXJzL2xlZHMvS2NvbmZpZwo+ID4gKysrIGIvZHJpdmVycy9sZWRzL0tjb25maWcK
PiA+IEBAIC0yNzEsNiArMjcxLDE4IEBAIGNvbmZpZyBMRURTX01UNjMyMwo+ID4gICAgICAgICBU
aGlzIG9wdGlvbiBlbmFibGVzIHN1cHBvcnQgZm9yIG9uLWNoaXAgTEVEIGRyaXZlcnMgZm91bmQg
b24KPiA+ICAgICAgICAgTWVkaWF0ZWsgTVQ2MzIzIFBNSUMuCj4gPgo+ID4gK2NvbmZpZyBMRURT
X01UNjM2MAo+ID4gKyAgICAgdHJpc3RhdGUgIkxFRCBTdXBwb3J0IGZvciBNZWRpYXRlayBNVDYz
NjAgUE1JQyIKPiA+ICsgICAgIGRlcGVuZHMgb24gTEVEU19DTEFTU19GTEFTSCAmJiBPRgo+ID4g
KyAgICAgZGVwZW5kcyBvbiBMRURTX0NMQVNTX01VTFRJQ09MT1IKPgo+IFNpbmNlIENPTkZJR19M
RURfQ0xBU1NfTVVMVElDT0xPUiBjYW4gYmUgdHVybmVkIG9mZiB5b3UgbmVlZCB0byBoYXZlCj4g
YmVsb3cgaW5zdGVhZDoKPgo+IGRlcGVuZHMgb24gTEVEU19DTEFTU19NVUxUSUNPTE9SIHx8ICEh
TEVEU19DTEFTU19NVUxUSUNPTE9SCj4KPiBVbmxlc3MgeW91IHdhbnQgdG8gcHJldmVudCBlbmFi
bGluZyB0aGUgZHJpdmVyIHdpdGhvdXQgUkdCIExFRCwKPiBidXQgdGhhdCBkb2VzIG5vdCBzZWVt
IHRvIGJlIHJlYXNvbmFibGUgYXQgZmlyc3QgZ2xhbmNlLgo+CgpNYXkgSSBjaGFuZ2UgdG8gInNl
bGVjdCBMRURTX0NMQVNTX01VTFRJQ09MT1IiPwpJIHN1cHBvc2UgUkdCIGFsd2F5cyB1c2UgbXVs
dGljb2xvciBtb2RlLgoKPiA+ICsgICAgIGRlcGVuZHMgb24gVjRMMl9GTEFTSF9MRURfQ0xBU1Mg
fHwgIVY0TDJfRkxBU0hfTEVEX0NMQVNTCj4gPiArICAgICBkZXBlbmRzIG9uIE1GRF9NVDYzNjAK
PiA+ICsgICAgIGhlbHAKPiA+ICsgICAgICAgVGhpcyBvcHRpb24gZW5hYmxlcyBzdXBwb3J0IGZv
ciBkdWFsIEZsYXNoIExFRCBkcml2ZXJzIGZvdW5kIG9uCj4gPiArICAgICAgIE1lZGlhdGVrIE1U
NjM2MCBQTUlDLgo+ID4gKyAgICAgICBJbmRlcGVuZGVudCBjdXJyZW50IHNvdXJjZXMgc3VwcGx5
IGZvciBlYWNoIGZsYXNoIExFRCBzdXBwb3J0IHRvcmNoCj4gPiArICAgICAgIGFuZCBzdHJvYmUg
bW9kZS4KPiA+ICsKPgo+IC0tCj4gQmVzdCByZWdhcmRzLAo+IEphY2VrIEFuYXN6ZXdza2kKCl9f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkxpbnV4LW1lZGlh
dGVrIG1haWxpbmcgbGlzdApMaW51eC1tZWRpYXRla0BsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6
Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtbWVkaWF0ZWsK
