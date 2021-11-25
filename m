Return-Path: <linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DF602C433EF
	for <linux-mediatek@archiver.kernel.org>; Thu, 25 Nov 2021 06:24:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=P7J4PWqIG5GeoCn0tqtnLDcXnatgBvOV72aFMbnBL7o=; b=YyyvpKm+ovhc7f
	Y/Ug6QRMAVuQczBA6tsO6ljtHEG6FoFXW9KGP1M327sDL50UNr8Nf+FvK7LnynQMHKo2GK6AFV2QT
	Eeb5aL/uoNv62Ts9Ty/2nRVfN92ibeUViAABIKqS8AQM2xPXK/mWPZs8JfQvFwifwAR4I1SUoF0jV
	xfZXnZapjz2/dsQqLf1JfCKERBXMI9TdhNLaXx4pgsEYfxEHWKL2+CQxQGciOh1b5s2aORqJv9WfA
	Iko4ObT/fvX1qQkO2n/b3mMpHsUi+TdOmvJLVp0BYpROM3KCOMV/XXCcKnVCPbinjjZYiq4J1PyUh
	PW0aavAJCYhaCD5uX6FA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mq8An-006UqT-Us; Thu, 25 Nov 2021 06:23:57 +0000
Received: from mail-pf1-x432.google.com ([2607:f8b0:4864:20::432])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mq8Al-006UpK-7O
 for linux-mediatek@lists.infradead.org; Thu, 25 Nov 2021 06:23:56 +0000
Received: by mail-pf1-x432.google.com with SMTP id x131so4920708pfc.12
 for <linux-mediatek@lists.infradead.org>; Wed, 24 Nov 2021 22:23:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20210112;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:content-transfer-encoding:in-reply-to;
 bh=kioAbeV26jtOfLhbsus8RZ8a8iejlIcHXqYXJ7To1Ns=;
 b=eBkXht65eaQyuRQDrrqCwhAyWn3xzgvUxbldnoSVNCmLIw5i7yhixiswI7oX6tDXIn
 e5VxmyxOwzGNfTqxQYytEWv+s4+GcFrVweqtrK/1Z76qFlfXaq0g925E6SR3StK2J+j/
 FB6zzBJ6IP07wKtdatpdYqJS0QNNQqTErPT+Rp5noIa2gs3eZInhIbe12dJwHI5EXaKm
 jSfsYO10l/rSZmurWnXJb9C9AaQW9o1SviDRMUk6PXZlVVZFipwQ4uji1PKMVUw3Mc3z
 +AoumEWKC9YLtfDNGAhWOeSfQxHNMpo4Zl1Ws3XBY3FvKe9zAODqAohbXMerXt0Q3aSe
 WXtw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=kioAbeV26jtOfLhbsus8RZ8a8iejlIcHXqYXJ7To1Ns=;
 b=AOOJLCINfeBpE/JLlsPWTEc/UqzG83IcXKWONrqd+NmEFq7lcvncsaQNmhmALK9LGH
 oKizAYWWRCcJX5ijPaZp5kr6Vc6s6g7I91nOEE7RxH9RpuQRKDKoc16W0YyJtHV0SNim
 3nWEU1b6zmeiKwk7N7sLAFSYcY33ivLPDIzR021aW1Ghlwwe2MMBpcVnZunbYfnFGwGb
 q4nWImkUL14vdVRxwuA34MQtU1I6dG5Jundi+t+PCEl5WsQ/YFXcYiRSm70+s6M1HthI
 A0nggAuLLqey+3jcmVIG4/EaFEDmVwSbqitNq45DYaXtXP1lCbXMbEF0d8+QFwxAZ4BO
 iMXg==
X-Gm-Message-State: AOAM532QB7X/yN54vh39WVjjN9myDrrTgvzWLRoGEyWKZe5+AZLBmblt
 /YmodgPtP/TWSxjwoLwjH8Atbw==
X-Google-Smtp-Source: ABdhPJzZmfrw/Y/XnG3KSGm70RCpboamkYNWMx5n6NPi3BL1desf895RZ7uwO1XPBwJ0K0TV+4KGoQ==
X-Received: by 2002:a63:481e:: with SMTP id v30mr13663106pga.33.1637821433350; 
 Wed, 24 Nov 2021 22:23:53 -0800 (PST)
Received: from google.com ([2401:fa00:1:10:cd6a:1959:1c65:cc19])
 by smtp.gmail.com with ESMTPSA id u11sm1800235pfk.152.2021.11.24.22.23.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 24 Nov 2021 22:23:53 -0800 (PST)
Date: Thu, 25 Nov 2021 14:23:48 +0800
From: Tzung-Bi Shih <tzungbi@google.com>
To: "allen-kh.cheng" <allen-kh.cheng@mediatek.com>
Cc: Jassi Brar <jassisinghbrar@gmail.com>, Rob Herring <robh+dt@kernel.org>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 Linux-ALSA <alsa-devel@alsa-project.org>,
 Kai Vehmanen <kai.vehmanen@linux.intel.com>,
 Liam Girdwood <lgirdwood@gmail.com>,
 "cujomalainey@google.com" <cujomalainey@google.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Takashi Iwai <tiwai@suse.com>,
 Ranjani Sridharan <ranjani.sridharan@linux.intel.com>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
 Project_Global_Chrome_Upstream_Group
 <Project_Global_Chrome_Upstream_Group@mediatek.com>, 
 Mark Brown <broonie@kernel.org>,
 "linux-mediatek@lists.infradead.org" <linux-mediatek@lists.infradead.org>,
 Daniel Baluta <daniel.baluta@nxp.com>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, 
 "sound-open-firmware@alsa-project.org" <sound-open-firmware@alsa-project.org>
Subject: Re: [PATCH v3 2/3] mailbox: mediatek: add support for adsp mailbox
 controller
Message-ID: <YZ8r9GvUFqkGCqSz@google.com>
References: <20211124084514.28002-1-allen-kh.cheng@mediatek.com>
 <20211124084514.28002-3-allen-kh.cheng@mediatek.com>
 <YZ4TCYmvegnC/kR0@google.com>
 <f3642bcd031fbfd461b5efae1eba4816cc4856b2.camel@mediatek.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <f3642bcd031fbfd461b5efae1eba4816cc4856b2.camel@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211124_222355_307146_5A0FF615 
X-CRM114-Status: GOOD (  22.01  )
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

T24gVGh1LCBOb3YgMjUsIDIwMjEgYXQgMDk6NTE6MjdBTSArMDgwMCwgYWxsZW4ta2guY2hlbmcg
d3JvdGU6Cj4gT24gV2VkLCAyMDIxLTExLTI0IGF0IDE4OjI1ICswODAwLCBUenVuZy1CaSBTaGlo
IHdyb3RlOgo+ID4gPiBPbiBXZWQsIE5vdiAyNCwgMjAyMSBhdCAwNDo0NToxM1BNICswODAwLCBh
bGxlbi1raC5jaGVuZyB3cm90ZToKPiA+ID4gPiA+ICtzdGF0aWMgaW50IG10a19hZHNwX21ib3hf
c2VuZF9kYXRhKHN0cnVjdCBtYm94X2NoYW4gKmNoYW4sCj4gPiA+IHZvaWQKPiA+ID4gPiA+ICpk
YXRhKQo+ID4gPiA+ID4gK3sKPiA+ID4gPiA+ICsgIHN0cnVjdCBhZHNwX21ib3hfY2hfaW5mbyAq
Y2hfaW5mbyA9IGNoYW4tPmNvbl9wcml2Owo+ID4gPiA+ID4gKyAgdm9pZCBfX2lvbWVtICpyZWcg
PSBjaF9pbmZvLT52YV9yZWc7Cj4gPiA+ID4gPiArCj4gPiA+ID4gPiArICBzcGluX2xvY2soJmNo
X2luZm8tPmxvY2spOwo+ID4gPiA+ID4gKyAgd3JpdGVsKGNoX2luZm8tPmlwY19vcF92YWwsIHJl
ZyArIE1US19BRFNQX01CT1hfSU5fQ01EKTsKPiA+ID4gPiA+ICsgIHNwaW5fdW5sb2NrKCZjaF9p
bmZvLT5sb2NrKTsKPiA+IAo+ID4gPgo+ID4gPiBXaHkgZG9lcyBpdCBuZWVkIHRoZSBsb2NrPwo+
ID4gPgo+ID4gPiBJcyB0aGUgd3JpdGUgdG8gTVRLX0FEU1BfTUJPWF9JTl9DTUQgYSBzeW5jaHJv
bm91cyBvcGVyYXRpb24/Cj4gPiA+IC0gSWYgeWVzLCBJIGZhaWxlZCB0byB1bmRlcnN0YW5kIHdo
eSBkb2VzIGl0IG5lZWQgdGhlIGxvY2suICBFdmVyeQo+ID4gPiBjYWxscyB0byBtdGtfYWRzcF9t
Ym94X3NlbmRfZGF0YSgpIHNob3VsZCB3YWl0IGZvciB0aGUgZGF0YQo+ID4gdHJhbnNmZXIKPiA+
ID4gY29tcGxldGlvbi4KPiA+ID4gLSBJZiBubywgSSBhbHNvIGZhaWxlZCB0byB1bmRlcnN0YW5k
Cj4gPiB3aHkuICBtdGtfYWRzcF9tYm94X3NlbmRfZGF0YSgpCj4gPiA+IGhhcyBubyB3YXkgdG8g
YmUgYXdhcmUgb2YgdGhlIHRyYW5zZmVyIGNvbXBsZXRpb24uICBXb3VsZCBleHBlY3QgYQo+ID4g
PiBsb29wIGZvciBjaGVja2luZyB0aGUgY29tcGxldGlvbiBmb3IgdGhlIGNhc2UuCj4gPiA+Cj4g
PiAgCj4gCj4gSW4gQURTUCBNQk9YIElQQyBmbG93LAo+ICAKPiBIb3N0IHdvdWxkIGNhbGwgbWJv
eCBzZW5kIGRhdGEgd2hlbiB0aGUgc2hhcmVkIGRhdGEgdHJhbnNmZXIgY29tcGxldGVkLgo+ICAK
PiAobXRrX2Fkc3BfbWJveF9zZW5kX2RhdGEgd2lsbCBub3RpY2UgY2xpZW50IHVzaW5nIE1US19B
RFNQX01CT1hfSU5fQ01EKQo+ICAKPiBJdOKAmXMgbW9yZSBsaWtlIGEgc2lnbmFsLgo+ICAKPiBJ
biBnZW5lcmFsIGNhc2UsCj4gIAo+IFRoZXJlIG1heSBiZSBzb21lIGhvc3RzIHVzZSB0aGUgc2Ft
ZSBtYm94IGNoYW5uZWwuCj4gIAo+IEkgdGhpbmsgaXTigJlzIGJldHRlciB1c2luZyBsb2NrIHRv
IHByb3RlY3QgYWNjZXNzIHRvCj4gTVRLX0FEU1BfTUJPWF9JTl9DTUQgcmVnaXN0ZXJzCgpJIHN0
aWxsIGZhaWxlZCB0byB1bmRlcnN0YW5kLiAgV2hhdCBpZiAyIGhvc3RzIG5vdGlmeSB0aGUgc2Ft
ZSBjbGllbnQgYnkgd3JpdGluZyBNVEtfQURTUF9NQk9YX0lOX0NNRCBhdCB0aGUgc2FtZSB0aW1l
PwoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTGludXgt
bWVkaWF0ZWsgbWFpbGluZyBsaXN0CkxpbnV4LW1lZGlhdGVrQGxpc3RzLmluZnJhZGVhZC5vcmcK
aHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1tZWRpYXRl
awo=
