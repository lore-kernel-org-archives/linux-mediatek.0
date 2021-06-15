Return-Path: <SRS0=q7ss=LJ=lists.infradead.org=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7CDB1C48BDF
	for <linux-mediatek@archiver.kernel.org>; Tue, 15 Jun 2021 23:28:53 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3F5956128C
	for <linux-mediatek@archiver.kernel.org>; Tue, 15 Jun 2021 23:28:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 3F5956128C
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-mediatek-bounces+linux-mediatek=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=2I56hzjy5Pnj7qjJAlK4Bp7KQgAqoatCzY/fydBTUkA=; b=XKAq2ELUMfuSzZ
	SR1NcqQE/gIRSXSkB+IijbEbOuhu/mpP7IU2VdNao2vi9KUNIFmWw80FvIlQZmtG/Oh7qC1440SDk
	enwQdH/jbTt9lGbZxafb6fg6uhxv/uWkF7MTpM0T2Hvxoe7ZpT2I92PC0Y3WQxDc71eNTcKZbBgP5
	ZQrG4Hg1/0xj+bPj+3HzqzFi6Wf1YQ6y+KyNQtkuBZma/X3PFHaV7LETk6RjpU3MhwG6HnKYqex3b
	LYtJWtspqZE9Gi6Ct7jYWCLoE7816LV38q1Mb0V0Qqp2ucZ1hnW2yON8vlPojpfKyHvzJufmO3sVC
	u7t68EcbC3fKB8W1ZS5g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ltIU2-003rZo-IA; Tue, 15 Jun 2021 23:28:38 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1ltI87-003lRr-MT; Tue, 15 Jun 2021 23:06:01 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id 3B5986128C;
 Tue, 15 Jun 2021 23:05:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1623798359;
 bh=gX2OAJ87Zhj6xcJSH+HSb/c9JiEnHEpm9jh8ZOCi7GE=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=GYVRp0Z6E37g7ELIe7G+wNKp6tynscouCV1P20M8FAHBu5VtK1bhTuQZ0MNScOBy/
 99s1+g4jjndvez16c5jL0LPvCqF6X0UNpKJR24uI2GjvgxTgdRX62oKPCsSYdaWJpM
 tfT9DslNk/fYbSwpeXR2v9o+Y7oyx7mM1YUuX78/jOw6epRJTsZ4+6o0kTlCcT3NCY
 BPj4yYseDb7W10wZ8GouJFeqf7siOXm42cSIJ4n2RrnF3ZfGhHGhrufyNreny97Y6c
 Z0knBUlaqvaQhO4eFdYCz6PRpDa6IEFcBEpEQxcthBbkZZLj2bXbMobitZobmV+bdo
 DmUf7Ci1pKx3Q==
Received: by mail-ej1-f46.google.com with SMTP id hq2so473885ejc.2;
 Tue, 15 Jun 2021 16:05:59 -0700 (PDT)
X-Gm-Message-State: AOAM533LNi7RsUtr+PgohglBeYUvVI0dSz+WyZITQlIn+pt71eZMKbLw
 rY/8opbkfxHBZslMpsp1IMGS77O9vuVeddonqA==
X-Google-Smtp-Source: ABdhPJzpHvXx18Z/9Nse3ofyzq8kUd/ug4pWPECTHvAcqbbUlWOKZtUfGLRKqUtnaDY1vjPghEZEvjkVMh2l9+9oqSE=
X-Received: by 2002:a17:906:9419:: with SMTP id
 q25mr1926455ejx.341.1623798357795; 
 Tue, 15 Jun 2021 16:05:57 -0700 (PDT)
MIME-Version: 1.0
References: <1623690937-52389-1-git-send-email-zhouyanjie@wanyeetech.com>
 <1623690937-52389-2-git-send-email-zhouyanjie@wanyeetech.com>
In-Reply-To: <1623690937-52389-2-git-send-email-zhouyanjie@wanyeetech.com>
From: Rob Herring <robh+dt@kernel.org>
Date: Tue, 15 Jun 2021 17:05:45 -0600
X-Gmail-Original-Message-ID: <CAL_Jsq+7v6GRMfxWhA6g2r0GaZSO_AztgSz7rheJsE9jKYd8uQ@mail.gmail.com>
Message-ID: <CAL_Jsq+7v6GRMfxWhA6g2r0GaZSO_AztgSz7rheJsE9jKYd8uQ@mail.gmail.com>
Subject: Re: [PATCH v3 1/2] dt-bindings: dwmac: Add bindings for new Ingenic
 SoCs.
To: =?UTF-8?B?5ZGo55Cw5p2wIChaaG91IFlhbmppZSk=?= <zhouyanjie@wanyeetech.com>
Cc: David Miller <davem@davemloft.net>, Jakub Kicinski <kuba@kernel.org>, 
 Giuseppe CAVALLARO <peppe.cavallaro@st.com>,
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
 jun.jiang@ingenic.com, sernia.zhou@foxmail.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210615_160559_860299_5871C162 
X-CRM114-Status: GOOD (  18.09  )
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

T24gTW9uLCBKdW4gMTQsIDIwMjEgYXQgMTE6MTggQU0g5ZGo55Cw5p2wIChaaG91IFlhbmppZSkK
PHpob3V5YW5qaWVAd2FueWVldGVjaC5jb20+IHdyb3RlOgo+Cj4gQWRkIHRoZSBkd21hYyBiaW5k
aW5ncyBmb3IgdGhlIEpaNDc3NSBTb0MsIHRoZSBYMTAwMCBTb0MsCj4gdGhlIFgxNjAwIFNvQywg
dGhlIFgxODMwIFNvQyBhbmQgdGhlIFgyMDAwIFNvQyBmcm9tIEluZ2VuaWMuCj4KPiBTaWduZWQt
b2ZmLWJ5OiDlkajnkLDmnbAgKFpob3UgWWFuamllKSA8emhvdXlhbmppZUB3YW55ZWV0ZWNoLmNv
bT4KPiAtLS0KPgo+IE5vdGVzOgo+ICAgICB2MS0+djI6Cj4gICAgIE5vIGNoYW5nZS4KPgo+ICAg
ICB2Mi0+djM6Cj4gICAgIEFkZCAiaW5nZW5pYyxtYWMueWFtbCIgZm9yIEluZ2VuaWMgU29Dcy4K
Pgo+ICAuLi4vZGV2aWNldHJlZS9iaW5kaW5ncy9uZXQvaW5nZW5pYyxtYWMueWFtbCAgICAgICB8
IDc2ICsrKysrKysrKysrKysrKysrKysrKysKPiAgLi4uL2RldmljZXRyZWUvYmluZGluZ3MvbmV0
L3NucHMsZHdtYWMueWFtbCAgICAgICAgfCAxNSArKysrKwo+ICAyIGZpbGVzIGNoYW5nZWQsIDkx
IGluc2VydGlvbnMoKykKPiAgY3JlYXRlIG1vZGUgMTAwNjQ0IERvY3VtZW50YXRpb24vZGV2aWNl
dHJlZS9iaW5kaW5ncy9uZXQvaW5nZW5pYyxtYWMueWFtbAo+Cj4gZGlmZiAtLWdpdCBhL0RvY3Vt
ZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9uZXQvaW5nZW5pYyxtYWMueWFtbCBiL0RvY3Vt
ZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9uZXQvaW5nZW5pYyxtYWMueWFtbAo+IG5ldyBm
aWxlIG1vZGUgMTAwNjQ0Cj4gaW5kZXggMDAwMDAwMDAuLjVmZTJlODEKPiAtLS0gL2Rldi9udWxs
Cj4gKysrIGIvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL25ldC9pbmdlbmljLG1h
Yy55YW1sCj4gQEAgLTAsMCArMSw3NiBAQAo+ICsjIFNQRFgtTGljZW5zZS1JZGVudGlmaWVyOiAo
R1BMLTIuMC1vbmx5IE9SIEJTRC0yLUNsYXVzZSkKPiArJVlBTUwgMS4yCj4gKy0tLQo+ICskaWQ6
IGh0dHA6Ly9kZXZpY2V0cmVlLm9yZy9zY2hlbWFzL25ldC9pbmdlbmljLG1hYy55YW1sIwo+ICsk
c2NoZW1hOiBodHRwOi8vZGV2aWNldHJlZS5vcmcvbWV0YS1zY2hlbWFzL2NvcmUueWFtbCMKPiAr
Cj4gK3RpdGxlOiBCaW5kaW5ncyBmb3IgTUFDIGluIEluZ2VuaWMgU29Dcwo+ICsKPiArbWFpbnRh
aW5lcnM6Cj4gKyAgLSDlkajnkLDmnbAgKFpob3UgWWFuamllKSA8emhvdXlhbmppZUB3YW55ZWV0
ZWNoLmNvbT4KPiArCj4gK2Rlc2NyaXB0aW9uOgo+ICsgIFRoZSBFdGhlcm5ldCBNZWRpYSBBY2Nl
c3MgQ29udHJvbGxlciBpbiBJbmdlbmljIFNvQ3MuCj4gKwo+ICtwcm9wZXJ0aWVzOgo+ICsgIGNv
bXBhdGlibGU6Cj4gKyAgICBlbnVtOgo+ICsgICAgICAtIGluZ2VuaWMsano0Nzc1LW1hYwo+ICsg
ICAgICAtIGluZ2VuaWMseDEwMDAtbWFjCj4gKyAgICAgIC0gaW5nZW5pYyx4MTYwMC1tYWMKPiAr
ICAgICAgLSBpbmdlbmljLHgxODMwLW1hYwo+ICsgICAgICAtIGluZ2VuaWMseDIwMDAtbWFjCj4g
Kwo+ICsgIHJlZzoKPiArICAgIG1heEl0ZW1zOiAxCj4gKwo+ICsgIGludGVycnVwdHM6Cj4gKyAg
ICBtYXhJdGVtczogMQo+ICsKPiArICBpbnRlcnJ1cHQtbmFtZXM6Cj4gKyAgICBjb25zdDogbWFj
aXJxCj4gKwo+ICsgIGNsb2NrczoKPiArICAgIG1heEl0ZW1zOiAxCj4gKwo+ICsgIGNsb2NrLW5h
bWVzOgo+ICsgICAgY29uc3Q6IHN0bW1hY2V0aAo+ICsKPiArICBtb2RlLXJlZzoKPiArICAgIGRl
c2NyaXB0aW9uOiBBbiBleHRyYSBzeXNjb24gcmVnaXN0ZXIgdGhhdCBjb250cm9sIGV0aGVybmV0
IGludGVyZmFjZSBhbmQgdGltaW5nIGRlbGF5CgpOZWVkcyBhIHZlbmRvciBwcmVmaXggYW5kIHR5
cGUuCgo+ICsKPiArICByeC1jbGstZGVsYXktcHM6Cj4gKyAgICBkZXNjcmlwdGlvbjogUkdNSUkg
cmVjZWl2ZSBjbG9jayBkZWxheSBkZWZpbmVkIGluIHBpY28gc2Vjb25kcwo+ICsKPiArICB0eC1j
bGstZGVsYXktcHM6Cj4gKyAgICBkZXNjcmlwdGlvbjogUkdNSUkgdHJhbnNtaXQgY2xvY2sgZGVs
YXkgZGVmaW5lZCBpbiBwaWNvIHNlY29uZHMKPiArCj4gK3JlcXVpcmVkOgo+ICsgIC0gY29tcGF0
aWJsZQo+ICsgIC0gcmVnCj4gKyAgLSBpbnRlcnJ1cHRzCj4gKyAgLSBpbnRlcnJ1cHQtbmFtZXMK
PiArICAtIGNsb2Nrcwo+ICsgIC0gY2xvY2stbmFtZXMKPiArICAtIG1vZGUtcmVnCj4gKwo+ICth
ZGRpdGlvbmFsUHJvcGVydGllczogZmFsc2UKPiArCj4gK2V4YW1wbGVzOgo+ICsgIC0gfAo+ICsg
ICAgI2luY2x1ZGUgPGR0LWJpbmRpbmdzL2Nsb2NrL3gxMDAwLWNndS5oPgo+ICsKPiArICAgIG1h
YzogZXRoZXJuZXRAMTM0YjAwMDAgewo+ICsgICAgICAgIGNvbXBhdGlibGUgPSAiaW5nZW5pYyx4
MTAwMC1tYWMiLCAic25wcyxkd21hYyI7CgpEb2Vzbid0IG1hdGNoIHRoZSBzY2hlbWEuCgo+ICsg
ICAgICAgIHJlZyA9IDwweDEzNGIwMDAwIDB4MjAwMD47Cj4gKwo+ICsgICAgICAgIGludGVycnVw
dC1wYXJlbnQgPSA8JmludGM+Owo+ICsgICAgICAgIGludGVycnVwdHMgPSA8NTU+Owo+ICsgICAg
ICAgIGludGVycnVwdC1uYW1lcyA9ICJtYWNpcnEiOwo+ICsKPiArICAgICAgICBjbG9ja3MgPSA8
JmNndSBYMTAwMF9DTEtfTUFDPjsKPiArICAgICAgICBjbG9jay1uYW1lcyA9ICJzdG1tYWNldGgi
Owo+ICsKPiArICAgICAgICBtb2RlLXJlZyA9IDwmbWFjX3BoeV9jdHJsPjsKPiArICAgIH07Cj4g
Ky4uLgo+IGRpZmYgLS1naXQgYS9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvbmV0
L3NucHMsZHdtYWMueWFtbCBiL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9uZXQv
c25wcyxkd21hYy55YW1sCj4gaW5kZXggMmVkZDhiZS4uOWMwY2U5MiAxMDA2NDQKPiAtLS0gYS9E
b2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvbmV0L3NucHMsZHdtYWMueWFtbAo+ICsr
KyBiL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9uZXQvc25wcyxkd21hYy55YW1s
Cj4gQEAgLTU2LDYgKzU2LDExIEBAIHByb3BlcnRpZXM6Cj4gICAgICAgICAgLSBhbWxvZ2ljLG1l
c29uOG0yLWR3bWFjCj4gICAgICAgICAgLSBhbWxvZ2ljLG1lc29uLWd4YmItZHdtYWMKPiAgICAg
ICAgICAtIGFtbG9naWMsbWVzb24tYXhnLWR3bWFjCj4gKyAgICAgICAgLSBpbmdlbmljLGp6NDc3
NS1tYWMKPiArICAgICAgICAtIGluZ2VuaWMseDEwMDAtbWFjCj4gKyAgICAgICAgLSBpbmdlbmlj
LHgxNjAwLW1hYwo+ICsgICAgICAgIC0gaW5nZW5pYyx4MTgzMC1tYWMKPiArICAgICAgICAtIGlu
Z2VuaWMseDIwMDAtbWFjCj4gICAgICAgICAgLSByb2NrY2hpcCxweDMwLWdtYWMKPiAgICAgICAg
ICAtIHJvY2tjaGlwLHJrMzEyOC1nbWFjCj4gICAgICAgICAgLSByb2NrY2hpcCxyazMyMjgtZ21h
Ywo+IEBAIC0zMTAsNiArMzE1LDExIEBAIGFsbE9mOgo+ICAgICAgICAgICAgICAgIC0gYWxsd2lu
bmVyLHN1bjhpLXI0MC1lbWFjCj4gICAgICAgICAgICAgICAgLSBhbGx3aW5uZXIsc3VuOGktdjNz
LWVtYWMKPiAgICAgICAgICAgICAgICAtIGFsbHdpbm5lcixzdW41MGktYTY0LWVtYWMKPiArICAg
ICAgICAgICAgICAtIGluZ2VuaWMsano0Nzc1LW1hYwo+ICsgICAgICAgICAgICAgIC0gaW5nZW5p
Yyx4MTAwMC1tYWMKPiArICAgICAgICAgICAgICAtIGluZ2VuaWMseDE2MDAtbWFjCj4gKyAgICAg
ICAgICAgICAgLSBpbmdlbmljLHgxODMwLW1hYwo+ICsgICAgICAgICAgICAgIC0gaW5nZW5pYyx4
MjAwMC1tYWMKPiAgICAgICAgICAgICAgICAtIHNucHMsZHd4Z21hYwo+ICAgICAgICAgICAgICAg
IC0gc25wcyxkd3hnbWFjLTIuMTAKPiAgICAgICAgICAgICAgICAtIHN0LHNwZWFyNjAwLWdtYWMK
PiBAQCAtMzUzLDYgKzM2MywxMSBAQCBhbGxPZjoKPiAgICAgICAgICAgICAgICAtIGFsbHdpbm5l
cixzdW44aS1yNDAtZW1hYwo+ICAgICAgICAgICAgICAgIC0gYWxsd2lubmVyLHN1bjhpLXYzcy1l
bWFjCj4gICAgICAgICAgICAgICAgLSBhbGx3aW5uZXIsc3VuNTBpLWE2NC1lbWFjCj4gKyAgICAg
ICAgICAgICAgLSBpbmdlbmljLGp6NDc3NS1tYWMKPiArICAgICAgICAgICAgICAtIGluZ2VuaWMs
eDEwMDAtbWFjCj4gKyAgICAgICAgICAgICAgLSBpbmdlbmljLHgxNjAwLW1hYwo+ICsgICAgICAg
ICAgICAgIC0gaW5nZW5pYyx4MTgzMC1tYWMKPiArICAgICAgICAgICAgICAtIGluZ2VuaWMseDIw
MDAtbWFjCj4gICAgICAgICAgICAgICAgLSBzbnBzLGR3bWFjLTQuMDAKPiAgICAgICAgICAgICAg
ICAtIHNucHMsZHdtYWMtNC4xMGEKPiAgICAgICAgICAgICAgICAtIHNucHMsZHdtYWMtNC4yMGEK
PiAtLQo+IDIuNy40Cj4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fCkxpbnV4LW1lZGlhdGVrIG1haWxpbmcgbGlzdApMaW51eC1tZWRpYXRla0BsaXN0cy5p
bmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8v
bGludXgtbWVkaWF0ZWsK
