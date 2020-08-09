Return-Path: <SRS0=12Pn=BT=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0B5B0C433E0
	for <linux-mediatek@archiver.kernel.org>; Sun,  9 Aug 2020 01:09:11 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id CC4632067D
	for <linux-mediatek@archiver.kernel.org>; Sun,  9 Aug 2020 01:09:10 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="JBZMfhlg";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="j3ycVpAK"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org CC4632067D
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=21M1bLc6zxK80ZjAlfWBdSz+Za8FMOoAQA1xpGt9YPo=; b=JBZMfhlguQVQTfq+Z+QqiiKvQ
	ddQAzs1xszM3mSycOq72BwrqYA5JkZ3PWadM3eL+fbsFFyUd0D35Lyt98vL6iLCsvXBrSznF9nmIz
	bWdGUSUxIxiQHh37JZ4tJmbGLdIgMWZz8EDNMwIwwF4DJoJrgAvjzfCCk5y06jqFi05rrF6xQ7QZM
	D/q3jpDwBIuDLl5+uVB6nYmeqM169NGs//45YnNGZMn6jNUvTSwNWnAZxnTaop+OyclRvDnsrzcSM
	LJwrm1l1gy9V3MT0UKSHeU4Q5W96eBxuT/sIplo9QKpN01BztIHLdkzTYE3BweKPpmyXC4hd/Ubsv
	tY+b4ngzQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1k4Zpe-00013X-Cy; Sun, 09 Aug 2020 01:09:02 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1k4Zpa-00012m-Df; Sun, 09 Aug 2020 01:08:59 +0000
Received: from mail-ej1-f42.google.com (mail-ej1-f42.google.com
 [209.85.218.42])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 524F220772;
 Sun,  9 Aug 2020 01:08:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1596935337;
 bh=eqq7sVY8BRS8obJcxE/XbjiiZrd9saTF1MqNPfw36BM=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=j3ycVpAK+U2RAxmk8LW1Cm4sWW/Dd9s3TyWPyq4VS0zdIUaZ+FtAwQ/ut5Dbvd46Z
 4SicMmRxX+ahR9u5GQPPSWj1yVQ8LO8U/aVZjPpSb7EEViz9zYf1wHawG+9T0TFvEm
 eBZgQjGig5PXmey8AKQwA+Etvnivf2RmrKLM3hBA=
Received: by mail-ej1-f42.google.com with SMTP id o23so5915864ejr.1;
 Sat, 08 Aug 2020 18:08:57 -0700 (PDT)
X-Gm-Message-State: AOAM5332AikTC/0IhUozRcxuOBzzc4zphzhMNIPb6xXk3N5EdU4FUOVo
 bDWbLsLDkNvQAETvT94u8eJ33lQZbUIrIbdNQA==
X-Google-Smtp-Source: ABdhPJyt5U/LEKGnmkq7BQqREwAcqBg7M1Dqq6mXYt8dTYgXNNhPV/x47So5Wr70sZ5dRyMB8d2S5BnxaVfn+mAciEA=
X-Received: by 2002:a17:906:7492:: with SMTP id
 e18mr15505191ejl.375.1596935335797; 
 Sat, 08 Aug 2020 18:08:55 -0700 (PDT)
MIME-Version: 1.0
References: <1596855231-5782-1-git-send-email-yongqiang.niu@mediatek.com>
 <1596855231-5782-2-git-send-email-yongqiang.niu@mediatek.com>
 <CAAOTY_9myENG+APAhC6MANHn3bqGZ-jtq08v4pTWCq2v9DDjNA@mail.gmail.com>
In-Reply-To: <CAAOTY_9myENG+APAhC6MANHn3bqGZ-jtq08v4pTWCq2v9DDjNA@mail.gmail.com>
From: Chun-Kuang Hu <chunkuang.hu@kernel.org>
Date: Sun, 9 Aug 2020 09:08:44 +0800
X-Gmail-Original-Message-ID: <CAAOTY__b8h9FaqaeBb0Ewf9m0t8qVBzwgrF3n1RynR7+BAFGwg@mail.gmail.com>
Message-ID: <CAAOTY__b8h9FaqaeBb0Ewf9m0t8qVBzwgrF3n1RynR7+BAFGwg@mail.gmail.com>
Subject: Re: [RESEND v7, PATCH 1/7] dt-bindings: mediatek: add rdma_fifo_size
 description for mt8183 display
To: Chun-Kuang Hu <chunkuang.hu@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200808_210858_685404_0C4A919A 
X-CRM114-Status: GOOD (  22.50  )
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
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org,
 Yongqiang Niu <yongqiang.niu@mediatek.com>, David Airlie <airlied@linux.ie>,
 linux-kernel <linux-kernel@vger.kernel.org>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 Matthias Brugger <matthias.bgg@gmail.com>, Rob Herring <robh+dt@kernel.org>,
 "moderated list:ARM/Mediatek SoC support" <linux-mediatek@lists.infradead.org>,
 Philipp Zabel <p.zabel@pengutronix.de>, CK Hu <ck.hu@mediatek.com>,
 Daniel Vetter <daniel@ffwll.ch>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "Linux-mediatek" <linux-mediatek-bounces@lists.infradead.org>
Errors-To: linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org

SGksIFlvbmdxaWFuZzoKCkNodW4tS3VhbmcgSHUgPGNodW5rdWFuZy5odUBrZXJuZWwub3JnPiDm
lrwgMjAyMOW5tDjmnIg55pelIOmAseaXpSDkuIrljYg4OjU25a+r6YGT77yaCj4KPiBIaSwgWW9u
Z3FpYW5nOgo+Cj4gWW9uZ3FpYW5nIE5pdSA8eW9uZ3FpYW5nLm5pdUBtZWRpYXRlay5jb20+IOaW
vCAyMDIw5bm0OOaciDjml6Ug6YCx5YWtIOS4iuWNiDExOjA05a+r6YGT77yaCj4gPgo+ID4gcmRt
YSBmaWZvIHNpemUgbWF5IGJlIGRpZmZlcmVudCBldmVuIGluIHNhbWUgU09DLCBhZGQgdGhpcwo+
ID4gcHJvcGVydHkgdG8gdGhlIGNvcnJlc3BvbmRpbmcgcmRtYQo+ID4KPiA+IENoYW5nZS1JZDog
STY3NjM1ZWM3ZjNmNTljZjRjYmM3NzM3Mjg1ZTVlMjhmZjBhYjcxYzkKPgo+IFJlbW92ZSBjaGFu
Z2UtaWQuCj4KPiA+IFNpZ25lZC1vZmYtYnk6IFlvbmdxaWFuZyBOaXUgPHlvbmdxaWFuZy5uaXVA
bWVkaWF0ZWsuY29tPgo+ID4gLS0tCj4gPiAgLi4uL2RldmljZXRyZWUvYmluZGluZ3MvZGlzcGxh
eS9tZWRpYXRlay9tZWRpYXRlayxkaXNwLnR4dCB8IDE0ICsrKysrKysrKysrKysrCj4gPiAgMSBm
aWxlIGNoYW5nZWQsIDE0IGluc2VydGlvbnMoKykKPiA+Cj4gPiBkaWZmIC0tZ2l0IGEvRG9jdW1l
bnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL2Rpc3BsYXkvbWVkaWF0ZWsvbWVkaWF0ZWssZGlz
cC50eHQgYi9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvZGlzcGxheS9tZWRpYXRl
ay9tZWRpYXRlayxkaXNwLnR4dAo+ID4gaW5kZXggYjkxZTcwOS4uZTZiYmUzMiAxMDA2NDQKPiA+
IC0tLSBhL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9kaXNwbGF5L21lZGlhdGVr
L21lZGlhdGVrLGRpc3AudHh0Cj4gPiArKysgYi9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmlu
ZGluZ3MvZGlzcGxheS9tZWRpYXRlay9tZWRpYXRlayxkaXNwLnR4dAo+ID4gQEAgLTY2LDYgKzY2
LDExIEBAIFJlcXVpcmVkIHByb3BlcnRpZXMgKERNQSBmdW5jdGlvbiBibG9ja3MpOgo+ID4gICAg
YXJndW1lbnQsIHNlZSBEb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvaW9tbXUvbWVk
aWF0ZWssaW9tbXUudHh0Cj4gPiAgICBmb3IgZGV0YWlscy4KPiA+Cj4gPiArT3B0aW9uYWwgcHJv
cGVydGllcyAoUkRNQSBmdW5jdGlvbiBibG9ja3MpOgo+ID4gKy0gbWVkaWF0ZWsscmRtYV9maWZv
X3NpemU6IHJkbWEgZmlmbyBzaXplIG1heSBiZSBkaWZmZXJlbnQgZXZlbiBpbiBzYW1lIFNPQywg
YWRkIHRoaXMKPiA+ICsgIHByb3BlcnR5IHRvIHRoZSBjb3JyZXNwb25kaW5nIHJkbWEKPiA+ICsg
IHRoZSB2YWx1ZSBpcyB0aGUgTWF4IHZhbHVlIHdoaWNoIGRlZmluZWQgaW4gaGFyZHdhcmUgZGF0
YSBzaGVldC4KPiA+ICsKPiA+ICBFeGFtcGxlczoKPiA+Cj4gPiAgbW1zeXM6IGNsb2NrLWNvbnRy
b2xsZXJAMTQwMDAwMDAgewo+ID4gQEAgLTIwNywzICsyMTIsMTIgQEAgb2RAMTQwMjMwMDAgewo+
ID4gICAgICAgICBwb3dlci1kb21haW5zID0gPCZzY3BzeXMgTVQ4MTczX1BPV0VSX0RPTUFJTl9N
TT47Cj4gPiAgICAgICAgIGNsb2NrcyA9IDwmbW1zeXMgQ0xLX01NX0RJU1BfT0Q+Owo+ID4gIH07
Cj4gPiArCj4gPiArcmRtYTE6IHJkbWFAMTQwMGMwMDAgewo+ID4gKyAgICAgICBjb21wYXRpYmxl
ID0gIm1lZGlhdGVrLG10ODE4My1kaXNwLXJkbWEiOwo+ID4gKyAgICAgICByZWcgPSA8MCAweDE0
MDBjMDAwIDAgMHgxMDAwPjsKPiA+ICsgICAgICAgaW50ZXJydXB0cyA9IDxHSUNfU1BJIDIyOSBJ
UlFfVFlQRV9MRVZFTF9MT1c+Owo+ID4gKyAgICAgICBwb3dlci1kb21haW5zID0gPCZzY3BzeXMg
TVQ4MTgzX1BPV0VSX0RPTUFJTl9ESVNQPjsKPiA+ICsgICAgICAgY2xvY2tzID0gPCZtbXN5cyBD
TEtfTU1fRElTUF9SRE1BMT47Cj4gPiArICAgICAgIG1lZGlhdGVrLHJkbWFfZmlmb19zaXplID0g
PDIwNDg+Owo+ID4gK307Cj4KPiBJIHdvdWxkIGxpa2UgeW91IHRvIHNob3cgcmRtYTAgYXMgd2Vs
bCBzbyB0aGF0IGNvdWxkIHByb3ZlIHR3byByZG1hCj4gaGF2ZSBkaWZmZXJlbnQgZmlmbyBzaXpl
IGluIHRoZSBzYW1lIFNvQy4KClNvcnJ5LCByZG1hMCBpcyBhbHJlYWR5IGRlZmluZSBpbiB0aGlz
IGZpbGUuIEp1c3QgaWdub3JlIHRoaXMgY29tbWVudC4KClJlZ2FyZHMsCkNodW4tS3VhbmcuCgo+
Cj4gUmVnYXJkcywKPiBDaHVuLUt1YW5nLgo+Cj4gPiAtLQo+ID4gMS44LjEuMS5kaXJ0eQo+ID4g
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KPiA+IExpbnV4
LW1lZGlhdGVrIG1haWxpbmcgbGlzdAo+ID4gTGludXgtbWVkaWF0ZWtAbGlzdHMuaW5mcmFkZWFk
Lm9yZwo+ID4gaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51
eC1tZWRpYXRlawoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X18KTGludXgtbWVkaWF0ZWsgbWFpbGluZyBsaXN0CkxpbnV4LW1lZGlhdGVrQGxpc3RzLmluZnJh
ZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51
eC1tZWRpYXRlawo=
